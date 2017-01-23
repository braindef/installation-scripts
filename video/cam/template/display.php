   <?php

   $files = glob("*.*");

  for ($i=count($files)-200; $i<count($files); $i++)

{

$image = $files[$i];
$supported_file = array(
    'gif',
    'jpg',
    'jpeg',
    'png'
);


if (empty($_GET["width"])) {
	 $width=100; 
}
else {
	 $width=$_GET["width"];
	 }


$ext = strtolower(pathinfo($image, PATHINFO_EXTENSION));
if (in_array($ext, $supported_file)) {
    echo '<a href="./'.$image .'"><img width='.$width.' src="'.$image .'" ></a>';
    echo '
';

} else {
    continue;
 }

}

?>

display.php?width=$width
