let $path := fn:doc("videos.xml")/result/videos/video

for $dir in fn:distinct-values($path/director)
let $movies_title := $path[director = $dir]/title
where fn:count($path/director[. = $dir]) >= 2
return <movie director = "{$dir}">{$movies_title}</movie>