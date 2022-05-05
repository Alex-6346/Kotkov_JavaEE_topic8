package com.example.demo.repository;

import java.util.List;
import java.util.Optional;

import com.example.demo.entity.BookDto;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<BookDto, Integer> {

    Optional<BookDto> findByIsbnIgnoreCase(String isbn);
    List<BookDto> findAllByTitleContainingIgnoreCase(String title);
    List<BookDto> findAllByAuthorContainingIgnoreCase(String author);

    List<BookDto> findAll();
    BookDto saveAndFlush(BookDto bookDto);


}