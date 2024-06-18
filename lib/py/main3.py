from flask import Flask, request, jsonify
from PIL import Image
import pytesseract
from spellchecker import SpellChecker
import joblib
from side import *
import os

app = Flask(__name__)

# Load the saved model
model = joblib.load('model.joblib')

# Provided links for Physics topics


def handwriting_to_text(image_path):
    # Open the image file
    img = Image.open(image_path)

    # Perform OCR using Tesseract
    text = pytesseract.image_to_string(img)

    # Initialize SpellChecker
    spell = SpellChecker()

    # Split the text into words and correct spelling
    corrected_text = []
    words = text.split()
    for word in words:
        # Get the corrected word if misspelled, otherwise keep the original word
        corrected_word = spell.correction(word)
        if corrected_word is not None:
            corrected_text.append(corrected_word)
        else:
            corrected_text.append(word)

    # Join the corrected words back into a single string
    corrected_text = ' '.join(corrected_text)

    return corrected_text

@app.route('/predict', methods=['POST'])
def predict():
    # Check if an image file is present in the request
    if 'file' not in request.files:
        return jsonify({'error': 'No image file found'}), 400
    
    # Get the image file from the request
    image_file = request.files['file']

    # Save the image file temporarily
    temp_image_path = 'temp_img.jpg'
    image_file.save(temp_image_path)

    # Perform handwriting recognition on the input image
    text = handwriting_to_text(temp_image_path)

    # Make predictions using the loaded model
    custom_input = [text]
    custom_predictions_proba = model.predict_proba(custom_input)

    # Get the top 3 predictions for the custom input
    top3_custom_predictions = sorted(zip(model.classes_, custom_predictions_proba[0]), key=lambda x: x[1], reverse=True)[:3]

    # Prepare the response JSON
    response_data = []
    for pred_label, pred_proba in top3_custom_predictions:
        topic = pred_label.split(' - ')[-1]
        links = {}
        if topic in physics_links:
            links['Physics'] = physics_links[topic]
        if topic in chemistry_links:
            links['Chemistry'] = chemistry_links[topic]
        if topic in mathematics_links:
            links['Mathematics'] = mathematics_links[topic]
        response_data.append({'topic': topic, 'probability': pred_proba, 'links': links,'text':text.lower()})

    # Delete the temporary image file
    os.remove(temp_image_path)
    print(response_data)

    return jsonify(response_data)

if __name__ == '__main__':
    app.run(debug=True)
