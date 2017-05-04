# DEPRECATED

# vue-fixed-action-button

a simple fixed-action-button.

### [Demo](https://vue-comps.github.io/vue-fixed-action-button)

# Install

```sh
npm install --save-dev vue-fixed-action-button
```
or include `build/bundle.js`.

## Usage
```coffee
# in your component
components:
  "fab": require("vue-fixed-action-button")
# or, when using bundle.js
components:
  "fab": window.vueComps.fab
```
```html
<fab style="bottom:20px;right:20px">
  <button slot="fab">hover me</button>
  <li key=1><button>Action 1</button></li>
  <li key=2><button>Action 2</button></li>
</fab>
```
see [`dev/`](https://github.com/vue-comps/vue-fixed-action-button/tree/master/dev) for examples.

#### Props
Name | type | default | description
---:| --- | ---| ---
class | Array or Object | ["fixed-action-btn"] | class of the `div`
not-dismissable| Boolean | false | will be not close on click outside of menu (only with click-to-toggle)
close-on-click | Boolean | false | will be closed on click inside of menu
click-to-toggle | Boolean | false | opens on click instead of hover
is-opened | Boolean | false | set to open / close
transition | String | "fab-transition" | name of a [reusable vue transition-group](http://vuejs.org/guide/transitions.html#Reusable-Transitions)
transition-name | String | "fab" | name of a css transition

#### Events
Name |  description
---:| ---
toggled(isOpened:Boolean) | emitted when gets opened or closed.

#### Transition
You can provide a default js transition like this:
```js
// must be a transition group
// be sure to pass down the context data
Vue.component('fab-transition', {
  functional: true
  render: function(h,context) {
    context.data.attrs.name = "fade"
    context.data.props = {css: false}
    context.data.on = {
      enter: ...
    }
    return h "transition-group",context.data,context.children)
  }
})
```

## Changelog
- 2.0.0  
now compatible with vue 2.0.0  
changed way of using own transition  
every item needs a key now  

- 1.2.1  
cleanup  

- 1.2.0  
added toggled event  
set default transition  

- 1.1.0  
moved transition to `vue-transitions` properly
events are renamed after vue transitions  

- 1.0.0  
moved transition to `vue-transitions`  
changed element from `span` to `a`  

# Development
Clone repository.
```sh
npm install
npm run dev
```
Browse to `http://localhost:8080/`.

## License
Copyright (c) 2016 Paul Pflugradt
Licensed under the MIT license.
