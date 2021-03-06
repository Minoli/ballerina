import eq;
import eq2;
import req;
import req2;

public struct person1 {
    int age;
    string name;
    string address;
    string zipcode = "95134";
    string ssn;
    int id;
}

public function <person1 p> getName () returns (string) {
    return p.name;
}

public function <person1 p> getAge () returns (int) {
    return p.age;
}

public function <person1 p> getSSN () returns (string) {
    return p.ssn;
}

public function <person1 p> setSSN (string ssn) {
    p.ssn = ssn;
}

public struct employee1 {
    int age;
    string name;
    string address;
    string zipcode = "95134";
    string ssn;
    int id;
    int employeeId = 123456;
}

public function <employee1 e> getName () returns (string) {
    return e.name;
}

public function <employee1 e> getAge () returns (int) {
    return e.age;
}

public function <employee1 e> getSSN () returns (string) {
    return e.ssn + ":employee";
}

public function <employee1 e> setSSN (string ssn) {
    e.ssn = ssn;
}

public function <employee1 e> getEmployeeId () returns (int) {
    return e.employeeId;
}


function testEquivalenceOfPrivateStructsInSamePackage () returns (string) {
    employee1 e = {age:14, name:"rat"};
    e.setSSN("234-56-7890");

    person1 p = (person1)e;

    return p.getSSN();
}

public struct person2 {
    int age;
    string name;
    string address;
    string zipcode = "95134";
    string ssn;
    int id;
}

public function <person2 p> getName () returns (string) {
    return p.name;
}

public function <person2 p> getAge () returns (int) {
    return p.age;
}

public function <person2 p> getSSN () returns (string) {
    return p.ssn;
}

public function <person2 p> setSSN (string ssn) {
    p.ssn = ssn;
}

public struct employee2 {
    int age;
    string name;
    string address;
    string zipcode = "95134";
    string ssn;
    int id;
    int employeeId = 123456;
}

public function <employee2 e> getName () returns (string) {
    return e.name;
}

public function <employee2 e> getAge () returns (int) {
    return e.age;
}

public function <employee2 e> getSSN () returns (string) {
    return e.ssn + ":employee";
}

public function <employee2 e> setSSN (string ssn) {
    e.ssn = ssn;
}

public function <employee2 e> getEmployeeId () returns (int) {
    return e.employeeId;
}

function testEquivalenceOfPublicStructsInSamePackage () returns (string) {
    employee2 e = {age:14, name:"rat"};
    e.setSSN("234-56-7890");

    person2 p = (person2)e;

    return p.getSSN();
}


function testEqOfPublicStructs () returns (string) {
    eq:employee e = {age:14, name:"rat"};
    e.setSSN("234-56-7890");

    eq:person p = (eq:person)e;

    return p.getSSN();
}


public struct employee3 {
    int age;
    string name;
    string address;
    string zipcode = "95134";
    string ssn;
    int id;
    int employeeId = 123456;
}

public function <employee3 e> getName () returns (string) {
    return e.name;
}

public function <employee3 e> getAge () returns (int) {
    return e.age;
}

public function <employee3 e> getSSN () returns (string) {
    return e.ssn + ":employee";
}

public function <employee3 e> setSSN (string ssn) {
    e.ssn = ssn;
}

public function <employee3 e> getEmployeeId () returns (int) {
    return e.employeeId;
}

function testEqOfPublicStructs1 () (string) {
    employee3 e = {age:14, name:"rat"};
    e.setSSN("234-56-1234");

    eq:person p = (eq:person)e;

    return p.getSSN();
}

function testEqOfPublicStructs2 () (string) {
    eq2:employee e = {age:14, name:"rat"};
    e.setSSN("234-56-3345");

    eq:person p = (eq:person)e;

    return p.getSSN();
}




struct userA {
    int age;
    string name;
}

function <userA ua> getName () returns (string) {
    return ua.name;
}

function <userA ua> getAge () returns (int) {
    return ua.age;
}

struct userB {
    int age;
    string name;
    string address;
}

function <userB ub> getName () returns (string) {
    return ub.name;
}

function <userB ub> getAge () returns (int) {
    return ub.age;
}

struct userFoo {
    int age;
    string name;
    string address;
    string zipcode = "23468";
}

function <userFoo u> getName () returns (string) {
    return u.name;
}

function <userFoo u> getAge () returns (int) {
    return u.age;
}


function testRuntimeEqPrivateStructsInSamePackage () (string) {
    userFoo uFoo = {age:10, name:"ttt", address:"102 Skyhigh street #129, San Jose"};

    // This is a safe cast
    var uA = (userA)uFoo;

    // This is a unsafe cast
    var uB, err = (userB)uA;
    if (err != null) {
        return err.message;
    }
    return uB.name;
}


public struct userPA {
    int age;
    string name;
}

public function <userPA ua> getName () returns (string) {
    return ua.name;
}

public function <userPA ua> getAge () returns (int) {
    return ua.age;
}

public struct userPB {
    int age;
    string name;
    string address;
}

public function <userPB ub> getName () returns (string) {
    return ub.name;
}

public function <userPB ub> getAge () returns (int) {
    return ub.age;
}

public struct userPFoo {
    int age;
    string name;
    string address;
    string zipcode = "23468";
}

public function <userPFoo u> getName () returns (string) {
    return u.name;
}

public function <userPFoo u> getAge () returns (int) {
    return u.age;
}


function testRuntimeEqPublicStructsInSamePackage () (string) {
    userPFoo uFoo = {age:10, name:"Skyhigh", address:"102 Skyhigh street #129, San Jose"};

    // This is a safe cast
    var uA = (userPA)uFoo;

    // This is a unsafe cast
    var uB, err = (userPB)uA;
    if (err != null) {
        return err.message;
    }
    return uB.name;
}

function testRuntimeEqPublicStructs () (string) {
    req:userPFoo uFoo = {age:10, name:"Skytop", address:"102 Skyhigh street #129, San Jose"};

    // This is a safe cast
    var uA = (userPA)uFoo;

    // This is a unsafe cast
    var uB, err = (userPB)uA;
    if (err != null) {
        return err.message;
    }
    return uB.name;
}

function testRuntimeEqPublicStructs1 () (string) {
    req:userPFoo uFoo = {age:10, name:"Brandon", address:"102 Skyhigh street #129, San Jose"};

    // This is a safe cast
    var uA = (userPA)uFoo;

    // This is a unsafe cast
    var uB, err = (req2:userPB)uA;
    if (err != null) {
        return err.message;
    }
    return uB.getName();
}
