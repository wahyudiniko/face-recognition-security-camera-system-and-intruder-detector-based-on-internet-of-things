# face-recognition-security-camera-system-and-intruder-detector-based-on-internet-of-things

A college project about the implementation of facial recognition and internet of thing to a security camera system.
By Niko Wahyudi

# Prerequisites
+ Windows or Linux
+ Python 3
+ Python Packages Manager (PIP) 

# Getiing Started

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

# Usage

## Modify both sender and reciever e-mail
After the requirement were installed, you can modify the `to` variable to e-mail address you want to use to recieve the e-mail and the `UserName` variable for the sender e-mail. For `UserPassword` variable, you can generate an app password [here](https://support.google.com/accounts/answer/185833?hl=en) to avoid storing your password in plain text. here's the code in the `mail.py` file
```python
subject = "An intruder has been detected"
to = "receiver_email_address"           # receiver email address
UserName = "sender_email_address"       # sender e-mail address
UserPassword = "sender_email_password"  # both sender and receiver e-mail address only works for gmail
```

## Execution
You can run the program by typing in the command line or terminal by this command:
```
python main.py
```

## Accessing webcam from web-browser
Type `https://your_local_ip_address:5000` inside the address bar.
