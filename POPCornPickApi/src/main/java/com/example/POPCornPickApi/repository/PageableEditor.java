package com.example.POPCornPickApi.repository;

import java.beans.PropertyEditorSupport;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

public class PageableEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        String[] parts = text.split(",");
        int page = Integer.parseInt(parts[0].trim());
        int size = Integer.parseInt(parts[1].trim());
        setValue(PageRequest.of(page, size));
    }

    @Override
    public String getAsText() {
        Pageable pageable = (Pageable) getValue();
        return pageable.getPageNumber() + "," + pageable.getPageSize();
    }
}