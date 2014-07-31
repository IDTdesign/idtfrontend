;(function ( $, window, document, undefined ) {

var pluginName = "alfablur",
	defaults = {
		gradiend_with: 0.25, //max value 0.49 = 49%
		blur_width: 30, //in px	
		blur_radius: 40,
		callBack: function(){}
	};
 
function Plugin( element, options ) {
	this.element = element;
	this.options = $.extend( {}, defaults, options) ;
	this._defaults = defaults;
	this._name = pluginName;	
	this.init();
	//console.info(this);
}
 
Plugin.prototype.init = function () {
	//Init
	console.info('Init')
	var self = this;
	this.element.onload = function(){
		setTimeout(function(){
			self.createDom();
		},100);
		
	};
	$(this.element).attr('src',$(this.element).data('src'));	
};

Plugin.prototype.createDom = function () {
	//getData
	//console.info('createDom')
	var self = this;
	
		this.options.wrapper = (this.element.parentNode);
		var canvases = $('<canvas></canvas><canvas></canvas>').appendTo(this.options.wrapper);
		this.options.canvas = canvases[0],
		this.options.canvas2 = canvases[1],
		this.options.ctx     = this.options.canvas.getContext('2d');


		this.options.canvas.width 	= this.element.width,
		this.options.canvas.height 	= this.element.height;

		this.drowImage();
		setTimeout(
			function(){
				self.createBlurBG();
				self.makeAlfa();
				self.options.callBack(self);				
			},10);/*
		this.createBlurBG();
		this.makeAlfa();*/

};

Plugin.prototype.drowImage = function () {
	//console.info('drowImage');
	$(this.element).css({'position':'absolute','visibility':'hidden'});
	this.options.ctx.drawImage(this.element, 0, 0, this.element.width, this.element.height);
};

Plugin.prototype.createBlurBG = function () {
	var self = this;
	//console.info('createBlurBackground');
	var o = this.options;

	this.options.left_blur = o.ctx.getImageData(0,0, o.blur_width, o.canvas.height);
	this.options.right_blur = o.ctx.getImageData((o.canvas.width-o.blur_width), 0, o.canvas.width, o.canvas.height);
	
	this.options.canvas2.width 	=	o.blur_width*2;
	this.options.canvas2.height 	= 	this.element.height;



	ctx2 = o.canvas2.getContext('2d');	
	ctx2.putImageData(o.left_blur, 0, 0);
	ctx2.putImageData(o.right_blur, o.blur_width, 0); 

	var i = document.createElement('img');	
	$('body').append(i);
	i.id='a_'+o.wrapper.className;
	var id = o.canvas2.id = 'b_'+o.wrapper.className;
	i.onload = function(){
		//blur for bg
		stackBlurImage(i.id, id, o.blur_radius );	
		o.canvas2.id='';
		$(o.canvas2).hide();
		$(self.options.wrapper).css({'background-image':'url('+o.canvas2.toDataURL("image/png")+')','background-size': '2000px ' + o.canvas.height+'px'});
		$(i).hide();
	}
	i.src=o.canvas2.toDataURL("image/png");
	
};
Plugin.prototype.makeAlfa = function () {
	//console.info('makeAlfaImage');
	
	var o = this.options,	

		data = o.ctx.getImageData(0, 0, o.canvas.width, o.canvas.height);;	
		datapx = data.data,
		len = datapx.length,
		line = 1,
		max_i_line = o.canvas.width*4,
		max_i_left = max_i_line*o.gradiend_with,
		min_i_right = max_i_line - max_i_left,
		alfa = 255;
	for (var i = 0; i < len; i += 4) {
		

		if (i>=(max_i_line*line)) {												
			//line count
			line++								
		}
		alfa=255;
		if(i<=(max_i_line*(line-1)+max_i_left)) {
			//left side grad
			alfa = parseInt((i-(max_i_line*(line-1)))/max_i_left*255);
		} else {
			alfa=255;
		}
		if(i>((line-1)*max_i_line)+min_i_right) {
			//right side grad
			l0=parseFloat((max_i_line*(line-1))+min_i_right);
			
			alfa = 255-parseInt((i-l0)/max_i_left*255);
			
		}
		datapx[i+3] = alfa // a		
	}
	o.ctx.putImageData(data, 0, 0);
};

$.fn[pluginName] = function ( options ) {
	return this.each(function () {
		if ( !$.data(this, "plugin_" + pluginName )) {
			$.data( this, "plugin_" + pluginName,
			new Plugin( this, options ));
		}
	});
} 
})( jQuery, window, document );