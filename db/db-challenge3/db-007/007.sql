SELECT id,chatroom_name,chatroom_overview,
CASE is_sendable WHEN '0' THEN '禁止'
WHEN '1' THEN '許可' END AS ファイル送信,is_direct_chat,is_deleted,create_user,update_user,created_at,updated_at
FROM `chatrooms`
WHERE is_deleted = 0
AND is_direct_chat = 1
ORDER BY id ASC;