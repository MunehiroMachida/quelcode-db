BEGIN;
UPDATE chatrooms
JOIN participants
ON chatrooms.id = participants.chatroom_id
SET chatrooms.is_sendable = 0,chatrooms.update_user = 1,chatrooms.updated_at = CURRENT_TIMESTAMP
WHERE participants.user_id NOT IN (1)
AND chatrooms.is_deleted = 0;
COMMIT;