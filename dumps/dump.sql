--
-- PostgreSQL database dump
--

-- Dumped from database version 17.3 (Debian 17.3-3.pgdg120+1)
-- Dumped by pg_dump version 17.3 (Debian 17.3-3.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: analytics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.analytics (
    id integer NOT NULL,
    company_id integer NOT NULL,
    date_range_start timestamp without time zone NOT NULL,
    date_range_end timestamp without time zone NOT NULL,
    total_revenue double precision NOT NULL,
    total_bookings integer NOT NULL,
    average_booking_value double precision NOT NULL,
    completion_rate double precision NOT NULL,
    cancellation_rate double precision NOT NULL,
    most_popular_service_id integer,
    created_at timestamp without time zone NOT NULL,
    service_statistics json,
    time_statistics json,
    client_statistics json
);


ALTER TABLE public.analytics OWNER TO postgres;

--
-- Name: analytics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.analytics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.analytics_id_seq OWNER TO postgres;

--
-- Name: analytics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.analytics_id_seq OWNED BY public.analytics.id;


--
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id integer NOT NULL,
    company_id integer NOT NULL,
    service_id integer,
    user_id integer,
    staff_id integer,
    time_slot_id integer,
    client_name character varying,
    client_phone character varying,
    client_email character varying,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone,
    duration integer,
    price double precision,
    is_paid boolean,
    payment_id character varying,
    payment_status character varying,
    notes text,
    status character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_id_seq OWNER TO postgres;

--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    business_type character varying(50) NOT NULL,
    description text,
    owner_id integer,
    contact_name character varying(100),
    contact_phone character varying(20),
    contact_email character varying(100),
    website character varying(255),
    social_links text,
    city character varying(100),
    logo_url character varying(255),
    cover_image_url character varying(255),
    is_active boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    company_metadata json,
    moderation_status character varying(20),
    moderation_comment text,
    moderated_at timestamp without time zone,
    moderated_by integer,
    rating double precision,
    ratings_count integer
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.companies_id_seq OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    company_id integer NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    city character varying(100) NOT NULL,
    postal_code character varying(20),
    is_main boolean,
    latitude double precision,
    longitude double precision,
    contact_phone character varying(20),
    contact_email character varying(100),
    working_hours json,
    is_active boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locations_id_seq OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media (
    id integer NOT NULL,
    company_id integer NOT NULL,
    name character varying NOT NULL,
    type character varying NOT NULL,
    url character varying NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.media OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.media_id_seq OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: moderation_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moderation_records (
    id integer NOT NULL,
    company_id integer NOT NULL,
    status character varying(50) NOT NULL,
    moderator_id integer,
    auto_check_passed boolean,
    moderation_notes text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.moderation_records OWNER TO postgres;

--
-- Name: moderation_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moderation_records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moderation_records_id_seq OWNER TO postgres;

--
-- Name: moderation_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moderation_records_id_seq OWNED BY public.moderation_records.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    notification_type character varying(50) NOT NULL,
    read boolean NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_id_seq OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedules (
    id integer NOT NULL,
    company_id integer NOT NULL,
    service_id integer,
    name character varying NOT NULL,
    type character varying NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.schedules OWNER TO postgres;

--
-- Name: schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schedules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.schedules_id_seq OWNER TO postgres;

--
-- Name: schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schedules_id_seq OWNED BY public.schedules.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id integer NOT NULL,
    company_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    price double precision,
    duration integer,
    is_active boolean,
    category character varying(100),
    tags character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_seq OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: time_slots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_slots (
    id integer NOT NULL,
    schedule_id integer NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    max_clients integer NOT NULL,
    booked_clients integer NOT NULL,
    price double precision,
    status character varying NOT NULL,
    is_blocked boolean NOT NULL,
    notes text
);


ALTER TABLE public.time_slots OWNER TO postgres;

--
-- Name: time_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.time_slots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.time_slots_id_seq OWNER TO postgres;

--
-- Name: time_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.time_slots_id_seq OWNED BY public.time_slots.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying,
    hashed_password character varying,
    first_name character varying,
    last_name character varying,
    phone character varying,
    avatar character varying,
    is_active boolean,
    role character varying NOT NULL,
    is_superuser boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    telegram_id character varying(50),
    telegram_username character varying(100)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: working_hours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.working_hours (
    id integer NOT NULL,
    company_id integer NOT NULL,
    day character varying NOT NULL,
    open_time time without time zone,
    close_time time without time zone,
    is_working_day boolean NOT NULL
);


ALTER TABLE public.working_hours OWNER TO postgres;

--
-- Name: working_hours_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.working_hours_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.working_hours_id_seq OWNER TO postgres;

--
-- Name: working_hours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.working_hours_id_seq OWNED BY public.working_hours.id;


--
-- Name: analytics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analytics ALTER COLUMN id SET DEFAULT nextval('public.analytics_id_seq'::regclass);


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: moderation_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderation_records ALTER COLUMN id SET DEFAULT nextval('public.moderation_records_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: schedules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules ALTER COLUMN id SET DEFAULT nextval('public.schedules_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: time_slots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slots ALTER COLUMN id SET DEFAULT nextval('public.time_slots_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: working_hours id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.working_hours ALTER COLUMN id SET DEFAULT nextval('public.working_hours_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.alembic_version (version_num) VALUES ('dd12df7bf33a');


--
-- Data for Name: analytics; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: moderation_records; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: time_slots; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, email, hashed_password, first_name, last_name, phone, avatar, is_active, role, is_superuser, created_at, updated_at, telegram_id, telegram_username) VALUES (1, 'admin@admin.ru', '$2b$12$0YKDMGcRJ9a6aShajLru3O0Nj5LwNw0.S8yZIkIcbAjtoGVg4c/..', 'Admin', 'User', NULL, NULL, true, 'admin', true, '2025-04-08 18:12:46.333494', '2025-04-08 18:12:46.333494', NULL, NULL);


--
-- Data for Name: working_hours; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: analytics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.analytics_id_seq', 1, false);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 1, false);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 1, false);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 1, false);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_id_seq', 1, false);


--
-- Name: moderation_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moderation_records_id_seq', 1, false);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);


--
-- Name: schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schedules_id_seq', 1, false);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 1, false);


--
-- Name: time_slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.time_slots_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: working_hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.working_hours_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: analytics analytics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analytics
    ADD CONSTRAINT analytics_pkey PRIMARY KEY (id);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: moderation_records moderation_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderation_records
    ADD CONSTRAINT moderation_records_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: schedules schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: time_slots time_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slots
    ADD CONSTRAINT time_slots_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: working_hours working_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.working_hours
    ADD CONSTRAINT working_hours_pkey PRIMARY KEY (id);


--
-- Name: ix_analytics_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_analytics_id ON public.analytics USING btree (id);


--
-- Name: ix_bookings_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_bookings_id ON public.bookings USING btree (id);


--
-- Name: ix_companies_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_companies_id ON public.companies USING btree (id);


--
-- Name: ix_locations_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_locations_id ON public.locations USING btree (id);


--
-- Name: ix_media_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_media_id ON public.media USING btree (id);


--
-- Name: ix_moderation_records_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_moderation_records_id ON public.moderation_records USING btree (id);


--
-- Name: ix_notifications_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_notifications_id ON public.notifications USING btree (id);


--
-- Name: ix_schedules_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_schedules_company_id ON public.schedules USING btree (company_id);


--
-- Name: ix_schedules_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_schedules_id ON public.schedules USING btree (id);


--
-- Name: ix_schedules_service_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_schedules_service_id ON public.schedules USING btree (service_id);


--
-- Name: ix_services_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_services_id ON public.services USING btree (id);


--
-- Name: ix_time_slots_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_time_slots_id ON public.time_slots USING btree (id);


--
-- Name: ix_time_slots_schedule_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_time_slots_schedule_id ON public.time_slots USING btree (schedule_id);


--
-- Name: ix_time_slots_start_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_time_slots_start_time ON public.time_slots USING btree (start_time);


--
-- Name: ix_users_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_users_email ON public.users USING btree (email);


--
-- Name: ix_users_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_users_id ON public.users USING btree (id);


--
-- Name: ix_users_telegram_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_users_telegram_id ON public.users USING btree (telegram_id);


--
-- Name: ix_working_hours_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_working_hours_id ON public.working_hours USING btree (id);


--
-- Name: analytics analytics_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analytics
    ADD CONSTRAINT analytics_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: bookings bookings_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: bookings bookings_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id);


--
-- Name: bookings bookings_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.users(id);


--
-- Name: bookings bookings_time_slot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_time_slot_id_fkey FOREIGN KEY (time_slot_id) REFERENCES public.time_slots(id);


--
-- Name: bookings bookings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: companies companies_moderated_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_moderated_by_fkey FOREIGN KEY (moderated_by) REFERENCES public.users(id);


--
-- Name: companies companies_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- Name: locations locations_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: media media_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: moderation_records moderation_records_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderation_records
    ADD CONSTRAINT moderation_records_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: moderation_records moderation_records_moderator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderation_records
    ADD CONSTRAINT moderation_records_moderator_id_fkey FOREIGN KEY (moderator_id) REFERENCES public.users(id);


--
-- Name: notifications notifications_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: schedules schedules_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: schedules schedules_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id);


--
-- Name: services services_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id) ON DELETE CASCADE;


--
-- Name: time_slots time_slots_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slots
    ADD CONSTRAINT time_slots_schedule_id_fkey FOREIGN KEY (schedule_id) REFERENCES public.schedules(id);


--
-- Name: working_hours working_hours_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.working_hours
    ADD CONSTRAINT working_hours_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- PostgreSQL database dump complete
--

