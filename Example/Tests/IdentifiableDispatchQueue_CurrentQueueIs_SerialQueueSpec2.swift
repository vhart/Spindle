import Quick
import Nimble
import Spindle

class IdentifiableDispatchQueue_SerialQueueSpec2: QuickSpec {
    override func spec() {
        describe("IdentifiableDispatchQueue.currentQueueIs(_:)") {
            var queue1: IdentifiableDispatchQueue!
            var queue2: IdentifiableDispatchQueue!

            context("when queue1 is a serial queue") {

                context("and the qos is .background") {

                    beforeEach {
                        queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .background)
                    }

                    context("and queue2 is a serial queue") {

                        context("and queue 2 qos is .background") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .default") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .unspecified") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .utility") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .userInitiated") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .userInteractive") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInteractive)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }
                    }
                }

                context("and the qos is .default") {

                    beforeEach {
                        queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .default)
                    }

                    context("and queue2 is a serial queue") {

                        context("and queue 2 qos is .background") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .default") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .unspecified") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .utility") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .userInitiated") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .userInteractive") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInteractive)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }
                    }
                }

                context("and the qos is .unspecified") {

                    beforeEach {
                        queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .unspecified)
                    }

                    context("and queue2 is a serial queue") {

                        context("and queue 2 qos is .background") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .default") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .unspecified") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .utility") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .userInitiated") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .userInteractive") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInteractive)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }
                    }
                }

                context("and the qos is .utility") {

                    beforeEach {
                        queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .utility)
                    }

                    context("and queue2 is a serial queue") {

                        context("and queue 2 qos is .background") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .default") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .unspecified") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .utility") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .userInitiated") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .userInteractive") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInteractive)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }
                    }
                }

                context("and the qos is .userInitiated") {

                    beforeEach {
                        queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInitiated)
                    }

                    context("and queue2 is a serial queue") {

                        context("and queue 2 qos is .background") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .default") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .unspecified") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .utility") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .userInitiated") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .userInteractive") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInteractive)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }
                    }
                }

                context("and the qos is .userInteractive") {

                    beforeEach {
                        queue1 = IdentifiableDispatchQueue(label: "queue1", qos: .userInteractive)
                    }

                    context("and queue2 is a serial queue") {

                        context("and queue 2 qos is .background") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .background)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .default") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .default)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .unspecified") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .unspecified)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .utility") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .utility)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .userInitiated") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInitiated)
                            }

                            it("returns false") {
                                var isQueue2 = true

                                queue1.queue.sync {
                                    isQueue2 = IdentifiableDispatchQueue.currentQueueIs(queue2)
                                }

                                expect(isQueue2) == false
                            }
                        }

                        context("and queue 2 qos is .userInteractive") {

                            beforeEach {
                                queue2 = IdentifiableDispatchQueue(label: "queue2", qos: .userInteractive)
                            }

                            it("returns false") {
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
}
