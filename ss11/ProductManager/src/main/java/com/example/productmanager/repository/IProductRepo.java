package com.example.productmanager.repository;

import com.example.productmanager.model.Product;

import java.util.List;

public interface IProductRepo {
    List<Product> displayList();
    void addProduct(Product product);
    Product findById(int id);
    void editProduct(Product product);
}
