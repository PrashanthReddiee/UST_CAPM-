sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'ust.prashanth.purchaseorderapp',
            componentId: 'PoitemsObjectPage',
            contextPath: '/POs/Items'
        },
        CustomPageDefinitions
    );
});