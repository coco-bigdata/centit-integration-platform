DROP TABLE IF EXISTS f_mysql_sequence;  
  

CREATE TABLE  f_mysql_sequence (
  name varchar(50) NOT NULL,  
  currvalue int(11) NOT NULL,  
  increment int(11) NOT NULL DEFAULT '1',  
   primary key (name)
) ;
  
  



INSERT INTO f_mysql_sequence (name, currvalue , increment) VALUES    
('S_MSGCODE', 0, 1);

INSERT INTO f_mysql_sequence (name, currvalue , increment) VALUES    
('S_RECIPIENT', 0, 1);

INSERT INTO f_mysql_sequence (name, currvalue , increment) VALUES    
('S_UNITCODE', 0, 1);

INSERT INTO f_mysql_sequence (name, currvalue , increment) VALUES    
('S_USERCODE', 0, 1);

INSERT INTO f_mysql_sequence (name, currvalue , increment) VALUES    
('S_USER_UNIT_ID', 0, 1);

INSERT INTO f_mysql_sequence (name, currvalue , increment) VALUES    
('S_ADDRESSID', 0, 1);

INSERT INTO f_mysql_sequence (name, currvalue , increment) VALUES    
('S_OPTDEFCODE', 0, 1);

INSERT INTO f_mysql_sequence (name, currvalue , increment) VALUES    
('S_SYS_LOG', 0, 1);


drop table if exists F_ADDRESS_BOOK;

drop table if exists F_DATACATALOG;

drop table if exists F_DATADICTIONARY;

drop table if exists F_OPTDATASCOPE;

drop table if exists F_OPTDEF;

drop table if exists F_OPT_LOG;

drop table if exists F_OptFlowNoInfo;

drop table if exists F_OptFlowNoPool;

drop table if exists F_OptInfo;

drop table if exists F_OptInfoData;

drop table if exists F_QUERY_FILTER_CONDITION;

drop table if exists F_RANKGRANT;

drop table if exists F_ROLEINFO;

drop table if exists F_ROLEPOWER;

drop table if exists F_STAT_MONTH;

drop table if exists F_SYS_NOTIFY;

drop table if exists F_UNITINFO;

drop table if exists F_USERINFO;

drop table if exists F_USERROLE;

drop table if exists F_USERSETTING;

drop table if exists F_USERUNIT;

drop table if exists F_USER_FAVORITE;

drop table if exists F_USER_QUERY_FILTER;

drop table if exists F_WORK_CLASS;

drop table if exists F_WORK_DAY;

drop table if exists M_InnerMsg;

drop table if exists M_InnerMsg_Recipient;

drop table if exists M_MsgAnnex;

drop table if exists P_TASK_LIST;

/*==============================================================*/
/* Table: F_ADDRESS_BOOK                                        */
/*==============================================================*/
create table F_ADDRESS_BOOK
(
   ADDRBOOKID           numeric(10,0) not null,
   BodyType             varchar(2) not null comment '�û�/����/��λ',
   BodyCode             varchar(16) not null comment '�û�/����/��λ ���',
   representation       varchar(200),
   UnitName             varchar(200),
   DeptName             varchar(100),
   RankName             varchar(50),
   Email                varchar(60),
   Email2               varchar(60),
   Email3               varchar(60),
   HomePage             varchar(100),
   QQ                   varchar(20),
   MSN                  varchar(60),
   wangwang             varchar(20),
   buzPhone             varchar(20),
   buzphone2            varchar(20),
   buzfax               varchar(20),
   assiphone            varchar(20),
   callbacphone         varchar(20),
   carphone             varchar(20),
   unitphone            varchar(20),
   homephone            varchar(20),
   homephone2           varchar(20),
   homephone3           varchar(20),
   homefax              varchar(20),
   mobilephone          varchar(20),
   mobilephone2         varchar(20),
   mobilephone3         varchar(20),
   unitzip              varchar(8),
   unitProvince         varchar(20),
   unitCity             varchar(20),
   unitDistrict         varchar(20),
   unitStreet           varchar(20),
   unitAddress          varchar(60),
   homezip              varchar(8),
   homeProvince         varchar(20),
   homeCity             varchar(20),
   homeDistrict         varchar(20),
   homeStreet           varchar(20),
   homeAddress          varchar(60),
   home2zip             varchar(8),
   home2Province        varchar(20),
   home2City            varchar(20),
   home2District        varchar(20),
   home2Street          varchar(20),
   home2Address         varchar(60),
   inuseAddress         varchar(1) comment '��λ/סլ/סլ2',
   SearchString         varchar(1000) comment 'ǰ������ֶε���������ĸ������ ���ӵĴ�',
   memo                 varchar(500),
   LastModifyDate       datetime,
   CreateDate           datetime
);

alter table F_ADDRESS_BOOK comment 'ϵͳ��ά��һ��ͳһ��ͨѶ¼ ģ�飬��ҪĿ����Ϊ���Ժ��� ͳһ�Ľӿڣ�

���磺
  ';

alter table F_ADDRESS_BOOK
   add primary key (ADDRBOOKID);

/*==============================================================*/
/* Table: F_DATACATALOG                                         */
/*==============================================================*/
create table F_DATACATALOG
(
   CATALOG_CODE         varchar(16) not null,
   CATALOG_NAME         varchar(64) not null,
   CATALOG_STYLE        char(1) not null comment 'F : ��ܹ��е� U:�û� S��ϵͳ  G����',
   CATALOG_TYPE         char(1) not null comment 'T����״��� L:�б�
            ',
   CATALOG_DESC         varchar(256),
   Field_Desc           varchar(1024) comment '�ֶ���������ͬ�ֶ��÷ֺŸ���',
   update_Date          datetime,
   Create_Date          datetime,
   opt_ID               varchar(16) comment 'ҵ����࣬ʹ�������ֵ�DICTIONARYTYPE������',
   need_Cache           char(1) default '1',
   creator              varchar(32),
   updator              varchar(32)
);

alter table F_DATACATALOG comment '���״̬	 U:�û� S��ϵͳ��G����
�����ʽ  T����״��� L:�б�
';

alter table F_DATACATALOG
   add primary key (CATALOG_CODE);

/*==============================================================*/
/* Table: F_DATADICTIONARY                                      */
/*==============================================================*/
create table F_DATADICTIONARY
(
   CATALOG_CODE         varchar(16) not null,
   DATA_CODE            varchar(16) not null,
   EXTRA_CODE           varchar(16) comment '�����ֵ�ĸ������',
   EXTRA_CODE2          varchar(16) comment 'Ĭ�ϵ������ֶ�',
   DATA_TAG             char(1) comment 'N������D��ͣ�ã��û������Խ�������ֶ�',
   DATA_VALUE           varchar(2048),
   DATA_STYLE           char(1) comment 'F : ��ܹ��е� U:�û� S��ϵͳ  G����',
   DATA_DESC            varchar(256),
   Last_Modify_Date     datetime,
   Create_Date          datetime,
   DATA_ORDER           numeric(6,0) comment '�����ֶ�'
);

alter table F_DATADICTIONARY comment '�����ֵ䣺���һЩ�������� ���������ʾ��Ϣ������һЩ ���������ƵĶ�Ӧ������ ״̬����ɫ����ͷ�� �ȵ�
';

alter table F_DATADICTIONARY
   add primary key (CATALOG_CODE, DATA_CODE);

/*==============================================================*/
/* Table: F_OPTDATASCOPE                                        */
/*==============================================================*/
create table F_OPTDATASCOPE
(
   opt_Scope_Code       varchar(16) not null,
   Opt_ID               varchar(16),
   scope_Name           varchar(64),
   Filter_Condition     varchar(1024) comment '������䣬�����еĲ��� [mt] ҵ��� [uc] �û����� [uu] �û���������',
   scope_Memo           varchar(1024) comment '����Ȩ��˵��',
   Filter_Group         varchar(16) default 'G'
);

alter table F_OPTDATASCOPE
   add primary key (opt_Scope_Code);

/*==============================================================*/
/* Table: F_OPTDEF                                              */
/*==============================================================*/
create table F_OPTDEF
(
   OPT_CODE             varchar(32) not null,
   Opt_ID               varchar(32),
   OPT_NAME             varchar(100),
   OPT_METHOD           varchar(50) comment '�������� ����',
   OPT_URL              varchar(256),
   OPT_DESC             varchar(256),
   opt_Order            numeric(4,0),
   Is_In_Workflow       char(1) comment '�Ƿ�Ϊ���̲������� F������  T �� ��',
   update_Date          datetime,
   Create_Date          datetime,
   OPT_REQ              varchar(8),
   creator              varchar(32),
   updator              varchar(32)
);

alter table F_OPTDEF
   add primary key (OPT_CODE);

/*==============================================================*/
/* Table: F_OPT_LOG                                             */
/*==============================================================*/
create table F_OPT_LOG
(
   log_Id               numeric(12,0) not null,
   log_Level            varchar(2) not null,
   user_code            varchar(8) not null,
   opt_time             datetime not null,
   Opt_Content          varchar(1000) not null comment '��������',
   New_Value            text comment '��ֵ',
   Old_Value            text comment 'ԭֵ',
   Opt_ID               varchar(64) not null comment 'ģ�飬���߱�',
   OPT_Method           varchar(64) comment '�����������ֶ�',
   opt_Tag              varchar(200) comment 'һ�����ڹ�����ҵ������ı�ʶ����������ȵ�'
);

alter table F_OPT_LOG
   add primary key (log_Id);

/*==============================================================*/
/* Table: F_OptFlowNoInfo                                       */
/*==============================================================*/
create table F_OptFlowNoInfo
(
   Owner_Code           varchar(8) not null,
   Code_Code            varchar(16) not null,
   Code_Date            datetime not null default NOW(),
   Cur_No               numeric(6,0) not null default 1,
   Last_Code_Date       datetime,
   Create_Date          datetime,
   Last_Modify_Date     datetime
);

alter table F_OptFlowNoInfo
   add primary key (Owner_Code, Code_Date, Code_Code);

/*==============================================================*/
/* Table: F_OptFlowNoPool                                       */
/*==============================================================*/
create table F_OptFlowNoPool
(
   Owner_Code           varchar(8) not null,
   Code_Code            varchar(16) not null,
   Code_Date            datetime not null default now(),
   Cur_No               numeric(6,0) not null default 1,
   Create_Date          datetime
);

alter table F_OptFlowNoPool
   add primary key (Owner_Code, Code_Date, Code_Code, Cur_No);

/*==============================================================*/
/* Table: F_OptInfo                                             */
/*==============================================================*/
create table F_OptInfo
(
   Opt_ID               varchar(32) not null,
   Opt_Name             varchar(100) not null,
   Pre_Opt_ID           varchar(32) not null,
   opt_Route            varchar(256) comment '��angularjs·��ƥ��',
   opt_url              varchar(256),
   Form_Code            varchar(4),
   Opt_Type             char(1) comment ' S:ʵʩҵ��, O:��ͨҵ��, W:����ҵ��, I :��Ŀҵ��',
   Msg_No               numeric(10,0),
   Msg_Prm              varchar(256),
   Is_In_ToolBar        char(1),
   Img_Index            numeric(10,0),
   Top_Opt_ID           varchar(8),
   Order_Ind            numeric(4,0) comment '���˳��ֻ����ͬһ����ҵ��������',
   FLOW_CODE            varchar(8) comment 'ͬһ�����������Ӧ��ֻ��һ����Ч�İ汾',
   Page_Type            char(1) not null default 'I' comment 'D : DIV I:iFrame',
   Icon                 varchar(512),
   height               numeric(10,0),
   width                numeric(10,0),
   update_Date          datetime,
   Create_Date          datetime,
   creator              varchar(32),
   updator              varchar(32)
);

alter table F_OptInfo
   add primary key (Opt_ID);

/*==============================================================*/
/* Table: F_OptInfoData                                         */
/*==============================================================*/
create table F_OptInfoData
(
   TBCODE               varchar(32) not null,
   OptID                varchar(8) not null,
   LastModifyDate       datetime,
   CreateDate           datetime
);

alter table F_OptInfoData comment 'ҵ��ģ��ͱ��Ƕ�Զ�Ĺ�ϵ,������������Ϊ����Ȩ������ʱ��һ���������';

alter table F_OptInfoData
   add primary key (TBCODE, OptID);

/*==============================================================*/
/* Table: F_QUERY_FILTER_CONDITION                              */
/*==============================================================*/
create table F_QUERY_FILTER_CONDITION
(
   CONDITION_NO         numeric(12,0) not null,
   Table_Class_Name     varchar(64) not null comment '���ݿ��������po������',
   Param_Name           varchar(64) not null comment '������',
   Param_Label          varchar(120) not null comment '�����������ʾ',
   Param_Type           varchar(8) comment '�������ͣ�S �ַ�����L ���֣� N ��С�������ݣ� D ���ڣ� T ʱ����� Y �꣬ M ��',
   Default_Value        varchar(100),
   Filter_Sql           varchar(200) comment '������䣬����ƴװ��sql�����',
   Select_Data_type     char(1) not null default 'N' comment '�������������ݣ� N ��û�У� D �����ֵ�, S ͨ��sql����ã� J json����ֱ�ӻ�ȡ
            ',
   Select_Data_Catalog  varchar(64) comment '�����ֵ�',
   Select_SQL           varchar(1000) comment '�����������ֶε�sql���',
   Select_JSON          varchar(2000) comment 'KEY,Value��ֵ�ԣ�JSON��ʽ'
);

alter table F_QUERY_FILTER_CONDITION
   add primary key (CONDITION_NO);

/*==============================================================*/
/* Table: F_RANKGRANT                                           */
/*==============================================================*/
create table F_RANKGRANT
(
   RANK_grant_ID        numeric(12,0) not null,
   granter              varchar(8) not null,
   UNITCODE             varchar(6) not null,
   UserStation          varchar(4) not null,
   UserRank             varchar(2) not null comment 'RANK ���벻�� 0��ͷ�Ŀ��Խ�������',
   beginDate            datetime not null,
   grantee              varchar(8) not null,
   endDate              datetime,
   grantDesc            varchar(256),
   LastModifyDate       datetime,
   CreateDate           datetime
);

alter table F_RANKGRANT
   add primary key (RANK_grant_ID, UserRank);

/*==============================================================*/
/* Table: F_ROLEINFO                                            */
/*==============================================================*/
create table F_ROLEINFO
(
   ROLE_CODE            varchar(32) not null,
   ROLE_NAME            varchar(64),
   ROLE_TYPE            char(1) not null comment 'SΪϵͳ���ܽ�ɫ I Ϊ��Ŀ��ɫ W��������ɫ',
   UNIT_CODE            varchar(32),
   IS_VALID             char(1) not null,
   ROLE_DESC            varchar(256),
   update_Date          datetime,
   Create_Date          datetime,
   creator              varchar(32),
   updator              varchar(32)
);

alter table F_ROLEINFO
   add primary key (ROLE_CODE);

/*==============================================================*/
/* Table: F_ROLEPOWER                                           */
/*==============================================================*/
create table F_ROLEPOWER
(
   ROLE_CODE            varchar(32) not null,
   OPT_CODE             varchar(32) not null,
   opt_Scope_Codes      varchar(1000) comment '�ö��Ÿ��������ݷ�Χ��ϣ���\all ��ʾȫ����',
   update_Date          datetime,
   Create_Date          datetime,
   creator              varchar(32),
   updator              varchar(32)
);

alter table F_ROLEPOWER
   add primary key (ROLE_CODE, OPT_CODE);

/*==============================================================*/
/* Table: F_STAT_MONTH                                          */
/*==============================================================*/
create table F_STAT_MONTH
(
   YEARMONTH            varchar(6) not null comment 'YYYYMM',
   BeginDay             datetime not null,
   EendDay              datetime not null,
   EndSchedule          char(1) comment '����ֶκ���',
   BeginSchedule        char(1) comment '����ֶκ���'
);

alter table F_STAT_MONTH comment 'OAҵ��ͳ���£������Զ���ͳ���µ���ֹ����';

alter table F_STAT_MONTH
   add primary key (YEARMONTH);

/*==============================================================*/
/* Table: F_SYS_NOTIFY                                          */
/*==============================================================*/
create table F_SYS_NOTIFY
(
   Notify_ID            numeric(12,0) not null,
   Notify_Sender        varchar(100),
   Notify_Receiver      varchar(100) not null,
   Msg_Subject          varchar(200),
   Msg_Content          varchar(2000) not null,
   notice_Type          varchar(100),
   Notify_State         char(1) comment '0 �ɹ��� 1 ʧ�� 2 ���ֳɹ�',
   Error_Msg            varchar(500),
   Notify_Time          datetime,
   opt_Tag              varchar(200) comment 'һ�����ڹ�����ҵ������',
   OPT_Method           varchar(64) comment '�����������ֶ�',
   Opt_ID               varchar(64) not null comment 'ģ�飬���߱�'
);

alter table F_SYS_NOTIFY
   add primary key (Notify_ID);

/*==============================================================*/
/* Table: F_UNITINFO                                            */
/*==============================================================*/
create table F_UNITINFO
(
   UNIT_CODE            varchar(32) not null,
   PARENT_UNIT          varchar(32),
   UNIT_TYPE            char(1) comment '��������/ �ʵ�滮/���/��������',
   IS_VALID             char(1) not null comment 'T:��Ч F:��Ч',
   UNIT_TAG             varchar(100) comment '�û�������ϵͳ����',
   UNIT_NAME            varchar(300) not null,
   english_Name         varchar(300),
   dep_no               varchar(100) comment '��֯�������룺',
   UNIT_DESC            varchar(256),
   ADDRBOOK_ID          numeric(10,0),
   UNIT_SHORT_NAME      varchar(32),
   unit_Word            varchar(100),
   unit_Grade           numeric(4,0),
   unit_Order           numeric(4,0),
   update_Date          datetime,
   Create_Date          datetime,
   extJsonInfo          varchar(1000),
   creator              varchar(32),
   updator              varchar(32),
   UNIT_PATH            varchar(1000),
   UNIT_MANAGER         varchar(32)
);

alter table F_UNITINFO
   add primary key (UNIT_CODE);

/*==============================================================*/
/* Table: F_USERINFO                                            */
/*==============================================================*/
create table F_USERINFO
(
   USER_CODE            varchar(32) not null,
   USER_PIN             varchar(100),
   USER_TYPE            char(1) default 'U' comment '��������/��������/ϵͳ����',
   IS_VALID             char(1) not null comment 'T:��Ч F:��Ч',
   LOGIN_NAME           varchar(100) not null,
   User_Name            varchar(300) not null comment '�ǳ�',
   USER_TAG             varchar(100) comment '���ڵ�����ϵͳ����',
   english_Name         varchar(300),
   USER_DESC            varchar(256),
   Login_Times          numeric(6,0),
   Active_Time          datetime,
   Login_IP             varchar(16),
   ADDRBOOK_ID          numeric(10,0),
   Reg_Email            varchar(60) comment 'ע����Email�������ظ�',
   USER_PWD             varchar(20) comment '�����Ҫ������',
   pwd_Expired_Time     datetime,
   REG_CELL_PHONE       varchar(15),
   ID_CARD_NO           varchar(20),
   primary_Unit         varchar(32),
   user_Word            varchar(100) comment '΢�ź�',
   user_Order           numeric(4,0),
   update_Date          datetime,
   Create_Date          datetime,
   extJsonInfo          varchar(1000),
   creator              varchar(32),
   updator              varchar(32)
);

alter table F_USERINFO
   add primary key (USER_CODE);

/*==============================================================*/
/* Table: F_USERROLE                                            */
/*==============================================================*/
create table F_USERROLE
(
   USER_CODE            varchar(32) not null,
   ROLE_CODE            varchar(32) not null,
   OBTAIN_DATE          datetime not null,
   SECEDE_DATE          datetime,
   CHANGE_DESC          varchar(256),
   update_Date          datetime,
   Create_Date          datetime,
   creator              varchar(32),
   updator              varchar(32)
);

alter table F_USERROLE
   add primary key (USER_CODE, ROLE_CODE);

/*==============================================================*/
/* Table: F_USERSETTING                                         */
/*==============================================================*/
create table F_USERSETTING
(
   USER_CODE            varchar(8) not null comment 'DEFAULT:ΪĬ������
            SYS001~SYS999: Ϊϵͳ���÷���
            ��һ���û���,������ϵͳ��һ�����÷���',
   Param_Code           varchar(16) not null,
   Param_Value          varchar(2048) not null,
   opt_ID               varchar(16) not null,
   Param_Name           varchar(200),
   Create_Date          datetime
);

alter table F_USERSETTING
   add primary key (USER_CODE, Param_Code);

/*==============================================================*/
/* Table: F_USERUNIT                                            */
/*==============================================================*/
create table F_USERUNIT
(
   USER_UNIT_ID         varchar(16) not null,
   UNIT_CODE            varchar(6) not null,
   USER_CODE            varchar(8) not null,
   Is_Primary           char(1) not null default '1' comment 'T��Ϊ���� F����ְ',
   User_Station         varchar(16) not null,
   User_Rank            varchar(2) not null comment 'RANK ���벻�� 0��ͷ�Ŀ��Խ�������',
   Rank_Memo            varchar(256) comment '��ְ��ע',
   USER_ORDER           numeric(8,0) default 0,
   update_Date          datetime,
   Create_Date          datetime,
   creator              varchar(32),
   updator              varchar(32)
);

alter table F_USERUNIT comment 'ͬһ���˿����ڶ�����ŵ��β�ͬ��ְλ';

alter table F_USERUNIT
   add primary key (USER_UNIT_ID);

/*==============================================================*/
/* Table: F_USER_FAVORITE                                       */
/*==============================================================*/
create table F_USER_FAVORITE
(
   USERCODE             varchar(8) not null comment 'DEFAULT:ΪĬ������
            SYS001~SYS999: Ϊϵͳ���÷���
            ��һ���û���,������ϵͳ��һ�����÷���',
   OptID                varchar(16) not null,
   LastModifyDate       datetime,
   CreateDate           datetime
);

alter table F_USER_FAVORITE
   add primary key (USERCODE, OptID);

/*==============================================================*/
/* Table: F_USER_QUERY_FILTER                                   */
/*==============================================================*/
create table F_USER_QUERY_FILTER
(
   FILTER_NO            numeric(12,0) not null,
   user_Code            varchar(8) not null,
   modle_code           varchar(64) not null comment '������Ա���ж��壬�������ظ���������ϵͳ��ģ�������ϵ�ǰ�Ĳ�������',
   filter_name          varchar(200) not null comment '�û����ж��������',
   filter_value         varchar(3200) not null comment '����ֵ��json��ʽ����Ӧһ��map'
);

alter table F_USER_QUERY_FILTER
   add primary key (FILTER_NO);

/*==============================================================*/
/* Table: F_WORK_CLASS                                          */
/*==============================================================*/
create table F_WORK_CLASS
(
   CLASS_ID             numeric(12,0) not null,
   CLASS_NAME           varchar(50) not null,
   SHORT_NAME           varchar(10) not null,
   begin_time           varchar(6) comment '9:00',
   end_time             varchar(6) comment '+4:00 ''+''��ʾ�ڶ���',
   has_break            char(1),
   break_begin_time     varchar(6) comment '9:00',
   break_end_time       varchar(6) comment '+4:00 ''+''��ʾ�ڶ���',
   class_desc           varchar(500),
   record_date          datetime,
   recorder             varchar(8)
);

alter table F_WORK_CLASS comment 'CLASS_ID
 Ϊ 0 �ı�ʾ��Ϣ�����Բ���������г���
 Ϊ 1 ��ΪĬ�ϰ����Ϣ';

alter table F_WORK_CLASS
   add primary key (CLASS_ID);

/*==============================================================*/
/* Table: F_WORK_DAY                                            */
/*==============================================================*/
create table F_WORK_DAY
(
   WorkDay              datetime not null,
   DayType              char(1) not null comment 'A:�����շż٣�B:��ĩ���ݳɹ���ʱ�� C �����ϰ� D�����ݼ�',
   WorkTimeType         varchar(20),
   WorkDayDesc          varchar(255)
);

alter table F_WORK_DAY comment '��������ҵʱ����
A:�����շż� B:��ĩ���ݳɹ���ʱ��  C: �����ϰ�  D:�����ݼ�  
';

alter table F_WORK_DAY
   add primary key (WorkDay);

/*==============================================================*/
/* Table: M_InnerMsg                                            */
/*==============================================================*/
create table M_InnerMsg
(
   Msg_Code             varchar(16) not null comment '��Ϣ�����Զ��壬ͨ��S_M_INNERMSG��������',
   Sender               varchar(128),
   Send_Date            datetime,
   Msg_Title            varchar(128),
   Msg_Type             char(1) comment 'P= ����Ϊ��Ϣ  A= ����Ϊ���棨֪ͨ��
            M=�ʼ�',
   Mail_Type            char(1) comment 'I=�ռ���
            O=������
            D=�ݸ���
            T=�ϼ���
            
            
            ',
   Mail_UnDel_Type      char(1),
   Receive_Name         varchar(2048) comment 'ʹ�ò��ţ��������������м�ʹ��Ӣ�ķֺŷָ�',
   Hold_Users           numeric(8,0) comment '����Ϊ�����˺ͽ�����������ӣ����ͺͽ�����ɾ����Ϣʱ-1��������Ϊ0ʱ����ɾ��������¼
            
            ��Ϣ����Ϊ�ʼ�ʱ����Ҫ����',
   msg_State            char(1) comment 'δ��/�Ѷ�/ɾ��',
   msg_Content          longblob,
   Email_Id             varchar(8) comment '�û����ö�����ʱʹ��',
   Opt_ID               varchar(64) not null comment 'ģ�飬���߱�',
   OPT_Method           varchar(64) comment '�����������ֶ�',
   opt_Tag              varchar(200) comment 'һ�����ڹ�����ҵ������'
);

alter table M_InnerMsg comment '�ڲ���Ϣ�빫��
���ܴ���,  ��ʵ���Զ�������, ��Ϊ�� �ͷ����� �� һ�Զ�Ĺ�ϵ

                               -&#';

alter table M_InnerMsg
   add primary key (Msg_Code);

/*==============================================================*/
/* Table: M_InnerMsg_Recipient                                  */
/*==============================================================*/
create table M_InnerMsg_Recipient
(
   Msg_Code             varchar(16) not null,
   Receive              varchar(8) not null,
   Reply_Msg_Code       int,
   Receive_Type         char(1) comment 'P=����Ϊ��Ϣ
            A=����Ϊ����
            M=�ʼ�',
   Mail_Type            char(1) comment 'T=�ռ���
            C=����
            B=����',
   msg_State            char(1) comment 'δ��/�Ѷ�/ɾ�����ռ�������ʱ������ʾ
            
            U=δ��
            R=�Ѷ�
            D=ɾ��',
   ID                   varchar(16) not null
);

alter table M_InnerMsg_Recipient comment '�ڲ���Ϣ���ʼ����빫���ռ��˼���Ϣ��Ϣ';

alter table M_InnerMsg_Recipient
   add primary key (ID);

/*==============================================================*/
/* Table: M_MsgAnnex                                            */
/*==============================================================*/
create table M_MsgAnnex
(
   Msg_Code             varchar(16) not null,
   Info_Code            varchar(16) not null,
   Msg_Annex_Id         varchar(16) not null
);

alter table M_MsgAnnex
   add primary key (Msg_Annex_Id);

/*==============================================================*/
/* Table: P_TASK_LIST                                           */
/*==============================================================*/
create table P_TASK_LIST
(
   taskid               numeric(12,0) not null comment '�Զ����ɵ���������Ҫһ�����������',
   taskowner            varchar(8) not null comment '˭������',
   tasktag              varchar(1) not null comment '������outlook�е��ʼ���ǣ������ò�ͬ����ɫ������ͼ���ʶ',
   taskrank             varchar(1) not null comment '��������ȼ�',
   taskstatus           varchar(2) not null comment '�����С���ɡ�ȡ������ֹ',
   tasktitle            varchar(256) not null,
   taskmemo             varchar(1000) comment '��Ҫ��������ľ�������',
   tasktype             varchar(8) not null comment '���ˡ���֯����쵼ί�� �ȵ�',
   OptID                varchar(64) not null comment 'ģ�飬���߱�',
   OPTMethod            varchar(64) comment '�����������ֶ�',
   optTag               varchar(200) comment 'һ�����ڹ�����ҵ������',
   creator              varchar(32) not null,
   created              datetime not null,
   planbegintime        datetime not null,
   planendtime          datetime,
   begintime            datetime,
   endtime              datetime,
   finishmemo           varchar(1000) comment '��Ҫ��¼�����ִ�й��̺ͽ��',
   noticeSign           varchar(1) comment '���ѱ�־Ϊ����ֹ���ѡ�δ���ѡ�������',
   lastNoticeTime       datetime comment '���һ������ʱ�䣬�������Ѳ��Կ������Ѷ��',
   taskdeadline         datetime,
   taskvalue            varchar(2048) comment '���ã��ֶβ���ʱʹ��'
);

alter table P_TASK_LIST
   add primary key (taskid);
   
   
   
   
--  ����



DROP FUNCTION IF EXISTS sequence_currval;  

DELIMITER //  
  
CREATE  FUNCTION sequence_currval(seq_name VARCHAR(50)) RETURNS int(11)  
  
    READS SQL DATA  
  
    DETERMINISTIC  
  
BEGIN  
  
DECLARE cur_value INTEGER;  
  
SET cur_value = 0;  
  
SELECT currvalue INTO cur_value FROM f_mysql_sequence WHERE NAME = seq_name;  
  
RETURN cur_value;  
  
END//  
  
DELIMITER ;


DROP FUNCTION IF EXISTS sequence_nextval;  
  
DELIMITER //  
  
CREATE  FUNCTION sequence_nextval(seq_name VARCHAR(50)) RETURNS int(11)  
  
    DETERMINISTIC  
  
BEGIN  
DECLARE cur_value INTEGER;  

UPDATE f_mysql_sequence SET currvalue = currvalue + increment WHERE NAME = seq_name;  
  
SELECT currvalue INTO cur_value FROM f_mysql_sequence WHERE NAME = seq_name;  
  
RETURN cur_value;  
  
END//  
  
DELIMITER ;


DROP FUNCTION IF EXISTS sequence_setval;  
  
DELIMITER //  
  
CREATE  FUNCTION sequence_setval(seq_name VARCHAR(50),seq_value int(11)) RETURNS int(11)  
  
    DETERMINISTIC  
  
BEGIN 

UPDATE f_mysql_sequence SET currvalue = seq_value WHERE NAME = seq_name;  
RETURN seq_value;
END//  
DELIMITER ;  
DROP FUNCTION IF EXISTS calcUnitPath;  
DELIMITER $$


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
      SELECT unit_code INTO sTemp 
         FROM f_unitinfo  
         where unit_code = 
         		(select parent_unit FROM f_unitinfo where unit_code = sTemp);
      until sTemp is null or sTemp='' or sPreTemp = sTemp
   END REPEAT;
  
   RETURN path;
END$$

DELIMITER ;
   
   
-- v_hi_unitinfo��ͼ�ű�

CREATE OR REPLACE VIEW v_hi_unitinfo AS
SELECT a.unit_code AS top_unit_code,  b.unit_code,b.unit_type, b.parent_unit, b.is_valid,     b.unit_name,b.unit_desc,b.unit_short_name,b.addrbook_id,b.unit_order,b.dep_no,
       b.unit_word,b.unit_grade,
       LENGTH(b.Unit_Path)- LENGTH(REPLACE(b.Unit_Path,'/','')) - LENGTH(a.Unit_Path) + LENGTH(REPLACE(a.Unit_Path,'/',''))+1  AS hi_level,
       substr(b.Unit_Path ,  LENGTH(a.Unit_Path)+1) AS Unit_Path
  FROM F_UNITINFO a , F_UNITINFO b
 WHERE b.Unit_Path LIKE CONCAT(a.Unit_Path,'%' );

 
 create or replace view F_V_Opt_Role_Map as
select c.opt_url || b.opt_url as opt_url, b.opt_req, a.role_code, c.opt_id, b.opt_code
  from F_ROLEPOWER a
  join F_OPTDEF b
    on (a.opt_code = b.opt_code)
  join F_OptInfo c
    on (b.opt_id = c.opt_id)
 where c.Opt_Type <> 'W'
   and c.opt_url <> '...'
 order by c.opt_url, b.opt_req, a.role_code;
/*==============================================================*/
/* View: F_V_USERROLES                                          */
/*==============================================================*/
create or replace view F_V_USERROLES as
select distinct b.ROLE_CODE,b.ROLE_NAME,b.IS_VALID,b.ROLE_DESC,b.CREATE_DATE,b.UPDATE_DATE ,a.user_code
    from F_USERROLE a join F_ROLEINFO b on (a.ROLE_CODE=b.ROLE_CODE)
    where a.OBTAIN_DATE <=  now() and (a.SECEDE_DATE is null or a.SECEDE_DATE > now()) and b.IS_VALID='T'
union all
  select d.ROLE_CODE,d.ROLE_NAME,d.IS_VALID,d.ROLE_DESC,d.CREATE_DATE,d.UPDATE_DATE , c.user_code
   from F_USERINFO c , F_ROLEINFO d
   where d.role_code = 'G-public';

/*==============================================================*/
/* View: F_V_UserOptDataScopes                                  */
/*==============================================================*/
create or replace view F_V_UserOptDataScopes as
select  distinct a.User_Code, c. OPT_ID ,  c.OPT_METHOD , b.opt_Scope_Codes
from F_V_USERROLES a  join F_ROLEPOWER   b on (a.Role_Code=b.Role_Code)
         join F_OPTDEF  c on(b.OPT_CODE=c.OPT_CODE);
/*==============================================================*/
/* View: F_V_UserOptList                                        */
/*==============================================================*/
create or replace view F_V_UserOptList as
select  distinct a.User_Code,  c.OPT_CODE,  c.OPT_NAME  ,  c. OPT_ID ,  c.OPT_METHOD
from F_V_USERROLES a  join F_ROLEPOWER   b on (a.Role_Code=b.Role_Code)
         join F_OPTDEF  c on(b.OPT_CODE=c.OPT_CODE);

/*==============================================================*/
/* View: F_V_UserOptMoudleList                                  */
/*==============================================================*/

create or replace view f_v_useroptmoudlelist as
select  distinct a.User_Code,d.Opt_ID, d.Opt_Name , d.Pre_Opt_ID  ,
            d.Form_Code  , d.opt_url, d.opt_route, d.Msg_No , d.Msg_Prm, d.Is_In_ToolBar ,
            d.Img_Index,d.Top_Opt_ID ,d.Order_Ind,d.Page_Type,d.opt_type
from F_V_USERROLES a  join F_ROLEPOWER b on (a.Role_Code=b.Role_Code)
         join F_OPTDEF  c on(b.OPT_CODE=c.OPT_CODE)
        join F_OptInfo d on(c.OPT_ID=d.Opt_ID)
where d.opt_url<>'...';

/*==============================================================*/
/* View: f_v_optdef_url_map                                     */
/*==============================================================*/
create or replace view f_v_optdef_url_map as
select concat(`c`.`opt_url`,`b`.`OPT_URL`) as opt_def_url, b.opt_req, b.opt_code
from F_OPTDEF b join F_OptInfo c
    on (b.opt_id = c.opt_id)
 where c.Opt_Type <> 'W'
   and c.opt_url <> '...' and b.opt_req is not null;

/*==============================================================*/
/* View: v_opt_tree                                             */
/*==============================================================*/
create or replace view v_opt_tree as
   select i.opt_id as MENU_ID,i.pre_opt_id as PARENT_ID,i.opt_name as MENU_NAME,i.order_ind 
   from F_OptInfo i where i.is_in_toolbar ='Y'
   union all 
   select d.opt_code as MENU_ID,d.opt_id as PARENT_ID,d.opt_name as MENU_NAME,0 as order_ind 
   from F_OPTDEF d
;




