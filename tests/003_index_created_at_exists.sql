DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM pg_indexes
    WHERE schemaname='public'
      AND tablename='users'
      AND indexname='idx_users_created_at'
  ) THEN
    RAISE EXCEPTION 'idx_users_created_at index does not exist';
  END IF;
END $$;
