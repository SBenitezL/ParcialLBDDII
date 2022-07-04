create or replace procedure prcIngresarBanco(prmNit Number, prmNombre varchar2, prmFecha date)
as
begin
    insert into tblbanco values(prmNit,prmNombre,prmFecha);
end;

create or replace procedure prcIngresarSucursal(prmCod  Number, prmNit Number, 
                                                prmUbicSucursal VARCHAR2, prmNoEmp Number,
                                                prmFechaFundacion date)
as
begin
    insert into tblsucursal values(prmCod, prmNit , 
                                   prmUbicSucursal , prmNoEmp ,
                                   prmFechaFundacion);
end;