// out: ..
<template lang="pug">
div(
    :style="computedStyle",
    @click.prevent="onInnerClick",
    @mouseenter="onHover",
    @mouseleave="onUnhover",
    :class="computedClass"
    )
  ul(
    v-if="opened",
    v-el:fab,
    :transition="cTransition",
    :style="fabStyle"
    )
    slot
  a(@click="onFabClick")
    slot(name="fab")
</template>

<script lang="coffee">
module.exports =

  mixins:[
    require("vue-mixins/onceDocument")
    require("vue-mixins/isOpened")
    require("vue-mixins/style")
    require("vue-mixins/class")
    require("vue-mixins/transition")
  ]


  props:
    class:
      default: -> ["fixed-action-btn"]
    style:
      default: -> []
    closeOnClick:
      type: Boolean
      default: false
    clickToToggle:
      type: Boolean
      default: false
    notDismissable:
      type: Boolean
      default: false
    transition:
      type: String
      default: "fab"

  computed:
    mergeStyle: ->
      position:"fixed"
      userSelect: "none"
    fabStyle: -> []

  methods:
    onHover: ->
      @open() unless @clickToToggle

    onUnhover: ->
      @close() unless @clickToToggle

    onFabClick: (e) ->
      if @clickToToggle and not e.defaultPrevented
        e.preventDefault()
        @toggle()
        @clickFab = true
        setTimeout (=>@clickFab = false),10

    onInnerClick: ->
      @setClickInside()
      @close() if @closeOnClick and not @clickFab

    setClickInside: ->
      @clickInside = true
      setTimeout (=>@clickInside = false),10

    show: ->
      return if @opened
      @setOpened()
      @$nextTick =>
        if not @notDismissable and @clickToToggle
          @removeDocumentClickListener?()
          @removeDocumentClickListener = @onceDocument "click", =>
            @hide() unless @clickInside
            return !@clickInside #should remove?
          @removeDocumentKeyupListener?()
          @removeDocumentKeyupListener = @onceDocument "keyup", (e) =>
            unless e.defaultPrevented
              if e.which == 27
                e.preventDefault()
                @hide()
                return true
            return false

    hide: ->
      return unless @opened
      @removeDocumentClickListener?()
      @removeDocumentClickListener = null
      @removeDocumentKeyupListener?()
      @removeDocumentKeyupListener = null
      @setClosed()

    open: ->
      @show()

    close: ->
      @hide()

    toggle:  ->
      if @opened
        @close()
      else
        @open()


  dettached: ->
    @removeDocumentClickListener?()
    @removeDocumentKeyupListener?()
</script>
