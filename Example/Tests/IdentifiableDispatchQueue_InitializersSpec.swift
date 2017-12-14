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

            context("init?(queue:)") {

                var queue: DispatchQueue!

                context("when the provided queue is a global queue") {

                    context("and its QoS is .background") {

                        beforeEach {
                            queue = DispatchQueue.global(qos: .background)
                        }

                        it("returns nil") {
                            expect(IdentifiableDispatchQueue(queue: queue)).to(beNil())
                        }
                    }

                    context("and its QoS is .utility") {

                        beforeEach {
                            queue = DispatchQueue.global(qos: .utility)
                        }

                        it("returns nil") {
                            expect(IdentifiableDispatchQueue(queue: queue)).to(beNil())
                        }
                    }

                    context("and its QoS is .userInteractive") {

                        beforeEach {
                            queue = DispatchQueue.global(qos: .userInteractive)
                        }

                        it("returns nil") {
                            expect(IdentifiableDispatchQueue(queue: queue)).to(beNil())
                        }
                    }

                    context("and its QoS is .userInitiated") {

                        beforeEach {
                            queue = DispatchQueue.global(qos: .userInitiated)
                        }

                        it("returns nil") {
                            expect(IdentifiableDispatchQueue(queue: queue)).to(beNil())
                        }
                    }

                    context("and its QoS is .default") {

                        beforeEach {
                            queue = DispatchQueue.global(qos: .default)
                        }

                        it("returns nil") {
                            expect(IdentifiableDispatchQueue(queue: queue)).to(beNil())
                        }
                    }

                    context("and its QoS is .unspecified") {

                        beforeEach {
                            queue = DispatchQueue.global(qos: .unspecified)
                        }

                        it("returns nil") {
                            expect(IdentifiableDispatchQueue(queue: queue)).to(beNil())
                        }
                    }

                    context("when the provided queue is a non global concurrent queue") {

                        context("and its QoS is .background") {

                            beforeEach {
                                queue = DispatchQueue(label: "queuey.mcqueue.queue", qos: .background, attributes: [.concurrent])
                            }

                            it("does not return nil") {
                                expect(IdentifiableDispatchQueue(queue: queue)).toNot(beNil())
                            }

                            it("stores the queue as a property") {
                                expect(IdentifiableDispatchQueue(queue: queue)!.queue) == queue
                            }
                        }

                        context("and its QoS is .utility") {

                            beforeEach {
                                queue = DispatchQueue(label: "queuey.mcqueue.queue", qos: .utility, attributes: [.concurrent])
                            }

                            it("does not return nil") {
                                expect(IdentifiableDispatchQueue(queue: queue)).toNot(beNil())
                            }

                            it("stores the queue as a property") {
                                expect(IdentifiableDispatchQueue(queue: queue)!.queue) == queue
                            }
                        }

                        context("and its QoS is .userInteractive") {

                            beforeEach {
                                queue = DispatchQueue(label: "queuey.mcqueue.queue", qos: .userInteractive, attributes: [.concurrent])
                            }

                            it("does not return nil") {
                                expect(IdentifiableDispatchQueue(queue: queue)).toNot(beNil())
                            }

                            it("stores the queue as a property") {
                                expect(IdentifiableDispatchQueue(queue: queue)!.queue) == queue
                            }
                        }

                        context("and its QoS is .userInitiated") {

                            beforeEach {
                                queue = DispatchQueue(label: "queuey.mcqueue.queue", qos: .userInitiated, attributes: [.concurrent])
                            }

                            it("does not return nil") {
                                expect(IdentifiableDispatchQueue(queue: queue)).toNot(beNil())
                            }

                            it("stores the queue as a property") {
                                expect(IdentifiableDispatchQueue(queue: queue)!.queue) == queue
                            }
                        }

                        context("and its QoS is .default") {

                            beforeEach {
                                queue = DispatchQueue(label: "queuey.mcqueue.queue", qos: .default, attributes: [.concurrent])
                            }

                            it("does not return nil") {
                                expect(IdentifiableDispatchQueue(queue: queue)).toNot(beNil())
                            }

                            it("stores the queue as a property") {
                                expect(IdentifiableDispatchQueue(queue: queue)!.queue) == queue
                            }
                        }

                        context("and its QoS is .unspecified") {

                            beforeEach {
                                queue = DispatchQueue(label: "queuey.mcqueue.queue", qos: .unspecified, attributes: [.concurrent])
                            }

                            it("does not return nil") {
                                expect(IdentifiableDispatchQueue(queue: queue)).toNot(beNil())
                            }

                            it("stores the queue as a property") {
                                expect(IdentifiableDispatchQueue(queue: queue)!.queue) == queue
                            }
                        }
                    }

                    context("when the provided queue is a serial queue") {

                        context("and its QoS is .background") {

                            beforeEach {
                                queue = DispatchQueue(label: "queuey.mcqueue.queue", qos: .background)
                            }

                            it("does not return nil") {
                                expect(IdentifiableDispatchQueue(queue: queue)).toNot(beNil())
                            }

                            it("stores the queue as a property") {
                                expect(IdentifiableDispatchQueue(queue: queue)!.queue) == queue
                            }
                        }

                        context("and its QoS is .utility") {

                            beforeEach {
                                queue = DispatchQueue(label: "queuey.mcqueue.queue", qos: .utility)
                            }

                            it("does not return nil") {
                                expect(IdentifiableDispatchQueue(queue: queue)).toNot(beNil())
                            }

                            it("stores the queue as a property") {
                                expect(IdentifiableDispatchQueue(queue: queue)!.queue) == queue
                            }
                        }

                        context("and its QoS is .userInteractive") {

                            beforeEach {
                                queue = DispatchQueue(label: "queuey.mcqueue.queue", qos: .userInteractive)
                            }

                            it("does not return nil") {
                                expect(IdentifiableDispatchQueue(queue: queue)).toNot(beNil())
                            }

                            it("stores the queue as a property") {
                                expect(IdentifiableDispatchQueue(queue: queue)!.queue) == queue
                            }
                        }

                        context("and its QoS is .userInitiated") {

                            beforeEach {
                                queue = DispatchQueue(label: "queuey.mcqueue.queue", qos: .userInitiated)
                            }

                            it("does not return nil") {
                                expect(IdentifiableDispatchQueue(queue: queue)).toNot(beNil())
                            }

                            it("stores the queue as a property") {
                                expect(IdentifiableDispatchQueue(queue: queue)!.queue) == queue
                            }
                        }

                        context("and its QoS is .default") {

                            beforeEach {
                                queue = DispatchQueue(label: "queuey.mcqueue.queue", qos: .default)
                            }

                            it("does not return nil") {
                                expect(IdentifiableDispatchQueue(queue: queue)).toNot(beNil())
                            }

                            it("stores the queue as a property") {
                                expect(IdentifiableDispatchQueue(queue: queue)!.queue) == queue
                            }
                        }

                        context("and its QoS is .unspecified") {

                            beforeEach {
                                queue = DispatchQueue(label: "queuey.mcqueue.queue", qos: .unspecified)
                            }

                            it("does not return nil") {
                                expect(IdentifiableDispatchQueue(queue: queue)).toNot(beNil())
                            }

                            it("stores the queue as a property") {
                                expect(IdentifiableDispatchQueue(queue: queue)!.queue) == queue
                            }
                        }
                    }
                }
            }
        }
    }
}
