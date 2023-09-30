## contact-form-app--

The Contact Form App is a Flutter-based mobile application that allows users to submit contact information, including Name, Email, Phone Number, and Address. The app demonstrates basic data input validation and integrates Firebase Cloud Firestore for data storage. Additionally, it implements exception handling to provide a smooth user experience

## Basic Working->

1. **User-Friendly Form**: The app provides a user-friendly form with fields for Name, Email, Phone Number, and Address.

2. **Form Submission**: Users can submit the form, and the data is sent and stored in a Firebase Cloud Firestore database.

3. **Exception Handling**: Exception handling is implemented to ensure that all required fields are filled. If any field is left empty, a "Fill all fields" message is displayed to the user.

 ##- Firebase Cloud Firestore Integration

-> The app utilizes Firebase Cloud Firestore, a NoSQL document database, to store and manage contact information.

-> Firestore collections are used to store contact data. When a user submits the form, the data is added to the "contacts" collection in Firestore.

## Code Explanation--

- The code is organized into different files:

    -> `main.dart`: The main entry point of the app, where Firebase is initialized.

    -> `contact_screen.dart`: Defines the UI for the contact form, handles form submission, and includes basic text field validation. It includes error handling for 
    empty fields and displays a SnackBar for user feedback.

    -> `success_screeen.dart`: If any one of the fields are empty the data wont be submitted and snackbar will be displayed.Else the data will be succesfully 
   submitted and will be navigated to success screen there it will show 'successfully added the contacts!"

    
    ->The `dispose` method is used to clean up resources, specifically TextEditingControllers, to prevent memory leaks when the widget is removed from the screen.

  -> Exception handling is implemented in the `submit` method of the `contact_screen.dart` file to ensure that all form fields are filled before submitting 
   data to Firestore.

-> An alert dialog is shown in case of Firestore operation errors, displaying the error message to the user.

## Usage--

1. Ensure you have Flutter and Firebase set up in your development environment.

2. Clone this repository to your local machine.

3. Navigate to the project directory and run `flutter pub get` to install the required dependencies.

4. Configure your Firebase project and update the Firebase configuration in the app.

5. Run the app using `flutter run` or your preferred Flutter development workflow.

6. Fill out the contact form with valid data and click the "Submit" button to save the data to Firestore.

7. If any of the form fields are left empty, a "Fill all fields" message will be displayed.

8. In case of any errors during Firestore data submission, an error message will be shown in an alert dialog.

9. Explore the code comments for a deeper understanding of the app's functionality and structure.

### Notes--

> This is a simplified example of a Contact Form app. Depending on your requirements, you may want to add more features, implement further error handling, and enhance the user interface. I will add this to in the near future.

> Feel free to reach out if you have any questions or need further assistance with this app.
