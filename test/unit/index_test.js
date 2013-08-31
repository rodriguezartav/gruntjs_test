(function() {
  var index, should;

  should = require("should");

  index = require("../../javascript/single/index");

  describe("Basic Test", function() {
    return it("should respond ok", function() {
      return index.testOk().should.equal("ok");
    });
  });

}).call(this);
