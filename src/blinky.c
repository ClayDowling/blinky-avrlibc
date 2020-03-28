// Blink the LED like a nice civilized Hello World program.
// Built-in LED is on Port B, pin 5

#include <avr/io.h>
#include <util/delay.h>

#define BLINK_DELAY 1000

int main(void) {

    // setup
    DDRB |= _BV(DDB5);

    // loop
    while(1) {
        // Set pin 5 high
        PORTB |= _BV(PORTB5);

        _delay_ms(BLINK_DELAY);

        // Set pin 5 low
        PORTB &= ~_BV(PORTB5);

        _delay_ms(BLINK_DELAY);
    }
}