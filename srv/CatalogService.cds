using { anubhav.db.master, anubhav.db.transaction } from '../db/datamodel';
using { cappo.cds } from '../db/CDSViews';

service CatalogService @(path:'CatalogService',requires:'authenicated-user') {
    
    entity bussinesspartner as projection on master.businesspartner;
    //  @readonly
     entity EmployeeSet @(restrict: [ 
                        { grant: ['READ'], to: 'Viewer', where: 'bankName = $user.BankName' },
                        { grant: ['WRITE'], to: 'Admin' }
                        ]) as projection on master.employees;
    entity product as projection on master.product;
    entity bpaddress as projection on master.address;
    @Capabilities : { Deletable:false }
    entity POs @(odata.draft.enabled:true) as projection on transaction.purchaseorder{
        *,
        Items,
        case OVERALL_STATUS
        when 'P' then 'Pending'
        when 'N' then 'New'
        when 'A' then 'Approved'
        when 'X' then 'Rejected'
        end as OverallStatus : String(10),
        case OVERALL_STATUS
        when 'P' then 2
        when 'N' then 2
        when 'A' then 3
        when 'X' then 1
        end as ColourCode : Integer,
    
    }
     actions{ 
        @Common.SideEffects : {
            TargetProperties: [
                'in/GROSS_AMOUNT',
            ]
        }
        action boost() returns POs
         } ;
     function largestOrder() returns array of  POs ;
     function getstatus() returns POs;
     entity Poitems as projection on transaction.poitems;

    

}
