/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     4/07/2022 3:46:06 p. m.                      */
/*==============================================================*/


alter table TBLSUCURSAL
   drop constraint FK_TBLSUCUR_TIENE_TBLBANCO;

drop table TBLBANCO cascade constraints;

drop index TIENE_FK;

drop table TBLSUCURSAL cascade constraints;

/*==============================================================*/
/* Table: TBLBANCO                                              */
/*==============================================================*/
create table TBLBANCO 
(
   NITBANCO             NUMBER(15,0)         not null,
   NOMBREBANCO          VARCHAR2(50)         not null,
   FECHAFUNDACIONBANCO  DATE                 not null,
   constraint PK_TBLBANCO primary key (NITBANCO)
);

/*==============================================================*/
/* Table: TBLSUCURSAL                                           */
/*==============================================================*/
create table TBLSUCURSAL 
(
   CODSUCURSAL          NUMBER(15,0)         not null,
   NITBANCO             NUMBER(15,0)         not null,
   UBICACIONSUCURSAL    VARCHAR2(10)         not null
      constraint CKC_UBICACIONSUCURSAL_TBLSUCUR check (UBICACIONSUCURSAL in ('norte','sur','centro')),
   NUMEMPLEADOSSUCURSAL NUMBER(7,0)          not null,
   FECHAFUNDACIONSUCURSAL DATE                 not null,
   NOMBRESUCURSAL       VARCHAR2(100)        not null,
   constraint PK_TBLSUCURSAL primary key (CODSUCURSAL)
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create index TIENE_FK on TBLSUCURSAL (
   NITBANCO ASC
);

alter table TBLSUCURSAL
   add constraint FK_TBLSUCUR_TIENE_TBLBANCO foreign key (NITBANCO)
      references TBLBANCO (NITBANCO);

