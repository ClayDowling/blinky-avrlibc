PROJECT=blinky

USBPORT = /dev/ttyUSB0
CC = avr-gcc
OBJCOPY = objcopy
AVRDUDE = avrdude

CFLAGS = -Os -w -ffunction-sections -fdata-sections -fno-fat-lto-objects -MMD -mmcu=atmega328p -DF_CPU=16000000L -std=c99

$(PROJECT): blinky.o
	$(CC) $^ -o $@

$(PROJECT).hex: $(PROJECT)
	$(OBJCOPY) -O ihex -R .eeprom $^ $@

upload: $(PROJECT).hex
	$(AVRDUDE) -v -patmega328p -carduino -P$(USBPORT) -b57600 -D -Uflash:w:$(PROJECT).hex:i

clean:
	rm -rf $(PROJECT)
	rm -rf $(PROJECT).hex
	rm -rf *.o
	rm -rf *.d