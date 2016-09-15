<template lang="pug">
.container
  fab(style="bottom:20px;right:20px",v-ref:hover)
    button(slot="fab" v-el:buttonhover) hover
    li
      button(v-el:buttonhoverinner) 1
    li
      button 2
  fab(style="bottom:20px;right:150px",close-on-click,v-ref:hovercoc)
    button(slot="fab" v-el:buttonhovercoc) hover / close-on-click
    li
      button(v-el:buttonhovercocinner) 1
    li
      button 2
  fab(style="bottom:100px;right:20px",click-to-toggle,v-ref:click)
    button(slot="fab" v-el:buttonclick) click
    li
      button(v-el:buttonclickinner) 1
    li
      button 2
  fab(style="bottom:100px;right:150px",click-to-toggle,not-dismissable,v-ref:clicknd)
    button(slot="fab" v-el:buttonclicknd) click / not dismissable
    li
      button(v-el:buttonclickndinner) 1
    li
      button 2
  fab(style="bottom:20px;right:350px",click-to-toggle,close-on-click,v-ref:clickcoc)
    button(slot="fab" v-el:buttonclickcoc) click / close-on-click
    li
      button(v-el:buttonclickcocinner) 1
    li
      button 2
  a(href="https://github.com/vue-comps/vue-comps-dropdown/blob/master/dev/basic.vue") source
</template>

<script lang="coffee">
module.exports =
  components:
    "fab" : require "../src/fixed-action-button.vue"

</script>
