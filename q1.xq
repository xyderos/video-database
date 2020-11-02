let $path := fn:doc("videos.xml")/result/videos/video
for $v in $path
where $v/genre = "special"
return $v/title