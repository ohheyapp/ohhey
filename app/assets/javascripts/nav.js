$(document).ready(function() {  
	var stickyNavTop = $('#nav-sticky').offset().top;  
	  
	var stickyNav = function(){  
	var scrollTop = $(window).scrollTop();  
	       
	if (scrollTop > stickyNavTop) {   
	    	$('#nav-sticky').addClass('sticky');  
		} else {  
	    	$('#nav-sticky').removeClass('sticky');   
		}  
	};  
	  
	stickyNav();  
	  
	$(window).scroll(function() {  
	    stickyNav();  
	});  
});  