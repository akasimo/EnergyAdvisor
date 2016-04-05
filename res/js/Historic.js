$(function() {
    var chartdata = {
        labels: [],
        datasets: [{
            label: "Prévision",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: []
        }, {
            label: "Réalité",
            fillColor: "rgba(151,187,205,0.2)",
            strokeColor: "rgba(151,187,205,1)",
            pointColor: "rgba(151,187,205,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: []
        }]
    };
    var options = {
        ///Boolean - Whether grid lines are shown across the chart
        scaleShowGridLines: true,
        //String - Colour of the grid lines
        scaleGridLineColor: "rgba(0,0,0,.05)",
        //Number - Width of the grid lines
        scaleGridLineWidth: 1,
        //Boolean - Whether to show horizontal lines (except X axis)
        scaleShowHorizontalLines: true,
        //Boolean - Whether to show vertical lines (except Y axis)
        scaleShowVerticalLines: true,
        //Boolean - Whether the line is curved between points
        bezierCurve: true,
        //Number - Tension of the bezier curve between points
        bezierCurveTension: 0.4,
        //Boolean - Whether to show a dot for each point
        pointDot: true,
        //Number - Radius of each point dot in pixels
        pointDotRadius: 4,
        //Number - Pixel width of point dot stroke
        pointDotStrokeWidth: 1,
        //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
        pointHitDetectionRadius: 20,
        //Boolean - Whether to show a stroke for datasets
        datasetStroke: true,
        //Number - Pixel width of dataset stroke
        datasetStrokeWidth: 2,
        //Boolean - Whether to fill the dataset with a colour
        datasetFill: true,
        //String - A legend template
        legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
        responsive: true,
        // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
        maintainAspectRatio: true
    };
    var ctx = $("#myChart").get(0).getContext("2d");
    var myLineChart = new Chart(ctx).Line(chartdata, options);
    $('#submitbutton').click(function() {
        var data = new Array();
        $('form[name="prediction"] :input').each(function() {
            data.push($(this).val()); //alerts the value
        });
        var post_data = "duree=" + data[0] + "&zone=" + data[1];
        $('#chartContainer').waitMe({
            effect: 'bounce',
            text: 'Chargement des résultats',
            bg: 'rgba(255,255,255,0.7)',
            color: '#000',
            sizeW: '',
            sizeH: '',
            source: '',
            onClose: function() {}
        });

        $.ajax({
            url: 'res/ajax/dataparser.php',
            type: 'POST',
            data: post_data,
            dataType: 'html',
            success: function(data) {
                var ret = jQuery.parseJSON(data);
                var dates = Object.keys(ret);
                $('#chartContainer').waitMe('hide');
                var l = chartdata['labels'].length
                if(l != 0 )for (i = 0; i <= 5 ; i++) myLineChart.removeData();
                for (i = 0; i < dates.length; i++) {
                    //myLineChart.removeData();
                    myLineChart.addData(ret[dates[i]], dates[i]);
                }

                /*$('#myChart').remove();
                $('#myChartContainer').html("<canvas id=\"myChart\"></canvas>")

                ctx = $('#myChart').get(0).getContext("2d");
                myLineChart = new Chart(ctx).Line(chartdata, options);*/
            },
            error: function(xhr, status, error) {
                $('#chartContainer').waitMe('hide');
                var err = eval(xhr.responseText);
                alert(err);
            }
        });
    });
});