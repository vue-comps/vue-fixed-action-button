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
  <li><button>Action 1</button></li>
  <li><button>Action 2</button></li>
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
is-opened | Boolean | false | (two-way) set to open / close
transition | String | "fab" | name of a vue transition. [Detailed description](#transition)

#### Events
Name |  description
---:| ---
before-enter | will be called before open animation
after-enter |  will be called when opened
before-leave |  will be called before close animation
after-leave |  will be called when closed
toggled(isOpened:Boolean) | emitted when gets opened or closed. Alternative to use two-way `is-opened` prop

#### Transition

You can provide a vue transition like this:
```js
Vue.transition("fade",{
  // your transition
})
// or in the instance:
transitions: {
  fade: {
    // your transition
  }
}
// usage:
template: "<fab transition='fade'></fab>"
```


## Changelog
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
