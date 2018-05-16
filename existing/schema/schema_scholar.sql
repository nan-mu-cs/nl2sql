CREATE TABLE `author` (
  `authorId` integer NOT NULL
,  `authorName` varchar(50) DEFAULT NULL
,  PRIMARY KEY (`authorId`)
);
INSERT INTO author VALUES(0,'Ming-Jung Seow');
INSERT INTO author VALUES(1,'Vijayan K. Asari');
INSERT INTO author VALUES(2,'Magdalena M Przybycien-Szymanska');
INSERT INTO author VALUES(3,'Yuchen Yang');
INSERT INTO author VALUES(4,'William W Ashley');
INSERT INTO author VALUES(5,'Richard Durrett');
INSERT INTO author VALUES(6,'Vlada Limic');
INSERT INTO author VALUES(7,'H Fai Poon');
INSERT INTO author VALUES(8,'Vittorio Calabrese');
INSERT INTO author VALUES(9,'Giovanni Scapagnini');
INSERT INTO author VALUES(10,'D Allan Butterfield');
INSERT INTO author VALUES(11,'Erin J Adams');
INSERT INTO author VALUES(12,'Yueh-Hsiu Chien');
INSERT INTO author VALUES(13,'K Christopher Garcia');
INSERT INTO author VALUES(14,'Raed Mesleh');
INSERT INTO author VALUES(15,'Salama Ikki');
INSERT INTO author VALUES(16,'Osama Amin');
INSERT INTO author VALUES(17,'Said Boussakta');
INSERT INTO author VALUES(18,'Jin Hong Kim');

CREATE TABLE `cite` (
  `citingPaperId` integer NOT NULL
,  `citedPaperId` integer NOT NULL
,  PRIMARY KEY (`citingPaperId`,`citedPaperId`)
);

INSERT INTO cite VALUES(1,0);
INSERT INTO cite VALUES(1,958659);
INSERT INTO cite VALUES(1,1922502);
INSERT INTO cite VALUES(1,1929452);
INSERT INTO cite VALUES(1,2658411);
INSERT INTO cite VALUES(1,3035560);
INSERT INTO cite VALUES(1,4798569);
INSERT INTO cite VALUES(1,5649468);
INSERT INTO cite VALUES(1,6268239);
INSERT INTO cite VALUES(1,6886249);
INSERT INTO cite VALUES(1,7670586);
INSERT INTO cite VALUES(1,8486738);
INSERT INTO cite VALUES(1,9030681);
INSERT INTO cite VALUES(1,10275715);
INSERT INTO cite VALUES(1,10307505);
INSERT INTO cite VALUES(3,2027715);
INSERT INTO cite VALUES(3,5564908);
INSERT INTO cite VALUES(3,7437027);
INSERT INTO cite VALUES(4,3);
INSERT INTO cite VALUES(4,460581);
INSERT INTO cite VALUES(4,580267);
INSERT INTO cite VALUES(4,839729);

CREATE TABLE `dataset` (
  `datasetId` integer NOT NULL
,  `datasetName` varchar(50) DEFAULT NULL
,  PRIMARY KEY (`datasetId`)
);

INSERT INTO dataset VALUES(165,'Stanford 40 Actions');
INSERT INTO dataset VALUES(166,'STONEFLY9');
INSERT INTO dataset VALUES(167,'Torch7');
INSERT INTO dataset VALUES(168,'The Blizzard Challenge');
INSERT INTO dataset VALUES(169,'PPDB');
INSERT INTO dataset VALUES(170,'ACE 2005 Multilingual Training');
INSERT INTO dataset VALUES(171,'Zurich Buildings');
INSERT INTO dataset VALUES(172,'HEP-Th');
INSERT INTO dataset VALUES(173,'Paraphrase Discovery');
INSERT INTO dataset VALUES(174,'KITTI');
INSERT INTO dataset VALUES(175,'English gigaword');
INSERT INTO dataset VALUES(176,'UniGene: An Organized View of the Transcriptome');
INSERT INTO dataset VALUES(177,'ASLAN Challenge');
INSERT INTO dataset VALUES(178,'Arabic morphological analyzer');
INSERT INTO dataset VALUES(179,'Stanford Helicopter');
INSERT INTO dataset VALUES(180,'WSARE');
INSERT INTO dataset VALUES(181,'CalTech 101 Silhouettes');
INSERT INTO dataset VALUES(182,'Treebank-3');
INSERT INTO dataset VALUES(184,'Potsdam Commentary');
INSERT INTO dataset VALUES(185,'DASH');
INSERT INTO dataset VALUES(186,'Congealing Complex Images');
INSERT INTO dataset VALUES(187,'Syntactic-Ngrams');
INSERT INTO dataset VALUES(188,'Endgame');
INSERT INTO dataset VALUES(189,'Switchboard-1');
INSERT INTO dataset VALUES(190,'PASCAL3D+');
INSERT INTO dataset VALUES(191,'eXtended WordNet');
INSERT INTO dataset VALUES(192,'RST Discourse Treebank');
INSERT INTO dataset VALUES(193,'VerbNet');
INSERT INTO dataset VALUES(194,'Ford Campus Vision and Lidar');
INSERT INTO dataset VALUES(195,'Arabic Online Commentary');

CREATE TABLE `journal` (
  `journalId` integer NOT NULL
,  `journalName` varchar(100) DEFAULT NULL
,  PRIMARY KEY (`journalId`)
);

INSERT INTO journal VALUES(0,'Pattern Recognition Letters');
INSERT INTO journal VALUES(1,'Clinical neurology and neurosurgery');
INSERT INTO journal VALUES(2,'The journals of gerontology. Series A, Biological sciences and medical sciences');
INSERT INTO journal VALUES(3,'Science');
INSERT INTO journal VALUES(4,'Int. J. Math. Mathematical Sciences');
INSERT INTO journal VALUES(5,'');
INSERT INTO journal VALUES(6,'Alcohol and alcoholism');
INSERT INTO journal VALUES(7,'Inf. Sci.');
INSERT INTO journal VALUES(8,'Molecular and cellular neurosciences');
INSERT INTO journal VALUES(9,'CoRR');
INSERT INTO journal VALUES(10,'Lancet');
INSERT INTO journal VALUES(11,'Injury prevention : journal of the International Society for Child and Adolescent Injury Prevention');
INSERT INTO journal VALUES(12,'The EMBO journal');
INSERT INTO journal VALUES(13,'Bioorganic & medicinal chemistry letters');
INSERT INTO journal VALUES(14,'The Journal of neuroscience : the official journal of the Society for Neuroscience');

CREATE TABLE `keyphrase` (
  `keyphraseId` integer NOT NULL
,  `keyphraseName` varchar(50) DEFAULT NULL
,  PRIMARY KEY (`keyphraseId`)
);
INSERT INTO keyphrase VALUES(389805,'Restoration Action');
INSERT INTO keyphrase VALUES(389806,'Evice');
INSERT INTO keyphrase VALUES(389807,'Snapshot Model');
INSERT INTO keyphrase VALUES(389808,'Local Entropy');
INSERT INTO keyphrase VALUES(389809,'Hot Traces');
INSERT INTO keyphrase VALUES(389810,'Ngerprinting');
INSERT INTO keyphrase VALUES(389811,'Semiotic Theory');
INSERT INTO keyphrase VALUES(389812,'Present Environment');
INSERT INTO keyphrase VALUES(389813,'EA Algorithm');
INSERT INTO keyphrase VALUES(389814,'Mental Content');
INSERT INTO keyphrase VALUES(389815,'RS-tree');
INSERT INTO keyphrase VALUES(389816,'Motor Power');
INSERT INTO keyphrase VALUES(389817,'Addressing Issues');
INSERT INTO keyphrase VALUES(389818,'Possible Trends');
INSERT INTO keyphrase VALUES(389819,'Hemoglobin-based Oxygen Carriers');
INSERT INTO keyphrase VALUES(389820,'Transfusion Therapy');
INSERT INTO keyphrase VALUES(389821,'RNA Thermometer');
INSERT INTO keyphrase VALUES(389822,'ACPE');
INSERT INTO keyphrase VALUES(389823,'Metabolite Content');

CREATE TABLE `paper` (
  `paperId` integer NOT NULL
,  `title` varchar(300) DEFAULT NULL
,  `venueId` integer DEFAULT NULL
,  `year` integer DEFAULT NULL
,  `numCiting` integer DEFAULT NULL
,  `numCitedBy` integer DEFAULT NULL
,  `journalId` integer DEFAULT NULL
,  PRIMARY KEY (`paperId`)
,  FOREIGN KEY(`journalId`) REFERENCES `journal`(`journalId`)
,  FOREIGN KEY(`venueId`) REFERENCES `venue`(`venueId`)
);
INSERT INTO paper VALUES(36,'Oxidative and nitrosative modifications of biliverdin reductase-A in the brain of subjects with Alzheimer''s disease and amnestic mild cognitive impairment.',404,2011,59,19,235);
INSERT INTO paper VALUES(37,'Statins more than cholesterol lowering agents in Alzheimer disease: their pleiotropic functions as potential therapeutic targets.',3969,2014,157,5,2070);
INSERT INTO paper VALUES(38,'Mitral and Tufted Cells Are Potential Cellular Targets of Nitration in the Olfactory Bulb of Aged Mice',42,2013,79,2,5);
INSERT INTO paper VALUES(39,'Redox regulation of heat shock protein expression by signaling involving nitric oxide and carbon monoxide: relevance to brain aging, neurodegenerative disorders, and longevity.',5139,2006,255,15,2591);
INSERT INTO paper VALUES(40,'Redox proteomics analysis of oxidatively modified proteins in G93A-SOD1 transgenic mice--a model of familial amyotrophic lateral sclerosis.',7128,2005,88,32,3494);
INSERT INTO paper VALUES(41,'Curcumin: a Culinary Herb and Its Health Benefits',2,2013,50,0,-1);
INSERT INTO paper VALUES(42,'Nitrosative stress, cellular stress response, and thiol homeostasis in patients with Alzheimer''s disease.',5139,2006,96,45,2591);
CREATE TABLE `paperDataset` (
  `paperId` integer DEFAULT NULL
,  `datasetId` integer DEFAULT NULL
,  PRIMARY KEY (`datasetId`, `paperId`)
);
INSERT INTO "paperDataset" VALUES(114,107);
INSERT INTO "paperDataset" VALUES(411,32);
INSERT INTO "paperDataset" VALUES(465,34);
INSERT INTO "paperDataset" VALUES(465,161);
INSERT INTO "paperDataset" VALUES(465,162);
INSERT INTO "paperDataset" VALUES(1039,0);
INSERT INTO "paperDataset" VALUES(1101,7);
INSERT INTO "paperDataset" VALUES(1134,1);
INSERT INTO "paperDataset" VALUES(1134,2);
INSERT INTO "paperDataset" VALUES(1134,3);
INSERT INTO "paperDataset" VALUES(1836,6);
INSERT INTO "paperDataset" VALUES(2210,74);
INSERT INTO "paperDataset" VALUES(2228,10);
INSERT INTO "paperDataset" VALUES(2228,23);
INSERT INTO "paperDataset" VALUES(2228,95);
INSERT INTO "paperDataset" VALUES(2281,74);
INSERT INTO "paperDataset" VALUES(2348,4);
INSERT INTO "paperDataset" VALUES(2371,4);
INSERT INTO "paperDataset" VALUES(2570,71);
INSERT INTO "paperDataset" VALUES(2934,25);


CREATE TABLE `venue` (
  `venueId` integer NOT NULL
,  `venueName` varchar(100) DEFAULT NULL
,  PRIMARY KEY (`venueId`)
);
INSERT INTO "venue" VALUES(16319,'P2PIR ''05');
INSERT INTO "venue" VALUES(20981,'P2PIR ''06');
INSERT INTO "venue" VALUES(24325,'Cahiers d''odonto-stomatologie');
INSERT INTO "venue" VALUES(12870,'Annals of physical and rehabilitation medicine');
INSERT INTO "venue" VALUES(570,'Bulletin de l''Acade?mie nationale de me?decine');
INSERT INTO "venue" VALUES(16209,'Advanced Course: Operating Systems');
INSERT INTO "venue" VALUES(28503,'Cost & quality quarterly journal : CQ');
INSERT INTO "venue" VALUES(17420,'Ciencia & saude coletiva');
INSERT INTO "venue" VALUES(13115,'SE-HPCS ''05');
INSERT INTO "venue" VALUES(13360,'Advances in nutrition');
INSERT INTO "venue" VALUES(22108,'Health economics, policy, and law');
INSERT INTO "venue" VALUES(25375,'Anaesthesia, critical care & pain medicine');
INSERT INTO "venue" VALUES(3126,'LASH');
INSERT INTO "venue" VALUES(4200,'Surgery research and practice');
INSERT INTO "venue" VALUES(23861,'Memo?rias do Instituto Butantan');
INSERT INTO "venue" VALUES(22909,'Recommendation and Search in Social Networks');
INSERT INTO "venue" VALUES(8355,'PATMOS');
INSERT INTO "venue" VALUES(4655,'Heart failure reviews');
INSERT INTO "venue" VALUES(11004,'Annals of ophthalmology');


CREATE TABLE `paperKeyphrase` (
  `paperId` integer DEFAULT NULL
,  `keyphraseId` integer DEFAULT NULL
,  PRIMARY KEY (`keyphraseId`,`paperId`)
,  FOREIGN KEY(`paperId`) REFERENCES `paper`(`paperId`)
);
INSERT INTO "paperKeyphrase" VALUES(1,3060);
INSERT INTO "paperKeyphrase" VALUES(1,5463);
INSERT INTO "paperKeyphrase" VALUES(1,6602);
INSERT INTO "paperKeyphrase" VALUES(1,134191);
INSERT INTO "paperKeyphrase" VALUES(1,589260);
INSERT INTO "paperKeyphrase" VALUES(3,0);
INSERT INTO "paperKeyphrase" VALUES(3,1);
INSERT INTO "paperKeyphrase" VALUES(3,2);
INSERT INTO "paperKeyphrase" VALUES(3,3);
INSERT INTO "paperKeyphrase" VALUES(3,4);
INSERT INTO "paperKeyphrase" VALUES(4,1346);
INSERT INTO "paperKeyphrase" VALUES(4,3169);
INSERT INTO "paperKeyphrase" VALUES(4,10723);
INSERT INTO "paperKeyphrase" VALUES(4,33619);
INSERT INTO "paperKeyphrase" VALUES(4,266240);
INSERT INTO "paperKeyphrase" VALUES(5,0);
INSERT INTO "paperKeyphrase" VALUES(5,3);
INSERT INTO "paperKeyphrase" VALUES(5,954);
INSERT INTO "paperKeyphrase" VALUES(5,27922);
INSERT INTO "paperKeyphrase" VALUES(5,93520);

CREATE TABLE `writes` (
  `paperId` integer DEFAULT NULL
,  `authorId` integer DEFAULT NULL
,  PRIMARY KEY (`paperId`,`authorId`)
,  FOREIGN KEY(`paperId`) REFERENCES `paper`(`paperId`)
,  FOREIGN KEY(`authorId`) REFERENCES `author`(`authorId`)
);
INSERT INTO "writes" VALUES(0,0);
INSERT INTO "writes" VALUES(0,1);
INSERT INTO "writes" VALUES(1,32432);
INSERT INTO "writes" VALUES(1,132831);
INSERT INTO "writes" VALUES(2,2);
INSERT INTO "writes" VALUES(2,3);
INSERT INTO "writes" VALUES(2,4);
INSERT INTO "writes" VALUES(3,5);
INSERT INTO "writes" VALUES(3,6);
INSERT INTO "writes" VALUES(4,591306);
INSERT INTO "writes" VALUES(5,6);
INSERT INTO "writes" VALUES(5,333614);
INSERT INTO "writes" VALUES(6,10602);
INSERT INTO "writes" VALUES(6,707919);
INSERT INTO "writes" VALUES(6,2053417);
INSERT INTO "writes" VALUES(7,762284);
INSERT INTO "writes" VALUES(7,1534273);
INSERT INTO "writes" VALUES(7,2014659);
INSERT INTO "writes" VALUES(7,7331954);
INSERT INTO "writes" VALUES(8,762284);
INSERT INTO "writes" VALUES(2,'');
CREATE INDEX "idx_keyphrase_keyphraseName" ON "keyphrase" (`keyphraseName`);
CREATE INDEX "idx_dataset_datasetName" ON "dataset" (`datasetName`);
CREATE INDEX "idx_journal_journalName" ON "journal" (`journalName`);
CREATE INDEX "idx_paper_journalId" ON "paper" (`journalId`);
CREATE INDEX "idx_author_authorName" ON "author" (`authorName`);
CREATE INDEX "idx_cite_citingPaperId" ON "cite" (`citingPaperId`);
CREATE INDEX "idx_cite_citedPaperId" ON "cite" (`citedPaperId`);
