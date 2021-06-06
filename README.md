# face-recognition-security-camera-system-and-intruder-detector-based-on-internet-of-things

A college project about the implementation of facial recognition and internet of thing to a security camera system.
By Niko Wahyudi

# Requirements

for requirements, we can install it via pip with this command:
```
pip install -r requirements.txt 
```

# Usage

## Modify both sender and reciever e-mail
After the requirement were installed, you can modify the `to` variable to e-mail address you want to use to recieve the e-mail and the `UserName` variable for the sender e-mail. For `UserPassword` variable, you can generate an app password [here](https://support.google.com/accounts/answer/185833?hl=en) to avoid storing your password in plain text. here's the code in the `mail.py` file
```python
subject = "An intruder has been detected"
to = "wahyudiniko0@gmail.com"           # receiver email address
UserName = "raspipengirim1@gmail.com"   # sender e-mail address
UserPassword = "ihfpxvhrrjzuizlt"       # both sender and receiver e-mail address only works for gmail
```

## Execution
You can run the program by typing in the command line or terminal by this command:
```
python main.py
```

## Accessing webcam from web-browser
Type `https://your_local_ip_address:5000` inside the address bar.
