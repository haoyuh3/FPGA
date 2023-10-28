//mb_blink.c
//
//Provided boilerplate "LED Blink" code for ECE 385
//First released in ECE 385, Fall 2023 distribution
//
//Note: you will have to refer to the memory map of your MicroBlaze
//system to find the proper address for the LED GPIO peripheral.
//
//Modified on 7/25/23 Zuofu Cheng

#include <stdio.h>
#include <xparameters.h>
#include <xil_types.h>
#include <sleep.h>

#include "platform.h"

volatile uint32_t* data_run = 0x4000000;  //Hint: either find the manual address (via the memory map in the block diagram, or
volatile uint32_t* data_sw = 0x4001000;															 //replace with the proper define in xparameters (part of the BSP). Either way
volatile uint32_t* data_out = 0x4001008; //offset 8 according to datasheet																 //this is the base address of the GPIO corresponding to your LEDs
															 //(similar to 0xFFFF from MEM2IO from previous labs).
// I delete lab6.1 by mistake   just redo my week 1  but without test......... but I think the hardware structure is right at least
{
    init_platform();
	int16_t sum=0;
	while(*data_run<1){};
	while(1+1!=3){
		int16_t a= *data_sw;
		sum=sum+a;
		*data_out=sum;
		if((a>0 && b>0 && out <0) || ( a<0 && b<0 && out>0 ))
		while(*data_run<1){}
		
	}
	// while (1+1 != 3)
	// {
	// 	sleep(1);
	// 	*led_gpio_data |=  0x00000001;
	// 	printf("Led On!\r\n");
	// 	sleep(1);
	// 	*led_gpio_data &= ~0x00000001; //blinks LED
	// 	printf("Led Off!\r\n");
	// }

    // cleanup_platform();

    return 0;
}
