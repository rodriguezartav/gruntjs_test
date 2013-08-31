class Helper

module.exports = (grunt) ->

  grunt.initConfig

    clean:
      lib:
        src: "./javascript/**/*.*"
      test:
        src: "./test/unit/*.js"

    coffee:
      lib: 
        expand: true,
        flatten: true,
        cwd: './src/',
        src: ['*.coffee'],
        dest: './javascript/single',
        ext: '.js'
      concat:
        files:
          "./javascript/concat/index.js" : ["./src/*.coffee"]
      unit:
        expand: true,
        flatten: true,
        cwd: './test/unit-src',
        src: ['*.coffee'],
        dest: './test/unit',
        ext: '.js'          

    mochaTest:
      test:
        options:
          reporter: 'spec'
        src: ['test/unit/*.js']

    watch:
      coffee:
        files: ["./src/*.coffee","./test/unit-src/**/*.coffee"]
        tasks: ['compile']

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-mocha-test');

  grunt.registerTask('compile', ['clean','coffee', "mochaTest"]);   
  grunt.registerTask('dev', ['watch']);
  
