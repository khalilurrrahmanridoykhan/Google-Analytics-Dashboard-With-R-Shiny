$(document).on('click', ".delete", function(){
    click_id = $(this).attr('id');
    header_h2 = $("#" + click_id).parent().parent().text().trim();
    // console.log(header_h2);
    $(".class-"+ click_id).remove();

    html = `
    <div class="added-`+ click_id +`"><a id="`+ click_id +`" href="#" class="action-button">` + header_h2 + `</a></div>
    `;
    console.log(html);
    if($('[class^="added-"]').length){
        last_class_added = document.querySelectorAll('[class^="added-"]');
        last_added = last_class_added[last_class_added.length -1].className;
        $(html).insertAfter("."+ last_added);
    }else{
        last_class_added = document.querySelectorAll('[class^="class-"]');
        last_added = last_class_added[last_class_added.length -1].className;
        $(html).insertAfter("."+ last_added);
    }
});

// alert("I am working");