<?php

printList();

function getDirArray($Path="./",$Filter=".*",$Sorted="True")
{
	$handle=opendir($Path);
	while ($file = readdir($handle)) {
		if (is_file("$Path/$file") && preg_match("/$Filter/i", $file) && strpos($file, "recovery") === false) {
			$dirArray[] = $file;
		}
	}
	closedir($handle);
	if (!is_array($dirArray)) {
		return 0;
	}
	if (strcasecmp($Sorted,"True")) {
		shuffle($dirArray);
	} else {
		sort($dirArray);
	}
	return $dirArray;
}

function printList() {

	$Path="./";
	$Folder="";
	if ( isset($_GET['open']) ) {
		$Folder=$_GET['open'];
		$Path="./".$_GET['open']."/";
	}

	$FileList = getDirArray($Path,"_multi.zip$|_nand.zip$|_mmc.zip$|_usb.zip$");

	if ($FileList) {
		$Url=$Folder."/".end($FileList);
		if (file_exists($Url)) {
		header('Content-Description: File Transfer');
		header('Content-Type: application/octet-stream');
		header('Content-Disposition: attachment; filename="'.basename($Url).'"');
		header('Expires: 0');
		header('Cache-Control: must-revalidate');
		header('Pragma: public');
		header('Content-Length: ' . filesize($Url));
		readfile($Url);
		exit;
}
	}
}
?>
