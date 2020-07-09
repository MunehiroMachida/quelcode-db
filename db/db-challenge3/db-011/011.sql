BEGIN;
UPDATE tasks
SET is_complete = 1,update_user = 1,updated_at = CURRENT_TIMESTAMP
WHERE created_at >= '2020-04-26 09:00:00'
AND created_at <= '2020-04-26 11:30:00'
AND is_deleted = 0
COMMIT;