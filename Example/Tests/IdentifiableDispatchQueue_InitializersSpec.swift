import Quick
import Nimble
import Spindle

class IdentifiableDispatchQueue_InitializersSpec: QuickSpec {

    override func spec() {
        describe("initializers") {

            context("init(label:)") {

                var idq: IdentifiableDispatchQueue!

                beforeEach {
                    idq = IdentifiableDispatchQueue(label: "com.some-test")
                }

                it("creates an underlying serial queue with label com.some-test") {
                    expect(idq.queue.label) == "com.some-test"
                }
            }

            context("init(label:qos:attributes:autoreleaseFrequency:target:)") {

                var idq: IdentifiableDispatchQueue!

                beforeEach {
                    idq = IdentifiableDispatchQueue(label: "com.some-test",
                                                    qos: .background,
                                                    attributes: [.concurrent],
                                                    autoreleaseFrequency: .inherit,
                                                    target: nil)
                }

                it("creates an underlying queue with label com.some-test") {
                    expect(idq.queue.label) == "com.some-test"
                }

                it("creates an underlying queue with .background qos") {
                    expect(idq.queue.qos) == DispatchQoS.background
                }
            }

            context("init(queue:)") {

                var idq: IdentifiableDispatchQueue!
                var queue: DispatchQueue!

                beforeEach {
                    queue = DispatchQueue(label: "blue.potato.chips")
                    idq = IdentifiableDispatchQueue(queue: queue)
                }

                it("creates an underlying queue with label com.some-test") {
                    expect(idq.queue.label) == "blue.potato.chips"
                }
            }
        }
    }
}
