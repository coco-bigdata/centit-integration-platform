--����ű� ��ǰӦ�����ֵģ�ֱ������ǰ�Ŀ���е�

/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     2016/4/19 17:51:25                           */
/*==============================================================*/

create sequence S_Filter_No;

create sequence s_notify_id;

create sequence s_optdefcode
start with 1100000;

create sequence s_sys_log;

create sequence s_unitcode;

create sequence s_user_unit_id;

create sequence s_usercode;

/*==============================================================*/
/* Table: F_DATACATALOG                                         */
/*==============================================================*/
create table F_DATACATALOG  (
  CATALOGCODE          VARCHAR2(16)                    not null,
  CATALOGNAME          VARCHAR2(64)                    not null,
  CATALOGSTYLE         CHAR(1)                         not null,
  CATALOGTYPE          CHAR(1)                         not null,
  CATALOGDESC          VARCHAR2(256),
  FieldDesc            VARCHAR2(1024),
  updateDate           DATE,
  CreateDate           DATE,
  optID                VARCHAR2(16),
  needCache            CHAR(1)                        default '1',
  creator              VARCHAR2(32),
  updator              VARCHAR2(32)
);

comment on table F_DATACATALOG is
'���״̬	 U:�û� S��ϵͳ��G����
�����ʽ  T����״��� L:�б�
';

comment on column F_DATACATALOG.CATALOGSTYLE is
'F : ��ܹ��е� U:�û� S��ϵͳ  G����';

comment on column F_DATACATALOG.CATALOGTYPE is
'T����״��� L:�б�
';

comment on column F_DATACATALOG.FieldDesc is
'�ֶ���������ͬ�ֶ��÷ֺŸ���';

comment on column F_DATACATALOG.optID is
'ҵ����࣬ʹ�������ֵ�DICTIONARYTYPE������';

alter table F_DATACATALOG cache;

alter table F_DATACATALOG
  add constraint SYS_C003033 primary key (CATALOGCODE);

/*==============================================================*/
/* Table: F_DATADICTIONARY                                      */
/*==============================================================*/
create table F_DATADICTIONARY  (
  CATALOGCODE          VARCHAR2(16)                    not null,
  DATACODE             VARCHAR2(16)                    not null,
  EXTRACODE            VARCHAR2(16),
  EXTRACODE2           VARCHAR2(16),
  DATATAG              CHAR(1),
  DATAVALUE            VARCHAR2(2048),
  DATASTYLE            CHAR(1),
  DATADESC             VARCHAR2(256),
  LastModifyDate       DATE,
  CreateDate           DATE,
  DATAORDER            NUMBER(6,0)
);

comment on table F_DATADICTIONARY is
'�����ֵ䣺���һЩ�������� ���������ʾ��Ϣ������һЩ ���������ƵĶ�Ӧ������ ״̬����ɫ����ͷ�� �ȵ�

�����ֵ��е�ÿ���ֶ��û������Ը����Լ�����Ҫ�Խ���������';

comment on column F_DATADICTIONARY.EXTRACODE is
'�����ֵ�ĸ������';

comment on column F_DATADICTIONARY.EXTRACODE2 is
'Ĭ�ϵ������ֶ�';

comment on column F_DATADICTIONARY.DATATAG is
'N������D��ͣ�ã��û������Խ�������ֶ�';

comment on column F_DATADICTIONARY.DATASTYLE is
'F : ��ܹ��е� U:�û� S��ϵͳ  G����';

comment on column F_DATADICTIONARY.DATAORDER is
'�����ֶ�';

alter table F_DATADICTIONARY cache;

alter table F_DATADICTIONARY
  add constraint PK_DATADICTIONARY primary key (CATALOGCODE, DATACODE);

/*==============================================================*/
/* Table: F_OPTDATASCOPE                                        */
/*==============================================================*/
create table F_OPTDATASCOPE  (
  optScopeCode         VARCHAR2(16)                    not null,
  OptID                VARCHAR2(16),
  scopeName            VARCHAR2(64),
  FilterCondition      VARCHAR2(1024),
  scopeMemo            VARCHAR2(1024),
  FilterGroup          VARCHAR2(16)                   default 'G'
);

comment on column F_OPTDATASCOPE.FilterCondition is
'������䣬�����еĲ��� [mt] ҵ��� [uc] �û����� [uu] �û���������';

comment on column F_OPTDATASCOPE.scopeMemo is
'����Ȩ��˵��';

alter table F_OPTDATASCOPE
  add constraint PK_F_OPTDATASCOPE primary key (optScopeCode);

/*==============================================================*/
/* Table: F_OPTDEF                                              */
/*==============================================================*/
create table F_OPTDEF  (
  OPTCODE              VARCHAR2(32)                    not null,
  OptID                VARCHAR2(32),
  OPTNAME              VARCHAR2(100),
  OPTMETHOD            VARCHAR2(50),
  OPTURL               VARCHAR2(256),
  OPTDESC              VARCHAR2(256),
  IsInWorkflow         CHAR(1),
  updateDate           DATE,
  CreateDate           DATE,
  OPTREQ               VARCHAR2(8),
  optOrder 			number(4),
  creator              VARCHAR2(32),
  updator              VARCHAR2(32)
);

comment on column F_OPTDEF.OPTMETHOD is
'�������� ����';

comment on column F_OPTDEF.IsInWorkflow is
'�Ƿ�Ϊ���̲������� F������  T �� ��';

alter table F_OPTDEF
  add constraint PK_F_OPTDEF primary key (OPTCODE);

/*==============================================================*/
/* Index: IND_OptID_OPTMETHOD                                   */
/*==============================================================*/
create index IND_OptID_OPTMETHOD on F_OPTDEF (
  OptID ASC,
  OPTMETHOD ASC
);

/*==============================================================*/
/* Table: F_OPT_LOG                                             */
/*==============================================================*/
create table F_OPT_LOG  (
  logId                NUMBER(12,0)                    not null,
  logLevel             VARCHAR2(2)                     not null,
  usercode             VARCHAR2(8)                     not null,
  opttime              DATE                            not null,
  OptContent           VARCHAR2(1000)                  not null,
  NewValue             CLOB,
  OldValue             CLOB,
  OptID                VARCHAR2(64)                    not null,
  OPTMethod            VARCHAR2(64),
  optTag               VARCHAR2(200)
);

comment on column F_OPT_LOG.OptContent is
'��������';

comment on column F_OPT_LOG.NewValue is
'��ֵ';

comment on column F_OPT_LOG.OldValue is
'ԭֵ';

comment on column F_OPT_LOG.OptID is
'ģ�飬���߱�';

comment on column F_OPT_LOG.OPTMethod is
'�����������ֶ�';

comment on column F_OPT_LOG.optTag is
'һ�����ڹ�����ҵ������ı�ʶ����������ȵ�';

alter table F_OPT_LOG
  add constraint PK_F_OPT_LOG primary key (logId);

/*==============================================================*/
/* Index: ind_Tag_ID                                            */
/*==============================================================*/
create index ind_Tag_ID on F_OPT_LOG (
  optTag ASC
);

/*==============================================================*/
/* Table: F_OptFlowNoInfo                                       */
/*==============================================================*/
create table F_OptFlowNoInfo  (
  OwnerCode            VARCHAR2(8)                     not null,
  CodeCode             VARCHAR2(16)                    not null,
  CodeDate             DATE                           default sysdate not null,
  CurNo                NUMBER(6,0)                    default 1 not null,
  LastCodeDate         DATE,
  CreateDate           DATE,
  LastModifyDate       DATE
);

alter table F_OptFlowNoInfo
  add constraint PK_F_OPTFLOWNOINFO primary key (OwnerCode, CodeDate, CodeCode);

/*==============================================================*/
/* Table: F_OptFlowNoPool                                       */
/*==============================================================*/
create table F_OptFlowNoPool  (
  OwnerCode            VARCHAR2(8)                     not null,
  CodeCode             VARCHAR2(16)                    not null,
  CodeDate             DATE                           default sysdate not null,
  CurNo                NUMBER(6,0)                    default 1 not null,
  CreateDate           DATE
);

alter table F_OptFlowNoPool
  add constraint PK_F_OPTFLOWNOPOOL primary key (OwnerCode, CodeDate, CodeCode, CurNo);

/*==============================================================*/
/* Table: F_OptInfo                                             */
/*==============================================================*/
create table F_OptInfo  (
  OptID                VARCHAR2(32)                    not null,
  OptName              VARCHAR2(100)                   not null,
  PreOptID             VARCHAR2(32)                    not null,
  optRoute             VARCHAR2(256),
  opturl               VARCHAR2(256),
  FormCode             VARCHAR2(4),
  OptType              CHAR(1),
  MsgNo                NUMBER(10,0),
  MsgPrm               VARCHAR2(256),
  IsInToolBar          CHAR(1),
  ImgIndex             NUMBER(10,0),
  TopOptID             VARCHAR2(8),
  OrderInd             NUMBER(4,0),
  FLOWCODE             VARCHAR2(8),
  PageType             CHAR(1)                        default 'I' not null,
  Icon                 VARCHAR2(512),
  height               NUMBER(10,0),
  width                NUMBER(10,0),
  updateDate           DATE,
  CreateDate           DATE,
  creator              VARCHAR2(32),
  updator              VARCHAR2(32)
);

comment on column F_OptInfo.optRoute is
'��angularjs·��ƥ��';

comment on column F_OptInfo.OptType is
' S:ʵʩҵ��, O:��ͨҵ��, W:����ҵ��, I :��Ŀҵ��';

comment on column F_OptInfo.OrderInd is
'���˳��ֻ����ͬһ����ҵ��������';

comment on column F_OptInfo.FLOWCODE is
'ͬһ�����������Ӧ��ֻ��һ����Ч�İ汾';

comment on column F_OptInfo.PageType is
'D : DIV I:iFrame';

alter table F_OptInfo
  add constraint PK_F_OPTINFO primary key (OptID);

/*==============================================================*/
/* Table: F_OptInfoData                                         */
/*==============================================================*/
create table F_OptInfoData  (
  TBCODE               VARCHAR2(32)                    not null,
  OptID                VARCHAR2(8)                     not null,
  LastModifyDate       DATE,
  CreateDate           DATE
);

comment on table F_OptInfoData is
'ҵ��ģ��ͱ��Ƕ�Զ�Ĺ�ϵ,������������Ϊ����Ȩ������ʱ��һ���������';

alter table F_OptInfoData
  add constraint PK_F_OPTINFODATA primary key (TBCODE, OptID);

/*==============================================================*/
/* Table: F_QUERY_FILTER_CONDITION                              */
/*==============================================================*/
create table F_QUERY_FILTER_CONDITION  (
  CONDITION_NO         NUMBER(12,0)                    not null,
  Table_Class_Name     VARCHAR2(64)                    not null,
  Param_Name           VARCHAR2(64)                    not null,
  Param_Label          VARCHAR2(120)                   not null,
  Param_Type           VARCHAR2(8),
  Default_Value        VARCHAR2(100),
  Filter_Sql           VARCHAR2(200),
  Select_Data_type     CHAR                           default 'N' not null,
  Select_Data_Catalog  VARCHAR2(64),
  Select_SQL           VARCHAR2(1000),
  Select_JSON          VARCHAR2(2000)
);

comment on column F_QUERY_FILTER_CONDITION.Table_Class_Name is
'���ݿ��������po������';

comment on column F_QUERY_FILTER_CONDITION.Param_Name is
'������';

comment on column F_QUERY_FILTER_CONDITION.Param_Label is
'�����������ʾ';

comment on column F_QUERY_FILTER_CONDITION.Param_Type is
'�������ͣ�S �ַ�����L ���֣� N ��С�������ݣ� D ���ڣ� T ʱ����� Y �꣬ M ��';

comment on column F_QUERY_FILTER_CONDITION.Filter_Sql is
'������䣬����ƴװ��sql�����';

comment on column F_QUERY_FILTER_CONDITION.Select_Data_type is
'�������������ݣ� N ��û�У� D �����ֵ�, S ͨ��sql����ã� J json����ֱ�ӻ�ȡ
';

comment on column F_QUERY_FILTER_CONDITION.Select_Data_Catalog is
'�����ֵ�';

comment on column F_QUERY_FILTER_CONDITION.Select_SQL is
'�����������ֶε�sql���';

comment on column F_QUERY_FILTER_CONDITION.Select_JSON is
'KEY,Value��ֵ�ԣ�JSON��ʽ';

alter table F_QUERY_FILTER_CONDITION
  add constraint PK_F_QUERY_FILTER_CONDITION primary key (CONDITION_NO);

/*==============================================================*/
/* Index: Ind_Filter_Table_Class_Name                           */
/*==============================================================*/
create index Ind_Filter_Table_Class_Name on F_QUERY_FILTER_CONDITION (
  Table_Class_Name ASC
);

/*==============================================================*/
/* Table: F_RANKGRANT                                           */
/*==============================================================*/
create table F_RANKGRANT  (
  RANK_grant_ID        number(12)                      not null,
  granter              VARCHAR2(8)                     not null,
  UNITCODE             VARCHAR2(6)                     not null,
  UserStation          VARCHAR2(4)                     not null,
  UserRank             VARCHAR2(2)                     not null,
  beginDate            DATE                            not null,
  grantee              VARCHAR2(8)                     not null,
  endDate              DATE,
  grantDesc            VARCHAR2(256),
  LastModifyDate       DATE,
  CreateDate           DATE
);

comment on column F_RANKGRANT.UserRank is
'RANK ���벻�� 0��ͷ�Ŀ��Խ�������';

alter table F_RANKGRANT
  add constraint PK_F_RANKGRANT primary key (RANK_grant_ID, UserRank);

/*==============================================================*/
/* Table: F_ROLEINFO                                            */
/*==============================================================*/
create table F_ROLEINFO  (
  ROLECODE             VARCHAR2(32)                    not null,
  ROLENAME             VARCHAR2(64),
  ROLETYPE             CHAR(1)                         not null,
  UNITCODE             VARCHAR2(32),
  ISVALID              CHAR(1)                         not null,
  ROLEDESC             VARCHAR2(256),
  updateDate           DATE,
  CreateDate           DATE,
  creator              VARCHAR2(32),
  updator              VARCHAR2(32)
);

comment on column F_ROLEINFO.ROLETYPE is
'SΪϵͳ���ܽ�ɫ I Ϊ��Ŀ��ɫ W��������ɫ';

alter table F_ROLEINFO
  add constraint PK_F_ROLEINFO primary key (ROLECODE);

/*==============================================================*/
/* Table: F_ROLEPOWER                                           */
/*==============================================================*/
create table F_ROLEPOWER  (
  ROLECODE             VARCHAR2(32)                    not null,
  OPTCODE              VARCHAR2(32)                    not null,
  optScopeCodes        VARCHAR2(1000),
  updateDate           DATE,
  CreateDate           DATE,
  creator              VARCHAR2(32),
  updator              VARCHAR2(32)
);

comment on column F_ROLEPOWER.optScopeCodes is
'�ö��Ÿ��������ݷ�Χ��ϣ���\all ��ʾȫ����';

alter table F_ROLEPOWER
  add constraint PK_WFROLEPOWER primary key (ROLECODE, OPTCODE);

/*==============================================================*/
/* Table: F_STAT_MONTH                                          */
/*==============================================================*/
create table F_STAT_MONTH  (
  YEARMONTH            VARCHAR2(6)                     not null,
  BeginDay             DATE                            not null,
  EendDay              DATE                            not null,
  EndSchedule          CHAR(1),
  BeginSchedule        CHAR(1)
);

comment on table F_STAT_MONTH is
'OAҵ��ͳ���£������Զ���ͳ���µ���ֹ����';

comment on column F_STAT_MONTH.YEARMONTH is
'YYYYMM';

comment on column F_STAT_MONTH.EndSchedule is
'����ֶκ���';

comment on column F_STAT_MONTH.BeginSchedule is
'����ֶκ���';

alter table F_STAT_MONTH
  add constraint PK_F_STAT_MONTH primary key (YEARMONTH);

/*==============================================================*/
/* Table: F_SYS_NOTIFY                                          */
/*==============================================================*/
create table F_SYS_NOTIFY  (
  Notify_ID            NUMBER(12,0)                    not null,
  Notify_Sender        VARCHAR2(100),
  Notify_Receiver      VARCHAR2(100)                   not null,
  Msg_Subject          VARCHAR2(200),
  Msg_Content          VARCHAR2(2000)                  not null,
  notice_Type          VARCHAR2(100),
  Notify_State         CHAR(1),
  Error_Msg            VARCHAR2(500),
  Notify_Time          DATE,
  optTag               VARCHAR2(200),
  OPTMethod            VARCHAR2(64),
  OptID                VARCHAR2(64)                    not null
);

comment on column F_SYS_NOTIFY.Notify_State is
'0 �ɹ��� 1 ʧ�� 2 ���ֳɹ�';

comment on column F_SYS_NOTIFY.optTag is
'һ�����ڹ�����ҵ������';

comment on column F_SYS_NOTIFY.OPTMethod is
'�����������ֶ�';

comment on column F_SYS_NOTIFY.OptID is
'ģ�飬���߱�';

alter table F_SYS_NOTIFY
  add constraint PK_F_SYS_NOTIFY primary key (Notify_ID);

/*==============================================================*/
/* Table: F_UNITINFO                                            */
/*==============================================================*/
create table F_UNITINFO  (
  UNITCODE             VARCHAR2(32)                    not null,
  PARENTUNIT           VARCHAR2(32),
  UNITTYPE             CHAR(1),
  ISVALID              CHAR(1)                         not null,
  UNITTAG              VARCHAR2(100),
  UNITNAME             VARCHAR2(300)                   not null,
  englishName          VARCHAR2(300),
  depno                VARCHAR2(100),
  UNITDESC             VARCHAR2(256),
  ADDRBOOKID           NUMBER(10,0),
  UNITSHORTNAME        VARCHAR2(32),
  unitWord             VARCHAR2(100),
  unitGrade            NUMBER(4,0),
  unitOrder            NUMBER(4,0),
  updateDate           DATE,
  CreateDate           DATE,
  extJsonInfo          VARCHAR2(1000),
  creator              VARCHAR2(32),
  updator              VARCHAR2(32),
  UNITPATH             VARCHAR2(1000)
);

comment on column F_UNITINFO.UNITTYPE is
'��������/ �ʵ�滮/���/��������';

comment on column F_UNITINFO.ISVALID is
'T:��Ч F:��Ч';

comment on column F_UNITINFO.UNITTAG is
'�û�������ϵͳ����';

comment on column F_UNITINFO.depno is
'��֯�������룺';

alter table F_UNITINFO
  add constraint SYS_C006472 primary key (UNITCODE);

/*==============================================================*/
/* Table: F_USERINFO                                            */
/*==============================================================*/
create table F_USERINFO  (
  USERCODE             VARCHAR2(32)                    not null,
  USERPIN              VARCHAR2(32),
  USERTYPE             CHAR(1)                        default 'U',
  ISVALID              CHAR(1)                         not null,
  LOGINNAME            VARCHAR2(100)                   not null,
  UserName             VARCHAR2(300)                   not null,
  USERTAG              VARCHAR2(100),
  englishName          VARCHAR2(300),
  USERDESC             VARCHAR2(256),
  LoginTimes           NUMBER(6,0),
  ActiveTime           DATE,
  LoginIP              VARCHAR2(16),
  ADDRBOOKID           NUMBER(10,0),
  RegEmail             VARCHAR2(60),
  USERPWD              VARCHAR2(20),
  pwdExpiredTime       DATE,
  REGCELLPHONE         VARCHAR2(15),
  primaryUnit          VARCHAR2(32),
  userWord             VARCHAR2(100),
  userOrder            NUMBER(4,0),
  updateDate           DATE,
  CreateDate           DATE,
  extJsonInfo          VARCHAR2(1000),
  creator              VARCHAR2(32),
  updator              VARCHAR2(32)
);

comment on column F_USERINFO.USERTYPE is
'��������/��������/ϵͳ����';

comment on column F_USERINFO.ISVALID is
'T:��Ч F:��Ч';

comment on column F_USERINFO.UserName is
'�ǳ�';

comment on column F_USERINFO.USERTAG is
'���ڵ�����ϵͳ����';

comment on column F_USERINFO.RegEmail is
'ע����Email�������ظ�';

comment on column F_USERINFO.USERPWD is
'�����Ҫ������';

comment on column F_USERINFO.userWord is
'΢�ź�';

alter table F_USERINFO
  add constraint PK_F_USERINFO primary key (USERCODE);

/*==============================================================*/
/* Index: Ind_loginname                                         */
/*==============================================================*/
create unique index Ind_loginname on F_USERINFO (
  LOGINNAME ASC
);

/*==============================================================*/
/* Index: ind_regemail                                          */
/*==============================================================*/
create unique index ind_regemail on F_USERINFO (
  RegEmail ASC
);

/*==============================================================*/
/* Table: F_USERROLE                                            */
/*==============================================================*/
create table F_USERROLE  (
  USERCODE             VARCHAR2(32)                    not null,
  ROLECODE             VARCHAR2(32)                    not null,
  OBTAINDATE           DATE                            not null,
  SECEDEDATE           DATE,
  CHANGEDESC           VARCHAR2(256),
  updateDate           DATE,
  CreateDate           DATE,
  creator              VARCHAR2(32),
  updator              VARCHAR2(32)
);

alter table F_USERROLE
  add constraint PK_WFUSERROLE primary key (USERCODE, ROLECODE);

/*==============================================================*/
/* Table: F_USERSETTING                                         */
/*==============================================================*/
create table F_USERSETTING  (
  USERCODE             VARCHAR2(8)                     not null,
  ParamCode            VARCHAR2(16)                    not null,
  ParamValue           VARCHAR2(2048)                  not null,
  optID                VARCHAR2(16)                    not null,
  ParamName            VARCHAR2(200),
  CreateDate           DATE
);

comment on column F_USERSETTING.USERCODE is
'DEFAULT:ΪĬ������
SYS001~SYS999: Ϊϵͳ���÷���
��һ���û���,������ϵͳ��һ�����÷���';

alter table F_USERSETTING
  add constraint SYS_C0064714 primary key (USERCODE, ParamCode);

/*==============================================================*/
/* Table: F_USERUNIT                                            */
/*==============================================================*/
create table F_USERUNIT  (
  USERUNITID           VARCHAR2(16)                    not null,
  UNITCODE             VARCHAR2(6)                     not null,
  USERCODE             VARCHAR2(8)                     not null,
  IsPrimary            CHAR(1)                        default '1' not null,
  UserStation          VARCHAR2(16)                    not null,
  UserRank             VARCHAR2(2)                     not null,
  RankMemo             VARCHAR2(256),
  USERORDER            number(8)                      default 0,
  updateDate           DATE,
  CreateDate           DATE,
  creator              VARCHAR2(32),
  updator              VARCHAR2(32)
);

comment on table F_USERUNIT is
'ͬһ���˿����ڶ�����ŵ��β�ͬ��ְλ';

comment on column F_USERUNIT.IsPrimary is
'T��Ϊ���� F����ְ';

comment on column F_USERUNIT.UserRank is
'RANK ���벻�� 0��ͷ�Ŀ��Խ�������';

comment on column F_USERUNIT.RankMemo is
'��ְ��ע';

alter table F_USERUNIT
  add constraint PK_F_USERUNIT primary key (USERUNITID);

/*==============================================================*/
/* Table: F_USER_FAVORITE                                       */
/*==============================================================*/
create table F_USER_FAVORITE  (
  USERCODE             VARCHAR2(8)                     not null,
  OptID                VARCHAR2(16)                    not null,
  LastModifyDate       DATE,
  CreateDate           DATE
);

comment on column F_USER_FAVORITE.USERCODE is
'DEFAULT:ΪĬ������
SYS001~SYS999: Ϊϵͳ���÷���
��һ���û���,������ϵͳ��һ�����÷���';

alter table F_USER_FAVORITE
  add constraint SYS_C0064724 primary key (USERCODE, OptID);

/*==============================================================*/
/* Table: F_USER_QUERY_FILTER                                   */
/*==============================================================*/
create table F_USER_QUERY_FILTER  (
  FILTER_NO            NUMBER(12,0)                    not null,
  userCode             varchar2(8)                     not null,
  modle_code           varchar2(64)                    not null,
  filter_name          varchar2(200)                   not null,
  filter_value         varchar2(3200)                  not null
);

comment on column F_USER_QUERY_FILTER.modle_code is
'������Ա���ж��壬�������ظ���������ϵͳ��ģ�������ϵ�ǰ�Ĳ�������';

comment on column F_USER_QUERY_FILTER.filter_name is
'�û����ж��������';

comment on column F_USER_QUERY_FILTER.filter_value is
'����ֵ��json��ʽ����Ӧһ��map';

alter table F_USER_QUERY_FILTER
  add constraint PK_F_USER_QUERY_FILTER primary key (FILTER_NO);

/*==============================================================*/
/* Index: Ind_query_filter_modle_code                           */
/*==============================================================*/
create index Ind_query_filter_modle_code on F_USER_QUERY_FILTER (
  modle_code ASC
);

/*==============================================================*/
/* Table: F_WORK_CLASS                                          */
/*==============================================================*/
create table F_WORK_CLASS  (
  CLASS_ID             NUMBER(12,0)                    not null,
  CLASS_NAME           VARCHAR2(50)                    not null,
  SHORT_NAME           VARCHAR2(10)                    not null,
  begin_time           VARCHAR2(6),
  end_time             VARCHAR2(6),
  has_break            CHAR(1),
  break_begin_time     VARCHAR2(6),
  break_end_time       VARCHAR2(6),
  class_desc           VARCHAR2(500),
  record_date          DATE,
  recorder             VARCHAR2(8)
);

comment on table F_WORK_CLASS is
'CLASS_ID
 Ϊ 0 �ı�ʾ��Ϣ�����Բ���������г���
 Ϊ 1 ��ΪĬ�ϰ����Ϣ';

comment on column F_WORK_CLASS.begin_time is
'9:00';

comment on column F_WORK_CLASS.end_time is
'+4:00 ''+''��ʾ�ڶ���';

comment on column F_WORK_CLASS.break_begin_time is
'9:00';

comment on column F_WORK_CLASS.break_end_time is
'+4:00 ''+''��ʾ�ڶ���';

alter table F_WORK_CLASS
  add constraint PK_F_WORK_CLASS primary key (CLASS_ID);

/*==============================================================*/
/* Table: F_WORK_DAY                                            */
/*==============================================================*/
create table F_WORK_DAY  (
  WorkDay              DATE                            not null,
  DayType              CHAR(1)                         not null,
  WorkTimeType         VARCHAR2(20),
  WorkDayDesc          VARCHAR2(255)
);

comment on table F_WORK_DAY is
'��������ҵʱ����
A:�����շż� B:��ĩ���ݳɹ���ʱ��  C: �����ϰ�  D:�����ݼ�
';

comment on column F_WORK_DAY.DayType is
'A:�����շż٣�B:��ĩ���ݳɹ���ʱ�� C �����ϰ� D�����ݼ�';

alter table F_WORK_DAY
  add constraint PK_F_WORK_DAY primary key (WorkDay);

/*==============================================================*/
/* Table: M_InnerMsg                                            */
/*==============================================================*/
create table M_InnerMsg  (
  MsgCode              VARCHAR2(16)                    not null,
  Sender               VARCHAR2(128),
  SendDate             DATE,
  MsgTitle             VARCHAR2(128),
  MsgType              CHAR(1),
  MailType             CHAR(1),
  MailUnDelType        CHAR(1),
  ReceiveName          VARCHAR2(2048),
  HoldUsers            NUMBER(8,0),
  msgState             CHAR(1),
  msgContent           BLOB,
  EmailId              VARCHAR2(8),
  OptID                VARCHAR2(64)                    not null,
  OPTMethod            VARCHAR2(64),
  optTag               VARCHAR2(200)
);

comment on table M_InnerMsg is
'�ڲ���Ϣ�빫��
���ܴ���,  ��ʵ���Զ�������, ��Ϊ�� �ͷ����� �� һ�Զ�Ĺ�ϵ

��ԭ��ʱ��Ϣ�ϲ���������Ϣ��Ϊ��ʱ��д���ͣ��ݲ������ݸ弰��ʱ���͡�

��ʱ���������ϵͳͳһ���ã��������ֵ䡣';

comment on column M_InnerMsg.MsgCode is
'��Ϣ�����Զ��壬ͨ��S_M_INNERMSG��������';

comment on column M_InnerMsg.MsgType is
'P= ����Ϊ��Ϣ  A= ����Ϊ���棨֪ͨ��
M=�ʼ�';

comment on column M_InnerMsg.MailType is
'I=�ռ���
O=������
D=�ݸ���
T=�ϼ���
';

comment on column M_InnerMsg.ReceiveName is
'ʹ�ò��ţ��������������м�ʹ��Ӣ�ķֺŷָ�';

comment on column M_InnerMsg.HoldUsers is
'����Ϊ�����˺ͽ�����������ӣ����ͺͽ�����ɾ����Ϣʱ-1��������Ϊ0ʱ����ɾ��������¼

��Ϣ����Ϊ�ʼ�ʱ����Ҫ����';

comment on column M_InnerMsg.msgState is
'δ��/�Ѷ�/ɾ��';

comment on column M_InnerMsg.EmailId is
'�û����ö�����ʱʹ��';

comment on column M_InnerMsg.OptID is
'ģ�飬���߱�';

comment on column M_InnerMsg.OPTMethod is
'�����������ֶ�';

comment on column M_InnerMsg.optTag is
'һ�����ڹ�����ҵ������';

alter table M_InnerMsg
  add constraint PK_M_INNERMSG primary key (MsgCode);

/*==============================================================*/
/* Table: M_InnerMsg_Recipient                                  */
/*==============================================================*/
create table M_InnerMsg_Recipient  (
  MsgCode              VARCHAR2(16)                    not null,
  Receive              VARCHAR2(8)                     not null,
  ReplyMsgCode         INTEGER,
  ReceiveType          CHAR(1),
  MailType             CHAR(1),
  msgState             CHAR(1),
  ID                   VARCHAR2(16)                    not null
);

comment on table M_InnerMsg_Recipient is
'�ڲ���Ϣ���ʼ����빫���ռ��˼���Ϣ��Ϣ';

comment on column M_InnerMsg_Recipient.ReceiveType is
'P=����Ϊ��Ϣ
A=����Ϊ����
M=�ʼ�';

comment on column M_InnerMsg_Recipient.MailType is
'T=�ռ���
C=����
B=����';

comment on column M_InnerMsg_Recipient.msgState is
'δ��/�Ѷ�/ɾ�����ռ�������ʱ������ʾ
U=δ��
R=�Ѷ�
D=ɾ��';

alter table M_InnerMsg_Recipient
  add constraint PK_M_INNERMSG_RECIPIENT primary key (ID);

/*==============================================================*/
/* Table: M_MsgAnnex                                            */
/*==============================================================*/
create table M_MsgAnnex  (
  MsgCode              VARCHAR2(16)                    not null,
  InfoCode             VARCHAR2(16)                    not null,
  MsgAnnexId           VARCHAR2(16)                    not null
);

alter table M_MsgAnnex
  add constraint PK_M_MSGANNEX primary key (MsgAnnexId);

/*==============================================================*/
/* View: F_V_Opt_Role_Map                                       */
/*==============================================================*/
create or replace view F_V_Opt_Role_Map as
  select c.opturl || b.opturl as opturl, b.optreq, a.rolecode, c.optid, b.optcode
  from F_ROLEPOWER a
    join F_OPTDEF b
      on (a.optcode = b.optcode)
    join f_optinfo c
      on (b.optid = c.optid)
  where c.OptType <> 'W'
        and c.opturl <> '...'
  order by c.opturl, b.optreq, a.rolecode

;

/*==============================================================*/
/* View: F_V_USERROLES                                          */
/*==============================================================*/
create or replace view F_V_USERROLES as
  select distinct b.ROLECODE,b.ROLENAME,b.ISVALID,b.ROLEDESC,b.CREATEDATE,b.UPDATEDATE ,a.usercode
  from F_USERROLE a join F_ROLEINFO b on (a.ROLECODE=b.ROLECODE)
  where a.OBTAINDATE <= sysdate and (a.SECEDEDATE is null or a.SECEDEDATE > sysdate) and b.ISVALID='T'
  union all
  select d.ROLECODE,d.ROLENAME,d.ISVALID,d.ROLEDESC,d.CREATEDATE,d.UPDATEDATE , c.usercode
  from f_userinfo c , F_ROLEINFO d
  where d.rolecode = 'G-public'
;

/*==============================================================*/
/* View: F_V_UserOptDataScopes                                  */
/*==============================================================*/
create or replace view F_V_UserOptDataScopes as
  select  distinct a.UserCode, c. OPTID ,  c.OPTMETHOD , b.optScopeCodes
  from F_V_USERROLES a  join F_ROLEPOWER   b on (a.RoleCode=b.RoleCode)
    join F_OPTDEF  c on(b.OPTCODE=c.OPTCODE)
;

/*==============================================================*/
/* View: F_V_UserOptList                                        */
/*==============================================================*/
create or replace view F_V_UserOptList as
  select  distinct a.UserCode,  c.OPTCODE,  c.OPTNAME  ,  c. OPTID ,  c.OPTMETHOD
  from F_V_USERROLES a  join F_ROLEPOWER   b on (a.RoleCode=b.RoleCode)
    join F_OPTDEF  c on(b.OPTCODE=c.OPTCODE)
;

/*==============================================================*/
/* View: F_V_UserOptMoudleList                                  */
/*==============================================================*/
create or replace view F_V_UserOptMoudleList as
  select  distinct a.UserCode,d.OptID, d.OptName , d.PreOptID  ,
    d.FormCode, d.optroute, d.opturl, d.MsgNo , d.MsgPrm, d.IsInToolBar ,
    d.ImgIndex,d.TopOptID ,d.OrderInd,d.PageType,d.opttype
  from F_V_USERROLES a  join F_ROLEPOWER b on (a.RoleCode=b.RoleCode)
    join F_OPTDEF  c on(b.OPTCODE=c.OPTCODE)
    join F_OptInfo d on(c.OPTID=d.OptID)
  where  d.opturl<> '...'
;

/*==============================================================*/
/* View: V_Hi_Optinfo                                           */
/*==============================================================*/
create or replace view V_Hi_Optinfo as
  select connect_by_root  t.optid  as topoptid, level as hi_level , t.optid , t.optname
  from f_optinfo t
  connect by prior t.optid = t.preoptid
;

/*==============================================================*/
/* View: f_v_optdef_url_map                                     */
/*==============================================================*/
create or replace view f_v_optdef_url_map as
  select c.opturl || b.opturl as optdefurl, b.optreq, b.optcode,
    b.optdesc,b.optMethod , c.optid,b.OptName
  from F_OPTDEF b join f_optinfo c
      on (b.optid = c.optid)
  where c.OptType <> 'W'
        and c.opturl <> '...' and b.optreq is not null
;

/*==============================================================*/
/* View: f_v_wf_optdef_url_map                                  */
/*==============================================================*/
create or replace view f_v_wf_optdef_url_map as
  select c.opturl || b.opturl as optdefurl, b.optreq, b.optcode,
    b.optdesc,b.optMethod , c.optid,b.OptName
  from F_OPTDEF b join f_optinfo c
      on (b.optid = c.optid)
  where c.OptType = 'W'
        and c.opturl <> '...' and b.optreq is not null
;

/*==============================================================*/
/* View: v_hi_unitinfo                                          */
/*==============================================================*/
create or replace view v_hi_unitinfo as
  select b.topunitcode as topunitcode, a.unitcode,a.unittype, a.parentunit, a.isvalid,
    a.unitname,a.unitdesc,a.unitshortname,a.addrbookid,a.unitorder,
    a.unitword,a.unitgrade, b.hi_level,b.UnitPath
  from f_unitinfo a,
    (select level as hi_level,
       unitcode,
            CONNECT_BY_ROOT unitcode as topunitcode,
            SYS_CONNECT_BY_PATH(unitcode, '/') UnitPath
     from f_unitinfo t
     connect by prior unitcode = parentunit) b
  where a.unitcode = b.unitcode
;

comment on table v_hi_unitinfo is
'�¼����ſ���ͨ�����
select * from v_hi_unitinfo
where topunitcode = ''������������ȡ''
order by topunitcode,hi_level
��Ҫ��ͼ
';

comment on column v_hi_unitinfo.unittype is
'��������/ �ʵ�滮/���/��������';

comment on column v_hi_unitinfo.isvalid is
'T:��Ч F:��Ч';

/*==============================================================*/
/* View: v_opt_tree                                             */
/*==============================================================*/
create or replace view v_opt_tree as
  select
    MENU_ID,
    PARENT_ID,
    MENU_NAME,
    ORDERIND
  from
    (select i.optid as MENU_ID,i.preoptid as PARENT_ID,i.optname as MENU_NAME,i.orderind
     from f_optinfo i where i.isintoolbar ='Y')
  union all
  (select d.optcode as MENU_ID,d.optid as PARENT_ID,d.optname as MENU_NAME,0 as orderind
   from f_optdef d)
  order by
    orderind ASC
;




