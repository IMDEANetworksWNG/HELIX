#ifndef __UDP_DMA_DRIVER_H_
#define __UDP_DMA_DRIVER_H_

void init_udp_dma_driver();
uint8_t recv(u32* RxBufferPtr, u16 len);
uint8_t send(u32* TxBufferPtr, u16 len);

#endif

