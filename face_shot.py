#!/usr/bin/python3

import cv2
import os

os.system("cls")
name = input("please input your name | masukkan nama anda: ")

cam = cv2.VideoCapture(0) 
cv2.namedWindow("press space to take a photo | tekan spasi untuk mengambil foto", cv2.WINDOW_NORMAL)
cv2.resizeWindow("press space to take a photo | tekan spasi untuk mengambil foto", 800, 600 )


while True:
    ret, frame = cam.read()
    if not ret:
        print("failed to grab frame | gagal mengambil gambar")
        break
    cv2.imshow("press space to take a photo | tekan spasi untuk mengambil foto", frame)

    k = cv2.waitKey(1)
    if k%256 == 27:
        # ESC pressed
        print("Escape hit, closing...")
        break
    elif k%256 == 32:
        # SPACE pressed
        img_name = "src/profiles/"+ "{}.jpg".format(name)
        cv2.imwrite(img_name, frame)
        print("{} written!".format(img_name))
        break

cam.release()

cv2.destroyAllWindows()
