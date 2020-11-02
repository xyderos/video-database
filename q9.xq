let $path := fn:doc("videos.xml")/result/videos/video

let $suggested_movie :=
	for $movie in $path
	where $movie/genre = "horror" and fn:not($movie/LaserDisk)
	order by $movie/user_rating descending
	return $movie/title
return $suggested_movie[1]