#include <ruby.h>
#include "counter.h"

static void rb_counter_free(void *ptr) {
    if (ptr) {
        counter_destroy((Counter *)ptr);
    }
}

static const rb_data_type_t rb_counter_type = {
    .wrap_struct_name = "Counter",
    .function = {
        .dmark = 0,
        .dfree = rb_counter_free,
        .dsize = 0
    },
    .parent = 0,
    .flags = RUBY_TYPED_FREE_IMMEDIATELY
};

static VALUE rb_counter_alloc(VALUE klass) {
    return TypedData_Wrap_Struct(klass, &rb_counter_type, NULL);
}

static VALUE rb_counter_initialize(VALUE self, VALUE initial_count, VALUE step) {
    Counter *counter = counter_create(NUM2INT(initial_count), NUM2INT(step));
    RTYPEDDATA(self)->data = counter;
    return self;
}

static VALUE rb_counter_increment(VALUE self) {
    Counter *counter;
    TypedData_Get_Struct(self, Counter, &rb_counter_type, counter);
    int32_t new_count = counter_increment(counter);
    return INT2NUM(new_count);
}

void Init_counter() {
    VALUE module = rb_define_module("Counter");
    VALUE klass = rb_define_class_under(module, "Counter", rb_cObject);

    rb_define_alloc_func(klass, rb_counter_alloc);
    rb_define_method(klass, "initialize", rb_counter_initialize, 2);
    rb_define_method(klass, "increment", rb_counter_increment, 0);
}
