package services;
//SupplierService.java
import java.util.List;

import dao.SupplierDao;
import models.Supplier;

public class SupplierService {
 private SupplierDao supplierDao;

 public SupplierService() {
     this.supplierDao = new SupplierDao(); // Assuming you have a SupplierDao class
 }

 public List<Supplier> getAllSuppliers() {
     return supplierDao.getAllSuppliers();
 }

 public Supplier getSupplierByEmail(String email) {
     return supplierDao.getSupplierByEmail(email);
 }

 public void addSupplier(Supplier supplier) {
     supplierDao.addSupplier(supplier);
 }

 public void updateSupplier(Supplier supplier) {
     supplierDao.updateSupplier(supplier);
 }

 public void deleteSupplier(String email) {
     supplierDao.deleteSupplier(email);
 }
}
