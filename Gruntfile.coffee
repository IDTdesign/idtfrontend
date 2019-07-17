# Grunt Configuration
# http://gruntjs.com/getting-started#an-example-gruntfile

module.exports = (grunt) ->

# Initiate the Grunt configuration.
  grunt.initConfig

# Allow use of the package.json data.
    pkg: grunt.file.readJSON('package.json')

# docpad variables
    docpad:
      files: ['./src/**/*.*']
      out: ['out']

# concat files
    concat:
      bootstrap:
        src: [
          'bower_components/bootstrap-less/js/transition.js',
          'bower_components/bootstrap-less/js/alert.js',
          'bower_components/bootstrap-less/js/button.js',
          'bower_components/bootstrap-less/js/carousel.js',
          'bower_components/bootstrap-less/js/collapse.js',
          'bower_components/bootstrap-less/js/dropdown.js',
          'bower_components/bootstrap-less/js/modal.js',
          'bower_components/bootstrap-less/js/tooltip.js',
          'bower_components/bootstrap-less/js/popover.js',
          'bower_components/bootstrap-less/js/scrollspy.js',
          'bower_components/bootstrap-less/js/tab.js',
          'bower_components/bootstrap-less/js/affix.js',
          'bower_components/jasny-bootstrap/js/offcanvas.js',
          'bower_components/jasny-bootstrap/js/inputmask.js',
          'bower_components/bootstrapValidator/dist/js/bootstrapValidator.js'
        ]
        dest: 'out/vendor/bootstrap/js/bootstrap.js'

# Use Uglify to minify files.
    uglify:
      options:
        preserveComments: 'some'
      bootstrap:
        src: '<%= concat.bootstrap.dest %>'
        dest: 'out/vendor/bootstrap/js/bootstrap.min.js'
# modernizr:
# 	src: 'bower_components/modernizr/modernizr.js'
# 	dest: 'out/vendor/modernizr/modernizr.min.js'
      sticky:
        src: 'bower_components/sticky/jquery.sticky.js'
        dest: 'out/vendor/sticky/jquery.sticky.min.js'

# compile less and generate map files
    less:
      compileBoss:
        options:
          compress: true
          strictMath: true
          sourceMap: true
          outputSourceFiles: true
          sourceMapURL: 'bossrevolution.css.map'
          sourceMapFilename: 'out/styles/bossrevolution_v2.css.map'
        files:
          'out/styles/bossrevolution_v2.css': 'src/raw/styles/bossrevolution.css.less'
      compileBossLanding:
        options:
          compress: true
          strictMath: true
          sourceMap: true
          outputSourceFiles: true
          sourceMapURL: 'bossrevolution-landing.css.map'
          sourceMapFilename: 'out/styles/bossrevolution-landing.css.map'
        files:
          'out/styles/bossrevolution-landing.css': 'src/raw/styles/bossrevolution-landing.css.less'
      compileBootstrap:
        options:
          compress: true
          strictMath: true
          sourceMap: true
          outputSourceFiles: true
          sourceMapURL: 'bootstrap.css.map'
          sourceMapFilename: 'out/styles/bootstrap.css.map'
        files:
          'out/styles/bootstrap.css': 'src/raw/styles/bootstrap.css.less'
      compileBootstrapLanding:
        options:
          compress: true
          strictMath: true
          sourceMap: true
          outputSourceFiles: true
          sourceMapURL: 'bootstrap.css.map'
          sourceMapFilename: 'out/styles/bootstrap-landing.css.map'
        files:
          'out/styles/bootstrap-landing.css': 'src/raw/styles/bootstrap-landing.css.less'
      compileBsTheme:
        options:
          compress: true
          strictMath: true
          sourceMap: true
          outputSourceFiles: true
          sourceMapURL: 'bootstrap-theme.css.map'
          sourceMapFilename: 'out/styles/bootstrap-theme.css.map'
        files:
          'out/styles/bootstrap-theme.css': 'src/raw/styles/bootstrap-theme.css.less'

# add vendor prefixes
    autoprefixer:
      options:
        browsers: [
          'Android 2.3',
          'Android >= 4',
          'Chrome >= 20',
          'Firefox >= 24',
          'Explorer >= 8',
          'iOS >= 6',
          'Opera >= 12',
          'Safari >= 6'
        ]
      bosssrc:
        options:
          map: true
        src: 'src/raw/styles/*.less'
      bossout:
        options:
          map: true
        src: 'out/styles/bossrevolution.css'

    modernizr:
      dist:
# [REQUIRED] Path to the build you're using for development.
        devFile: "bower_components/modernizr/modernizr.js"

# Path to save out the built file.
        outputFile: "out/vendor/modernizr/modernizr.min.js"

# Based on default settings on http://modernizr.com/download/
        extra:
          shiv: true
          printshiv: false
          load: true
          mq: true
          cssclasses: true

# Based on default settings on http://modernizr.com/download/
        extensibility:
          addtest: false
          prefixed: false
          teststyles: false
          testprops: false
          testallprops: false
          hasevents: false
          prefixes: false
          domprefixes: false
          cssclassprefix: ""

# By default, source is uglified before saving
        uglify: true

# Define any tests you want to implicitly include.
        tests: []

# By default, this task will crawl your project for references to Modernizr tests.
# Set to false to disable.
        parseFiles: true

# When parseFiles = true, this task will crawl all *.js, *.css, *.scss and *.sass files,
# except files that are in node_modules/.
# You can override this by defining a "files" array below.
        files:
          src: [
            'src/raw/**/*.less'
            'src/documents/**/*.css'
            'src/documents/**/*.js'
          ]

# This handler will be passed an array of all the test names passed to the Modernizr API, and will run after the API call has returned
# handler: function (tests) {},

# When parseFiles = true, matchCommunityTests = true will attempt to
# match user-contributed tests.
        matchCommunityTests: true

# Have custom Modernizr tests? Add paths to their location here.
        customTests: []

# rasterize all SVG files in "img" and its subdirectories to "img/png"
    svg2png:
      out:
        files: [
          cwd: 'out/img/',
          src: ['**/*.svg'],
          dest: 'out/img/'
        ]
      src:
        files: [
          cwd: 'src/raw/img/',
          src: ['**/*.svg'],
          dest: 'src/raw/img/'
        ]
      icons:
        files: [
          expand: false,
          cwd: 'src/raw/icons/svg/',
          src: ['*.svg'],
          dest: 'src/raw/icons/png/',
        ]

#create one svg from multiple files
    svgstore:
      options:
        prefix: 'i--'
#formatting:
#   indent_size: 2
        includedemo: true
      default:
        options:
          cleanup: ['fill']
        files:
          'src/raw/icons/svg-defs.svg': ['src/raw/icons/svg/*.svg']
      colored:
        files:
          'src/raw/icons/svg-defs-colored.svg': ['src/raw/icons/svg-color/*.svg']

#convert content of svg file to string
    svg2string:
      icons:
        files:
          'src/raw/icons/svg-icons_v2.js': ['src/raw/icons/svg-defs.svg', 'src/raw/icons/svg-defs-colored.svg']

# background-image svg and png sprites
    'svg-sprites':
      icons:
        options:
          spriteElementPath: 'src/raw/icons/svg'
          spritePath: 'src/raw/icons/icons-sprite.svg'
          cssPath: 'src/raw/styles/_sprite.less'
          previewPath: 'src/raw/icons/'
          prefix: 'i-'
          cssSvgPrefix: '.svg '
          cssPngPrefix: '.no-svg '
          sizes:
            '': 33
            xsmall: 16
            small: 25
            large: 51
          refSize: 33
          template: 'src/raw/icons/templates/stylesheet.hbs'

    replace:
      sprites:
        src: 'src/raw/styles/_sprite.less'
        dest: 'src/raw/styles/_sprite.less'
        replacements: [
          {
            from: '../../raw/icons/',
            to: '../icons/'
          }
        ]

# optimize images if possible
    imagemin:
      out:
        options:
          optimizationLevel: 3,
        files: [
          expand: true,
          cwd: 'out/images/',
          src: ['**/*.{png,jpg,gif}'],
          dest: 'out/images/'
        ]
      src:
        options:
          optimizationLevel: 3,
        files: [
          expand: true,
          cwd: 'src/raw/img/',
          src: ['**/*.{png,jpg,jpeg,gif}'],
          dest: 'src/raw/img/'
        ]
      logo:
        options:
          optimizationLevel: 3,
        files: [
          expand: true,
          cwd: 'src/documents/docs/logo/',
          src: ['**/*.{svg,png,jpg,jpeg,gif}'],
          dest: 'src/documents/docs/logo/'
        ]

# track changes in src dir and regenerate docpad
    watch:
      src:
        files: ['<%= docpad.files %>']
        tasks: [
          'shell:docpad',
          'postprocess'
        ]
      out:
        files: ['<%= docpad.out %>/**/*']
        options:
          livereload: true
      less:
        files: ['./src/raw/styles/**/*.*']
        tasks: [
          'postprocess'
        ]

# start server
    connect:
      server:
        options:
          port: 7777
          hostname: '*'
          base: '<%= docpad.out %>'
          livereload: true
# open: true

# clean out dir
    clean:
      options:
        force: true
      out: ['<%= docpad.out %>']

    copy:
      main:
        files: [
          'out/vendor/animate.css/animate.min.css': 'bower_components/animate.css/animate.min.css',
          'out/vendor/jquery.scrollTo/jquery.scrollTo.min.js': 'bower_components/jquery.scrollTo/jquery.scrollTo.min.js',
          'out/vendor/jquery.localScroll/jquery.localScroll.min.js': 'bower_components/jquery.localScroll/jquery.localScroll.min.js',
          'out/vendor/bowser/bowser.min.js': 'bower_components/bowser/bowser.min.js',
          'out/vendor/SelectOrDie/selectordie.min.js': 'bower_components/SelectOrDie/_src/selectordie.min.js',
          'out/vendor/SelectOrDie/selectordie.css': 'bower_components/SelectOrDie/_src/selectordie.css',
          'out/vendor/alfablur/StackBlur.js': 'src/documents/scripts/StackBlur.js',
          'out/vendor/alfablur/alfablur.js': 'src/documents/scripts/alfablur.js',
          {
            cwd: 'bower_components/jqgrid',
            src: '**/*',
            dest: 'out/vendor/jqgrid',
            expand: true
          }
        ]
      manan:
        files: [
          '../BrCustomer/BrCustomerSite/Content/bootstrap_v2.css': 'out/styles/bootstrap.css'
          '../BrCustomer/BrCustomerSite/Content/bootstrap-theme_v2.css': 'out/styles/bootstrap-theme.css'
          '../BrCustomer/BrCustomerSite/Content/css/bossrevolution_v2.css': 'out/styles/bossrevolution.css'
          '../BrCustomer/BrCustomerSite/Content/css/bossrevolution_v2.css.map': 'out/styles/bossrevolution.css.map'
        ]

# generate development
    shell:
      docpad:
        options:
          stdout: true
          async: false
        command: 'docpad generate --env static'
      docpadrun:
        options:
          stdout: true
          async: true
        command: 'docpad run'
      deploy:
        options:
          stdout: true
          async: false
        command: 'docpad deploy-ghpages --env static'

  # measures the time each task takes
  require('time-grunt')(grunt);

  # Build the available Grunt tasks.
  grunt.loadNpmTasks 'grunt-shell-spawn'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-autoprefixer'
  grunt.loadNpmTasks 'grunt-newer'
  grunt.loadNpmTasks 'grunt-svg2png'
  grunt.loadNpmTasks 'grunt-svgstore'
  grunt.loadNpmTasks 'grunt-svg2string'
  grunt.loadNpmTasks 'grunt-dr-svg-sprites'
  grunt.loadNpmTasks 'grunt-text-replace'
  grunt.loadNpmTasks 'grunt-modernizr'

  # Register our Grunt tasks.
  grunt.registerTask 'makesprites', ['svgstore', 'svg2string', 'replace:sprites']
  grunt.registerTask 'optimizeimg', ['svg2png:src', 'newer:imagemin:src']
  grunt.registerTask 'preprocess',  ['optimizeimg']
  grunt.registerTask 'prepare',     ['copy:main', 'concat:bootstrap', 'uglify', 'modernizr:dist']
  grunt.registerTask 'postprocess', ['less', 'autoprefixer:bossout']
  grunt.registerTask 'generate',    ['clean:out', 'shell:docpad', 'prepare', 'postprocess']
  grunt.registerTask 'server',      ['connect', 'watch:src', 'watch:out']
  grunt.registerTask 'run2',        ['generate', 'server']
  grunt.registerTask 'run',         ['shell:docpadrun', 'prepare', 'postprocess', 'watch:less']
  grunt.registerTask 'development', ['prepare', 'postprocess', 'watch:less']
  grunt.registerTask 'production',  ['prepare', 'postprocess', 'copy:manan']
  grunt.registerTask 'deploy',      ['clean:out', 'prepare', 'postprocess', 'shell:deploy']
  grunt.registerTask 'default',     ['run']
