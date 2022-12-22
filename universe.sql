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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    name character varying(30) NOT NULL,
    description text NOT NULL,
    quadrant character varying(10),
    brightest_star character varying(20),
    area_in_square_degrees integer,
    constellation_id integer NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: constellation_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_galaxy_id_seq OWNED BY public.constellation.galaxy_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    description text NOT NULL,
    galaxy_type character varying(20),
    distance_from_solar_system_in_light_years integer,
    estimated_amount_of_stars_in_billions integer,
    galaxy_id integer NOT NULL,
    constellation_id integer
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
    name character varying(20) NOT NULL,
    description text NOT NULL,
    apparent_magnitude numeric(4,2),
    mean_density_in_grams_per_cubic_cm numeric(4,2),
    orbit_its_planet_in_earth_days numeric(5,2),
    distance_from_its_planet_in_km integer,
    is_spherical boolean,
    moon_id integer NOT NULL,
    planet_id integer
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
    name character varying(20) NOT NULL,
    description text NOT NULL,
    mass_in_solar_mass numeric(4,2),
    apparent_magnitude numeric(4,2),
    distance_from_its_host_star_in_km integer,
    a_year_in_earth_days numeric(9,2),
    has_life boolean,
    planet_id integer NOT NULL,
    star_id integer
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
    name character varying(20),
    description text,
    color character varying(20) NOT NULL,
    stellar_type character varying(10) NOT NULL,
    mass_in_solar_mass numeric(4,2),
    apparent_magnitude numeric(4,2),
    age_in_million_of_years integer,
    star_id integer NOT NULL,
    galaxy_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: constellation galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN galaxy_id SET DEFAULT nextval('public.constellation_galaxy_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES ('Aquila', 'Aquila Constellation is the 22nd largest modern constellation. It is seen at locations between the latitudes +90° and −75°. Northern sky observers can spot Aquila in the night sky during summer. Is not easy to see from southern hemisphere. More than 15 stars in the constellation of Aquila were discovered to have planets.', 'NQ4', 'Altair', 652, 1, 1);
INSERT INTO public.constellation VALUES ('Bootes', 'Boötes is the 13th largest constellation in the night sky and  can be seen at latitudes between +90° and -50°. It is best seen during the month of June. Boötes has five stars with known planets and does not contain any Messier objects. It is associated with three meteor showers.', 'NQ3', 'Arcturus', 907, 2, 2);
INSERT INTO public.constellation VALUES ('Canis Major', 'Canis Major ranks as the 43rd largest constellation of today. It can be seen at latitudes between +60° and -90°. It is seen during the winter months in the northern hemisphere. The Greater Dog has many other interesting stars. There are lots of interesting deep-sky objects in this constellation, especially open clusters and a pair of colliding spiral galaxies, among others. More than 20 exoplanets have been discovered surrounding the stars of Canis Major. No meteor shower is related to Canis Major.', 'SQ2', 'Sirius', 380, 3, 3);
INSERT INTO public.constellation VALUES ('Carina', 'The constellation of Carina is the 34th largest constellation in the sky and can be seen at latitudes between +20° and -90°. It is best seen during the month of March. The constellation is also home to a number of deep sky objects, but it is not home to any Messier objects. There are two meteor showers associated with this constellation.', 'SQ2', 'Canopus', 494, 4, 4);
INSERT INTO public.constellation VALUES ('Cygnus', 'Cygnus is the 16th largest constellation in the night sky  and can be seen at latitudes between +90° and -40°. It is best visible during the month of September. It has 10 stars with known planets. Cygnus contains two Messier objects, and there are two meteor showers associated with the constellation.', 'NQ4', 'Deneb', 804, 5, 5);
INSERT INTO public.constellation VALUES ('Fornax', 'Fornax, the furnace Constellation, is regarded as a fairly small and faint constellation in the Southern Hemisphere. It is listed as the 41st largest Constellation in the night sky. The Constellation of Fornax is not considered to be a circumpolar constellation as it is not visible throughout the year in Southern latitudes. It is best seen in the winter months, especially in December. It’s more easily visible from the Southern Hemisphere at latitudes between +50° degrees and -9°. There are 59 Stars in Fornax that are possibly visible by the naked eye in a clear dark night sky. A total of 1096 Stars have been identified in this constellation. Fornax has 6 Stars with an exoplanet orbiting around it in the solar system but they are unlikely to be able to support life forms. The different components usually housed by Constellations are mainly Stars, Deep Sky Objects and Messier objects (galaxies).', 'SQ1', 'Dalim', 398, 6, 6);
INSERT INTO public.constellation VALUES ('Lyra', 'Lyra is the 52nd largest constellation in our sky and can be seen at latitudes between +90° and -40°. It is best seen during the month of August. It appears prominently in the northern sky during the Northern Hemisphere’s summer, and the whole constellation is visible for at least part of the year to observers north of latitude 42°S. Lyra contains nine stars with known planets and two Messier objects, galaxies  and there are three meteor showers associated with the constellation.', 'NQ4', 'Vega', 286, 7, 7);
INSERT INTO public.constellation VALUES ('Libra', 'Libra ranks as the 29th largest constellation in our sky. Libra is a faint constellation that does not contain any first magnitude Bright Stars but it is visible by naked eye from most points around the world in the Northern sky and Southern sky. The Constellation of Libra is most prominent in the Southern Celestial Hemisphere, if looking South during the month of June. There are 83 different Stars within Libra visible to the naked eye in a dark sky. Libra has 4 Stars with known Planets, orbiting around them in the solar system but they are unlikely to be able to support life forms.', 'SQ3', 'Zubeneschamali', 538, 8, 8);
INSERT INTO public.constellation VALUES ('Monoceros', 'Monoceros is the 35th largest constellation in our sky. It is between 75° and -85° latitudes. We can see it in the winter night sky. It is best visible to us during the month of February. The Monoceros constellation has many stars and deep-sky objects.', 'NQ2', 'HR2970', 482, 9, 9);
INSERT INTO public.constellation VALUES ('Pegasus', 'Pegasus is the 7th largest constellation in our sky. It’s visible in the Northern Hemisphere at latitudes between +90° and 60°. The Stars of Pegasus can be observed from Earth in the Northern Hemisphere in the month of October. The best months to spot the Constellation of Pegasus in the Northern Hemisphere is from late September to Early October. The Constellation of Pegasus contains nine stars with confirmed planets and one Messier Object and one associated meteor shower. Pegasus has 5 Bright Stars and 12 Star systems with exoplanets orbiting around them in the solar system but they are unlikely to be able to support life forms. There are many different Deep Sky Objects within the Constellation Pegasus. Not all the stars within the Pegasus Constellation are visible to the naked eye.', 'NQ4', 'Enif', 1121, 10, 10);
INSERT INTO public.constellation VALUES ('Virgo', 'Virgo is the second largest constellation in the sky, and can be seen at latitudes between +80° and -80°. It is best visible in the month of May. It also has 20 stars with known planets, which is more than any other constellation. Virgo contains many deep sky objects, including eleven Messier objects. There are two meteor showers associated with the constellation of Virgo.', 'SQ3', 'Spica', 1294, 11, 11);
INSERT INTO public.constellation VALUES ('Andromeda', 'Andromeda is the 19th largest constellation in the sky and can be seen at latitudes between +90° and -40°. Among other notable deep sky objects, Andromeda constellation contains the famous Andromeda Galaxy and the dwarf elliptical galaxies Messier 32 (Le Gentil) and Messier 110. Andromeda has a number of stars with confirmed exoplanets. The constellation is associated with a meteor shower.', 'NQ1', 'Alpheratz', 722, 12, 12);
INSERT INTO public.constellation VALUES ('Dorado', 'The constellation of Dorado is the 72nd largest constellation in the night sky and can be seen at latitudes between +20° and -90°. It is best seen during the month of January. The South Ecliptic pole also lies within this constellation. The Dorado Constellation is home to two stars with known planets. There are no Messier objects in the constellation and no known meteor showers associated with it. However, it is home to some interesting deep sky objects.', 'SQ1', 'HR-1465', 179, 13, 13);
INSERT INTO public.constellation VALUES ('Mensa', 'Mensa ranks as the 75th largest constellation in our sky. The Mensa constellation is located in the far south. Mensa is a relatively new constellation. It is visible to observers at latitudes between +4° and −90°. Mensa is circumpolar in most parts of the southern hemisphere because of its location, close to the south celestial pole. It can be seen during the winter months in the northern hemisphere. We cannot see many bright stars in Mensa. Three stars in the constellation of Mensa were discovered to host planets. It also has some deep-sky object. It does not contain any Messier object. More than two of its stars host extrasolar planets. It is associated with a meteor shower.', 'SQ1', 'Alpha Mensae', 154, 14, 14);
INSERT INTO public.constellation VALUES ('Cassiopeia', 'Cassiopeia ranks as the 25th largest constellation in our sky. It’s visible in the Northern Hemisphere at latitudes between +90° and 20°. Cassiopeia is visible all year in the Northern Hemisphere and in some northerly parts of the Southern Hemisphere in the late Spring. The Stars of Cassiopeia can be clearly observed from Earth in the Northern Hemisphere in November and December. The Cassiopeia Constellation contains: Eight main stars, Three stars with confirmed planets, Two Messier Objects. It has one associated meteor shower. Cassiopeia has 3 Bright Stars and 20 Star systems with exoplanets orbiting around them in the solar system but they are unlikely to be able to support life forms. Not all the stars within the Cassiopeia Constellation are visible to the naked eye. There are many different Stars and Deep Sky Objects within the Cassiopeia Constellation.', 'NQ1', 'Scheda', 598, 15, 15);
INSERT INTO public.constellation VALUES ('Leo', 'The Leo Constellation is one of the largest constellations in the sky. It is one of the easiest constellations to recognize, as it clearly resembles the outline of the lion. It can be seen at latitudes between +90° and 65°, an are which stretches from the North Pole down to the bottom of Argentina. The best months to spot the Constellation of Leo, the Lion and its trademark sickle are in April and May. Leo also has 13 Stars with Planets orbiting around them in the solar system but they are unlikely to be able to support life forms. Leo has a further 92 cataloged Stars with no planets. The Constellation Leo a total of 156 Stars. Not all the stars within the Leo Constellation are visible to the naked eye but with telescopes and modern imagery techniques is it possible to glimpse all of the 156 stars. The different components housed by the Constellation Leo are mainly Stars, Deep sky objects and Messier objects (galaxies). The Leo Constellation is associated with 2 meteor showers.', 'NQ2', 'Regulus', 947, 16, 16);
INSERT INTO public.constellation VALUES ('Perseus', 'The Perseus ranks as the 24th largest Constellation. Perseus is most prominent in the Northern Hemisphere, in winter and springtime. Perseus is circumpolar meaning it is visible all year round. It’s visible in the Northern Hemisphere at latitudes between +90° and +35° and covers an area of 615 square degrees in the Northern sky. The best months to spot the Constellation of Perseus in the Northern Hemisphere is December. The Perseus Constellation contains: 17 main stars, 7 stars that host exoplanets, 2 Messier Objects, 2 associated meteor showers.', 'NQ1', 'Mirfak', 615, 17, 17);
INSERT INTO public.constellation VALUES ('Gemini', 'The Gemini constellation is located in the northern celestial hemisphere. Gemini contains 10 important stars. There is only one Messier object in the constellation of Gemini but there are two meteor showers associated with the constellation. Currently, around 8 stars have been confirmed to host planets in the constellation.', 'NQ2', 'Pollux', 514, 18, 18);
INSERT INTO public.constellation VALUES ('Orion', 'The constellation is home to many interesting stars and asterisms. Around 10 of these stars have been discovered to host exoplanets and there are three Messier objects located in Orion. Orion also has famous nebulae and deep-sky objects. Orion constellation is the 26th largest constellation in the sky. It is one of the brightest constellations and is therefore very easy to spot. It can also be seen all over the world, because it lies on the celestial equator. It is best viewed during January. There are three Messier objects in the constellation of Orion. The most common deep sky objects of Orion are the nebulae. There are also clusters and meteor showers that are well known.', 'NQ1', 'Rigel', 594, 19, 19);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda', 'The Andromeda Galaxy is a close neighbor of the Milky Way. We can easily see it with the naked eye. The Andromeda galaxy is the largest in the Local Group. This great galaxy shows some similarities to the Milky Way.', 'spiral', 2500000, 1000, 1, NULL);
INSERT INTO public.galaxy VALUES ('Canis Major Dwarf', 'Canis Major Dwarf Galaxy, member of the Local Group. The Canis Major Dwarf Galaxy is the closest galaxy to the Milky Way. It is being tidally disrupted by the enormous gravitational field of the Milky Way Galaxy. The galaxy is known as a dwarf galaxy on account of its size. There is nothing to indicate that the galaxy can not contain alien life forms or planets orbiting any of the many stars that the galaxy contains. When you look at the galaxy, you are not looking at it in its present form but how it looks millions or billions of years ago.', 'elliptical', 25000, 1, 2, NULL);
INSERT INTO public.galaxy VALUES ('Cygnus A', 'Cygnus A has the appearance of a double galaxy. It contains billions of stars. Radio energy is emitted from Cygnus A at an estimated 1045 ergs per second.  Although the galaxy is relatively distant, it appears to us as the second brightest radio source in the entire sky.', 'elliptical', 50000000, 1, 3, NULL);
INSERT INTO public.galaxy VALUES ('Maffei 1', 'Maffei 1 is a galaxy relatively close to the Milky Way Galaxy. It is part of the nearest group of galaxies to the Local Group. It contains billions of stars. The X-ray emission from the center is extended and likely comes from a number of stellar sources. Maffei 1 is very rich in stars and has more than 10 billion years in age.', 'elliptical', 9800000, 1, 4, NULL);
INSERT INTO public.galaxy VALUES ('Maffei 2', 'Maffei 2 is part of the nearest group of galaxies to the Local Group. Maffei 2 is not a Messier Object and do not have a Messier Number. There is nothing to suggest that there can not be any Exoplanets with or without Alien life forms orbiting any of the many stars that the galaxy contains. When we observe the galaxy, we are not looking at it as it currents appears but as it used to appear millions or billions of years ago given how long time takes to reach us from there. It contains billions of stars.', 'spiral', 1, 10000000, 5, NULL);
INSERT INTO public.galaxy VALUES ('Small Magellanic Clouds', 'The Small Magellanic Clouds is a satellite galaxy of the Milky Way. Because of that, it is believed to be orbiting the Milky Way galaxy. Depending on where we are on Earth, we can readily see them in the night sky under favorable conditions. Observers from the southern hemisphere can see its structure with the naked eye. However, it is not observable in most places up north. The two dwarf galaxies, LMC and SMC, are linked together by a stream of hydrogen called the Magellanic Bridge.', 'spiral', 3, 190000, 6, NULL);
INSERT INTO public.galaxy VALUES ('Large Magellanic Clouds', 'The LMC is an irregular galaxy. Depending on where we are on Earth, we can readily see them in the night sky under favorable conditions. Observers from the southern hemisphere can see both structures with the naked eye. However, they are not observable in most places up north. The LMC is one of the closest galaxies of the Milky Way. it is the fourth largest galaxy in the Local Group. It is one of our galaxy’s closest neighbors. At that distance, it is among the most distant objects that we can see with the unaided eye. LMC and SMC, are linked together by a stream of hydrogen called the Magellanic Bridge.', 'spiral', 3, 160000, 7, NULL);
INSERT INTO public.galaxy VALUES ('Milky Way', 'The Milky Way as a whole is moving through space at a rate of approximately 600 kilometers (373 miles) per second. It will collide with the Andromeda Galaxy in around 3.75 billion years. The surface brightness of the Milky Way is relatively low. That means it is difficult to see from any brightly lit urban or suburban location. Still, it is very prominent when the Moon is below the horizon. Inside the Milky Way are at least 100 billion planets and anywhere from 200 to 400 billion stars. About 17 billion exoplanets in the Milky Way lie in the habitable zone of their planetary systems. Surrounding the Galactic disk is a spheroidal halo of old stars and globular clusters. The supermassive black hole in the center of the Milky Way is called Sagittarius A. The Milky Way is our home galaxy. It is part of the local neighborhood of galaxies called the Local Group. The Milky Way might seem very large, but in galactic terms, it is only a medium-sized galaxy.', 'spiral', 400, 100000, 8, NULL);
INSERT INTO public.galaxy VALUES ('Virgo A', 'Virgo A is a giant galaxy whose nucleus contains a black hole, the first ever to be directly imaged. M87 is the most powerful known source of radio energy among the thousands of galactic systems constituting the so-called Virgo Cluster. It is also a powerful x-ray-source.', 'elliptical', 1, 55000000, 9, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 'Moon, Earth’s sole natural satellite and nearest large celestial body. It is the brightest object in the sky after the Sun. Its shape is slightly flattened in a such a way that it bulges a little in the direction of Earth. Its mass distribution is not uniform. The Moon has no global magnetic field like that of Earth. Because of the Moon’s small size and mass, its surface gravity is only about one-sixth of the planet’s.', -2.50, 3.34, 27.00, 384400, true, 1, NULL);
INSERT INTO public.moon VALUES ('Deimos', 'Deimos has a very strange shape. The moon is so tiny that it would appear in the sky at a size similar to a star. The orbit path of this moon is circular and stable and would require braking by the atmosphere. Deimos is one of the smallest moons in the solar system.', 12.89, 1.47, 1.25, 23460, false, 2, NULL);
INSERT INTO public.moon VALUES ('Phobos', 'Phobos has a roughly ellipsoidal body. It is also closer to it’s primary than any other satellite in the Solar System. Phobos is one of the least reflective bodies in the Solar System. It orbits Mars below the synchronous orbit radius.', 11.80, 1.88, 0.30, 6000, false, 3, NULL);
INSERT INTO public.moon VALUES ('Amalthea', 'Amalthea circles Jupiter in a nearly circular orbit. Amalthea rotates at the same rate that it revolves around Jupiter. Amalthea’s long axis always points toward Jupiter. Amalthea is thought to have formed far from the heat of Jupiter. The moon of Jupiter is the reddest object yet discovered in the solar system and is thought to give off more heat and energy than it receives from the sun. It is a small, potato-shaped moon. Amalthea sits in the faint outer ring of the planet.', 14.10, 0.86, 0.50, 181400, false, 4, NULL);
INSERT INTO public.moon VALUES ('Callisto', 'Callisto orbits just beyond Jupiter’s main radiation belt. Callisto has a weak magnetic field induced by Jupiter’s field. Callisto doesn’t suffer from an orbital gravitational pull because it orbits further away from the planet.', 5.65, 1.83, 16.70, 1882700, false, 5, NULL);
INSERT INTO public.moon VALUES ('Europa', 'Europa has both an intrinsic and an induced magnetic field. Europa moon is one of the brightest objects in the solar system.', 5.29, 3.01, 3.50, 671000, true, 6, NULL);
INSERT INTO public.moon VALUES ('Ganymede', 'Ganymede is the largest and most massive moon  of the Solar System. Ganymede’s relatively low density. Ganymede is tidally locked to Jupiter and one side is always facing the planet.', 4.61, 1.93, 7.00, 10700000, true, 7, NULL);
INSERT INTO public.moon VALUES ('Io', 'Io rotates at the same rate that it revolves around Jupiter and so always keeps the same face to Jupiter. It has almost a circular orbit. Io has a very tenuous atmosphere. It is a slight ellipsoid in shape. As the satellite travels in its orbit, passing through the magnetic field of Jupiter, it produces an electric current of some five million amperes along a flux tube of spiraling electrons that links Io with the giant planet.', 5.02, 3.53, 1.80, 422000, true, 8, NULL);
INSERT INTO public.moon VALUES ('Dione', 'Dione is the 15th largest in the whole Solar System. The Moon Dione orbits within the densest area of Saturn’s E Ring. Dione is a very bright and reflective moon. It keeps one side facing Saturn as they rotate within their orbital period. Dione has two co-orbital moons, also referred to as Trojan moons, they are called Helene and Polydeuces.', 10.40, 1.48, 2.70, 37400, true, 9, NULL);
INSERT INTO public.moon VALUES ('Enceladus', 'Enceladus is considered a small moon. Enceladus is a very bright moon. It keeps one side facing Saturn as they rotate within their orbital period. It has a distorted oval shape.', 11.70, 1.61, 1.40, 238000, false, 10, NULL);
INSERT INTO public.moon VALUES ('Hyperion', 'Hyperion has a chaotic rotation, making its orientation hard to predict. It wobbles and keeps on tumbling through space. Hyperion is not tidally locked to Saturn. Because Hyperion is so far away from Saturn, it does not receive much tidal heating. Though it is a relatively large object, it is non-ellipsoidal in shape. In fact, that has an irregular form. More than 40% of this moon is empty space. We cannot see the moon with the naked eye.', 14.10, 0.54, 21.00, 1500000, false, 11, NULL);
INSERT INTO public.moon VALUES ('Iapetus', 'Iapetus is a large astronomical body. Also, Iapetus has a highly inclined orbit. The shape of Iapetus is greatly affected by its equatorial ridge. It has a walnut-shaped appearance. Its poles also look like they are somewhat flattened and squashed. We cannot see the moon with the naked eye. It has the longest revolution among the moons of Saturn. The orbit of Iapetus is very different from the other regular moons in the system.', 10.20, 1.09, 79.00, 35610000, false, 12, NULL);
INSERT INTO public.moon VALUES ('Mimas', 'Mimas is not large enough to form a completely round shape as held in place by its gravity. Instead, it is more ovoid (or egg shaped) in form. Mimas is the innermost moon of Saturn. It ranks as the smallest rounded astronomical body that is held together by its own gravity. Mimas is a very bright moon. It is estimated that it reflects over 80% of this sunlight source. This moon has low density. Mimas orbits Saturn in a prograde/direct motion direction following in the direction of the rotation of Saturn.', 12.90, 1.15, 0.90, 185500, false, 13, NULL);
INSERT INTO public.moon VALUES ('Phoebe', 'Phoebe moves in a retrograde orbit. Though it is dark and distant, Phoebe has a grand structure along its orbit—a ring! This ring is very large that it dwarfs the inner rings of Saturn. Since it is not in synchronous rotation with Saturn, its rotation and orbital period are so different. It has a very dark surface that reflects only 6% of the light that reaches it, absorbing the rest. The Phoebe ring is Saturn’s largest ring.', 16.00, 1.64, 550.00, 13000000, false, 14, NULL);
INSERT INTO public.moon VALUES ('Rhea', 'Rhea is an outer large moon of Saturn, lying beyond the E ring. Rhea is Saturn’s second-largest moon. It ranks as the ninth-largest moon in the Solar System. Its rotation period is the same as its orbital period. Only one side of Rhea faces the planet.', 10.00, 1.24, 4.50, 527000, true, 15, NULL);
INSERT INTO public.moon VALUES ('Tethys', 'Tethys has a diameter of 1,066 km (662 miles). Its density of about 1.0 grams per cubic cm. It revolves around Saturn in a prograde, circular orbit, which is within the planet E ring. Tethys rotates synchronously with its orbital period, keeping the same face toward Saturn and the same face forward in its orbit. It is accompanied by two tiny moons, Telesto and Calypso, that maintain gravitationally stable positions along its orbit. Telesto precedes Tethys by 60°, and Calypso follows by 60°. The surface is very bright and reflects nearly all incident visible sunlight.', 10.20, 0.98, 1.90, 295000, true, 16, NULL);
INSERT INTO public.moon VALUES ('Titan', 'It is the second-largest moon in our solar system. Aside from being the only moon with a dense atmosphere. Titan’s apparent magnitude is about 8.2. It can not be seen with the naked eye. This gigantic moon is 5,149.46 kilometers or 3,199.73 miles across. At 134,552,523,083,241,000,000,000 kg. It takes the same time for Titan to rotate on its axis and to orbit the planet Saturn. is tidally locked to the planet. The average surface temperature of Titan is approximately 94 K or −179.2 °C. The thick atmosphere of Titan acts like a double agent. A big percentage (about 90%) of the sunlight is absorbed by this moon’s atmosphere. Titan receives different amounts of sunlight as Saturn orbits the Sun. This brings about changes in seasons, most especially in the moon’s northern and southern hemispheres.', 8.20, 1.88, 16.00, 1222000, false, 17, NULL);
INSERT INTO public.moon VALUES ('Moon', 'Moon, Earth’s sole natural satellite and nearest large celestial body. It is the brightest object in the sky after the Sun. Its shape is slightly flattened in a such a way that it bulges a little in the direction of Earth. Its mass distribution is not uniform. The Moon has no global magnetic field like that of Earth. Because of the Moon’s small size and mass, its surface gravity is only about one-sixth of the planet’s.', -2.50, 3.34, 27.00, 384400, true, 18, NULL);
INSERT INTO public.moon VALUES ('Deimos', 'Deimos has a very strange shape. The moon is so tiny that it would appear in the sky at a size similar to a star. The orbit path of this moon is circular and stable and would require braking by the atmosphere. Deimos is one of the smallest moons in the solar system.', 12.89, 1.47, 1.25, 23460, false, 19, NULL);
INSERT INTO public.moon VALUES ('Phobos', 'Phobos has a roughly ellipsoidal body. It is also closer to it’s primary than any other satellite in the Solar System. Phobos is one of the least reflective bodies in the Solar System. It orbits Mars below the synchronous orbit radius.', 11.80, 1.88, 0.30, 6000, false, 20, NULL);
INSERT INTO public.moon VALUES ('Amalthea', 'Amalthea circles Jupiter in a nearly circular orbit. Amalthea rotates at the same rate that it revolves around Jupiter. Amalthea’s long axis always points toward Jupiter. Amalthea is thought to have formed far from the heat of Jupiter. The moon of Jupiter is the reddest object yet discovered in the solar system and is thought to give off more heat and energy than it receives from the sun. It is a small, potato-shaped moon. Amalthea sits in the faint outer ring of the planet.', 14.10, 0.86, 0.50, 181400, false, 21, NULL);
INSERT INTO public.moon VALUES ('Callisto', 'Callisto orbits just beyond Jupiter’s main radiation belt. Callisto has a weak magnetic field induced by Jupiter’s field. Callisto doesn’t suffer from an orbital gravitational pull because it orbits further away from the planet.', 5.65, 1.83, 16.70, 1882700, false, 22, NULL);
INSERT INTO public.moon VALUES ('Europa', 'Europa has both an intrinsic and an induced magnetic field. Europa moon is one of the brightest objects in the solar system.', 5.29, 3.01, 3.50, 671000, true, 23, NULL);
INSERT INTO public.moon VALUES ('Ganymede', 'Ganymede is the largest and most massive moon  of the Solar System. Ganymede’s relatively low density. Ganymede is tidally locked to Jupiter and one side is always facing the planet.', 4.61, 1.93, 7.00, 10700000, true, 24, NULL);
INSERT INTO public.moon VALUES ('Io', 'Io rotates at the same rate that it revolves around Jupiter and so always keeps the same face to Jupiter. It has almost a circular orbit. Io has a very tenuous atmosphere. It is a slight ellipsoid in shape. As the satellite travels in its orbit, passing through the magnetic field of Jupiter, it produces an electric current of some five million amperes along a flux tube of spiraling electrons that links Io with the giant planet.', 5.02, 3.53, 1.80, 422000, true, 25, NULL);
INSERT INTO public.moon VALUES ('Dione', 'Dione is the 15th largest in the whole Solar System. The Moon Dione orbits within the densest area of Saturn’s E Ring. Dione is a very bright and reflective moon. It keeps one side facing Saturn as they rotate within their orbital period. Dione has two co-orbital moons, also referred to as Trojan moons, they are called Helene and Polydeuces.', 10.40, 1.48, 2.70, 37400, true, 26, NULL);
INSERT INTO public.moon VALUES ('Enceladus', 'Enceladus is considered a small moon. Enceladus is a very bright moon. It keeps one side facing Saturn as they rotate within their orbital period. It has a distorted oval shape.', 11.70, 1.61, 1.40, 238000, false, 27, NULL);
INSERT INTO public.moon VALUES ('Hyperion', 'Hyperion has a chaotic rotation, making its orientation hard to predict. It wobbles and keeps on tumbling through space. Hyperion is not tidally locked to Saturn. Because Hyperion is so far away from Saturn, it does not receive much tidal heating. Though it is a relatively large object, it is non-ellipsoidal in shape. In fact, that has an irregular form. More than 40% of this moon is empty space. We cannot see the moon with the naked eye.', 14.10, 0.54, 21.00, 1500000, false, 28, NULL);
INSERT INTO public.moon VALUES ('Iapetus', 'Iapetus is a large astronomical body. Also, Iapetus has a highly inclined orbit. The shape of Iapetus is greatly affected by its equatorial ridge. It has a walnut-shaped appearance. Its poles also look like they are somewhat flattened and squashed. We cannot see the moon with the naked eye. It has the longest revolution among the moons of Saturn. The orbit of Iapetus is very different from the other regular moons in the system.', 10.20, 1.09, 79.00, 35610000, false, 29, NULL);
INSERT INTO public.moon VALUES ('Mimas', 'Mimas is not large enough to form a completely round shape as held in place by its gravity. Instead, it is more ovoid (or egg shaped) in form. Mimas is the innermost moon of Saturn. It ranks as the smallest rounded astronomical body that is held together by its own gravity. Mimas is a very bright moon. It is estimated that it reflects over 80% of this sunlight source. This moon has low density. Mimas orbits Saturn in a prograde/direct motion direction following in the direction of the rotation of Saturn.', 12.90, 1.15, 0.90, 185500, false, 30, NULL);
INSERT INTO public.moon VALUES ('Phoebe', 'Phoebe moves in a retrograde orbit. Though it is dark and distant, Phoebe has a grand structure along its orbit—a ring! This ring is very large that it dwarfs the inner rings of Saturn. Since it is not in synchronous rotation with Saturn, its rotation and orbital period are so different. It has a very dark surface that reflects only 6% of the light that reaches it, absorbing the rest. The Phoebe ring is Saturn’s largest ring.', 16.00, 1.64, 550.00, 13000000, false, 31, NULL);
INSERT INTO public.moon VALUES ('Rhea', 'Rhea is an outer large moon of Saturn, lying beyond the E ring. Rhea is Saturn’s second-largest moon. It ranks as the ninth-largest moon in the Solar System. Its rotation period is the same as its orbital period. Only one side of Rhea faces the planet.', 10.00, 1.24, 4.50, 527000, true, 32, NULL);
INSERT INTO public.moon VALUES ('Tethys', 'Tethys has a diameter of 1,066 km (662 miles). It revolves around Saturn in a prograde, circular orbit, which is within the E ring of its host planet. Tethys rotates synchronously with its orbital period, keeping the same face toward Saturn and the same face forward in its orbit. It is accompanied by two tiny moons, Telesto and Calypso, that maintain gravitationally stable positions along its orbit. Telesto precedes Tethys by 60°, and Calypso follows by 60°. The surface is very bright and reflects nearly all incident visible sunlight.', 10.20, 0.98, 1.90, 295000, true, 33, NULL);
INSERT INTO public.moon VALUES ('Titan', 'It is the second-largest moon in our solar system. Aside from being the only moon with a dense atmosphere. It can not be seen with the naked eye. This gigantic moon is 5,149.46 kilometers or 3,199.73 miles across. At 134,552,523,083,241,000,000,000 kg. It takes the same time for Titan to rotate on its axis and to orbit the planet Saturn. is tidally locked to the planet. The thick atmosphere of Titan acts like a double agent. A big percentage (about 90%) of the sunlight is absorbed by its atmosphere. Titan receives different amounts of sunlight as Saturn orbits the Sun. This brings about changes in seasons.', 8.20, 1.88, 16.00, 1222000, false, 34, NULL);
INSERT INTO public.moon VALUES ('Ariel', 'Ariel, second nearest of the five major moons of Uranus. Ariel orbits and rotates in the equatorial plane of Uranus, which is almost perpendicular to the orbit of Uranus and so has an extreme seasonal cycle. Ariel rotates synchronously with its orbital period. Its mean diameter is about 1,160 km (720 miles). The surface of Ariel is generally neutral in color.', 14.40, 1.59, 2.50, 191000, true, 35, NULL);
INSERT INTO public.moon VALUES ('Miranda', 'Miranda, innermost and smallest of the five major moons of Uranus. Miranda looks like it was pieced together from parts that did not quite merge properly. Slightly non spherical in shape, it has a mean diameter of about 470 km (290 miles). It has a low gravity. Miranda is one of the smallest objects in our Solar System that obtained its round shape from its own gravity.', 15.80, 1.20, 1.40, 130000, false, 36, NULL);
INSERT INTO public.moon VALUES ('Oberon', 'It has no magnetic field and no atmosphere either. The southern hemisphere of Oberon was facing the Sun during the flyby. The northern hemisphere, on the other hand, was in the dark so it was not observable. Uranus rotates from east to west. Oberon has a dark and slightly red appearance. With synchronous rotation, only one of its sides faces the planet all the time. It orbits Uranus in the equatorial plane together with the other moons. That is because the blue-green planet orbits the Sun on its side. The radius of Oberon is approximately 761.4 km. A slight eccentricity of 0.0014 is observed in this moon. Oberon has a surface area of 7,285,000 sq. km. It is the farthest from Uranus among the major moons.', 14.10, 1.63, 13.50, 584000, false, 37, NULL);
INSERT INTO public.moon VALUES ('Titania', 'The neutral gray color of Titania is typical of most of the significant Uranian moons. Titania has no atmosphere and no magnetic field. Titania is intermediate in terms of brightness. Due to Titania’s tilt, each of Titania’s poles experience 42 years in the sun and 42 years in the dark. It has a synchronous rotation, keeping the same face toward the planet and the same face forward in its orbit.', 13.90, 1.71, 8.70, 436000, true, 38, NULL);
INSERT INTO public.moon VALUES ('Umbriel', 'Umbriel, third nearest of the five major moons of Uranus and the one having the oldest surface of the group. The surface is the darkest among Uranian moons. Umbriel is a synchronous or tidally locked satellite. It is subject to an extreme seasonal cycle. Both northern and southern poles spend 42 years in complete darkness, and another 42 years in continuous sunlight, with the Sun rising close to the zenith over one of the poles at each solstice. The surface of Umbriel is slightly blue in color.', 14.50, 1.39, 4.20, 266000, true, 39, NULL);
INSERT INTO public.moon VALUES ('Nereid', 'Nereid is classified as an irregular moon. Nereid is an exceedingly faint moon. Nereid is unique because it has one of the most eccentric orbits of any moon in our solar system. Spectrally Nereid appears neutral in colour.', 19.20, 1.50, 360.00, 5514000, false, 40, NULL);
INSERT INTO public.moon VALUES ('Triton', 'Triton is unique among the large moons of the solar system in that it moves in a retrograde orbit. This moon always keeps the same face toward Neptune and leads with the same face in its orbit. Its unusual orbital characteristics suggest that it formed elsewhere in the solar system and was later captured by Neptune. Each of seasons in Triton, lasts nearly 41 years. Triton is the coldest known object in the Solar System. Very little sunlight is absorbed by the surface.', 13.47, 2.06, 5.80, 355000, false, 41, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 'Mercury orbits quickly around the Sun. Mercury is the smallest planet in the solar system and is one of five planets that is visible to the naked eye. Mercury has no moons or rings because of its low gravity and lack of atmosphere. Mercury has a weak magnetic field. The orbit of Mercury is an ellipse rather than circular. It has the most eccentric orbit in the solar system. Mercury does not experience any seasons. Mercury is the only planet which doesn’t rotate exactly once every year.', 3.30, -2.48, 58000000, 88.00, false, 1, NULL);
INSERT INTO public.planet VALUES ('Venus', 'Venus is the second brightest natural object in the sky. It is visible on a bright, clear day. Venus has no moons nor rings. Venus rotate in the opposite direction to other planets. Venus, rotates clockwise. Venus is the hottest planet in the solar system. Venus has no seasons either. Venus has a very weak magnetic field. Venus orbits the sun in an ellipse, but its orbit is the closest to being a circle out of all the planets in the Solar System. Venus is the closest planet to Earth.', 4.87, -4.92, 108000000, 225.00, false, 2, NULL);
INSERT INTO public.planet VALUES ('Earth', 'Earth, third planet from the Sun and the fifth largest planet in the solar system in terms of size and mass. Its single most outstanding feature is that its near-surface environments are the only places in the universe known to harbour life. Viewed from another planet in the solar system, Earth would appear bright and bluish in colour. The planet orbits the Sun in a path that is presently more nearly a circle. The direction of revolution is counterclockwise. It has a cyclic change of seasons. Earth is the largest of the four inner, terrestrial (rocky) planets, but it is considerably smaller than the gas giants of the outer solar system. Earth has a single natural satellite, the Moon, which orbits the planet.', 5.97, NULL, 150000000, 365.00, true, 3, NULL);
INSERT INTO public.planet VALUES ('Mars', 'Mars is the fourth planet from the Sun and last of the terrestrial planets. Mars has seasons like Earth, but they last twice as long. The orbit of Mars is the most eccentric of the eight planets. Mars has two moons. Mars does not have a magnetic field. Because of Mars’s relatively elongated orbit, the distance between Mars and the Sun varies. Mars is easiest to observe when it and the Sun are in opposite directions in the sky. Mars is a small planet. Mars has only 28 percent of the surface area of Earth.', 6.42, -2.94, 228000000, 687.00, false, 4, NULL);
INSERT INTO public.planet VALUES ('Jupiter', 'Jupiter is the fourth brightest object in our solar system and is one of five planets which can be seen by naked eye from Earth. Jupiter rotates very quickly. This rapid rotation is also what causes the flattening effect of the planet, which is why it has an oblate shape. Jupiter has a faint ring system around it. Jupiter has at least 67 moons in satellite around the planet. Jupiter has a very strong magnetic field, the largest of any planet in the solar system. Jupiter does not experience seasons. Jupiter has an internal heat source; it emits more energy than it receives from the Sun. Jupiter’s system is also the source of intense bursts of radio noise.', 1.90, -2.94, 778000000, 4333.00, false, 5, NULL);
INSERT INTO public.planet VALUES ('Saturn', 'Saturn is the second largest planet of the solar system in mass and size and the sixth nearest planet in distance to the Sun. In the night sky Saturn is easily visible to the unaided eye. Saturn has extensive systems of moons and rings. Saturn has a regular orbit and has a small eccentricity and inclination to the ecliptic. Saturn has seasons but each season lasts more than seven years. Saturn is the most oblate of all the planets in the solar system. Saturn is a gas-giant planet and therefore does not have a solid surface like Earth’s.', 5.68, -0.55, 1400000000, 10759.00, false, 6, NULL);
INSERT INTO public.planet VALUES ('Uranus', 'Uranus is the second least dense planet in the solar system. Uranus has 13 presently known rings. Uranus wind speeds very strong. Uranus is an ice giant. Uranus is the coldest planet in the solar system. Uranus has 27 known moons.', 8.68, 5.38, NULL, 30687.00, false, 7, NULL);
INSERT INTO public.planet VALUES ('Neptune', 'Neptune has the second largest gravity of any planet in the solar system. Neptune spins very quickly on its axis. Neptune has 14 known moons. Neptune has at least five main rings and four more ring arcs. Neptune has seasons.and they are of nearly equal length, each nearly 41 years in duration.', 1.02, 7.67, NULL, 60190.00, false, 8, NULL);
INSERT INTO public.planet VALUES ('CoRot-7b', 'CoRoT-7b, the first extrasolar planet that was shown to be a rocky planet like Earth. CoRoT-7b is a red dwarf star. CoRoT-7b is notable for its relatively small size, compared to other exoplanets known at the time. It orbits very close to its star. CoRoT-7b had the shortest orbit of any planet known at the time of its discovery.', 6.06, 11.70, 2600000, 0.85, false, 9, NULL);
INSERT INTO public.planet VALUES ('Gliese 581d', 'Gliese 581d exoplanet is classified as a Super Earth. The planet receives around 70% less intensity of sunlight than Earth. Gliese 581d is one of the more exciting exoplanets in terms of habitable conditions. It is thought the planet orbits on the edge of the habitable zone and with certain atmospheric conditions it may be warm enough for oceans to exist on it surface.', 6.98, 10.55, 32900000, 67.00, false, 10, NULL);
INSERT INTO public.planet VALUES ('HD 209458 b', 'HD 209458 b is an exoplanet located about 157.0 light-years away from Solar System. It is an extrasolar planet known to have an atmosphre. It orbits surprisingly close to its host star. It Is very similar to the sun and it is not visible to the unaided eye.', 1.15, 7.65, 7000000, 3.50, false, 11, NULL);
INSERT INTO public.planet VALUES ('HIP 13044 b', 'HIP 13044 b, first extrasolar planet that was found orbiting a star that was originated outside the Milky Way Galaxy. HIP 13044 b is orbiting around a star that was born in another galaxy but then gets our Milky Way " arrest " about 6-9 billion years ago. HIP 13044 b is a gas giant. Based on HIP13044 b’s composition, it is possible that HIP 13044 b formed in a completely different manner than other planets.', 1.25, 9.94, 17400000, 16.20, false, 12, NULL);
INSERT INTO public.planet VALUES ('Kepler-186f', 'Kepler-186f, the first Earth-sized extrasolar planet to be found within its star’s habitable zone. Thus possibly support life. The planet has a radius 1.11 times that of Earth. It was the fifth planet discovered around its star. It receives only 32 percent of the amount of light that Earth receives from the Sun.', 1.40, 12.50, 53200000, 130.00, false, 13, NULL);
INSERT INTO public.planet VALUES ('Kepler-452b', 'Kepler-452b, the first approximately Earth-sized planet to be found in a Sunlike star’s habitable zone. Thus possibly support life. The planet’s radius is 1.63 times that of Earth. Its surface gravity is nearly twice as on Earth. The star is 6 billion years old. Kepler-452b is most likely not tidally locked and has a circular orbit.', 5.00, 13.70, 156500000, 384.80, false, 14, NULL);
INSERT INTO public.planet VALUES ('Mercury', 'Mercury orbits quickly around the Sun. Mercury is the smallest planet in the solar system and is one of five planets that is visible to the naked eye. Mercury has no moons or rings because of its low gravity and lack of atmosphere. Mercury has a weak magnetic field. The orbit of Mercury is an ellipse rather than circular. It has the most eccentric orbit in the solar system. Mercury does not experience any seasons. Mercury is the only planet which doesn’t rotate exactly once every year.', 3.30, -2.48, 58000000, 88.00, false, 15, NULL);
INSERT INTO public.planet VALUES ('Venus', 'Venus is the second brightest natural object in the sky. It is visible on a bright, clear day. Venus has no moons nor rings. Venus rotate in the opposite direction to other planets. Venus, rotates clockwise. Venus is the hottest planet in the solar system. Venus has no seasons either. Venus has a very weak magnetic field. Venus orbits the sun in an ellipse, but its orbit is the closest to being a circle out of all the planets in the Solar System. Venus is the closest planet to Earth.', 4.87, -4.92, 108000000, 225.00, false, 16, NULL);
INSERT INTO public.planet VALUES ('Earth', 'Earth, third planet from the Sun and the fifth largest planet in the solar system in terms of size and mass. Its single most outstanding feature is that its near-surface environments are the only places in the universe known to harbour life. Viewed from another planet in the solar system, Earth would appear bright and bluish in colour. The planet orbits the Sun in a path that is presently more nearly a circle. The direction of revolution is counterclockwise. It has a cyclic change of seasons. Earth is the largest of the four inner, terrestrial (rocky) planets, but it is considerably smaller than the gas giants of the outer solar system. Earth has a single natural satellite, the Moon, which orbits the planet.', 5.97, NULL, 150000000, 365.00, true, 17, NULL);
INSERT INTO public.planet VALUES ('Mars', 'Mars is the fourth planet from the Sun and last of the terrestrial planets. Mars has seasons like Earth, but they last twice as long. The orbit of Mars is the most eccentric of the eight planets. Mars has two moons. Mars does not have a magnetic field. Because of Mars’s relatively elongated orbit, the distance between Mars and the Sun varies. Mars is easiest to observe when it and the Sun are in opposite directions in the sky. Mars is a small planet. Mars has only 28 percent of the surface area of Earth.', 6.42, -2.94, 228000000, 687.00, false, 18, NULL);
INSERT INTO public.planet VALUES ('Jupiter', 'Jupiter is the fourth brightest object in our solar system and is one of five planets which can be seen by naked eye from Earth. Jupiter rotates very quickly. This rapid rotation is also what causes the flattening effect of the planet, which is why it has an oblate shape. Jupiter has a faint ring system around it. Jupiter has at least 67 moons in satellite around the planet. Jupiter has a very strong magnetic field, the largest of any planet in the solar system. Jupiter does not experience seasons. Jupiter has an internal heat source; it emits more energy than it receives from the Sun. Jupiter’s system is also the source of intense bursts of radio noise.', 1.90, -2.94, 778000000, 4333.00, false, 19, NULL);
INSERT INTO public.planet VALUES ('Saturn', 'Saturn is the second largest planet of the solar system in mass and size and the sixth nearest planet in distance to the Sun. In the night sky Saturn is easily visible to the unaided eye. Saturn has extensive systems of moons and rings. Saturn has a regular orbit and has a small eccentricity and inclination to the ecliptic. Saturn has seasons but each season lasts more than seven years. Saturn is the most oblate of all the planets in the solar system. Saturn is a gas-giant planet and therefore does not have a solid surface like Earth’s.', 5.68, -0.55, 1400000000, 10759.00, false, 20, NULL);
INSERT INTO public.planet VALUES ('Uranus', 'Uranus is the second least dense planet in the solar system. Uranus has 13 presently known rings. Uranus wind speeds very strong. Uranus is an ice giant. Uranus is the coldest planet in the solar system. Uranus has 27 known moons.', 8.68, 5.38, NULL, 30687.00, false, 21, NULL);
INSERT INTO public.planet VALUES ('Neptune', 'Neptune has the second largest gravity of any planet in the solar system. Neptune spins very quickly on its axis. Neptune has 14 known moons. Neptune has at least five main rings and four more ring arcs. Neptune has seasons.and they are of nearly equal length, each nearly 41 years in duration.', 1.02, 7.67, NULL, 60190.00, false, 22, NULL);
INSERT INTO public.planet VALUES ('CoRot-7b', 'CoRoT-7b, the first extrasolar planet that was shown to be a rocky planet like Earth. CoRoT-7b is a red dwarf star. CoRoT-7b is notable for its relatively small size, compared to other exoplanets known at the time. It orbits very close to its star. CoRoT-7b had the shortest orbit of any planet known at the time of its discovery.', 6.06, 11.70, 2600000, 0.85, false, 23, NULL);
INSERT INTO public.planet VALUES ('Gliese 581d', 'Gliese 581d exoplanet is classified as a Super Earth. The planet receives around 70% less intensity of sunlight than Earth. Gliese 581d is one of the more exciting exoplanets in terms of habitable conditions. It is thought the planet orbits on the edge of the habitable zone and with certain atmospheric conditions it may be warm enough for oceans to exist on it surface.', 6.98, 10.55, 32900000, 67.00, false, 24, NULL);
INSERT INTO public.planet VALUES ('HD 209458 b', 'HD 209458 b is an exoplanet located about 157.0 light-years away from Solar System. It is an extrasolar planet known to have an atmosphre. It orbits surprisingly close to its host star. It Is very similar to the sun and it is not visible to the unaided eye.', 1.15, 7.65, 7000000, 3.50, false, 25, NULL);
INSERT INTO public.planet VALUES ('HIP 13044 b', 'HIP 13044 b, first extrasolar planet that was found orbiting a star that was originated outside the Milky Way Galaxy. HIP 13044 b is orbiting around a star that was born in another galaxy but then gets our Milky Way " arrest " about 6-9 billion years ago. HIP 13044 b is a gas giant. Based on HIP13044 b’s composition, it is possible that HIP 13044 b formed in a completely different manner than other planets.', 1.25, 9.94, 17400000, 16.20, false, 26, NULL);
INSERT INTO public.planet VALUES ('Kepler-186f', 'Kepler-186f, the first Earth-sized extrasolar planet to be found within its star’s habitable zone. Thus possibly support life. The planet has a radius 1.11 times that of Earth. It was the fifth planet discovered around its star. It receives only 32 percent of the amount of light that Earth receives from the Sun.', 1.40, 12.50, 53200000, 130.00, false, 27, NULL);
INSERT INTO public.planet VALUES ('Kepler-452b', 'Kepler-452b, the first approximately Earth-sized planet to be found in a Sunlike star’s habitable zone. Thus possibly support life. The planet’s radius is 1.63 times that of Earth. Its surface gravity is nearly twice as on Earth. The star is 6 billion years old. Kepler-452b is most likely not tidally locked and has a circular orbit.', 5.00, 13.70, 156500000, 384.80, false, 28, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Altair', 'Altair is the twelfth brightest star overall in our night sky. Altair is a fast rotator. this star’s shape is oblate. It is relatively close to Earth. This is one reason why it looks bright as seen on Earth.', 'white', 'A7V', 1.86, 0.76, 1200, 1, NULL);
INSERT INTO public.star VALUES ('Sun', 'Our Sun is hot glowing ball placed at the center of our solar system and without its energy, life as we know it could not exist here on our home planet. The Sun is the largest object in our solar system.  Its gravity holds the solar system together, keeping everything from the biggest planets to the smallest bits of debris in orbit around it. The Sun’s activity, influences the nature of space throughout the solar system.', 'yellow', 'G2V', 1.98, -26.70, 4500, 2, NULL);
INSERT INTO public.star VALUES ('Arcturus', 'Arcturus is a giant star. It is exceptionally bright and is occasionally visible to the naked eye just before the sun sets almost every place on Earth.', 'red', 'K15III', 1.08, -0.05, 7100, 3, NULL);
INSERT INTO public.star VALUES ('Canopus', 'Canopus is the second brightest star in the night sky. This stair is fairly large in size. For northern observers, Canopus doesn’t rise very high in the sky.', 'white', 'A9II', 8.00, -0.74, 10, 4, NULL);
INSERT INTO public.star VALUES ('Deneb', 'Deneb is the 19th brightest star in the night sky and is visible by the naked eye.It is a main sequence supergiant star. ', 'blue-white', 'A2la', 19.00, 1.25, 10, 5, NULL);
INSERT INTO public.star VALUES ('Vega', 'Vega is the fifth brightest in the night sky. Vega is a variable star. Vega can often be seen near the zenith in the mid-northern latitudes during the evening in the Northern Hemisphere summer. From mid-southern latitudes, it can be seen low above the northern horizon during the Southern Hemisphere winter.', 'white', 'A0Va', 2.14, 0.03, 455, 6, NULL);
INSERT INTO public.star VALUES ('Corot 7', 'It is a main-sequence star. CoRoT-7 is a dwarf star, which is a little smaller and cooler than our Sun. This is a faint star so it is not visible in our naked eye. Some exoplanets are discovered to orbit CoRoT-7. CoRoT-7 is a binary star system firmed by CoRoT-7a, CoRoT-7b, CoRoT-7c, CoRoT-7d. ', 'yellow', 'K0V', 0.93, 11.67, 1500, 7, NULL);
INSERT INTO public.star VALUES ('Gliese 581', 'Gliese 581, it is one of the oldest and least active of the Red Dwarf Stars, and forms the centerpiece of the Gliese 581 planetary system. This planetary system contains at least 3 planets. It is located approximately 2 degrees North of the brightest Star Beta Librae.', 'red', 'M3V', 0.31, 10.56, 8000, 8, NULL);
INSERT INTO public.star VALUES ('HD 209458', 'HD 209458 has physical characteristics similar to those of the Sun, it has a planet, HD 209458b. HD 209458 is not visible by naked eye.', 'blue-white', 'G0V', 1.15, 7.65, 3500, 9, NULL);
INSERT INTO public.star VALUES ('HIP 13044', 'HIP 13044 is a star in the Helmi stream, the remnant of a dwarf galaxy that was torn apart into a “stream” of stars and captured by the Milky Way Galaxy a long time ago. HIP 13033 is orbited by a planet, HIP13044b.', 'red', 'F2', 0.80, 9.94, 9000, 10, NULL);
INSERT INTO public.star VALUES ('Kepler-186', 'Kepler 186 is a dim dwarf star. The planets in its system are Earth-sized; however, they orbit much closer to the star and thus are not within the habitable zone. Kepler 186 has five planets. ', 'red', 'M1V', 0.54, 15.29, 4000, 11, NULL);
INSERT INTO public.star VALUES ('Kepler-452', 'Kepler is too dim to be seen with the naked eye. The star hosts one confirmed exoplanet named Kepler-452b.', 'yellow', 'G2', 1.04, 13.43, 6000, 12, NULL);
INSERT INTO public.star VALUES ('Altair', 'Altair is the twelfth brightest star overall in our night sky. Altair is a fast rotator. this star’s shape is oblate. It is relatively close to Earth. This is one reason why it looks bright as seen on Earth.', 'white', 'A7V', 1.86, 0.76, 1200, 13, NULL);
INSERT INTO public.star VALUES ('Sun', 'Our Sun is hot glowing ball placed at the center of our solar system and without its energy, life as we know it could not exist here on our home planet. The Sun is the largest object in our solar system.  Its gravity holds the solar system together, keeping everything from the biggest planets to the smallest bits of debris in orbit around it. The Sun’s activity, influences the nature of space throughout the solar system.', 'yellow', 'G2V', 1.98, -26.70, 4500, 14, NULL);
INSERT INTO public.star VALUES ('Arcturus', 'Arcturus is a giant star. It is exceptionally bright and is occasionally visible to the naked eye just before the sun sets almost every place on Earth.', 'red', 'K15III', 1.08, -0.05, 7100, 15, NULL);
INSERT INTO public.star VALUES ('Canopus', 'Canopus is the second brightest star in the night sky. This stair is fairly large in size. For northern observers, Canopus doesn’t rise very high in the sky.', 'white', 'A9II', 8.00, -0.74, 10, 16, NULL);
INSERT INTO public.star VALUES ('Deneb', 'Deneb is the 19th brightest star in the night sky and is visible by the naked eye.It is a main sequence supergiant star. ', 'blue-white', 'A2la', 19.00, 1.25, 10, 17, NULL);
INSERT INTO public.star VALUES ('Vega', 'Vega is the fifth brightest in the night sky. Vega is a variable star. Vega can often be seen near the zenith in the mid-northern latitudes during the evening in the Northern Hemisphere summer. From mid-southern latitudes, it can be seen low above the northern horizon during the Southern Hemisphere winter.', 'white', 'A0Va', 2.14, 0.03, 455, 18, NULL);
INSERT INTO public.star VALUES ('Corot 7', 'It is a main-sequence star. CoRoT-7 is a dwarf star, which is a little smaller and cooler than our Sun. This is a faint star so it is not visible in our naked eye. Some exoplanets are discovered to orbit CoRoT-7. CoRoT-7 is a binary star system firmed by CoRoT-7a, CoRoT-7b, CoRoT-7c, CoRoT-7d. ', 'yellow', 'K0V', 0.93, 11.67, 1500, 19, NULL);
INSERT INTO public.star VALUES ('Gliese 581', 'Gliese 581, it is one of the oldest and least active of the Red Dwarf Stars, and forms the centerpiece of the Gliese 581 planetary system. This planetary system contains at least 3 planets. It is located approximately 2 degrees North of the brightest Star Beta Librae.', 'red', 'M3V', 0.31, 10.56, 8000, 20, NULL);
INSERT INTO public.star VALUES ('HD 209458', 'HD 209458 has physical characteristics similar to those of the Sun, it has a planet, HD 209458b. HD 209458 is not visible by naked eye.', 'blue-white', 'G0V', 1.15, 7.65, 3500, 21, NULL);
INSERT INTO public.star VALUES ('HIP 13044', 'HIP 13044 is a star in the Helmi stream, the remnant of a dwarf galaxy that was torn apart into a “stream” of stars and captured by the Milky Way Galaxy a long time ago. HIP 13033 is orbited by a planet, HIP13044b.', 'red', 'F2', 0.80, 9.94, 9000, 22, NULL);
INSERT INTO public.star VALUES ('Kepler-186', 'Kepler 186 is a dim dwarf star. The planets in its system are Earth-sized; however, they orbit much closer to the star and thus are not within the habitable zone. Kepler 186 has five planets. ', 'red', 'M1V', 0.54, 15.29, 4000, 23, NULL);
INSERT INTO public.star VALUES ('Kepler-452', 'Kepler is too dim to be seen with the naked eye. The star hosts one confirmed exoplanet named Kepler-452b.', 'yellow', 'G2', 1.04, 13.43, 6000, 24, NULL);
INSERT INTO public.star VALUES ('Altair', 'Altair is the twelfth brightest star overall in our night sky. Altair is a fast rotator. this star’s shape is oblate. It is relatively close to Earth. This is one reason why it looks bright as seen on Earth.', 'white', 'A7V', 1.86, 0.76, 1200, 25, NULL);
INSERT INTO public.star VALUES ('Sun', 'Our Sun is hot glowing ball placed at the center of our solar system and without its energy, life as we know it could not exist here on our home planet. The Sun is the largest object in our solar system.  Its gravity holds the solar system together, keeping everything from the biggest planets to the smallest bits of debris in orbit around it. The Sun’s activity, influences the nature of space throughout the solar system.', 'yellow', 'G2V', 1.98, -26.70, 4500, 26, NULL);
INSERT INTO public.star VALUES ('Arcturus', 'Arcturus is a giant star. It is exceptionally bright and is occasionally visible to the naked eye just before the sun sets almost every place on Earth.', 'red', 'K15III', 1.08, -0.05, 7100, 27, NULL);
INSERT INTO public.star VALUES ('Canopus', 'Canopus is the second brightest star in the night sky. This stair is fairly large in size. For northern observers, Canopus doesn’t rise very high in the sky.', 'white', 'A9II', 8.00, -0.74, 10, 28, NULL);
INSERT INTO public.star VALUES ('Deneb', 'Deneb is the 19th brightest star in the night sky and is visible by the naked eye.It is a main sequence supergiant star. ', 'blue-white', 'A2la', 19.00, 1.25, 10, 29, NULL);
INSERT INTO public.star VALUES ('Vega', 'Vega is the fifth brightest in the night sky. Vega is a variable star. Vega can often be seen near the zenith in the mid-northern latitudes during the evening in the Northern Hemisphere summer. From mid-southern latitudes, it can be seen low above the northern horizon during the Southern Hemisphere winter.', 'white', 'A0Va', 2.14, 0.03, 455, 30, NULL);
INSERT INTO public.star VALUES ('Corot 7', 'It is a main-sequence star. CoRoT-7 is a dwarf star, which is a little smaller and cooler than our Sun. This is a faint star so it is not visible in our naked eye. Some exoplanets are discovered to orbit CoRoT-7. CoRoT-7 is a binary star system firmed by CoRoT-7a, CoRoT-7b, CoRoT-7c, CoRoT-7d. ', 'yellow', 'K0V', 0.93, 11.67, 1500, 31, NULL);
INSERT INTO public.star VALUES ('Gliese 581', 'Gliese 581, it is one of the oldest and least active of the Red Dwarf Stars, and forms the centerpiece of the Gliese 581 planetary system. This planetary system contains at least 3 planets. It is located approximately 2 degrees North of the brightest Star Beta Librae.', 'red', 'M3V', 0.31, 10.56, 8000, 32, NULL);
INSERT INTO public.star VALUES ('HD 209458', 'HD 209458 has physical characteristics similar to those of the Sun, it has a planet, HD 209458b. HD 209458 is not visible by naked eye.', 'blue-white', 'G0V', 1.15, 7.65, 3500, 33, NULL);
INSERT INTO public.star VALUES ('HIP 13044', 'HIP 13044 is a star in the Helmi stream, the remnant of a dwarf galaxy that was torn apart into a “stream” of stars and captured by the Milky Way Galaxy a long time ago. HIP 13033 is orbited by a planet, HIP13044b.', 'red', 'F2', 0.80, 9.94, 9000, 34, NULL);
INSERT INTO public.star VALUES ('Kepler-186', 'Kepler 186 is a dim dwarf star. The planets in its system are Earth-sized; however, they orbit much closer to the star and thus are not within the habitable zone. Kepler 186 has five planets. ', 'red', 'M1V', 0.54, 15.29, 4000, 35, NULL);
INSERT INTO public.star VALUES ('Kepler-452', 'Kepler is too dim to be seen with the naked eye. The star hosts one confirmed exoplanet named Kepler-452b.', 'yellow', 'G2', 1.04, 13.43, 6000, 36, NULL);
INSERT INTO public.star VALUES ('Altair', 'Altair is the twelfth brightest star overall in our night sky. Altair is a fast rotator. this star’s shape is oblate. It is relatively close to Earth. This is one reason why it looks bright as seen on Earth.', 'white', 'A7V', 1.86, 0.76, 1200, 37, NULL);
INSERT INTO public.star VALUES ('Sun', 'Our Sun is hot glowing ball placed at the center of our solar system and without its energy, life as we know it could not exist here on our home planet. The Sun is the largest object in our solar system.  Its gravity holds the solar system together, keeping everything from the biggest planets to the smallest bits of debris in orbit around it. The Sun’s activity, influences the nature of space throughout the solar system.', 'yellow', 'G2V', 1.98, -26.70, 4500, 38, NULL);
INSERT INTO public.star VALUES ('Arcturus', 'Arcturus is a giant star. It is exceptionally bright and is occasionally visible to the naked eye just before the sun sets almost every place on Earth.', 'red', 'K15III', 1.08, -0.05, 7100, 39, NULL);
INSERT INTO public.star VALUES ('Canopus', 'Canopus is the second brightest star in the night sky. This stair is fairly large in size. For northern observers, Canopus doesn’t rise very high in the sky.', 'white', 'A9II', 8.00, -0.74, 10, 40, NULL);
INSERT INTO public.star VALUES ('Deneb', 'Deneb is the 19th brightest star in the night sky and is visible by the naked eye.It is a main sequence supergiant star. ', 'blue-white', 'A2la', 19.00, 1.25, 10, 41, NULL);
INSERT INTO public.star VALUES ('Vega', 'Vega is the fifth brightest in the night sky. Vega is a variable star. Vega can often be seen near the zenith in the mid-northern latitudes during the evening in the Northern Hemisphere summer. From mid-southern latitudes, it can be seen low above the northern horizon during the Southern Hemisphere winter.', 'white', 'A0Va', 2.14, 0.03, 455, 42, NULL);
INSERT INTO public.star VALUES ('Corot 7', 'It is a main-sequence star. CoRoT-7 is a dwarf star, which is a little smaller and cooler than our Sun. This is a faint star so it is not visible in our naked eye. Some exoplanets are discovered to orbit CoRoT-7. CoRoT-7 is a binary star system firmed by CoRoT-7a, CoRoT-7b, CoRoT-7c, CoRoT-7d. ', 'yellow', 'K0V', 0.93, 11.67, 1500, 43, NULL);
INSERT INTO public.star VALUES ('Gliese 581', 'Gliese 581, it is one of the oldest and least active of the Red Dwarf Stars, and forms the centerpiece of the Gliese 581 planetary system. This planetary system contains at least 3 planets. It is located approximately 2 degrees North of the brightest Star Beta Librae.', 'red', 'M3V', 0.31, 10.56, 8000, 44, NULL);
INSERT INTO public.star VALUES ('HD 209458', 'HD 209458 has physical characteristics similar to those of the Sun, it has a planet, HD 209458b. HD 209458 is not visible by naked eye.', 'blue-white', 'G0V', 1.15, 7.65, 3500, 45, NULL);
INSERT INTO public.star VALUES ('HIP 13044', 'HIP 13044 is a star in the Helmi stream, the remnant of a dwarf galaxy that was torn apart into a “stream” of stars and captured by the Milky Way Galaxy a long time ago. HIP 13033 is orbited by a planet, HIP13044b.', 'red', 'F2', 0.80, 9.94, 9000, 46, NULL);
INSERT INTO public.star VALUES ('Kepler-186', 'Kepler 186 is a dim dwarf star. The planets in its system are Earth-sized; however, they orbit much closer to the star and thus are not within the habitable zone. Kepler 186 has five planets. ', 'red', 'M1V', 0.54, 15.29, 4000, 47, NULL);
INSERT INTO public.star VALUES ('Kepler-452', 'Kepler is too dim to be seen with the naked eye. The star hosts one confirmed exoplanet named Kepler-452b.', 'yellow', 'G2', 1.04, 13.43, 6000, 48, NULL);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 19, true);


--
-- Name: constellation_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_galaxy_id_seq', 19, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 41, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 28, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 48, true);


--
-- Name: constellation constellation_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_constellation_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_key UNIQUE (constellation_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_key UNIQUE (star_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

