$(document).on('click', ".delete", function(){
    click_id = $(this).attr('id');
    header_h2 = $("#" + click_id).parent().parent().text().trim();
    // console.log(header_h2);
    $(".class_"+ click_id).remove();

    html = `
    <div class="added_`+ click_id +`"><a id="`+ click_id +`" href="#" class="action-button added_btn">` + header_h2 + `</a></div>
    `;
    // console.log(html);
    if($('[class^="added_"]').length){
        last_class_added = document.querySelectorAll('[class^="added_"]');
        last_added = last_class_added[last_class_added.length -1].className;
        $(html).insertAfter("."+ last_added);
    }else{
        last_class_added = document.querySelectorAll('[class^="class_"]');
        last_added = last_class_added[last_class_added.length -1].className;
        $(html).insertAfter("."+ last_added);
    }
});

$(document).on("click", ".added_btn", function() {

    var clicked_id = $(this).attr('id');
    var p = $("#" + clicked_id).parent().text();
    var p = $.trim(p);
    Shiny.setInputValue('header', p, {priority: 'event'});
    $(".added_" + clicked_id).remove();
  
    if($("[class^='class_']").length) {
        last_panel = $("[class^='class_']").last().attr("class");
        Shiny.setInputValue('last_panel', last_panel, {priority: 'event'});
    } else {
        Shiny.setInputValue('last_panel', '#placeholder', {priority: 'event'});
    }
  
    Shiny.setInputValue('add_btn_clicked', clicked_id, {priority: 'event'});
  
  });

  $(document).ready(function() {
    // Suppress error alerts
    window.onerror = function(message, source, lineno, colno, error) {
        console.log("Error: ", message);
        return true; // Prevents the firing of the default event handler
    };
});

// alert("I am working");