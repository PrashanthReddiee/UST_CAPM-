namespace ust.reuse;

// type declaration for reuse with single field 
type guid : String(32);

// declare reuse sturcture ex. address data set

aspect address {
    Houseno : Integer;
    street : String(32);
    roadno: String(32);
    pincode : String(32);
}
