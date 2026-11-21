# Embedded / IoT / Firmware

## Layers (bottom → top)
| Layer | Contents |
|---|---|
| Hardware | MCU, peripherals, sensors |
| BSP / HAL | register access, clocks, pin mux — the only place touching hardware directly |
| Drivers | device drivers (I2C sensor, display, radio) on top of HAL |
| OS / scheduler | RTOS tasks, bare-metal super-loop, interrupts |
| Middleware | protocol stacks (BLE, MQTT, TCP/IP), filesystems, OTA |
| Application | state machines, control logic, business rules |

Rules: application logic must compile and run on the host without hardware (via HAL interfaces) so it can be unit-tested;
ISRs do minimal work and defer to tasks; avoid dynamic allocation after init (or use pools);
explicit state machines over flag soup; watchdog everywhere; every external input is untrusted (sensors glitch, radios lie).
Watch: stack/heap budgets, timing deadlines and jitter, race conditions on shared data (volatile is not a lock),
power modes, flash wear, endianness/alignment, safe OTA (A/B partitions, signed images, rollback), secure boot, unique device credentials.

## Typical tests
Host-side unit tests for application and drivers with mocked HAL; hardware-in-the-loop tests;
long-run soak tests; fault injection (power loss during write, sensor disconnect).
