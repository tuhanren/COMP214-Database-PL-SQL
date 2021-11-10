"""CSC148 Prep 3: Inheritance

=== CSC148 Winter 2021 ===
Department of Computer Science,
University of Toronto

This code is provided solely for the personal and private use of
students taking the CSC148 course at the University of Toronto.
Copying for purposes other than this use is expressly prohibited.
All forms of distribution of this code, whether as given or with
any changes, are expressly prohibited.

Authors: David Liu, Sophia Huynh

All of the files in this directory and all subdirectories are:
Copyright (c) 2020 David Liu, Sophia Huynh

=== Module description ===
This module contains sample tests for Prep 3.
Complete the TODO in this file.

There is also a task inside prep3.py.
Make sure to look at that file and complete the TODO there as well.

When writing a test case, make sure you create a new function, with its
name starting with "test_". For example:

def test_my_test_case():
    # Your test here
"""
from datetime import date
from hypothesis import given
from hypothesis.strategies import integers, floats
from prep3 import SalariedEmployee, HourlyEmployee, Company


################################################################################
# Part 3
# In this part, you will be writing your own test cases from scratch.
# You must implement *at least* 2 more test cases to test your code.
# 
# These test cases must be in their own functions, their names must start 
# with "test_", and the test names must be unique.
#
# These test cases must pass on a working version of the prep3 code 
# (i.e. a working version of SalariedEmployee, HourlyEmployee, Company) and
# must create at least one SalariedEmployee or HourlyEmployee.
#
# You must NOT access any private variables.
#       
# There are no other requirements for the test cases.
################################################################################
def test_emp_get_paid_hourly() -> None:
    """Test the starting total_pay is always 0, and is decided by the pay() method"""
    emp1 = HourlyEmployee(10556, 'Mary', 50.0, 36.75)
    assert emp1.total_pay() == 0.0
    emp1.pay(date(2020, 9, 30))
    emp1.pay(date(2020, 10, 30))
    assert emp1.total_pay() == 3675


@given(ids=integers(min_value=1), wage=floats(min_value=15.0), \
       hours=floats(min_value=20.0), annual=floats(min_value=10000.0))
def test_tot_payment_start(ids: int, wage: float, hours: float, annual: float) -> None:
    """Test that the payment amount of an employee always begins with 0.0"""
    emp2 = HourlyEmployee(ids, 'Cristina', wage, hours)
    assert emp2.total_pay() == 0.0
    emp2 = SalariedEmployee(ids, 'Hakunamatata', annual)
    assert emp2.total_pay() == 0.0


def test_comp_total_payroll() -> None:
    """Test the total payroll can return the total number of all the employee payment this company ever made"""
    comp = Company([SalariedEmployee(10620, 'Goodman', 78000.0), \
                       HourlyEmployee(10625, 'Fisher', 300.0, 6.0)])
    assert comp.total_payroll() == 0.0
    comp.pay_all(date(2020, 4, 30))
    assert comp.total_payroll() == 8300.0
    comp.pay_all(date(2020, 5, 30))
    comp.pay_all(date(2020, 6, 30))
    assert comp.total_payroll() == 24900.0


# === Sample test cases below ===
# Use the below test cases as an example for writing your own test cases,
# and as a start to testing your prep3.py code.

# WARNING: THIS IS CURRENTLY AN EXTREMELY INCOMPLETE SET OF TESTS!
# We will test your code on a much more thorough set of tests!


def test_total_pay_basic() -> None:
    e = SalariedEmployee(14, 'Gilbert the cat', 1200.0)
    e.pay(date(2018, 6, 28))
    e.pay(date(2018, 7, 28))
    e.pay(date(2018, 8, 28))
    assert e.total_pay() == 300.0


def test_total_payroll_mixed() -> None:
    my_corp = Company([SalariedEmployee(24, 'Gilbert the cat', 1200.0),
                       HourlyEmployee(25, 'Chairman Meow', 500.25, 1.0)])
    my_corp.pay_all(date(2018, 6, 28))
    assert my_corp.total_payroll() == 600.25


if __name__ == '__main__':
    import pytest
    pytest.main(['prep3_starter_tests.py'])
