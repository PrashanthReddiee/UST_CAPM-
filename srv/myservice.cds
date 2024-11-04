service MyService @(path: 'Myservice') {

    function greetings( name: String(32))
    returns String;
    function multi(a: Int16, b:Int16)
    returns Int32;

}