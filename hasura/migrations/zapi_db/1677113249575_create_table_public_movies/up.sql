CREATE TABLE "public"."movies" ("id" serial NOT NULL, "name" text NOT NULL, "overview" text, "poster_path" text, "release_date" text, "media_type" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , UNIQUE ("name"), UNIQUE ("overview"));
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
CREATE TRIGGER "set_public_movies_updated_at"
BEFORE UPDATE ON "public"."movies"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_movies_updated_at" ON "public"."movies" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
