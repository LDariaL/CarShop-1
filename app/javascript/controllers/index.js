// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

jQuery(function($){
   $(".deleteAction").click(function() {
    const current_item = $(this).parents('tr')[0]
      if(confirm("Вы уверены?")) {
        $.ajax( {
            url: '/items/' + $(current_item).attr('data-item_id'),
            type: 'POST',
            data: { _method: 'DELETE' },
            success: function () {
                $(current_item).fadeOut("slow")
            }
        })
      }    
   })
})