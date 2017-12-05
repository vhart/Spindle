import Quick
import Nimble
import Spindle

class IdentifiableDispatchQueue_CurrentQueueIs_GlobalQueueComparisonSpec: QuickSpec {
    override func spec() {
        describe("IdentifiableDispatchQueue.currentQueueIs(_:)") {

            context("when comparing a non global backed queue with a global queue") {

                context("and the qos is .background") {
                    let q1 = IdentifiableDispatchQueue(label: "q1", qos: .background, attributes: [.concurrent])
                    let q2 = IdentifiableDispatchQueue(queue: DispatchQueue.global(qos: .background))

                    it("returns true") {
                        var isOnQ2 = false

                        q1.queue.sync {
                            isOnQ2 = IdentifiableDispatchQueue.currentQueueIs(q2)
                        }

                        expect(isOnQ2) == true
                    }
                }

                context("and the qos is .default") {
                    let q1 = IdentifiableDispatchQueue(label: "q1", qos: .default, attributes: [.concurrent])
                    let q2 = IdentifiableDispatchQueue(queue: DispatchQueue.global(qos: .default))

                    it("returns true") {
                        var isOnQ2 = false

                        q1.queue.sync {
                            isOnQ2 = IdentifiableDispatchQueue.currentQueueIs(q2)
                        }

                        expect(isOnQ2) == true
                    }
                }

                context("and the qos is .unspecified") {
                    let q1 = IdentifiableDispatchQueue(label: "q1", qos: .unspecified, attributes: [.concurrent])
                    let q2 = IdentifiableDispatchQueue(queue: DispatchQueue.global(qos: .unspecified))

                    it("returns true") {
                        var isOnQ2 = false

                        q1.queue.sync {
                            isOnQ2 = IdentifiableDispatchQueue.currentQueueIs(q2)
                        }

                        expect(isOnQ2) == true
                    }
                }

                context("and the qos is .utility") {
                    let q1 = IdentifiableDispatchQueue(label: "q1", qos: .utility, attributes: [.concurrent])
                    let q2 = IdentifiableDispatchQueue(queue: DispatchQueue.global(qos: .utility))

                    it("returns true") {
                        var isOnQ2 = false

                        q1.queue.sync {
                            isOnQ2 = IdentifiableDispatchQueue.currentQueueIs(q2)
                        }

                        expect(isOnQ2) == true
                    }
                }

                context("and the qos is .userInitiated") {
                    let q1 = IdentifiableDispatchQueue(label: "q1", qos: .userInitiated, attributes: [.concurrent])
                    let q2 = IdentifiableDispatchQueue(queue: DispatchQueue.global(qos: .userInitiated))

                    it("returns true") {
                        var isOnQ2 = false

                        q1.queue.sync {
                            isOnQ2 = IdentifiableDispatchQueue.currentQueueIs(q2)
                        }

                        expect(isOnQ2) == true
                    }
                }

                context("and the qos is .userInteractive") {
                    let q1 = IdentifiableDispatchQueue(label: "q1", qos: .userInteractive, attributes: [.concurrent])
                    let q2 = IdentifiableDispatchQueue(queue: DispatchQueue.global(qos: .userInteractive))

                    it("returns true") {
                        var isOnQ2 = false

                        q1.queue.sync {
                            isOnQ2 = IdentifiableDispatchQueue.currentQueueIs(q2)
                        }

                        expect(isOnQ2) == true
                    }
                }
            }

            context("when comparing a global queue with a non global backed queue of the same QoS") {

                context("and the qos is .background") {
                    let q1 = IdentifiableDispatchQueue(queue: DispatchQueue.global(qos: .background))
                    let q2 = IdentifiableDispatchQueue(label: "q2", qos: .background, attributes: [.concurrent])

                    it("returns true") {
                        var isOnQ2 = true

                        q1.queue.sync {
                            isOnQ2 = IdentifiableDispatchQueue.currentQueueIs(q2)
                        }

                        expect(isOnQ2) == false
                    }
                }

                context("and the qos is .default") {
                    let q1 = IdentifiableDispatchQueue(queue: DispatchQueue.global(qos: .default))
                    let q2 = IdentifiableDispatchQueue(label: "q2", qos: .default, attributes: [.concurrent])

                    it("returns true") {
                        var isOnQ2 = true

                        q1.queue.sync {
                            isOnQ2 = IdentifiableDispatchQueue.currentQueueIs(q2)
                        }

                        expect(isOnQ2) == false
                    }
                }

                context("and the qos is .unspecified") {
                    let q1 = IdentifiableDispatchQueue(queue: DispatchQueue.global(qos: .unspecified))
                    let q2 = IdentifiableDispatchQueue(label: "q2", qos: .unspecified, attributes: [.concurrent])

                    it("returns true") {
                        var isOnQ2 = true

                        q1.queue.sync {
                            isOnQ2 = IdentifiableDispatchQueue.currentQueueIs(q2)
                        }

                        expect(isOnQ2) == false
                    }
                }

                context("and the qos is .utility") {
                    let q1 = IdentifiableDispatchQueue(queue: DispatchQueue.global(qos: .utility))
                    let q2 = IdentifiableDispatchQueue(label: "q2", qos: .utility, attributes: [.concurrent])

                    it("returns true") {
                        var isOnQ2 = true

                        q1.queue.sync {
                            isOnQ2 = IdentifiableDispatchQueue.currentQueueIs(q2)
                        }

                        expect(isOnQ2) == false
                    }
                }

                context("and the qos is .userInitiated") {
                    let q1 = IdentifiableDispatchQueue(queue: DispatchQueue.global(qos: .userInitiated))
                    let q2 = IdentifiableDispatchQueue(label: "q2", qos: .userInitiated, attributes: [.concurrent])

                    it("returns true") {
                        var isOnQ2 = true

                        q1.queue.sync {
                            isOnQ2 = IdentifiableDispatchQueue.currentQueueIs(q2)
                        }

                        expect(isOnQ2) == false
                    }
                }

                context("and the qos is .userInteractive") {
                    let q1 = IdentifiableDispatchQueue(queue: DispatchQueue.global(qos: .userInteractive))
                    let q2 = IdentifiableDispatchQueue(label: "q2", qos: .userInteractive, attributes: [.concurrent])

                    it("returns true") {
                        var isOnQ2 = true

                        q1.queue.sync {
                            isOnQ2 = IdentifiableDispatchQueue.currentQueueIs(q2)
                        }

                        expect(isOnQ2) == false
                    }
                }
            }
        }
    }
}
