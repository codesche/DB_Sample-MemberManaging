CREATE TABLE member
(
    member_type varchar(10) not null comment '회원구분',
    user_id     varchar(50) not null comment '회원아이디',
    password    varchar(50) null comment '비밀번호',
    name        varchar(20) null comment '이름',
    primary key (member_type, user_id)
) comment '회원정보';


create table member_detail
(
    member_type     varchar(10)                         not null comment '회원 구분',
    user_id         varchar(50)                         not null comment '회원 아이디',
    mobile_no       varchar(12)                         null comment '휴대폰 번호',
    marketing_yn    bit                                 null comment '마케팅 수신 여부',
    register_date datetime default current_timestamp()  null comment '가입일',
    primary key (member_type, user_id),
    constraint fk_member_detail foreign key (member_type, user_id) references member (member_type, user_id)
) comment '회원상세정보';

select * from member_detail;

insert into member (member_type, user_id, password, name) VALUE ('email', 'kwon@gmail.com', 7777, '민성');
insert into member (member_type, user_id, password, name) VALUE ('email', 'sslee@daum.net', 1592, '이순신');
insert into member (member_type, user_id, password, name) VALUE ('email', 'test@naver.com', 1234, '철수');
insert into member (member_type, user_id, name) VALUE ('email', 'syryu@nate.com', '류성용');
insert into member (member_type, user_id, name) VALUE ('email', 'test2@naver.com', '원균');

# !-------------------------------------------------------------------------------------------------------------
insert into member_detail (member_type, user_id, mobile_no, marketing_yn, register_date) value ('email', 'kwon@gmail.com', 01033333333, true, now());
insert into member_detail (member_type, user_id, mobile_no, marketing_yn, register_date) value ('email', 'sslee@daum.net', 01022222222, true, now());
insert into member_detail (member_type, user_id, mobile_no, marketing_yn, register_date) value ('email', 'test@naver.com', 01011111111, false, now());

select member.name from member;

desc member;

create view v_member as
select m.member_type, m.user_id, m.password, m.name, md.mobile_no, md.marketing_yn, md.register_date
from member m join member_detail md on md.member_type = m.member_type and md.user_id = m.user_id;

select * from v_member;

select member_type,
       user_id,
       name,
       mobile_no,
       marketing_yn,
       register_date
from v_member
where marketing_yn = true;

create view v_member_marketing_yes as

select m.member_type, m.user_id, m.password, m.name, md.mobile_no, md.marketing_yn, md.register_date
from member m join member_detail md on md.member_type = m.member_type and md.user_id = m.user_id
where marketing_yn = true;

select * from v_member_marketing_yes where name = '원균';

select * from v_member;


