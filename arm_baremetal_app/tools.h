#ifndef __TOOLS_H_
#define __TOOLS_H_

#define enable_printf

#ifdef enable_printf
#define printf xil_printf
#else
#define printf(...)
#endif


#define SPLIT_6 	1
#define SPLIT_7_3 	2
#define SPLIT_7_2 	3
#define SPLIT_7_2x 	4
#define SPLIT_8	 	5
#define HW_ACCEL_TX 6
#define FFT_ACCEL 6

#endif
