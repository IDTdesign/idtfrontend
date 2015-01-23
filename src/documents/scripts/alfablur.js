;(function ( $, window, document, undefined ) {

var pluginName = "alfablur",
	defaults = {
	    gradient_width: 0.25, 	//max value 0.49 = 49%
	    blur_width: 30, 		//in px	
	    blur_radius: 40,		//0-255
	    blured_page_alfa: 125, 	//0-255
	};
 
function Plugin( element, options ) {
	this.element = element;
	this.options = $.extend( {}, defaults, options) ;
	this._defaults = defaults;
	this._name = pluginName;	
	this.init();	
}
 
Plugin.prototype.init = function () {
	//Init
	var self = this;
	this.element.onload = function(){
		setTimeout(function(){
			self.createDom();
		},100);
		
	};
	$(this.element).attr('src',$(this.element).data('src'));	
};

Plugin.prototype.createDom = function () {	
	//console.info('createDom')
	var self = this;
	
	this.options.wrapper = (this.element.parentNode);

	var canv = '<canvas></canvas><canvas id="blur"></canvas>';
	    if (self.options.blur_page) {
	        canv = '<canvas></canvas><canvas id="blur"></canvas><canvas id="pageBlur"></canvas>';
	    }
	    var canvases = $(canv).prependTo(this.options.wrapper);
		this.options.canvas = canvases[0],
		this.options.canvas2 = canvases[1],
		this.options.canvas3 = canvases[2],
		this.options.ctx     = this.options.canvas.getContext('2d');


		this.options.canvas.width 	= this.element.width,
		this.options.canvas.height 	= this.element.height;

		this.drowImage();
		setTimeout(
			function(){
				self.createBlurBG();
				self.makeAlfa();
				self.options.callBack(self);	
				if (self.options.blur_page) {
					self.blurPage();					
				}
				//console.log(self);
			},10);
};

Plugin.prototype.drowImage = function () {
	//console.info('drowImage');
	$(this.element).css({'position':'absolute','visibility':'hidden'});
	this.options.ctx.drawImage(this.element, 0, 0, this.element.width, this.element.height);
	this.options.origData = this.options.ctx.getImageData(0, 0, this.element.width, this.element.height);
};

Plugin.prototype.createBlurBG = function () {
	var self = this;
	//console.info('createBlurBackground');
	var o = this.options;

	this.options.left_blur  = o.ctx.getImageData(0,0, o.blur_width, o.canvas.height);
	this.options.right_blur = o.ctx.getImageData((o.canvas.width-o.blur_width), 0, o.canvas.width, o.canvas.height);
	
	this.options.canvas2.width 		= o.blur_width*2;
	this.options.canvas2.height 	= this.element.height;	

	ctx2 = o.canvas2.getContext('2d');
	ctx2.putImageData(o.left_blur, 0, 0);
	ctx2.putImageData(o.right_blur, o.blur_width, 0); 

	

	
	stackBlurCanvasRGBA(o.canvas2.id, 0, 0, o.canvas2.width, o.canvas2.height, o.blur_radius)
	o.canvas2.id = '';
	if (o.vertical_gradient) {
		var data = ctx2.getImageData(0, 0, o.canvas2.width, o.canvas2.height),	
			datapx = data.data,
			len = datapx.length,
			line = 1,
			max_i_line = o.canvas2.width*4,
			alfa = 255,
			max_alfa = 255,
			vertical_gradient_height_start = o.left_blur.height * o.vertical_gradient;			
		for (var i = 0; i < len; i += 4) { 
			alfa=255;
			if (i>=(max_i_line*line)) {												
				//line count
				line++
				if (o.vertical_gradient) {
				    if (line > vertical_gradient_height_start) {
				        var h = o.left_blur.height - vertical_gradient_height_start;
				        var step = 255 / h;
				        var pos = line - vertical_gradient_height_start;
				        max_alfa = parseInt(255 - (step * pos));
				    }
				}
				
			}
			if (alfa > max_alfa) {
				alfa = max_alfa;
			}
			datapx[i+3] = alfa
		}
		ctx2.putImageData(data, 0, 0);

	}
	$(o.canvas2).hide();
	$(self.options.wrapper).css({'background-image':'url('+o.canvas2.toDataURL("image/png")+')','background-size': '2560px ' + o.canvas.height+'px'});

	

};
Plugin.prototype.makeAlfa = function () {
	//console.info('makeAlfaImage');
	
	var o = this.options,	
		data = o.origData,	
		datapx = data.data,
		len = datapx.length,
		line = 1,
		max_i_line = o.canvas.width*4,
		max_i_left = max_i_line*o.gradient_width,
		min_i_right = max_i_line - max_i_left,		
		alfa = 255,
		max_alfa = 255;

		if (o.vertical_gradient) {
			vertical_gradient_height_start = o.left_blur.height * o.vertical_gradient;
		}


	for (var i = 0; i < len; i += 4) {		
		alfa=255;
		if (i>=(max_i_line*line)) {												
			//line count
		    line++
		    if (o.vertical_gradient) {
		        if (line > vertical_gradient_height_start) {
		            var h = o.left_blur.height - vertical_gradient_height_start;
		            var step = 255 / h;
		            var pos = line - vertical_gradient_height_start;
		            max_alfa = parseInt(255 - (step * pos));
		        }
		    }
			//console.log('line:', line,'max_a: ', max_alfa)
		}
		
		if(i<=(max_i_line*(line-1)+max_i_left)) {
			//left side grad
			alfa = parseInt((i-(max_i_line*(line-1)))/max_i_left*255);			
		} 
		if(i>((line-1)*max_i_line)+min_i_right) {
			//right side grad
			l0=parseFloat((max_i_line*(line-1))+min_i_right);
			
			alfa = 255-parseInt((i-l0)/max_i_left*255);
		}

		if (o.vertical_gradient)
		{
			if (alfa > max_alfa) {
				alfa = max_alfa;
			}
		}

		datapx[i+3] = alfa // a		
	}
	o.ctx.putImageData(data, 0, 0);
};

Plugin.prototype.blurPage = function () {
	var ctx3 = this.options.canvas3.getContext('2d'),
		canv3 = this.options.canvas3;

		this.options.canvas3.width= this.element.width;
		this.options.canvas3.height=this.element.height;

		ctx3.drawImage(this.element, 0, 0, this.element.width, this.element.height);		
		this.options.origData = ctx3.getImageData(0, 0, this.element.width, this.element.height);
		stackBlurCanvasRGBA(canv3.id, 0, 0, this.element.width, this.element.height, 60);		

    var data =  ctx3.getImageData(0, 0, this.element.width, this.element.height),
		datapx = data.data,
		len = datapx.length;


        for (var i = 0; i < len; i += 4) {
            datapx[i + 3] = this.options.blured_page_alfa;
        }
        ctx3.putImageData(data, 0, 0);

		$(this.options.blur_page).css({'background-image':'url('+canv3.toDataURL("image/png")+')'});			
		
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