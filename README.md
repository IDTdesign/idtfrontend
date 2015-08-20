# idtfrontend

Front-end documentation, built with [DocPad](http://docpad.org).


## Dependencies

* [node.js](http://nodejs.org/)
* [npm](https://npmjs.org)
* `npm install grunt-cli -g`

## First run

Clone the repository.

``` bash
$ npm install
$ bower install
$ docpad run
```
Open http://localhost:7777/

## Development

### Prepare sprites

``` bash
grunt makesprites

```
to create sprite for icons

### Image Optimization

``` bash
grunt optimizeimg
```

to minify image assets

### Copy css files to main project

``` bash
grunt production
```
to compile, minify and copy css files to core project

## License

Copyright &copy; 2014 IDT Corp
