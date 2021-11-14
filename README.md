# Assembly Practice
This repository documents my journey learning assembly.

# Dependecies 
This repository has been developed and tested on Linux, Ubuntu distribution. For the ARM assembling you need to download the gnu arm embedded toolchain. For instructions on how to do this follow the [prerequisites](https://github.com/krogk/STM32F411E-discovery-starter#prerequisites) section on my STM32F411E starter template project.

If you would like to run the ARM Assembly on the machine you are developing it is reccommend to use [QEMU - A generic and open source machine emulator and virtualizer](https://www.qemu.org/)
```
sudo apt install qemu
sudo apt install qemu-user 
```

# Assembling 

32-bit ARM:
```
arm-none-eabi-as -o hello.o hello.asm # run assembler, which translates the assembly into intermediate object file
arm-none-eabi-gcc -o hello.elf hello.o -nostdlib -static # ask linker to produce executable and linkable format file(.elf)

qemu-arm ./hello.elf # run executable using qemu
```