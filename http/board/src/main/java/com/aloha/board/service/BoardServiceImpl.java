package com.aloha.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aloha.board.domain.Boards;
import com.aloha.board.mapper.BoardMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

    @Autowired BoardMapper boardMapper;

    @Override
    public List<Boards> list() {
        return boardMapper.list();
    }

    @Override
    public Boards select(Long no) {
        return boardMapper.select(no);
    }

    @Override
    public Boards selectById(String id) {
        return boardMapper.selectById(id);
    }

    @Override
    @Transactional
    public boolean insert(Boards entity) {
        int result = boardMapper.insert(entity);
        return result > 0;
    }

    @Override
    public boolean update(Boards entity) {
        int result = boardMapper.update(entity);
        return result > 0;
    }

    @Override
    public boolean updateById(Boards entity) {
        int result = boardMapper.updateById(entity);
        return result > 0;
    }

    @Override
    public boolean delete(Long no) {
        boolean result = boardMapper.delete(no) > 0;
        return result;
    }

    @Override
    public boolean deleteById(String id) {
        int result = boardMapper.deleteById(id);
        return result > 0;
    }

}
