module.exports = cds.service.impl( async function(){
 
    const { EmployeeSet } = this.entities;
 
    this.before('CREATE',EmployeeSet, async(req,res)=>{
        let salary = parseInt(req.data.salaryAmount);
        let currency = req.data.Currency_code;
        if(salary >= 50000 || currency != 'USD'){
            req.error(500,"Employee's salary must be less than 50000 USD")
        }else{
            console.log('Create operation successful');
       
        }
    });
 
    this.before('UPDATE', EmployeeSet, async(req) => {
       
        var salary = parseInt(req.data.salaryAmount);
        let currency = req.data.Currency_code;
        let id=req.data.ID;
        let fname=req.data.nameFirst;
        let loginName=req.data.loginName;
        const pastData = await SELECT.from(EmployeeSet).columns('nameFirst', 'loginName').where ({ID:id})
        if(salary >= 50000 || currency != 'USD'){
            req.error(500,"Employee's salary must be less than 50000 USD");
        }else if(fname != pastData[0].nameFirst || loginName != pastData[0].loginName){
            req.error(500,"Operation not allowed");
        }else{
            console.log('Update operation successful');
        }
    });
 
    this.before('DELETE', EmployeeSet, async(req)=>{
        let id=req.data.ID;
        const pastData = await SELECT.from(EmployeeSet).columns('nameFirst').where ({ID:id});
        console.log(pastData[0].nameFirst[0]);
        if(pastData[0].nameFirst[0] == 'S'){
            req.error(500,'Operation Not Possible');
        }else{
            console.log('Delete Operation Successful');
        }
    })
 
})