#include "main.hpp"

#include "FreeRTOS.h"
#include "semphr.h"

SemaphoreHandle_t xSemaphore = NULL;

void mainCpp() { xSemaphore = xSemaphoreCreateBinary(); }
