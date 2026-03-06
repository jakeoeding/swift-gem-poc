final class Counter {
    var count: Int32
    var step: Int32

    public init(initialCount: Int32 = 0, step: Int32 = 1) {
        self.count = initialCount
        self.step = step
    }

    public func increment() {
        self.count += self.step
    }
}
