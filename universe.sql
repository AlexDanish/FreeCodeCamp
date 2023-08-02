--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30),
    star_id integer,
    speed_tkmh integer NOT NULL,
    radius_km integer NOT NULL,
    cycle numeric,
    description text,
    tail boolean,
    metal boolean
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    speed_kms integer NOT NULL,
    size_tly integer NOT NULL,
    stars numeric,
    description text,
    spiral boolean,
    black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    planet_id integer,
    speed integer NOT NULL,
    radius integer NOT NULL,
    craters numeric,
    description text,
    moons boolean,
    atmosphere boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    star_id integer,
    speed_kmh integer NOT NULL,
    radius_tkm integer NOT NULL,
    moons numeric,
    description text,
    belt boolean,
    atmosphere boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer,
    speed_kms integer NOT NULL,
    size_mkm integer NOT NULL,
    planets numeric,
    description text,
    neutron boolean,
    double boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'zoron', 1, 140, 5, 150, 'old', true, true);
INSERT INTO public.comet VALUES (2, 'xyom', 2, 150, 3, 110, 'old', true, true);
INSERT INTO public.comet VALUES (3, 'xiomy', 3, 150, 2, 110, 'new', true, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'azara', 200, 300, NULL, 'Elliptical Galaxies', false, true);
INSERT INTO public.galaxy VALUES (2, 'bylak', 250, 320, NULL, 'Spiral galaxies', true, true);
INSERT INTO public.galaxy VALUES (3, 'celin', 270, 310, NULL, 'Spiral galaxies', true, false);
INSERT INTO public.galaxy VALUES (4, 'dalis', 220, 350, NULL, 'Lenticular galaxies', false, false);
INSERT INTO public.galaxy VALUES (5, 'edgal', 210, 330, NULL, 'Spiral galaxies', true, false);
INSERT INTO public.galaxy VALUES (6, 'feraly', 210, 330, NULL, 'Elliptical Galaxies', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'hany', 1, 80, 1200, 356, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (2, 'hugy', 1, 80, 1200, 346, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (3, 'jira', 2, 80, 1100, 256, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (4, 'jula', 2, 75, 1300, 456, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (5, 'ysla', 3, 75, 1300, 456, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (6, 'hrany', 4, 80, 1200, 356, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (7, 'hlugy', 4, 80, 1200, 346, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (8, 'jyira', 5, 80, 1100, 256, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (9, 'jrula', 5, 75, 1300, 456, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (10, 'ywsla', 6, 75, 1300, 456, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (11, 'ahany', 6, 80, 1200, 356, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (12, 'ahugy', 7, 80, 1200, 346, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (13, 'ajira', 7, 80, 1100, 256, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (14, 'ajula', 8, 75, 1300, 456, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (15, 'aysla', 8, 75, 1300, 456, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (16, 'bhany', 9, 80, 1200, 356, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (17, 'bhugy', 9, 80, 1200, 346, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (18, 'bjira', 10, 80, 1100, 256, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (19, 'bjula', 10, 75, 1300, 456, 'Terrestrial', false, false);
INSERT INTO public.moon VALUES (20, 'bysla', 11, 75, 1300, 456, 'Terrestrial', false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'paragra', 1, 107, 6, 1, 'Terrestrial', false, true);
INSERT INTO public.planet VALUES (2, 'radar', 1, 120, 8, 3, 'Terrestrial', false, false);
INSERT INTO public.planet VALUES (3, 'seryn', 2, 150, 150, 10, 'Gaseous', true, true);
INSERT INTO public.planet VALUES (4, 'taronta', 2, 130, 140, 12, 'Gaseous', false, true);
INSERT INTO public.planet VALUES (5, 'porto', 3, 110, 120, 15, 'Gaseous', false, true);
INSERT INTO public.planet VALUES (6, 'ridyk', 3, 100, 9, 2, 'Terrestrial', true, false);
INSERT INTO public.planet VALUES (7, 'sadyn', 4, 140, 130, 11, 'Gaseous', false, true);
INSERT INTO public.planet VALUES (8, 'turi', 4, 110, 7, 1, 'Terrestrial', false, true);
INSERT INTO public.planet VALUES (9, 'utri', 5, 110, 10, 2, 'Terrestrial', false, false);
INSERT INTO public.planet VALUES (10, 'ustan', 5, 120, 7, 1, 'Terrestrial', false, true);
INSERT INTO public.planet VALUES (11, 'fadyn', 6, 140, 120, 15, 'Gaseous', false, true);
INSERT INTO public.planet VALUES (12, 'fustany', 6, 120, 8, 3, 'Terrestrial', false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'galas', 1, 250, 280, 15, 'Yellow dwarfs', false, false);
INSERT INTO public.star VALUES (2, 'ketla', 2, 280, 300, 21, 'White dwarfs', false, true);
INSERT INTO public.star VALUES (3, 'laura', 3, 210, 350, 22, 'Neutron stars', true, false);
INSERT INTO public.star VALUES (4, 'melody', 4, 250, 240, 12, 'Neutron stars', true, false);
INSERT INTO public.star VALUES (5, 'nargus', 5, 370, 300, 25, 'giant stars', false, false);
INSERT INTO public.star VALUES (6, 'opera', 6, 230, 2500, 11, 'White dwarfs', false, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: comet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

