/**
 * Copyright (c) 2010 Wesley Swanepoel
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package com.wezside.components.text 
{
	import com.wezside.components.UIElement;

	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFormat;

	/**
	 * @author Wesley.Swanepoel
	 */
	public class Label extends UIElement
	{


		protected var fmt:TextFormat;
		protected var field:TextField;
				
		private var _text:String;
		private var _paddingTop:int;
		private var _paddingLeft:int;
		private var _paddingRight:int;
		private var _paddingBottom:int;

		
		public function Label()
		{
			fmt = new TextFormat( );
			field = new TextField();
			
			_paddingTop = 0;
			_paddingLeft = 0;
			_paddingRight = 0;
			_paddingBottom = 0;
			
			addChild( field ); 
		}


		override public function update():void
		{
			setText();
		}


		private function setText():void
		{
			if ( !_text ) return;
			if ( styleSheet ) 
			{
				field.styleSheet = styleSheet; 
				field.htmlText =  "<body><span class='"+styleName+"'>" + _text + "</span></body>";
			}
			else
			{
				field.antiAliasType = AntiAliasType.ADVANCED;
				field.text = _text;
				field.setTextFormat( fmt );
			}
		}

		
		public function get font():String
		{
			return fmt.font;
		}
		

		public function set font( value:String ):void
		{
			field.embedFonts = true;
			fmt.font = value;
		}
		
		
		override public function get width():Number
		{
			return int( field.textWidth );
		}
		
		override public function set width( value:Number ):void
		{
			field.width = int( value );
		}				
		
		override public function get height():Number
		{
			return int( field.textHeight );
		}
		
		override public function set height( value:Number ):void
		{
			field.height = int( value );
		}

		public function get size():Number
		{
			return fmt.size as Number;
		}


		public function set size( value:Number ):void
		{
			fmt.size = value;
		}
		
		
		public function get text():String
		{
			return field.htmlText;
		}		
		
		public function set text( value:String ):void
		{
			_text = value;
			update();
		}		
		
		public function get embedFonts():Boolean
		{
			return field.embedFonts;
		}
		
		
		public function set embedFonts( value:Boolean ):void
		{
			field.embedFonts = value;
		}
		
		
		public function get textColor():uint
		{
			return field.textColor;
		}
		
		
		public function set textColor( value:uint ):void
		{
			field.textColor = value;
		}
		
		
		public function get autoSize():String
		{
			return field.autoSize;
		}		
		
		public function set autoSize( value:String ):void
		{
			field.autoSize = value;
		}
		
		public function get wordWrap():Boolean
		{
			return field.wordWrap;
		}
		
		public function set wordWrap( value:Boolean ):void
		{
			field.wordWrap = value;
		}
		
		public function get paddingTop():int
		{
			return _paddingTop;
		}
		
		public function set paddingTop( value:int ):void
		{
			_paddingTop = value;
		}
		
		public function get paddingLeft():int
		{
			return _paddingLeft;
		}
		
		public function set paddingLeft( value:int ):void
		{
			_paddingLeft = value;
		}
		
		public function get paddingRight():int
		{
			return _paddingRight;
		}
		
		public function set paddingRight( value:int ):void
		{
			_paddingRight = value;
		}
		
		public function get paddingBottom():int
		{
			return _paddingBottom;
		}
		
		public function set paddingBottom( value:int ):void
		{
			_paddingBottom = value;
		}
		
		public function get selectable():Boolean
		{
			return field.selectable;
		}
		
		public function set selectable( value:Boolean ):void
		{
			field.selectable = value;
		}
	}
}
