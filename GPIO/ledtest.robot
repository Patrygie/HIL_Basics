*** Settings ***
Library           ./ledlib.py
Suite Setup       Initialize GPIO
Test Teardown     Cleanup GPIO Resources



*** Test Cases ***
Button Release
    Turn Off LED
    Log    Button Released

LED Off Check - Button Released
    ${led_state}    Read LED State
    Should Be Equal As Numbers    ${led_state}   0
    Log    LED State: ${led_state}

Button Press
    Turn On LED
    Log    Button Pressed

LED On Check - Button Pressed
    ${led_state}    Read LED State
    Should Be Equal As Numbers    ${led_state}   1
    Log    LED State: ${led_state}

Button Release Again
    Turn Off LED
    Log    Button Released

LED Off Check - Button Released Again
    ${led_state}    Read LED State
    Should Be Equal As Numbers    ${led_state}   0
    Log    LED State: ${led_state}



*** Keywords ***
Initialize GPIO
    [Documentation]    Initialize GPIO pins for LED and button.
    ledlib.initialize_gpio

Read LED State
    [Documentation]    Read the state of the LED.
    ${state}    ledlib.read_button_state
    RETURN      ${state}

Turn On LED
    [Documentation]    Turn off the LED.
    ledlib.turn_off_led

Turn Off LED
    [Documentation]    Turn on the LED.
    ledlib.turn_on_led

Cleanup GPIO Resources
    [Documentation]    Cleanup GPIO resources.
    ledlib.cleanup
