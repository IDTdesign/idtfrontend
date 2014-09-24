# Grunt Configuration
# http://gruntjs.com/getting-started#an-example-gruntfile

module.exports = (grunt) ->

	# Initiate the Grunt configuration.
	grunt.initConfig

		# Allow use of the package.json data.
		pkg: grunt.file.readJSON('package.json')

		# docpad variables
		docpad:
			files: [ './src/**/*.*' ]
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
			modernizr:
				src: 'bower_components/modernizr/modernizr.js'
				dest: 'out/vendor/modernizr/modernizr.min.js'
			sticky:
				src: 'bower_components/sticky/jquery.sticky.js'
				dest: 'out/vendor/sticky/jquery.sticky.min.js'

		# compile less and generate map files
		less:
			compileBoss:
				options:
					strictMath: true
					sourceMap: true
					outputSourceFiles: true
					sourceMapURL: 'bossrevolution.css.map'
					sourceMapFilename: 'out/styles/bossrevolution.css.map'
				files:
					'out/styles/bossrevolution.css': 'src/files/styles/bossrevolution.css.less'
			compileBootstrap:
				options:
					strictMath: true
					sourceMap: true
					outputSourceFiles: true
					sourceMapURL: 'bootstrap.css.map'
					sourceMapFilename: 'out/styles/bootstrap.css.map'
				files:
					'out/styles/bootstrap.css': 'src/files/styles/bootstrap.css.less'
			compileBsTheme:
				options:
					strictMath: true
					sourceMap: true
					outputSourceFiles: true
					sourceMapURL: 'bootstrap-theme.css.map'
					sourceMapFilename: 'out/styles/bootstrap-theme.css.map'
				files:
					'out/styles/bootstrap-theme.css': 'src/files/styles/bootstrap-theme.css.less'

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
				src: 'src/files/styles/*.less'
			bossout:
				options:
					map: true
				src: 'out/styles/bossrevolution.css'

		# rasterize all SVG files in "img" and its subdirectories to "img/png"
		svg2png:
			out:
				files: [
					cwd: 'out/images/',
					src: ['**/*.svg'],
					dest: 'out/images/'
				]
			src:
				files: [
					cwd: 'src/files/images/',
					src: ['**/*.svg'],
					dest: 'src/files/images/'
				]
			icons:
				files: [
					expand: false,
					cwd: 'src/files/icons/svg/',
					src: ['*.svg'],
					dest: 'src/files/icons/png/',
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
				files: 'src/files/icons/svg-defs.svg':['src/files/icons/svg/*.svg']
			colored:
				files: 'src/files/icons/svg-defs-colored.svg':['src/files/icons/svg-color/*.svg']

		#convert content of svg file to string
		svg2string:
			icons:
				files: 'src/files/icons/svg-icons.js':['src/files/icons/svg-defs.svg','src/files/icons/svg-defs-colored.svg']

		# background-image svg and png sprites
		'svg-sprites':
			icons:
				options:
					spriteElementPath: 'src/files/icons/svg'
					spritePath: 'src/files/icons/icons-sprite.svg'
					cssPath: 'src/files/styles/_sprite.less'
					previewPath: 'src/files/icons/'
					prefix: 'i-'
					cssSvgPrefix: '.svg '
					cssPngPrefix: '.no-svg '
					sizes:
						'': 33
						xsmall: 16
						small: 25
						large: 51
					refSize: 33
					template: 'src/files/icons/templates/stylesheet.hbs'

		replace:
			sprites:
				src: 'src/documents/styles/_sprite.less'
				dest: 'src/documents/styles/_sprite.less'
				replacements: [
					{
						from: '../../files/icons/',
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
					cwd: 'src/files/images/',
					src: ['**/*.{png,jpg,gif}'],
					dest: 'src/files/images/'
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
				files: ['./src/files/styles/**/*.*']
				tasks: [
					'less'
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
					'out/vendor/animate.css/animate.min.css':'bower_components/animate.css/animate.min.css',
					'out/vendor/jquery.scrollTo/jquery.scrollTo.min.js':'bower_components/jquery.scrollTo/jquery.scrollTo.min.js',
					'out/vendor/jquery.localScroll/jquery.localScroll.min.js':'bower_components/jquery.localScroll/jquery.localScroll.min.js',
					{
					cwd: 'bower_components/jqgrid',
					src: '**/*',
					dest: 'out/vendor/jqgrid',
					expand: true
					}
				]

		# generate development
		shell:
			docpad:
				options:
					stdout: true
				command: 'docpad generate --env static'

	# Build the available Grunt tasks.
	grunt.loadNpmTasks 'grunt-shell'
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

	# Register our Grunt tasks.
	grunt.registerTask 'makesprites',   ['svgstore', 'svg2string', 'svg-sprites', 'replace:sprites']
	grunt.registerTask 'optimizeimg',   ['svg2png:src', 'newer:imagemin:src']
	grunt.registerTask 'preprocess',    ['makesprites', 'optimizeimg']
	grunt.registerTask 'postprocess',   ['copy', 'less', 'concat:bootstrap', 'uglify', 'autoprefixer:bossout']
	grunt.registerTask 'generate',      ['clean:out', 'shell:docpad', 'postprocess']
	grunt.registerTask 'server',        ['connect', 'watch:src', 'watch:out']
	grunt.registerTask 'run',           ['generate', 'server']
	grunt.registerTask 'development',   ['postprocess', 'watch:less']
	grunt.registerTask 'default',       ['run']
