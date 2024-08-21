using { cuid, Currency } from '@sap/cds/common';
//using { ust.dhruvi.khasia.db } from './common';

namespace ust.dhruvi.khasia.db; //Namespace which uniquely identifies the project

context master {                //Master indicates data that does not change frequently

    entity employees: cuid {    //Employees database table 
        nameFirst: String(40);
        nameMiddle: String(40);
        nameLast: String(40);
        nameInitials: String(40);
        gender: String(1);
        language: String(1);
        phoneNumber: String(30);
        Email: String(255);
        loginName: String(12);
        Currency: Currency;
        salaryAmount: Decimal(10, 2);
        accountNumber: String(16);
        bankId: String(8);
        bankName: String(64);

    }
    
}