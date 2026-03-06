#ifndef COUNTER_H
#define COUNTER_H

#include <stdint.h>

typedef struct Counter Counter;

Counter* counter_create(int32_t initial_count, int32_t step);
void counter_increment(Counter *counter);
void counter_destroy(Counter *counter);

#endif // COUNTER_H
