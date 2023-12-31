package com.example.productmanager.service;

import com.example.productmanager.model.Product;
import com.example.productmanager.repository.IProductRepo;
import com.example.productmanager.repository.ProductRepoImpl;

import java.util.ArrayList;
import java.util.List;

public class ProductSeriveImpl implements IProductService {
    private final IProductRepo productRepo = new ProductRepoImpl();

    @Override
    public List<Product> displayList() {
        return productRepo.displayList();
    }

    @Override
    public void addProduct(Product product) {
        productRepo.addProduct(product);
    }

    @Override
    public Product findById(int id) {
        return productRepo.findById(id);
    }

    @Override
    public void editProduct(Product product) {
        productRepo.editProduct(product);
    }

    @Override
    public void deleteProduct(int id) {
        productRepo.deleteProduct(id);
    }
}
