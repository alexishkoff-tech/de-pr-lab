DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_schema='public' AND table_name='users'
  ) THEN
    RAISE EXCEPTION 'users table does not exist';
  END IF;
END $$;
