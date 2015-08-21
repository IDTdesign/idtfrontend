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
Open [http://localhost:7777/]()

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

## Publishing

Before first publishing run this command in GIT console  
`git remote add deploy https://login:password@github.com/IDTdesign/idtfrontend.git` 

Where *login* and *password* is your Github credentials.

Then run `docpad deploy-ghpages --env static` — publish to [http://IDTdesign.github.io/idtfrontend]()

More info http://paulradzkov.com/2014/deploy_docpad_site_to_github_pages/

## License

Copyright &copy; 2014 IDT Corp
