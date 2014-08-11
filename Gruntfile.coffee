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
				  'bower_components/bootstrap-less/js/affix.js'
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
					'out/styles/bossrevolution.css': 'src/documents/styles/bossrevolution.css.less'
			compileBootstrap:
				options:
					strictMath: true
					sourceMap: true
					outputSourceFiles: true
					sourceMapURL: 'bootstrap.css.map'
					sourceMapFilename: 'out/styles/bootstrap.css.map'
				files:
					'out/styles/bootstrap.css': 'src/documents/styles/bootstrap.css.less'
			compileBsTheme:
				options:
					strictMath: true
					sourceMap: true
					outputSourceFiles: true
					sourceMapURL: 'bootstrap-theme.css.map'
					sourceMapFilename: 'out/styles/bootstrap-theme.css.map'
				files:
					'out/styles/bootstrap-theme.css': 'src/documents/styles/bootstrap-theme.css.less'

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
				src: 'src/documents/styles/*.less'
			bossout:
				options:
					map: true
				src: 'out/styles/bossrevolution.css'

		# rasterize all SVG files in "img" and its subdirectories to "img/png"        
		svg2png:
			out:
				files: [
					cwd: 'out/images',
					src: ['**/*.svg'],
					dest: 'out/images'
				]
			src:
				files: [
					cwd: 'src/files/images',
					src: ['**/*.svg'],
					dest: 'src/files/images'
				]

		# optimize images if possible
		imagemin:
			out:
				options:
					optimizationLevel: 3,
				files: [
					expand: true,
					cwd: 'out/images',
					src: ['**/*.{png,jpg,gif}']
					dest: 'out/images'
				]
			src:
				options:
					optimizationLevel: 3,
				files: [
					expand: true,
					cwd: 'src/files/images',
					src: ['**/*.{png,jpg,gif}']
					dest: 'src/files/images'
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

		# start server
		connect:
			server:
				options:
					port: 7777
					hostname: 'localhost'
					base: '<%= docpad.out %>'
					livereload: true
					# open: true

		# clean out dir
		clean:
			options:
				force: true
			out: ['<%= docpad.out %>']
			vendorout: [
				'out/vendor/modernizr/feature-detects',
				'out/vendor/modernizr/media',
				'out/vendor/modernizr/test',
				'out/vendor/modernizr/.*',
				'out/vendor/modernizr/grunt.js',
			]
		copy:
			main:
				files: [
					expand: true
					cwd: 'bower_components/animate.css/'
					src: 'animate.min.css'
					dest: 'out/vendor/animate.css/'
					filter: 'isFile'
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

	# Register our Grunt tasks.
	grunt.registerTask 'preprocess', [ 'svg2png:src', 'newer:imagemin:src']
	grunt.registerTask 'postprocess', ['clean:vendorout', 'copy', 'less', 'concat:bootstrap', 'uglify', 'autoprefixer:bossout']
	grunt.registerTask 'generate', ['clean:out', 'preprocess', 'shell:docpad', 'postprocess']
	grunt.registerTask 'server', ['connect', 'watch']
	grunt.registerTask 'run', ['generate', 'server']
	grunt.registerTask 'development', ['clean:out', 'preprocess', 'shell:docpad', 'postprocess', 'connect', 'watch:less', 'watch:out']
	grunt.registerTask 'default', ['run']