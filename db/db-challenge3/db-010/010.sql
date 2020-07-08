SELECT U.display_name AS ユーザー名,C.chatroom_name AS チャットルーム名,P_2.created_at AS 投稿日時
FROM posts AS P_1
JOIN (SELECT chatroom_id,MAX(created_at) AS created_at FROM posts WHERE iis_deleted = 0 GROUP BY chatroom_id)AS P_2
ON P_1.created_at = P_2.created_at
JOIN chatrooms AS C
ON P_2.chatroom_id = C.id
JOIN users_informations AS U
ON P_1.create_user = U.id
