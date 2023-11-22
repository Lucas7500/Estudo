class Car {
  constructor(Name, Color, Kind, Value) {
    this.Name = Name
    this.Color = Color
    this.Kind = Kind
    this.Value = Value

    this.description = function () {
      return `${this.Name} is a ${this.Color} ${this.Kind} that is worth ${this.Value}`
    }
  }
}

let car1 = new Car("Fer", "red", "convertible", 60000)
let car2 = new Car("Jump", "blue", "van", 10000)

console.log(car1.description())
