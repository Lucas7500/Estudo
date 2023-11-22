#  class Vehicle:
#     name = ""
#     kind = "car"
#     color = ""
#     value = 100.00S

#     def description(self):
#         desc_str = "%s is a %s %s worth $%.2f." % (
#             self.name, self.color, self.kind, self.value)
#         return desc_str

# car1 = Vehicle()
# car1.name = "Fer"
# car1.color = "red"
# car1.kind = "convertible"
# car1.value = 60000.00

# car2 = Vehicle()
# car2.name = "Jump"
# car2.color = "blue"
# car2.kind = "van"
# car2.value = 10000.00

# print(car1.description())
# print(car2.description())


class Car:
    def __init__(self, name, color, kind, value):
        self.name = name
        self.color = color
        self.kind = kind
        self.value = value

    def description(self):
        return (f"{self.name} is a {self.color} {self.kind} that is worth {self.value}")


car1 = Car("Fer", "red", "convertible", 60000)
car2 = Car("Jump", "blue", "van", 10000)

print(car1.description())
print(car2.description())
