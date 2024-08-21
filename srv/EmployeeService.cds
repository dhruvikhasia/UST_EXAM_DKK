//using { ust.dhruvi.khasia.db.master } from '../db/demo-model'; - For Q1

//This EmployeeService file is for Q2 - Scenario 2

using { ust.dhruvi.khasia.datamodel.master,  ust.dhruvi.khasia.datamodel.transaction } from '../db/datamodel';

service EmployeeService @(path: 'EmployeeService') {

    entity ProductSet as projection on master.product;
    entity BusinessPartnerSet as projection on master.businesspartner;
    entity BusinessAddressSet as projection on master.address;
   // @readonly
    //@Capabilities : { Deletable: false } For delete button out of the box
    entity POs @(odata.draft.enabled: true) as projection on transaction.purchaseorder{
        *,
        Items
    }
     entity POItems as projection on transaction.poitems;
}