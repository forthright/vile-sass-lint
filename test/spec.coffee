mimus = require "mimus"
path = require "path"
sass_lint = mimus.require "./../lib", __dirname, []
chai = require "./helpers/sinon_chai"
util = require "./helpers/util"
vile = mimus.get sass_lint, "vile"
expect = chai.expect

sass_cli = "sass-lint"

# TODO: write integration tests for spawn -> cli
# TODO: don't use setTimeout everywhere (for proper exception throwing)

describe "sass-lint", ->
  afterEach mimus.reset
  after mimus.restore
  beforeEach ->
    mimus.stub vile, "spawn"
    util.setup vile

  describe "#punish", ->
    it "converts sass-lint json to issues", ->
      sass_lint
        .punish {}
        .should.eventually.eql util.issues

    it "handles an empty response", ->
      vile.spawn.reset()
      vile.spawn.returns new Promise (resolve) -> resolve ""

      sass_lint
        .punish {}
        .should.eventually.eql []

    it "calls sass-lint in the cwd", (done) ->
      sass_lint
        .punish {}
        .should.be.fulfilled.notify ->
          setTimeout ->
            vile.spawn.should.have.been
              .calledWith sass_cli, args: [
                              "-f"
                              "json"
                              "-v"
                              "-q"
                            ]
            done()
      return

    describe "with a custom config path", ->
      it "passes the path as a sass-lint cli option", (done) ->
        config_path = ".custom-config.yml"

        sass_lint
          .punish config: config_path
          .should.be.fulfilled.notify ->
            setTimeout ->
              vile.spawn.should.have.been
                .calledWith sass_cli, args: [
                              "-f"
                              "json"
                              "-v"
                              "-q"
                              "-c"
                              config_path
                            ]
              done()
        return

    describe "with a custom allow list", ->
      it "passes the list as sass-lint cli args", (done) ->
        sass_lint
          .punish allow: ["a", "b"]
          .should.be.fulfilled.notify ->
            setTimeout ->
              vile.spawn.should.have.been
                .calledWith sass_cli, args: [
                              "-f"
                              "json"
                              "-v"
                              "-q"
                              "a"
                              "b"
                            ]
              done()
        return
