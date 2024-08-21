//This EmpService is for Q1 - Scenario 1
using { ust.dhruvi.khasia.db.master } from '../db/demo-model';

service EmpService @(path: 'EmpService') {

    entity EmployeeSet as projection on master.employees;

}

