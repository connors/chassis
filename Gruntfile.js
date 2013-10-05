module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    // Metadata.
    meta: {
        srcPath: 'lib/',
        distPath: 'dist/'
    },
    
    banner: '/*\n' +
            '* =====================================================\n' +
            '* Chassis v<%= pkg.version %>\n' +
            '* Copyright <%= grunt.template.today("yyyy") %> <%= pkg.author %>\n' +
            '* Licensed under <%= _.pluck(pkg.licenses, "url").join(", ") %>\n' +
            '*\n' +
            '* Designed and built by @connors.\n' +
            '* =====================================================\n' +
            '*/\n\n',
    
    concat: {
      options: {
        banner: '<%= banner %>'
      },
      ratchet: {
        src: [
          '<%= meta.srcPath %>/base.css',
          '<%= meta.srcPath %>/grid.css',
          '<%= meta.srcPath %>/buttons.css',
          '<%= meta.srcPath %>/icons.css',
          '<%= meta.srcPath %>/forms.css',
          '<%= meta.srcPath %>/tables.css'
        ],
        dest: '<%= meta.distPath %><%= pkg.name %>.css'
      }
    }
  });

  // Load the plugins
  grunt.loadNpmTasks('grunt-contrib-concat');

  // Default task(s).
  grunt.registerTask('default', ['concat']);
  grunt.registerTask('build', ['concat']);
};