BEGIN;
UPDATE chatrooms
SET is_sendable = 0,update_user = 1,updated_at = CURRENT_TIMESTAMP
WHERE id NOT IN (
    SELECT chatroom_id FROM participants
    WHERE user_id =1
)
AND chatrooms.is_deleted = 0;
COMMIT;
