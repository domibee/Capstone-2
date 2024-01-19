--
--From  https://github.com/jason-fries/drugsatfda-db
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: _actiontypes_lookup; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._actiontypes_lookup (
    actiontypes_lookupid smallint,
    actiontypes_lookupdescription character varying(48) DEFAULT NULL::character varying,
    supplcategorylevel1code character varying(11) DEFAULT NULL::character varying,
    supplcategorylevel2code character varying(14) DEFAULT NULL::character varying
);


ALTER TABLE public._actiontypes_lookup OWNER TO rebasedata;

--
-- Name: _applicationdocs; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._applicationdocs (
    applicationdocsid integer,
    applicationdocstypeid smallint,
    applno integer,
    submissiontype character varying(10) DEFAULT NULL::character varying,
    submissionno smallint,
    applicationdocstitle character varying(67) DEFAULT NULL::character varying,
    applicationdocsurl character varying(200) DEFAULT NULL::character varying,
    applicationdocsdate character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._applicationdocs OWNER TO rebasedata;

--
-- Name: _applications; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._applications (
    applno integer,
    appltype character varying(4) DEFAULT NULL::character varying,
    applpublicnotes character varying(31) DEFAULT NULL::character varying,
    sponsorname character varying(42) DEFAULT NULL::character varying
);


ALTER TABLE public._applications OWNER TO rebasedata;

--
-- Name: _applicationsdocstype_lookup; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._applicationsdocstype_lookup (
    applicationdocstype_lookup_id smallint,
    applicationdocstype_lookup_description character varying(40) DEFAULT NULL::character varying
);


ALTER TABLE public._applicationsdocstype_lookup OWNER TO rebasedata;

--
-- Name: _marketingstatus; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._marketingstatus (
    marketingstatusid smallint,
    applno integer,
    productno smallint
);


ALTER TABLE public._marketingstatus OWNER TO rebasedata;

--
-- Name: _marketingstatus_lookup; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._marketingstatus_lookup (
    marketingstatusid smallint,
    marketingstatusdescription character varying(25) DEFAULT NULL::character varying
);


ALTER TABLE public._marketingstatus_lookup OWNER TO rebasedata;

--
-- Name: _products; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._products (
    applno integer,
    productno smallint,
    form character varying(77) DEFAULT NULL::character varying,
    strength character varying(206) DEFAULT NULL::character varying,
    referencedrug character varying(1) DEFAULT NULL::character varying,
    drugname character varying(111) DEFAULT NULL::character varying,
    activeingredient character varying(233) DEFAULT NULL::character varying,
    referencestandard character varying(22) DEFAULT NULL::character varying
);


ALTER TABLE public._products OWNER TO rebasedata;

--
-- Name: _submissionclass_lookup; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._submissionclass_lookup (
    submissionclasscodeid smallint,
    submissionclasscode character varying(12) DEFAULT NULL::character varying,
    submissionclasscodedescription character varying(96) DEFAULT NULL::character varying
);


ALTER TABLE public._submissionclass_lookup OWNER TO rebasedata;

--
-- Name: _submissionpropertytype; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._submissionpropertytype (
    applno integer,
    submissiontype character varying(10) DEFAULT NULL::character varying,
    submissionno smallint,
    submissionpropertytypecode character varying(6) DEFAULT NULL::character varying,
    submissionpropertytypeid smallint
);


ALTER TABLE public._submissionpropertytype OWNER TO rebasedata;

--
-- Name: _submissions; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._submissions (
    applno integer,
    submissionclasscodeid character varying(2) DEFAULT NULL::character varying,
    submissiontype character varying(5) DEFAULT NULL::character varying,
    submissionno smallint,
    submissionstatus character varying(2) DEFAULT NULL::character varying,
    submissionstatusdate character varying(1) DEFAULT NULL::character varying,
    submissionspublicnotes character varying(187) DEFAULT NULL::character varying,
    reviewpriority character varying(12) DEFAULT NULL::character varying
);


ALTER TABLE public._submissions OWNER TO rebasedata;

--
-- Name: _te; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._te (
    applno integer,
    productno smallint,
    marketingstatusid smallint,
    tecode character varying(3) DEFAULT NULL::character varying
);


ALTER TABLE public._te OWNER TO rebasedata;

--
-- Name: _v_drugapplications; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._v_drugapplications (
    applno integer,
    appltype character varying(4) DEFAULT NULL::character varying,
    sponsorname character varying(42) DEFAULT NULL::character varying,
    submissionno smallint,
    submissiontype character varying(5) DEFAULT NULL::character varying,
    submissionstatus character varying(2) DEFAULT NULL::character varying,
    submissionstatusdate character varying(1) DEFAULT NULL::character varying,
    reviewpriority character varying(12) DEFAULT NULL::character varying,
    productno smallint,
    drugname character varying(111) DEFAULT NULL::character varying,
    activeingredient character varying(233) DEFAULT NULL::character varying,
    form character varying(77) DEFAULT NULL::character varying,
    strength character varying(206) DEFAULT NULL::character varying,
    marketingstatusdescription character varying(25) DEFAULT NULL::character varying
);


ALTER TABLE public._v_drugapplications OWNER TO rebasedata;

--
-- Data for Name: _actiontypes_lookup; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._actiontypes_lookup (actiontypes_lookupid, actiontypes_lookupdescription, supplcategorylevel1code, supplcategorylevel2code) FROM stdin;
1	Bioequivalence	BIOEQUIV	
2	Efficacy	EFFICACY	NOT APPLICABLE
3	Efficacy-Accelerated Approval	EFFICACY	ACCEL APP
4	Efficacy-Accelerated Approval Confirmatory Study	EFFICACY	COMP EFF
5	Efficacy-Labeling Change With Clinical Data	EFFICACY	LABEL W CLIN
6	Efficacy-Manufacturing Change With Clinical Data	EFFICACY	MANU W CLIN
7	Efficacy-New Dosing Regimen	EFFICACY	DOSING
8	Efficacy-New Indication	EFFICACY	INDICATION
9	Efficacy-New Patient Population	EFFICACY	PAT POPUL
10	Efficacy-New Route Of Administration	EFFICACY	ROUTE
11	Efficacy-Pediatric	EFFICACY	PEDIATRIC
12	Efficacy-Rx To OTC Switch	EFFICACY	RX TO OTC
13	Labeling	LABELING	NOT APPLICABLE
14	Labeling-Container/Carton Labels	LABELING	CONT/CARTON
15	Labeling-Container/Carton Labels	LABELING	CONT/CARTON
16	Labeling-Container/Carton Labels	LABELING	CONT/CARTON
17	Labeling-Container/Carton Labels	LABELING	CONT/CARTON
18	Labeling-Medication Guide	LABELING	MED GUIDE
19	Labeling-Package Insert	LABELING	PI
20	Labeling-Package Insert	LABELING	PI
21	Labeling-Package Insert	LABELING	PI
22	Labeling-Package Insert	LABELING	PI
23	Labeling-Package Insert	LABELING	PI
24	Labeling-Package Insert	LABELING	PI
25	Labeling-Package Insert	LABELING	PI
26	Labeling-Package Insert	LABELING	PI
27	Labeling-Package Insert	LABELING	PI
28	Labeling-Patient Package Insert	LABELING	PPI
29	Labeling-Proprietary Name Change	LABELING	PROP NAME
30	Manufacturing (CMC)	MANUF (CMC)	
31	Manufacturing (CMC)	MANUF (CMC)	NOT APPLICABLE
32	Manufacturing (CMC)-Container/Carton Labels	MANUF (CMC)	CONT/CARTON
33	Manufacturing (CMC)-Control	MANUF (CMC)	CONTROL
34	Manufacturing (CMC)-Expiration Date	MANUF (CMC)	EXPIRATION
35	Manufacturing (CMC)-Facility	MANUF (CMC)	FACILITY
36	Manufacturing (CMC)-Facility	MANUF (CMC)	FACILITY
37	Manufacturing (CMC)-Formulation	MANUF (CMC)	FORMULATION
38	Manufacturing (CMC)-Manufacturing Process	MANUF (CMC)	MANU PROC
39	Manufacturing (CMC)-Microbiology-Processing	MANUF (CMC)	MICRO-PROC
40	Manufacturing (CMC)-New Strength	MANUF (CMC)	STRENGTH
41	Manufacturing (CMC)-Not Applicable	MANUF (CMC)	NOT APPLICABLE
42	Manufacturing (CMC)-Packaging	MANUF (CMC)	PACKAGING
43	Manufacturing (CMC)-Package Insert	MANUF (CMC)	PI
44	Manufacturing (CMC)-Patient Package Insert	MANUF (CMC)	PPI
45	Unspecified	UNSPEC	
46			NOT APPLICABLE
47	Labeling-Package Insert	LABELING	PI
48	Labeling-Package Insert	LABELING	PI
49	Labeling-Package Insert	LABELING	PI
50	REMS-Assessment	REMS	ASSESSMENT
51	REMS-Modified	REMS	MODIFIED
52	REMS	REMS	NOT APPLICABLE
53	REMS-Proposal	REMS	PROPOSAL
54	Efficacy-Animal Rule	EFFICACY	ANIM RULE
55	REMS - MODIFIED - D-N-A	REMS	MODIFIED
56	REMS - ASSESSMENT - MODIFIED	REMS	ASSESSMENT
57	REMS - PROPOSAL - D-N-A	REMS	PROPOSAL
58	REMS - MODIFIED - BIFURCATED	REMS	MODIFIED
59	 -  - 		
\.


--
-- Data for Name: _applicationdocs; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._applicationdocs (applicationdocsid, applicationdocstypeid, applno, submissiontype, submissionno, applicationdocstitle, applicationdocsurl, applicationdocsdate) FROM stdin;
1	1	4782	SUPPL     	125	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/04782slr125ltr.pdf	
2	1	4782	SUPPL     	128	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2002/04782slr128ltr.pdf	
3	1	4782	SUPPL     	130	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/04782se2-115,slr130ltr.pdf	
4	1	4782	SUPPL     	138	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2005/004782s138,139ltr.pdf	
5	1	4782	SUPPL     	141	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2005/004782s141ltr.pdf	
6	1	4782	SUPPL     	142	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2005/004782s142ltr.pdf	
7	1	4782	SUPPL     	147	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2006/04782s147_ltr.pdf	
8	1	4782	SUPPL     	164	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2011/004782s162,s164,s0167ltr.pdf	
9	1	4782	SUPPL     	167	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2011/004782s162,s164,s0167ltr.pdf	
10	1	4782	SUPPL     	171	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2014/004782Orig1s171ltr.pdf	
11	1	5010	SUPPL     	47	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/05010slr047ltr.pdf	
12	1	5010	SUPPL     	49	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2009/005010s049ltr.pdf	
13	1	5010	SUPPL     	50	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2011/005010s050ltr.pdf	
14	1	5213	SUPPL     	37	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2009/005213s037ltr.pdf	
15	1	5378	SUPPL     	27	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2013/005378Orig1s027ltr.pdf	
16	1	5619	SUPPL     	16	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2002/05619s16ltr.pdf	
17	1	5856	SUPPL     	20	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2009/005856s020ltr.pdf	
18	1	5929	SUPPL     	32	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2002/05929slr032,033and20148slr007,008ltr.pdf	
19	1	5939	SUPPL     	7	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2007/05939s007Ltr.pdf	
20	1	6002	SUPPL     	39	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/06002slr039ltr.pdf	
21	1	6002	SUPPL     	42	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2009/006002s042ltr.pdf	
22	1	6035	SUPPL     	72	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2004/06035slr072ltr.pdf	
23	1	6035	SUPPL     	73	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/06035slr073ltr.pdf	
24	1	6134	SUPPL     	28	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2006/06134s028ltr.pdf	
25	1	6134	SUPPL     	32	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2013/006134Orig1s032ltr.pdf	
26	1	6134	SUPPL     	35	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2014/006134Orig1s035ltr.pdf	
27	1	6134	SUPPL     	36	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2014/006134Orig1s036ltr.pdf	
28	1	6134	SUPPL     	39	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2016/006134Orig1s039ltr.pdf	
29	1	6188	SUPPL     	21	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2011/006188s021,s022ltr.pdf	
30	1	6695	SUPPL     	30	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/06695slr030ltr.pdf	
31	1	6773	SUPPL     	36	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/06773slr036ltr.pdf	
32	1	6882	SUPPL     	33	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/06882slr033ltr.pdf	
33	1	6927	SUPPL     	21	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/06927slr030,09112slr021ltr.pdf	
34	1	7073	SUPPL     	126	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2013/007073Orig1s126ltr.pdf	
35	1	7337	SUPPL     	29	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2004/07337slr029ltr.pdf	
36	1	7337	SUPPL     	43	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2006/07337s043LTR.pdf	
37	1	7337	SUPPL     	46	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2010/007337s046ltr.pdf	
38	1	7409	SUPPL     	42	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2013/007409Orig1s042,008370Orig1s033ltr.pdf	
39	1	7638	SUPPL     	32	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2006/007638s032ltr.pdf	
40	1	7638	SUPPL     	33	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2008/007638s033ltr.pdf	
41	1	7935	SUPPL     	25	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2002/07935slr025,026,028ltr.pdf	
42	1	7935	SUPPL     	28	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2002/07935slr025,026,028ltr.pdf	
43	1	7935	SUPPL     	30	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2004/07935s030ltr.pdf	
44	1	7961	SUPPL     	28	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2011/007409s041,007961s028,008370s032ltr.pdf	
45	1	793	SUPPL     	25	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2007/000793s025ltr.pdf	
46	1	1546	SUPPL     	11	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2002/1546s011.pdf	
47	1	3444	SUPPL     	20	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/03444slr020ltr.pdf	
48	1	4782	SUPPL     	93	0	http://www.accessdata.fda.gov/drugsatfda_docs/nda/98/04782s093_premarin_appltrs.pdf	
49	1	4782	SUPPL     	115	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/04782se2-115,slr130ltr.pdf	
50	1	4782	SUPPL     	129	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/04782slr129ltr.pdf	
51	1	4782	SUPPL     	133	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2004/04782slr133,136ltr.pdf	
52	1	4782	SUPPL     	136	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2004/04782slr133,136ltr.pdf	
53	1	4782	SUPPL     	137	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2004/04782s137ltr.pdf	
54	1	4782	SUPPL     	139	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2005/004782s138,139ltr.pdf	
55	1	4782	SUPPL     	146	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2006/004782s146LTR.pdf	
56	1	4782	SUPPL     	155	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2008/004782s155ltr.pdf	
57	1	4782	SUPPL     	162	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2011/004782s162,s164,s0167ltr.pdf	
58	1	5010	SUPPL     	48	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/05010slr048ltr.pdf	
59	1	5010	SUPPL     	51	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2011/005010s051ltr.pdf	
60	1	5378	SUPPL     	24	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2006/05378s024ltr.pdf	
61	1	5378	SUPPL     	26	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2007/005378s026ltr.pdf	
62	1	5378	SUPPL     	28	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2013/005378Orig1s028ltr.pdf	
63	1	5378	SUPPL     	30	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2015/005378Orig1s030ltr.pdf	
64	1	5619	SUPPL     	18	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2002/05619slr018ltr.pdf	
65	1	5619	SUPPL     	20	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2005/005619s020ltr.pdf	
66	1	5619	SUPPL     	21	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2011/005619s021ltr.pdf	
67	1	5856	SUPPL     	21	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2012/005856s021ltr.pdf	
68	1	5929	SUPPL     	33	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2002/05929slr032,033and20148slr007,008ltr.pdf	
69	1	6002	SUPPL     	43	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2013/006002Orig1s043ltr.pdf	
70	1	6035	SUPPL     	75	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2007/006035s07LTRd.pdf	
71	1	6035	SUPPL     	78	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2012/006035s078ltr.pdf	
72	1	6134	SUPPL     	30	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2012/006134Orig1s030ltr.pdf	
73	1	6134	SUPPL     	31	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2012/006134Orig1s031ltr.pdf	
74	1	6134	SUPPL     	37	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2015/006134Orig1s037ltr.pdf	
75	1	6134	SUPPL     	38	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2015/006134Orig1s038ltr.pdf	
76	1	6188	SUPPL     	20	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2010/006188s020ltr.pdf	
77	1	6188	SUPPL     	22	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2011/006188s021,s022ltr.pdf	
78	1	6188	SUPPL     	24	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2015/006188Orig1s024ltr.pdf	
79	1	6188	SUPPL     	25	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2016/006188Orig1s025ltr.pdf	
80	1	6488	SUPPL     	74	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2010/006488s074ltr.pdf	
81	1	6695	SUPPL     	31	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2004/06695slr031ltr.pdf	
82	1	6927	SUPPL     	30	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/06927slr030,09112slr021ltr.pdf	
83	1	7073	SUPPL     	115	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2001/07073s115ltr.pdf	
84	1	7073	SUPPL     	120	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2002/7073slr120ltr.pdf	
85	1	7073	SUPPL     	125	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2012/007073Orig1s125ltr.pdf	
86	1	7073	SUPPL     	128	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2014/007073Orig1s128ltr.pdf	
87	1	7337	SUPPL     	45	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2010/007337s045ltr.pdf	
88	1	7409	SUPPL     	40	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2007/007409s040, 007961s026, 008370s031LTR.pdf	
89	1	8085	SUPPL     	52	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/08085slr052,scm055ltr.pdf	
90	1	8085	SUPPL     	53	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2002/08085s53s54ltr.pdf	
91	1	8085	SUPPL     	55	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/08085slr052,scm055ltr.pdf	
92	1	8306	SUPPL     	30	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2008/008306s030ltr.pdf	
93	1	8316	SUPPL     	15	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/08316slr015ltr.pdf	
94	1	8316	SUPPL     	17	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2008/008316s017ltr.pdf	
95	1	8316	SUPPL     	21	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2015/008316Orig1s021ltr.pdf	
96	1	8316	SUPPL     	22	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2016/008316Orig1s022ltr.pdf	
97	1	8370	SUPPL     	30	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2002/08-370slr030ltr.pdf	
98	1	8372	SUPPL     	45	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2012/008372s045ltr.pdf	
99	1	8381	SUPPL     	26	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2003/08381slr027ltr.pdf	
100	1	8381	SUPPL     	30	0	http://www.accessdata.fda.gov/drugsatfda_docs/appletter/2008/008381s030ltr.pdf	
\.


--
-- Data for Name: _applications; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._applications (applno, appltype, applpublicnotes, sponsorname) FROM stdin;
4	NDA		PHARMICS
159	NDA		LILLY
552	NDA		ORGANON USA INC
734	NDA		LILLY
793	NDA		MYLAN SPECIALITY LP
1104	NDA		ORGANON USA INC
1504	NDA		THE VERARD COMPANY
1546	NDA		MERCK SHARP DOHME
2139	NDA		LILLY
2282	NDA		ISO TEX
2386	NDA		GD SEARLE LLC
2918	NDA		POYTHRESS
3158	NDA		SCHERING
3240	NDA		NOVARTIS
3402	NDA		PARKE DAVIS
3444	NDA		SS PHARMA
3718	NDA		ROCHE
3977	NDA		PARKEDALE
4039	NDA		LILLY
4040	NDA		LILLY
4041	NDA		LILLY
4054	NDA		LEDERLE
4056	NDA		BRISTOL MYERS SQUIBB
4122	NDA		LILLY
4125	NDA		ABBVIE
4570	NDA		PHARMACIA AND UPJOHN
4589	NDA		B BRAUN
4782	NDA		WYETH PHARMS
5010	NDA		VALIDUS PHARMS
5151	NDA		NOVARTIS
5213	NDA		GENUS
5264	NDA		HOSPIRA
5292	NDA		SCHERING
5319	NDA		ALCON
5378	NDA		KEY THERAP
5490	NDA		ORGANON USA INC
5509	NDA		LILLY
5521	NDA		LILLY
5545	NDA		ABBVIE
5619	NDA		MERCK
5620	NDA		MERCK
5657	NDA		BRISTOL MYERS SQUIBB
5691	NDA		MEDPOINTE PHARM HLC
5725	NDA		LILLY
5794	NDA		ORTHO MCNEIL PHARM
5795	NDA		SHIRE
5845	NDA		MCNEIL CONS
5856	NDA		ABBVIE
5897	NDA		WYETH PHARMS INC
5914	NDA		NOVARTIS
5929	NDA		BAUSCH
5932	NDA		ABBVIE
5939	NDA		PROVEPHARM SAS
5963	NDA		SCHERING
5970	NDA		ELKINS SINN
6002	NDA		SANOFI AVENTIS US
6008	NDA		NOVARTIS
6012	NDA		LEDERLE
6035	NDA		EDISON THERAPS LLC
6044	NDA		ABBVIE
6071	NDA		ROCHE
6095	NDA		HOSPIRA
6110	NDA		ORTHO MCNEIL PHARM
6134	NDA		HIKMA
6135	NDA		LILLY
6146	NDA		MCNEIL CONS
6170	NDA		B BRAUN
6188	NDA		DAVA PHARMS INC
6203	NDA		NOVARTIS
6213	NDA		LILLY
6270	NDA		ARBROOK
6309	NDA		REED AND CARNRICK
6317	NDA		LILLY
6325	NDA		LILLY
6327	NDA		SANOFI AVENTIS US
6328	NDA		SANOFI AVENTIS US
6333	NDA		CENT PHARMS
6383	NDA		MALLINCKRODT INC
6403	NDA		NOVARTIS
6412	NDA		SANOFI AVENTIS US
6441	NDA		PARKE DAVIS
6459	NDA		LEDERLE
6460	NDA		LILLY
6470	NDA		LILLY
6488	NDA		FRESENIUS KABI USA
6514	NDA		PARKE DAVIS
6525	NDA		ROCHE
6530	NDA		MYLAN SPECIALITY LP
6536	NDA		ODYSSEY PHARMS
6580	NDA		MCGAW
6620	NDA		NOVARTIS
6632	NDA		LILLY
6668	NDA		MERCK
6695	NDA		RECORDATI RARE
6772	NDA		GLAXOSMITHKLINE
6773	NDA		LEDERLE
6798	NDA		PHARMACIA AND UPJOHN
6799	NDA		BRISTOL MYERS SQUIBB
6800	NDA		ABBVIE
6811	NDA		PANRAY
\.


--
-- Data for Name: _applicationsdocstype_lookup; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._applicationsdocstype_lookup (applicationdocstype_lookup_id, applicationdocstype_lookup_description) FROM stdin;
1	Letter
2	Label
3	Review
4	FDA Talk Paper
5	FDA Press Release
6	Patient Package Insert
7	Dear Health Professional Letter
8	Medication Guide
9	Withdrawal Notice
10	Other Important Information from FDA
11	Consumer Information Sheet
12	Exclusivity Letter
13	Questions and Answers
14	Other
15	Patient Information Sheet
16	Healthcare Professional Sheet
17	Pediatric Statistical Review
18	Pediatric Clinical Pharmacology Review
19	REMS
20	Pediatric Medical Review
21	Summary Review
22	Federal Register Notice
23	Pediatric Written Request
24	Pediatric Reissue
25	Pediatric Amendment 1
26	Pediatric Amendment 2
27	Pediatric Amendment 3
28	Pediatric Amendment 4
29	Pediatric Amendment 5
30	Pediatric Amendment 6
31	Pediatric Amendment 7
32	Pediatric Amendment 8
33	Pediatric Amendment 9
34	Pediatric Amendment 10
35	Pediatric Amendment 11
36	Pediatric Amendment 12
37	Pediatric Amendment 13
38	Pediatric Amendment 14
39	Pediatric Amendment 15
40	Pediatric Reissue Amendment 1
41	Pediatric Reissue Amendment 2
42	Pediatric Reissue Amendment 3
43	Pediatric Reissue Amendment 4
44	Pediatric Reissue Amendment 5
45	Pediatric Reissue Amendment 6
46	Pediatric Reissue Amendment 7
47	Pediatric Reissue Amendment 8
48	Pediatric Reissue Amendment 9
49	Pediatric Reissue Amendment 10
50	Pediatric Reissue Amendment 11
51	Pediatric Reissue Amendment 12
52	Pediatric Reissue Amendment 13
53	Pediatric Reissue Amendment 14
54	Pediatric Reissue Amendment 15
55	Pediatric Memo
56	Pediatric Other
57	Pediatric CDTL Review
58	Pediatric Medical Addendum
59	Pediatric Medical Secondary Review
60	Pediatric DD Summary Review
61	Pediatric Addendum
62	Pediatric Clinical Pharmacology Addendum
\.


--
-- Data for Name: _marketingstatus; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._marketingstatus (marketingstatusid, applno, productno) FROM stdin;
3	4	4
3	159	1
3	552	1
3	552	2
3	552	3
3	552	4
3	552	5
3	552	7
3	552	8
3	552	9
3	552	10
3	552	11
3	552	12
3	552	13
3	734	1
3	734	2
3	734	3
3	793	2
3	793	3
3	793	4
3	793	5
3	1104	1
1	1504	1
3	1546	1
3	2139	3
3	2282	1
3	2386	2
3	2386	3
3	2918	1
3	3158	1
3	3158	2
3	3240	1
3	3240	3
3	3240	4
3	3240	5
3	3402	1
1	3444	1
3	3718	4
3	3718	6
3	3718	8
3	3718	10
3	3977	1
3	3977	2
3	3977	3
3	4039	2
3	4039	3
3	4039	4
3	4039	5
3	4039	6
3	4040	1
3	4040	2
3	4041	2
3	4041	3
3	4041	4
3	4041	5
3	4054	1
3	4054	2
3	4056	1
3	4056	2
3	4056	3
3	4056	4
3	4056	5
3	4056	6
3	4056	7
3	4056	8
3	4056	9
3	4056	10
3	4056	11
3	4056	12
3	4056	13
3	4056	14
3	4056	17
3	4122	2
3	4125	5
3	4570	1
3	4570	2
3	4570	3
3	4589	4
1	4782	1
3	4782	2
1	4782	3
1	4782	4
1	4782	5
1	4782	6
3	5010	1
3	5010	2
3	5010	3
3	5010	4
3	5010	5
3	5010	7
3	5010	9
3	5151	1
1	5213	1
1	5213	2
3	5264	4
3	5264	6
3	5264	7
3	5264	8
3	5264	9
3	5264	10
\.


--
-- Data for Name: _marketingstatus_lookup; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._marketingstatus_lookup (marketingstatusid, marketingstatusdescription) FROM stdin;
1	Prescription
2	Over-the-counter
3	Discontinued
4	None (Tentative Approval)
\.


--
-- Data for Name: _products; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._products (applno, productno, form, strength, referencedrug, drugname, activeingredient, referencestandard) FROM stdin;
4	4	SOLUTION/DROPS;OPHTHALMIC	1%	0	PAREDRINE	HYDROXYAMPHETAMINE HYDROBROMIDE	0
159	1	TABLET;ORAL	500MG	0	SULFAPYRIDINE	SULFAPYRIDINE	0
552	1	INJECTABLE;INJECTION	20,000 UNITS/ML	0	LIQUAEMIN SODIUM	HEPARIN SODIUM	0
552	2	INJECTABLE;INJECTION	40,000 UNITS/ML	0	LIQUAEMIN SODIUM	HEPARIN SODIUM	0
552	3	INJECTABLE;INJECTION	5,000 UNITS/ML	0	LIQUAEMIN SODIUM	HEPARIN SODIUM	0
552	4	INJECTABLE;INJECTION	1,000 UNITS/ML	0	LIQUAEMIN SODIUM	HEPARIN SODIUM	0
552	5	INJECTABLE;INJECTION	10,000 UNITS/ML	0	LIQUAEMIN SODIUM	HEPARIN SODIUM	0
552	7	INJECTABLE;INJECTION	100 UNITS/ML	0	LIQUAEMIN LOCK FLUSH	HEPARIN SODIUM	0
552	8	INJECTABLE;INJECTION	1,000 UNITS/ML	0	HEPARIN SODIUM	HEPARIN SODIUM	0
552	9	INJECTABLE;INJECTION	5,000 UNITS/ML	0	HEPARIN SODIUM	HEPARIN SODIUM	0
552	10	INJECTABLE;INJECTION	10,000 UNITS/ML	0	HEPARIN SODIUM	HEPARIN SODIUM	0
552	11	INJECTABLE;INJECTION	1,000 UNITS/ML	0	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	0
552	12	INJECTABLE;INJECTION	5,000 UNITS/ML	0	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	0
552	13	INJECTABLE;INJECTION	10,000 UNITS/ML	0	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	0
734	1	INJECTABLE;INJECTION	EQ 1MG BASE/ML	0	HISTAMINE PHOSPHATE	HISTAMINE PHOSPHATE	0
734	2	INJECTABLE;INJECTION	EQ 0.2MG BASE/ML	0	HISTAMINE PHOSPHATE	HISTAMINE PHOSPHATE	0
734	3	INJECTABLE;INJECTION	EQ 0.1MG BASE/ML	0	HISTAMINE PHOSPHATE	HISTAMINE PHOSPHATE	0
793	2	TABLET;ORAL	15MG **Federal Register determination that product was not discontinued or withdrawn for safety or effectiveness reasons**	0	BUTISOL SODIUM	BUTABARBITAL SODIUM	0
793	3	TABLET;ORAL	50MG **Federal Register determination that product was not discontinued or withdrawn for safety or effectiveness reasons**	0	BUTISOL SODIUM	BUTABARBITAL SODIUM	0
793	4	TABLET;ORAL	30MG	1	BUTISOL SODIUM	BUTABARBITAL SODIUM	0
793	5	TABLET;ORAL	100MG **Federal Register determination that product was not discontinued or withdrawn for safety or effectiveness reasons**	0	BUTISOL SODIUM	BUTABARBITAL SODIUM	0
1104	1	INJECTABLE;INJECTION	5MG/ML	0	DOCA	DESOXYCORTICOSTERONE ACETATE	0
1504	1	UNKNOWN	UNKNOWN	0	VERARD	VERARD	0
1546	1	TABLET;ORAL	125MG	0	GUANIDINE HYDROCHLORIDE	GUANIDINE HYDROCHLORIDE	0
2139	3	TABLET;ORAL	5MG	0	MENADIONE	MENADIONE	0
2282	1	INJECTABLE;INJECTION	100MG/ML	0	INULIN AND SODIUM CHLORIDE	INULIN	0
2386	2	TABLET;ORAL	100MG	0	AMINOPHYLLIN	AMINOPHYLLINE	0
2386	3	TABLET;ORAL	200MG	0	AMINOPHYLLIN	AMINOPHYLLINE	0
2918	1	POWDER;TOPICAL	33.32%	0	BENSULFOID	SULFUR	0
3158	1	TABLET;ORAL	10MG	0	ORETON METHYL	METHYLTESTOSTERONE	0
3158	2	TABLET;ORAL	25MG	0	ORETON METHYL	METHYLTESTOSTERONE	0
3240	1	TABLET;BUCCAL, SUBLINGUAL	10MG	0	METANDREN	METHYLTESTOSTERONE	0
3240	3	TABLET;BUCCAL, SUBLINGUAL	25MG	0	METANDREN	METHYLTESTOSTERONE	0
3240	4	TABLET;BUCCAL, SUBLINGUAL	5MG	0	METANDREN	METHYLTESTOSTERONE	0
3240	5	TABLET;BUCCAL, SUBLINGUAL	10MG	0	METANDREN	METHYLTESTOSTERONE	0
3402	1	INJECTABLE;INJECTION	5PRESSOR UNITS/ML **Federal Register determination that product was not discontinued or withdrawn for safety or effectiveness reasons**	1	PITRESSIN TANNATE	VASOPRESSIN TANNATE	0
3444	1	CAPSULE;ORAL	50,000 IU	1	DRISDOL	ERGOCALCIFEROL	0
3718	4	INJECTABLE;INJECTION	5MG/ML	0	SYNKAYVITE	MENADIOL SODIUM DIPHOSPHATE	0
3718	6	INJECTABLE;INJECTION	10MG/ML	0	SYNKAYVITE	MENADIOL SODIUM DIPHOSPHATE	0
3718	8	INJECTABLE;INJECTION	37.5MG/ML	0	SYNKAYVITE	MENADIOL SODIUM DIPHOSPHATE	0
3718	10	TABLET;ORAL	5MG	0	SYNKAYVITE	MENADIOL SODIUM DIPHOSPHATE	0
3977	1	INJECTABLE;INJECTION	1MG/ML	0	THEELIN	ESTRONE	0
3977	2	INJECTABLE;INJECTION	2MG/ML	0	THEELIN	ESTRONE	0
3977	3	INJECTABLE;INJECTION	5MG/ML	0	THEELIN	ESTRONE	0
4039	2	TABLET, DELAYED RELEASE;ORAL	0.1MG	0	DIETHYLSTILBESTROL	DIETHYLSTILBESTROL	0
4039	3	TABLET, DELAYED RELEASE;ORAL	0.5MG	0	DIETHYLSTILBESTROL	DIETHYLSTILBESTROL	0
4039	4	TABLET, DELAYED RELEASE;ORAL	1MG	0	DIETHYLSTILBESTROL	DIETHYLSTILBESTROL	0
4039	5	TABLET, DELAYED RELEASE;ORAL	0.25MG	0	DIETHYLSTILBESTROL	DIETHYLSTILBESTROL	0
4039	6	TABLET, DELAYED RELEASE;ORAL	5MG	0	DIETHYLSTILBESTROL	DIETHYLSTILBESTROL	0
4040	1	SUPPOSITORY;VAGINAL	0.1MG	0	DIETHYLSTILBESTROL	DIETHYLSTILBESTROL	0
4040	2	SUPPOSITORY;VAGINAL	0.5MG	0	DIETHYLSTILBESTROL	DIETHYLSTILBESTROL	0
4041	2	TABLET;ORAL	0.1MG	0	DIETHYLSTILBESTROL	DIETHYLSTILBESTROL	0
4041	3	TABLET;ORAL	0.5MG	0	DIETHYLSTILBESTROL	DIETHYLSTILBESTROL	0
4041	4	TABLET;ORAL	1MG	0	DIETHYLSTILBESTROL	DIETHYLSTILBESTROL	0
4041	5	TABLET;ORAL	5MG	0	DIETHYLSTILBESTROL	DIETHYLSTILBESTROL	0
4054	1	TABLET;ORAL	500MG	0	SULFADIAZINE	SULFADIAZINE	0
4054	2	INJECTABLE;INJECTION	250MG/ML	0	SULFADIAZINE SODIUM	SULFADIAZINE SODIUM	0
4056	1	SUPPOSITORY;VAGINAL	0.1MG	0	STILBESTROL	DIETHYLSTILBESTROL	0
4056	2	SUPPOSITORY;VAGINAL	0.5MG	0	STILBESTROL	DIETHYLSTILBESTROL	0
4056	3	INJECTABLE;INJECTION	0.2MG/ML	0	STILBESTROL	DIETHYLSTILBESTROL	0
4056	4	INJECTABLE;INJECTION	0.5MG/ML	0	STILBESTROL	DIETHYLSTILBESTROL	0
4056	5	INJECTABLE;INJECTION	1MG/ML	0	STILBESTROL	DIETHYLSTILBESTROL	0
4056	6	INJECTABLE;INJECTION	5MG/ML	0	STILBESTROL	DIETHYLSTILBESTROL	0
4056	7	TABLET;ORAL	0.1MG	0	STILBETIN	DIETHYLSTILBESTROL	0
4056	8	TABLET;ORAL	0.5MG	0	STILBETIN	DIETHYLSTILBESTROL	0
4056	9	TABLET;ORAL	1MG	0	STILBETIN	DIETHYLSTILBESTROL	0
4056	10	TABLET;ORAL	5MG	0	STILBETIN	DIETHYLSTILBESTROL	0
4056	11	TABLET, DELAYED RELEASE;ORAL	0.1MG	0	STILBETIN	DIETHYLSTILBESTROL	0
4056	12	TABLET, DELAYED RELEASE;ORAL	0.5MG	0	STILBETIN	DIETHYLSTILBESTROL	0
4056	13	TABLET, DELAYED RELEASE;ORAL	1MG	0	STILBETIN	DIETHYLSTILBESTROL	0
4056	14	TABLET, DELAYED RELEASE;ORAL	5MG	0	STILBETIN	DIETHYLSTILBESTROL	0
4056	17	TABLET;ORAL	0.25MG	0	STILBETIN	DIETHYLSTILBESTROL	0
4122	2	TABLET;ORAL	500MG	1	SULFADIAZINE	SULFADIAZINE	0
4125	5	TABLET;ORAL	300MG	0	SULFADIAZINE	SULFADIAZINE	0
4570	1	INJECTABLE;INJECTION	1,000 UNITS/ML	0	HEPARIN SODIUM	HEPARIN SODIUM	0
4570	2	INJECTABLE;INJECTION	5,000 UNITS/ML	0	HEPARIN SODIUM	HEPARIN SODIUM	0
4570	3	INJECTABLE;INJECTION	10,000 UNITS/ML	0	HEPARIN SODIUM	HEPARIN SODIUM	0
4589	4	INJECTABLE;INJECTION	5ML/100ML;5GM/100ML	0	ALCOHOL 5% AND DEXTROSE 5%	ALCOHOL; DEXTROSE	0
4782	1	TABLET;ORAL	1.25MG	1	PREMARIN	ESTROGENS, CONJUGATED	1
4782	2	TABLET;ORAL	2.5MG	0	PREMARIN	ESTROGENS, CONJUGATED	0
4782	3	TABLET;ORAL	0.3MG	1	PREMARIN	ESTROGENS, CONJUGATED	0
4782	4	TABLET;ORAL	0.625MG	1	PREMARIN	ESTROGENS, CONJUGATED	1
4782	5	TABLET;ORAL	0.9MG	1	PREMARIN	ESTROGENS, CONJUGATED	1
4782	6	TABLET;ORAL	0.45MG	1	PREMARIN	ESTROGENS, CONJUGATED	0
5010	1	TABLET;ORAL	50MG **Federal Register determination that product was not discontinued or withdrawn for safety or effectiveness reasons**	1	DEMEROL	MEPERIDINE HYDROCHLORIDE	0
5010	2	INJECTABLE;INJECTION	50MG/ML	0	DEMEROL	MEPERIDINE HYDROCHLORIDE	0
5010	3	INJECTABLE;INJECTION	100MG/ML	0	DEMEROL	MEPERIDINE HYDROCHLORIDE	0
5010	4	TABLET;ORAL	100MG	1	DEMEROL	MEPERIDINE HYDROCHLORIDE	0
5010	5	SYRUP;ORAL	50MG/5ML **Federal Register determination that product was not discontinued or withdrawn for safety or effectiveness reasons**	0	DEMEROL	MEPERIDINE HYDROCHLORIDE	0
5010	7	INJECTABLE;INJECTION	25MG/ML	0	DEMEROL	MEPERIDINE HYDROCHLORIDE	0
5010	9	INJECTABLE;INJECTION	75MG/ML	0	DEMEROL	MEPERIDINE HYDROCHLORIDE	0
5151	1	PELLET;IMPLANTATION	125MG	0	PERCORTEN	DESOXYCORTICOSTERONE ACETATE	0
5213	1	TABLET;ORAL	1.5MG;5MG	1	HYCODAN	HOMATROPINE METHYLBROMIDE; HYDROCODONE BITARTRATE	0
5213	2	SYRUP;ORAL	1.5MG/5ML;5MG/5ML	1	HYCODAN	HOMATROPINE METHYLBROMIDE; HYDROCODONE BITARTRATE	0
5264	4	INJECTABLE;INJECTION	1,000 UNITS/ML	0	PANHEPRIN	HEPARIN SODIUM	0
5264	6	INJECTABLE;INJECTION	5,000 UNITS/ML	0	PANHEPRIN	HEPARIN SODIUM	0
5264	7	INJECTABLE;INJECTION	10,000 UNITS/ML	0	PANHEPRIN	HEPARIN SODIUM	0
5264	8	INJECTABLE;INJECTION	20,000 UNITS/ML	0	PANHEPRIN	HEPARIN SODIUM	0
5264	9	INJECTABLE;INJECTION	40,000 UNITS/ML	0	PANHEPRIN	HEPARIN SODIUM	0
5264	10	INJECTABLE;INJECTION	100 UNITS/ML	0	HEPARIN LOCK FLUSH	HEPARIN SODIUM	0
\.


--
-- Data for Name: _submissionclass_lookup; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._submissionclass_lookup (submissionclasscodeid, submissionclasscode, submissionclasscodedescription) FROM stdin;
1	BIOEQUIV	Bioequivalence
2	EFFICACY	Efficacy
3	LABELING	Labeling
4	MANUF (CMC)	Manufacturing (CMC)
5	N/A	Not Applicable
6	S	Supplement
7	TYPE 1	Type 1 - New Molecular Entity
8	TYPE 1/4	Type 1 - New Molecular Entity and Type 4 - New Combination
9	TYPE 2	Type 2 - New Active Ingredient
10	TYPE 2/3	Type 2 - New Active Ingredient and Type 3 - New Dosage Form
11	TYPE 2/4	Type 2 New Active Ingredient and Type 4 New Combination
12	TYPE 3	Type 3 - New Dosage Form
13	TYPE 3/4	Type 3 - New Dosage Form and Type 4 - New Combination
14	TYPE 4	Type 4 - New Combination
15	TYPE 5	Type 5 - New Formulation or New Manufacturer
16	TYPE 6	Type 6 - New Indication (no longer used)
17	TYPE 7	Type 7 - Drug Already Marketed without Approved NDA
18	TYPE 8	Type 8 - Partial Rx to OTC Switch
19	UNKNOWN	
20	Unspecified	
21	REMS	REMS
22	TYPE 10	Type 10 - New Indication Submitted as Distinct NDA - Not Consolidated
23	MEDGAS	Medical Gas
24	TYPE 9	Type 9 - New Indication Submitted as Distinct NDA, Consolidated with Original NDA after Approval
25	TYPE 9- BLA	Type 9 - New indication submitted as distinct BLA, consolidated
26	TYPE 4/5	New Combination and New Formulation or New Manufacturer
27	TYPE 10- BLA	
28	BIOSIMILAR	
\.


--
-- Data for Name: _submissionpropertytype; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._submissionpropertytype (applno, submissiontype, submissionno, submissionpropertytypecode, submissionpropertytypeid) FROM stdin;
159	ORIG      	1	Null	0
159	SUPPL     	3	Null	0
159	SUPPL     	4	Null	0
552	SUPPL     	7	Null	0
552	SUPPL     	8	Null	0
552	SUPPL     	10	Null	0
552	SUPPL     	11	Null	0
552	SUPPL     	14	Null	0
552	SUPPL     	15	Null	0
552	SUPPL     	20	Null	0
552	SUPPL     	21	Null	0
552	SUPPL     	22	Null	0
552	SUPPL     	24	Null	0
734	ORIG      	1	Null	0
734	SUPPL     	8	Null	0
793	SUPPL     	3	Null	0
793	SUPPL     	4	Null	0
793	SUPPL     	9	Null	0
793	SUPPL     	10	Null	0
793	SUPPL     	12	Null	0
793	SUPPL     	13	Null	0
793	SUPPL     	14	Null	0
793	SUPPL     	16	Null	0
793	SUPPL     	17	Null	0
793	SUPPL     	18	Null	0
793	SUPPL     	19	Null	0
793	SUPPL     	21	Null	0
793	SUPPL     	22	Null	0
793	SUPPL     	23	Null	0
793	SUPPL     	24	Null	0
793	SUPPL     	26	Null	6
793	SUPPL     	26	Null	7
793	SUPPL     	26	Null	15
793	SUPPL     	26	Null	31
1104	ORIG      	1	Null	0
1104	SUPPL     	1	Null	0
1546	SUPPL     	4	Null	0
1546	SUPPL     	6	Null	0
1546	SUPPL     	7	Null	0
1546	SUPPL     	8	Null	0
1546	SUPPL     	9	Null	0
1546	SUPPL     	10	Null	0
1546	SUPPL     	12	Null	0
1546	SUPPL     	13	Null	0
1546	SUPPL     	14	Null	0
1546	SUPPL     	15	Null	0
1546	SUPPL     	21	Null	0
1546	SUPPL     	22	Null	0
2282	SUPPL     	3	Null	0
2282	SUPPL     	5	Null	0
2282	SUPPL     	6	Null	0
2282	SUPPL     	10	Null	0
2282	SUPPL     	11	Null	0
2282	SUPPL     	12	Null	0
2282	SUPPL     	15	Null	0
2386	ORIG      	1	Null	0
2386	SUPPL     	1	Null	0
2386	SUPPL     	2	Null	0
2386	SUPPL     	3	Null	0
2386	SUPPL     	4	Null	0
2386	SUPPL     	5	Null	0
2386	SUPPL     	6	Null	0
2386	SUPPL     	7	Null	0
2386	SUPPL     	8	Null	0
2386	SUPPL     	9	Null	0
2386	SUPPL     	10	Null	0
2386	SUPPL     	11	Null	0
2386	SUPPL     	12	Null	0
2386	SUPPL     	13	Null	0
2386	SUPPL     	14	Null	0
2386	SUPPL     	15	Null	0
3444	SUPPL     	6	Null	0
3444	SUPPL     	17	Null	0
3444	SUPPL     	18	Null	0
3444	SUPPL     	19	Null	0
4054	ORIG      	1	Null	0
4054	SUPPL     	1	Null	0
4054	SUPPL     	5	Null	0
4054	SUPPL     	6	Null	0
4054	SUPPL     	7	Null	0
4054	SUPPL     	8	Null	0
4122	ORIG      	1	Null	0
4122	SUPPL     	5	Null	0
4122	SUPPL     	6	Null	0
4122	SUPPL     	8	Null	0
4570	SUPPL     	18	Null	0
4570	SUPPL     	20	Null	0
4570	SUPPL     	23	Null	0
4570	SUPPL     	26	Null	0
4570	SUPPL     	29	Null	0
4570	SUPPL     	31	Null	0
4570	SUPPL     	32	Null	0
4570	SUPPL     	34	Null	0
4570	SUPPL     	36	Null	0
4570	SUPPL     	37	Null	0
4570	SUPPL     	38	Null	0
4570	SUPPL     	46	Null	0
4570	SUPPL     	49	Null	0
4570	SUPPL     	52	Null	0
4570	SUPPL     	53	Null	0
\.


--
-- Data for Name: _submissions; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._submissions (applno, submissionclasscodeid, submissiontype, submissionno, submissionstatus, submissionstatusdate, submissionspublicnotes, reviewpriority) FROM stdin;
4	19	ORIG	1	AP			UNKNOWN
4	3	SUPPL	10	AP			
4	3	SUPPL	11	AP			
159		ORIG	1	AP			
159	3	SUPPL	3	AP			
159	3	SUPPL	4	AP			
415		ORIG	1	AP			
552	19	ORIG	1	AP			UNKNOWN
552	21	SUPPL	7	AP			
552	21	SUPPL	8	AP			
552	4	SUPPL	10	AP			
552	4	SUPPL	11	AP			
552	3	SUPPL	12	AP			
552	3	SUPPL	13	AP			
552	4	SUPPL	14	AP			
552	4	SUPPL	15	AP			
552	3	SUPPL	17	AP			
552	2	SUPPL	18	AP			
552	4	SUPPL	20	AP			
552	4	SUPPL	21	AP			
552	4	SUPPL	22	AP			
552	3	SUPPL	23	AP			
552	4	SUPPL	24	AP			
654	19	ORIG	1	AP			UNKNOWN
734		ORIG	1	AP			
734	4	SUPPL	8	AP			
740		ORIG	1	AP			
763		ORIG	1	AP			
767		ORIG	1	AP			
793	19	ORIG	1	AP			UNKNOWN
793	4	SUPPL	3	AP			
793	4	SUPPL	4	AP			
793	3	SUPPL	5	AP			
793	3	SUPPL	6	AP			
793	3	SUPPL	7	AP			
793	3	SUPPL	8	AP			
793	4	SUPPL	9	AP			
793	4	SUPPL	10	AP			
793	3	SUPPL	11	AP			
793	4	SUPPL	12	AP			
793	4	SUPPL	13	AP			
793	4	SUPPL	14	AP			
793	3	SUPPL	15	AP			
793	4	SUPPL	16	AP			
793	4	SUPPL	17	AP			
793	4	SUPPL	18	AP			
793	4	SUPPL	19	AP			
793	3	SUPPL	20	AP			STANDARD
793	4	SUPPL	21	AP			
793	4	SUPPL	22	AP			
793	4	SUPPL	23	AP			
793	4	SUPPL	24	AP			
793	3	SUPPL	25	AP			STANDARD
793	3	SUPPL	26	AP			901 REQUIRED
1104		ORIG	1	AP			
1104	4	SUPPL	1	AP			
1205	7	ORIG	1	AP			STANDARD
1205	3	SUPPL	2	AP			
1205	3	SUPPL	3	AP			
1374		ORIG	1	AP			
1384	19	ORIG	1	AP			UNKNOWN
1504	19	ORIG	1	AP			STANDARD
1546	19	ORIG	1	AP			UNKNOWN
1546	4	SUPPL	4	AP			
1546	3	SUPPL	5	AP			
1546	4	SUPPL	6	AP			
1546	4	SUPPL	7	AP			
1546	4	SUPPL	8	AP			
1546	4	SUPPL	9	AP			
1546	4	SUPPL	10	AP			
1546	3	SUPPL	11	AP			
1546	4	SUPPL	12	AP			
1546	4	SUPPL	13	AP			
1546	4	SUPPL	14	AP			
1546	4	SUPPL	15	AP			
1546	4	SUPPL	21	AP			
1546	4	SUPPL	22	AP			
1645		ORIG	1	AP			
1952		ORIG	1	AP			
2189	19	ORIG	1	AP			UNKNOWN
2282	14	ORIG	1	AP			STANDARD
2282	21	SUPPL	3	AP			STANDARD
2282	3	SUPPL	4	AP			
2282	4	SUPPL	5	AP			STANDARD
2282	4	SUPPL	6	AP			STANDARD
2282	3	SUPPL	7	AP			
2282	3	SUPPL	8	AP			
2282	4	SUPPL	10	AP			STANDARD
2282	4	SUPPL	11	AP			STANDARD
2282	4	SUPPL	12	AP			STANDARD
2282	4	SUPPL	15	AP			STANDARD
2282	3	SUPPL	16	AP			STANDARD
2386	15	ORIG	1	AP			STANDARD
2386	4	SUPPL	1	AP			STANDARD
2386	3	SUPPL	2	AP			STANDARD
2386	4	SUPPL	3	AP			STANDARD
2386	4	SUPPL	4	AP			STANDARD
2386	3	SUPPL	5	AP			STANDARD
2386	4	SUPPL	6	AP			STANDARD
2386	4	SUPPL	7	AP			STANDARD
\.


--
-- Data for Name: _te; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._te (applno, productno, marketingstatusid, tecode) FROM stdin;
3444	1	1	AA
5213	1	1	AA
5213	2	1	AA
5378	2	1	AA
5929	1	1	AP
6035	4	1	AP
6188	1	1	AB
6488	2	1	AP
6488	4	1	AP
6488	5	1	AP
6488	7	1	AP
6488	8	1	AP
6488	10	1	AP
6488	12	1	AP
6488	17	1	AP
6488	19	1	AP
7073	1	1	AB
7073	2	1	AB
7337	7	1	AA
7513	1	1	AP
8316	1	1	AB
8370	1	1	AP
8370	2	1	AP
8453	2	1	AP
8578	1	1	AB
8697	1	1	AB
8697	2	1	AB
8697	3	1	AB
8708	1	1	AB
8762	1	1	AB
8845	6	1	AP
9053	2	1	AB
9112	3	1	AT
9170	2	1	AB
9170	3	1	AB
9175	1	1	AB
9330	2	1	AP
9402	2	1	AO
9402	3	1	AO
9402	4	1	AO
9435	2	1	AP
9435	6	1	AP
9435	7	1	AP
9768	1	1	AB
9829	2	1	AB
9830	1	1	AP
10104	3	1	AB
10187	3	1	AB
10187	6	1	AB
10187	10	1	AB
10379	1	1	AB
10379	2	1	AB
10379	3	1	AB
10515	1	1	AP
10596	8	1	AB
10721	1	1	AA
10721	4	1	AA
10721	5	1	AA
10721	6	1	AA
11145	5	1	AP
11153	1	1	AB
11153	2	1	AB
11153	3	1	AB
11153	4	1	AB
11153	6	1	AB
11210	1	1	AA
11245	3	1	AA
11366	2	1	AB
11459	2	1	AB
11459	4	1	AB
11525	1	1	AP
11665	1	1	AB
11719	10	1	AP
11719	12	1	AP
11757	1	1	AB
11757	2	1	AB
11757	4	1	AB
11790	1	1	AP
11792	1	1	AA
11792	4	1	AB
11839	1	1	AB
11839	3	1	AB
11839	4	1	AB
11856	3	1	AP
11856	4	1	AP
11856	5	1	AP
11856	6	1	AP
11856	7	1	AP
11909	2	1	AB
12093	1	1	AB
12093	7	1	AB
12104	1	1	AT
12151	8	1	AB
12151	9	1	AB
12151	10	1	AB
12179	1	1	AT
12250	1	1	AP
12250	2	1	AP
12250	5	1	AP
12342	3	1	AB
\.


--
-- Data for Name: _v_drugapplications; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._v_drugapplications (applno, appltype, sponsorname, submissionno, submissiontype, submissionstatus, submissionstatusdate, reviewpriority, productno, drugname, activeingredient, form, strength, marketingstatusdescription) FROM stdin;
4	NDA	PHARMICS	1	ORIG	AP		UNKNOWN	4	PAREDRINE	HYDROXYAMPHETAMINE HYDROBROMIDE	SOLUTION/DROPS;OPHTHALMIC	1%	Discontinued
4	NDA	PHARMICS	10	SUPPL	AP			4	PAREDRINE	HYDROXYAMPHETAMINE HYDROBROMIDE	SOLUTION/DROPS;OPHTHALMIC	1%	Discontinued
4	NDA	PHARMICS	11	SUPPL	AP			4	PAREDRINE	HYDROXYAMPHETAMINE HYDROBROMIDE	SOLUTION/DROPS;OPHTHALMIC	1%	Discontinued
159	NDA	LILLY	3	SUPPL	AP			1	SULFAPYRIDINE	SULFAPYRIDINE	TABLET;ORAL	500MG	Discontinued
159	NDA	LILLY	4	SUPPL	AP			1	SULFAPYRIDINE	SULFAPYRIDINE	TABLET;ORAL	500MG	Discontinued
552	NDA	ORGANON USA INC	1	ORIG	AP		UNKNOWN	1	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	20,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	1	ORIG	AP		UNKNOWN	2	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	40,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	1	ORIG	AP		UNKNOWN	3	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	1	ORIG	AP		UNKNOWN	4	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	1	ORIG	AP		UNKNOWN	5	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	1	ORIG	AP		UNKNOWN	7	LIQUAEMIN LOCK FLUSH	HEPARIN SODIUM	INJECTABLE;INJECTION	100 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	1	ORIG	AP		UNKNOWN	8	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	1	ORIG	AP		UNKNOWN	9	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	1	ORIG	AP		UNKNOWN	10	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	1	ORIG	AP		UNKNOWN	11	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	1	ORIG	AP		UNKNOWN	12	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	1	ORIG	AP		UNKNOWN	13	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	7	SUPPL	AP			1	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	20,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	7	SUPPL	AP			2	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	40,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	7	SUPPL	AP			3	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	7	SUPPL	AP			4	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	7	SUPPL	AP			5	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	7	SUPPL	AP			7	LIQUAEMIN LOCK FLUSH	HEPARIN SODIUM	INJECTABLE;INJECTION	100 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	7	SUPPL	AP			8	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	7	SUPPL	AP			9	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	7	SUPPL	AP			10	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	7	SUPPL	AP			11	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	7	SUPPL	AP			12	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	7	SUPPL	AP			13	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	8	SUPPL	AP			1	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	20,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	8	SUPPL	AP			2	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	40,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	8	SUPPL	AP			3	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	8	SUPPL	AP			4	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	8	SUPPL	AP			5	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	8	SUPPL	AP			7	LIQUAEMIN LOCK FLUSH	HEPARIN SODIUM	INJECTABLE;INJECTION	100 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	8	SUPPL	AP			8	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	8	SUPPL	AP			9	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	8	SUPPL	AP			10	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	8	SUPPL	AP			11	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	8	SUPPL	AP			12	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	8	SUPPL	AP			13	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	10	SUPPL	AP			1	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	20,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	10	SUPPL	AP			2	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	40,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	10	SUPPL	AP			3	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	10	SUPPL	AP			4	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	10	SUPPL	AP			5	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	10	SUPPL	AP			7	LIQUAEMIN LOCK FLUSH	HEPARIN SODIUM	INJECTABLE;INJECTION	100 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	10	SUPPL	AP			8	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	10	SUPPL	AP			9	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	10	SUPPL	AP			10	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	10	SUPPL	AP			11	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	10	SUPPL	AP			12	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	10	SUPPL	AP			13	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	11	SUPPL	AP			1	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	20,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	11	SUPPL	AP			2	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	40,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	11	SUPPL	AP			3	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	11	SUPPL	AP			4	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	11	SUPPL	AP			5	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	11	SUPPL	AP			7	LIQUAEMIN LOCK FLUSH	HEPARIN SODIUM	INJECTABLE;INJECTION	100 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	11	SUPPL	AP			8	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	11	SUPPL	AP			9	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	11	SUPPL	AP			10	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	11	SUPPL	AP			11	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	11	SUPPL	AP			12	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	11	SUPPL	AP			13	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	12	SUPPL	AP			1	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	20,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	12	SUPPL	AP			2	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	40,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	12	SUPPL	AP			3	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	12	SUPPL	AP			4	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	12	SUPPL	AP			5	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	12	SUPPL	AP			7	LIQUAEMIN LOCK FLUSH	HEPARIN SODIUM	INJECTABLE;INJECTION	100 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	12	SUPPL	AP			8	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	12	SUPPL	AP			9	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	12	SUPPL	AP			10	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	12	SUPPL	AP			11	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	12	SUPPL	AP			12	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	12	SUPPL	AP			13	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	13	SUPPL	AP			1	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	20,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	13	SUPPL	AP			2	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	40,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	13	SUPPL	AP			3	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	13	SUPPL	AP			4	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	13	SUPPL	AP			5	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	13	SUPPL	AP			7	LIQUAEMIN LOCK FLUSH	HEPARIN SODIUM	INJECTABLE;INJECTION	100 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	13	SUPPL	AP			8	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	13	SUPPL	AP			9	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	13	SUPPL	AP			10	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	13	SUPPL	AP			11	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	13	SUPPL	AP			12	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	13	SUPPL	AP			13	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	14	SUPPL	AP			1	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	20,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	14	SUPPL	AP			2	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	40,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	14	SUPPL	AP			3	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	14	SUPPL	AP			4	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	14	SUPPL	AP			5	LIQUAEMIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	14	SUPPL	AP			7	LIQUAEMIN LOCK FLUSH	HEPARIN SODIUM	INJECTABLE;INJECTION	100 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	14	SUPPL	AP			8	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	14	SUPPL	AP			9	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	14	SUPPL	AP			10	HEPARIN SODIUM	HEPARIN SODIUM	INJECTABLE;INJECTION	10,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	14	SUPPL	AP			11	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	1,000 UNITS/ML	Discontinued
552	NDA	ORGANON USA INC	14	SUPPL	AP			12	LIQUAEMIN SODIUM PRESERVATIVE FREE	HEPARIN SODIUM	INJECTABLE;INJECTION	5,000 UNITS/ML	Discontinued
\.


--
-- PostgreSQL database dump complete
--

