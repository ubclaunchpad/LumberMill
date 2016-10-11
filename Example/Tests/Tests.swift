// https://github.com/Quick/Quick

import Quick
import Nimble
import LumberMill

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("LumberMill Tests") {

            it("can log at info level") {
                let log = LumberMill()
                log.debug("This is a debug statement")
            }
            
        }
    }
}


