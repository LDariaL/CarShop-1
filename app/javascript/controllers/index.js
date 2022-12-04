

import { application } from "controllers/application"


import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)


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