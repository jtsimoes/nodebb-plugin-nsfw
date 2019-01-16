"use strict";

$(window).on('action:ajaxify.end', function(ev) {

    var nsfwCategoriesIds = [28];
    // To add more than one NSFW category, just use comma and then type the ID
    // eg.: var nsfwCategoriesIds = [28,29,30];

    if( $.inArray( parseInt(ajaxify.data.cid, 10) , nsfwCategoriesIds) != -1){

        if (typeof(Storage) !== "undefined") {

            // If 'sessionStorage.clickcount' is set to 1, the plugin will not ask again, since in this session the user has already agreed to see NSFW categories
            // If 'sessionStorage.clickcount' is not set or if it is different from 1, the confirm will appear and ask for the user choice
            if (sessionStorage.clickcount != 1) {

                // Blur category content when entering on any of the NSFW categories above
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

                            // Keep the user choice memorized in the session storage until all forum browser tabs are closed
                            sessionStorage.clickcount = 1;
                        }
                    }
                });

            }

        }
        // If browser does not support web storage, the plugin can not memorize the decision and it will always ask for the user choice
        else {

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
                        window.location = '/';
                    } else {
                        $('#content').css({
                            filter: 'none'
                        });
                    }
                }
            });

        }

    }
});