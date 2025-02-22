# **Capricon Flutter Task**
A Flutter application that provides users with stock information, including login functionality, stock listings, and detailed stock data. This app uses Riverpod for state management and provides a clean UI with custom widgets.

## **Table of Contents**
- **Features**
- **Getting Started**
- **Setup Instructions**
- **Dependencies**
- **API Configurations**

## **Features**
- **Login Screen**: Allows users to log in and access stock data.
- **Stock Screen**: Displays a list of stocks with search functionality.
- **Stock Detail Screen**: Shows detailed information about a specific stock, including price, market cap, emissions, and sustainability efforts.
- **State Management**: Utilizes Riverpod for efficient state management across the app.
- **Custom App Bar**: A reusable app bar that can be customized across screens.
- **Loading and Error Handling**: Displays loading spinners and error messages when necessary.

## **Dependencies**
This project uses the following dependencies:

- **flutter_riverpod**: A state management library used for handling app state.
- **shared_preferences**: For storing login information locally.
- **flutter**: The core framework for building the app.
- **http**: For making HTTP requests to the API.
- **provider**: Another state management solution for authentication.

## **List of Key Dependencies**
- **flutter_riverpod**: ^2.0.0
- **shared_preferences**: ^2.0.8
- **http**: ^0.13.4
- **flutter**: ^3.7.0

You can see the full list of dependencies in the `pubspec.yaml` file.

## **API Configurations**
The app fetches stock data from an API. Make sure you have the following API configurations set up in your project:

- **API Base URL**: In the `lib/utils/api_constants.dart` file, ensure the base URL is correctly configured:
  ```dart
  const String baseUrl = "https://illuminate-production.up.railway.app/api/"; // Replace with the actual API base URL
