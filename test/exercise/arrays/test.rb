require './test/test_helper.rb'
require_relative './solution.rb'

class Exercise::ArraysTest < Minitest::Test
  # Заменить все положительные элементы целочисленного массива на максимальное значение элементов массива.
  def test_replace
    array = [3, 2, -8, 4, 100, -6, 7, 8, -99]
    new_array = Exercise::Arrays.replace(array)

    assert new_array == [100, 100, -8, 100, 100, -6, 100, 100, -99]
  end

  # Реализовать бинарный поиск
  # Функция должна возвращать индекс элемента
  def test_bin_search
    assert Exercise::Arrays.search([1], 900) == -1
    assert Exercise::Arrays.search([1], 1) == 0
    assert Exercise::Arrays.search([], 900) == -1
    assert Exercise::Arrays.search([1, 4, 5, 7, 8, 9], 9) == 5
    assert Exercise::Arrays.search([1, 4, 5, 7, 8, 9], 1) == 0
    assert Exercise::Arrays.search([1, 4, 5], 4) == 1
    assert Exercise::Arrays.search([1, 4, 5, 7, 8, 9], 6) == -1
    array = [
      38, 51, 55, 57, 96, 110, 129, 131, 144, 146, 154, 197, 202, 228, 245, 250, 253,
      274, 290, 291, 330, 362, 383, 383, 399, 412, 416, 451, 469, 501, 561, 586, 593, 605, 617,
      631, 639, 665, 666, 670, 676, 686, 688, 698, 698, 717, 727, 742, 752, 809, 828, 830, 841,
      852, 863, 880, 884, 895, 902, 902, 914, 965, 977, 992, 993, 1014, 1016, 1038, 1056, 1065,
      1084, 1101, 1108, 1111, 1126, 1131, 1143, 1153, 1165, 1178, 1285, 1298, 1319, 1333, 1371,
      1378, 1389, 1407, 1414, 1415, 1424, 1425, 1429, 1439, 1444, 1444, 1461, 1463, 1491, 1491
    ]
    el = 278
    assert Exercise::Arrays.search(array, el) == -1
    array = (1..10000).to_a
    assert Exercise::Arrays.search(array, array[1000]) == 1000
  end
end
