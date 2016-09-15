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
      mouseevent "mouseenter",env.$els.buttonhover, ->
        env.$refs.hover.opened.should.be.true
        mouseevent "click",env.$els.buttonhoverinner, ->
          env.$refs.hover.opened.should.be.true
          mouseevent "mouseleave",env.$els.buttonhover, ->
            env.$refs.hover.opened.should.be.false
            done()



    it "should work on hover / close-on-click", (done) ->
      mouseevent "mouseenter",env.$els.buttonhovercoc, ->
        env.$refs.hovercoc.opened.should.be.true
        mouseevent "click",env.$els.buttonhovercocinner, ->
          env.$refs.hovercoc.opened.should.be.false
          done()

    it "should work on click", (done) ->
      mouseevent "mouseenter",env.$els.buttonclick, ->
        env.$refs.click.opened.should.be.false
        mouseevent "click",env.$els.buttonclick, ->
          env.$refs.click.opened.should.be.true
          mouseevent "click",env.$els.buttonclickinner, ->
            env.$refs.click.opened.should.be.true
            mouseevent "mouseleave",env.$els.buttonclick, ->
              env.$refs.click.opened.should.be.true
              mouseevent "click",env.$els.buttonclick, ->
                env.$refs.click.opened.should.be.false
                done()

    it "should dismiss on outside click", (done) ->
      mouseevent "click",env.$els.buttonclick, ->
        env.$refs.click.opened.should.be.true
        mouseevent "click",document.documentElement, ->
          env.$refs.click.opened.should.be.false
          done()

    it "should work with not-dismissable", (done) ->
      mouseevent "click",env.$els.buttonclicknd, ->
        env.$refs.clicknd.opened.should.be.true
        mouseevent "click",document.documentElement, ->
          env.$refs.clicknd.opened.should.be.true
          mouseevent "click",env.$els.buttonclicknd, ->
            env.$refs.clicknd.opened.should.be.false
            done()

    it "should work on click / close-on-click", (done) ->
      mouseevent "mouseenter",env.$els.buttonclickcoc, ->
        env.$refs.clickcoc.opened.should.be.false
        mouseevent "click",env.$els.buttonclickcoc, ->
          env.$refs.clickcoc.opened.should.be.true
          mouseevent "click",env.$els.buttonclickcocinner, ->
            env.$refs.clickcoc.opened.should.be.false
            done()
