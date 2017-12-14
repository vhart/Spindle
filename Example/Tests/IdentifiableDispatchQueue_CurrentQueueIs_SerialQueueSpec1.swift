import Quick
import Nimble
import Spindle

class IdentifiableDispatchQueue_SerialQueueSpec1: QuickSpec {
    override func spec() {
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
