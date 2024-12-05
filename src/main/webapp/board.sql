create table board (
    id number primary key,
    title varchar2(100) not null,
    content varchar2(4000) not null,
    created_date date default sysdate
);

create sequence board_seq start with 1 increment by 1;

drop table board;
drop sequence board_seq;

select * from board;
select * from sequence board_seq;

insert into board (id, title, content, created_date)
values (board_seq.nextval, '첫 번째 게시글', '이것은 첫 번째 게시글의 내용입니다.', sysdate);