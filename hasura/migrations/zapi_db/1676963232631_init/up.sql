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
CREATE TABLE public.movies (
    id integer NOT NULL,
    name text NOT NULL,
    overview text,
    poster_path text,
    release_date date,
    vote_average numeric,
    vote_count integer,
    media_type text,
    owner integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_by integer,
    created_by integer,
    backdrop_path text
);
CREATE SEQUENCE public."Movies_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public."Movies_id_seq" OWNED BY public.movies.id;
CREATE TABLE public.addresses (
    id integer NOT NULL,
    name text,
    address text NOT NULL,
    city text NOT NULL,
    country text NOT NULL,
    state text,
    zipcode text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;
CREATE TABLE public.cinemas (
    id integer NOT NULL,
    name text NOT NULL,
    email_address text NOT NULL,
    phone_no text NOT NULL,
    "isOpen" boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    address_id integer
);
CREATE SEQUENCE public.cinemas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.cinemas_id_seq OWNED BY public.cinemas.id;
CREATE TABLE public.users (
    first_name text NOT NULL,
    last_name text NOT NULL,
    email_address text NOT NULL,
    password text NOT NULL,
    "isVerified" boolean DEFAULT false NOT NULL,
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);
ALTER TABLE ONLY public.cinemas ALTER COLUMN id SET DEFAULT nextval('public.cinemas_id_seq'::regclass);
ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public."Movies_id_seq"'::regclass);
ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
ALTER TABLE ONLY public.movies
    ADD CONSTRAINT "Movies_name_key" UNIQUE (name);
ALTER TABLE ONLY public.movies
    ADD CONSTRAINT "Movies_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.cinemas
    ADD CONSTRAINT cinemas_address_id_key UNIQUE (address_id);
ALTER TABLE ONLY public.cinemas
    ADD CONSTRAINT cinemas_email_address_key UNIQUE (email_address);
ALTER TABLE ONLY public.cinemas
    ADD CONSTRAINT cinemas_phone_no_key UNIQUE (phone_no);
ALTER TABLE ONLY public.cinemas
    ADD CONSTRAINT cinemas_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_address_key UNIQUE (email_address);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
CREATE TRIGGER "set_public_Movies_updated_at" BEFORE UPDATE ON public.movies FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER "set_public_Movies_updated_at" ON public.movies IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_addresses_updated_at BEFORE UPDATE ON public.addresses FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_addresses_updated_at ON public.addresses IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_cinemas_updated_at BEFORE UPDATE ON public.cinemas FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_cinemas_updated_at ON public.cinemas IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_users_updated_at BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_users_updated_at ON public.users IS 'trigger to set value of column "updated_at" to current timestamp on row update';
