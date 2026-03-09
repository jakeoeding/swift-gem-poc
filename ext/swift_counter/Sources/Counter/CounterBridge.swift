@_cdecl("counter_create")
public func counterCreate(initialCount: Int32, step: Int32) -> UnsafeMutableRawPointer {
    let counter = Counter(initialCount: initialCount, step: step)
    return Unmanaged.passRetained(counter).toOpaque()
}

@_cdecl("counter_increment")
public func counterIncrement(ptr: UnsafeMutableRawPointer) -> Int32 {
    let counter = Unmanaged<Counter>.fromOpaque(ptr).takeUnretainedValue()
    return counter.increment()
}

@_cdecl("counter_get_count")
public func counterGetCount(ptr: UnsafeMutableRawPointer) -> Int32 {
    let counter = Unmanaged<Counter>.fromOpaque(ptr).takeUnretainedValue()
    return counter.count
}

@_cdecl("counter_set_count")
public func counterSetCount(ptr: UnsafeMutableRawPointer, newCount: Int32) {
    let counter = Unmanaged<Counter>.fromOpaque(ptr).takeUnretainedValue()
    counter.count = newCount
}

@_cdecl("counter_get_step")
public func counterGetStep(ptr: UnsafeMutableRawPointer) -> Int32 {
    let counter = Unmanaged<Counter>.fromOpaque(ptr).takeUnretainedValue()
    return counter.step
}

@_cdecl("counter_set_step")
public func counterSetStep(ptr: UnsafeMutableRawPointer, newStep: Int32) {
    let counter = Unmanaged<Counter>.fromOpaque(ptr).takeUnretainedValue()
    counter.step = newStep
}

@_cdecl("counter_destroy")
public func counterDestroy(ptr: UnsafeMutableRawPointer) {
    Unmanaged<Counter>.fromOpaque(ptr).release()
}
