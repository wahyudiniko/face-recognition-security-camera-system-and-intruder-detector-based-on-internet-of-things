# Face Recognition Security Camera and Intruder Detector System based on Internet Of Things

A college project about the implementation of facial recognition and the internet of things to a security camera system. A security camera system that detects an unidentified face and sending an e-mail as an alert. 

By Niko Wahyudi

![alt text](../main/src/img/m2.jpg "alert") ![alt text](../main/src/img/m3.jpg "e-mail")



# Prerequisites
+ Windows 10 or Linux
+ Python 3
+ Python Packages Manager (PIP) 


# Getting Started

## Installation
+ Clone this repository:
```
git clone https://github.com/wahyudiniko/security-camera-intruder-detector.git
cd security-camera-intruder-detector
```
+ Installing Requirement Packages
```
pip install -r requirements.txt
```
For windows 10, can install OpenCV via pip
```
pip install opencv-python
pip install opencv-contrib-python
```
For Raspbian/Raspberry OS or other Linux distros you can follow the installaion guide [here](https://www.pyimagesearch.com/2016/04/18/install-guide-raspberry-pi-3-raspbian-jessie-opencv-3/)

# Usage

## Registering Face
+ Run the file [`face_shot.py`](../main/face_shot.py) in the terminal:
```
python face_shot.py
```
+ Insert your name
 
![alt text](../main/src/img/faceshot.png "face_shot.py cmd window")

and then a window will pop up. 
+ Press `spacebar` to take the picture or press `Esc` to abort the program.

![alt text](../main/src/img/faceshot2.png "face_shot.py frame window")


## Modify Sender and Reciever E-mail
After the requirements were installed, you can modify the `to` variable to the e-mail address you want to use to recieve the e-mail and the `UserName` variable for the sender e-mail. For `UserPassword` variable, you can generate an app password [here](https://support.google.com/accounts/answer/185833?hl=en) to avoid storing your password in plain text. here's the code in the [`mail.py`](../main/mail.py) file line 9-11

```python
to = "receiver_email_address"           # receiver email address
UserName = "sender_email_address"       # sender e-mail address
UserPassword = "sender_email_password"  # both sender and receiver e-mail address only works for gmail
```

## Modify Login Authorization
In order to secure the webcam access, we need authorization. 
+ Modify the code to make your own authorization account in the [`main.py`](../main/main.py) file line 13-14:
```python
app.config['BASIC_AUTH_USERNAME'] = 'your_uname'
app.config['BASIC_AUTH_PASSWORD'] = 'your_password'
```


## Execution
+ You can run the `main.py` program by typing this command in the command line or terminal:
```
python main.py
```
+ Wait until this displayed on command line
 
![alt text](../main/src/img/cmd1.png "initiate main.py")

## Accessing Webcam From Web-browser
+ Type `https://your_local_ip_address:5000` inside the address bar. Then an authorization form pops up. Fill it with your authorization username and password.

![alt text](../main/src/img/login.png "login auth")

This is the web-browser display in PC.

![alt text](../main/src/img/browser.png "PC browser display")

![alt text](../main/src/img/browser2.png "PC multi-faces browser display")

![alt text](../main/src/img/test.gif "PC multi-faces browser display")
 
When faces are detected the frame rate will significantly drop and it's slower than when not detecting faces.

You can also access it from different devices that connected to the same network. You also being asked for a login authorization. This is the web-browser display in smartphone.

![alt text](../main/src/img/m1.jpg "smartphone browser display")

This is the log of devices that are currently accessing the webcam through a web browser.
 
![alt text](../main/src/img/cmd4.png "log devices")


## Alert
When an unidentified person is detected, an e-mail will be sending to the receiver email.

This is the display in web browser.

![alt text](../main/src/img/browser3.png "unidentified person")

This is a status update being displayed in the command line.

![alt text](../main/src/img/cmd3.png "status update")
 
An alert e-mail has been sended.
 
![alt text](../main/src/img/m2.jpg "alert")
