CREATE TABLE "public"."cinemas" ("id" serial NOT NULL, "name" text NOT NULL, "email_address" text NOT NULL, "phone_no" text NOT NULL, "isOpen" boolean NOT NULL DEFAULT false, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , UNIQUE ("email_address") , UNIQUE ("phone_no"));
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_cinemas_updated_at"
BEFORE UPDATE ON "public"."cinemas"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_cinemas_updated_at" ON "public"."cinemas" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
