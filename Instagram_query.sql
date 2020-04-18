
DROP DATABASE IF EXISTS ig_clone;
USE ig_clone;

-- 1. Find the five oldest users 

SELECT 
	username, 
    created_at 
		from users
ORDER BY created_at
LIMIT 5;

-- 2. Find most popular registration date

SELECT 
	DAYNAME(created_at) Day, 
    COUNT(id) as total 
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 1;

-- 3. Find the users who have never posted photo.

SELECT 
	username FROM users
LEFT JOIN photos 
	ON users.id=photos.user_id
WHERE photos.image_url IS NULL;

-- 4. Identify most popular photo (and user who created it)
   
   SELECT 
        users.username,
        photos.id,
        photos.image_url, 
        COUNT(*) AS total
    FROM photos
    INNER JOIN likes
        ON likes.photo_id = photos.id
    INNER JOIN users
        ON photos.user_id = users.id
    GROUP BY photos.id
    ORDER BY total DESC
    LIMIT 1;
    
    
-- 5. average number of photos per user
-- total number of photos/total number of users

SELECT 
	(SELECT COUNT(*) FROM photos)/ (SELECT COUNT(*) 
    FROM users) AS Avg_photo_per_user;

SELECT 
	id,
	photo_id,
    comments.comment_text, 
    user_id, COUNT(*)
    FROM comments 
GROUP BY photo_id;


-- Find 6. Most commonly used hashtags?

SELECT 
	tags.tag_name,
    COUNT(*) AS total 
FROM tags 
JOIN photo_tags 
	ON tags.id=photo_tags.tag_id 
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;

-- 7. Find users who have liked every single photo.


SELECT 
	username, 
    COUNT(*) AS num_likes 
FROM users 
JOIN likes
	ON users.id=likes.user_id
GROUP BY users.id
HAVING num_likes=(SELECT COUNT(*) FROM photos)
;