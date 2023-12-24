package com.duyvu.shopapp.controllers;


import com.duyvu.shopapp.dto.CategoryDTO;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
//@Validated // Using validated here will return
@RequestMapping("api/v1/categories")
public class CategoryController {


    /**
     * Get All Categories from the database
     *
     * @return
     */
    @GetMapping("") // http://localhost:8088/api/v1/categories?page=1&limit=10
    public ResponseEntity<String> getAllCategories(
            @RequestParam("page") int page, // page in requestParam is on the header, int page is the java coding convention
            @RequestParam("limit") int limit
    ) {
        return ResponseEntity.ok(String.format("getAllCategories, page = %d, limit = %d", page, limit));
    }


    /**
     * If the param is the object ? => is called Data Transfer Object = Request Object
     *
     * @return
     */
    @PostMapping("")
    public ResponseEntity<String> insertCategory(
            @Valid @RequestBody CategoryDTO categoryDTO,
            BindingResult result) {

        // After checking validation, request return error, then check
        if (result.hasErrors()) {
            List<String> errorMessage = result.getFieldErrors()
                    .stream()
                    .map(FieldError::getDefaultMessage)
                    .toList();
            return ResponseEntity.badRequest().body(errorMessage.toString());
        }

        return ResponseEntity.ok(categoryDTO.getName());
    }

    @PutMapping("/{id}")
    public ResponseEntity<String> updateCategory(@PathVariable long id) {
        return ResponseEntity.ok("This is Push");
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteCategory() {
        return ResponseEntity.ok("This is delete");
    }
}
