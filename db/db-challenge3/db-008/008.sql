SELECT users_informations.display_name,chatrooms.chatroom_name,CAST(participants.participation_date AS DATE)
FROM `participants`
JOIN `users_informations`
ON participants.user_id = users_informations.id
JOIN `chatrooms`
ON participants.chatroom_id = chatrooms.id
WHERE users_informations.is_deleted = 0
AND chatrooms.is_deleted = 0
ORDER BY participants.participation_date ASC;