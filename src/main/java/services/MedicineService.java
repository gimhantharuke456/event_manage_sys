package services;

import dao.MedicineDao;
import models.Medicine;

import java.util.List;

public class MedicineService {
    private MedicineDao medicineDao;

    public MedicineService() {
        this.medicineDao = new MedicineDao(); // Initialize MedicineDao (Assuming you have MedicineDao class)
    }

    public List<Medicine> getAllMedicines() {
        // Logic to retrieve all medicines
        return medicineDao.getAllMedicines();
    }

    public Medicine getMedicineById(int id) {
        // Logic to retrieve a medicine by ID
        return medicineDao.getMedicineById(id);
    }

    public boolean addMedicine(Medicine medicine) {
        // Logic to add a new medicine
        return medicineDao.addMedicine(medicine);
    }

    public boolean updateMedicine(Medicine medicine) {
        // Logic to update an existing medicine
        return medicineDao.updateMedicine(medicine);
    }

    public boolean deleteMedicine(int id) {
        // Logic to delete a medicine by ID
        return medicineDao.deleteMedicine(id);
    }
}
