env = null
mouseevent = (name,el,cb) ->
  event = new MouseEvent name,
    'view': window
    'bubbles': true
    'cancelable': true
  el.dispatchEvent(event)
  setTimeout cb, 20
describe "fixed-action-button", ->

  describe "basic env", ->

    before ->
      env = loadComp(require("../dev/basic.vue"))

    after ->
      #unloadComp(env)

    it "should work on hover", (done) ->
      mouseevent "mouseenter",env.$refs.buttonhover, ->
        env.$refs.hover.opened.should.be.true
        mouseevent "click",env.$refs.buttonhoverinner, ->
          env.$refs.hover.opened.should.be.true
          mouseevent "mouseleave",env.$refs.buttonhover, ->
            env.$refs.hover.opened.should.be.false
            done()



    it "should work on hover / close-on-click", (done) ->
      mouseevent "mouseenter",env.$refs.buttonhovercoc, ->
        env.$refs.hovercoc.opened.should.be.true
        mouseevent "click",env.$refs.buttonhovercocinner, ->
          env.$refs.hovercoc.opened.should.be.false
          done()

    it "should work on click", (done) ->
      mouseevent "mouseenter",env.$refs.buttonclick, ->
        should.not.exist env.$refs.click.opened
        mouseevent "click",env.$refs.buttonclick, ->
          env.$refs.click.opened.should.be.true
          mouseevent "click",env.$refs.buttonclickinner, ->
            env.$refs.click.opened.should.be.true
            mouseevent "mouseleave",env.$refs.buttonclick, ->
              env.$refs.click.opened.should.be.true
              mouseevent "click",env.$refs.buttonclick, ->
                env.$refs.click.opened.should.be.false
                done()

    it "should dismiss on outside click", (done) ->
      mouseevent "click",env.$refs.buttonclick, ->
        env.$refs.click.opened.should.be.true
        mouseevent "click",document.documentElement, ->
          env.$refs.click.opened.should.be.false
          done()

    it "should work with not-dismissable", (done) ->
      mouseevent "click",env.$refs.buttonclicknd, ->
        env.$refs.clicknd.opened.should.be.true
        mouseevent "click",document.documentElement, ->
          env.$refs.clicknd.opened.should.be.true
          mouseevent "click",env.$refs.buttonclicknd, ->
            env.$refs.clicknd.opened.should.be.false
            done()

    it "should work on click / close-on-click", (done) ->
      mouseevent "mouseenter",env.$refs.buttonclickcoc, ->
        should.not.exist env.$refs.clickcoc.opened
        mouseevent "click",env.$refs.buttonclickcoc, ->
          env.$refs.clickcoc.opened.should.be.true
          mouseevent "click",env.$refs.buttonclickcocinner, ->
            env.$refs.clickcoc.opened.should.be.false
            done()
