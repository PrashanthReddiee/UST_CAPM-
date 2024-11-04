sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ust/prashanth/purchaseorderapp/test/integration/FirstJourney',
		'ust/prashanth/purchaseorderapp/test/integration/pages/POsList',
		'ust/prashanth/purchaseorderapp/test/integration/pages/POsObjectPage',
		'ust/prashanth/purchaseorderapp/test/integration/pages/PoitemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, POsList, POsObjectPage, PoitemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ust/prashanth/purchaseorderapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOsList: POsList,
					onThePOsObjectPage: POsObjectPage,
					onThePoitemsObjectPage: PoitemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);