
function selectlicense(){
    if($('#license_select').val()==""){
        $('#year_area').addClass('hidden');
        $('#subject_area').addClass('hidden');
        $('#btn_area').addClass('hidden');
    }else {
        $('#year_area').removeClass('hidden');
    }
}

function selectYear(){
    if($('#license_select').val()==""){
        $('#year_area').addClass('hidden');
    }else {
        $('#subject_area').removeClass('hidden');
        $('#btn_area').removeClass('hidden');
    }
    
}