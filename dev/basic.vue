<template lang="pug">
.container
  fab(style="bottom:20px;right:20px",ref="hover")
    button(slot="fab" ref="buttonhover") hover
    li(key=1)
      button(ref="buttonhoverinner") 1
    li(key=2)
      button 2
  fab(style="bottom:20px;right:150px",close-on-click,ref="hovercoc")
    button(slot="fab" ref="buttonhovercoc") hover / close-on-click
    li(key=1)
      button(ref="buttonhovercocinner") 1
    li(key=2)
      button 2
  fab(style="bottom:100px;right:20px",click-to-toggle,ref="click")
    button(slot="fab" ref="buttonclick") click
    li(key=1)
      button(ref="buttonclickinner") 1
    li(key=2)
      button 2
  fab(style="bottom:100px;right:150px",click-to-toggle,not-dismissable,ref="clicknd")
    button(slot="fab" ref="buttonclicknd") click / not dismissable
    li(key=1)
      button(ref="buttonclickndinner") 1
    li(key=2)
      button 2
  fab(style="bottom:20px;right:350px",click-to-toggle,close-on-click,ref="clickcoc")
    button(slot="fab" ref="buttonclickcoc") click / close-on-click
    li(key=1)
      button(ref="buttonclickcocinner") 1
    li(key=2)
      button 2
  a(href="https://github.com/vue-comps/vue-comps-dropdown/blob/master/dev/basic.vue") source
</template>

<script lang="coffee">
module.exports =
  components:
    "fab" : require "../src/fixed-action-button.vue"

</script>
