SET check_function_bodies = false;
CREATE FUNCTION public.set_current_timestamp_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$;
CREATE TABLE public."Addresses" (
    id integer NOT NULL,
    kebele text,
    woreda text,
    city text,
    zone text NOT NULL,
    region text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    country text DEFAULT 'Ethiopia'::text NOT NULL,
    "userId" integer
);
CREATE SEQUENCE public."Addresses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public."Addresses_id_seq" OWNED BY public."Addresses".id;
CREATE TABLE public."Location" (
    id integer NOT NULL,
    "machineryId" integer,
    "driverName" text NOT NULL,
    "driverPhone" text NOT NULL,
    lat text NOT NULL,
    long text NOT NULL,
    status text DEFAULT 'idle'::text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public."Location_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public."Location_id_seq" OWNED BY public."Location".id;
CREATE TABLE public."Machinery" (
    name text,
    "madeIn" text,
    manufacturer text NOT NULL,
    year integer NOT NULL,
    model text,
    "serialNo" text,
    "chassieNo" text NOT NULL,
    "motorNo" text NOT NULL,
    description text NOT NULL,
    specification jsonb DEFAULT jsonb_build_array() NOT NULL,
    "isLowbed" boolean NOT NULL,
    "userId" integer,
    "machineId" integer,
    photos text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id integer NOT NULL
);
CREATE SEQUENCE public."Machinery_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public."Machinery_id_seq" OWNED BY public."Machinery".id;
CREATE TABLE public."Machines" (
    name text NOT NULL,
    description text NOT NULL,
    "parentId" integer,
    "isLowbed" boolean NOT NULL,
    "photoUrl" text NOT NULL,
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public."Machines_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public."Machines_id_seq" OWNED BY public."Machines".id;
CREATE TABLE public."Users" (
    id integer NOT NULL,
    "firstName" text,
    "lastName" text,
    email text,
    username text NOT NULL,
    password text,
    "phoneNo" text NOT NULL,
    "mobileNo" text,
    "photoUrl" text NOT NULL,
    "isActivated" boolean DEFAULT false NOT NULL,
    "isApproved" boolean DEFAULT false NOT NULL,
    "activationKey" uuid DEFAULT public.gen_random_uuid() NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    spam boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;
CREATE TABLE public.account (
    avatar_gravatar_hash text,
    id integer,
    iso_639_1 text,
    iso_3166_1 text,
    name text,
    include_adult text,
    username text
);
CREATE TABLE public.movie (
    adult text,
    backdrop_path integer,
    genre_ids integer,
    id integer,
    original_language text,
    original_title text,
    overview text,
    release_date timestamp without time zone,
    poster_path integer,
    popularity numeric(7,6),
    title text,
    video text,
    vote_average numeric(2,1),
    vote_count integer,
    first_air_date timestamp without time zone,
    original_name text,
    origin_country text,
    name text,
    rating integer,
    air_date timestamp without time zone,
    episode_number integer,
    production_code text,
    season_number integer,
    show_id integer,
    still_path text
);
ALTER TABLE ONLY public."Addresses" ALTER COLUMN id SET DEFAULT nextval('public."Addresses_id_seq"'::regclass);
ALTER TABLE ONLY public."Location" ALTER COLUMN id SET DEFAULT nextval('public."Location_id_seq"'::regclass);
ALTER TABLE ONLY public."Machinery" ALTER COLUMN id SET DEFAULT nextval('public."Machinery_id_seq"'::regclass);
ALTER TABLE ONLY public."Machines" ALTER COLUMN id SET DEFAULT nextval('public."Machines_id_seq"'::regclass);
ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);
ALTER TABLE ONLY public."Addresses"
    ADD CONSTRAINT "Addresses_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Location"
    ADD CONSTRAINT "Location_driverPhone_key" UNIQUE ("driverPhone");
ALTER TABLE ONLY public."Location"
    ADD CONSTRAINT "Location_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Machinery"
    ADD CONSTRAINT "Machinery_chassieNo_key" UNIQUE ("chassieNo");
ALTER TABLE ONLY public."Machinery"
    ADD CONSTRAINT "Machinery_motorNo_key" UNIQUE ("motorNo");
ALTER TABLE ONLY public."Machinery"
    ADD CONSTRAINT "Machinery_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Machinery"
    ADD CONSTRAINT "Machinery_serialNo_key" UNIQUE ("serialNo");
ALTER TABLE ONLY public."Machines"
    ADD CONSTRAINT "Machines_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);
ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_mobileNo_key" UNIQUE ("mobileNo");
ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_phoneNo_key" UNIQUE ("phoneNo");
ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key" UNIQUE (username);
CREATE TRIGGER "set_public_Addresses_updated_at" BEFORE UPDATE ON public."Addresses" FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER "set_public_Addresses_updated_at" ON public."Addresses" IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER "set_public_Location_updated_at" BEFORE UPDATE ON public."Location" FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER "set_public_Location_updated_at" ON public."Location" IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER "set_public_Machinery_updated_at" BEFORE UPDATE ON public."Machinery" FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER "set_public_Machinery_updated_at" ON public."Machinery" IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER "set_public_Machines_updated_at" BEFORE UPDATE ON public."Machines" FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER "set_public_Machines_updated_at" ON public."Machines" IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER "set_public_Users_updated_at" BEFORE UPDATE ON public."Users" FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER "set_public_Users_updated_at" ON public."Users" IS 'trigger to set value of column "updated_at" to current timestamp on row update';
ALTER TABLE ONLY public."Addresses"
    ADD CONSTRAINT "Addresses_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON DELETE CASCADE;
ALTER TABLE ONLY public."Location"
    ADD CONSTRAINT "Location_machineryId_fkey" FOREIGN KEY ("machineryId") REFERENCES public."Machinery"(id) ON DELETE CASCADE;
ALTER TABLE ONLY public."Machinery"
    ADD CONSTRAINT "Machinery_machineId_fkey" FOREIGN KEY ("machineId") REFERENCES public."Machines"(id) ON DELETE RESTRICT;
ALTER TABLE ONLY public."Machinery"
    ADD CONSTRAINT "Machinery_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON DELETE RESTRICT;
ALTER TABLE ONLY public."Machines"
    ADD CONSTRAINT "Machines_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES public."Machines"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
