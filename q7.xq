let $path := fn:doc("videos.xml")/result/videos/video
let $a_path := fn:doc("videos.xml")/result/actors/actor

let $actor :=
	for $actor_id in $a_path/@id
	order by fn:count($path[actorRef = $actor_id]/genre) descending
	return fn:distinct-values($a_path[@id = $actor_id])
return fn:concat('actor="',$actor[1],'"')