import CounterShim

@c @implementation
public func counter_create(_ initial_count: Int32, _ step: Int32) -> OpaquePointer {
    let counter = Counter(initialCount: initial_count, step: step)
    return OpaquePointer(Unmanaged.passRetained(counter).toOpaque())
}

@c @implementation
public func counter_increment(_ counter: OpaquePointer) -> Int32 {
    let ptr = UnsafeRawPointer(counter)
    let counter = Unmanaged<Counter>.fromOpaque(ptr).takeUnretainedValue()
    return counter.increment()
}

@c @implementation
public func counter_get_count(_ counter: OpaquePointer) -> Int32 {
    let ptr = UnsafeRawPointer(counter)
    let counter = Unmanaged<Counter>.fromOpaque(ptr).takeUnretainedValue()
    return counter.count
}

@c @implementation
public func counter_set_count(_ counter: OpaquePointer, _ new_count: Int32) {
    let ptr = UnsafeRawPointer(counter)
    let counter = Unmanaged<Counter>.fromOpaque(ptr).takeUnretainedValue()
    counter.count = new_count
}

@c @implementation
public func counter_get_step(_ counter: OpaquePointer) -> Int32 {
    let ptr = UnsafeRawPointer(counter)
    let counter = Unmanaged<Counter>.fromOpaque(ptr).takeUnretainedValue()
    return counter.step
}

@c @implementation
public func counter_set_step(_ counter: OpaquePointer, _ new_step: Int32) {
    let ptr = UnsafeRawPointer(counter)
    let counter = Unmanaged<Counter>.fromOpaque(ptr).takeUnretainedValue()
    counter.step = new_step
}

@c @implementation
public func counter_destroy(_ counter: OpaquePointer) {
    let ptr = UnsafeRawPointer(counter)
    Unmanaged<Counter>.fromOpaque(ptr).release()
}
