BEGIN;
UPDATE users_informations
SET is_deleted = 1,updated_at = CURRENT_TIMESTAMP
WHERE office_telephone_number IS NULL
AND mobilephone_number IS NULL;
COMMIT;
