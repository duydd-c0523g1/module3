package com.example.productmanager.repository;

import com.example.productmanager.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepoImpl implements IProductRepo {
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product("Corvette Stingray", 80000, "Blue", "Chevrolet"));
        productList.add(new Product("Spectre", 422000, "2024", "Rolls-Royce"));
        productList.add(new Product("Maybach", 195000, "S-Class", "Mercedes"));
        productList.add(new Product("Flying Spur", 215000, "Orange 2024", "Bentley"));
    }
    @Override
    public List<Product> displayList() {
        return productList;
    }
}
