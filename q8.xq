let $path := fn:doc("videos.xml")/result/videos/video

let $best_director :=
	for $d in fn:distinct-values($path/director)
	let $sum := fn:sum(
		for $v in $path
		where $v/director = $d
		return $v/user_rating)
	order by $sum descending
	return $d
return $best_director[1]