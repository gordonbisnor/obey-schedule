var packageJson = require('./package.json');
var path = require('path');

module.exports = function(grunt) {

  grunt.initConfig({

    cssmin: {
       dist: {
          options: {},
          files: {
             'src/style.css': ['src/style.css']
          }
      }
    },

    uglify: {
       dist: {
          options: {
             sourceMap: true
          },
          files: {
             'src/obey.js': ['src/obey.js'],
          }
       }
    },


    elm: {
      compile: {
        files: {
          "src/obey.js": ["Obey.elm"]
        }
      }
    },


    sass: {
      dist: {
        files: {
        'src/style.css': 'style.scss'
        }
      }
    }, 

    watch: {

      elm: {
        files: [
          '**/*.elm'
          ],
        tasks: ["elm"]
      },
       sass: {
        files: ["style.scss"],
        tasks: ["sass"]
      },
      options: {
        livereload: true
      }
    },
    clean: ["elm-stuff/build-artifacts", "dist"],

    cacheBust: {
      options: {
        deleteOriginals: true,
        separator: "-",
        assets: ['style.css','obey.js'],
        baseDir: './dist/'
      },
      taskName: {
        files: [{   
          expand: true,
          cwd: 'dist/',
          src: ['index.html']
        }]
      }
    },
  
    copy: {
      main: {
        files: [
          {
            expand: true, 
            cwd: "src/", 
            src: ['**'], 
            dest: 'dist/'
          }

        ]
      }
    }

  });

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-elm');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-cache-bust');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.registerTask('default', ['elm', 'sass', 'uglify', 'cssmin', 'clean', 'copy', 'cacheBust']);

};
