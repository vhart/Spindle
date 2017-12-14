import Quick
import Nimble
import Spindle

class IdentifiableDispatchQueue_CurrentQueueIs_ConcurrentQueuesSpec1: QuickSpec {
    override func spec() {
        describe("IdentifiableDispatchQueue.currentQueueIs(_:)") {
            context("when queue1 QoS is a non global concurrent queue") {

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

                context("and queue1 QoS is .background and queue2 QoS is .background") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .background, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .background and queue2 QoS is .default") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .background, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .background and queue2 QoS is .unspecified") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .background, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .background and queue2 QoS is .utility") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .background, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .background and queue2 QoS is .userInitiated") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .background, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .background and queue2 QoS is .userInteractive") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .background, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInteractive, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .default and queue2 QoS is .background") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .default, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .default and queue2 QoS is .default") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .default, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .default and queue2 QoS is .unspecified") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .default, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .default and queue2 QoS is .utility") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .default, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .default and queue2 QoS is .userInitiated") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .default, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .default and queue2 QoS is .userInteractive") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .default, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInteractive, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .unspecified and queue2 QoS is .background") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .unspecified, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .unspecified and queue2 QoS is .default") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .unspecified, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .unspecified and queue2 QoS is .unspecified") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .unspecified, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .unspecified and queue2 QoS is .utility") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .unspecified, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .unspecified and queue2 QoS is .userInitiated") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .unspecified, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .unspecified and queue2 QoS is .userInteractive") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .unspecified, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInteractive, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .utility and queue2 QoS is .background") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .utility, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .utility and queue2 QoS is .default") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .utility, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .utility and queue2 QoS is .unspecified") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .utility, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .utility and queue2 QoS is .utility") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .utility, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .utility and queue2 QoS is .userInitiated") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .utility, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .utility and queue2 QoS is .userInteractive") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .utility, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInteractive, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .userInitiated and queue2 QoS is .background") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInitiated, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .userInitiated and queue2 QoS is .default") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInitiated, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .userInitiated and queue2 QoS is .unspecified") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInitiated, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .userInitiated and queue2 QoS is .utility") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInitiated, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .userInitiated and queue2 QoS is .userInitiated") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInitiated, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .userInitiated and queue2 QoS is .userInteractive") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInitiated, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInteractive, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .userInteractive and queue2 QoS is .background") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInteractive, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .userInteractive and queue2 QoS is .default") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInteractive, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .userInteractive and queue2 QoS is .unspecified") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInteractive, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .userInteractive and queue2 QoS is .utility") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInteractive, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .userInteractive and queue2 QoS is .userInitiated") {

                    it("returns false") {

                        let queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInteractive, attributes: [.concurrent])
                        let queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated, attributes: [.concurrent])

                        queue1.queue.sync {
                            expect(IdentifiableDispatchQueue.currentQueueIs(queue2)) == false
                        }
                    }
                }

                context("and queue1 QoS is .userInteractive and queue2 QoS is .userInteractive") {

                    it("returns false") {

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
