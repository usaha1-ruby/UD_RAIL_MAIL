--**Config DDL Script with Alter statement for existing objects **--
/***********************************************************************************************************
   Change Request # CQ99999_ECS_Config_DDL_Script_v1_5_3.sql
                   
   Depends on CQ99999_ECS_Renter_Enrollment_DDL_Script_v1_5.sql
			  CQ99999_ECS_Renter_Enrollment_DDL_Script_v1_5_1.sql
			  CQ99999_ECS_Renter_Enrollment_DDL_Script_v1_5_2.sql
             
   Date Created:     01/16/2014 

   Created By:       Arup Roy Chowdhury, Udayan Saha
   Application:      Enterprise CarShare 
   Project:          AM Sync Service & GUI                                            

   Database/Server: ECS0INT.CORP.ERAC.COM 		SCHEMA: ECSDB

   Description:   Make necessary database changes to support Config Management

     User        Date          Modification
     -----     -----------    -----------------------------------------------------------------------------
     ECSDB     01/16/2014      Initial database changes to support Config Management

---- In case of any error DBA need to execute Drop script which is provided separately.

************************************************************************************************************/

-- Sequences

CREATE SEQUENCE ACC_LOT_BNDL_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 999999999999
	MINVALUE 1
	NOCYCLE
	CACHE 1000
	NOORDER;


CREATE SEQUENCE BASE_FEE_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 1000
	NOORDER;


CREATE SEQUENCE BASE_RATE_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 1000
	NOORDER;

	
CREATE SEQUENCE CS_ACCT_FEE_MOD_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 100
	NOORDER;
	
	
CREATE SEQUENCE CS_SUB_ACCT_FEE_MOD_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 100
	NOORDER;
	

CREATE SEQUENCE LOT_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 100
	NOORDER;


CREATE SEQUENCE LOT_RATE_BNDL_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 100
	NOORDER;
	
	
CREATE SEQUENCE MKT_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 100
	NOORDER;
	
	
CREATE SEQUENCE NTWK_FEE_MOD_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 100
	NOORDER;



CREATE SEQUENCE NTWK_LOT_ACC_ASSOC_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 100
	NOORDER;


CREATE SEQUENCE NTWK_LOT_ASSOC_DTL_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 100
	NOORDER;


CREATE SEQUENCE NTWK_RATE_MOD_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 100
	NOORDER;


CREATE SEQUENCE NTWK_SWTCH_ASSOC_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 100
	NOORDER;
	
	
CREATE SEQUENCE NTWK_VEH_CLS_ASSOC_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 100
	NOORDER;


CREATE SEQUENCE NTWK_VLD_ASSOC_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 1000
	NOORDER;


CREATE SEQUENCE SBCRBN_FEE_MOD_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 100
	NOORDER;
	
	
CREATE SEQUENCE SBCRBN_VEH_CLASS_ASSOC_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 100
	NOORDER;


CREATE SEQUENCE SPCE_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 99999999999
	MINVALUE 1
	NOCYCLE
	CACHE 100
	NOORDER;
	
	
CREATE SEQUENCE SWTCH_FEE_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 100
	NOORDER;
	
	
CREATE SEQUENCE VEH_CLS_ID_SEQ
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	CACHE 100
	NOORDER;
	

	
-- Tables

CREATE TABLE ACC_LOT_BNDL
(
	acc_lot_bndl_id      NUMBER(19) NOT NULL ,
	mkt_id               NUMBER(19) NOT NULL ,
	acc_lot_bndl_dsc     VARCHAR2(30) NULL ,
	acc_lot_bndl_nam     VARCHAR2(30) NULL ,
	strt_dte             DATE NOT NULL ,
	end_dte              DATE NULL ,
	acc_lot_bndl_typ     VARCHAR2(6) NULL ,
	acces_lot_bndl_stat  VARCHAR2(16) NULL ,
	is_opn_upn_ind       VARCHAR2(1) NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_ACC_LOT_BNDL CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_timestamp     TIMESTAMP(6) NULL ,
	update_module        VARCHAR2(256) NULL 
);



CREATE UNIQUE INDEX XPK_ACC_LOT_BNDL ON ACC_LOT_BNDL
(acc_lot_bndl_id   ASC)
				TABLESPACE SMINDX_ECSDB01;



ALTER TABLE ACC_LOT_BNDL
	ADD CONSTRAINT  XPK_ACC_LOT_BNDL PRIMARY KEY (acc_lot_bndl_id);



CREATE TABLE BASE_FEE
(
	base_fee_id          NUMBER(19) NOT NULL ,
	fee_nam              VARCHAR2(60) NOT NULL ,
	fee_dsc              VARCHAR2(255) NULL ,
	fee_typ              VARCHAR2(30) NULL ,
	fee_amt              NUMBER(15,2) NULL ,
	fee_frqy_typ         VARCHAR2(30) NULL ,
	fee_frqy_typ_val     NUMBER(15) NULL ,
	crncy_cde            VARCHAR2(6) NULL ,
	payr_base_typ        VARCHAR2(6) NOT NULL ,
	payr_base_id         NUMBER(19) NOT NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_BASE_FEE CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_timestamp     TIMESTAMP(6) NULL ,
	update_module        VARCHAR2(256) NULL 
)
	TABLESPACE SMDATA_ECSDB01
	LOGGING
	NOCOMPRESS ;



CREATE UNIQUE INDEX XPK_BASE_FEE ON BASE_FEE
(base_fee_id   ASC)
	TABLESPACE SMINDX_ECSDB01;



ALTER TABLE BASE_FEE
	ADD CONSTRAINT  XPK_BASE_FEE PRIMARY KEY (base_fee_id);



CREATE UNIQUE INDEX XAK01_BASE_FEE ON BASE_FEE
(fee_nam   ASC)
	TABLESPACE SMINDX_ECSDB01;



ALTER TABLE BASE_FEE
ADD CONSTRAINT  XAK01_BASE_FEE UNIQUE (fee_nam);



CREATE TABLE BASE_RATE
(
	base_rate_id         NUMBER(19) NOT NULL ,
	veh_cls_id           NUMBER(19) NOT NULL ,
	mkt_id               NUMBER(19) NOT NULL ,
	rate_typ             VARCHAR2(16) NULL ,
	end_tim              NUMBER(15) NULL ,
	strt_tim             NUMBER NULL ,
	week_end_ind         VARCHAR2(1) NULL ,
	hol_ind              VARCHAR2(16) NULL ,
	base_rate_amt        NUMBER(15,2) NULL ,
	rate_clg_amt         NUMBER(15,2) NULL ,
	rate_flr_amt         NUMBER(15,2) NULL ,
	crncy_cde            VARCHAR2(6) NULL ,
	base_rate_nam        VARCHAR2(50) NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_BASE_RATE CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_module        VARCHAR2(256) NULL ,
	update_timestamp     TIMESTAMP(6) NULL 
);



CREATE UNIQUE INDEX XPK_BASE_RATE ON BASE_RATE
(base_rate_id   ASC)
		TABLESPACE SMINDX_ECSDB01;



ALTER TABLE BASE_RATE
	ADD CONSTRAINT  XPK_BASE_RATE PRIMARY KEY (base_rate_id);
	
	

ALTER TABLE CS_ACCT drop column crncy_cde;
ALTER TABLE CS_ACCT drop column anul_fee_amt;
ALTER TABLE CS_ACCT drop column cmit_fee_amt;
ALTER TABLE CS_ACCT drop column cmit_fee_frqy;
ALTER TABLE CS_ACCT add strt_dte DATE NULL;
ALTER TABLE CS_ACCT add end_dte DATE NULL;
ALTER TABLE CS_ACCT add free_mile_allwed_val NUMBER(7,2) NULL;
ALTER TABLE CS_ACCT add enrl_drvg_cred NUMBER(15) NULL;



CREATE TABLE CS_ACCT_FEE_MOD
(
	cs_acct_fee_mod_id   NUMBER(19) NOT NULL ,
	cs_acct_id           NUMBER(19) NOT NULL ,
	base_fee_id          NUMBER(19) NOT NULL ,
	mod_typ              VARCHAR2(6) NULL ,
	mod_val              NUMBER(8,2) NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_CS_ACCT_FEE_MOD CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_timestamp     TIMESTAMP(6) NULL ,
	update_module        VARCHAR2(256) NULL 
)
	TABLESPACE SMDATA_ECSDB01
	LOGGING
	NOCOMPRESS ;



CREATE UNIQUE INDEX XPK_CS_ACCT_FEE_MOD ON CS_ACCT_FEE_MOD
(cs_acct_fee_mod_id   ASC) 
				TABLESPACE SMINDX_ECSDB01;



ALTER TABLE CS_ACCT_FEE_MOD
	ADD CONSTRAINT  XPK_CS_ACCT_FEE_MOD PRIMARY KEY (cs_acct_fee_mod_id);
	
	

ALTER TABLE CS_NTWK drop column crncy_cde;
ALTER TABLE CS_NTWK drop column ANUL_FEE;
ALTER TABLE CS_NTWK drop column APPL_FEE;
ALTER TABLE CS_NTWK drop column CONV_FEE_AMT;
ALTER TABLE CS_NTWK drop column SWTCH_FEE;
ALTER TABLE CS_NTWK add mkt_id NUMBER(19) NOT NULL;
ALTER TABLE CS_NTWK add ntwk_end_dte DATE NULL;
ALTER TABLE CS_NTWK add cntrct_ind VARCHAR2(1) NULL;
ALTER TABLE CS_NTWK add cntrct_doc_addr VARCHAR2(255) NULL;
ALTER TABLE CS_NTWK add referal_cde VARCHAR2(50) NULL;
ALTER TABLE CS_NTWK add cntrct_end_dte DATE NULL;
ALTER TABLE CS_NTWK add eml_addr_domn VARCHAR2(50) NULL;
ALTER TABLE CS_NTWK add bat_upld_ind VARCHAR2(1) DEFAULT  'N'  NULL  CONSTRAINT  CK02_CS_NTWK CHECK (bat_upld_ind IN ('Y', 'N'));
ALTER TABLE CS_NTWK add rate_typ VARCHAR2(6) NULL;
ALTER TABLE CS_NTWK add nbr_of_swtch_allwed NUMBER(6) NULL;
ALTER TABLE CS_NTWK add use_typ VARCHAR2(6) NULL;
ALTER TABLE CS_NTWK add cntrct_rvsn_dsc VARCHAR2(3000) NULL;

CREATE UNIQUE INDEX XAK01_CS_NTWK ON CS_NTWK
(ntwk_nam   ASC) 
		TABLESPACE SMINDX_ECSDB01;

ALTER TABLE CS_NTWK
ADD CONSTRAINT  XAK01_CS_NTWK UNIQUE (ntwk_nam);



ALTER TABLE CS_SBCRBN drop column commit_fee_amt;
ALTER TABLE CS_SBCRBN drop column commit_fee_freq;
ALTER TABLE CS_SBCRBN drop column anul_fee_amt;
ALTER TABLE CS_SBCRBN drop column crncy_cde;
ALTER TABLE CS_SBCRBN add subcription_typ VARCHAR2(30) NULL;
ALTER TABLE CS_SBCRBN add sbcrbn_tag VARCHAR2(255) NULL;
ALTER TABLE CS_SBCRBN add strt_dte DATE NULL;
ALTER TABLE CS_SBCRBN add end_dte DATE NULL;
ALTER TABLE CS_SBCRBN add end_notc_perd_typ VARCHAR2(6) NULL;
ALTER TABLE CS_SBCRBN add end_notc_perd_val NUMBER(15) NULL;



ALTER TABLE CS_SUB_ACCT drop column cmit_fee_amt;
ALTER TABLE CS_SUB_ACCT drop column cmit_fee_freq;
ALTER TABLE CS_SUB_ACCT drop column anul_fee_amt;
ALTER TABLE CS_SUB_ACCT drop column crncy_cde;
ALTER TABLE CS_SUB_ACCT add strt_dte DATE NULL;
ALTER TABLE CS_SUB_ACCT add end_dte DATE NULL;
ALTER TABLE CS_SUB_ACCT add free_mile_allwed_val NUMBER(7,2) NULL;
ALTER TABLE CS_SUB_ACCT add enrl_drvg_cred NUMBER(15) NULL;
ALTER TABLE CS_SUB_ACCT add allwed_bill_typ VARCHAR2(6) NULL;
ALTER TABLE CS_SUB_ACCT add cntct_nam VARCHAR2(255) NULL;



CREATE TABLE CS_SUB_ACCT_FEE_MOD
(
	cs_sub_acct_fee_mod_id NUMBER(19) NOT NULL ,
	base_fee_id          NUMBER(19) NOT NULL ,
	cs_sub_acct_id       NUMBER(19) NOT NULL ,
	mod_typ              VARCHAR2(6) NULL ,
	mod_val              NUMBER(8,2) NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_CS_SUB_ACCT_FE_1872784659 CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_timestamp     TIMESTAMP(6) NULL ,
	update_module        VARCHAR2(256) NULL 
)
	TABLESPACE SMDATA_ECSDB01
	LOGGING
	NOCOMPRESS ;


CREATE UNIQUE INDEX XPKSUB_ACCOUNT_FEE_MODIFIER ON CS_SUB_ACCT_FEE_MOD
(cs_sub_acct_fee_mod_id   ASC);

ALTER TABLE CS_SUB_ACCT_FEE_MOD
	ADD CONSTRAINT  XPKSUB_ACCOUNT_FEE_MODIFIER PRIMARY KEY (cs_sub_acct_fee_mod_id);



CREATE TABLE LOT
(
	lot_id               NUMBER(19) NOT NULL ,
	lot_rate_bndl_id     NUMBER(19) NULL ,
	iorg_id              NUMBER(11) NULL ,
	acc_lot_bndl_id      NUMBER(19) NULL ,
	update_timestamp     TIMESTAMP(6) NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_LOT CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_module        VARCHAR2(256) NULL ,
	serv_br_id           NUMBER(11) NULL ,
	lot_nam              VARCHAR2(100) NOT NULL ,
	lot_dsc              VARCHAR2(255) NULL ,
	cntct_prsn_nam       VARCHAR2(100) NULL ,
	lse_agree_strt_dte   DATE NULL ,
	lse_agree_end_dte    DATE NULL ,
	activtn_dte          DATE NULL ,
	decmsm_dte           DATE NULL ,
	taxi_nbr             VARCHAR2(25) NULL ,
	lot_cost_amt         NUMBER(15,2) NULL ,
	cust_facing_info     VARCHAR2(255) NULL ,
	towing_cmpy_info     VARCHAR2(255) NULL ,
	cmnt_txt             VARCHAR2(512) NULL 
);


CREATE UNIQUE INDEX XPKLOT ON LOT
(lot_id   ASC);

ALTER TABLE LOT
	ADD CONSTRAINT  XPKLOT PRIMARY KEY (lot_id);



CREATE TABLE LOT_RATE_BNDL
(
	lot_rate_bndl_id     NUMBER(19) NOT NULL ,
	rate_bndl_nam        VARCHAR2(30) NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_LOT_RATE_BNDL CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_timestamp     TIMESTAMP(6) NULL ,
	update_module        VARCHAR2(256) NULL 
);


CREATE UNIQUE INDEX XPKLOT_RATE_BUNDLE ON LOT_RATE_BNDL
(lot_rate_bndl_id   ASC);

ALTER TABLE LOT_RATE_BNDL
	ADD CONSTRAINT  XPKLOT_RATE_BUNDLE PRIMARY KEY (lot_rate_bndl_id);


	
CREATE TABLE MKT
(
	mkt_id               NUMBER(19) NOT NULL ,
	mkt_nam              VARCHAR2(50) NULL ,
	mkt_dsc              VARCHAR2(255) NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_MKT CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_timestamp     TIMESTAMP(6) NULL ,
	update_module        VARCHAR2(256) NULL 
);


CREATE UNIQUE INDEX XPK_MKT ON MKT
(mkt_id   ASC);

ALTER TABLE MKT
	ADD CONSTRAINT  XPK_MKT PRIMARY KEY (mkt_id);
	
	
	
CREATE TABLE NTWK_FEE_MOD
(
	ntwk_fee_mod_id      NUMBER(19) NOT NULL ,
	cs_ntwk_id           NUMBER(19) NOT NULL ,
	base_fee_id          NUMBER(19) NOT NULL ,
	mod_typ              VARCHAR2(6) NULL ,
	mod_val              NUMBER(8,2) NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_NTWK_FEE_MOD CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_timestamp     TIMESTAMP(6) NULL ,
	update_module        VARCHAR2(256) NULL 
)
	TABLESPACE SMDATA_ECSDB01
	LOGGING
	NOCOMPRESS ;


CREATE UNIQUE INDEX XPK_NTWK_FEE_MOD ON NTWK_FEE_MOD
(ntwk_fee_mod_id   ASC);

ALTER TABLE NTWK_FEE_MOD
	ADD CONSTRAINT  XPK_NTWK_FEE_MOD PRIMARY KEY (ntwk_fee_mod_id);



CREATE TABLE NTWK_LOT_ACC_ASSOC
(
	ntwk_lot_acc_assoc_id NUMBER(19) NOT NULL ,
	cs_ntwk_id           NUMBER(19) NOT NULL ,
	acc_lot_bndl_id      NUMBER(19) NOT NULL ,
	acc_typ              VARCHAR2(6) NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_NTWK_LOT_ACC_A_2017130837 CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_timestamp     TIMESTAMP(6) NULL ,
	update_module        VARCHAR2(256) NULL 
);


CREATE UNIQUE INDEX XPK_NTWK_LOT_ACC_ASSOC ON NTWK_LOT_ACC_ASSOC
(ntwk_lot_acc_assoc_id   ASC);

ALTER TABLE NTWK_LOT_ACC_ASSOC
	ADD CONSTRAINT  XPK_NTWK_LOT_ACC_ASSOC PRIMARY KEY (ntwk_lot_acc_assoc_id);


CREATE UNIQUE INDEX XAKO1_NTWK_LOT_ACC_ASSOC ON NTWK_LOT_ACC_ASSOC
(cs_ntwk_id   ASC,acc_lot_bndl_id   ASC);

ALTER TABLE NTWK_LOT_ACC_ASSOC
ADD CONSTRAINT  XAKO1_NTWK_LOT_ACC_ASSOC UNIQUE (cs_ntwk_id,acc_lot_bndl_id);



CREATE TABLE NTWK_LOT_ASSOC_DTL
(
	ntwk_lot_acc_dtl_id  NUMBER(19) NOT NULL ,
	ntwk_lot_acc_assoc_id NUMBER(19) NOT NULL ,
	strt_day             VARCHAR2(20) NULL ,
	end_day              VARCHAR2(20) NULL ,
	strt_tim             DATE NULL ,
	end_tim              DATE NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  NTWK_LOT_ASSOC_DTL CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_timestamp     TIMESTAMP(6) NULL ,
	update_module        VARCHAR2(256) NULL 
);


CREATE UNIQUE INDEX XPK_NTWK_LOT_ASSOC_DTL ON NTWK_LOT_ASSOC_DTL
(ntwk_lot_acc_dtl_id   ASC);

ALTER TABLE NTWK_LOT_ASSOC_DTL
	ADD CONSTRAINT  XPK_NTWK_LOT_ASSOC_DTL PRIMARY KEY (ntwk_lot_acc_dtl_id);



CREATE TABLE NTWK_RATE_MOD
(
	ntwk_rate_mod_id     NUMBER(19) NOT NULL ,
	base_rate_id         NUMBER(19) NOT NULL ,
	lot_rate_bndl_id     NUMBER(19) NULL ,
	cs_ntwk_id           NUMBER(19) NOT NULL ,
	mod_typ              VARCHAR2(6) NULL ,
	mod_val              NUMBER(8,2) NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_NTWK_RATE_MOD CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_timestamp     TIMESTAMP(6) NULL ,
	update_module        VARCHAR2(256) NULL 
)
	TABLESPACE SMDATA_ECSDB01
	LOGGING
	NOCOMPRESS ;


CREATE UNIQUE INDEX XPK_NTWK_RATE_MOD ON NTWK_RATE_MOD
(ntwk_rate_mod_id   ASC);

ALTER TABLE NTWK_RATE_MOD
	ADD CONSTRAINT  XPK_NTWK_RATE_MOD PRIMARY KEY (ntwk_rate_mod_id);



CREATE TABLE NTWK_SWTCH_ASSOC
(
	ntwk_swtch_id        NUMBER(19) NOT NULL ,
	cs_ntwk_id           NUMBER(19) NOT NULL ,
	swtch_fee_id         NUMBER(19) NOT NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_NTWK_SWTCH_ASSO_602971957 CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_timestamp     TIMESTAMP(6) NULL ,
	update_module        VARCHAR2(256) NULL 
);


CREATE UNIQUE INDEX XPK_NTWK_SWTCH_ASSOC ON NTWK_SWTCH_ASSOC
(ntwk_swtch_id   ASC);

ALTER TABLE NTWK_SWTCH_ASSOC
	ADD CONSTRAINT  XPK_NTWK_SWTCH_ASSOC PRIMARY KEY (ntwk_swtch_id);



CREATE TABLE NTWK_VEH_CLS_ASSOC
(
	ntwk_veh_cls_assoc_id NUMBER(19) NOT NULL ,
	cs_ntwk_id           NUMBER(19) NOT NULL ,
	veh_cls_id           NUMBER(19) NOT NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_NW_VEH_CLS_ASS_1900128038 CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_timestamp     TIMESTAMP(6) NULL ,
	update_module        VARCHAR2(256) NULL 
)
	TABLESPACE SMDATA_ECSDB01
	LOGGING;


CREATE UNIQUE INDEX XPK_NTWK_VEH_CLS_ASSOC ON NTWK_VEH_CLS_ASSOC
(ntwk_veh_cls_assoc_id   ASC)
	TABLESPACE SMINDX_ECSDB01;

ALTER TABLE NTWK_VEH_CLS_ASSOC
	ADD CONSTRAINT  XPK_NTWK_VEH_CLS_ASSOC PRIMARY KEY (ntwk_veh_cls_assoc_id);



CREATE TABLE SBCRBN_FEE_MOD
(
	sbcrbn_fee_mod_id    NUMBER(19) NOT NULL ,
	cs_sbcrbn_id         NUMBER(19) NOT NULL ,
	base_fee_id          NUMBER(19) NOT NULL ,
	mod_typ              VARCHAR2(6) NULL ,
	mod_val              NUMBER(8,2) NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_SBCRBN_FEE_MOD CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_timestamp     TIMESTAMP(6) NULL ,
	update_module        VARCHAR2(256) NULL 
)
	TABLESPACE SMDATA_ECSDB01
	LOGGING
	NOCOMPRESS ;


CREATE UNIQUE INDEX XPK_SBCRBN_FEE_MOD ON SBCRBN_FEE_MOD
(sbcrbn_fee_mod_id   ASC);

ALTER TABLE SBCRBN_FEE_MOD
	ADD CONSTRAINT  XPK_SBCRBN_FEE_MOD PRIMARY KEY (sbcrbn_fee_mod_id);
	
	

ALTER TABLE SBCRBN_TERM_AND_COND drop column cs_ntwk_id;



CREATE TABLE SBCRBN_VEH_CLS_ASSOC
(
    sbcrbn_veh_cls_assoc_id NUMBER(19) NOT NULL ,
    veh_cls_id           	NUMBER(19) NOT NULL ,
    cs_sbcrbn_id         	NUMBER(19) NOT NULL ,
    record_status        	VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_SBCRBN_VEH_CLAS_551553176 CHECK (record_status IN ('A', 'D')),
    created_by           	VARCHAR2(30) DEFAULT  USER  NOT NULL ,
    create_timestamp     	TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
    create_module        	VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	updated_by           	VARCHAR2(30) NULL ,
	update_timestamp     	TIMESTAMP(6) NULL ,
	update_module       	VARCHAR2(256) NULL 
);


CREATE UNIQUE INDEX XPK_SBCRBN_VEH_CLS ON SBCRBN_VEH_CLS_ASSOC
(sbcrbn_veh_cls_assoc_id   ASC);

ALTER TABLE SBCRBN_VEH_CLS_ASSOC
                ADD CONSTRAINT  XPK_SBCRBN_VEH_CLS PRIMARY KEY (sbcrbn_veh_cls_assoc_id);


CREATE UNIQUE INDEX XAK01_SBCRBN_VEH_CLS_ASSOC ON SBCRBN_VEH_CLS_ASSOC
(veh_cls_id   ASC,cs_sbcrbn_id   ASC);

ALTER TABLE SBCRBN_VEH_CLS_ASSOC
ADD CONSTRAINT  XAK01_SBCRBN_VEH_CLS_ASSOC UNIQUE (veh_cls_id,cs_sbcrbn_id);



CREATE TABLE SPCE
(
	spce_id              NUMBER(19) NOT NULL ,
	lot_id               NUMBER(19) NULL ,
	spce_dsc             VARCHAR2(255) NULL ,
	spce_typ             VARCHAR2(6) NULL ,
	spce_cost_amt        NUMBER(15,2) NULL ,
	crncy_cde            VARCHAR2(6) NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_SPCE CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_timestamp     TIMESTAMP(6) NULL ,
	update_module        VARCHAR2(256) NULL ,
	spce_amenity_nam     VARCHAR2(50) NULL 
);


CREATE UNIQUE INDEX XPK_SPCE ON SPCE
(spce_id   ASC);

ALTER TABLE SPCE
	ADD CONSTRAINT  XPK_SPCE PRIMARY KEY (spce_id);



CREATE TABLE SWTCH_FEE
(
	swtch_fee_id         NUMBER(19) NOT NULL ,
	swtch_frm            VARCHAR2(50) NOT NULL ,
	swtch_to             VARCHAR2(50) NOT NULL ,
	swtch_fee_amt        NUMBER(15,2) NOT NULL ,
	crncy_cde            VARCHAR2(6) NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_SWTCH_FEE CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_timestamp     TIMESTAMP(6) NULL ,
	update_module        VARCHAR2(256) NULL 
);


CREATE UNIQUE INDEX XPK_SWTCH_FEE ON SWTCH_FEE
(swtch_fee_id   ASC);

ALTER TABLE SWTCH_FEE
	ADD CONSTRAINT  XPK_SWTCH_FEE PRIMARY KEY (swtch_fee_id);
	
	
	
CREATE TABLE VEH_CLS
(
	veh_cls_id           NUMBER(19) NOT NULL ,
	veh_cls_nam          VARCHAR2(50) NULL ,
	record_status        VARCHAR2(1) DEFAULT  'A'  NOT NULL  CONSTRAINT  CK01_VEH_CLS CHECK (record_status IN ('A', 'D')),
	created_by           VARCHAR2(30) DEFAULT  USER  NOT NULL ,
	create_timestamp     TIMESTAMP(6) DEFAULT  SYSTIMESTAMP  NOT NULL ,
	create_module        VARCHAR2(265) DEFAULT  '1'  NOT NULL ,
	update_module        VARCHAR2(256) NULL ,
	updated_by           VARCHAR2(30) NULL ,
	update_timestamp     TIMESTAMP(6) NULL 
);


CREATE UNIQUE INDEX XPK_VEH_CLS ON VEH_CLS
(veh_cls_id   ASC);

ALTER TABLE VEH_CLS
	ADD CONSTRAINT  XPK_VEH_CLS PRIMARY KEY (veh_cls_id);
	
	
	
ALTER TABLE VLD_INFO add vld_typ_dsc VARCHAR2(100) NULL;
	
	

ALTER TABLE ACC_LOT_BNDL
	ADD (CONSTRAINT FK01_ACC_LOT_BNDL FOREIGN KEY (mkt_id) REFERENCES MKT (mkt_id));

ALTER TABLE BASE_RATE
	ADD (CONSTRAINT FK01_BASE_RATE FOREIGN KEY (mkt_id) REFERENCES MKT (mkt_id));

ALTER TABLE BASE_RATE
	ADD (CONSTRAINT FK02_BASE_RATE FOREIGN KEY (veh_cls_id) REFERENCES VEH_CLS (veh_cls_id));
	
ALTER TABLE CS_ACCT_FEE_MOD
	ADD (CONSTRAINT FK01_CS_ACCT_FEE_MOD FOREIGN KEY (base_fee_id) REFERENCES BASE_FEE (base_fee_id));

ALTER TABLE CS_ACCT_FEE_MOD
	ADD (CONSTRAINT FK02_CS_ACCT_FEE_MOD FOREIGN KEY (cs_acct_id) REFERENCES CS_ACCT (cs_acct_id));
	
ALTER TABLE CS_NTWK
	ADD (CONSTRAINT FK01_CS_NTWK FOREIGN KEY (mkt_id) REFERENCES MKT (mkt_id));
	
ALTER TABLE CS_SUB_ACCT_FEE_MOD
	ADD (CONSTRAINT FK01_CS_SUB_ACCT_FEE_MOD FOREIGN KEY (cs_sub_acct_id) REFERENCES CS_SUB_ACCT (cs_sub_acct_id));

ALTER TABLE CS_SUB_ACCT_FEE_MOD
	ADD (CONSTRAINT FK02_CS_SUB_ACCT_FEE_MOD FOREIGN KEY (base_fee_id) REFERENCES BASE_FEE (base_fee_id));

ALTER TABLE LOT
	ADD (CONSTRAINT FK02_LOT FOREIGN KEY (acc_lot_bndl_id) REFERENCES ACC_LOT_BNDL (acc_lot_bndl_id));

ALTER TABLE LOT
	ADD (CONSTRAINT FK04_LOT FOREIGN KEY (lot_rate_bndl_id) REFERENCES LOT_RATE_BNDL (lot_rate_bndl_id));

ALTER TABLE LOT
	ADD (CONSTRAINT FK01_LOT FOREIGN KEY (iorg_id) REFERENCES LRD_IORG (iorg_id));

ALTER TABLE LOT
	ADD (CONSTRAINT FK03_LOT FOREIGN KEY (serv_br_id) REFERENCES LRD_IORG (iorg_id));

ALTER TABLE NTWK_FEE_MOD
	ADD (CONSTRAINT FK01_NTWK_FEE_MOD FOREIGN KEY (cs_ntwk_id) REFERENCES CS_NTWK (cs_ntwk_id));

ALTER TABLE NTWK_FEE_MOD
	ADD (CONSTRAINT FK02_NTWK_FEE_MOD FOREIGN KEY (base_fee_id) REFERENCES BASE_FEE (base_fee_id));

ALTER TABLE NTWK_LOT_ACC_ASSOC
	ADD (CONSTRAINT FK02_NTWK_LOT_ACC_ASSOC FOREIGN KEY (acc_lot_bndl_id) REFERENCES ACC_LOT_BNDL (acc_lot_bndl_id));

ALTER TABLE NTWK_LOT_ACC_ASSOC
	ADD (CONSTRAINT FK01_NTWK_LOT_ACC_ASSOC FOREIGN KEY (cs_ntwk_id) REFERENCES CS_NTWK (cs_ntwk_id));

ALTER TABLE NTWK_LOT_ASSOC_DTL
	ADD (CONSTRAINT FK02_NTWK_LOT_ASSOC_DTL FOREIGN KEY (ntwk_lot_acc_assoc_id) REFERENCES NTWK_LOT_ACC_ASSOC (ntwk_lot_acc_assoc_id));

ALTER TABLE NTWK_RATE_MOD
	ADD (CONSTRAINT FK02_NTWK_RATE_MOD FOREIGN KEY (base_rate_id) REFERENCES BASE_RATE (base_rate_id));

ALTER TABLE NTWK_RATE_MOD
	ADD (CONSTRAINT FK03_NTWK_RATE_MOD FOREIGN KEY (cs_ntwk_id) REFERENCES CS_NTWK (cs_ntwk_id));

ALTER TABLE NTWK_RATE_MOD
	ADD (CONSTRAINT FK01_NTWK_RATE_MOD FOREIGN KEY (lot_rate_bndl_id) REFERENCES LOT_RATE_BNDL (lot_rate_bndl_id));

ALTER TABLE NTWK_SWTCH_ASSOC
	ADD (CONSTRAINT FK02_NTWK_SWTCH_ASSOC FOREIGN KEY (swtch_fee_id) REFERENCES SWTCH_FEE (swtch_fee_id));

ALTER TABLE NTWK_SWTCH_ASSOC
	ADD (CONSTRAINT FK01_NTWK_SWTCH_ASSOC FOREIGN KEY (cs_ntwk_id) REFERENCES CS_NTWK (cs_ntwk_id));
	
ALTER TABLE NTWK_VEH_CLS_ASSOC
	ADD (CONSTRAINT FK01_NW_VEH_CLASS_ASSOC FOREIGN KEY (cs_ntwk_id) REFERENCES CS_NTWK (cs_ntwk_id));

ALTER TABLE NTWK_VEH_CLS_ASSOC
	ADD (CONSTRAINT FK02_NW_VEH_CLASS_ASSOC FOREIGN KEY (veh_cls_id) REFERENCES VEH_CLS (veh_cls_id));

ALTER TABLE SBCRBN_FEE_MOD
	ADD (CONSTRAINT FK02_SBCRBN_FEE_MOD FOREIGN KEY (cs_sbcrbn_id) REFERENCES CS_SBCRBN (cs_sbcrbn_id));

ALTER TABLE SBCRBN_FEE_MOD
	ADD (CONSTRAINT FK01_SBCRBN_FEE_MOD FOREIGN KEY (base_fee_id) REFERENCES BASE_FEE (base_fee_id));
	
ALTER TABLE SBCRBN_VEH_CLS_ASSOC
    ADD (CONSTRAINT FK01_SBCRBN_VEH_CLASS_ASSOC FOREIGN KEY (cs_sbcrbn_id) REFERENCES CS_SBCRBN (cs_sbcrbn_id));
	
ALTER TABLE SBCRBN_VEH_CLS_ASSOC
    ADD (CONSTRAINT FK02_SBCRBN_VEH_CLASS_ASSOC FOREIGN KEY (veh_cls_id) REFERENCES VEH_CLS (veh_cls_id));

ALTER TABLE SPCE
	ADD (CONSTRAINT FK01_SPCE FOREIGN KEY (lot_id) REFERENCES LOT (lot_id));