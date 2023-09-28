package com.example.productmanager.repository;

import com.example.productmanager.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepoImpl implements IProductRepo {
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1,"Corvette Stingray", 80000, "Blue", "Chevrolet"));
        productList.add(new Product(2,"Spectre", 422000, "2024", "Rolls-Royce"));
        productList.add(new Product(3,"Maybach", 195000, "S-Class", "Mercedes"));
        productList.add(new Product(4,"Flying Spur", 215000, "Orange 2024", "Bentley"));
    }
    @Override
    public List<Product> displayList() {
        return productList;
    }

    @Override
    public void addProduct(Product product) {
        product.setId(productList.get(productList.size() - 1).getId() + 1);
        productList.add(product);
    }

    @Override
    public Product findById(int id) {
        for (Product product : productList) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    @Override
    public void editProduct(Product product) {
        for (Product prod : productList) {
            if (prod.getId() == product.getId()) {
                productList.set(productList.indexOf(prod), product);
            }
        }
    }
}
