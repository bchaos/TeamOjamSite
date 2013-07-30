YUI.add('menuplugin', (Y) ->
    menuDisplay=null
    menuTemplateSource =null
    menuTemplate = null
    menuLink =Y.one('#menuLink');
    rollLink =Y.one('#rollLink');
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

    
    toggleMenus=(e)->
        menuLinkAnim.fx.run();
        menuLinkAnim.fx.set('reverse', !menuAnim.fx.get('reverse')); 
       

        
    startSideMenu=(e)->
        menuAnim.fx.run();
        menuAnim.fx.set('reverse', !menuAnim.fx.get('reverse'));
        
        
    toggleSideMenu = (e)->
        toggleMenus e
        startSideMenu e
        
        
        
    
    toggleRollMenu =(e) ->
        rollLinkAnim.fx.run();
        rollLinkAnim.fx.set('reverse', !menuAnim.fx.get('reverse')); 
        
    bindPhoneMenu = ->
        menuLink.on 'click' , toggleSideMenu
        rollLink.on 'click' , toggleRollMenu
            
    
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