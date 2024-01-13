@AbapCatalog.sqlViewName: 'ZV_REM_DAYSL_JP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Remaining days'
define view z_b_rem_days_jpvv
  as select from zrent_cars_jpvv
{
  key matricula as Matricula,
      marca     as Marca,
      //alq_hasta as AlquilerHasta,
      case
      when alq_hasta <> ''
      then dats_days_between( cast(
      $session.system_date as abap.dats ), alq_hasta)
      end       as Dias
}
