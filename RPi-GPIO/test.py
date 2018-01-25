#import RPi.GPIO as GPIO
import RTk.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM) # Broadcom pin-numbering scheme

ledPin=21

GPIO.setup(ledPin, GPIO.OUT)
GPIO.output(ledPin, GPIO.HIGH)
time.sleep(0.2)
GPIO.output(ledPin, GPIO.LOW)
time.sleep(0.2)


ledPin=20

while True:
    GPIO.setup(ledPin, GPIO.OUT)
    GPIO.output(ledPin, GPIO.HIGH)
    time.sleep(0.002)
    GPIO.output(ledPin, GPIO.LOW)
    time.sleep(0.002)

