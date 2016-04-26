// out: ..
<template lang="jade">
div(
    :style="{position:'fixed'}",
    @click.prevent="onInnerClick",
    @mouseenter="onHover",
    @mouseleave="onUnhover",
    :class="class"
    )
  ul(v-if="opened",v-el:fab)
    slot No content
  span(@click="onFabClick | notPrevented")
    slot(name="fab")
</template>

<script lang="coffee">
module.exports =

  mixins:[
    require("vue-mixins/onceDocument")
    require("vue-mixins/isOpened")
  ]

  filters:
    notPrevented: require("vue-filters/notPrevented")

  props:
    "class":
      default: -> ["fixed-action-btn"]
    "closeOnClick":
      type: Boolean
      defaul: false
    "clickToToggle":
      type: Boolean
      default: false
    "notDismissable":
      type: Boolean
      default: false
    "transitionIn":
      type: Function
      default: ({el,cb}) ->
        cb()
    "transitionOut":
      type: Function
      default: ({el,cb}) ->
        cb()

  data: ->
    removeDocumentClickListener: null
    clickInside: false
    clickFab: false

  methods:
    onHover: ->
      @open() unless @clickToToggle

    onUnhover: ->
      @close() unless @clickToToggle

    onFabClick: (e) ->
      if @clickToToggle
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
          @removeDocumentClickListener = @onceDocument "click", (e) =>
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
        @$emit "before-open"
        @transitionIn el:@$els.fab, cb: =>
          @$emit "opened"

    hide: ->
      return unless @opened
      @removeDocumentClickListener?()
      @removeDocumentClickListener = null
      @removeDocumentKeyupListener?()
      @removeDocumentKeyupListener = null
      @$emit "before-close"
      @transitionOut el:@$els.fab, cb: =>
        @setClosed()
        @$emit "closed"

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

  events:
    close: ->
      @close()
      return true
</script>
