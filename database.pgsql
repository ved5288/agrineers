--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


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
-- Name: fertilizerdemand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fertilizerdemand (
    id integer NOT NULL,
    farmerid integer NOT NULL,
    fertilizer text NOT NULL,
    quantity integer NOT NULL,
    type text NOT NULL
);


ALTER TABLE fertilizerdemand OWNER TO postgres;

--
-- Name: aggrfertilizerdemand; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW aggrfertilizerdemand AS
 SELECT fertilizerdemand.fertilizer,
    sum(fertilizerdemand.quantity) AS demand
   FROM fertilizerdemand
  GROUP BY fertilizerdemand.fertilizer;


ALTER TABLE aggrfertilizerdemand OWNER TO postgres;

--
-- Name: aggrfertilizerdemand1; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW aggrfertilizerdemand1 AS
 SELECT fertilizerdemand.fertilizer,
    sum(fertilizerdemand.quantity) AS demand
   FROM fertilizerdemand
  GROUP BY fertilizerdemand.fertilizer;


ALTER TABLE aggrfertilizerdemand1 OWNER TO postgres;

--
-- Name: fertilizersupply; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fertilizersupply (
    farmerid character varying,
    fertilizer character varying,
    quantity integer
);


ALTER TABLE fertilizersupply OWNER TO postgres;

--
-- Name: aggrfertilizersupply; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW aggrfertilizersupply AS
 SELECT fertilizersupply.fertilizer,
    sum(fertilizersupply.quantity) AS supply
   FROM fertilizersupply
  GROUP BY fertilizersupply.fertilizer;


ALTER TABLE aggrfertilizersupply OWNER TO postgres;

--
-- Name: aggrfertilizersupply1; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW aggrfertilizersupply1 AS
 SELECT fertilizersupply.fertilizer,
    sum(fertilizersupply.quantity) AS supply
   FROM fertilizersupply
  GROUP BY fertilizersupply.fertilizer;


ALTER TABLE aggrfertilizersupply1 OWNER TO postgres;

--
-- Name: cropavailable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cropavailable (
    farmerid character varying,
    crop character varying,
    quantity integer
);


ALTER TABLE cropavailable OWNER TO postgres;

--
-- Name: farmercrops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE farmercrops (
    farmerid character varying,
    crop character varying,
    acres integer
);


ALTER TABLE farmercrops OWNER TO postgres;

--
-- Name: farmers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE farmers (
    id integer NOT NULL,
    name character varying,
    village character varying,
    mobile character(10),
    interestgroup character varying,
    landsize integer,
    bankaccount character varying,
    sharecertificate character varying,
    password character varying
);


ALTER TABLE farmers OWNER TO postgres;

--
-- Name: farmers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE farmers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE farmers_id_seq OWNER TO postgres;

--
-- Name: farmers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE farmers_id_seq OWNED BY farmers.id;


--
-- Name: fertilizersupply_quan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fertilizersupply_quan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fertilizersupply_quan_seq OWNER TO postgres;

--
-- Name: fertilizersupply_quan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fertilizersupply_quan_seq OWNED BY fertilizersupply.quantity;


--
-- Name: seeddemand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE seeddemand (
    farmerid character varying,
    seed character varying,
    quantity integer
);


ALTER TABLE seeddemand OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY farmers ALTER COLUMN id SET DEFAULT nextval('farmers_id_seq'::regclass);


--
-- Data for Name: cropavailable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cropavailable (farmerid, crop, quantity) FROM stdin;
\.


--
-- Data for Name: farmercrops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY farmercrops (farmerid, crop, acres) FROM stdin;
undefined	kk	88
undefined	jj	99
undefined	dd	33
undefined	ee	66
1	rice	22
1	rice	22
1	jdowqjo	44
3	rice	55
3	bdj	545
3	rice	88
3	wheat	99
3	rice	10
\.


--
-- Data for Name: farmers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY farmers (id, name, village, mobile, interestgroup, landsize, bankaccount, sharecertificate, password) FROM stdin;
1	Vedant	a	9884515008		2		a	\N
3	Vedant	Sirpur-Kaghaznagar	9876543210	a	123		abc	cs14b053
5	Vedant	Sirpur-Kaghaznagar	9876543211	a	123		abc	cs14b053
\.


--
-- Name: farmers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('farmers_id_seq', 6, true);


--
-- Data for Name: fertilizerdemand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fertilizerdemand (id, farmerid, fertilizer, quantity, type) FROM stdin;
1	1	a	25	organic
2	1	a	37	organic
3	1	c	25	organic
4	1	a	37	organic
\.


--
-- Data for Name: fertilizersupply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fertilizersupply (farmerid, fertilizer, quantity) FROM stdin;
1	Urea	2
2	Urea	5
1	a	25
1	a	37
1	a	25
1	b	37
\.


--
-- Name: fertilizersupply_quan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fertilizersupply_quan_seq', 1, false);


--
-- Data for Name: seeddemand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY seeddemand (farmerid, seed, quantity) FROM stdin;
\.


--
-- Name: farmers_mobile_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY farmers
    ADD CONSTRAINT farmers_mobile_key UNIQUE (mobile);


--
-- Name: farmers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY farmers
    ADD CONSTRAINT farmers_pkey PRIMARY KEY (id);


--
-- Name: fertilizerdemand1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fertilizerdemand
    ADD CONSTRAINT fertilizerdemand1_pkey PRIMARY KEY (id);


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

