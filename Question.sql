-- 1. Berapa total judul, dan category buku 
select
	count(distinct(book_title)) as jumlah_judul_buku_tersedia,
	count(distinct(category)) as jumlah_category_buku_tersedia
from books

-- 2. Berapa total buku yang dipinjam dan dikembalikan
select
	branch,
	total_dipinjam,
	total_dibalikin,
	(total_dibalikin::numeric/nullif(total_dipinjam,0)) as ratio
from
	(select 
		b.branch_id as branch,
		count(i.issued_id) as total_dipinjam,
		count(rs.return_id) as total_dibalikin
	from issue as i
	join employee as e
		on e.emp_id=i.issued_emp_id
	join branch as b
		on b.branch_id=e.branch_id
	left join return_stat as rs
		on rs.issued_id=i.issued_id
	group by 1)	
order by 4 desc

-- 3. Berapa total penyewa buku dan alamat (member)
select 
	count(members_id) as jumlah_penyewa_buku,
	count (members_addres) as jumlah_asal_penyewa
from members

-- 4. Berikan top penyewa buku (member)
select 
	m.members_name,
	m.members_id,
	count(i.issued_id) as jumlah_buku_disewa
from issue as i
join members as m
	on m.members_id = i.issued_member_id
group by 1,2
order by jumlah_buku_disewa desc

-- 5. Berikan daerah paling banyak menyewa buku
select
	m.members_addres,
	count(i.issued_id) as total_peminjaman
from issue as i
join members as m
	on m.members_id = i.issued_member_id
group by 1
order by total_peminjaman desc

-- 6. Berikan branch paling banyak menyewakan buku
select
	b.branch_id,
	b.branch_address,
	count(distinct(i.issued_id)) as total_disewa
from issue as i
join employee as e
	on e.emp_id = i.issued_emp_id
join branch as b
	on b.branch_id =e.branch_id
group by 1
order by 3 desc

-- 7. Berikan buku yang paling banyak di sewa member dan harganya
select
	book_title,
	book_isbn,
	book_category,
	total_rent,
	price,
	total,
	sum(total) over () as revenue
from
	(select 
		judul as book_title,
		isbn as book_isbn,
		category as book_category,
		total_peminjaman as total_rent,
		harga as price,
		total_peminjaman*harga as total
	from
		(select 
			b.book_title as judul,
			b.isbn as isbn,
			b.category as category,
			count(i.issued_id) as total_peminjaman,
			b.rental_price as harga
		from issue as i
		join books as b
			on b.isbn=i.issued_book_isbn
		group by 1,2
		order by 4 desc))


-- 8. buat tabel yang berisi data yang berisi buku yang belum dibalikin
drop table if exists buku_belum_balik ;
create table buku_belum_balik as
select
	isbn,
	judul_buku,
	nama,
	m_id
from
	(select
		m.members_name as nama,
		m.members_id as m_id,
		bk.book_title as judul_buku,
		bk.isbn as isbn,
		rs.return_date as pengembalian,
		i.issued_date as peminjaman
	from issue as i
	join members as m
		on m.members_id=i.issued_member_id
	join books as bk
		on bk.isbn=i.issued_book_isbn
	left join return_stat as rs
		on rs.issued_id =i.issued_id
		group by 1,2,3,4,5,6)
where pengembalian is null;
select * from buku_belum_balik

-- 9. waktu peminjaman
select
	i.issued_id,
	(rs.return_date-i.issued_date) as waktu_peminjaman
from issue as i
left join return_stat as rs
	on rs.issued_id=i.issued_id
where rs.return_date is not null
order by 2 


-- 10. Tampikan total revenue tiap branch
select 
	b.branch_id,
	count(issued_id)as total_buku_dipinjam,
	sum(bk.rental_price)as revenue
from issue as i
join employee as e
	on e.emp_id = i.issued_emp_id
join branch as b
	on b.branch_id = e.branch_id
join books as bk
	on bk.isbn=i.issued_book_isbn
group by 1
order by 3 desc

select
	distinct(issued_date) as tanggal,
	count(issued_id) as jumlah_peminjaman
from issu

select
	sum(salary) as salary,
	sum(judul*harga) revenue
from
	(select
		bk.rental_price as harga,
		count(i.issued_book_name) as judul,
		sum(e.salary)as salary
	from issue as i
	join employee as e
		on e.emp_id = i.issued_emp_id
	join books as bk
		on bk.isbn=i.issued_book_isbn
		group by 1)



