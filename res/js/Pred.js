$(function() {
    $('#france').css('text-align', 'center');
    $('#zone-modal-title').css('text-align', 'center');
    $('#zone').css('display', 'none');
    $('#submitbutton').css('text-align', 'center');
    $('#result').css('display', 'none');
    $('#printButton').css('display','none');
    $('#titleMap').css('text-align','left');
    $('#titleCaption').css('text-align','left');
    $.fn.popOver = function(zone) {
    	var place;
    	
        $('#zone-modal-title').html("Vous avez sélectionné la zone \"" + zone + "\" définie par GRTGaz");
        $('#predmodal').modal('show');
        $('#zone').html("<option>" + zone + "</option>");
    };

    $('#printButton').click(function(){
        window.print();
    });

    $('#submitbutton').click(function() {
        $('#predmodal').modal('hide');
        $('#france').waitMe({
            effect: 'bounce',
            text: 'Chargement des prédictions',
            bg: 'rgba(255,255,255,0.7)',
            color: '#000',
            sizeW: '',
            sizeH: '',
            source: '',
            onClose: function() {}
        });

        var data = new Array();
        $('form[name="prediction"] :input').each(function() {
  				data.push($(this).val()); //alerts the value
		});
		//data[0] = duree
		//data[1] = zone
		

        var post_data = "duree=" + data[0] + "&zone=" + data[1];
        
        $.ajax({
            url: 'res/ajax/result.php',
            type: 'POST',
            data: post_data,
            dataType: 'html',
            success: function(data) {
                $('#predictResults').prepend(data);
                $('#france').waitMe('hide');
                $('#printButton').css('display','block');
            },
            error: function() {
                alert("Erreur serveur...");
                $('#france').waitMe('hide');

            }
        });
    });
});