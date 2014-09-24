# idtfrontend

Front-end documentation, built with [DocPad](http://docpad.org).


## Dependencies

* [node.js](http://nodejs.org/)
* [npm](https://npmjs.org)


## First run

Clone the repository.

``` bash
$ npm install
$ bower install
$ grunt
```
Open http://localhost:7777/docs/

## Development

### Prepare sprites

``` bash
grunt makesprites

```
to create sprite for icons

### Local compiling

``` bash
docpad run --env static
grunt development

```

Open console and run `docpad run --env static` to compile site.
While running docpad open another console instance and run `grunt development` to create less files and to do other postprocessing.

## License

Copyright &copy; 2014 IDT Corp
