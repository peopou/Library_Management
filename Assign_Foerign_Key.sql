alter table employee
add constraint fk_branch
foreign key (branch_id)
references branch(branch_id)

alter table return_stat
add constraint fk_issue
foreign key (issued_id)
references issue(issued_id)

alter table issue
add constraint fk_members
foreign key (issued_member_id)
references members (members_id)

alter table issue
add constraint fk_books
foreign key (issued_book_isbn)
references books(isbn)

alter table issue
add constraint fk_employee
foreign key (issued_emp_id)
references employee(emp_id)

alter table buku_belum_balik
add primary key (isbn)

alter table buku_belum_balik
add constraint fk_books
foreign key (isbn)
references books(isbn)