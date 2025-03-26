package com.auth.Demo.Repositories;

import com.auth.Demo.entities.StudentEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepo extends JpaRepository<StudentEntity,Long> {

    boolean existsByUsn(String usn);
}
