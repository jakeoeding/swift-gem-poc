#ifndef COUNTER_H
#define COUNTER_H

#include <stdint.h>

typedef struct Counter Counter;

Counter * _Nonnull counter_create(int32_t initial_count, int32_t step);
int32_t counter_increment(Counter * _Nonnull counter);
int32_t counter_get_count(Counter * _Nonnull counter);
void counter_set_count(Counter * _Nonnull counter, int32_t new_count);
int32_t counter_get_step(Counter * _Nonnull counter);
void counter_set_step(Counter * _Nonnull counter, int32_t new_step);
void counter_destroy(Counter * _Nonnull counter);

#endif // COUNTER_H
