def sum_negative_between_min_max(arr: list):
    """Функция для подсчета суммы между минимальным
    и максимальным отрицательным значением элементов
     массива"""

    # Если длина массива меньше 2, то нет смысла рассчитывать сумму.
    if len(arr) < 2:
        return 0

    # Вычисляем ключи для минимального и максимального значения массива.
    min_value = min(arr)
    max_value = max(arr)
    min_index = arr.index(min_value)
    max_index = arr.index(max_value)

    # Если максимальное значение равно минимального, то нет смысла высчитывать сумму.
    if min_index == max_index:
        return 0

    # Если индекс минимального числа расположен после максимального, то меняем их местами.
    if min_index > max_index:
        min_index, max_index = max_index, min_index

    # Агрегация суммы отрицательных элементов
    sum_negative = 0
    for i in range(min_index + 1, max_index):
        if arr[i] < 0:
            sum_negative += arr[i]

    return sum_negative

# Пример использования
arr = [3, -2, 1, -4, -1, -2, 5, -1, 2]
print(sum_negative_between_min_max(arr))
