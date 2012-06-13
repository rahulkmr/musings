Person = (name, age) ->
    @name = name
    @age = age

Person::description = () ->
    "#{@name} #{@age}"

Employee = (name, age, sal) ->
    @sal = sal
    Person.call(this, name, age)

Employee.prototype = new Person()

Employee::description = () ->
    genericDesc = Person::description.call(this)
    "#{genericDesc} #{@sal}"

e = new Employee("foo", 25, 25000)
console.log e.description()
