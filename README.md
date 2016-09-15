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
transition | String | - | name of vue transition

#### Events
Name |  description
---:| ---
before-open | will be called before open animation
opened |  will be called when opened
before-close |  will be called before close animation
closed |  will be called when closed

When a transition is given, it must emit the `opened` and `closed` events.

# Development
Clone repository.
```sh
npm install
npm run dev
```
Browse to `http://localhost:8080/`.

## Changelog
- 1.0.0  
moved transition to `vue-transitions`  
changed element from `span` to `a`  

## License
Copyright (c) 2016 Paul Pflugradt
Licensed under the MIT license.
