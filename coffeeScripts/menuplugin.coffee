YUI.add('menuplugin', (Y) ->
    menuDisplay=null
    menuTemplateSource =null
    menuTemplate = null
    menuLink =Y.one('#menuLink');
    rollLink =Y.one('#rollLink');
    revese =false;
    setupMenu=->
        menuDisplay = menu :[
            {
                title:'Team Projects',
                image:'103-map-white.png',
                link: 'Projects',
                quantity:'1'
            },
            {
                title:'Team Blogs',
                image:'251-sword-white.png',
                link: 'Blogs',
                quantity:'2'
            },
            {
                title:'Team Videos',
                image:'43-film-roll.png',
                link: 'Videos',
                quantity:'0'
            },
            {
                title:'Team Members',
                image:'111-user.png',
                link: 'Members',
                quantity:'5'
            },
            {
                title:'Forum',
                image:'33-cabinet-white.png',
                link: 'Forum',
                
            }
        ]
        menuTemplateSource = Y.one('#menu-template').getHTML()
        menuTemplate = Y.Handlebars.compile menuTemplateSource
        
    menuAnim =  Y.one('#menu').plug Y.Plugin.NodeFX, {
        from: { left: 0 },
        to: 
            left :250
        easing:Y.Easing.easeOut,
        duration:0.5
    }
    menuLinkAnim =  Y.one('#menuLink').plug Y.Plugin.NodeFX, {
        from: { left: 0 },
        to: 
            left :250
        easing:Y.Easing.easeOut,
        duration:0.5
    }
    


    contentMenuAnimation= Y.one('.hero').plug Y.Plugin.NodeFX, {
        from: { left: -250},
        to: 
            left:0
        easing:Y.Easing.easeOut,
        duration:0.5
    }


    toggleMenus=(e)->
            menuLinkAnim.fx.set('reverse', !menuLinkAnim.fx.get('reverse')); 
            menuLinkAnim.fx.run();

            
    startSideMenu=(e)->
            menuAnim.fx.set('reverse', !menuAnim.fx.get('reverse')); 
            menuAnim.fx.run();

        
    toggleContentMenu =(e) -> 
            contentMenuAnimation.fx.set('reverse', !contentMenuAnimation.fx.get('reverse'));  
            contentMenuAnimation.fx.run();
    
        
    toggleSideMenu = (e)->
        toggleMenus e
        startSideMenu e
        toggleContentMenu e
        
    bindPhoneMenu = ->
        menuLink.on 'click' , toggleSideMenu
        
            
    
    Y.menuplugin=  
        render :()->
            setupMenu()
            html= menuTemplate menuDisplay
            Y.one('#menu').setHTML html
            bindPhoneMenu()
            

,'0.1.1'
,requires: 
	['handlebars-base','handelbars-comiler', 'handlebars','node', 'anim']
);