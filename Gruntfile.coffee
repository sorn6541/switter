module.exports = (grunt) ->
  grunt.initConfig 
    express:
      dev: 
        options: 
          script: 'src/index.coffee'
          opts: ['node_modules/coffee-script/bin/coffee']
          debug: true
          port: 3000
          
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
    
    open: 
      server: 
        url: 'http://localhost:3000'

  grunt.loadNpmTasks 'grunt-express-server'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-open'

  grunt.registerTask 'wait', ->
    grunt.log.ok 'Waiting for server reload...'
    done = this.async()
    setTimeout ->
      grunt.log.writeln 'Done waiting!'
      done()
    ,1500
    
    
  
  
  grunt.registerTask 'dev', ['express:dev','wait','open','watch']
  
  