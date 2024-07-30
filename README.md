# Syllout_App

## Overview

The **Syllout_App Content Generator tool** is an open-source Flutter application designed to help educators create educational content efficiently using AI(local and api). This app leverages API-based model inference to process user inputs and generate comprehensive course content. It features a clean and intuitive user interface

## Features

- **Text Input Field:** Allows educators to input the topic or requirements for the course content.
- **Submit Button:** Sends the input to an API for processing.
- **Output Display:** Shows the generated course content or other relevant output from the API.
- **API Integration:** Utilizes trained/fine tuned google gemini api .
- **local gemma 2b Integration:(comming soon)**
- **Asynchronous Operations:** Handles asynchronous API calls with proper error handling and user feedback.
- **Real-time Processing:** Provides immediate feedback to users after input submission.
- **Clean and Simple UI:** Designed for ease of use with a minimalist and responsive interface.
- **Error Handling:** Displays informative error messages for any issues encountered during processing.
- **Text to PDF** Converts text to pdf format and can be downloaded(need to be added)  

## Future Enhancements
- **Advanced AI Features:** Incorporate more advanced NLP features such as summarization, question answering, etc.
- **Backend Integration:** Integration with backend services for more complex workflows and data storage.

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)

### Installation

1. **Clone the repository:**
    ```bash
    git clone https://github.com/syllout/Syllout_App.git
    cd Syllout_App
    ```

2. **Install dependencies:**
    ```bash
    flutter pub get
    ```

3. **Run the application:**
    ```bash
    flutter run
    ```

## Usage

1. **Enter text input:** Type the topic or requirements for the course content in the provided text field.
2. **Submit input:** Click the "Process Input" button to send the input to the API.
3. **View output:** The generated course content will be displayed below the input field.

## Project Structure

- `lib/`: Contains the main Flutter application code.
  - `main.dart`: Entry point of the application with UI and API integration logic.
- `assets/`: Directory for storing assets such as images or model files.
- `pubspec.yaml`: Configuration file for Flutter dependencies.

## Contributing

We welcome contributions to enhance the features and functionality of this application. To contribute:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature/your-feature`
3. Make your changes and commit them: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/your-feature`
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)


https://github.com/user-attachments/assets/b35b6910-eeb3-4486-9c39-8ca5cf8531a9
