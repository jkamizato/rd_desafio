/**
 * Created by julio on 3/4/16.
 */

$(document).ready(function(){
    if($("#campo_extra_campo_tipo").val() != 'combobox') {
        $(".div_select_option").hide();
    }

    $("#campo_extra_campo_tipo").change(function(){
        if($("#campo_extra_campo_tipo").val() == 'combobox') {
            $(".div_select_option").fadeIn();
        } else {
            $(".div_select_option").fadeOut();
        }
    });
});