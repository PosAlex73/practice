class BaseClass:
    def __init__(self, base_value):
        self.base_value = base_value

    def display_base(self):
        print(f"Base Value: {self.base_value}")

    def base_method(self):
        print("This is a method from BaseClass")


class DerivedClass(BaseClass):
    def __init__(self, base_value, derived_value):
        super().__init__(base_value)
        self.derived_value = derived_value

    def display_derived(self):
        print(f"Derived Value: {self.derived_value}")

    def derived_method(self):
        print("This is a method from DerivedClass")


def test_program():
    # Создаем экземпляр производного класса
    derived_instance = DerivedClass(base_value=10, derived_value=20)

    # Вызываем методы базового класса
    derived_instance.display_base()
    derived_instance.base_method()

    # Вызываем методы производного класса
    derived_instance.display_derived()
    derived_instance.derived_method()


if __name__ == "__main__":
    test_program()