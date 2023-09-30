package com.example.studentmanager.model;

public class Student {
    private int id;
    private String name;
    private String dob;
    private String classId;
    private String email;
    private String phone;

    public Student() {
    }

    public Student(String name, String dob) {
        this.name = name;
        this.dob = dob;
    }

    public Student(String name, String dob, String classId, String email, String phone) {
        this.name = name;
        this.dob = dob;
        this.classId = classId;
        this.email = email;
        this.phone = phone;
    }

    public Student(int id, String name, String dob, String classId, String email, String phone) {
        this.id = id;
        this.name = name;
        this.dob = dob;
        this.classId = classId;
        this.email = email;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
