-- ��������ȱ�� UNITMANAGER �ֶ�
alter table F_UNITINFO add UNITMANAGER varchar2(32);

insert into F_UNITINFO
(UNITCODE, PARENTUNIT, UNITTYPE, ISVALID, UNITTAG,
UNITNAME, ENGLISHNAME, DEPNO, UNITDESC, ADDRBOOKID,
UNITSHORTNAME, UNITWORD, UNITGRADE, UNITORDER, UPDATEDATE,
CREATEDATE, EXTJSONINFO, CREATOR, UPDATOR, UNITPATH)
values
('U00001', null, 'N', 'T', null,
'������', 'root', null, '������', null,
'root', null, null, 1, sysdate,
sysdate, null, 'u0000000', 'u0000000', '/U00001');

commit;
