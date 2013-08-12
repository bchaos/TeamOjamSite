YUI().use 'node-base', 'node-event-delegate', 'app-base', 'app-transitions','handelbars','menuplugin', (Y) ->
    ProjectView= Y.ProjectView= Y.Base.create('projectView', Y.View, [], {
        
        projectTemplate:  Y.Handlebars.compile(Y.one('#projects-template').getContent())
        
        initializer : ->
            products =this.get 'products'
            
        render:->
            container = this.get 'container'
        
        

                                                                      
    }
    projects  = new Y.ModelList().reset [
        {name: 'DM Keeper',
         creator: 'Bradford Farmer',
         description: 'A must have tool for any DM on your ipad and iphone.',
         image:'DMKeeper.png'}
    
    ]
    
    pageApp = new Y.App {
                    views: 
                        home : {preserve: true},
                        Projects: {parent: 'home' },
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