package com.aloha.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aloha.board.domain.Boards;
import com.aloha.board.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@CrossOrigin("*")
@RestController
@RequestMapping("/boards")
public class BoardController {

    @Autowired BoardService boardService;

    // ⭐ sp-crud
    @GetMapping()
    public ResponseEntity<?> getAllBoard() {
        try {
            List<Boards> boardList = boardService.list();
            return new ResponseEntity<>(boardList, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<?> getOneBoard(
        @PathVariable("id") String id
    ) {
        try {
            Boards board = boardService.selectById(id);
            return new ResponseEntity<>(board, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    /* 
     * @RequestBody 붙일 때 안 붙일 때 차이
     * - @RequestBody ⭕ : application/json, application/xml
     * - @RequestBody ❌ : multipart/form-data, applcation/x-www-form-urlencoded
     * 
    */
    @PostMapping(value = "", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> createBoardFormData(Boards board) {
        log.info("게시글 등록 - multipart/form-data");
        log.info("########### board ");
        log.info(": "+ board);
        try {
            boolean result = boardService.insert(board);
            if( result ) {
                return new ResponseEntity<>("SUCCESS", HttpStatus.CREATED);
            } else {
                return new ResponseEntity<>("FAIL", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping(value = "", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> createBoardJSON(@RequestBody Boards board) {
        log.info("게시글 등록 - application/json");
        try {
            boolean result = boardService.insert(board);
            if( result ) {
                return new ResponseEntity<>("SUCCESS", HttpStatus.CREATED);
            } else {
                return new ResponseEntity<>("FAIL", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @PutMapping(value = "", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> updateBoardForm(Boards board) {
        try {
            boolean result = boardService.updateById(board);
            if( result ) {
                return new ResponseEntity<>("SUCCESS", HttpStatus.OK);
            } else {
                return new ResponseEntity<>("FAIL", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @PutMapping(value = "", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> updateBoard(@RequestBody Boards board) {
        try {
            boolean result = boardService.updateById(board);
            if( result ) {
                return new ResponseEntity<>("SUCCESS", HttpStatus.OK);
            } else {
                return new ResponseEntity<>("FAIL", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<?> destroyBoard(@PathVariable("id") String id) {
        try {
            boolean result = boardService.deleteById(id);
            if( result ) {
                return new ResponseEntity<>("SUCCESS", HttpStatus.OK);
            } else {
                return new ResponseEntity<>("FAIL", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
