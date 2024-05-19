// Типы данных
    let a : number  = 10;
    // Значения
    a = NaN;
    a = Infinity;

    let b : string  = "hello world";
    let c : boolean = false;

    // Авто определение (без типа)
        let d : any = "text";

    let arr1 : number[]  = [10, 11, 12];
    let arr2 : string[] = ['foo', 'bar'];

    let arr3 : Array<number> = [1, 2, 3];

    // Enum
        enum MyEnum {
            April, May, September
        };
        const enum TestEnum {
            A = 10,
            B = "lol"
        };
        a = TestEnum.A;
        b = TestEnum.B;

    // Картежи
        let cort : [number, string] = [10, 'Andrew'];

// Интерфейсы
interface ITest {
    id : number,
    name : string,
    age : number
}

type MyType = number | string;
type CombType = ITest & number;

// Классы
class User {
    name : string;
    age  : number;

    constructor(name : string, age : number) {
        this.name = name;
        this.age = age;
    }
}

let obj : User = new User('Andrew', 18);

// Генерики

function testFunc<T>(a : T): T {
    return a;
}

const anonF = <T>(a : T) => {
    console.log(a);
}

// ...

interface ITestNoId extends Omit<ITest, 'id'> {}
interface ITestOnlyId extends Pick<ITest, 'id'> {}


