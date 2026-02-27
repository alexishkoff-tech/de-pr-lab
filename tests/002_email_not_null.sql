DO $$
DECLARE
  is_nullable text;
BEGIN
  SELECT c.is_nullable INTO is_nullable
  FROM information_schema.columns c
  WHERE c.table_schema='public' AND c.table_name='users' AND c.column_name='email';

  IF is_nullable IS NULL THEN
    RAISE EXCEPTION 'email column does not exist';
  END IF;

  IF is_nullable <> 'NO' THEN
    RAISE EXCEPTION 'email must be NOT NULL';
  END IF;
END $$;
