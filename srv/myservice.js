module.exports = async(srv) =>{

    srv.on( 'greetings' , ( req,res) =>{
        return "Good Morning !" + req.data.name;
    }) 

    srv.on( 'multi' , (req,res) =>{
        return req.data.a * req.data.b
    })
}