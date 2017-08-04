

DROP TABLE IF EXISTS F_ADDRESS_BOOK;

DROP TABLE IF EXISTS F_DATACATALOG;

DROP TABLE IF EXISTS F_DATADICTIONARY;

DROP TABLE IF EXISTS F_OPTDATASCOPE;

-- DROP INDEX IND_OPTID_OPTMETHOD ON F_OPTDEF;

DROP TABLE IF EXISTS F_OPTDEF;

-- DROP INDEX IND_TAG_ID ON F_OPT_LOG;

DROP TABLE IF EXISTS F_OPT_LOG;

DROP TABLE IF EXISTS F_OPTFLOWNOINFO;

DROP TABLE IF EXISTS F_OPTFLOWNOPOOL;

DROP TABLE IF EXISTS F_OPTINFO;

DROP TABLE IF EXISTS F_OPTINFODATA;

-- DROP INDEX IND_FILTER_TABLE_CLASS_NAME ON F_QUERY_FILTER_CONDITION;

DROP TABLE IF EXISTS F_QUERY_FILTER_CONDITION;

DROP TABLE IF EXISTS F_RANKGRANT;

DROP TABLE IF EXISTS F_ROLEINFO;

DROP TABLE IF EXISTS F_ROLEPOWER;

DROP TABLE IF EXISTS F_STAT_MONTH;

DROP TABLE IF EXISTS F_SYS_NOTIFY;

DROP TABLE IF EXISTS F_UNITINFO;

-- DROP INDEX IND_REGEMAIL ON F_USERINFO;

-- DROP INDEX IND_LOGINNAME ON F_USERINFO;

DROP TABLE IF EXISTS F_USERINFO;

DROP TABLE IF EXISTS F_USERROLE;

DROP TABLE IF EXISTS F_USERSETTING;

DROP TABLE IF EXISTS F_USERUNIT;

DROP TABLE IF EXISTS F_USER_FAVORITE;

-- DROP INDEX  IND_QUERY_FILTER_MODLE_CODE ON F_USER_QUERY_FILTER;

DROP TABLE IF EXISTS F_USER_QUERY_FILTER;

DROP TABLE IF EXISTS F_WORK_CLASS;

DROP TABLE IF EXISTS F_WORK_DAY;

DROP TABLE IF EXISTS M_INNERMSG;

DROP TABLE IF EXISTS M_INNERMSG_RECIPIENT;

DROP TABLE IF EXISTS M_MSGANNEX;

DROP TABLE IF EXISTS P_TASK_LIST;

/*==============================================================*/
/* TABLE: F_ADDRESS_BOOK                                        */
/*==============================================================*/
CREATE TABLE F_ADDRESS_BOOK
(
   ADDRBOOKID           NUMERIC(10,0) NOT NULL,
   BODYTYPE             VARCHAR(2) NOT NULL COMMENT '�û�/����/��λ',
   BODYCODE             VARCHAR(16) NOT NULL COMMENT '�û�/����/��λ ���',
   REPRESENTATION       VARCHAR(200),
   UNITNAME             VARCHAR(200),
   DEPTNAME             VARCHAR(100),
   RANKNAME             VARCHAR(50),
   EMAIL                VARCHAR(60),
   EMAIL2               VARCHAR(60),
   EMAIL3               VARCHAR(60),
   HOMEPAGE             VARCHAR(100),
   QQ                   VARCHAR(20),
   MSN                  VARCHAR(60),
   WANGWANG             VARCHAR(20),
   BUZPHONE             VARCHAR(20),
   BUZPHONE2            VARCHAR(20),
   BUZFAX               VARCHAR(20),
   ASSIPHONE            VARCHAR(20),
   CALLBACPHONE         VARCHAR(20),
   CARPHONE             VARCHAR(20),
   UNITPHONE            VARCHAR(20),
   HOMEPHONE            VARCHAR(20),
   HOMEPHONE2           VARCHAR(20),
   HOMEPHONE3           VARCHAR(20),
   HOMEFAX              VARCHAR(20),
   MOBILEPHONE          VARCHAR(20),
   MOBILEPHONE2         VARCHAR(20),
   MOBILEPHONE3         VARCHAR(20),
   UNITZIP              VARCHAR(8),
   UNITPROVINCE         VARCHAR(20),
   UNITCITY             VARCHAR(20),
   UNITDISTRICT         VARCHAR(20),
   UNITSTREET           VARCHAR(20),
   UNITADDRESS          VARCHAR(60),
   HOMEZIP              VARCHAR(8),
   HOMEPROVINCE         VARCHAR(20),
   HOMECITY             VARCHAR(20),
   HOMEDISTRICT         VARCHAR(20),
   HOMESTREET           VARCHAR(20),
   HOMEADDRESS          VARCHAR(60),
   HOME2ZIP             VARCHAR(8),
   HOME2PROVINCE        VARCHAR(20),
   HOME2CITY            VARCHAR(20),
   HOME2DISTRICT        VARCHAR(20),
   HOME2STREET          VARCHAR(20),
   HOME2ADDRESS         VARCHAR(60),
   INUSEADDRESS         VARCHAR(1) COMMENT '��λ/סլ/סլ2',
   SEARCHSTRING         VARCHAR(1000) COMMENT 'ǰ������ֶε���������ĸ������ ���ӵĴ�',
   MEMO                 VARCHAR(500),
   LASTMODIFYDATE       DATE,
   CREATEDATE           DATE,
   PRIMARY KEY (ADDRBOOKID)
);

ALTER TABLE F_ADDRESS_BOOK COMMENT 'ϵͳ��ά��һ��ͳһ��ͨѶ¼ ģ�飬��ҪĿ����Ϊ���Ժ��� ͳһ�Ľӿڣ�
���磺';

/*==============================================================*/
/* TABLE: F_DATACATALOG                                         */
/*==============================================================*/
CREATE TABLE F_DATACATALOG
(
   CATALOGCODE          VARCHAR(16) NOT NULL,
   CATALOGNAME          VARCHAR(64) NOT NULL,
   CATALOGSTYLE         CHAR(1) NOT NULL COMMENT 'F : ��ܹ��е� U:�û� S��ϵͳ  G����',
   CATALOGTYPE          CHAR(1) NOT NULL COMMENT 'T����״��� L:�б� ',
   CATALOGDESC          VARCHAR(256),
   FIELDDESC            VARCHAR(1024) COMMENT '�ֶ���������ͬ�ֶ��÷ֺŸ���',
   UPDATEDATE           DATE,
   CREATEDATE           DATE,
   OPTID                VARCHAR(16) COMMENT 'ҵ����࣬ʹ�������ֵ�DICTIONARYTYPE������',
   NEEDCACHE            CHAR(1) DEFAULT '1',
   CREATOR              VARCHAR(32),
   UPDATOR              VARCHAR(32),
   PRIMARY KEY (CATALOGCODE)
);


ALTER TABLE F_DATACATALOG COMMENT '���״̬	 U:�û� S��ϵͳ��G����
�����ʽ  T����״��� L:�б�
';


/*==============================================================*/
/* TABLE: F_DATADICTIONARY                                      */
/*==============================================================*/
CREATE TABLE F_DATADICTIONARY
(
   CATALOGCODE          VARCHAR(16) NOT NULL,
   DATACODE             VARCHAR(16) NOT NULL,
   EXTRACODE            VARCHAR(16) COMMENT '�����ֵ�ĸ������',
   EXTRACODE2           VARCHAR(16) COMMENT 'Ĭ�ϵ������ֶ�',
   DATATAG              CHAR(1) COMMENT 'N������D��ͣ�ã��û������Խ�������ֶ�',
   DATAVALUE            VARCHAR(2048),
   DATASTYLE            CHAR(1) COMMENT 'F : ��ܹ��е� U:�û� S��ϵͳ  G����',
   DATADESC             VARCHAR(256),
   LASTMODIFYDATE       DATE,
   CREATEDATE           DATE,
   DATAORDER            NUMERIC(6,0) COMMENT '�����ֶ�',
   PRIMARY KEY (CATALOGCODE, DATACODE)
);

ALTER TABLE F_DATADICTIONARY COMMENT '�����ֵ䣺���һЩ�������� ���������ʾ��Ϣ������һЩ ���������ƵĶ�Ӧ������ ״̬����ɫ����ͷ�� �ȵ�
';

/*==============================================================*/
/* TABLE: F_OPTDATASCOPE                                        */
/*==============================================================*/
CREATE TABLE F_OPTDATASCOPE
(
   OPTSCOPECODE         VARCHAR(16) NOT NULL,
   OPTID                VARCHAR(16),
   SCOPENAME            VARCHAR(64),
   FILTERCONDITION      VARCHAR(1024) COMMENT '������䣬�����еĲ��� [MT] ҵ��� [UC] �û����� [UU] �û���������',
   SCOPEMEMO            VARCHAR(1024) COMMENT '����Ȩ��˵��',
   FILTERGROUP          VARCHAR(16) DEFAULT 'G',
   PRIMARY KEY (OPTSCOPECODE)
);

/*==============================================================*/
/* TABLE: F_OPTDEF                                              */
/*==============================================================*/
CREATE TABLE F_OPTDEF
(
   OPTCODE              VARCHAR(32) NOT NULL,
   OPTID                VARCHAR(32),
   OPTNAME              VARCHAR(100),
   OPTMETHOD            VARCHAR(50) COMMENT '�������� ����',
   OPTURL               VARCHAR(256),
   OPTDESC              VARCHAR(256),
   ISINWORKFLOW         CHAR(1) COMMENT '�Ƿ�Ϊ���̲������� F������  T �� ��',
   UPDATEDATE           DATE,
   CREATEDATE           DATE,
   OPTREQ               VARCHAR(8),
   OPTORDER 			NUMERIC(4),
   CREATOR              VARCHAR(32),
   UPDATOR              VARCHAR(32),
   PRIMARY KEY (OPTCODE)
);

/*==============================================================*/
/* INDEX: IND_OPTID_OPTMETHOD                                   */
/*==============================================================*/
CREATE INDEX IND_OPTID_OPTMETHOD ON F_OPTDEF
(
   OPTID,
   OPTMETHOD
);

/*==============================================================*/
/* TABLE: F_OPT_LOG                                             */
/*==============================================================*/
CREATE TABLE F_OPT_LOG
(
   LOGID                NUMERIC(12,0) NOT NULL,
   LOGLEVEL             VARCHAR(2) NOT NULL,
   USERCODE             VARCHAR(8) NOT NULL,
   OPTTIME              DATE NOT NULL,
   OPTCONTENT           VARCHAR(1000) NOT NULL COMMENT '��������',
   NEWVALUE             TEXT COMMENT '��ֵ',
   OLDVALUE             TEXT COMMENT 'ԭֵ',
   OPTID                VARCHAR(64) NOT NULL COMMENT 'ģ�飬���߱�',
   OPTMETHOD            VARCHAR(64) COMMENT '�����������ֶ�',
   OPTTAG               VARCHAR(200) COMMENT 'һ�����ڹ�����ҵ������ı�ʶ����������ȵ�',
   PRIMARY KEY (LOGID)
);

/*==============================================================*/
/* INDEX: IND_TAG_ID                                            */
/*==============================================================*/
CREATE INDEX IND_TAG_ID ON F_OPT_LOG
(
   OPTTAG
);

/*==============================================================*/
/* TABLE: F_OPTFLOWNOINFO                                       */
/*==============================================================*/
CREATE TABLE F_OPTFLOWNOINFO
(
   OWNERCODE            VARCHAR(8) NOT NULL,
   CODECODE             VARCHAR(16) NOT NULL,
   CODEDATE             DATE NOT NULL,
   CURNO                NUMERIC(6,0) NOT NULL DEFAULT 1,
   LASTCODEDATE         DATE,
   CREATEDATE           DATE,
   LASTMODIFYDATE       DATE,
   PRIMARY KEY (OWNERCODE, CODEDATE, CODECODE)
);

/*==============================================================*/
/* TABLE: F_OPTFLOWNOPOOL                                       */
/*==============================================================*/
CREATE TABLE F_OPTFLOWNOPOOL
(
   OWNERCODE            VARCHAR(8) NOT NULL,
   CODECODE             VARCHAR(16) NOT NULL,
   CODEDATE             DATE NOT NULL,
   CURNO                NUMERIC(6,0) NOT NULL DEFAULT 1,
   CREATEDATE           DATE,
   PRIMARY KEY (OWNERCODE, CODEDATE, CODECODE, CURNO)
);

/*==============================================================*/
/* TABLE: F_OPTINFO                                             */
/*==============================================================*/
CREATE TABLE F_OPTINFO
(
   OPTID                VARCHAR(32) NOT NULL,
   OPTNAME              VARCHAR(100) NOT NULL,
   PREOPTID             VARCHAR(32) NOT NULL,
   OPTROUTE             VARCHAR(256) COMMENT '��ANGULARJS·��ƥ��',
   OPTURL               VARCHAR(256),
   FORMCODE             VARCHAR(4),
   OPTTYPE              CHAR(1) COMMENT ' S:ʵʩҵ��, O:��ͨҵ��, W:����ҵ��, I :��Ŀҵ��',
   MSGNO                NUMERIC(10,0),
   MSGPRM               VARCHAR(256),
   ISINTOOLBAR          CHAR(1),
   IMGINDEX             NUMERIC(10,0),
   TOPOPTID             VARCHAR(8),
   ORDERIND             NUMERIC(4,0) COMMENT '���˳��ֻ����ͬһ����ҵ��������',
   FLOWCODE             VARCHAR(8) COMMENT 'ͬһ�����������Ӧ��ֻ��һ����Ч�İ汾',
   PAGETYPE             CHAR(1) NOT NULL DEFAULT 'I' COMMENT 'D : DIV I:IFRAME',
   ICON                 VARCHAR(512),
   HEIGHT               NUMERIC(10,0),
   WIDTH                NUMERIC(10,0),
   UPDATEDATE           DATE,
   CREATEDATE           DATE,
   CREATOR              VARCHAR(32),
   UPDATOR              VARCHAR(32),
   PRIMARY KEY (OPTID)
);

/*==============================================================*/
/* TABLE: F_OPTINFODATA                                         */
/*==============================================================*/
CREATE TABLE F_OPTINFODATA
(
   TBCODE               VARCHAR(32) NOT NULL,
   OPTID                VARCHAR(8) NOT NULL,
   LASTMODIFYDATE       DATE,
   CREATEDATE           DATE,
   PRIMARY KEY (TBCODE, OPTID)
);

ALTER TABLE F_OPTINFODATA COMMENT 'ҵ��ģ��ͱ��Ƕ�Զ�Ĺ�ϵ,������������Ϊ����Ȩ������ʱ��һ���������';

/*==============================================================*/
/* TABLE: F_QUERY_FILTER_CONDITION                              */
/*==============================================================*/
CREATE TABLE F_QUERY_FILTER_CONDITION
(
   CONDITION_NO         NUMERIC(12,0) NOT NULL,
   TABLE_CLASS_NAME     VARCHAR(64) NOT NULL COMMENT '���ݿ��������PO������',
   PARAM_NAME           VARCHAR(64) NOT NULL COMMENT '������',
   PARAM_LABEL          VARCHAR(120) NOT NULL COMMENT '�����������ʾ',
   PARAM_TYPE           VARCHAR(8) COMMENT '�������ͣ�S �ַ�����L ���֣� N ��С�������ݣ� D ���ڣ� T ʱ����� Y �꣬ M ��',
   DEFAULT_VALUE        VARCHAR(100),
   FILTER_SQL           VARCHAR(200) COMMENT '������䣬����ƴװ��SQL�����',
   SELECT_DATA_TYPE     CHAR(1) NOT NULL DEFAULT 'N' COMMENT '�������������ݣ� N ��û�У� D �����ֵ�, S ͨ��SQL����ã� J JSON����ֱ�ӻ�ȡ
            ',
   SELECT_DATA_CATALOG  VARCHAR(64) COMMENT '�����ֵ�',
   SELECT_SQL           VARCHAR(1000) COMMENT '�����������ֶε�SQL���',
   SELECT_JSON          VARCHAR(2000) COMMENT 'KEY,VALUE��ֵ�ԣ�JSON��ʽ',
   PRIMARY KEY (CONDITION_NO)
);

/*==============================================================*/
/* INDEX: IND_FILTER_TABLE_CLASS_NAME                           */
/*==============================================================*/
CREATE INDEX IND_FILTER_TABLE_CLASS_NAME ON F_QUERY_FILTER_CONDITION
(
   TABLE_CLASS_NAME
);

/*==============================================================*/
/* TABLE: F_RANKGRANT                                           */
/*==============================================================*/
CREATE TABLE F_RANKGRANT
(
   RANK_GRANT_ID        NUMERIC(12,0) NOT NULL,
   GRANTER              VARCHAR(8) NOT NULL,
   UNITCODE             VARCHAR(6) NOT NULL,
   USERSTATION          VARCHAR(4) NOT NULL,
   USERRANK             VARCHAR(2) NOT NULL COMMENT 'RANK ���벻�� 0��ͷ�Ŀ��Խ�������',
   BEGINDATE            DATE NOT NULL,
   GRANTEE              VARCHAR(8) NOT NULL,
   ENDDATE              DATE,
   GRANTDESC            VARCHAR(256),
   LASTMODIFYDATE       DATE,
   CREATEDATE           DATE,
   PRIMARY KEY (RANK_GRANT_ID, USERRANK)
);

/*==============================================================*/
/* TABLE: F_ROLEINFO                                            */
/*==============================================================*/
CREATE TABLE F_ROLEINFO
(
   ROLECODE             VARCHAR(32) NOT NULL,
   ROLENAME             VARCHAR(64),
   ROLETYPE             CHAR(1) NOT NULL COMMENT 'SΪϵͳ���ܽ�ɫ I Ϊ��Ŀ��ɫ W��������ɫ',
   UNITCODE             VARCHAR(32),
   ISVALID              CHAR(1) NOT NULL,
   ROLEDESC             VARCHAR(256),
   UPDATEDATE           DATE,
   CREATEDATE           DATE,
   CREATOR              VARCHAR(32),
   UPDATOR              VARCHAR(32),
   PRIMARY KEY (ROLECODE)
);

/*==============================================================*/
/* TABLE: F_ROLEPOWER                                           */
/*==============================================================*/
CREATE TABLE F_ROLEPOWER
(
   ROLECODE             VARCHAR(32) NOT NULL,
   OPTCODE              VARCHAR(32) NOT NULL,
   OPTSCOPECODES        VARCHAR(1000) COMMENT '�ö��Ÿ��������ݷ�Χ��ϣ���\ALL ��ʾȫ����',
   UPDATEDATE           DATE,
   CREATEDATE           DATE,
   CREATOR              VARCHAR(32),
   UPDATOR              VARCHAR(32),
   PRIMARY KEY (ROLECODE, OPTCODE)
);

/*==============================================================*/
/* TABLE: F_STAT_MONTH                                          */
/*==============================================================*/
CREATE TABLE F_STAT_MONTH
(
   YEARMONTH            VARCHAR(6) NOT NULL COMMENT 'YYYYMM',
   BEGINDAY             DATE NOT NULL,
   EENDDAY              DATE NOT NULL,
   ENDSCHEDULE          CHAR(1) COMMENT '����ֶκ���',
   BEGINSCHEDULE        CHAR(1) COMMENT '����ֶκ���',
   PRIMARY KEY (YEARMONTH)
);

ALTER TABLE F_STAT_MONTH COMMENT 'OAҵ��ͳ���£������Զ���ͳ���µ���ֹ����';

/*==============================================================*/
/* TABLE: F_SYS_NOTIFY                                          */
/*==============================================================*/
CREATE TABLE F_SYS_NOTIFY
(
   NOTIFY_ID            NUMERIC(12,0) NOT NULL,
   NOTIFY_SENDER        VARCHAR(100),
   NOTIFY_RECEIVER      VARCHAR(100) NOT NULL,
   MSG_SUBJECT          VARCHAR(200),
   MSG_CONTENT          VARCHAR(2000) NOT NULL,
   NOTICE_TYPE          VARCHAR(100),
   NOTIFY_STATE         CHAR(1) COMMENT '0 �ɹ��� 1 ʧ�� 2 ���ֳɹ�',
   ERROR_MSG            VARCHAR(500),
   NOTIFY_TIME          DATE,
   OPTTAG               VARCHAR(200) COMMENT 'һ�����ڹ�����ҵ������',
   OPTMETHOD            VARCHAR(64) COMMENT '�����������ֶ�',
   OPTID                VARCHAR(64) NOT NULL COMMENT 'ģ�飬���߱�',
   PRIMARY KEY (NOTIFY_ID)
);

/*==============================================================*/
/* TABLE: F_UNITINFO                                            */
/*==============================================================*/
CREATE TABLE F_UNITINFO
(
   UNITCODE             VARCHAR(32) NOT NULL,
   PARENTUNIT           VARCHAR(32),
   UNITTYPE             CHAR(1) COMMENT '��������/ �ʵ�滮/���/��������',
   ISVALID              CHAR(1) NOT NULL COMMENT 'T:��Ч F:��Ч',
   UNITTAG              VARCHAR(100) COMMENT '�û�������ϵͳ����',
   UNITNAME             VARCHAR(300) NOT NULL,
   ENGLISHNAME          VARCHAR(300),
   DEPNO                VARCHAR(100) COMMENT '��֯�������룺',
   UNITDESC             VARCHAR(256),
   ADDRBOOKID           NUMERIC(10,0),
   UNITSHORTNAME        VARCHAR(32),
   UNITWORD             VARCHAR(100),
   UNITGRADE            NUMERIC(4,0),
   UNITORDER            NUMERIC(4,0),
   UPDATEDATE           DATE,
   CREATEDATE           DATE,
   EXTJSONINFO          VARCHAR(1000),
   CREATOR              VARCHAR(32),
   UPDATOR              VARCHAR(32),
   UNITPATH 			VARCHAR(1000),
   UNITMANAGER VARCHAR(32),
   PRIMARY KEY (UNITCODE)
);

/*==============================================================*/
/* TABLE: F_USERINFO                                            */
/*==============================================================*/
CREATE TABLE F_USERINFO
(
   USERCODE             VARCHAR(32) NOT NULL,
   USERPIN              VARCHAR(32),
   USERTYPE             CHAR(1) DEFAULT 'U' COMMENT '��������/��������/ϵͳ����',
   ISVALID              CHAR(1) NOT NULL COMMENT 'T:��Ч F:��Ч',
   LOGINNAME            VARCHAR(100) NOT NULL,
   USERNAME             VARCHAR(300) NOT NULL COMMENT '�ǳ�',
   USERTAG              VARCHAR(100) COMMENT '���ڵ�����ϵͳ����',
   ENGLISHNAME          VARCHAR(300),
   USERDESC             VARCHAR(256),
   LOGINTIMES           NUMERIC(6,0),
   ACTIVETIME           DATE,
   LOGINIP              VARCHAR(16),
   ADDRBOOKID           NUMERIC(10,0),
   REGEMAIL             VARCHAR(60) COMMENT 'ע����EMAIL�������ظ�',
   USERPWD              VARCHAR(20) COMMENT '�����Ҫ������',
   PWDEXPIREDTIME       DATE,
   REGCELLPHONE         VARCHAR(15),
   PRIMARYUNIT          VARCHAR(32),
   USERWORD             VARCHAR(100) COMMENT '΢�ź�',
   USERORDER            NUMERIC(4,0),
   UPDATEDATE           DATE,
   CREATEDATE           DATE,
   EXTJSONINFO          VARCHAR(1000),
   CREATOR              VARCHAR(32),
   UPDATOR              VARCHAR(32),
   PRIMARY KEY (USERCODE)
);

/*==============================================================*/
/* INDEX: IND_LOGINNAME                                         */
/*==============================================================*/
CREATE UNIQUE INDEX IND_LOGINNAME ON F_USERINFO
(
   LOGINNAME
);

/*==============================================================*/
/* INDEX: IND_REGEMAIL                                          */
/*==============================================================*/
CREATE UNIQUE INDEX IND_REGEMAIL ON F_USERINFO
(
   REGEMAIL
);

/*==============================================================*/
/* TABLE: F_USERROLE                                            */
/*==============================================================*/
CREATE TABLE F_USERROLE
(
   USERCODE             VARCHAR(32) NOT NULL,
   ROLECODE             VARCHAR(32) NOT NULL,
   OBTAINDATE           DATE NOT NULL,
   SECEDEDATE           DATE,
   CHANGEDESC           VARCHAR(256),
   UPDATEDATE           DATE,
   CREATEDATE           DATE,
   CREATOR              VARCHAR(32),
   UPDATOR              VARCHAR(32),
   PRIMARY KEY (USERCODE, ROLECODE)
);

/*==============================================================*/
/* TABLE: F_USERSETTING                                         */
/*==============================================================*/
CREATE TABLE F_USERSETTING
(
   USERCODE             VARCHAR(8) NOT NULL COMMENT 'DEFAULT:ΪĬ������
            SYS001~SYS999: Ϊϵͳ���÷���
            ��һ���û���,������ϵͳ��һ�����÷���',
   PARAMCODE            VARCHAR(16) NOT NULL,
   PARAMVALUE           VARCHAR(2048) NOT NULL,
   OPTID                VARCHAR(16) NOT NULL,
   PARAMNAME            VARCHAR(200),
   CREATEDATE           DATE,
   PRIMARY KEY (USERCODE, PARAMCODE)
);

/*==============================================================*/
/* TABLE: F_USERUNIT                                            */
/*==============================================================*/
CREATE TABLE F_USERUNIT
(
   USERUNITID           VARCHAR(16) NOT NULL,
   UNITCODE             VARCHAR(6) NOT NULL,
   USERCODE             VARCHAR(8) NOT NULL,
   ISPRIMARY            CHAR(1) NOT NULL DEFAULT '1' COMMENT 'T��Ϊ���� F����ְ',
   USERSTATION          VARCHAR(16) NOT NULL,
   USERRANK             VARCHAR(2) NOT NULL COMMENT 'RANK ���벻�� 0��ͷ�Ŀ��Խ�������',
   RANKMEMO             VARCHAR(256) COMMENT '��ְ��ע',
   USERORDER            NUMERIC(8,0) DEFAULT 0,
   UPDATEDATE           DATE,
   CREATEDATE           DATE,
   CREATOR              VARCHAR(32),
   UPDATOR              VARCHAR(32),
   PRIMARY KEY (USERUNITID)
);

ALTER TABLE F_USERUNIT COMMENT 'ͬһ���˿����ڶ�����ŵ��β�ͬ��ְλ';

/*==============================================================*/
/* TABLE: F_USER_FAVORITE                                       */
/*==============================================================*/
CREATE TABLE F_USER_FAVORITE
(
   USERCODE             VARCHAR(8) NOT NULL COMMENT 'DEFAULT:ΪĬ������
            SYS001~SYS999: Ϊϵͳ���÷���
            ��һ���û���,������ϵͳ��һ�����÷���',
   OPTID                VARCHAR(16) NOT NULL,
   LASTMODIFYDATE       DATE,
   CREATEDATE           DATE,
   PRIMARY KEY (USERCODE, OPTID)
);

/*==============================================================*/
/* TABLE: F_USER_QUERY_FILTER                                   */
/*==============================================================*/
CREATE TABLE F_USER_QUERY_FILTER
(
   FILTER_NO            NUMERIC(12,0) NOT NULL,
   USERCODE             VARCHAR(8) NOT NULL,
   MODLE_CODE           VARCHAR(64) NOT NULL COMMENT '������Ա���ж��壬�������ظ���������ϵͳ��ģ�������ϵ�ǰ�Ĳ�������',
   FILTER_NAME          VARCHAR(200) NOT NULL COMMENT '�û����ж��������',
   FILTER_VALUE         VARCHAR(3200) NOT NULL COMMENT '����ֵ��JSON��ʽ����Ӧһ��MAP',
   PRIMARY KEY (FILTER_NO)
);

/*==============================================================*/
/* INDEX: IND_QUERY_FILTER_MODLE_CODE                           */
/*==============================================================*/
CREATE INDEX IND_QUERY_FILTER_MODLE_CODE ON F_USER_QUERY_FILTER
(
   MODLE_CODE
);

/*==============================================================*/
/* TABLE: F_WORK_CLASS                                          */
/*==============================================================*/
CREATE TABLE F_WORK_CLASS
(
   CLASS_ID             NUMERIC(12,0) NOT NULL,
   CLASS_NAME           VARCHAR(50) NOT NULL,
   SHORT_NAME           VARCHAR(10) NOT NULL,
   BEGIN_TIME           VARCHAR(6) COMMENT '9:00',
   END_TIME             VARCHAR(6) COMMENT '+4:00 ''+''��ʾ�ڶ���',
   HAS_BREAK            CHAR(1),
   BREAK_BEGIN_TIME     VARCHAR(6) COMMENT '9:00',
   BREAK_END_TIME       VARCHAR(6) COMMENT '+4:00 ''+''��ʾ�ڶ���',
   CLASS_DESC           VARCHAR(500),
   RECORD_DATE          DATE,
   RECORDER             VARCHAR(8),
   PRIMARY KEY (CLASS_ID)
);

ALTER TABLE F_WORK_CLASS COMMENT 'CLASS_ID
 Ϊ 0 �ı�ʾ��Ϣ�����Բ���������г���
 Ϊ 1 ��ΪĬ�ϰ����Ϣ';

/*==============================================================*/
/* TABLE: F_WORK_DAY                                            */
/*==============================================================*/
CREATE TABLE F_WORK_DAY
(
   WORKDAY              DATE NOT NULL,
   DAYTYPE              CHAR(1) NOT NULL COMMENT 'A:�����շż٣�B:��ĩ���ݳɹ���ʱ�� C �����ϰ� D�����ݼ�',
   WORKTIMETYPE         VARCHAR(20),
   WORKDAYDESC          VARCHAR(255),
   PRIMARY KEY (WORKDAY)
);

ALTER TABLE F_WORK_DAY COMMENT '��������ҵʱ����
A:�����շż� B:��ĩ���ݳɹ���ʱ��  C: �����ϰ�  D:�����ݼ�
';

/*==============================================================*/
/* TABLE: M_INNERMSG                                            */
/*==============================================================*/
CREATE TABLE M_INNERMSG
(
   MSGCODE              VARCHAR(16) NOT NULL COMMENT '��Ϣ�����Զ��壬ͨ��S_M_INNERMSG��������',
   SENDER               VARCHAR(128),
   SENDDATE             DATE,
   MSGTITLE             VARCHAR(128),
   MSGTYPE              CHAR(1) COMMENT 'P= ����Ϊ��Ϣ  A= ����Ϊ���棨֪ͨ��
            M=�ʼ�',
   MAILTYPE             CHAR(1) COMMENT 'I=�ռ���
            O=������
            D=�ݸ���
            T=�ϼ���


            ',
   MAILUNDELTYPE        CHAR(1),
   RECEIVENAME          VARCHAR(2048) COMMENT 'ʹ�ò��ţ��������������м�ʹ��Ӣ�ķֺŷָ�',
   HOLDUSERS            NUMERIC(8,0) COMMENT '����Ϊ�����˺ͽ�����������ӣ����ͺͽ�����ɾ����Ϣʱ-1��������Ϊ0ʱ����ɾ��������¼

            ��Ϣ����Ϊ�ʼ�ʱ����Ҫ����',
   MSGSTATE             CHAR(1) COMMENT 'δ��/�Ѷ�/ɾ��',
   MSGCONTENT           LONGBLOB,
   EMAILID              VARCHAR(8) COMMENT '�û����ö�����ʱʹ��',
   OPTID                VARCHAR(64) NOT NULL COMMENT 'ģ�飬���߱�',
   OPTMETHOD            VARCHAR(64) COMMENT '�����������ֶ�',
   OPTTAG               VARCHAR(200) COMMENT 'һ�����ڹ�����ҵ������',
   PRIMARY KEY (MSGCODE)
);

ALTER TABLE M_INNERMSG COMMENT '�ڲ���Ϣ�빫��
���ܴ���,  ��ʵ���Զ�������, ��Ϊ�� �ͷ����� �� һ�Զ�Ĺ�ϵ

                               -&#';

/*==============================================================*/
/* TABLE: M_INNERMSG_RECIPIENT                                  */
/*==============================================================*/
CREATE TABLE M_INNERMSG_RECIPIENT
(
   MSGCODE              VARCHAR(16) NOT NULL,
   RECEIVE              VARCHAR(8) NOT NULL,
   REPLYMSGCODE         INT,
   RECEIVETYPE          CHAR(1) COMMENT 'P=����Ϊ��Ϣ
            A=����Ϊ����
            M=�ʼ�',
   MAILTYPE             CHAR(1) COMMENT 'T=�ռ���
            C=����
            B=����',
   MSGSTATE             CHAR(1) COMMENT 'δ��/�Ѷ�/ɾ�����ռ�������ʱ������ʾ

            U=δ��
            R=�Ѷ�
            D=ɾ��',
   ID                   VARCHAR(16) NOT NULL,
   PRIMARY KEY (ID)
);

ALTER TABLE M_INNERMSG_RECIPIENT COMMENT '�ڲ���Ϣ���ʼ����빫���ռ��˼���Ϣ��Ϣ';

/*==============================================================*/
/* TABLE: M_MSGANNEX                                            */
/*==============================================================*/
CREATE TABLE M_MSGANNEX
(
   MSGCODE              VARCHAR(16) NOT NULL,
   INFOCODE             VARCHAR(16) NOT NULL,
   MSGANNEXID           VARCHAR(16) NOT NULL,
   PRIMARY KEY (MSGANNEXID)
);

/*==============================================================*/
/* TABLE: P_TASK_LIST                                           */
/*==============================================================*/
CREATE TABLE P_TASK_LIST
(
   TASKID               NUMERIC(12,0) NOT NULL COMMENT '�Զ����ɵ���������Ҫһ�����������',
   TASKOWNER            VARCHAR(8) NOT NULL COMMENT '˭������',
   TASKTAG              VARCHAR(1) NOT NULL COMMENT '������OUTLOOK�е��ʼ���ǣ������ò�ͬ����ɫ������ͼ���ʶ',
   TASKRANK             VARCHAR(1) NOT NULL COMMENT '��������ȼ�',
   TASKSTATUS           VARCHAR(2) NOT NULL COMMENT '�����С���ɡ�ȡ������ֹ',
   TASKTITLE            VARCHAR(256) NOT NULL,
   TASKMEMO             VARCHAR(1000) COMMENT '��Ҫ��������ľ�������',
   TASKTYPE             VARCHAR(8) NOT NULL COMMENT '���ˡ���֯����쵼ί�� �ȵ�',
   OPTID                VARCHAR(64) NOT NULL COMMENT 'ģ�飬���߱�',
   OPTMETHOD            VARCHAR(64) COMMENT '�����������ֶ�',
   OPTTAG               VARCHAR(200) COMMENT 'һ�����ڹ�����ҵ������',
   CREATOR              VARCHAR(8) NOT NULL,
   CREATED              DATE NOT NULL,
   PLANBEGINTIME        DATE NOT NULL,
   PLANENDTIME          DATE,
   BEGINTIME            DATE,
   ENDTIME              DATE,
   FINISHMEMO           VARCHAR(1000) COMMENT '��Ҫ��¼�����ִ�й��̺ͽ��',
   NOTICESIGN           VARCHAR(1) COMMENT '���ѱ�־Ϊ����ֹ���ѡ�δ���ѡ�������',
   LASTNOTICETIME       DATE COMMENT '���һ������ʱ�䣬�������Ѳ��Կ������Ѷ��',
   TASKDEADLINE         DATE,
   TASKVALUE            VARCHAR(2048) COMMENT '���ã��ֶβ���ʱʹ��',
   PRIMARY KEY (TASKID)
);

DROP FUNCTION IF EXISTS calcUnitPath;

DELIMITER //
-- ���¼��� untiPath �㷨��ϵͳ�в�����Ҫ�����������������ǹ�ʵʩ��Ա�ֶ�ִ�е�
CREATE FUNCTION calcUnitPath (chrId varchar(32))
   RETURNS varchar(1000)
   BEGIN
      DECLARE sTemp VARCHAR(32);
      DECLARE sPreTemp VARCHAR(32);
      DECLARE path VARCHAR(1000);
      DECLARE rs VARCHAR(1000);
      SET  sTemp = trim(chrId);
      SET  path = '';
      REPEAT
         SET  path = concat('/',sTemp, path);
         set sPreTemp = sTemp;
         SELECT unitcode INTO sTemp
         FROM f_unitinfo
         where unitcode =
               (select parentunit FROM f_unitinfo where unitcode = sTemp);
      until sTemp is null or sTemp='' or sPreTemp = sTemp
      END REPEAT;
      RETURN path;
   END //

DELIMITER ;

-- V_HI_UNITINFO��ͼ�ű�

CREATE OR REPLACE VIEW V_HI_UNITINFO AS
SELECT A.UNITCODE AS TOPUNITCODE,  B.UNITCODE,B.UNITTYPE, B.PARENTUNIT, B.ISVALID,     B.UNITNAME,B.UNITDESC,B.UNITSHORTNAME,B.ADDRBOOKID,B.UNITORDER,B.DEPNO,
       B.UNITWORD,B.UNITGRADE,
       LENGTH(B.UNITPATH)- LENGTH(REPLACE(B.UNITPATH,'/','')) - LENGTH(A.UNITPATH) + LENGTH(REPLACE(A.UNITPATH,'/',''))+1  AS HI_LEVEL,
       SUBSTR(B.UNITPATH ,  LENGTH(A.UNITPATH)+1) AS UNITPATH
  FROM F_UNITINFO A , F_UNITINFO B
 WHERE B.UNITPATH LIKE CONCAT(A.UNITPATH,'%' );


CREATE OR REPLACE VIEW F_V_OPT_ROLE_MAP AS
SELECT CONCAT(C.OPTURL, B.OPTURL) AS OPTURL, B.OPTREQ, A.ROLECODE, C.OPTID, B.OPTCODE
  FROM F_ROLEPOWER A
  JOIN F_OPTDEF B
    ON (A.OPTCODE = B.OPTCODE)
  JOIN F_OPTINFO C
    ON (B.OPTID = C.OPTID)
 WHERE C.OPTTYPE <> 'W'
   AND C.OPTURL <> '...'
 ORDER BY C.OPTURL, B.OPTREQ, A.ROLECODE;
/*==============================================================*/
/* VIEW: F_V_USERROLES                                          */
/*==============================================================*/
CREATE OR REPLACE VIEW F_V_USERROLES AS
SELECT DISTINCT B.ROLECODE,B.ROLENAME,B.ISVALID,B.ROLEDESC,B.CREATEDATE,B.UPDATEDATE ,A.USERCODE
    FROM F_USERROLE A JOIN F_ROLEINFO B ON (A.ROLECODE=B.ROLECODE)
    WHERE A.OBTAINDATE <=  NOW() AND (A.SECEDEDATE IS NULL OR A.SECEDEDATE > NOW()) AND B.ISVALID='T'
UNION ALL
  SELECT D.ROLECODE,D.ROLENAME,D.ISVALID,D.ROLEDESC,D.CREATEDATE,D.UPDATEDATE , C.USERCODE
   FROM F_USERINFO C , F_ROLEINFO D
   WHERE D.ROLECODE = 'G-PUBLIC';

/*==============================================================*/
/* VIEW: F_V_USEROPTDATASCOPES                                  */
/*==============================================================*/
CREATE OR REPLACE VIEW F_V_USEROPTDATASCOPES AS
SELECT  DISTINCT A.USERCODE, C. OPTID ,  C.OPTMETHOD , B.OPTSCOPECODES
FROM F_V_USERROLES A  JOIN F_ROLEPOWER   B ON (A.ROLECODE=B.ROLECODE)
         JOIN F_OPTDEF  C ON(B.OPTCODE=C.OPTCODE);
/*==============================================================*/
/* VIEW: F_V_USEROPTLIST                                        */
/*==============================================================*/
CREATE OR REPLACE VIEW F_V_USEROPTLIST AS
SELECT  DISTINCT A.USERCODE,  C.OPTCODE,  C.OPTNAME  ,  C. OPTID ,  C.OPTMETHOD
FROM F_V_USERROLES A  JOIN F_ROLEPOWER   B ON (A.ROLECODE=B.ROLECODE)
         JOIN F_OPTDEF  C ON(B.OPTCODE=C.OPTCODE);

/*==============================================================*/
/* VIEW: F_V_USEROPTMOUDLELIST                                  */
/*==============================================================*/

CREATE OR REPLACE VIEW F_V_USEROPTMOUDLELIST AS
SELECT  DISTINCT A.USERCODE,D.OPTID, D.OPTNAME , D.PREOPTID  ,
            D.FORMCODE  , D.OPTURL, D.OPTROUTE, D.MSGNO , D.MSGPRM, D.ISINTOOLBAR ,
            D.IMGINDEX,D.TOPOPTID ,D.ORDERIND,D.PAGETYPE,D.OPTTYPE
FROM F_V_USERROLES A  JOIN F_ROLEPOWER B ON (A.ROLECODE=B.ROLECODE)
         JOIN F_OPTDEF  C ON(B.OPTCODE=C.OPTCODE)
        JOIN F_OPTINFO D ON(C.OPTID=D.OPTID)
WHERE D.OPTURL<>'...';

/*==============================================================*/
/* VIEW: F_V_OPTDEF_URL_MAP                                     */
/*==============================================================*/
CREATE OR REPLACE VIEW F_V_OPTDEF_URL_MAP AS
 SELECT CONCAT(C.OPTURL, B.OPTURL) AS OPTDEFURL, B.OPTREQ, B.OPTCODE,
    B.OPTDESC,B.OPTMETHOD , C.OPTID,B.OPTNAME
 FROM F_OPTDEF B JOIN F_OPTINFO C
    ON (B.OPTID = C.OPTID)
 WHERE C.OPTTYPE <> 'W'
   AND C.OPTURL <> '...' AND B.OPTREQ IS NOT NULL;

/*==============================================================*/
/* VIEW: V_OPT_TREE                                             */
/*==============================================================*/
CREATE OR REPLACE VIEW V_OPT_TREE AS
   SELECT I.OPTID AS MENU_ID,I.PREOPTID AS PARENT_ID,I.OPTNAME AS MENU_NAME,I.ORDERIND
   FROM F_OPTINFO I WHERE I.ISINTOOLBAR ='Y'
   UNION ALL
   SELECT D.OPTCODE AS MENU_ID,D.OPTID AS PARENT_ID,D.OPTNAME AS MENU_NAME,0 AS ORDERIND
   FROM F_OPTDEF D
;
