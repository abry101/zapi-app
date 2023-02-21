CREATE TABLE "public"."addresses" ("id" serial NOT NULL, "name" text, "address" text NOT NULL, "city" text NOT NULL, "country" text NOT NULL, "state" text, "zipcode" text, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id"));
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
CREATE TRIGGER "set_public_addresses_updated_at"
BEFORE UPDATE ON "public"."addresses"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_addresses_updated_at" ON "public"."addresses" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
