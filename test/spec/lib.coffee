path = require "path"
lib = require "./../../lib"
chai = require "./../helpers/sinon_chai"
util = require "./../helpers/util"
expect = chai.expect

CWD = process.cwd()
FIXTURES = path.join __dirname, "..", "fixtures"

describe "sass-lint", ->
  beforeEach ->
    process.chdir FIXTURES

  afterEach ->
    process.chdir CWD

  describe "#punish", ->
    it "lints sass and scss files", ->
      lib
        .punish()
        .should.eventually.eql util.issues

    describe "allow", ->
      it "allows only some files", ->
        config = allow: [ "test.sass" ]

        lib.punish(config).should.become util.issues_allow

    describe "ignore", ->
      describe "when everything is ignored", ->
        it "returns an empty array", ->
          config = ignore: [ "*" ]
          lib.punish(config).should.become []

      it "ignores some files", ->
        config = ignore: [ "test.sass", "test.scss" ]
        lib.punish(config).should.become util.issues_ignore

    describe "custom config file", ->
      it "can be set via config", ->
        config = config: ".sass-lint-custom.yml"
        lib.punish(config).should.become util.issues_custom_conf
