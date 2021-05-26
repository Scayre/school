package com.onlineschool.school.repos;

import com.onlineschool.school.domain.Student;
import org.springframework.data.repository.CrudRepository;

public interface StudentRepo extends CrudRepository<Student, Long> {

}
