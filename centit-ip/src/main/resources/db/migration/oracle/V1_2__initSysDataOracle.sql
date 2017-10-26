insert into F_UNITINFO
(UNIT_CODE, PARENT_UNIT, UNIT_TYPE, IS_VALID, UNIT_TAG,
UNIT_NAME, ENGLISH_NAME, DEP_NO, UNIT_DESC, ADDRBOOK_ID,
UNIT_SHORT_NAME, UNIT_WORD, UNIT_GRADE, UNIT_ORDER, UPDATE_DATE,
CREATE_DATE, EXTJSONINFO, CREATOR, UPDATOR, UNIT_PATH)
values
('U00001', null, 'N', 'T', null,
'������', 'root', null, '������', null,
'root', null, null, 1, sysdate,
sysdate, null, 'u0000000', 'u0000000', '/U00001');

insert into F_USERINFO (USER_CODE, USER_PIN, IS_VALID, LOGIN_NAME, USER_NAME, USER_DESC, LOGIN_TIMES, ACTIVE_TIME, LOGIN_IP, ADDRBOOK_ID, REG_EMAIL, USER_ORDER, USER_PWD, REG_CELL_PHONE, CREATE_DATE,CREATOR,UPDATOR,UPDATE_DATE)
values ('noname', '67b74fe1423796dfe8db34b959b81fbd', 'F', 'noname', '�����û�', '�����û�', null, null, '', null, 'noname@centit.com', 1, '', '', sysdate,'u0000000','u0000000',sysdate);
insert into F_USERINFO (USER_CODE, USER_PIN, IS_VALID, LOGIN_NAME, USER_NAME, USER_DESC, LOGIN_TIMES, ACTIVE_TIME, LOGIN_IP, ADDRBOOK_ID, REG_EMAIL, USER_ORDER, USER_PWD, REG_CELL_PHONE, CREATE_DATE ,CREATOR,UPDATOR,UPDATE_DATE,primary_Unit)
values ('u0000000', '$2a$11$DbyFNhHeCES5CKoMuM5sXepY7GM35sZkUSqQbjYJnFTzJ2GDIYGLK', 'T', 'admin', '����Ա', '', null, null, '', null, 'codefan@centit.com', 1, '', '18017458877', sysdate,'u0000000','u0000000',sysdate,'U00001');

INSERT INTO F_USERUNIT(USER_UNIT_ID, UNIT_CODE, USER_CODE, Is_Primary, User_Station, User_Rank, Rank_Memo, User_Order,
update_Date, Create_Date) VALUES ('s000000000','U00001','u0000000','T','pf','CZ',null,'1',sysdate,sysdate);

-- ��ʼ�������ֵ�

insert into F_DATACATALOG (CATALOG_CODE, CATALOG_NAME, CATALOG_STYLE, CATALOG_TYPE, CATALOG_DESC, FIELD_DESC, UPDATE_DATE, CREATE_DATE, OPT_ID, NEED_CACHE,CREATOR,UPDATOR)
values ('MsgType', '��Ϣ����', 'U', 'L', '���Բ���', null, sysdate, null, 'innermsg', '1','u0000000','u0000000');

insert into F_DATACATALOG (CATALOG_CODE, CATALOG_NAME, CATALOG_STYLE, CATALOG_TYPE, CATALOG_DESC, FIELD_DESC, UPDATE_DATE, CREATE_DATE, OPT_ID, NEED_CACHE,CREATOR,UPDATOR)
values ('CatalogStyle', '�ֵ�����', 'S', 'L', 'F : ��ܹ��е� U:�û� S��ϵͳ', null, null, null, 'dictionary', '1','u0000000','u0000000');

insert into F_DATACATALOG (CATALOG_CODE, CATALOG_NAME, CATALOG_STYLE, CATALOG_TYPE, CATALOG_DESC, FIELD_DESC, UPDATE_DATE, CREATE_DATE, OPT_ID, NEED_CACHE,CREATOR,UPDATOR)
values ('CatalogType', '�ֵ�ṹ', 'S', 'L', 'L:�б�T:���� �����޸�', null, sysdate, null, 'dictionary', '1','u0000000','u0000000');

insert into F_DATACATALOG (CATALOG_CODE, CATALOG_NAME, CATALOG_STYLE, CATALOG_TYPE, CATALOG_DESC, FIELD_DESC, UPDATE_DATE, CREATE_DATE, OPT_ID, NEED_CACHE,CREATOR,UPDATOR)
values ('UnitType', '��λ����', 'U', 'L', '��λ����', null, null, null, null, '1','u0000000','u0000000');

insert into F_DATACATALOG (CATALOG_CODE, CATALOG_NAME, CATALOG_STYLE, CATALOG_TYPE, CATALOG_DESC, FIELD_DESC, UPDATE_DATE, CREATE_DATE, OPT_ID, NEED_CACHE,CREATOR,UPDATOR)
values ('OptType', 'ҵ�����', 'S', 'L', 'ҵ�����', 'ҵ�����', null, null, '1', '1','u0000000','u0000000');

insert into F_DATACATALOG (CATALOG_CODE, CATALOG_NAME, CATALOG_STYLE, CATALOG_TYPE, CATALOG_DESC, FIELD_DESC, UPDATE_DATE, CREATE_DATE, OPT_ID, NEED_CACHE,CREATOR,UPDATOR)
values ('StationType', '��λ��ɫ', 'U', 'L', 'ҵ���λ��������볤��Ϊ4', 'ҵ�����xx', null, null, '0', '0','u0000000','u0000000');

insert into F_DATACATALOG (CATALOG_CODE, CATALOG_NAME, CATALOG_STYLE, CATALOG_TYPE, CATALOG_DESC, FIELD_DESC, UPDATE_DATE, CREATE_DATE, OPT_ID, NEED_CACHE,CREATOR,UPDATOR)
values ('RankType', '����ְ�����', 'U', 'L', 'ҵ��ְ����������볤��Ϊ2����ֵԽ�͵ȼ�Խ��', 'ְλ����;�ȼ�;δ��;ְλ����', null, null, null, '0','u0000000','u0000000');

insert into F_DATACATALOG (CATALOG_CODE, CATALOG_NAME, CATALOG_STYLE, CATALOG_TYPE, CATALOG_DESC, FIELD_DESC, UPDATE_DATE, CREATE_DATE, OPT_ID, NEED_CACHE,CREATOR,UPDATOR)
values ('SUPPORT_LANG', 'ϵͳ֧�ֵ�����', 'U', 'L', 'ϵͳ֧�ֵ�����,��Ҫ��system.properties�аѲ���sys.multi_lang����Ϊtrue�Ż���Ч', null, sysdate, null, 'DICTSET', '1','u0000000','u0000000');

insert into F_DATACATALOG (CATALOG_CODE, CATALOG_NAME, CATALOG_STYLE, CATALOG_TYPE, CATALOG_DESC, FIELD_DESC, UPDATE_DATE, CREATE_DATE, OPT_ID, NEED_CACHE,CREATOR,UPDATOR)
values ('LogLevel', '��־����', 'F', 'L', '��־����', '��־����', sysdate, sysdate, 'OptLog', '1','u0000000','u0000000');


insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('MsgType', 'P', null, null, 'T', '������Ϣ', 'U', null, sysdate, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('MsgType', 'A', null, null, 'T', '����', 'U', '������Ⱥ������Ϣ', sysdate, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('CatalogStyle', 'F', null, null, 'T', '��ܹ���', 'S', '�κεط���������༭��ֻ���п�����Ա�������½ű���ӡ����ĺ�ɾ��', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('CatalogStyle', 'G', null, null, 'T', '����', 'S', '�����ʱ�����ǿ������ֵ�����н�������', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('CatalogStyle', 'S', null, null, 'T', 'ϵͳ����', 'S', 'ʵʩ��Ա������ʵʩ��ڶ������ֵ�������ֵ���Ŀ����CRUD����', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('CatalogStyle', 'U', null, null, 'T', '�û�����', 'S', '����Ա��� �� ʵʩ��Ա��� �� ��������ֵ�������Ŀ����CRUD', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('CatalogType', 'L', null, null, 'T', '�б�', 'S', '�б�',sysdate, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('CatalogType', 'T', null, null, 'T', '����', 'S', '����', sysdate, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('UnitType', 'A', 'CCCC', null, 'T', '����', 'S', 'administrator', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('UnitType', 'L', 'BBB', null, 'T', '����', 'S', 'logistics', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('UnitType', 'O', 'DDD', null, 'T', 'ҵ��', 'S', 'operator', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('UnitType', 'R', 'A', null, 'T', '�з�', 'S', 'Rearch', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('RankType', 'IM', '3', null, 'T', '��Ŀ����', 'U', '��Ŀ����', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('RankType', 'GM', '1', null, 'T', '�ܾ���', null, null, null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('RankType', 'DM', '2', null, 'T', '���ž���', null, null, null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('RankType', 'EM', '9', null, 'T', 'Ա��', null, null, null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('RankType', 'KZ', '10', null, 'T', '�Ƴ�', null, '�Ƴ�', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('RankType', 'ZR', '10', null, 'T', '����', null, '����', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('RankType', 'KY', '10', null, 'T', '�칫�ҿ�Ա', null, '�칫�ҿ�Ա', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('RankType', 'CZ', '10', null, 'T', '����', null, '����', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('RankType', 'WDZ', '4', null, 'T', 'ί����', null, null, null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('RankType', 'WLD', '5', null, 'T', 'ί�쵼', null, 'ί�쵼', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('RankType', 'FC', '6', null, 'T', '������', null, '������', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('RankType', 'JJZ', '7', null, 'T', '�ͼ���', null, '�ͼ���', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('RankType', 'JGDW', '8', null, 'T', '���ص�ί', null, '���ص�ί', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'slbmfzr', null, null, 'T', '�����Ÿ�����', 'S', null, null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'fgjz', null, null, 'T', '�ֳֹܾ�', null, null, null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'sfy', null, null, 'T', '�շ�Ա', null, null, null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'xbr', null, null, 'T', 'Э�촦�Ҹ�����', null, 'Э�촦�Ҹ�����', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'bgszr', null, null, 'T', '�칫������', null, '�칫������', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'xkdj', null, null, 'T', '��ɵǼ�', 'S', '��ɵǼ�', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'xkbl', null, null, 'T', '��ɰ���', 'S', '��ɰ���', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'dcdb_jcry', null, null, 'T', '���鶽��_�����Ա', 'S', '���𶽰�ļ����Ա', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'dcdb_jbrld', null, null, 'T', '���鶽��_�������쵼', 'S', '�������˵ķֹ��쵼', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'dcdb_jcld', null, null, 'T', '���鶽��_����쵼', 'S', '���𶽰�ļ����Ա�ֹ��쵼', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'dcdb_jbr', null, null, 'T', '���鶽��_������', 'S', '��������', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'fzr', null, null, 'T', '���촦�Ҹ�����', null, '���촦�Ҹ�����', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'sjr', null, null, 'T', '�칫���ռ���', null, '�칫���ռ���', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'pf', null, null, 'T', '�칫��������', null, '�칫��������', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'cbr', null, null, 'T', '����а���', null, '����а���', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'syr', null, null, 'T', '�칫��������', null, '�칫��������', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'sr', null, null, 'T', '�칫����Ա', null, '�칫����Ա', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'fgzr', null, null, 'T', '�ֹ�����', null, '�ֹ�����', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'fw_nw', null, null, 'T', '��������', 'S', null, null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'wysry', null, null, 'T', '��ӡ����Ա', null, '��ӡ����Ա', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'wyszr', null, null, 'T', '��ӡ������', null, '��ӡ������', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'spcjbr', null, null, 'T', '������������', 'S', '������������', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'spccz', null, null, 'T', '����������', 'S', '����������', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'bgsms', null, null, 'T', '�칫������', 'S', '�칫������', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'bgsfgzr', null, null, 'T', '�칫�ҷֹ�����', 'S', '�칫�ҷֹ�����', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'wld', null, null, 'T', 'ί�쵼ǩ��', 'S', 'ί�쵼ǩ��', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('StationType', 'bgsfwh', null, null, 'T', '�칫���������ĺ�', 'S', '�칫���������ĺ�', null, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('SUPPORT_LANG', 'zh_CN', null, null, 'T', '����', 'U', null, sysdate, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('SUPPORT_LANG', 'en_US', null, null, 'T', 'English', 'U', null,sysdate, null, null);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('OptType', 'S', null, null, 'T', 'ʵʩҵ��', 'F', 'ʵʩҵ��', sysdate, sysdate, 2);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('OptType', 'O', null, null, 'T', '��ͨҵ��', 'F', '��ͨҵ��', sysdate,sysdate, 1);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('OptType', 'I', null, null, 'T', '��Ŀҵ��', 'F', '��Ŀҵ��', sysdate, sysdate, 3);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('OptType', 'W', null, null, 'T', '������ҵ��', 'F', '������ҵ��', sysdate, sysdate, 4);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('LogLevel', '1', null, null, 'T', '������ʾ', 'F', null, sysdate, sysdate, 2);

insert into F_DATADICTIONARY (CATALOG_CODE, DATA_CODE, EXTRA_CODE, EXTRA_CODE2, DATA_TAG, DATA_VALUE, DATA_STYLE, DATA_DESC, LAST_MODIFY_DATE, CREATE_DATE, DATA_ORDER)
values ('LogLevel', '0', null, null, 'T', '������־', 'F', null, sysdate, sysdate, 1);


-- ��ʼ��ҵ��˵�
insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('DEPTMAG', '���Ź���', '0', '...', '...', null, 'O', null, null, 'Y', null, null, null, null, 'I', 'icon-base icon-base-computer', null, null, sysdate, null,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('DEPTPOW', '�������Ź���', 'DEPTMAG', 'modules/sys/deptpow/deptpow.html', '/system/deptManager', null, 'O', null, null, 'Y', null, null, 0, null, 'D', 'icon-base icon-base-user', null, null, sysdate, null,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('DEPTROLE', '���Ž�ɫ����', 'DEPTMAG', 'modules/sys/deptrole/deptrole.html', '/system/deptManager!', null, 'O', null, null, 'Y', null, null, 0, null, 'D', 'icon-base icon-base-gear', null, null, sysdate, null,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('DEPTUSERINFO', '�����û�����', 'DEPTMAG', 'modules/sys/deptuserinfo/deptuserinfo.html', '/system/userDef', null, 'O', null, null, 'Y', null, null, null, null, 'D', null, null, null, sysdate, null,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('UNITMAG', '��������', 'ORGMAG', 'modules/sys/unitinfo/unitinfo.html', '/system/unitinfo', null, 'O', null, null, 'Y', null, null, 2, null, 'D', null, null, null, sysdate, null,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('USERMAG', '�û�����', 'ORGMAG', 'modules/sys/userinfo/userinfo.html', '/system/userinfo', null, 'O', null, null, 'Y', null, null, null, null, 'D', null, null, null, sysdate, null,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('USERROLE', '�û���ɫ', 'ORGMAG', '/modules/sys/userrole.html', '/system/userrole', null, 'O', null, null, 'N', null, null, null, null, 'D', null, null, null, null, null,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('USERUNIT', '�û�����', 'ORGMAG', '/modules/sys/userunit.html', '/system/userunit', null, 'O', null, null, 'N', null, null, null, null, 'D', null, null, null, null, null,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('DICTSET_M', '�����ֵ�', 'SYS_CONFIG', 'modules/sys/dictionary/dictionary.html', '/system/dictionary', null, 'O', null, null, 'Y', null, null, null, null, 'D', null, null, null,sysdate, sysdate,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('OPT_LOG_QUERY', 'ϵͳ��־', 'SYS_CONFIG', 'modules/sys/loginfo/loginfo.html', '/system/optlog', null, 'O', null, null, 'Y', null, null, null, null, 'D', null, null, null,sysdate, null,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('USER_SETTING', '��������', 'SYS_CONFIG', '/modules/sys/usersetting.html', '/system/usersetting', null, 'O', null, null, 'N', null, null, null, null, 'D', null, null, null, sysdate,sysdate,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('DEPLOY', 'ʵʩ�˵�', '0', '...', '...', null, 'O', null, null, 'Y', null, null, null, null, 'D', '444', null, null, sysdate, sysdate,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('SYSCONF', 'ϵͳ����', 'DEPLOY', '...', '...', null, 'O', null, null, 'Y', null, null, null, null, 'I', 'icon-base icon-base-gear', null, null, null, null,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('DICTSET', '�����ֵ����', 'SYSCONF', 'modules/sys/dictionary/dictionary.admin.html', '/system/dictionary', null, 'O', null, null, 'Y', null, null, 0, null, 'D', 'icon-base icon-base-gear', null, null, sysdate, null,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('OPTINFO', 'ϵͳҵ��', 'SYSCONF', 'modules/sys/optinfo/optinfo.html', '/system/optinfo', null, 'O', null, null, 'Y', null, null, 4, null, 'D', null, null, null, sysdate, null,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('OPTLOG', 'ϵͳ��־', 'SYSCONF', 'modules/sys/loginfo/loginfo.admin.html', '/system/optlog', null, 'O', null, null, 'Y', null, null, null, null, 'D', null, null, null, null, null,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('ROLEMAG', '��ɫ����', 'ORGMAG', 'modules/sys/roleinfo/roleinfo.html', '/system/roleinfo', null, 'O', null, null, 'Y', null, null, null, null, 'D', null, null, null, null, null,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('ORGMAG', '��֯����', '0', '...', '...', null, 'O', null, null, 'Y', null, null, 3, null, 'I', 'icon-base icon-base-user', null, null, sysdate, null,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('SYS_CONFIG', 'ϵͳ����', '0', '...', '...', null, 'O', null, null, 'Y', null, null, null, null, 'D', 'icon-base icon-base-gear', null, null, null, null,'u0000000','u0000000');

insert into F_OptInfo (OPT_ID, OPT_NAME, PRE_OPT_ID, OPT_ROUTE, OPT_URL, FORM_CODE, OPT_TYPE, MSG_NO, MSG_PRM, IS_IN_TOOLBAR, IMG_INDEX, TOP_OPT_ID, ORDER_IND, FLOW_CODE, PAGE_TYPE, ICON, HEIGHT, WIDTH, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('LOGINCAS', 'CAS��¼���', '0', '/system/mainframe/logincas', '/system/mainframe', null, 'O', null, null, 'N', null, null, null, null, 'D', null, null, null, sysdate, null,'u0000000','u0000000');


insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000038', 'USER_SETTING', '����������û�����', null, null, null, null, null, '/*', 'CU','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000037', 'USER_SETTING', '��ȡ�û����ò���', null, '��ȡ��ǰ�û����õĲ���', null, null, null, '/*', 'R','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000039', 'USER_SETTING', 'ɾ���û����ò���', null, 'ɾ���û����ò���', null, null, null, '/*', 'D','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000040', 'USER_SETTING', '�����û����ò���', null, '�����û����ò���', null, null, null, '/export', 'R','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000051', 'USERUNIT', '��ȡ�����û�����������Ϣ', null, '��ȡ�����û�����������Ϣ', null, null, null, '/*/*', 'R','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000020', 'OPTLOG', '��ѯ', 'list', '��ѯϵͳ��־', null, null, null, '/*', 'R','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000041', 'OPT_LOG_QUERY', '�鿴��־����', null, '�鿴������־', null, sysdate, null, '/*', 'R','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000070', 'USERMAG', '�û��б�', null, '�û��б�', null,sysdate, null, '/', 'R','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000029', 'USERUNIT', '�����û���������', null, '����û���������', null, null, null, '/', 'C','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000032', 'USERROLE', '�����û���ɫ����', null, '����û�������ɫ', null, null, null, '/', 'C','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000030', 'USERUNIT', '�༭�û���������', null, '�����û�����������Ϣ', null, null, null, '/*/*', 'U','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000031', 'USERUNIT', 'ɾ���û���������', null, 'ɾ���û�������������', null, null, null, '/*/*', 'D','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000033', 'USERROLE', '�༭�û���ɫ����', null, '�����û�������ɫ��Ϣ', null, null, null, '/*/*', 'U','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000034', 'USERROLE', 'ɾ���û���ɫ����', null, 'ɾ���û�������ɫ', null, null, null, '/*/*', 'D','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000071', 'USERMAG', '�����û�', null, '�����û�', null, sysdate, null, '/', 'C','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000072', 'USERMAG', '�����û�', null, '�����û�', null,sysdate, null, '/*', 'U','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000073', 'USERMAG', 'ɾ���û�', null, 'ɾ���û�', null, sysdate, null, '/*', 'D','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000052', 'DICTSET', '��ѯ��������Ŀ¼', null, '��ѯ��������Ŀ¼', null,sysdate, null, '/*', 'R','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000053', 'DICTSET', '��ѯ���������ֵ�', null, '��ѯ���������ֵ�', null, sysdate, null, '/dictionary/*/*', 'R','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000054', 'DICTSET', '��ȡ���������������ֵ�', null, '��ȡ���������������ֵ�', null, sysdate, null, '/cache/*', 'R','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000009', 'DICTSET', 'ɾ�������ֵ�', 'DELTE', 'ɾ�������ֵ�', 'F', sysdate, null, '/dictionary/*/*', 'D','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000007', 'DICTSET', '�о��ֵ�', 'LIST', '��ʼҳ��', 'F', sysdate, null, '/data', 'U','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000008', 'DICTSET', '����/�༭�����ֵ�', 'EDIT', '����/�༭�����ֵ�', 'F', sysdate, null, '/dictionary/*/*', 'CU','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000010', 'DICTSET', '����/�༭����Ŀ¼', 'editDetail', '�༭/�½�����Ŀ¼', 'F',sysdate, null, '/*', 'CU','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000011', 'DICTSET', 'ɾ������Ŀ¼', 'deleteDetail', 'ɾ���ֵ�Ŀ¼', 'F', sysdate, null, '/*', 'D','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000042', 'DICTSET_M', '��ѯ��������Ŀ¼', null, '��ѯ��������Ŀ¼', null,sysdate, null, '/*', 'R','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000043', 'DICTSET_M', '��ѯ���������ֵ�', null, '��ѯ���������ֵ�', null, sysdate, null, '/*/dictionary/*', 'R','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000044', 'DICTSET_M', '����/�༭����Ŀ¼', null, '����/�༭����Ŀ¼', null, sysdate, null, '/*', 'CU','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000045', 'DICTSET_M', '����/�༭�����ֵ�', null, '����/�༭�����ֵ�', null, sysdate, null, '/*/dictionary/*', 'CU','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000046', 'DICTSET_M', 'ɾ������Ŀ¼', null, 'ɾ������Ŀ¼', null, sysdate, null, '/*', 'D','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000047', 'DICTSET_M', 'ɾ�������ֵ�', null, 'ɾ�������ֵ�', null, sysdate, null, '/*/dictionary/*', 'D','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000048', 'DICTSET_M', '��ȡ���������������ֵ�', null, '��ȡ���������������ֵ�', null, sysdate, null, '/cache/*', 'R','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000059', 'UNITMAG', '�鿴���л���', null, '�鿴���л���', null, sysdate, null, '/', 'R','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000001', 'UNITMAG', '�½�/�༭����', 'EDIT', '�½��͸��»���', 'F', sysdate, null, '/*', 'CU','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000002', 'UNITMAG', '����/�ָ�����', 'DELETE', '���»���״̬', 'F', sysdate, null, '/*/status/*', 'U','u0000000','u0000000');

insert into F_OPTDEF (OPT_CODE, OPT_ID, OPT_NAME, OPT_METHOD, OPT_DESC, IS_IN_WORKFLOW, UPDATE_DATE, CREATE_DATE, OPT_URL, OPT_REQ,CREATOR,UPDATOR)
values ('1000080', 'LOGINCAS', 'CAS��¼���', null, null, null, null, null, '/logincas', 'RCU','u0000000','u0000000');

-- �û�����ɫ��Ȩ�޳�ʼ��


-- ��ʼ����ɫ��Ϣ
insert into F_ROLEINFO (ROLE_CODE, ROLE_NAME,ROLE_TYPE, IS_VALID, ROLE_DESC, CREATE_DATE, UPDATE_DATE,CREATOR,UPDATOR)
values ('G-DEPLOY', 'ʵʩ��Ա','S','T', 'ʵʩ��Ա��ɫ', sysdate, sysdate,'u0000000','u0000000');

insert into F_ROLEINFO (ROLE_CODE, ROLE_NAME,ROLE_TYPE, IS_VALID, ROLE_DESC, CREATE_DATE, UPDATE_DATE,CREATOR,UPDATOR)
values ('G-SYSADMIN', 'ϵͳ����Ա','S', 'T', '����ϵͳ���ù���', sysdate, sysdate,'u0000000','u0000000');

insert into F_ROLEINFO (ROLE_CODE, ROLE_NAME,ROLE_TYPE, IS_VALID, ROLE_DESC, CREATE_DATE, UPDATE_DATE,CREATOR,UPDATOR)
values ('G-anonymous', '������ɫ','S', 'T', '�����û���ɫ', sysdate, sysdate,'u0000000','u0000000');

insert into F_ROLEINFO (ROLE_CODE, ROLE_NAME,ROLE_TYPE, IS_VALID, ROLE_DESC, CREATE_DATE, UPDATE_DATE,CREATOR,UPDATOR)
values ('G-public', '������ɫ','S', 'F', '������ɫȨ�޻�Ĭ�ϸ������������û���������', sysdate, sysdate,'u0000000','u0000000');



insert into F_ROLEPOWER (ROLE_CODE, OPT_CODE, UPDATE_DATE, CREATE_DATE, OPT_SCOPE_CODES,CREATOR,UPDATOR)
values ('G-public', '1000080', sysdate, sysdate, '','u0000000','u0000000');



insert into F_OPTDEF(opt_code,opt_id,opt_name,opt_method,opt_desc,
      is_in_workflow,UPDATE_DATE,create_date,opt_url,opt_req,CREATOR,UPDATOR)
select  S_OPTDEFCODE.NEXTVAL,opt_id , '�鿴', 'list',  '�鿴',
    'F',sysdate,sysdate,'/*','R' ,CREATOR,UPDATOR
    from F_OptInfo where opt_id not in (select opt_id from F_OPTDEF);  

insert into F_ROLEPOWER(role_code,opt_code,update_Date,create_date,opt_scope_codes,CREATOR,UPDATOR)
  select 'G-SYSADMIN',opt_code,sysdate,sysdate,'',CREATOR,UPDATOR from F_OPTDEF;

insert into F_USERROLE (USER_CODE, ROLE_CODE, OBTAIN_DATE, 
      SECEDE_DATE, CHANGE_DESC, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('u0000000', 'G-SYSADMIN', sysdate, 
 sysdate,'' ,sysdate, sysdate,'u0000000','u0000000');
  commit;
