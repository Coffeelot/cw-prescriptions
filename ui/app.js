window.addEventListener('message', function(data) {
    console.log(JSON.stringify(event.data))
    if (event.data.nui == 'cwpres') {
        $('.idcard').show();
        $('.idcard').addClass('slide-in');
        $("#name").html(event.data.information.recieverName);
        $("#citizenId").html(event.data.information.citizenId);
        $("#fromDate").html(event.data.information.fromDate);
        $("#expirationDate").html(event.data.information.expirationDate);
        $("#drug").html(event.data.information.drug);
        $("#giverName").html(event.data.information.giverName);
        $("#notes").html(event.data.information.notes);
    }
});

hidefunction = function() {
    $('.idcard').addClass('slide-out');
    setTimeout(function() {
        $('.idcard').removeClass('slide-in');
        $('.idcard').removeClass('slide-out');
        $('.idcard').hide();
        location.reload();
    }, 1000)
}

document.onkeyup = function(event) {
    event = event || window.event;
    var charCode = event.keyCode || event.QBich;
    console.log('keydown', charCode)
    if (charCode == 8 || charCode == 27) { // Nui hide key backspace
        $.post(`https://cw-prescriptions/escape`)
        hidefunction()
    }
};
