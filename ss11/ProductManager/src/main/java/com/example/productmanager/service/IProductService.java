package com.example.productmanager.service;

import com.example.productmanager.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> displayList();
    void addProduct(Product product);
    Product findById(int id);
    void editProduct(Product product);
}
