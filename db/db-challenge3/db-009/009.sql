SELECT COUNT(posts.chatroom_id) AS 投稿数,chatrooms.chatroom_name
FROM posts
JOIN chatrooms
ON posts.chatroom_id = chatrooms.id
JOIN users_informations
ON posts.create_user = users_informations.id
WHERE posts.is_deleted NOT IN (1)
AND users_informations.is_deleted NOT IN (1)
GROUP BY posts.chatroom_id
ORDER BY COUNT(posts.chatroom_id) DESC;