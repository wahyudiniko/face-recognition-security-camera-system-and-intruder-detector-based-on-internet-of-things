#!/usr/bin/python3


from flask import Flask, render_template, Response, request
from camera import VideoCamera
import time
import os
from flask_basicauth import BasicAuth


def initializing():
    os.system("clear")
    print("initializing system in 3")
    time.sleep(1)
    print("initializing system in 2")
    time.sleep(1)
    print("initializing system in 1")
    time.sleep(1)
    print("begin")
    os.system("clear")


app = Flask(__name__)
#app = Flask(__name__, template_folder='/var/www/html/templates')

app.config['BASIC_AUTH_USERNAME'] = 'niko'
app.config['BASIC_AUTH_PASSWORD'] = 'abc123'
app.config['BASIC_AUTH_FORCE'] = True

basic_auth = BasicAuth(app)

template = 'index.html'


@app.route('/', methods=['GET', 'POST'])
def move():
    result = ""
    if request.method == 'POST':
        
        return render_template(template, res_str=result)
                        
    return render_template(template)


def gen(camera):
    while True:
        frame = camera.get_frame()
        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n\r\n')

@app.route('/video_feed')
def video_feed():
    return Response(gen(VideoCamera()),
                    mimetype='multipart/x-mixed-replace; boundary=frame')

if __name__ == '__main__':
    initializing()
    app.run(host='0.0.0.0', debug=False, threaded=True)
