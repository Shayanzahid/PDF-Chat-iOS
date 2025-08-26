# PDF Chat iOS App with SwiftUI

## A fully functional PDF chat iOS app written in SwiftUI which was created as a client app for Langchain MultiPDF Chat App with Python to demonstrate the uploading of PDF and asking questions about the document with apis.

This is an example iOS app which was created for the [Langchain MultiPDF Chat App](https://github.com/Shayanzahid/PDF-Chat) as a client. You can use this app a usecase to upload your PDF by making a multipart/form-data api call to the deployed python project and then chat with a bot and ask questions about your PDF document in a chat-like interface.

There can be many usecases for this like:

* Employees of an organization can use this app on their phones to ask questions and get real time answers about company or HR policies.
* Students can upload their text books or notes and ask questions about them to help them in their studies.
* Software developers or engineers can upload documentation for an SDK and ask exactly how to do something rather than searching the documentation manually.

Although this is an example project and needs to be polished, it demonstrates:

* How to create a multipart/form-data request using async/await.
* How you can create a chat interface in SwiftUI.
* How you can add a typing indicator in a chat view while waiting for a response.
* How to pick local documents from the Files storage in your iOS device.
* How you can use a Router for easier navigation in SwiftUI.

## Dependencies and installation

To setup this app, please follow these steps:

* Clone the repository on your machine.
* Make sure you have properly setup and deployed the python project on your server or you can use a service like `Render` to deploy for free to test it out.
* Open the project and go to the `NetworkManager` class and replace the base URLs in the `uploadPDF` and `askQuestion` functions with your own URLs where you have deployed the python project.
<pre>let url = URL(string: "https://example.com/process-pdf/")!</pre>

## Usage

To use this app, please follow these steps:

When you open the app, you will see a screen like this:<br><br>

<p align="center">
<img width="350" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-26 at 03 00 29" src="https://github.com/user-attachments/assets/20a41a35-54aa-4874-9276-063a2fce1459" /><br><br>
</p>

Tap on the gray area with the upload icon, and it will open the document picker:<br><br>

<p align="center">
<img width="350" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-26 at 03 03 44" src="https://github.com/user-attachments/assets/637501b0-7322-4b42-b733-9adf862e1843" /><br><br>
</p>

Select your document and tap `Process PDF` button:<br><br>

<p align="center">
<img width="350" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-26 at 03 04 43" src="https://github.com/user-attachments/assets/0f8ccff2-5877-4a8c-a431-f9b96ab9a3d1" /><br><br>
</p>

Once the document has finished processing, it will navigate to the chat screen and you can chat with your PDF now:<br><br>

<p align="center">
<img width="350" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-26 at 03 06 56" src="https://github.com/user-attachments/assets/3e91a790-5fd5-41ee-9320-14aff7470520" /><br><br>
</p>

<p align="center">
<img width="350" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-26 at 03 08 01" src="https://github.com/user-attachments/assets/84793a2b-b80c-4bad-8bc5-944c1dc7d1dd" /><br><br>
</p>

## Contributions

This is an example project created as a client app, please feel free to clone this project and make changes according to your own needs. You can also use it as a boiler-plate to create chat interfaces or make multipart/form-data POST requests using async/await.

## License

The PDF Chat iOS App with SwiftUI is released under the [MIT License](https://opensource.org/licenses/MIT)

