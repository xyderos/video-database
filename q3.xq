let $v_path := fn:doc("videos.xml")/result/videos/video
let $a_path := fn:doc("videos.xml")/result/actors/actor

let $max := fn:max(
	for $ref in fn:distinct-values($v_path/actorRef)
	return fn:count($v_path/actorRef[. eq $ref])
)

for $ref in fn:distinct-values($v_path/actorRef)
let $actor := $a_path[@id eq $ref]
let $count := fn:count(($v_path/actorRef[. eq $ref]))
where $count = $max
return fn:concat('actor="',$actor,'"')