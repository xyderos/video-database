let $path := fn:doc("videos.xml")/result/videos/video

for $genre in fn:distinct-values($path/genre)
	let $genre_movies :=
	for $movie in $path
	where $movie/genre = $genre
	order by $movie/user_rating
	return $movie/title
return (<genre genre="{$genre}"/> , $genre_movies)