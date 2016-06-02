var packageJson = require('./package.json');
var path = require('path');
var swPrecache = require('sw-precache');

module.exports = function(grunt) {

  grunt.initConfig({
    elm: {
      compile: {
        files: {
          "obey.js": ["Obey.elm"]
        }
      }
    },

    swPrecache: {
      dev: {
        handleFetch: false,
        rootDir: '.'
      }
    },

    watch: {
      elm: {
        files: ["Obey.elm"],
        tasks: ["elm",'swPrecache']
      },
      options: {
        livereload: true
      }
    },
    clean: ["elm-stuff/build-artifacts"]
  });

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-elm');

  grunt.registerTask('default', ['elm', 'swPrecache']);

  function writeServiceWorkerFile(rootDir, handleFetch, callback) {
    var config = {
      cacheId: packageJson.name,
      dynamicUrlToDependencies: {},
      handleFetch: handleFetch,
      logger: grunt.log.writeln,
      staticFileGlobs: [
        rootDir + '/css/**.css',
        rootDir + '/**.html',
        rootDir + '/images/**.*',
        rootDir + '/js/**.js'
      ],
      stripPrefix: rootDir + '/',
      // verbose defaults to false, but for the purposes of this demo, log more.
      verbose: true
    };

    swPrecache.write(path.join(rootDir, 'service-worker.js'), config, callback);
  }

  grunt.registerMultiTask('swPrecache', function() {
    var done = this.async();
    var rootDir = this.data.rootDir;
    var handleFetch = this.data.handleFetch;

    writeServiceWorkerFile(rootDir, handleFetch, function(error) {
      if (error) {
        grunt.fail.warn(error);
      }
      done();
    });
  });

};
