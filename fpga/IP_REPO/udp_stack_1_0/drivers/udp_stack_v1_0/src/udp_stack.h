
#ifndef UDP_STACK_H
#define UDP_STACK_H


/****************** Include Files ********************/
#include "xil_types.h"
#include "xstatus.h"

#define UDP_STACK_S00_AXI_SLV_REG0_OFFSET 0
#define UDP_STACK_S00_AXI_SLV_REG1_OFFSET 4
#define UDP_STACK_S00_AXI_SLV_REG2_OFFSET 8
#define UDP_STACK_S00_AXI_SLV_REG3_OFFSET 12


/**************************** Type Definitions *****************************/
/**
 *
 * Write a value to a UDP_STACK register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the UDP_STACKdevice.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void UDP_STACK_mWriteReg(u32 BaseAddress, unsigned RegOffset, u32 Data)
 *
 */
#define UDP_STACK_mWriteReg(BaseAddress, RegOffset, Data) \
  	Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))

/**
 *
 * Read a value from a UDP_STACK register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the UDP_STACK device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	u32 UDP_STACK_mReadReg(u32 BaseAddress, unsigned RegOffset)
 *
 */
#define UDP_STACK_mReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))

/************************** Function Prototypes ****************************/
/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the UDP_STACK instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus UDP_STACK_Reg_SelfTest(void * baseaddr_p);

#endif // UDP_STACK_H
