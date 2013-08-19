YUI().use 'node-base', 'node-event-delegate', 'app-base', 'app-transitions','handelbars','menuplugin', (Y) ->
    
    
    ProjectView= Y.ProjectView= Y.Base.create 'projectView', Y.View, [], {
        
        template:  Y.Handlebars.compile(Y.one('#projects-template').getContent())
    
        Ojam : { projects :[
                    {
                     name: 'DM Keeper',
                     creator: 'Bradford Farmer',
                     description: 'A must have tool for any DM on your ipad and iphone.',
                     image:'DMKeeper.png'
                     }          
        ]}
        
        render:->
            content = this.template(this.Ojam);
            this.get('container').setHTML(content)
            this
                                                        
    }
    
    BlogView= Y.BlogView= Y.Base.create 'blogView', Y.View, [], {
        
        template:  Y.Handlebars.compile(Y.one('#blog-template').getContent())
    
        Ojam : { Blogs :[
                    {
                     name: "Iggy's Box",
                     creator: 'Iggy',
                     description: 'A BLOG ABOUT GAMES, DEVELOPMENT, AND PROGRAMING',
                     link: 'http://iggyinabox.net/',
                     image:'http://iggyinabox.net/wp-content/uploads/2013/08/cropped-6ef98f4f-06a5-402d-9e14-598d850b52001.jpg'
                     },
                    {
                     name: "DM Keeper",
                     creator: 'Brad',
                     description: 'Development news on DMKeeper',
                     link: 'http://teamojam.com/DMKeeper/',
                     image:'/img/book@2x.png'
                     }      
        ]}
        render:->
            content = this.template(this.Ojam);
            this.get('container').setHTML(content)
            this
                                                        
    }
                
    VideoView= Y.VideoView= Y.Base.create 'videoView', Y.View, [], {
        
        projectTemplate:  Y.Handlebars.compile(Y.one('#video-template').getContent())
        
        render:->
            content = this.template(this.Ojam);
            container = this.get('container').setHTML(content)
                                                        
    }
    
    
    MemberView= Y.MemberView= Y.Base.create 'memberView', Y.View, [], {
        
        template:  Y.Handlebars.compile(Y.one('#member-template').getContent())
    
        Ojam : { Members :[
                    {
                     name: "Ignacio Lorenzo",
                     description: 'Programmer and stuff',
                     image:'http://iggyinabox.net/wp-content/uploads/2013/08/cropped-6ef98f4f-06a5-402d-9e14-598d850b52001.jpg'
                     },
                    {
                     name: "Andrew Maximus",
                     description: 'Artist and stuff',
                     image:''
                     }, 
                    {
                     name: "Dinoysus Olympus",
                     description: 'Artist and stuff',
                     image:''
                     }, 
                    {
                     name: "Bradford Rodger-Farmer",
                     description: 'Programmer and stuff',
                     image:''
                     }, 
                    {
                     name: "Madden Zayas",
                     description: 'Music and stuff',
                     image:''
                     }
                 
        ]}
        
        render:->
            content = this.template(this.Ojam);
            this.get('container').setHTML content
            this
                                                        
    }
    HomeView = Y.HomeView=Y.Base.create 'homeView' , Y.View , [] , {
    
        render : -> 
            this.get('container').setHTML '<div class="hero-cta pure-u-3-4"><h1 class="pure-u-1">Team Ojam</h1><h2 class="pure-u-3-4 l-centered"> We are a collection of the best people around .</h2></div>'
            this
    
    }
    
    pageApp = new Y.App {
                    views: 
                        home : {preserve: true ,   type : HomeView},
                        Projects: {parent: 'home', type : ProjectView },
                        Blogs: {parent: 'home',    type : BlogView},
                        Videos: {parent: 'home',   type : VideoView},
                        Members: {parent: 'home',  type : MemberView},
                    transitions: 
                        true
                    container:
                        '#pageContent'
                    serverRouting:
                        true
    }
    pageApp.route '/', -> 
        this.showView('home');
        
    pageApp.route '/Projects', ->
        this.showView('Projects');
        
    pageApp.route '/Blogs', ->
        this.showView('Blogs');
        
    pageApp.route '/Videos', ->
        this.showView('Videos');
    
    pageApp.route '/Members', ->
        this.showView('Members');
    
    pageApp.route '/Forum', ->
       window.location ='http://teamojam.com/forums/'
        
    Y.menuplugin.render();
    pageApp.render().dispatch();