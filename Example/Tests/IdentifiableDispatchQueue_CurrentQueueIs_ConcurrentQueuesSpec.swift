import Quick
import Nimble
import Spindle

class IdentifiableDispatchQueue_CurrentQueueIs_ConcurrentQueuesSpec: QuickSpec {
    override func spec() {
        describe("IdentifiableDispatchQueue.currentQueueIs(_:)") {
            context("when queue1 is a non global concurrent queue") {

                var queue1: IdentifiableDispatchQueue!

                beforeEach {
                    queue1 = IdentifiableDispatchQueue(label: "com.test.queue1", attributes: [.concurrent])
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

                    context("and the task evaluates if the current queue is a non-global concurrent queue: queue2") {

                        var queue2: IdentifiableDispatchQueue!

                        beforeEach {
                            queue2 = IdentifiableDispatchQueue(label: "yellow.green.banana", attributes: [.concurrent])
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

                    context("and the task evaluates if the current queue is the non-global concurrent queue: queue2") {

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

            context("when comparing two non-global concurrent queues") {

                context("and queue1 is .background and queue2 is .background") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .background, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .background and queue2 is .default") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .background, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .background and queue2 is .unspecified") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .background, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .background and queue2 is .utility") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .background, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .background and queue2 is .userInitiated") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .background, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .background and queue2 is .userInteractive") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .background, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInteractive, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .default and queue2 is .background") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .default, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .default and queue2 is .default") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .default, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .default and queue2 is .unspecified") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .default, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .default and queue2 is .utility") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .default, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .default and queue2 is .userInitiated") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .default, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .default and queue2 is .userInteractive") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .default, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInteractive, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .unspecified and queue2 is .background") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .unspecified, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .unspecified and queue2 is .default") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .unspecified, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .unspecified and queue2 is .unspecified") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .unspecified, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .unspecified and queue2 is .utility") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .unspecified, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .unspecified and queue2 is .userInitiated") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .unspecified, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .unspecified and queue2 is .userInteractive") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .unspecified, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInteractive, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .utility and queue2 is .background") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .utility, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .utility and queue2 is .default") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .utility, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .utility and queue2 is .unspecified") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .utility, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .utility and queue2 is .utility") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .utility, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .utility and queue2 is .userInitiated") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .utility, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .utility and queue2 is .userInteractive") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .utility, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInteractive, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .userInitiated and queue2 is .background") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInitiated, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .userInitiated and queue2 is .default") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInitiated, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .userInitiated and queue2 is .unspecified") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInitiated, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .userInitiated and queue2 is .utility") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInitiated, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .userInitiated and queue2 is .userInitiated") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInitiated, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .userInitiated and queue2 is .userInteractive") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInitiated, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInteractive, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .userInteractive and queue2 is .background") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInteractive, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .userInteractive and queue2 is .default") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInteractive, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .userInteractive and queue2 is .unspecified") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInteractive, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .userInteractive and queue2 is .utility") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInteractive, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .userInteractive and queue2 is .userInitiated") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInteractive, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 is .userInteractive and queue2 is .userInteractive") {

                    it("returns false for each pair") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInteractive, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInteractive, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }
            }
        }
    }
}
