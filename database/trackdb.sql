--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE address (
    id integer NOT NULL,
    address1 character varying,
    address2 character varying,
    city character varying,
    state character varying,
    zipcode character varying,
    phone character varying,
    email character varying,
    website character varying,
    location_id integer
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE address_id_seq OWNED BY address.id;


--
-- Name: anchor; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE anchor (
    id integer NOT NULL,
    name character varying,
    description character varying,
    zone_id integer
);


ALTER TABLE public.anchor OWNER TO postgres;

--
-- Name: anchor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE anchor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.anchor_id_seq OWNER TO postgres;

--
-- Name: anchor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE anchor_id_seq OWNED BY anchor.id;


--
-- Name: climb; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE climb (
    id integer NOT NULL,
    sesh_id integer,
    route_id integer,
    success boolean,
    user_grade integer,
    user_rating integer,
    comment character varying
);


ALTER TABLE public.climb OWNER TO postgres;

--
-- Name: climb_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE climb_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.climb_id_seq OWNER TO postgres;

--
-- Name: climb_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE climb_id_seq OWNED BY climb.id;


--
-- Name: location; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE location (
    id integer NOT NULL,
    name character varying,
    tagline character varying,
    description character varying,
    photo character varying
);


ALTER TABLE public.location OWNER TO postgres;

--
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_id_seq OWNER TO postgres;

--
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE location_id_seq OWNED BY location.id;


--
-- Name: route; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE route (
    id integer NOT NULL,
    name character varying,
    description character varying,
    anchor_id integer,
    defined_grade integer,
    length integer,
    created_on timestamp without time zone,
    active boolean,
    last_update timestamp without time zone,
    color character varying,
    photo character varying
);


ALTER TABLE public.route OWNER TO postgres;

--
-- Name: route_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE route_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.route_id_seq OWNER TO postgres;

--
-- Name: route_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE route_id_seq OWNED BY route.id;


--
-- Name: sesh; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE sesh (
    id integer NOT NULL,
    user_id integer,
    location_id integer,
    user_rating integer,
    comment character varying,
    photo character varying,
    date timestamp without time zone
);


ALTER TABLE public.sesh OWNER TO postgres;

--
-- Name: sesh_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sesh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sesh_id_seq OWNER TO postgres;

--
-- Name: sesh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sesh_id_seq OWNED BY sesh.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying,
    email character varying,
    fullname character varying,
    usertype integer,
    password character varying,
    gender character varying,
    height real,
    wingspan real,
    shoesize real,
    homegym_id integer,
    blurb character varying,
    photo character varying,
    active boolean,
    created_on timestamp without time zone
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- Name: zone; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE zone (
    id integer NOT NULL,
    name character varying,
    description character varying,
    photo character varying,
    location_id integer
);


ALTER TABLE public.zone OWNER TO postgres;

--
-- Name: zone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE zone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zone_id_seq OWNER TO postgres;

--
-- Name: zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE zone_id_seq OWNED BY zone.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address ALTER COLUMN id SET DEFAULT nextval('address_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anchor ALTER COLUMN id SET DEFAULT nextval('anchor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY climb ALTER COLUMN id SET DEFAULT nextval('climb_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY location ALTER COLUMN id SET DEFAULT nextval('location_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY route ALTER COLUMN id SET DEFAULT nextval('route_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sesh ALTER COLUMN id SET DEFAULT nextval('sesh_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zone ALTER COLUMN id SET DEFAULT nextval('zone_id_seq'::regclass);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY address (id, address1, address2, city, state, zipcode, phone, email, website, location_id) FROM stdin;
1	225 Fake Zone		Puerto Sancho	AK	98654	789-555-2320	testgymone@example.com	http://www.testgymone.com/gym	1
2	12548 Street Sandwich		Doodle	OK	00654	555-555-2320	thesendcastle@example.com	http://www.sendcastle.com/home	2
\.


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('address_id_seq', 2, true);


--
-- Data for Name: anchor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY anchor (id, name, description, zone_id) FROM stdin;
1	TG Alpha A1	Test Gym Zone Alpha Anchor 1	1
2	TG Burger A1	Test Gym Zone Burger Anchor 1	2
3	SC Bridge A1	Send Castle Zone Bridge Anchor 1	3
4	SC Garage A1	Send Castle Zone Garage Anchor 1	4
\.


--
-- Name: anchor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('anchor_id_seq', 4, true);


--
-- Data for Name: climb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY climb (id, sesh_id, route_id, success, user_grade, user_rating, comment) FROM stdin;
1	1	2	t	2	1	The description for this route was very accurate!
\.


--
-- Name: climb_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('climb_id_seq', 1, true);


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY location (id, name, tagline, description, photo) FROM stdin;
1	Test Gym One	An Awesome Gym For Application Testing!	North America's largest web application testing rock climbing gym! With over 500 routes and thousands of bugs, this gym is perfect for the developer looking to debug their Flask web application!	http://i.imgur.com/WnYcSJC.png
2	The Send Castle	Castles in the Send	Puns await you as you challenge these challenging challenges of challenge! Does the word challenge look weird to you now???	http://i.imgur.com/Msl4RI3.png
\.


--
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('location_id_seq', 2, true);


--
-- Data for Name: route; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY route (id, name, description, anchor_id, defined_grade, length, created_on, active, last_update, color, photo) FROM stdin;
1	Get Well Soon	An epic of epic proportions. Wear gloves.	1	1200	\N	2016-08-02 05:42:22.577412	t	2016-08-02 05:42:22.577429	Blue	http://i.imgur.com/PafU8fu.png
2	Party Shuffle	A boring slog up endless jugs. Our setters really phoned it in on this one.	2	1800	\N	2016-08-02 05:42:22.579583	t	2016-08-02 05:42:22.579601	Pink	http://i.imgur.com/3UwMAsC.jpg
3	Ball Pit	Honestly, this is just a pit full of balls.	3	900	\N	2016-08-02 05:42:22.581368	t	2016-08-02 05:42:22.581383	Multi	http://i.imgur.com/mPbplJT.jpg
4	Parking Lot	Some like to describe the famous Smith Rock Testpiece 'To Bolt Or Not To Be' as a 'Vertical Parking Lot'. This is just a normal horizontal parking lot. Oops.	4	100	\N	2016-08-02 05:42:22.582954	t	2016-08-02 05:42:22.582966	Asphalt	http://i.imgur.com/5rv0TDL.jpg
\.


--
-- Name: route_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('route_id_seq', 4, true);


--
-- Data for Name: sesh; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sesh (id, user_id, location_id, user_rating, comment, photo, date) FROM stdin;
1	1	1	2	This was one of my worst days of the year! Great work, said no one.	\N	2016-08-02 05:42:22.585507
\.


--
-- Name: sesh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sesh_id_seq', 1, true);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "user" (id, username, email, fullname, usertype, password, gender, height, wingspan, shoesize, homegym_id, blurb, photo, active, created_on) FROM stdin;
1	hambone	hambone@example.com	Ham Bone	2	hambonepassword	Male	180	177	42.5	1	I'm just really into ham these days!	http://i.imgur.com/2nf4xlf.jpg	t	2016-08-02 05:42:22.55903
2	testkitchen	testkitchen@example.com	T.K. Lewis	1	passwordstring	Female	175	176	36	2	RECIPE UPLOADED SUCCESSFULLY	http://i.imgur.com/ZPYTNU5.jpg	t	2016-08-02 05:42:22.560794
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_id_seq', 2, true);


--
-- Data for Name: zone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY zone (id, name, description, photo, location_id) FROM stdin;
1	Test Zone Alpha	An epic mud field, true senders only!	http://i.imgur.com/M7BUXi0.jpg	1
2	Test Zone Burger	Seventy vertical feet of AMERICAN BEEF!	http://i.imgur.com/7Nmaxlv.jpg	1
3	The Old Bridge	Literally an old bridge.	http://i.imgur.com/eFirR5X.jpg	2
4	Garage Box	Some guy's garage, use at your own risk...	http://i.imgur.com/YFRAh9n.jpg	2
\.


--
-- Name: zone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('zone_id_seq', 4, true);


--
-- Name: address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: anchor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY anchor
    ADD CONSTRAINT anchor_pkey PRIMARY KEY (id);


--
-- Name: climb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY climb
    ADD CONSTRAINT climb_pkey PRIMARY KEY (id);


--
-- Name: location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: route_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY route
    ADD CONSTRAINT route_pkey PRIMARY KEY (id);


--
-- Name: sesh_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sesh
    ADD CONSTRAINT sesh_pkey PRIMARY KEY (id);


--
-- Name: user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: zone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY zone
    ADD CONSTRAINT zone_pkey PRIMARY KEY (id);


--
-- Name: address_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_location_id_fkey FOREIGN KEY (location_id) REFERENCES location(id);


--
-- Name: anchor_zone_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anchor
    ADD CONSTRAINT anchor_zone_id_fkey FOREIGN KEY (zone_id) REFERENCES zone(id);


--
-- Name: climb_route_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY climb
    ADD CONSTRAINT climb_route_id_fkey FOREIGN KEY (route_id) REFERENCES route(id);


--
-- Name: climb_sesh_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY climb
    ADD CONSTRAINT climb_sesh_id_fkey FOREIGN KEY (sesh_id) REFERENCES sesh(id);


--
-- Name: route_anchor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY route
    ADD CONSTRAINT route_anchor_id_fkey FOREIGN KEY (anchor_id) REFERENCES anchor(id);


--
-- Name: sesh_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sesh
    ADD CONSTRAINT sesh_location_id_fkey FOREIGN KEY (location_id) REFERENCES location(id);


--
-- Name: sesh_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sesh
    ADD CONSTRAINT sesh_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- Name: user_homegym_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_homegym_id_fkey FOREIGN KEY (homegym_id) REFERENCES location(id);


--
-- Name: zone_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zone
    ADD CONSTRAINT zone_location_id_fkey FOREIGN KEY (location_id) REFERENCES location(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
