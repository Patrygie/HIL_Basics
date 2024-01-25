import RPi.GPIO as GPIO

class ledlib:
    def __init__(self):
        #include input STM - button
        self.led_pin = 26
        
        #21 output STM32 - led
        self.button_pin = 21
        self.initialize_gpio()

    def initialize_gpio(self):
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(self.led_pin, GPIO.OUT)
        GPIO.setup(self.button_pin, GPIO.IN, pull_up_down=GPIO.PUD_UP)

    def turn_on_led(self):
        GPIO.output(self.led_pin, GPIO.HIGH)

    def turn_off_led(self):
        GPIO.output(self.led_pin, GPIO.LOW)

    def read_button_state(self):
        return GPIO.input(self.button_pin)

    def cleanup(self):
        GPIO.cleanup()
