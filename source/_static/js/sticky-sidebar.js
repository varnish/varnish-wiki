
( function() {

	/**
	 * Set variables on window load.
	 */
	window.onload = function() {

		// Get items
		page_main = document.getElementById( "main" );
		page_header = document.getElementById( "header" );
		wiki_content = document.getElementById( "wiki-content" );

	}

	/**
	 * Run actions on scrolling.
	 */
	document.onscroll = function() {

		
		wiki_sidebar = document.getElementById( "wiki-sidebar" );
console.log(wiki_sidebar);
		wiki_sidebar.style.backgroundColor = "red";
		if ( wiki_sidebar < window.innerHeight ) {
		}


		/**
		 * Change header styling on scrolling past top.
		 */

		function has_class(element, cls) {
			return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
		}

		var current_distance_from_top = document.documentElement.scrollTop || document.body.scrollTop;
		var base_class_name = "page-header";
		var scrolled_class_name = "is-scrolled";

		if ( page_header ) {

			if ( 20 < current_distance_from_top ) {

				if ( ! has_class( page_header, scrolled_class_name ) ) {
					page_header.className += ( " " + scrolled_class_name );
				}

			} else {
				page_header.className = base_class_name;
			}

		}

		/**
		 * Sticky sidebar.
		 */

		 /**
		  * Using function to get browser width to avoid browser incompatibility issues.
		  */
		function get_browser_width() {
			if (self.innerWidth) {
				return self.innerWidth;
			}

			if (document.documentElement && document.documentElement.clientWidth) {
				return document.documentElement.clientWidth;
			}

			if (document.body) {
				return document.body.clientWidth;
			}
		}

		if ( 768 < get_browser_width() ) {

			/**
			 * Wiki sidebar.
			 */
			if ( null != wiki_sidebar ) {

				var wiki_sidebar_rect = wiki_sidebar.getBoundingClientRect();
				var wiki_sidebar_from_window_top = wiki_sidebar_rect.top;
				var wiki_sidebar_bottom_from_window_top = wiki_sidebar_from_window_top + wiki_sidebar.clientHeight;

				// Setting useful content area vars
				var wiki_content_rect = wiki_content.getBoundingClientRect();
				var wiki_content_from_window_top = wiki_content_rect.top;
				var wiki_content_bottom_from_window_top = ( wiki_content_from_window_top + wiki_content.clientHeight );

				// Setting useful footer vars
				var page_footer_rect = page_footer.getBoundingClientRect();
				var page_footer_from_window_top = page_footer_rect.top;

				// Get the scroll position (required due to Firefox and Chrome both using different ways of accessing the scroll position)
				var scroll_top = document.documentElement.scrollTop || document.body.scrollTop;

				// Set sidebar position if sidebar bottom is less than footer top or sidebar top is greater than header height
				if (
					wiki_sidebar_bottom_from_window_top < page_footer_from_window_top
					&&
					0.5 < Math.abs( wiki_sidebar_bottom_from_window_top - page_footer_from_window_top  )
				) {
					wiki_sidebar.style.marginTop = ( scroll_top ) + "px";
				}

				if (
					wiki_sidebar_from_window_top > page_header.clientHeight
				) {
					wiki_sidebar.style.marginTop = ( scroll_top ) + "px";
				}

			}

		}

	}


	/**
	 * Close search box on blur (mouse out or tab out).
	 */
	function varnish_search_blur( e ) {
		if (
			"icon-search-gray" != e.target.className
			&&
			"btn-search" != e.target.className
			&&
			"search" != e.target.id
		) {
			document.getElementById( "search" ).className = "";
		}

	}

	/**
	 * Open search box on focus (mouse over or tab in).
	 */
	function varnish_search_focus( e ) {

		if (
			"icon-search-gray" == e.target.className
			||
			"btn-search" == e.target.className
			||
			"search" == e.target.id
		) {
			document.getElementById( "search" ).className = "is-open";
		}

	}

	document.addEventListener( "mouseover", varnish_search_focus );
	document.addEventListener( "mouseout", varnish_search_blur );
	var search_input = document.getElementById('search');
	search_input.addEventListener( "focus", varnish_search_focus );
	search_input.addEventListener( "blur", function ( e ) {
		document.getElementById( "search" ).className = "";
	});

	document.addEventListener("click", varnish_hamburger_click);
	/**
	 * Handling hamburger clicks.
	 */
	function varnish_hamburger_click( element ) {

		if (
			"undefined" != element.target.className
			&&
			(
				"nav-toggle" == element.target.className
				||
				"icon-bars" == element.target.className
			)
		) {
			event.preventDefault();

			// Close the header
			var nav_header = document.getElementsByClassName( "nav-header" );
			if ( "undefined" != nav_header[0] ) {
				nav_header = nav_header[0];

				if ( "nav-header is-closed" == nav_header.className ) {
					nav_header.className = "nav-header is-open";
				} else if ( "nav-header is-open" == nav_header.className ) {
					nav_header.className = "nav-header is-closed";
				}

			}

		}

	}

	/**
	 * Smooth scroll, to be low the header/hero banner when set.
	 */
	if (  ( typeof( varnish_scroll_to_content ) !== 'undefined' && null != varnish_scroll_to_content  ) && 'querySelector' in document && 'addEventListener' in window && Array.prototype.forEach ) {

		/**
		 * Function to animate the scroll.
		 *
		 * @param  duration  The duration of the scroll effect
		 */
		var smoothScroll = function (duration) {

			// Calculate how far and how fast to scroll
			var startLocation = window.pageYOffset;

			// Get scroll point
			var hero_banners = document.getElementsByClassName( "hero-banner" );
			var hero_banner = hero_banners[0];
			var endLocation = hero_banner.clientHeight;

			var distance = endLocation - startLocation;
			var increments = distance/(duration/16);
			var stopAnimation;

			// Scroll the page by an increment, and check if it's time to stop
			var animateScroll = function () {
				window.scrollBy(0, increments);
				stopAnimation();
			};

			// If scrolling down
			if ( increments >= 0 ) {
				// Stop animation when you reach the anchor OR the bottom of the page
				stopAnimation = function () {
					var travelled = window.pageYOffset;
					if ( (travelled >= (endLocation - increments)) || ((window.innerHeight + travelled) >= document.body.offsetHeight) ) {
						clearInterval(runAnimation);
					}
				};
			}
			// If scrolling up
			else {
				// Stop animation when you reach the anchor OR the top of the page
				stopAnimation = function () {
					var travelled = window.pageYOffset;
					if ( travelled <= (endLocation || 0) ) {
						clearInterval(runAnimation);
					}
				};
			}

			// Loop the animation function
			var runAnimation = setInterval(animateScroll, 16);

		};

		/**
		* Initiate smooth scroll to below the header.
		*/
		setTimeout(
			function() {
				smoothScroll(500);
			},
			4000
		);

	}

})();
