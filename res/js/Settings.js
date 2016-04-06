$(function() {
    
    $('#algo').click(function() {
        $('#dialog').dialog({
            modal: true,
            title: 'Confirmation',
            autoOpen: true,
            width: 'auto',
            resizable: false,
            buttons: {
                Oui: function() {
                   
                    $('#maincontainer').waitMe({
                        effect: 'bounce',
                        text: 'Exécution de l\'algorithme. Ceci peut prendre du temps',
                        bg: 'rgba(255,255,255,0.7)',
                        color: '#000',
                        sizeW: '',
                        sizeH: '',
                        source: '',
                        onClose: function() {}
                    });

                   	$(this).dialog("close");

                    $.ajax({
                        url: 'res/ajax/settings.php',
                        type: 'POST',
                        dataType: 'html',
                        success: function(data) {
                            $('#maincontainer').waitMe('hide');
                            $('#thanks').replaceWith(data);
                        },
                        error: function() {
                            alert("Erreur serveur...");
                            $('#maincontainer').waitMe('hide');
                        }
                    });
                    

                },
                Non: function() {
                    $(this).remove();
                }
            },
            close: function(event, ui) {
                $(this).remove();
            }
        });
    });
});