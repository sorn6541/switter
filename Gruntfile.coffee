module.exports = (grunt) ->
  require('jit-grunt') grunt,
    cjsx: 'grunt-coffee-react'
    express: 'grunt-express-server'
    
  grunt.initConfig 
    express:
      dev: 
        options: 
          script: 'src/index.coffee'
          opts: ['node_modules/coffee-script/bin/coffee']
          port: 3000
          
    cjsx:
      compile:
        expand: true
        cwd:'src/public/js/coffee'
        src:'*.coffee'
        dest:'src/public/js'
        ext:'.js'
          
    watch:
      express:
        files: ['src/**/*.coffee']
        tasks: ['express:dev','wait']
        options: 
          livereload: true
          spawn: false
      livereload:
        files:['src/**/*.html']
        options:
          livereload: true
      gruntFile:
        files:['Gruntfile.coffee']
        options:
          reload:true
      cjsx:
        files: ['src/public/js/coffee/*.coffee']
        tasks: ['cjsx:compile']
        options:
          livereload: true
    
    open: 
      server: 
        url: 'http://localhost:3000'

  grunt.registerTask 'wait', ->
    grunt.log.ok 'Waiting for server reload...'
    done = this.async()
    setTimeout ->
      grunt.log.writeln 'Done waiting!'
      done()
    ,1500
  
  
  grunt.registerTask 'dev', ['cjsx:compile','express:dev','wait','open:server','watch']
    