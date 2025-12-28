# Judul Project
```
MANAGEMENT LIBRARY SYSTEM
```
## Repository Outline
```
1. books.csv
    - bersi raw data menegnai data buku
2. branch.csv
    - bersi raw data menegnai data cabang
3. employees.csv
    - bersi raw data menegnai data karyawan
4. issued_status.csv
    - bersi raw data menegnai data penyewaan buku
5. members.csv
    - bersi raw data menegnai data penyewa buku
6. return_status.csv
    - bersi raw data menegnai data pengembalain buku yang disewakan
7. buku_belum_balik.csv
    - data baru berisi informasi mengenai buku yang belum dibalikkin
8. Assign_Foreign_Key.sql
    - berisi querry sql untuk assign querry guna menghubungkan setiap table
9. create_table.sql
    - berisi querry sql untuk membuat table sesuai dataframe
10. insert_value.sql
    - berisi querry sql untuk mengisi nilai table
11. Question.sql
    - berisi querry sql untuk menjawab pertanyaan 
12.question.ipynb 
    - querry sql untuk menjawab pertanyaan namun dilakukan di text editor (vs code)
13. ERD.png 
    - bersisi relation table
```

## Problem Background
```
Sebuah perusahaan jasa sewa buku ingin melakukan eksxpansi bisnis dengan membuka cabang baru, saat ini perusahaan tersebut memiliki 3 cabang. Sebelum membuka cabang yang baru perusahaan ini ingin melakukan analisis terhadap cabang cabang yang sudah ada guna mendapat insight yang dapat di aplikasikan jika nantinya perusahaan ini jadi membuka cabang baru. Selain untuk masukan terhadap cabang baru yang rencananya akan dibuka, analisis ini digunakan sebagai evaluasi terhadap cabang yang sudah exist mengenai performa dan apakah ada hal yang bisa diaplikasikan terhadap cabang yang exist.
```

## Project Output
``` 
Menghasilkan poin insight
```

## Data
```
Perusahaan ini memiliki 6 tabel sebagai berikut
1. table issue, terdiri dari kolom-kolom;
    a. issued_id
    b. issued_member_id
    c. issued_book_name
    d. issued_book_isbn
    e. issued_emp_id
    f. issued_date
2. table books
    a. isbn	
    b. book_title	
    c. category	
    d. rental_price	
    e. status	
    f. author	
    g. publisher
3. table employee
    a. emp_id
    b. emp_name
    c. position
    d. salary
    e. branch_id
4. table branch
    a. branch_id
    b. manager_id
    c. branch_addres
    d. contact_no
5. table return_stat
    a. return_id
    b. issued_id
    c. return_book_name
    d. retrun_date
    e. return_book_isbn
6. table members
    a. members_id
    b. members_name
    c. members_addres
    d. reg_date
```

## Method
```
1. Buat database serta table sesuai data yang tersedia di postgree
2. Input nilai tiap table (data) dan assign primary key nya
3. Hubungkan relasi tiap table sesuai key
4. Buat dahsboard visualisasi 
```

## Stacks
```
bahasa pemrogaman
    - SQL
database
    - postgresSQL
visualization
    - tableau
```

## Question
```
1. Berapa total judul dan category buku yang tersedia
2. Berapa total buku yang disewa dan telah dikembalikan setiap branch
3. Berapa total penyewa buku dan alamatnya (member)
4. Berikan top penyewa buku (member)
5. Berikan daerah paling banyak menyewa buku
6. Berikan branch paling banyak menyewakan buku
7. Berikan buku yang paling banyak di sewa member dan harganya
8. Buat table baru yang berisi data buku yang belum dikembalikan
9. Tampilkan waktu peminjaman buku
10. Tampikan total revenue tiap branch
```
