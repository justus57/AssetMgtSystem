/*
 * 	@author 		Wayne T Boka (https://github.com/wboka)
 * 	@description	Bootbox Error extends BootBoxJS (https://github.com/makeusabrew/bootbox)
 * 	@requirements	jQuery, Twitter Bootstrap, and BootboxJS	
 * 	@version        1.0.0			
 * 	@usage			See examples below
 *  @setup			Include this file after the Bootbox js file
 *  
 */

bootbox.error = function(options) {
    // Set the defaults
    var defaults = {
        className: 'bg-danger',
        title: 'ERROR!',
        message: 'An Error has occurred. Please contact your system administrator.',
        closeButton: false,
        buttons: {
            "OK": function (){}
        }
    };
    
    // Extend the defaults with any passed in options
    var settings = $.extend(defaults, options);
    
    // Build and show the dialog
    bootbox.dialog({
        className: settings.className,
        title: settings.title,
        message: settings.message,
        closeButton: settings.closeButton,
        buttons: settings.buttons
    });
};

/* 
 * Examples
 * ========
*/

//bootbox.error(); // Use the defaults
//bootbox.error({ title: "New Error Title" }); // Change the title
//bootbox.error({ title: "New Error Title", message: "A new message" }); // Change the title and the message
//bootbox.error({ className: "text-danger", message: "A new message" }); // Change the wrapper class and the message
/*
bootbox.error({ 
    buttons: { 
        okButton: {
            label: "Great, I meant to do that!",
            className: "btn-success", 
            callBack: function() {} 
        },
        cancelButton: {
            label: "Did I do thaaaat!?",
            className: "btn-default", 
            callBack: function() {} 
        }
    }
}); // Change the buttons
*/
