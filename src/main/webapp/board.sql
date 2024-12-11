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

insert into board values (board_seq.nextval, '게시글 1', '게시글 1 내용', sysdate);
insert into board values (board_seq.nextval, '게시글 2', '게시글 2 내용', sysdate);
insert into board values (board_seq.nextval, '게시글 3', '게시글 3 내용', sysdate);