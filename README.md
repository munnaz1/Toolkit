Wezside Components/Utilities
============================

This is a hub for components I've written and re-use quite often. These include Actionscript and MXML components.

Latest release
=======

* Compiled with Flex 4 SDK build 14159 

Component [Build 0.1.0018]
=======

* [Accordion](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/sample/accordion/AccordionAdvanced.mxml "Accordion") [Build 0.1.0032]
* [Gallery](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/sample/gallery/GalleryBasic.as "Gallery") [Build 0.1.001]
* [Media Player](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/sample/media/MediaSample.as "MediaPlayer") [Build 0.1.001]

Utilities [Build 0.1.0021]
=======

* [DateUtil](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/utilities/date/DateUtil.as "DateUtil") 
* [FileUpload](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/utilities/file/FileUpload.as "FileUpload") 
* [FileUtil](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/utilities/file/FileUtil.as "FileUtil") 
* [FlashVars](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/utilities/flashvars/FlashVars.as "FlashVars") 
* [ImageResize](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/utilities/imaging/ImageResize.as "ImageResize") 
* [Reflection](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/utilities/imaging/Reflection.as "Reflection") 
* [SharedObjUtil](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/utilities/sharedobj/SharedObjUtil.as "SharedObjUtil") 
* [StateManager](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/utilities/stateManager/StateTest.as "StateManager") 
* [StringUtil](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/utilities/string/StringUtil.as "StringUtil") 
* [StyleManager](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/utilities/styleManager/StyleManager.as "StyleManager") 
* [SwitchUtil](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/utilities/switchutil/SwitchUtil.as "SwitchUtil") 
* [TimelineManager](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/utilities/timelineManager/TimelineSample.as "TimelineManager")
* [Tracer](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/utilities/logging/Tracer.as "Tracer")
* [TrackingUtil](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/utilities/tracking/TrackingUtil.as "TrackingUtil")
* [Validator](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/utilities/validator/Validator.as "Validator")



Accordion
---------

A bare-bones Accordion component. Extend Accordion and AccordionItem to customise this component and add animations when 
state changes.

		var itemA:IAccordionItem = new AccordionItem();
		itemA.header = headerDisplayObject;
		itemA.content = contentDisplayObject; 
			
		var acc:Accordion = new Accordion();
		acc.addItem( itemA );
		addChild( acc );
		
Gallery
-------

A framework for building advanced Gallery components. Supports grid layouts and custom transitions. Useful just as is or with extended functionality. 
The creation policy for this component is to construct and purge a gallery per page. This allows for only loading the images required on screen. This impacts
transitions where it is required to have the next items visible on screen before the current gallery items have been removed. 

[Example](http://www.sony.com/football/#/cfcfootballhd/ "Gallery Example")

		gallery = new Gallery( items, 
							   COLUMNS, 
							   ROWS,
							   0, 						// xOffset
							   0, 						// yOffset
							   2, 						// Horizontal Gap
							   2, 						// Vertical Gap
							   "left", 					// Horizontal Align
							   "custom",				// Click through target
							   1,   					// Reflection Height In Rows
							   0.3, 					// Reflection Alpha
							   Gallery.RESIZE_HEIGHT,	// Resize Policy 
							   80, 						// Resize Value
							   Gallery.DISTRIBUTE_H, 	// Distribute Policy
							   false, 					// Show Arrangement
							   550,  					// Stage width
							   500,  					// Stage height
							   true, 					// Disable CTA for all thumbnails
							   false );					// Debug
		gallery.x = 50;
		gallery.y = 30;
		gallery.addEventListener( GalleryEvent.ARRANGE_COMPLETE, galleryArrangeComplete );
		addChildAt( gallery, 0 );

Media Player
------------

A simple media player that loads three Youtube videos or an image. 

		var item1:Media = new Media();
		item1.url = "http://www.youtube.com/watch?v=MWe07krS8_E";
		 
		var item2:Media = new Media();
		item2.url = "http://www.youtube.com/watch?v=uXyUtJYIdQA"; 
		 
		var item3:Media = new Media();
		item3.url = "http://www.youtube.com/watch?v=MWe07krS8_E"; 
				
		var mediaItems:Array = [];
		mediaItems.push( item1 );
		mediaItems.push( item2 );
		mediaItems.push( item3 );
	
		player = new MediaPlayer();
		player.bgWidth = 350;			
		player.bgHeight = 200;			
		player.dataprovider = mediaItems;
		addChild(player); 
		
StateManager
------------

A useful class to manage application state. The reserved property on an IState instance is used for 
application state that will only affect itself. Reserved states are not mutually exclusive, they are allowed to co-exist 
with non-reserved and other reserved states. 

		var sm:StateManager = new StateManager();
		sm.addState( "Credentials", true );
		sm.addState( "Register" );
		sm.addState( "List" );
		sm.addState( "Search" );
		sm.addState( "Results" );
		
		sm.state = "Credentials";				// State == 1
		sm.state = "Credentials";				// State == 0
		sm.state = "Credentials";				// State == 1
		sm.state = "Register";					// State == 3
		sm.previousState().key					// Result is "Credentials"	
		sm.state = "Credentials";				// State == 2


TimelineManager
---------------

A simple class to deal with timeline animations. Manage timeline animations playback, removal and 
end frame behaviour. A play policy exist to allow for playing back multiple animations at once or 
in sequence starting at a specific animation or simply play a single (default) animation.

		var manager:TimelineManager = new TimelineManager();
		manager.push( id, mc );
		manager.push( id, mc );
		manager.push( id, mc );
		manager.push( id, mc );
		manager.playPolicy = TimelineManager.PLAY_POLICY_SEQUENTIAL; 
		manager.play();
