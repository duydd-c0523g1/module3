CREATE TABLE nha_cc(
ma_ncc INT PRIMARY KEY AUTO_INCREMENT,
ten_ncc VARCHAR(50),
dia_chi VARCHAR(50)
);

CREATE TABLE so_dt(
ma_sdt INT,
ma_ncc INT,
PRIMARY KEY(ma_sdt, ma_ncc),
FOREIGN KEY (ma_ncc) REFERENCES nha_cc(ma_ncc)
);

CREATE TABLE phieu_xuat(
so_px INT PRIMARY KEY AUTO_INCREMENT,
ngay_xuat DATE
);

CREATE TABLE phieu_nhap(
so_pn INT PRIMARY KEY AUTO_INCREMENT,
ngay_nhap DATE
);

CREATE TABLE vat_tu(
ma_vtu INT PRIMARY KEY AUTO_INCREMENT,
ten_vtu VARCHAR(100)
);

CREATE TABLE chi_tiet_px(
so_px INT,
ma_vtu INT,
dg_xuat DOUBLE,
sl_xuat INT,
PRIMARY KEY (so_px, ma_vtu),
FOREIGN KEY (so_px) REFERENCES phieu_xuat(so_px),
FOREIGN KEY (ma_vtu) REFERENCES vat_tu(ma_vtu)
);

CREATE TABLE chi_tiet_pn(
so_pn INT,
ma_vtu INT,
dg_nhap DOUBLE,
sl_nhap INT,
PRIMARY KEY (so_pn, ma_vtu),
FOREIGN KEY (so_pn) REFERENCES phieu_nhap(so_pn),
FOREIGN KEY (ma_vtu) REFERENCES vat_tu(ma_vtu)
);

CREATE TABLE don_dh(
so_dh INT PRIMARY KEY AUTO_INCREMENT,
ngay_dh DATE
);

CREATE TABLE chi_tiet_ddh(
ma_vtu INT,
so_dh INT,
PRIMARY KEY (ma_vtu, so_dh),
FOREIGN KEY (ma_vtu) REFERENCES vat_tu(ma_vtu),
FOREIGN KEY (so_dh) REFERENCES don_dh(so_dh)
);