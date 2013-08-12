YUI().use 'node-base', 'node-event-delegate', 'app-base', 'app-transitions','handelbars','menuplugin', (Y) ->

    
    pageApp = new Y.App {
                    views: 
                        home : {preserve: true},
                        Projects: {parent: 'home'},
                        Blogs: {parent: 'home'},
                        Videos: {parent: 'home'},
                        Members: {parent: 'home'},
                    transitions: 
                        true
                    container:
                        '#pageContent'
                    serverRouting:
                        true
    }
     
    pageApp.route ' /Projects', ->
        Y.one('#pageContent').set('text', 'Project list');
        
    pageApp.route '/Blogs', ->
        Y.one('#pageContent').set('text', 'Blogs');
        
    pageApp.route '/Videos', ->
        Y.one('#pageContent').set('text', 'Videos');
    
    pageApp.route '/Members', ->
        Y.one('#pageContent').set('text', 'Member section');
    
    pageApp.route '/Forum', ->
       window.location ='http://teamojam.com/forums/'
        
    Y.menuplugin.render();
    pageApp.render().dispatch();