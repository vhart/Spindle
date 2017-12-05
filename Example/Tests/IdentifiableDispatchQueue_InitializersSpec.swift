import Quick
import Nimble
import Spindle

class IdentifiableDispatchQueueSpec: QuickSpec {

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

        describe("IdentifiableDispatchQueue.currentQueueIs(_:)") {
            context("when queue1 is a serial queue") {

                var queue1: IdentifiableDispatchQueue!

                beforeEach {
                    queue1 = IdentifiableDispatchQueue(label: "com.test.queue1")
                }

                context("and is running an async task") {

                    context("and the task evaluates if the current queue is queue1") {

                        it("returns true") {
                            var isQueue1 = false

                            queue1.queue.async {
                                isQueue1 = IdentifiableDispatchQueue.currentQueueIs(queue1)
                            }

                            expect(isQueue1).toEventually(beTrue())
                        }
                    }

                    context("and the task evaluates if the current queue is queue2") {

                        var queue2: IdentifiableDispatchQueue!

                        beforeEach {
                            queue2 = IdentifiableDispatchQueue(label: "yellow.green.banana")
                        }
                        
                        it("returns true") {
                            var isQueue2 = false
                            
                            queue1.queue.async {
                                isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                            }
                            
                            expect(isQueue2).toEventually(beFalse())
                        }
                    }
                }

                context("and is running an sync task") {

                    context("and the task evaluates if the current queue is queue1") {

                        it("returns true") {
                            var isQueue1 = false

                            queue1.queue.sync {
                                isQueue1 = IdentifiableDispatchQueue.currentQueueIs(queue1)
                            }

                            expect(isQueue1) == true
                        }
                    }

                    context("and the task evaluates if the current queue is queue2") {

                        var queue2: IdentifiableDispatchQueue!

                        beforeEach {
                            queue2 = IdentifiableDispatchQueue(label: "yellow.green.banana")
                        }

                        it("returns true") {
                            var isQueue2 = true

                            queue1.queue.sync {
                                isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                            }
                            
                            expect(isQueue2) == false
                        }
                    }
                }
            }
        }
    }
}
