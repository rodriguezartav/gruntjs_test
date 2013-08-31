should = require("should")

index = require "../../javascript/single/index" 

describe "Basic Test", ->

  it "should respond ok" , ->
    index.testOk().should.equal "ok" 