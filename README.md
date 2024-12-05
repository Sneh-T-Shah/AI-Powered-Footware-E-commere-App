# **Footwear E-commerce Application**

A Flutter-based e-commerce application for footwear enthusiasts. This project consists of two separate mobile applications:

- **Footwear Client Application** - For users to browse, classify, and purchase shoes.
- **Footwear Admin Application** - For admins to manage products, prices, and inventory.

This repository also includes a **Backend AI/ML codebase** that powers a shoe classification feature using a custom-trained CNN model.

---

## **Table of Contents**
- [About the Project](#about-the-project)
- [Features](#features)
  - [Client Application](#client-application)
  - [Admin Application](#admin-application)
  - [Backend AIML](#backend-aiml)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Usage](#usage)
- [Dataset](#dataset)
- [Contact](#contact)

## **About the Project**

This repository is a complete solution for a footwear e-commerce platform with AI-powered features:

- The **Client Application** allows users to register, log in, browse products, classify shoes using images, and make purchases.
- The **Admin Application** enables product management, including uploading shoe images, setting prices, and managing inventory via Firebase.
- The **AI Backend** uses a custom-trained CNN model to classify shoe types into one of five categories:
- ['Ballet Flat', 'Boat', 'Brogue', 'Clog', 'Sneaker']


## **Features**

### **Client Application**
- User registration and login.
- Browse and search shoes from Firebase.
- AI-based shoe classification using uploaded or captured images.
- Categorization of shoes into:
- Ballet Flat, Boat, Brogue, Clog, Sneaker
- Add products to the cart and make purchases.

### **Admin Application**
- Upload products with details (images, price, category).
- Manage inventory and prices using Firebase.

### **Backend AIML**
- Custom CNN model trained on **13,000 shoe images**.
- Model classifies shoe types into five categories.
- Dataset link provided in the `Backend AIML code` folder.

## **Tech Stack**
- **Frontend:** Flutter, Dart
- **Backend:** Python (for AI model)
- **Database:** Firebase (Firestore for real-time database, Firebase Storage for images)

## **Installation**

### **Backend AIML**
1. Navigate to the `Backend AIML code` folder.
2. Install required dependencies:
 ```bash
 pip install -r requirements.txt
 ```

## **Usage**

1 . Admins can use the Admin Application to upload products and manage inventory.

- Users can:
- Browse products in the Client Application.
- Upload or capture shoe images for AI-based classification.
- Add products to the cart and complete purchases.

## **Dataset**
- The shoe classification model was trained on a dataset of 13,000 shoe images.
- You can find the dataset on Kaggle: [Dataset Link](https://www.kaggle.com/datasets/utkarshsaxenadn/shoes-classification-dataset-13k-images)

## **Contact**
- If you have any questions or suggestions, feel free to contact me at:

- Email: snehs5483@gmail.com
- Email: harshbhanushali.ai@gmail.com