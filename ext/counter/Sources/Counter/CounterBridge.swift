@_cdecl("counter_create")
func counterCreate(initialCount: Int32, step: Int32) -> UnsafeMutableRawPointer {
    let counter = Counter(initialCount: initialCount, step: step)
    return Unmanaged.passRetained(counter).toOpaque()
}

@_cdecl("counter_increment")
func counterIncrement(ptr: UnsafeMutableRawPointer) {
    let counter = Unmanaged<Counter>.fromOpaque(ptr).takeUnretainedValue()
    counter.increment()
}

@_cdecl("counter_destroy")
func counterDestroy(ptr: UnsafeMutableRawPointer) {
    Unmanaged<Counter>.fromOpaque(ptr).release()
}
