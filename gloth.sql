--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

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
-- Name: pathology; Type: TABLE; Schema: public; Owner: gloth
--

CREATE TABLE public.pathology (
    id integer NOT NULL,
    name character varying NOT NULL,
    info character varying NOT NULL,
    has character varying,
    age_min integer NOT NULL,
    age_max integer NOT NULL,
    sex character varying NOT NULL,
    symptoms character varying NOT NULL,
    other_name character varying,
    norm_name character varying NOT NULL,
    rec_tests_string character varying,
    rec_tests bytea NOT NULL,
    created_on timestamp without time zone DEFAULT now(),
    updated_by integer,
    updated_on timestamp without time zone DEFAULT now(),
    user_id integer NOT NULL,
    treatment character varying,
    description character varying,
    icd_10 character varying,
    medic character varying
);


ALTER TABLE public.pathology OWNER TO gloth;

--
-- Name: pathology_id_seq; Type: SEQUENCE; Schema: public; Owner: gloth
--

CREATE SEQUENCE public.pathology_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pathology_id_seq OWNER TO gloth;

--
-- Name: pathology_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gloth
--

ALTER SEQUENCE public.pathology_id_seq OWNED BY public.pathology.id;


--
-- Name: pathology_specialty; Type: TABLE; Schema: public; Owner: gloth
--

CREATE TABLE public.pathology_specialty (
    id integer NOT NULL,
    pathology_id integer,
    specialty_id integer
);


ALTER TABLE public.pathology_specialty OWNER TO gloth;

--
-- Name: pathology_specialty_id_seq; Type: SEQUENCE; Schema: public; Owner: gloth
--

CREATE SEQUENCE public.pathology_specialty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pathology_specialty_id_seq OWNER TO gloth;

--
-- Name: pathology_specialty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gloth
--

ALTER SEQUENCE public.pathology_specialty_id_seq OWNED BY public.pathology_specialty.id;


--
-- Name: patient; Type: TABLE; Schema: public; Owner: gloth
--

CREATE TABLE public.patient (
    id integer NOT NULL,
    age integer,
    sex character varying,
    weight integer,
    height integer,
    symptoms character varying,
    bmi double precision,
    tests character varying,
    rec_tests bytea,
    user_id integer NOT NULL,
    created_on timestamp without time zone DEFAULT now(),
    pathology_id integer NOT NULL,
    pathology_name character varying NOT NULL,
    updated_on timestamp without time zone DEFAULT now(),
    updated_by integer,
    icd_10 character varying
);


ALTER TABLE public.patient OWNER TO gloth;

--
-- Name: patient_id_seq; Type: SEQUENCE; Schema: public; Owner: gloth
--

CREATE SEQUENCE public.patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patient_id_seq OWNER TO gloth;

--
-- Name: patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gloth
--

ALTER SEQUENCE public.patient_id_seq OWNED BY public.patient.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: gloth
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.roles OWNER TO gloth;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: gloth
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO gloth;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gloth
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: specialty; Type: TABLE; Schema: public; Owner: gloth
--

CREATE TABLE public.specialty (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.specialty OWNER TO gloth;

--
-- Name: specialty_id_seq; Type: SEQUENCE; Schema: public; Owner: gloth
--

CREATE SEQUENCE public.specialty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specialty_id_seq OWNER TO gloth;

--
-- Name: specialty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gloth
--

ALTER SEQUENCE public.specialty_id_seq OWNED BY public.specialty.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: gloth
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(50),
    rpps bigint,
    password character varying(100),
    name character varying(50) NOT NULL,
    forename character varying(50) NOT NULL,
    registered_on timestamp without time zone DEFAULT now(),
    confirmed boolean NOT NULL,
    confirmed_on timestamp without time zone,
    entry_count_patient integer NOT NULL,
    entry_count_pathology integer NOT NULL,
    modify_count_patient integer NOT NULL,
    modify_count_pathology integer NOT NULL,
    phone character varying NOT NULL,
    zip_code character varying NOT NULL
);


ALTER TABLE public."user" OWNER TO gloth;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: gloth
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO gloth;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gloth
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: gloth
--

CREATE TABLE public.user_roles (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE public.user_roles OWNER TO gloth;

--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: gloth
--

CREATE SEQUENCE public.user_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_roles_id_seq OWNER TO gloth;

--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gloth
--

ALTER SEQUENCE public.user_roles_id_seq OWNED BY public.user_roles.id;


--
-- Name: pathology id; Type: DEFAULT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.pathology ALTER COLUMN id SET DEFAULT nextval('public.pathology_id_seq'::regclass);


--
-- Name: pathology_specialty id; Type: DEFAULT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.pathology_specialty ALTER COLUMN id SET DEFAULT nextval('public.pathology_specialty_id_seq'::regclass);


--
-- Name: patient id; Type: DEFAULT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.patient ALTER COLUMN id SET DEFAULT nextval('public.patient_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: specialty id; Type: DEFAULT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.specialty ALTER COLUMN id SET DEFAULT nextval('public.specialty_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_roles id; Type: DEFAULT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.user_roles ALTER COLUMN id SET DEFAULT nextval('public.user_roles_id_seq'::regclass);


--
-- Data for Name: pathology; Type: TABLE DATA; Schema: public; Owner: gloth
--

COPY public.pathology (id, name, info, has, age_min, age_max, sex, symptoms, other_name, norm_name, rec_tests_string, rec_tests, created_on, updated_by, updated_on, user_id, treatment, description, icd_10, medic) FROM stdin;
629	diabète de type 2	Le diabète de type 2 est une maladie métabolique touchant la glycorégulation.\r\nLe diabète de type 2 est caractérisé par les lésions microangiopathiques et macroangiopathiques dues à l'effet du glucose présent dans le sang (glycémie) sur les organes. Plus la quantité de glucose dans le sang est élevée (hyperglycémie) et pendant une longue période, plus les lésions risquent d'être nombreuses et sévères. La limite entre un taux de glucose normal et un taux à risque de développement de lésions est imprécise.	https://www.has-sante.fr/jcms/c_750179/fr/ald-n8-diabete-de-type-2	0	120	sex_MF	besoin d'uriner, envie d'uriner, trop d'urine, urine trop frequement, urine frequement, envie fréquente d’uriner, uriner la nuit, augmentation de la faim, augmentation de la soif, plus faim, plus soif, très faim, très soif, sensation de bouche sèche, bouche sèche,somnolence excessive, envie de dormir, somnolence, vision trouble, moins bonne vision, infections bactériennes, infection à champignon, infections urinaires, vaginites, diabète, diabète 2, diabete de type 2	diabète non insulinodépendant, dnid, diabète insulinorésistant, diabète de l'âge mûr , diabète acquis	diabete de type 2	\N	\\x80209544202020202020205d94288c20676c7963c3a96d69655f32685f6869672e2e2e205b37395d	2019-08-31 15:03:21	7	2020-01-22 20:24:12	7	Dans un premier temps, le médecin et le patient chercheront à adapter ensemble le traitement à la vie du patient et aux réactions de son corps. En effet, durant cette période, le patient devra pratiquer des glycémies quotidiennes (à pluriquotidiennes).\r\n\r\nIl devra avoir un exercice physique régulier (30 minutes de marche 3 fois par semaine minimum) et on veillera à réduire le surpoids.\r\n\r\nIl faut bien penser que l'alimentation sera très surveillée, mais c'est au médecin d'adapter le régime alimentaire à la vie du patient.\r\n\r\nPour la bonne réussite du traitement et afin de réduire des variations indésirables de la glycémie, le patient doit respecter les prescriptions diététiques et médicamenteuses.\r\n\r\nDans certains cas, le taux de l'hémoglobine glyquée pourra être surveillé.\r\nL'étape suivante, si nécessaire, est un traitement par des antidiabétiques oraux. Une insulinothérapie peut parfois s'avérer nécessaire pour maintenir une glycémie normale. Ce type de traitement, favorisé depuis des dizaines d'années, est cependant remis en question pas des études récentes en raison de l'absence de diminution du taux de mortalité et des nombreux effets secondaires liés à ce traitement.		E119	\N
819	insuffisance cardiaque gauche	L’insuffisance cardiaque gauche	https://www.has-sante.fr/jcms/c_534673/fr/ald-n5-insuffisance-cardiaque-a-fonction-systolique-preservee, https://www.has-sante.fr/jcms/c_534689/fr/ald-n5-insuffisance-cardiaque-systolique	0	120	sex_MF	Insuffisance cardiaque, orthopnée, dyspnée d'effort, choc de pointe, eclat du deuxieme bruit pulmonaire, rales crépitants, epanchement pleural, cyanose, nycturie, oligurie, marbrures, asthénie, choc cardiogénique, anorexie, dénutrition, oedeme aigu pulmonaire, OAP, toux, hemoptysies, dyspnée de repos, dyspnée, hemoptysie, fatigue constante, essoufflement, essoufflements, respiration courte, respiration sifflante, palpitations, douleur dans la poitrine, douleurs dans la poitrine, douleur poitrine, douleur thorax, mal au cœur, douleur cœur, serrement poitrine, augmentation de la fréquence des mictions nocturnes, urines nocturnes plus fréquente, plus de mictions nocturnes, toux, tousse, gain de poinds, rétention d’eau\r\n	\N	insuffisance cardiaque	\N	\\x80209520202020202020205d948c20667265715f6361725f6869676894612e	2019-09-10 08:03:15	7	2019-12-06 13:21:31	7	Règles hygiéno-diététiques\r\nInhibiteurs de l'enzyme de conversion\r\nAntagonistes des récepteurs de l’angiotensine II (ARAII ou sartan)\r\nAntagoniste des récepteur à l'Angiotensine/inhibiteur de la néprilisine (ARNI)\r\nDiurétiques\r\nBêtabloquants\r\n	SIGNES CLINIQUES\r\nDyspnée d'effort\r\nOrthopnée\r\nToux\r\nHemoptysies\r\nDyspnée paroxystique nocturne	I509	\N
687	epilepsie	Une crise épileptique est caractérisée par une altération fonctionnelle transitoire au sein d'une population de neurones (soit limitée à une région du cerveau : crise dite « partielle », soit impliquant les deux hémisphères cérébraux de manière simultanée : crise dite « généralisée ») due à une décharge épileptique.	https://www.has-sante.fr/jcms/c_586170/fr/ald-n9-epilepsies-graves	0	120	sex_MF	périodes de perte de conscience, périodes de conscience altérée, perte de conscience, conscience altérée, yeux ouverts, regard fixe, pas de réaction, ne réagit plus, Chute brutale de la personne sans raison apparente, chute, chute brutale, chute soudaine, convulsions, contractions musculaires prolongées, contractions involontaires des bras et des jambes, convulse, perceptions transformées, sens altérés, goût altéré, odorataltéré, respiration bruyante, effrayé, a peur, est effrayé, est apeuré, panique, colère, hallucination olfactive, effet visuel, irritabilité, agitation	crise d'epilepsie	epilepsie	\N	\\x80205d942e	2019-09-01 16:55:57	7	2020-01-22 20:24:34	7	L'emploi d'un anti-convulsivant est recommandé dès la dixième minute de convulsions, par voie intraveineuse si possible, par voie anorectale sinon. L'état de mal convulsif, c'est-à-dire lorsque la crise se prolonge au-delà de 10 min (ou lorsque trois crises se succèdent), nécessite un transfert en réanimation médicale (urgence médicale car le pronostic vital est en jeu). Un EEG en urgence ainsi qu'un bilan médical devront être effectués, sans retarder la mise en œuvre des méthodes de réanimation et le traitement médicamenteux :\r\n\r\nMaintien d'une bonne fonction respiratoire : mise en place d'une canule de Guedel, ventilation au masque, aspiration des sécrétions bronchiques, intubation et ventilation mécanique au maximum.\r\nSurveillance cardio-vasculaire : scopage cardio-tensionnel avec surveillance du rythme cardiaque, de la pression artérielle, de la saturation sanguine en oxygène.\r\nPose d'une voie veineuse pour équilibration hydro-électrolytique et perfusion des médicaments anti-convulsivants.\r\n		G40	\N
614	cystite	Une cystite est une inflammation de la vessie. Infection urinaire la plus courante, elle est le plus souvent d'origine bactérienne (colibacilles, naturellement présents dans l'intestin) ; mais peut aussi être due à un agent toxique : traitement anti-cancéreux ou radiothérapie. C'est une infection fréquente chez la femme, car elle possède un urètre court, ce qui augmente le risque d'infection urinaire et que les sécrétions de la prostate des hommes contiennent des substances qui ralentissent la multiplication des bactéries dans l’urètre.	https://www.has-sante.fr/jcms/c_2722827/fr/cystite-aigue-simple-a-risque-de-complication-ou-recidivante-de-la-femme, https://www.has-sante.fr/jcms/c_2722927/fr/femme-enceinte-colonisation-urinaire-et-cystite	0	120	sex_MF	Cystite infectieuse, bactéries intestinales, Cystite radique, Cystite à urine claire, cystite, cystite interstitielle, Cystite à champignon, vaginite à mycoses, Cystite allergène, Cystite de blessure, Cystite d'origine médicamenteuse, brûlures mictionnelles, inflammation de la vessie, inflammation vessie, vessie inflammée, pollakiurie, émission excessivement fréquente d'urine en faible quantité, envie d'uriner, envie d'uriner fréquente, envie d'uriner tout le temps, besoin d'uriner tout le temps, besoin d'uriner fréquent, impériosité urinaire, besoin d'aller uriner dans l'immédiat, tiraillement, douleurs hypogastriques, douleur bassin, hématurie, présence de sang dans l'urine, sang dans les urines, pyurie, présence de pus dans l'urine, pus dans l'urine	\N	cystite	\N	\\x80205d942e	2019-08-29 06:49:57	7	2020-01-22 20:29:06	7	Il est important de soigner rapidement une cystite, car l'infection peut se compliquer et atteindre le rein et causer une pyélonéphrite. Une pause de l'activité sexuelle est préconisée afin de faciliter au mieux la guérison.\r\nLe traitement de la cystite aiguë non récidivante est simple. Il associe un traitement antibiotique (qui peut être pris en une seule dose, en une seule fois : « traitement minute ») à un anti-inflammatoire et à un antispasmodique. Le traitement antibiotique peut être plus long (trois à cinq jours). Il est impératif de boire au moins deux litres d'eau par jour, pour éliminer au maximum.\r\n\r\nLe traitement de la cystite aiguë non récidivante est simple. Il associe un traitement antibiotique (qui peut être pris en une seule dose, en une seule fois : « traitement minute ») à un anti-inflammatoire et à un antispasmodique. Le traitement antibiotique peut être plus long (trois à cinq jours). Il est impératif de boire au moins deux litres d'eau par jour, pour éliminer au maximum.\r\n\r\n		N30	\N
1170	sclérose en plaques	La sclérose en plaques (SEP) est une maladie auto-immune qui touche des individus génétiquement prédisposés mais qui semble déclenchée par des éléments environnementaux qui agissent comme des facteurs de dérégulation de l'immunité, d'inflammation et de dégénérescence des nerfs	https://www.has-sante.fr/jcms/c_2656983/fr/sclerose-en-plaque-de-l-enfant, https://www.has-sante.fr/jcms/c_460315/fr/ald-n25-sclerose-en-plaques	0	120	sex_MF	clérose en plaques, trouble de la vue, troubles de la vue, vision double, perte de vision, douleur aux yeux, mouvement des yeux douloureux, mouvements oculaires douloureux, mouvements oculaires, involontaires, voile devant un oeil, névrite optique, troubles sensitifs, fourmillements, décharges électriques, engourdissement, fatigue, tremblements, trouble de la marche, difficulté à contrôler ses mouvements, perte d’équilibre, spasmes musculaires, contractures musculaires, difficulté d’élocution, incontinence urinaire, troubles urinaires, constipation, paralysie partielle, troubles de la mémoire, troubles de la concentration\r\n	\N	sclerose en plaques	\N	\\x80205d942e	2019-09-24 19:36:32	7	2020-01-22 20:29:34	7	Les poussées évoluent naturellement vers la rémission spontanée. Si elles sont invalidantes, elles peuvent recevoir un traitement par corticostéroïdes, qui permettraient de raccourcir leur évolution, de hâter la guérison, mais pas de prévenir une autre poussée.\r\n\r\nLes traitements médicamenteux ne sont pas parfaits. Ils agiraient pour la plupart en modulant ou en déprimant le système immunitaire. Il est nécessaire de s'assurer pour chaque patient que leur balance bénéfice-risque est positive.\r\n\r\nL'interféron bêta a fait la preuve de son efficacité à 2 ans dans la sclérose en plaques (poussées moins nombreuses et moins sévères, amélioration des lésions visibles en IRM, parfois moindre évolutivité du handicap).		G35	\N
657	eczéma	L'eczéma est un syndrome, ensemble de signes cliniques et de symptômes communs à plusieurs affections, pouvant correspondre à plusieurs maladies inflammatoires de la peau. Ces maladies sont caractérisées par des démangeaisons (prurit), une rougeur congestive de la peau (érythème) et des éruptions cutanées.	\N	0	120	sex_MF	inflammation peau, peau inflammée, exema, eczema, demangeaison, prurit, rougeur peau, rougeur congestive peau, erytheme, eruptions, eruptions cutanées, eruption cutanée, boutons, plaques rouges, peau rouge, plaque rouge, 	exéma	eczema	\N	\\x80205d942e	2019-09-01 11:16:43	2	2020-01-22 20:29:12	7	La gestion de ce syndrome repose sur l'utilisation de crèmes à base de cortisone diminuant les démangeaisons et l'inflammation, la prise d'antihistaminiques. Un traitement par rayons ultraviolets comme la photothérapie ou photo chimiothérapie peut également être prescrit.		L20	\N
811	infarctus du myocarde	L'infarctus du myocarde est une nécrose d'une partie du muscle cardiaque secondaire due à un défaut d'apport sanguin dans le cadre de la maladie coronarienne.	https://www.has-sante.fr/jcms/c_2676802/fr/prise-en-charge-hospitaliere-de-l-infarctus-du-myocarde, https://www.has-sante.fr/jcms/c_1725826/fr/endoprothese-vasculaire-sans-infarctus-du-myocarde, https://www.has-sante.fr/jcms/c_484720/fr/prise-en-charge-de-l-infarctus-du-myocarde-a-la-phase-aigue-en-dehors-des-services-de-cardiologie	0	120	sex_MF	Infarctus du myocarde, douleur intense, douleur poitrine, douleur intense poitrine, oppression, douleur bras, douleur qui irradie le bras gauche, douleur bras gauche, douleur main gauche, douleur dou, douleur machoire, douleur dos, essouflement, sueurs froides, nausées, vomissements, malaise, vertige, vertiges, etourdissement, etourdissements, douleurs abdominales, douleur abdominale, battements rapides, battements irreguliers, tachycardie, arythmie, malaises, douleurs abdominales, anxiete importante, anxieux, anxiete soudaine, fatigue, agitation trouble du sommeil, perte de conscience	\N	infarctus du myocarde	\N	\\x80205d942e	2019-09-10 07:23:22	7	2020-01-22 20:22:35	7	Il s'agit d'une urgence médicale. L'hospitalisation doit être faite en unités spécialisées.		I21	\N
729	goutte	La goutte est une maladie chronique fréquente liée au métabolisme de l'acide urique, dont la manifestation clinique la plus caractéristique est une monoarthrite aiguë du gros orteil. Elle est associée, bien que de façon inconstante, à une augmentation du taux circulant d'acide urique (hyperuricémie).	\N	0	120	sex_MF	douleur, douleur soudaine, douleur intense, douleur pulsatile douleur dans une articulation, crises, articulations froides, transformation de l’acide urique liquide en cristaux d’acide urique, enflure, rougeur de la région atteinte, grande sensation de froid, douleurs articulaires généralisées, malaise général, fièvre, frissons	\N	goutte	\N	\\x80209520202020202020205d948c2061636964655f7572697175655f94612e	2019-09-03 17:06:51	7	2020-01-22 20:22:56	7	La prise en charge thérapeutique de la goutte comprend un volet symptomatique (soulagement des crises par les anti-inflammatoires non stéroïdiens ou par la colchicine) et un traitement de fond (règles hygiéno-diététiques et dans certains cas médicaments hypo-uricémiants). Elle est complétée par une prise en charge en ergothérapie pour le soulagement des douleurs, l'éducation thérapeutique ainsi que la prévention articulaire.		M10	\N
493	asthme chronique	L'asthme chronique est une hyperactivité chronique des bronches peu soumise aux agents extérieurs. L'inflammation est souvent d'installation lente et progressive, généralement présente depuis l'enfance.\r\n	https://www.has-sante.fr/jcms/c_452137/fr/ald-n14-insuffisance-respiratoire-chronique-grave-secondaire-a-un-asthme, https://www.has-sante.fr/jcms/c_796722/fr/asthme-de-l-enfant-de-moins-de-36-mois-diagnostic-prise-en-charge-et-traitement-en-dehors-des-episodes-aigus	0	120	sex_MF	hyperactivité chronique des bronches, inflammation chronique des bronches, inflammation des bronches, inflammation, bronches, asthme, asthme chronique, asthme lent, asthme progressif,\r\nasthme depuis l'enfancen, crises d'asthme, crises d'asthme répétées, bronchites sifflantes chroniques, syndrome asthmatique, chronique, insuffisance respiratoire, réaction auto-immune, sueurs, étouffement, suffocation, crise, bronches bloquées, difficulté à respirer, mal à respirer, tachychardie, augmentation du rythme cardiaque, rythme cardiaque haut, fréquence cardiaque haute	\N	asthme chronique	\N	\\x80209520202020202020205d948c20706f6c79706e65655f6869676894612e	2019-08-23 07:58:05	7	2020-01-22 20:25:32	7	- Chambres d'inhalation\r\n- Turbuhaler\r\n- Aérosols doseurs		J45	\N
1282	tuberculose	La tuberculose est une maladie infectieuse causée par la bactérie Mycobacterium tuberculosis, contagieuse, avec des signes cliniques variables. 	https://www.has-sante.fr/jcms/c_482999/fr/ald-n29-tuberculose-maladie	0	120	sex_MF	tuberculose, fièvre, haute température, température élevée, toux, expectorations couleurs inhabituelles, crachats sanguinolents, crachats sang, toux sang, expectorations sang, perte appétit, perte poids, amincissement, amaigrissement, sueurs nocturnes, sudation, douleurs poitrine respiration, douleurs poitrine toux,  douleurs colonne vertébrale, douleurs articulations\r\n	\N	tuberculose	\N	\\x80209520202020202020205d948c20616c62756d696e655f6c6f7794612e	2019-09-25 19:43:04	2	2020-01-22 20:31:03	7	Le traitement est d'une durée de six mois pour une tuberculose pulmonaire à bacille de Koch sensible chez un patient immunocompétent, comprenant 2 mois de quadrithérapie antibiotique (isoniazide, rifampicine, pyrazinamide et éthambutol), puis 4 mois de bithérapie (isoniazide et rifampicine). Le traitement prolongé est indispensable afin de guérir la maladie et éviter l'émergence de souches résistantes dont l'évolution est souvent beaucoup plus grave.		A19	\N
610	maladie de crohn	La maladie de Crohn est une maladie inflammatoire chronique de l'intestin (MICI) qui peut atteindre toute partie de l'appareil digestif (de la bouche à l'anus) et éventuellement la peau, les articulations et les yeux. De cause inconnue, cette maladie est caractérisée par une inflammation le plus souvent retrouvée au niveau de l'iléon et du côlon, qui serait d'origine multifactorielle, faisant intervenir entre autres une composante génétique et le microbiome.	https://www.has-sante.fr/jcms/c_671094/fr/ald-n-24-maladie-de-crohn	0	120	sex_MF	Crohn, maladie de Crohn, poussées alternant avec des phases de rémission, phases de rémission, rémission, douleur abdominale, douleur abdominale qui s'accentue après les repas, douleur après manger, douleur après repas, douleur abdominale après repas, douleur abdominale après manger,  diarrhées, diarrhée, diarrhées chroniques, diarrhée chronique, fièvre, fatigue persistante, fatigue,  perte de poids, dysphagie, douleur en mangeant, nausées, vomissements, aphtes dans la bouche, aphtes, hypoalbuminémie, calculs rénaux, coliques néphrétiques, spondylarthropathie, érythèmes noueux, atteintes oculaires, uvéite antérieure, épisclérite, diplopie, hypersensibilité à la lumière,\r\npancréatites, thromboses veineuses	crohn	maladie de crohn	\N	\\x80209520202020202020205d94288c2074656d705f68696768948c20616c62752e2e2e205b34335d	2019-08-29 06:29:28	7	2020-01-22 20:23:38	7	Les causes de la maladie de Crohn restant inconnues, il n’existe aucun traitement permettant d’en guérir. Le traitement médical repose sur la réduction de l'inflammation. Le traitement est basé sur deux principes : le premier consiste à traiter le malade au cours des poussées ; c’est ce que l’on appelle le traitement d’attaque. Le second principe est la prévention des rechutes. C’est le traitement d’entretien qui permet de prolonger au maximum les périodes de rémission de la maladie.		K50	\N
\.


--
-- Data for Name: pathology_specialty; Type: TABLE DATA; Schema: public; Owner: gloth
--

COPY public.pathology_specialty (id, pathology_id, specialty_id) FROM stdin;
829	819	21
620	610	22
739	729	1
639	629	1
502	493	19
697	687	15
1181	1170	1
624	614	20
1293	1282	7
667	657	12
821	811	21
\.


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: gloth
--

COPY public.patient (id, age, sex, weight, height, symptoms, bmi, tests, rec_tests, user_id, created_on, pathology_id, pathology_name, updated_on, updated_by, icd_10) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: gloth
--

COPY public.roles (id, name) FROM stdin;
1	admin
2	expert
3	user
\.


--
-- Data for Name: specialty; Type: TABLE DATA; Schema: public; Owner: gloth
--

COPY public.specialty (id, name) FROM stdin;
3	Psychiatrie
6	Ophtalmologie
7	Maladies infectieuses
8	Gynécologie
12	Dermatologie
1	Medecine générale
13	ORL
14	Dentaire
15	Neurologie
2	Pédiatrie
16	Rhumatologie
17	Orthopédie
18	Oncologie
19	Pneumologie
20	Urologie
21	Cardiologie
22	Gastro entérologie
24	Nephrologie
23	Endocrinologie
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: gloth
--

COPY public."user" (id, email, rpps, password, name, forename, registered_on, confirmed, confirmed_on, entry_count_patient, entry_count_pathology, modify_count_patient, modify_count_pathology, phone, zip_code) FROM stdin;
12	dgcbahzkc@hbcazj.com	40579	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Lahmi	Sandra	2019-10-21 20:42:51.051819	t	2019-10-21 20:45:45.552426	31	0	0	0	0	0
17	ghbaqzx@vjhzc.com	193107071495	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Decure	Alison	2019-10-25 14:19:04.1425	t	2019-10-07 15:29:39	146	0	29	1	0	0
18	cacbc@cba.com	12081994	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Sentagne	Ornella	2019-10-30 10:06:24.204561	t	2019-10-30 14:06:24	0	0	0	0	0	0
34	cbkacza@gchbazc.com	190892	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Bézie	Jules	2019-11-07 09:48:23.56002	t	2019-11-07 09:51:38.844116	0	0	0	0	0	0
36	gdzha@zfchz.com	9876	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Berrebi	Hanna	2019-11-07 21:21:45.107583	t	2019-11-07 21:23:45	0	0	0	0	0	0
37	chbazj@vah.com	30052000	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Lamarche	Alice	2019-11-14 18:01:00.36017	t	2019-11-14 19:01:00	0	0	0	0	0	0
4	chajkcbz@gcazi.com	220191	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Lahmi	Léa	2019-06-07 20:57:34.514306	t	2019-06-07 20:59:34	0	7	0	0	0	0
5	ajbcezvhbc@czabh.com	17042016	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Lahmi	Emma	2019-06-07 20:57:34.754359	t	2019-06-07 20:59:34	0	0	0	0	0	0
10	paul.monnery@epitech.eu	123456789	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Monnery	Paul	2019-09-28 10:58:00.327641	t	2019-09-28 10:58:23.825234	3	3	0	22	0	0
54	hoacjk@agih.com	10100907640	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	STEFFEN	Anne-Laure	2019-12-03 13:38:12.070551	t	2019-09-28 10:58:23	3	0	0	0	0	0
1	cuhakjc@avzhca.com	12345678	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	admin	admin	2019-06-07 20:57:21.768166	t	2019-06-07 20:59:34	1	14	0	77	0	0
50	bckazc@cazjh.com	987654321	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Sfez	Emma	2019-12-02 17:01:35.683666	t	2019-06-07 20:59:34	0	0	0	0	0	0
53	hcazjc@gchjq.com	9721	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	CARTOZO	Florian	2019-12-02 18:33:11.529534	t	2019-06-07 20:59:34	0	0	0	0	0	0
55	haczkz@zcghe.com	10001480861	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Bader 	Monika	2019-12-04 14:54:32.107453	t	2019-06-07 20:59:34	0	0	0	0	0	0
3	fazihc@fxztgh.com	10001422434	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Sfez	Annie	2019-06-07 20:57:34.334352	t	2019-06-07 20:59:34	42	0	0	0	0	0
11	bjakza@vbak.com	180512	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Cartozo	Maxime	2019-10-01 19:05:54.185276	t	2019-10-01 19:08:22.17276	687	0	60	14	0	0
7	fhucazjc@vgahzb.com	202020	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Chenu-Tournier	Jeanne	2019-07-22 14:19:58.720106	t	2019-07-22 14:21:09.348953	1289	990	15	209	0	0
2	cakc@vaehjv.com	123456	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Lahmi	Michael	2019-06-07 20:57:34.034395	t	2019-06-07 20:59:34	45	18	38	22	0	0
57	cgihaekqcez@cvahjc.com	15051991	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Robert	Hélène	2020-01-15 13:08:18.791755	t	2019-06-07 20:59:34	0	0	0	0	0	0
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: gloth
--

COPY public.user_roles (id, user_id, role_id) FROM stdin;
1	1	1
3	3	2
4	4	1
5	5	1
16	11	2
17	7	2
25	12	2
28	18	3
39	34	3
40	36	3
43	37	3
45	17	2
47	10	1
57	53	1
58	54	3
59	55	3
61	50	1
62	2	2
65	57	2
\.


--
-- Name: pathology_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gloth
--

SELECT pg_catalog.setval('public.pathology_id_seq', 1408, true);


--
-- Name: pathology_specialty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gloth
--

SELECT pg_catalog.setval('public.pathology_specialty_id_seq', 1423, true);


--
-- Name: patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gloth
--

SELECT pg_catalog.setval('public.patient_id_seq', 2271, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gloth
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- Name: specialty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gloth
--

SELECT pg_catalog.setval('public.specialty_id_seq', 24, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gloth
--

SELECT pg_catalog.setval('public.user_id_seq', 57, true);


--
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gloth
--

SELECT pg_catalog.setval('public.user_roles_id_seq', 65, true);


--
-- Name: pathology pathology_pkey; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.pathology
    ADD CONSTRAINT pathology_pkey PRIMARY KEY (id);


--
-- Name: pathology_specialty pathology_specialty_pkey; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.pathology_specialty
    ADD CONSTRAINT pathology_specialty_pkey PRIMARY KEY (id);


--
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: specialty specialty_name_key; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.specialty
    ADD CONSTRAINT specialty_name_key UNIQUE (name);


--
-- Name: specialty specialty_pkey; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.specialty
    ADD CONSTRAINT specialty_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: user user_rpps_key; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_rpps_key UNIQUE (rpps);


--
-- Name: pathology_specialty pathology_specialty_pathology_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.pathology_specialty
    ADD CONSTRAINT pathology_specialty_pathology_id_fkey FOREIGN KEY (pathology_id) REFERENCES public.pathology(id) ON DELETE CASCADE;


--
-- Name: pathology_specialty pathology_specialty_specialty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.pathology_specialty
    ADD CONSTRAINT pathology_specialty_specialty_id_fkey FOREIGN KEY (specialty_id) REFERENCES public.specialty(id) ON DELETE CASCADE;


--
-- Name: user_roles user_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: user_roles user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

