// Generated by CoffeeScript 1.6.3
(function() {
  YUI().use('node-base', 'node-event-delegate', 'app-base', 'app-transitions', 'handelbars', 'menuplugin', function(Y) {
    var pageApp;
    pageApp = new Y.App({
      views: {
        home: {
          preserve: true
        },
        campaigns: {
          parent: 'home'
        },
        players: {
          parent: 'home'
        },
        npcs: {
          parent: 'home'
        },
        encounters: {
          parent: 'home'
        },
        notes: {
          parent: 'home'
        },
        external: {
          parent: 'home'
        },
        about: {
          parent: 'home'
        }
      },
      transitions: true,
      container: '#pageContent',
      serverRouting: false
    });
    pageApp.route('*', function() {});
    pageApp.route('/Projects', function() {
      return Y.one('hero').set('text', 'Project list');
    });
    pageApp.route('/Blogs', function() {
      return Y.one('hero').set('text', 'Blogs');
    });
    pageApp.route('/Videos', function() {
      return Y.one('hero').set('text', 'Videos');
    });
    pageApp.route('/Members', function() {
      return Y.one('hero').set('text', 'Member section');
    });
    pageApp.route('/Forum', function() {
      return window.location = 'http://teamojam.com/forums/';
    });
    Y.menuplugin.render();
    return pageApp.render().dispatch();
  });

}).call(this);
