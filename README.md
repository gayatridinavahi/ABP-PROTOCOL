# ABP-PROTOCOL

## Introduction
**AMBA**
    The AMBA (Advanced Microcontroller Bus Architecture) is an open standard bus protocol developed by ARM for designing complex System-on-Chip (SoC) architectures. It provides a framework and specifications for 
    efficient communication and integration of IP components within a SoC. The architecture includes buses like AHB, ASB, APB, and AXI, each catering to specific requirements in terms of performance and 
    complexity. AMBA promotes modularity and reusability, simplifying the development of embedded systems in various domains.
    ![image](https://github.com/gayatridinavahi/ABP-PROTOCOL/assets/139046389/3ec01c96-e97d-481e-8631-a814f562fb23)

**ABP**
    Developed by ARM, the APB protocol provides a low-power, low-complexity interface for connecting peripheral devices to a microprocessor or microcontroller. The AMBA APB protocol is designed to address the 
    specific requirements of peripheral devices that operate at slower speeds and do not require high bandwidth. It is commonly used to connect peripheral devices such as timers, interrupt controllers, UARTs 
    (Universal Asynchronous Receiver-Transmitters), and other low-speed peripherals to the system bus. The AMBA APB protocol serves as a crucial interface protocol for connecting peripheral devices in SoC 
    designs. Its simplicity, low power consumption, and widespread adoption have made it a popular choice in the industry.

**Bus** **Architecture**
![image](https://github.com/gayatridinavahi/ABP-PROTOCOL/assets/139046389/3140b0a0-369a-446c-938c-ed688cd64647)

## State Diagram reference
![image](https://github.com/gayatridinavahi/ABP-PROTOCOL/assets/139046389/d87eae81-08bc-4d3d-9fb3-84ababda438d)

### Operating States
**IDLE** This is the default state of the APB.

**SETUP** When a transfer is required the bus moves into the SETUP state, where
the appropriate select signal, PSELx, is asserted. The bus only remains
in the SETUP state for one clock cycle and always moves to the ACCESS
state on the next rising edge of the clock.

**ACCESS** The enable signal, PENABLE, is asserted in the ACCESS state. The
           address, write, select, and write data signals must remain stable during
           the transition from the SETUP to ACCESS state.
           Exit from the ACCESS state is controlled by the PREADY signal from
           the slave:
               '•'If PREADY is held LOW by the slave then the peripheral bus
                  remains in the ACCESS state.
               '•' If PREADY is driven HIGH by the slave then the ACCESS state is
                   exited and the bus returns to the IDLE state if no more transfers are
                   required. Alternatively, the bus moves directly to the SETUP state
                   if another transfer follows.
