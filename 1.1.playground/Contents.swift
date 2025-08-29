class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func talk() {
        print("안녕하세요, \(name), \(age)")
    }
}

let person1 = Person(name: "Tom", age: 20)
person1.talk()
print(person1.name)

let person2 = Person(name: "Emma", age: 30)
person2.talk()
print(person2.name)
person2.age = person1.age
person2.talk()

let person3 = person1
person3.talk()
person3.name = "Chris"
person3.talk()
