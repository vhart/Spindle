public typealias IDQ = IdentifiableDispatchQueue

public final class IdentifiableDispatchQueue {
    public let key = DispatchSpecificKey<UUID>()
    public let id = UUID()

    public let queue: DispatchQueue

    private struct Global {
        static let background = IdentifiableDispatchQueue(underlyingQueue: .global(qos: .background))
        static let `default` = IdentifiableDispatchQueue(underlyingQueue: .global(qos: .default))
        static let utility = IdentifiableDispatchQueue(underlyingQueue: .global(qos: .utility))
        static let userInitiated = IdentifiableDispatchQueue(underlyingQueue: .global(qos: .userInitiated))
        static let userInteractive = IdentifiableDispatchQueue(underlyingQueue: .global(qos: .userInteractive))
    }

    public convenience init(label: String) {
        let queue = DispatchQueue(label: label)

        self.init(underlyingQueue: queue)
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
        self.init(underlyingQueue: queue)
    }

    public convenience init?(queue: DispatchQueue) {
        guard !IDQ.queueIsAGlobalQueue(queue) else { return nil }

        self.init(underlyingQueue: queue)
    }

    init(underlyingQueue: DispatchQueue) {
        self.queue = underlyingQueue

        queue.setSpecific(key: key, value: id)
    }

    public class func currentQueueIs(_ queue: IdentifiableDispatchQueue) -> Bool {
        guard let value = DispatchQueue.getSpecific(key: queue.key) else { return false }
        return value == queue.id
    }

    private class func queueIsAGlobalQueue(_ queue: DispatchQueue) -> Bool {
        let keys = [Global.background.key,
                    Global.default.key,
                    Global.userInitiated.key,
                    Global.userInteractive.key,
                    Global.utility.key]

        for key in keys {
            if let _ = queue.getSpecific(key: key) {
                return true
            }
        }

        return false
    }
}
