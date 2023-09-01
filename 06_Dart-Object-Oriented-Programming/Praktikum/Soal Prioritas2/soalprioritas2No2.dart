class Course {
  String judul;
  String deskripsi;

  Course(this.judul, this.deskripsi);
}

class Student {
  String nama;
  String kelas;
  List<Course> courses = [];

  Student(this.nama, this.kelas);

  void tambahCourse(Course course) {
    courses.add(course);
  }

  void hapusCourse(Course course) {
    courses.remove(course);
  }

  void viewCourse() {
    if (courses.isEmpty) {
      print("Student tidak memilki course");
    } else {
      print("Courses $nama $kelas :");
      for (var course in courses) {
        print("- ${course.judul} : ${course.deskripsi}");
      }
    }
  }
}

void main() {
  Course oopDart =
      Course("OOP_DART_DASAR", "mengajarkan tentang dsar dsar oop dart");
  Course flutter =
      Course("Flutter dasar", "mengajarkan penggunaan framework flutter");
  Student student = Student("Rafi", "A1");

  student.tambahCourse(oopDart);
  student.tambahCourse(flutter);
  student.viewCourse();

  student.hapusCourse(flutter);
  student.viewCourse();
}
