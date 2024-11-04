using { ust.reuse as reuse } from './reuse';
using { cuid,managed,temporal } from '@sap/cds/common';


namespace ust.demo;

context master  {
    entity student: reuse.address {
        key id : reuse.guid;
        studentname : String(50);
        lastname : String(30);
        age : Integer;
        class : Association to semister;
        
    }
    entity semister {
        key id : reuse.guid;
        name: String(32);
        subject: String(32);
        hod : String(32);
   
    }
    entity books {
        key no : reuse.guid;
        subject: localized String(32);
        author : String(32);
        
    }
}

context transaction {

    entity  subs: cuid,managed,temporal{
       student : Association to many master.student;
       book : Association to one master.books; 
    }
    
}