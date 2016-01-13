<?php

    set_time_limit(60);

    $path = 'datas/';
    $url = "http://www.smart.grtgaz.com/api/v1/fr/search?startDate=".$_POST['begin']."&endDate=".$_POST['end'];
    
    echo "<a href=".$url.">".$url."</a>";

    $filename = $path ."downloaded.xml";
    $datas = fopen ($url, "r");

    if($datas){
    	$output = fopen ($filename, "w");
      	if ($output){
      		while(!feof($datas)) fwrite($output, fread($datas, 8192 ), 8192 );
      	}

		fclose($f);
		echo "<script>alert(\"File has been downloaded: click \"Download\" to get it\");</script>";
		echo "<form action=\"".$output."\"><button type=\"submit\">Download from our server</button></form>";
    }


    if ($datas && $output) {
      fclose($datas);
      fclose($output);
    }
    
?>