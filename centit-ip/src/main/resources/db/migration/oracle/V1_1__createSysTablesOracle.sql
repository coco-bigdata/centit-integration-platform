create sequence S_Filter_No;
create sequence s_notify_id;
create sequence s_optdefcode ;
create sequence s_sys_log;
create sequence s_unitcode;
create sequence s_user_unit_id;
create sequence s_usercode;
create sequence S_MSGCODE ;
create sequence S_RECIPIENT ;
create sequence S_ADDRESSID ;

create table F_ADDRESS_BOOK
( 
   ADDRBOOKID           number(10,0) not null,
   BodyType             varchar2(2) not null ,
   BodyCode             varchar2(16) not null ,
   representation       varchar2(200),
   UnitName             varchar2(200),
   DeptName             varchar2(100),
   RankName             varchar2(50),
   Email                varchar2(60),
   Email2               varchar2(60),
   Email3               varchar2(60),
   HomePage             varchar2(100),
   QQ                   varchar2(20),
   MSN                  varchar2(60),
   wangwang             varchar2(20),
   buzPhone             varchar2(20),
   buzphone2            varchar2(20),
   buzfax               varchar2(20),
   assiphone            varchar2(20),
   callbacphone         varchar2(20),
   carphone             varchar2(20),
   unitphone            varchar2(20),
   homephone            varchar2(20),
   homephone2           varchar2(20),
   homephone3           varchar2(20),
   homefax              varchar2(20),
   mobilephone          varchar2(20),
   mobilephone2         varchar2(20),
   mobilephone3         varchar2(20),
   unitzip              varchar2(8),
   unitProvince         varchar2(20),
   unitCity             varchar2(20),
   unitDistrict         varchar2(20),
   unitStreet           varchar2(20),
   unitAddress          varchar2(60),
   homezip              varchar2(8),
   homeProvince         varchar2(20),
   homeCity             varchar2(20),
   homeDistrict         varchar2(20),
   homeStreet           varchar2(20),
   homeAddress          varchar2(60),
   home2zip             varchar2(8),
   home2Province        varchar2(20),
   home2City            varchar2(20),
   home2District        varchar2(20),
   home2Street          varchar2(20),
   home2Address         varchar2(60),
   inuseAddress         varchar2(1)  ,
   SearchString         varchar2(1000)  ,
   memo                 varchar2(500),
   LastModifyDate       date,
   CreateDate           date
);
comment on column F_ADDRESS_BOOK.BodyType is '�û�/����/��λ';
comment on column F_ADDRESS_BOOK.BodyCode is ' �û�/����/��λ ���';
comment on column F_ADDRESS_BOOK.inuseAddress is '��λ/סլ/סլ2';
comment on column F_ADDRESS_BOOK.SearchString is 'ǰ������ֶε���������ĸ������ ���ӵĴ�';
comment on  table F_ADDRESS_BOOK is 'ϵͳ��ά��һ��ͳһ��ͨѶ¼ ģ�飬��ҪĿ����Ϊ���Ժ��� ͳһ�Ľӿڣ����磺';

alter table F_ADDRESS_BOOK add primary key (ADDRBOOKID);

create table F_DATACATALOG
(
   CATALOG_CODE         varchar2(16) not null,
   CATALOG_NAME         varchar2(64) not null,
   CATALOG_STYLE        char(1) not null ,
   CATALOG_TYPE         char(1) not null  ,
   CATALOG_DESC         varchar2(256),
   Field_Desc           varchar2(1024) ,
   update_Date          date,
   Create_Date          date,
   opt_ID               varchar2(16) ,
   need_Cache           char(1) default '1',
   creator              varchar2(32),
   updator              varchar2(32)
);
comment on  table  F_DATACATALOG is '���״̬   U:�û� S��ϵͳ��G���������ʽ  T����״��� L:�б�';
comment on column F_DATACATALOG.CATALOG_STYLE is  'F : ��ܹ��е� U:�û� S��ϵͳ  G����';
comment on column F_DATACATALOG.CATALOG_TYPE is 'T����״��� L:�б�';
comment on column F_DATACATALOG.Field_Desc is  '�ֶ���������ͬ�ֶ��÷ֺŸ���';
comment on column F_DATACATALOG.opt_ID is  'ҵ����࣬ʹ�������ֵ�DICTIONARYTYPE������';
alter table F_DATACATALOG add primary key (CATALOG_CODE);

create table F_DATADICTIONARY
(
   CATALOG_CODE         varchar2(16) not null,
   DATA_CODE            varchar2(16) not null,
   EXTRA_CODE           varchar2(16)  ,
   EXTRA_CODE2          varchar2(16) ,
   DATA_TAG             char(1) ,
   DATA_VALUE           varchar2(2048),
   DATA_STYLE           char(1) ,
   DATA_DESC            varchar2(256),
   Last_Modify_Date     date,
   Create_Date          date,
   DATA_ORDER           number(6,0) 
);
comment on column F_DATADICTIONARY.EXTRA_CODE is  '�����ֵ�ĸ������' ;
comment on column F_DATADICTIONARY.DATA_TAG is    'N������D��ͣ�ã��û������Խ�������ֶ�';
comment on column F_DATADICTIONARY.DATA_STYLE is   'F : ��ܹ��е� U:�û� S��ϵͳ  G����' ;
  comment on table F_DATADICTIONARY is'�����ֵ䣺���һЩ�������� ���������ʾ��Ϣ������һЩ ���������ƵĶ�Ӧ������ ״̬����ɫ����ͷ�� �ȵ�';

alter table F_DATADICTIONARY add primary key (CATALOG_CODE, DATA_CODE);

create table F_OPTDATASCOPE
(
   opt_Scope_Code       varchar2(16) not null,
   Opt_ID               varchar2(16),
   scope_Name           varchar2(64),
   Filter_Condition     varchar2(1024)  ,
   scope_Memo           varchar2(1024)  ,
   Filter_Group         varchar2(16) default 'G'
);
comment on column F_OPTDATASCOPE.Filter_Condition is '������䣬�����еĲ��� [mt] ҵ��� [uc] �û����� [uu] �û���������';
comment on column F_OPTDATASCOPE.scope_Memo is '����Ȩ��˵��';
alter table F_OPTDATASCOPE add primary key (opt_Scope_Code);

create table F_OPTDEF
(
   OPT_CODE             varchar2(32) not null,
   Opt_ID               varchar2(32),
   OPT_NAME             varchar2(100),
   OPT_METHOD           varchar2(50)  ,
   OPT_URL              varchar2(256),
   OPT_DESC             varchar2(256),
   opt_Order            number(4,0),
   Is_In_Workflow       char(1)  ,
   update_Date          date,
   Create_Date          date,
   OPT_REQ              varchar2(8),
   creator              varchar2(32),
   updator              varchar2(32)
);
comment on column F_OPTDEF.OPT_METHOD is '�������� ����'  ;
comment on column F_OPTDEF.Is_In_Workflow is '�Ƿ�Ϊ���̲������� F������  T �� ��'  ;
alter table F_OPTDEF add primary key (OPT_CODE);


create table F_OPT_LOG
(
   log_Id               number(12,0) not null,
   log_Level            varchar2(2) not null,
   user_code            varchar2(8) not null,
   opt_time             date not null,
   Opt_Content          varchar2(1000) not null  ,
   New_Value            clob ,
   Old_Value            clob ,
   Opt_ID               varchar2(64) not null  ,
   OPT_Method           varchar2(64)  ,
   opt_Tag              varchar2(200)  
);
comment on column F_OPT_LOG.Opt_ID is  'ģ�飬���߱�';
comment on column F_OPT_LOG.Opt_ID is  '�����������ֶ�';
comment on column F_OPT_LOG.Opt_ID is  'һ�����ڹ�����ҵ������ı�ʶ����������ȵ�';
alter table F_OPT_LOG  add primary key (log_Id);

create table F_OptFlowNoInfo
(
   Owner_Code           varchar2(8) not null,
   Code_Code            varchar2(16) not null,
   Code_Date            date default sysdate   not null  ,
   Cur_No               number(6,0) default 1 not null ,
   Last_Code_Date       date,
   Create_Date          date,
   Last_Modify_Date     date
);
alter table F_OptFlowNoInfo add primary key (Owner_Code, Code_Date, Code_Code);

create table F_OptFlowNoPool
(
   Owner_Code           varchar2(8) not null,
   Code_Code            varchar2(16) not null,
   Code_Date            date default sysdate not null ,
   Cur_No               number(6,0)  default 1 not null,
   Create_Date          date
);
alter table F_OptFlowNoPool add primary key (Owner_Code, Code_Date, Code_Code, Cur_No);

create table F_OptInfo
(
   Opt_ID               varchar2(32) not null,
   Opt_Name             varchar2(100) not null,
   Pre_Opt_ID           varchar2(32) not null,
   opt_Route            varchar2(256)  ,
   opt_url              varchar2(256),
   Form_Code            varchar2(4),
   Opt_Type             char(1)  ,
   Msg_No               number(10,0),
   Msg_Prm              varchar2(256),
   Is_In_ToolBar        char(1),
   Img_Index            number(10,0),
   Top_Opt_ID           varchar2(8),
   Order_Ind            number(4,0) ,
   FLOW_CODE            varchar2(8) ,
   Page_Type            char(1)  default 'I' ,
   Icon                 varchar2(512),
   height               number(10,0),
   width                number(10,0),
   update_Date          date,
   Create_Date          date,
   creator              varchar2(32),
   updator              varchar2(32)
);
comment on column F_OptInfo.opt_Route is    '��angularjs·��ƥ��'  ;
comment on column F_OptInfo.Opt_Type is    ' S:ʵʩҵ��, O:��ͨҵ��, W:����ҵ��, I :��Ŀҵ��'  ;
comment on column F_OptInfo.Order_Ind is     '���˳��ֻ����ͬһ����ҵ��������'  ;
comment on column F_OptInfo.Page_Type is    'D : DIV I:iFrame'   ;
alter table F_OptInfo add primary key (Opt_ID);

create table F_OptInfoData
(
   TBCODE               varchar2(32) not null,
   OptID                varchar2(8) not null,
   LastModifyDate       date,
   CreateDate           date
);

comment on table F_OptInfoData is 'ҵ��ģ��ͱ��Ƕ�Զ�Ĺ�ϵ,������������Ϊ����Ȩ������ʱ��һ���������';
alter table F_OptInfoData  add primary key (TBCODE, OptID);

create table F_QUERY_FILTER_CONDITION
(
   CONDITION_NO         number(12,0) not null,
   Table_Class_Name     varchar2(64) not null  ,
   Param_Name           varchar2(64) not null ,
   Param_Label          varchar2(120) not null ,
   Param_Type      varchar2(8) ,
   Default_Value        varchar2(100),
   Filter_Sql           varchar2(200) ,
   Select_Data_type     char(1)  default 'N' not null ,
   Select_Data_Catalog  varchar2(64) ,
   Select_SQL           varchar2(1000)  ,
   Select_JSON          varchar2(2000)  
);
comment on column F_QUERY_FILTER_CONDITION.Table_Class_Name is  '���ݿ��������po������'     ;
comment on column F_QUERY_FILTER_CONDITION.Param_Type is    '�������ͣ�S �ַ�����L ���֣� N ��С�������ݣ� D ���ڣ� T ʱ����� Y �꣬ M ��'    ;
comment on column F_QUERY_FILTER_CONDITION.Filter_Sql is    '������䣬����ƴװ��sql�����'    ;
comment on column F_QUERY_FILTER_CONDITION.Select_Data_type is  '�������������ݣ� N ��û�У� D �����ֵ�, S ͨ��sql����ã� J json����ֱ�ӻ�ȡ '      ;
comment on column F_QUERY_FILTER_CONDITION.Select_SQL is     '�����������ֶε�sql���'  ;
comment on column F_QUERY_FILTER_CONDITION.Select_JSON is   'KEY,Value��ֵ�ԣ�JSON��ʽ'    ;
alter table F_QUERY_FILTER_CONDITION add primary key (CONDITION_NO);

create table F_RANKGRANT
(
   RANK_grant_ID        number(12,0) not null,
   granter              varchar2(8) not null,
   UNITCODE             varchar2(6) not null,
   UserStation          varchar2(4) not null,
   UserRank             varchar2(2) not null ,
   beginDate            date not null,
   grantee              varchar2(8) not null,
   endDate              date,
   grantDesc            varchar2(256),
   LastModifyDate       date,
   CreateDate           date
);
comment on column F_RANKGRANT.UserRank is  'RANK ���벻�� 0��ͷ�Ŀ��Խ�������';
alter table F_RANKGRANT add primary key (RANK_grant_ID, UserRank);

create table F_ROLEINFO
(
   ROLE_CODE            varchar2(32) not null,
   ROLE_NAME            varchar2(64),
   ROLE_TYPE            char(1) not null ,
   UNIT_CODE            varchar2(32),
   IS_VALID             char(1) not null,
   ROLE_DESC            varchar2(256),
   update_Date          date,
   Create_Date          date,
   creator              varchar2(32),
   updator              varchar2(32)
);
comment on column F_ROLEINFO.ROLE_TYPE is  'SΪϵͳ���ܽ�ɫ I Ϊ��Ŀ��ɫ W��������ɫ';
alter table F_ROLEINFO add primary key (ROLE_CODE);

create table F_ROLEPOWER
(
   ROLE_CODE            varchar2(32) not null,
   OPT_CODE             varchar2(32) not null,
   opt_Scope_Codes      varchar2(1000) ,
   update_Date          date,
   Create_Date          date,
   creator              varchar2(32),
   updator              varchar2(32)
);
comment on column F_ROLEPOWER.opt_Scope_Codes is  '�ö��Ÿ��������ݷ�Χ��ϣ���\all ��ʾȫ����';
alter table F_ROLEPOWER add primary key (ROLE_CODE, OPT_CODE);

create table F_STAT_MONTH
(
   YEARMONTH            varchar2(6) not null ,
   BeginDay             date not null,
   EendDay              date not null,
   EndSchedule          char(1) ,
   BeginSchedule        char(1) 
);
comment on table F_STAT_MONTH  is'OAҵ��ͳ���£������Զ���ͳ���µ���ֹ����';
alter table F_STAT_MONTH add primary key (YEARMONTH);

create table F_SYS_NOTIFY
(
   Notify_ID            number(12,0) not null,
   Notify_Sender        varchar2(100),
   Notify_Receiver      varchar2(100) not null,
   Msg_Subject          varchar2(200),
   Msg_Content          varchar2(2000) not null,
   notice_Type          varchar2(100),
   Notify_State         char(1)  ,
   Error_Msg            varchar2(500),
   Notify_Time          date,
   opt_Tag              varchar2(200)  ,
   OPT_Method           varchar2(64)  ,
   Opt_ID               varchar2(64) not null  
);
comment on column F_SYS_NOTIFY.Notify_State is '0 �ɹ��� 1 ʧ�� 2 ���ֳɹ�'  ;
comment on column F_SYS_NOTIFY.opt_Tag is  'һ�����ڹ�����ҵ������' ;
comment on column F_SYS_NOTIFY.OPT_Method is '�����������ֶ�'  ;
comment on column F_SYS_NOTIFY.Opt_ID is  'ģ�飬���߱�' ;
alter table F_SYS_NOTIFY add primary key (Notify_ID);

create table F_UNITINFO
(
   UNIT_CODE            varchar2(32) not null,
   PARENT_UNIT          varchar2(32),
   UNIT_TYPE            char(1) ,
   IS_VALID             char(1) not null ,
   UNIT_TAG             varchar2(100)  ,
   UNIT_NAME            varchar2(300) not null,
   english_Name         varchar2(300),
   dep_no               varchar2(100)  ,
   UNIT_DESC            varchar2(256),
   ADDRBOOK_ID          number(10,0),
   UNIT_SHORT_NAME      varchar2(32),
   unit_Word            varchar2(100),
   unit_Grade           number(4,0),
   unit_Order           number(4,0),
   update_Date          date,
   Create_Date          date,
   extJsonInfo          varchar2(1000),
   creator              varchar2(32),
   updator              varchar2(32),
   UNIT_PATH            varchar2(1000),
   UNIT_MANAGER         varchar2(32)
);
comment on column F_UNITINFO.UNIT_TYPE   is     '��������/ �ʵ�滮/���/��������'        ;
comment on column F_UNITINFO.  UNIT_TAG is        '�û�������ϵͳ����'    ;
comment on column F_UNITINFO. dep_no  is      '��֯�������룺'      ;
alter table F_UNITINFO add primary key (UNIT_CODE);

create table F_USERINFO
(
   USER_CODE            varchar2(32) not null,
   USER_PIN             varchar2(100),
   USER_TYPE            char(1) default 'U'  ,
   IS_VALID             char(1) not null ,
   LOGIN_NAME           varchar2(100) not null,
   User_Name            varchar2(300) not null ,
   USER_TAG             varchar2(100) ,
   english_Name         varchar2(300),
   USER_DESC            varchar2(256),
   Login_Times          number(6,0),
   Active_Time          date,
   Login_IP             varchar2(16),
   ADDRBOOK_ID          number(10,0),
   Reg_Email            varchar2(60) ,
   USER_PWD             varchar2(20) ,
   pwd_Expired_Time     date,
   REG_CELL_PHONE       varchar2(15),
   ID_CARD_NO           varchar2(20),
   primary_Unit         varchar2(32),
   user_Word            varchar2(100)  ,
   user_Order           number(4,0),
   update_Date          date,
   Create_Date          date,
   extJsonInfo          varchar2(1000),
   creator              varchar2(32),
   updator              varchar2(32)
);
comment on column F_USERINFO.    USER_TYPE   is     '��������/��������/ϵͳ����'    ;
comment on column F_USERINFO.   Reg_Email    is       'ע����Email�������ظ�'   ;
comment on column F_USERINFO.   user_Word    is    '΢�ź�'     ;
alter table F_USERINFO add primary key (USER_CODE);

create table F_USERROLE
(
   USER_CODE            varchar2(32) not null,
   ROLE_CODE            varchar2(32) not null,
   OBTAIN_DATE          date not null,
   SECEDE_DATE          date,
   CHANGE_DESC          varchar2(256),
   update_Date          date,
   Create_Date          date,
   creator              varchar2(32),
   updator              varchar2(32)
);
alter table F_USERROLE add primary key (USER_CODE, ROLE_CODE);

create table F_USERSETTING
(
   USER_CODE            varchar2(32) not null ,
   Param_Code           varchar2(32) not null,
   Param_Value          varchar2(2048) not null,
   opt_ID               varchar2(16) not null,
   Param_Name           varchar2(200),
   Create_Date          date
);
comment on column F_USERSETTING.USER_CODE is  'DEFAULT:ΪĬ������
            SYS001~SYS999: Ϊϵͳ���÷���
            ��һ���û���,������ϵͳ��һ�����÷���';
alter table F_USERSETTING add primary key (USER_CODE, Param_Code);

create table F_USERUNIT
(
   USER_UNIT_ID         varchar2(32) not null,
   UNIT_CODE            varchar2(32) not null,
   USER_CODE            varchar2(32) not null,
   Is_Primary           char(1)  default '1' not null ,
   User_Station         varchar2(16) not null,
   User_Rank            varchar2(16) not null  ,
   Rank_Memo            varchar2(256)  ,
   USER_ORDER           number(8,0) default 0,
   update_Date          date,
   Create_Date          date,
   creator              varchar2(32),
   updator              varchar2(32)
);
comment on column F_USERUNIT. Is_Primary  is  'T��Ϊ���� F����ְ' ;
comment on column F_USERUNIT. User_Rank  is  'RANK ���벻�� 0��ͷ�Ŀ��Խ�������';
comment on column F_USERUNIT.  Rank_Memo is '��ְ��ע' ;
comment on table F_USERUNIT is 'ͬһ���˿����ڶ�����ŵ��β�ͬ��ְλ';
alter table F_USERUNIT add primary key (USER_UNIT_ID);

create table F_USER_FAVORITE
(
   USERCODE             varchar2(8) not null ,
   OptID                varchar2(16) not null,
   LastModifyDate       date,
   CreateDate           date
);
alter table F_USER_FAVORITE add primary key (USERCODE, OptID);

create table F_USER_QUERY_FILTER
(
   FILTER_NO            number(12,0) not null,
   user_Code            varchar2(8) not null,
   modle_code           varchar2(64) not null  ,
   filter_name          varchar2(200) not null ,
   filter_value         varchar2(3200) not null  
);
comment on column F_USER_QUERY_FILTER. modle_code is '������Ա���ж��壬�������ظ���������ϵͳ��ģ�������ϵ�ǰ�Ĳ�������'  ;
comment on column F_USER_QUERY_FILTER.  filter_name is   '�û����ж��������' ;
comment on column F_USER_QUERY_FILTER. filter_value is  '����ֵ��json��ʽ����Ӧһ��map' ;
alter table F_USER_QUERY_FILTER add primary key (FILTER_NO);

create table F_WORK_CLASS
(
   CLASS_ID             number(12,0) not null,
   CLASS_NAME           varchar2(50) not null,
   SHORT_NAME           varchar2(10) not null,
   begin_time           varchar2(6)  ,
   end_time             varchar2(6)  ,
   has_break            char(1),
   break_begin_time     varchar2(6) ,
   break_end_time       varchar2(6) ,
   class_desc           varchar2(500),
   record_date          date,
   recorder             varchar2(8)
);
comment on column F_WORK_CLASS. begin_time   is   '9:00'   ;       
comment on column F_WORK_CLASS.   end_time is  '+4:00 ''+''��ʾ�ڶ���'    ;         
comment on table  F_WORK_CLASS is 'CLASS_ID
 Ϊ 0 �ı�ʾ��Ϣ�����Բ���������г���
 Ϊ 1 ��ΪĬ�ϰ����Ϣ';
alter table F_WORK_CLASS  add primary key (CLASS_ID);

create table F_WORK_DAY
(
   WorkDay              date not null,
   DayType              char(1) not null,
   WorkTimeType         varchar2(20),
   WorkDayDesc          varchar2(255)
);
comment on column F_WORK_DAY.DayType is '��������ҵʱ����
A:�����շż� B:��ĩ���ݳɹ���ʱ��  C: �����ϰ�  D:�����ݼ�  
';
alter table F_WORK_DAY add primary key (WorkDay);

create table M_InnerMsg
(
   Msg_Code             varchar2(16) not null ,
   Sender               varchar2(128),
   Send_Date            date,
   Msg_Title            varchar2(128),
   Msg_Type             char(1) ,
   Mail_Type            char(1) ,
   Mail_UnDel_Type      char(1),
   Receive_Name         varchar2(2048) ,
   Hold_Users           number(8,0)  ,
   msg_State            char(1)  ,
   msg_Content          blob,
   Email_Id             varchar2(8)  ,
   Opt_ID               varchar2(64) not null  ,
   OPT_Method           varchar2(64) ,
   opt_Tag              varchar2(200)  
);
comment on column M_InnerMsg.     Msg_Code    is     '��Ϣ�����Զ��壬ͨ��S_M_INNERMSG��������'      ;
comment on column M_InnerMsg.    Msg_Type    is       'P= ����Ϊ��Ϣ  A= ����Ϊ���棨֪ͨ�� M=�ʼ�'    ;
comment on column M_InnerMsg.      Mail_Type   is         'I=�ռ���
            O=������
            D=�ݸ���
            T=�ϼ��� '  ;
comment on column M_InnerMsg.     Receive_Name    is    'ʹ�ò��ţ��������������м�ʹ��Ӣ�ķֺŷָ�'       ;
comment on column M_InnerMsg.  Hold_Users       is        '����Ϊ�����˺ͽ�����������ӣ����ͺͽ�����ɾ����Ϣʱ-1��������Ϊ0ʱ����ɾ��������¼ ��Ϣ����Ϊ�ʼ�ʱ����Ҫ����'  ;
comment on column M_InnerMsg.     msg_State    is     'δ��/�Ѷ�/ɾ��'     ;
comment on column M_InnerMsg.    Email_Id     is       '�û����ö�����ʱʹ��'   ;
comment on column M_InnerMsg.       Opt_ID  is       'ģ�飬���߱�'   ;
comment on column M_InnerMsg.       OPT_Method  is   '�����������ֶ�'        ;
comment on column M_InnerMsg.     opt_Tag    is     'һ�����ڹ�����ҵ������'     ;
comment on table M_InnerMsg is  '�ڲ���Ϣ�빫����ܴ���,  ��ʵ���Զ�������, ��Ϊ�� �ͷ����� �� һ�Զ�Ĺ�ϵ ';
alter table M_InnerMsg add primary key (Msg_Code);

create table M_InnerMsg_Recipient
(
   Msg_Code             varchar2(16) not null,
   Receive              varchar2(8) not null,
   Reply_Msg_Code       int,
   Receive_Type         char(1)  ,
   Mail_Type            char(1)  ,
   msg_State            char(1)  ,
   ID                   varchar2(16) not null
);
comment on column M_InnerMsg_Recipient.   Receive_Type     is   'P=����Ϊ��Ϣ
            A=����Ϊ����
            M=�ʼ�' ;
comment on column M_InnerMsg_Recipient. Mail_Type       is  'T=�ռ���
            C=����
            B=����'  ;
comment on column M_InnerMsg_Recipient.    msg_State    is  'δ��/�Ѷ�/ɾ�����ռ�������ʱ������ʾ
            
            U=δ��
            R=�Ѷ�
            D=ɾ��'  ;
comment on table M_InnerMsg_Recipient is '�ڲ���Ϣ���ʼ����빫���ռ��˼���Ϣ��Ϣ';
alter table M_InnerMsg_Recipient add primary key (ID);

create table M_MsgAnnex
(
   Msg_Code             varchar2(16) not null,
   Info_Code            varchar2(16) not null,
   Msg_Annex_Id         varchar2(16) not null
);
alter table M_MsgAnnex  add primary key (Msg_Annex_Id);

create table P_TASK_LIST
(
   taskid               number(12,0) not null ,
   taskowner            varchar2(8) not null ,
   tasktag              varchar2(1) not null  ,
   taskrank             varchar2(1) not null  ,
   taskstatus           varchar2(2) not null  ,
   tasktitle            varchar2(256) not null,
   taskmemo             varchar2(1000) ,
   tasktype             varchar2(8) not null  ,
   OptID                varchar2(64) not null  ,
   OPTMethod            varchar2(64)  ,
   optTag               varchar2(200)  ,
   creator              varchar2(32) not null,
   created              date not null,
   planbegintime        date not null,
   planendtime          date,
   begintime            date,
   endtime              date,
   finishmemo           varchar2(1000)  ,
   noticeSign           varchar2(1) ,
   lastNoticeTime       date  ,
   taskdeadline         date,
   taskvalue            varchar2(2048) 
);
comment on column P_TASK_LIST. tasktag    is   '������outlook�е��ʼ���ǣ������ò�ͬ����ɫ������ͼ���ʶ' ;
comment on column P_TASK_LIST.  taskrank   is   '��������ȼ�' ;
comment on column P_TASK_LIST.  taskstatus   is  '�����С���ɡ�ȡ������ֹ'  ;
comment on column P_TASK_LIST. tasktype    is   '���ˡ���֯����쵼ί�� �ȵ�' ;
comment on column P_TASK_LIST.  OptID   is   'ģ�飬���߱�' ;
comment on column P_TASK_LIST.   OPTMethod  is   '�����������ֶ�' ;
comment on column P_TASK_LIST.optTag     is  'һ�����ڹ�����ҵ������'  ;
comment on column P_TASK_LIST.   finishmemo  is  '��Ҫ��¼�����ִ�й��̺ͽ��'  ;
comment on column P_TASK_LIST.  noticeSign   is    '���ѱ�־Ϊ����ֹ���ѡ�δ���ѡ�������' ;
comment on column P_TASK_LIST. lastNoticeTime    is  '���һ������ʱ�䣬�������Ѳ��Կ������Ѷ��'  ;
alter table P_TASK_LIST  add primary key (taskid);
 
CREATE OR REPLACE VIEW v_hi_unitinfo AS
SELECT a.unit_code AS top_unit_code,  b.unit_code,b.unit_type, b.parent_unit, b.is_valid,     b.unit_name,b.unit_desc,b.unit_short_name,b.addrbook_id,b.unit_order,b.dep_no,
       b.unit_word,b.unit_grade,
       LENGTH(b.Unit_Path)- LENGTH(REPLACE(b.Unit_Path,'/','')) - LENGTH(a.Unit_Path) + LENGTH(REPLACE(a.Unit_Path,'/',''))+1  AS hi_level,
       substr(b.Unit_Path ,  LENGTH(a.Unit_Path)+1) AS Unit_Path
  FROM F_UNITINFO a , F_UNITINFO b
 WHERE b.Unit_Path LIKE CONCAT(a.Unit_Path,'%' );

 
 create or replace view F_V_Opt_Role_Map as
select c.opt_url||b.OPT_URL as opt_url, b.opt_req, a.role_code, c.opt_id, b.opt_code
  from F_ROLEPOWER a
  join F_OPTDEF b
    on (a.opt_code = b.opt_code)
  join F_OptInfo c
    on (b.opt_id = c.opt_id)
 where c.Opt_Type <> 'W'
   and c.opt_url <> '...'
 order by c.opt_url, b.opt_req, a.role_code;
 
create or replace view F_V_USERROLES as
select distinct b.ROLE_CODE,b.ROLE_NAME,b.IS_VALID,b.ROLE_DESC,b.CREATE_DATE,b.UPDATE_DATE ,a.user_code
    from F_USERROLE a join F_ROLEINFO b on (a.ROLE_CODE=b.ROLE_CODE)
    where a.OBTAIN_DATE <=  sysdate and (a.SECEDE_DATE is null or a.SECEDE_DATE > sysdate) and b.IS_VALID='T'
union all
  select d.ROLE_CODE,d.ROLE_NAME,d.IS_VALID,d.ROLE_DESC,d.CREATE_DATE,d.UPDATE_DATE , c.user_code
   from F_USERINFO c , F_ROLEINFO d
   where d.role_code = 'G-public';

create or replace view F_V_UserOptDataScopes as
select  distinct a.User_Code, c. OPT_ID ,  c.OPT_METHOD , b.opt_Scope_Codes
from F_V_USERROLES a  join F_ROLEPOWER   b on (a.Role_Code=b.Role_Code)
         join F_OPTDEF  c on(b.OPT_CODE=c.OPT_CODE);
         
create or replace view F_V_UserOptList as
select  distinct a.User_Code,  c.OPT_CODE,  c.OPT_NAME  ,  c. OPT_ID ,  c.OPT_METHOD
from F_V_USERROLES a  join F_ROLEPOWER   b on (a.Role_Code=b.Role_Code)
         join F_OPTDEF  c on(b.OPT_CODE=c.OPT_CODE);


create or replace view f_v_useroptmoudlelist as
select  distinct a.User_Code,d.Opt_ID, d.Opt_Name , d.Pre_Opt_ID  ,
            d.Form_Code  , d.opt_url, d.opt_route, d.Msg_No , d.Msg_Prm, d.Is_In_ToolBar ,
            d.Img_Index,d.Top_Opt_ID ,d.Order_Ind,d.Page_Type,d.opt_type
from F_V_USERROLES a  join F_ROLEPOWER b on (a.Role_Code=b.Role_Code)
         join F_OPTDEF  c on(b.OPT_CODE=c.OPT_CODE)
        join F_OptInfo d on(c.OPT_ID=d.Opt_ID)
where d.opt_url<>'...';

create or replace view f_v_optdef_url_map as
select c.opt_url||b.OPT_URL as opt_def_url, b.opt_req, b.opt_code
from F_OPTDEF b join F_OptInfo c
    on (b.opt_id = c.opt_id)
 where c.Opt_Type <> 'W'
   and c.opt_url <> '...' and b.opt_req is not null;

create or replace view v_opt_tree as
   select i.opt_id as MENU_ID,i.pre_opt_id as PARENT_ID,i.opt_name as MENU_NAME,i.order_ind 
   from F_OptInfo i where i.is_in_toolbar ='Y'
   union all 
   select d.opt_code as MENU_ID,d.opt_id as PARENT_ID,d.opt_name as MENU_NAME,0 as order_ind 
   from F_OPTDEF d
;

