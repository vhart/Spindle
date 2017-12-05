public final class IdentifiableDispatchQueue {
    public let key = DispatchSpecificKey<UUID>()
    public let id = UUID()

    public let queue: DispatchQueue

    public convenience init(label: String) {
        let queue = DispatchQueue(label: label)

        self.init(queue: queue)
    }

    public convenience init(label: String,
                     qos: DispatchQoS = .default,
                     attributes: DispatchQueue.Attributes = [],
                     autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency = .inherit,
                     target: DispatchQueue? = nil) {

        let queue = DispatchQueue(label: label,
                                  qos: qos,
                                  attributes: attributes,
                                  autoreleaseFrequency: autoreleaseFrequency,
                                  target: target)
        self.init(queue: queue)
    }

    public init(queue: DispatchQueue) {
        self.queue = queue

        queue.setSpecific(key: key, value: id)
    }

    public class func currentQueueIs(_ queue: IdentifiableDispatchQueue) -> Bool {
        guard let value = DispatchQueue.getSpecific(key: queue.key) else { return false }
        return value == queue.id
    }
}
