"use strict";

$(window).on('action:ajaxify.end', function(ev) {

	// Category ID to be displayed the 'not safe for work' confirm box
	var nsfwCategoryId = 28;			
	
    if (parseInt(ajaxify.data.cid, 10) === nsfwCategoryId) {
		// Blur category content when entering on the specified category above
        $('#content').css({
            filter: 'blur(10px)'
        });

        bootbox.confirm({
            title: "Are you sure you want to continue?",
            message: "This section contains <b>material that may be offensive to most sensitive people</b> and is not suitable to be seen in public places.",
            buttons: {
                cancel: {
                    label: '<i class="fa fa-times-circle"></i> Cancel'                
                },
                confirm: {
                    label: '<i class="fa fa-arrow-circle-right"></i> Enter',
                    className: 'btn-danger'
                }
            }, callback: function(answer) {
                if (!answer) {
					// Redirects the user to the main page when click on 'Cancel'
                    window.location = '/';
                } else {
					// Disable blur when click on 'Enter'
                    $('#content').css({
                        filter: 'none'
                    });
                }
            }
        });
    }
});