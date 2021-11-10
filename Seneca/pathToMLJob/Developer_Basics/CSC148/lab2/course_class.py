"""CSC148 Class Design Recipe: course example

=== CSC148 Fall 2018 ===
Department of Computer Science,
University of Toronto

=== Module description ===
This module contains the sample code accompanying the Class Design Recipe.
"""
from typing import Dict, Optional


class Course:
    """A university course.

    === Attributes ===
    name: the name of this course.
    cap: The enrolment cap for this course, i.e., the maximum number of
        students who may enrol.

    === Private Attributes ===
    _scheme:
        The marking scheme for this course.  Each key is an element of the
        course, and its value is the weight of that element towards the
        course grade.
    _grades:
        The grades earned so far in this course.  Each key is a student
        ID and its value is a dict mapping a course element to the student's
        mark on that element.  If a student did not submit that element,
        it does not appear as a key in the student's dict.  If, however,
        they earned a grade of zero, this is recorded as any other grade
        would be.

    === Representation Invariants ===
    - The sum of all weights in _scheme must be 100.
    - Each key in every student's dict of grades must be an element of the
      course grading scheme, i.e., must occur as a key in _scheme.

    === Sample Usage ===

    >>> his250 = \
        Course('his250', 3, dict(a1=10, a2=10, midterm=30, final=50))
    >>> his250.enrol('123456789')
    True
    >>> his250.enrol('111111111')
    True
    >>> his250.enrol('888888888')
    True
    >>> his250.enrol('222222222')
    False
    >>> his250.record_grade('123456789', 'a1', 80)
    True
    >>> his250.record_grade('123456789', 'a2', 90)
    True
    >>> his250.record_grade('123456789', 'midterm', 70)
    True
    >>> his250.record_grade('123456789', 'final', 80)
    True
    >>> his250.record_grade('888888888', 'a1', 76)
    True
    >>> his250.grade('888888888', 'a1')
    76
    >>> his250.course_grade('123456789')
    78.0
    >>> # Low because student 222222222 did not get a grade for a1:
    >>> his250.class_average('a1')
    52.0
    """
    name: str
    cap: int
    _scheme: Dict[str, int]
    _grades: Dict[str, Dict[str, int]]

    def __init__(self, name: str, cap: int, scheme: Dict[str, int]) -> None:
        """Initialize this course.

        Precondition: The sum of all values of <scheme> must equal 100.

        >>> c = Course('cscFun', 50, {'exam': 100})
        >>> c.name
        'cscFun'
        >>> c.cap
        50
        """
        self.name = name
        self.cap = cap
        self._scheme = scheme
        self._grades = {}

    def __str__(self) -> str:
        """Return a string representing this course.

        >>> c = Course('cscFun', 50, {'exam': 100})
        >>> print(c)
        Name: cscFun
        Enrolment: 0 of 50
        """
        return 'Name: {}\nEnrolment: {} of {}'.format(
            self.name,
            len(self._grades),
            self.cap)
    #  eq to check whether two instances are equal.

    def enrol(self, student_id: str) -> bool:
        """Enrol a student in this course.

        Enrol the student with id <student_id> in this course, if there is
        room.

        Return whether enrolment was successful, i.e., this student was not
        already enrolled, and there was room for to enrol them.

        >>> c = Course('cscFun', 50, {'exam': 100})
        >>> c.enrol('12345')
        True
        >>> c.grade('12345', 'exam') is None
        True
        """
        if len(self._grades) < self.cap:
            if student_id in self._grades:
                return False
            else:
                self._grades[student_id] = {}
                return True
        else:
            return False

    def record_grade(self, student_id: str, element: str, grade: int) -> bool:
        """Record a grade for a student in this course.

        Record <grade> for the student with <student_id> on <element> in this
        course. If the student already has a grade on this course element,
        replace it with the new grade.

        Return whether the grade was successfully recorded, i.e., if the
        student is enrolled.

        Preconditions:
          - <element> must be in the course marking scheme.
          - <grade> must be between 0 and 100.

        >>> c = Course('cscFun', 50, {'exam': 100})
        >>> c.enrol('12345')
        True
        >>> c.record_grade('12345', 'exam', 98)
        True
        """
        if student_id in self._grades:
            self._grades[student_id][element] = grade
            return True
        else:
            return False

    def grade(self, student_id: str, element: str) -> Optional[int]:
        """Report the grade for a student on an element in this course.

        Return the grade for the student with id <student_id> on <element>,
        or None if the student did not submit <element>.

        Preconditions:
          - The student with id <student_id> must be enrolled in this course.
          - <element> must be in the marking scheme for this course.

        >>> c = Course('cscFun', 50, {'exam': 100})
        >>> c.enrol('12345')
        True
        >>> c.record_grade('12345', 'exam', 98)
        True
        >>> c.grade('12345', 'exam')
        98
        """
        if element in self._grades[student_id]:
            return self._grades[student_id][element]
        else:
            return None

    def course_grade(self, student_id: str) -> Optional[int]:
        """Return the course grade for a student.

        Report the course grade for the student with <student_id>, according
        to the course marking scheme.

        Return None if the student is not enrolled.

        >>> csc148 = \
        Course('csc148', 120, dict(a1=10, a2=10, t1=15, t2=15, final=50))
        >>> csc148.enrol('123456789')
        True
        >>> csc148.record_grade('123456789', 'a1', 100)
        True
        >>> csc148.record_grade('123456789', 'final', 100)
        True
        >>> print(csc148.course_grade('123456789'))
        60.0
        """
        if student_id in self._grades:
            total = 0.0
            history = self._grades[student_id]
            for element in self._scheme:
                weight = self._scheme[element]
                if element in history:
                    total += (history[element] * weight) / 100
            return total
        else:
            return None

    def class_average(self, element: str) -> Optional[float]:
        """Report the average grade in the class on <element>.

        Return None if no student has submitted <element>.

        Precondition: <element> is in the course grading scheme.

        >>> csc148 = \
        Course('csc148', 120, dict(a1=10, a2=10, t1=15, t2=15, final=50))
        >>> csc148.enrol('123456789')
        True
        >>> csc148.enrol('111111111')
        True
        >>> csc148.enrol('888888888')
        True
        >>> csc148.record_grade('123456789', 'a1', 100)
        True
        >>> csc148.record_grade('888888888', 'a1', 80)
        True
        >>> print(csc148.class_average('a1'))
        60.0
        """
        total = 0
        num = 0
        for history in self._grades.values():
            if element in history:
                total += history[element]
                num += 1
        if num == 0:
            return None
        else:
            return total / len(self._grades)


if __name__ == '__main__':
    import doctest
    doctest.testmod()

    import python_ta
    python_ta.check_all()
