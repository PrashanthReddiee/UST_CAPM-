using CatalogService as service from '../../srv/CatalogService';
annotate service.POs with @(
   Common.DefaultValuesFunction : 'getstatus',
    UI.SelectionFields :[
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        GROSS_AMOUNT,
        NET_AMOUNT
    ],
        
    UI.LineItem : [
        {
           $Type : 'UI.DataField' ,
           Value : PO_ID,
        },
        {
           $Type:'UI.DataField' ,
           Value:PARTNER_GUID.COMPANY_NAME,
        },
         {
           $Type:'UI.DataField' ,
           Value: PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        },
        {
           $Type:'UI.DataField' ,
           Value: NET_AMOUNT,
        },
        {
           $Type:'UI.DataField' ,
           Value: GROSS_AMOUNT,
        },
        {
           $Type:'UI.DataFieldForAction' ,
           Action : 'CatalogService.boost',
           Label : 'boost',
           Inline : true
        },
        {
           $Type:'UI.DataField' ,
           Value: OverallStatus,
           Criticality : ColourCode
        },

    ],
    UI.HeaderInfo:{
      TypeName : 'PurchaseOrder',
      TypeNamePlural : 'Purchase orders',
      Title:{  Value: PO_ID },
      Description : {
         Value : PARTNER_GUID.COMPANY_NAME }
      },
      UI.Facets :[
         {
           $Type : 'UI.CollectionFacet', 
           Label : 'General Information',
           Facets :[
            {
            $Type : 'UI.ReferenceFacet',
            Label : 'Order Details',
            Target : '@UI.Identification'

            },
            {
            $Type : 'UI.ReferenceFacet',
            Label : 'Order Details',
            Target : '@UI.FieldGroup'

            }

           ]
         },
         {
            $Type :'UI.ReferenceFacet',
            Label : 'PO_Items',
            Target : 'Items/@UI.LineItem',
         }
      ],
      UI.Identification:[
         {
            $Type : 'UI.DataField',
            Value : PO_ID,
            },
            {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID_NODE_KEY,
            },
            {
            $Type : 'UI.DataField',
            Value : OVERALL_STATUS,
            }
      ],
      UI.FieldGroup:{
         Label : 'PO Pricning',
         Data :[
            {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
            },
            {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
            },
            {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
            }
         ]
      }
);

annotate service.Poitems with @(
   UI.LineItem :[
      {
         $Type:'UI.DataField',
         Value: PO_ITEM_POS,
      },
      {
         $Type:'UI.DataField',
         Value: PRODUCT_GUID_NODE_KEY,
      },
      {
         $Type:'UI.DataField',
         Value: GROSS_AMOUNT,
      },
      {
         $Type:'UI.DataField',
         Value: CURRENCY_code,
      }
   ],
   UI.HeaderInfo:{
      TypeName : 'PO Items',
      TypeNamePlural : 'Purchase order items',
      Title:{  Value: PO_ITEM_POS },
      Description : {
         Value : PRODUCT_GUID_NODE_KEY }
   },
   UI.Facets:[
       {
            $Type : 'UI.ReferenceFacet',
            Label : 'More Info',
            Target : '@UI.Identification',
            }     
   ],
    UI.Identification :[
       {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
            },
             {
            $Type : 'UI.DataField',
            Value : PARENT_KEY_ID,
            },
             {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
            },
             {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
            },
             {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
            },
    ],
);

annotate service.POs with {
   PARTNER_GUID@(
      common: {
         text : PARTNER_GUID.COMPANY_NAME,
      },
      ValueList.entity: CatalogService.bussinesspartner
   );
   OVERALL_STATUS@( 
      readonly,
   )
};

annotate service.Poitems with {
   PRODUCT_GUID@(
      common: {
         text : PRODUCT_GUID.DESCRIPTION,
      },
      ValueList.entity: CatalogService.product
   )
};

@cds.odata.valuelist
annotate service.bussinesspartner with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : COMPANY_NAME,
    }]
);

@cds.odata.valuelist
annotate service.product with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : DESCRIPTION,
    }]
);
