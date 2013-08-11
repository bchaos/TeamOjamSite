YUI().use 'node-base', 'node-event-delegate', 'app-base', 'app-transitions','handelbars','menuplugin', (Y) ->

    
    pageApp = new Y.App {
                    views: 
                        home : {preserve: true},
                        campaigns: {parent: 'home'},
                        players: {parent: 'home'},
                        npcs: {parent: 'home'},
                        encounters: {parent: 'home'},
                        notes: {parent: 'home'},
                        external: {parent: 'home'},
                        about: {parent: 'home'},
                    transitions: 
                        true
                    container:
                        '#pageContent'
                    serverRouting:
                        false
    }
    
    pageApp.route '*', ->
       
        
    pageApp.route '/Projects', ->
        Y.one('hero').set('text', 'Project list');
        
    pageApp.route '/Blogs', ->
        Y.one('hero').set('text', 'Blogs');
        
    pageApp.route '/Videos', ->
        Y.one('hero').set('text', 'Videos');
    
    pageApp.route '/Members', ->
        Y.one('hero').set('text', 'Member section');
    
    pageApp.route '/Forum', ->
       window.location ='http://teamojam.com/forums/'
        
    Y.menuplugin.render();
    pageApp.render().dispatch();