let $path := fn:doc("videos.xml")/result/videos/video
let $brad := fn:doc("videos.xml")/result/actors/actor[. eq "Pitt, Brad"]/@id
let $morgan := fn:doc("videos.xml")/result/actors/actor[. eq "Freeman, Morgan"]/@id

let $movie :=
	for $v in $path
	order by $v/user_rating
	return $v[actorRef = $brad and actorRef = $morgan]/title
return $movie[1]