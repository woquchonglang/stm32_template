#!/bin/bash

rm -rf ../Drivers

mkdir -p ../Drivers/CMSIS/Device/ST/STM32F4xx
cp -r ../Lib/CMSIS_Device_F4/Include/ ../Drivers/CMSIS/Device/ST/STM32F4xx
cp -r ../Lib/STM32F4xx_HAL_Driver/ ../Drivers
cp -r ../Lib/CMSIS5/Core/Include/ ../Drivers/CMSIS/
