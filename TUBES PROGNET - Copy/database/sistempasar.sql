/*
SQLyog Ultimate
MySQL - 10.4.11-MariaDB : Database - sistempasar
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sistempasar` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sistempasar`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(11) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` varchar(7) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  KEY `id_pegawai` (`id_pegawai`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

LOCK TABLES `admin` WRITE;

insert  into `admin`(`id_admin`,`id_pegawai`,`username`,`password`,`role`,`status`) values 
(1,1,'bayu','37974419a792b5e2d44822522806bc70e45d7c1a','PEGAWAI',1),
(2,2,'irham','irham','MANAGER',1),
(3,3,'yoyo','077454edf4bf8bd07430de53cc2dea185dde1e09','PEGAWAI',1);

UNLOCK TABLES;

/*Table structure for table `arus_kas` */

DROP TABLE IF EXISTS `arus_kas`;

CREATE TABLE `arus_kas` (
  `id_arus_kas` int(11) NOT NULL AUTO_INCREMENT,
  `id_kode_akun_kas` int(11) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  `jenis` varchar(20) DEFAULT NULL,
  `tanggal_catat` datetime DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_arus_kas`),
  KEY `id_kode_akun_kas` (`id_kode_akun_kas`),
  KEY `id_admin` (`id_admin`),
  CONSTRAINT `arus_kas_ibfk_1` FOREIGN KEY (`id_kode_akun_kas`) REFERENCES `kode_akun_kas` (`id_kode_akun_kas`),
  CONSTRAINT `arus_kas_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `arus_kas` */

LOCK TABLES `arus_kas` WRITE;

UNLOCK TABLES;

/*Table structure for table `history_gaji_pegawai` */

DROP TABLE IF EXISTS `history_gaji_pegawai`;

CREATE TABLE `history_gaji_pegawai` (
  `id_history_gaji_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(11) DEFAULT NULL,
  `nilai_gaji` int(11) DEFAULT NULL,
  `mulai_berlaku` datetime DEFAULT NULL,
  `selesai` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_history_gaji_pegawai`),
  KEY `id_pegawai` (`id_pegawai`),
  CONSTRAINT `history_gaji_pegawai_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `history_gaji_pegawai` */

LOCK TABLES `history_gaji_pegawai` WRITE;

UNLOCK TABLES;

/*Table structure for table `history_kontrak_lapak` */

DROP TABLE IF EXISTS `history_kontrak_lapak`;

CREATE TABLE `history_kontrak_lapak` (
  `id_history_kontrak_lapak` int(11) NOT NULL AUTO_INCREMENT,
  `id_lapak` int(11) DEFAULT NULL,
  `nilai_kontrak_tahunan` int(11) DEFAULT NULL,
  `nilai_kontrak_bulanan` int(11) DEFAULT NULL,
  `nilai_kontrak_semesteran` int(11) DEFAULT NULL,
  `mulai_berlaku` datetime DEFAULT NULL,
  `selesai` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_history_kontrak_lapak`),
  KEY `id_lapak` (`id_lapak`),
  CONSTRAINT `history_kontrak_lapak_ibfk_1` FOREIGN KEY (`id_lapak`) REFERENCES `lapak` (`id_lapak`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `history_kontrak_lapak` */

LOCK TABLES `history_kontrak_lapak` WRITE;

UNLOCK TABLES;

/*Table structure for table `kategori_aset` */

DROP TABLE IF EXISTS `kategori_aset`;

CREATE TABLE `kategori_aset` (
  `id_kategori_aset` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori_aset` varchar(20) DEFAULT NULL,
  `jenis` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_kategori_aset`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kategori_aset` */

LOCK TABLES `kategori_aset` WRITE;

UNLOCK TABLES;

/*Table structure for table `kategori_iuran` */

DROP TABLE IF EXISTS `kategori_iuran`;

CREATE TABLE `kategori_iuran` (
  `id_kategori_iuran` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori_iuran` varchar(15) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kategori_iuran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kategori_iuran` */

LOCK TABLES `kategori_iuran` WRITE;

UNLOCK TABLES;

/*Table structure for table `kategori_lapak` */

DROP TABLE IF EXISTS `kategori_lapak`;

CREATE TABLE `kategori_lapak` (
  `id_kategori_lapak` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_kategori_lapak`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `kategori_lapak` */

LOCK TABLES `kategori_lapak` WRITE;

insert  into `kategori_lapak`(`id_kategori_lapak`,`nama_kategori`) values 
(1,'Makanan'),
(2,'Bahan Baku'),
(3,'Pakaian'),
(4,'Peralatan Dapur');

UNLOCK TABLES;

/*Table structure for table `kategori_pengeluaran` */

DROP TABLE IF EXISTS `kategori_pengeluaran`;

CREATE TABLE `kategori_pengeluaran` (
  `id_kategori_pengeluaran` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_kategori_pengeluaran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kategori_pengeluaran` */

LOCK TABLES `kategori_pengeluaran` WRITE;

UNLOCK TABLES;

/*Table structure for table `kode_akun_kas` */

DROP TABLE IF EXISTS `kode_akun_kas`;

CREATE TABLE `kode_akun_kas` (
  `id_kode_akun_kas` int(11) NOT NULL AUTO_INCREMENT,
  `nama_akun_kas` varchar(20) DEFAULT NULL,
  `id_kategori_aset` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kode_akun_kas`),
  KEY `id_kategori_aset` (`id_kategori_aset`),
  CONSTRAINT `kode_akun_kas_ibfk_1` FOREIGN KEY (`id_kategori_aset`) REFERENCES `kategori_aset` (`id_kategori_aset`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kode_akun_kas` */

LOCK TABLES `kode_akun_kas` WRITE;

UNLOCK TABLES;

/*Table structure for table `lapak` */

DROP TABLE IF EXISTS `lapak`;

CREATE TABLE `lapak` (
  `id_lapak` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lapak` varchar(20) DEFAULT NULL,
  `id_kategori_lapak` int(11) DEFAULT NULL,
  `nama_pemilik` varchar(20) DEFAULT NULL,
  `alamat_pemilik` text DEFAULT NULL,
  `foto_pemilik` text DEFAULT NULL,
  `posisi_lapak` varchar(5) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `tanggal_pendaftaran` datetime DEFAULT NULL,
  `tanggal_akhir_kontrak` datetime DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_lapak`),
  KEY `id_kategori_lapak` (`id_kategori_lapak`),
  KEY `id_admin` (`id_admin`),
  CONSTRAINT `lapak_ibfk_1` FOREIGN KEY (`id_kategori_lapak`) REFERENCES `kategori_lapak` (`id_kategori_lapak`),
  CONSTRAINT `lapak_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `lapak` */

LOCK TABLES `lapak` WRITE;

insert  into `lapak`(`id_lapak`,`nama_lapak`,`id_kategori_lapak`,`nama_pemilik`,`alamat_pemilik`,`foto_pemilik`,`posisi_lapak`,`status`,`tanggal_pendaftaran`,`tanggal_akhir_kontrak`,`id_admin`) values 
(1,'Mampank',3,'Ahmad Saefulah','Jl. Kecubung Denpasar','ÿØÿà','1A',1,'2020-10-01 10:00:00','2020-11-01 10:00:00',1),
(2,'Geprek Mami',1,'Bu Ijah','Jl. Sudirman Denpasar','ÿØÿà','1B',1,'2020-10-02 11:00:00','2021-11-02 11:00:00',1),
(3,'Tekstil Bujang',2,'Raj','Jl. Sana Sini','ÿØÿá^¼Exif','1C',1,'2020-10-03 12:00:00','2020-11-03 12:00:00',1),
(4,'Nyemil Kuy',1,'Mak Ompong','Jl. Kuningan Melati',NULL,'2A',1,'2020-10-04 13:00:00','2022-11-04 13:00:00',1),
(5,'Banten Suci',4,'Gek Dara','Jl. Kerauhan',NULL,'2B',1,'2020-10-05 14:00:00','2022-11-05 14:00:00',1);

UNLOCK TABLES;

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `aktivitas` text DEFAULT NULL,
  `tabel` varchar(20) DEFAULT NULL,
  `modul` varchar(20) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_log`),
  KEY `id_admin` (`id_admin`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `log` */

LOCK TABLES `log` WRITE;

insert  into `log`(`id_log`,`aktivitas`,`tabel`,`modul`,`tanggal`,`id_admin`) values 
(1,'Pegawai yoyo mencari lapak Mampank','pembayaran_kontrak','PEMBAYARAN KOTRAK LA','2020-12-24 13:51:09',1),
(2,'Pegawai yoyo mencatat pembayaran kontrak lapak Mampank dari tanggal 2020-12-24 13:51:09 dengan total 100000 rupiah','pembayaran_kontrak','PEMBAYARAN KOTRAK LA','2020-12-24 13:51:09',1),
(3,'Pegawai bayu mencari lapak Geprek Mami','pembayaran_kontrak','PEMBAYARAN KOTRAK LA','2020-12-24 18:44:30',1),
(4,'Pegawai bayu mencatat pembayaran kontrak lapak Geprek Mami dari tanggal 2020-12-24 18:44:30 dengan total 2400000 rupiah','pembayaran_kontrak','PEMBAYARAN KOTRAK LA','2020-12-24 18:44:30',1),
(5,'Pegawai bayu mencari lapak Nyemil Kuy','pembayaran_kontrak','PEMBAYARAN KOTRAK LA','2020-12-24 20:18:55',1),
(6,'Pegawai bayu mencatat pembayaran kontrak lapak Nyemil Kuy dari tanggal 2020-12-24 20:18:55 dengan total 1800000 rupiah','pembayaran_kontrak','PEMBAYARAN KOTRAK LA','2020-12-24 20:18:55',1),
(7,'Pegawai bayu mencari lapak Nyemil Kuy','pembayaran_kontrak','PEMBAYARAN KOTRAK LA','2020-12-24 20:21:19',1),
(8,'Pegawai bayu mencatat pembayaran kontrak lapak Nyemil Kuy dari tanggal 2020-12-24 20:21:19 dengan total 7200000 rupiah','pembayaran_kontrak','PEMBAYARAN KOTRAK LA','2020-12-24 20:21:19',1),
(9,'Pegawai yoyo mencari lapak Banten Suci','pembayaran_kontrak','PEMBAYARAN KOTRAK LA','2020-12-25 10:27:21',1),
(10,'Pegawai yoyo mencatat pembayaran kontrak lapak Banten Suci dari tanggal 2020-12-25 10:27:21 dengan total 3600000 rupiah','pembayaran_kontrak','PEMBAYARAN KOTRAK LA','2020-12-25 10:27:21',1);

UNLOCK TABLES;

/*Table structure for table `neraca` */

DROP TABLE IF EXISTS `neraca`;

CREATE TABLE `neraca` (
  `id_neraca` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori_aset` int(11) DEFAULT NULL,
  `id_periode_laporan` int(11) DEFAULT NULL,
  `tanggal_catat` datetime DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  PRIMARY KEY (`id_neraca`),
  KEY `id_kategori_aset` (`id_kategori_aset`),
  KEY `id_periode_laporan` (`id_periode_laporan`),
  CONSTRAINT `neraca_ibfk_1` FOREIGN KEY (`id_kategori_aset`) REFERENCES `kategori_aset` (`id_kategori_aset`),
  CONSTRAINT `neraca_ibfk_2` FOREIGN KEY (`id_periode_laporan`) REFERENCES `periode_laporan` (`id_periode_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `neraca` */

LOCK TABLES `neraca` WRITE;

UNLOCK TABLES;

/*Table structure for table `pegawai` */

DROP TABLE IF EXISTS `pegawai`;

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pegawai` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `foto` text DEFAULT NULL,
  PRIMARY KEY (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `pegawai` */

LOCK TABLES `pegawai` WRITE;

insert  into `pegawai`(`id_pegawai`,`nama_pegawai`,`alamat`,`foto`) values 
(1,'Bayu','Jl. Blong Poh No. 3 Jimbaran','ÿØÿá'),
(2,'Irham',NULL,NULL),
(3,'Yoyo','Jl. Sana','ÿØÿá^¼Exif');

UNLOCK TABLES;

/*Table structure for table `pembayaran_gaji` */

DROP TABLE IF EXISTS `pembayaran_gaji`;

CREATE TABLE `pembayaran_gaji` (
  `id_pembayaran_gaji` int(11) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(11) DEFAULT NULL,
  `nilai_gaji` int(11) DEFAULT NULL,
  `tanggal_bayar` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran_gaji`),
  KEY `id_pegawai` (`id_pegawai`),
  CONSTRAINT `pembayaran_gaji_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pembayaran_gaji` */

LOCK TABLES `pembayaran_gaji` WRITE;

UNLOCK TABLES;

/*Table structure for table `pembayaran_iuran` */

DROP TABLE IF EXISTS `pembayaran_iuran`;

CREATE TABLE `pembayaran_iuran` (
  `id_pembayaran_iuran` int(11) NOT NULL AUTO_INCREMENT,
  `id_lapak` int(11) DEFAULT NULL,
  `tanggal_bayar` datetime DEFAULT NULL,
  `tanggal_iuran` datetime DEFAULT NULL,
  `periode_iuran` int(11) DEFAULT NULL,
  `id_kategori_iuran` int(11) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `id_manager` int(11) DEFAULT NULL,
  `tanggal_penyerahan` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran_iuran`),
  KEY `id_lapak` (`id_lapak`),
  KEY `id_kategori_iuran` (`id_kategori_iuran`),
  KEY `id_pegawai` (`id_pegawai`),
  KEY `id_manager` (`id_manager`),
  CONSTRAINT `pembayaran_iuran_ibfk_1` FOREIGN KEY (`id_lapak`) REFERENCES `lapak` (`id_lapak`),
  CONSTRAINT `pembayaran_iuran_ibfk_2` FOREIGN KEY (`id_kategori_iuran`) REFERENCES `kategori_iuran` (`id_kategori_iuran`),
  CONSTRAINT `pembayaran_iuran_ibfk_3` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`),
  CONSTRAINT `pembayaran_iuran_ibfk_4` FOREIGN KEY (`id_manager`) REFERENCES `admin` (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pembayaran_iuran` */

LOCK TABLES `pembayaran_iuran` WRITE;

UNLOCK TABLES;

/*Table structure for table `pembayaran_kontrak` */

DROP TABLE IF EXISTS `pembayaran_kontrak`;

CREATE TABLE `pembayaran_kontrak` (
  `id_pembayaran_kontrak` int(11) NOT NULL AUTO_INCREMENT,
  `id_lapak` int(11) DEFAULT NULL,
  `tanggal_bayar` datetime DEFAULT NULL,
  `tanggal_kontrak_awal` datetime DEFAULT NULL,
  `tanggal_kontrak_akhir` datetime DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `id_manager` int(11) DEFAULT NULL,
  `tanggal_penyerahan` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran_kontrak`),
  KEY `id_lapak` (`id_lapak`),
  KEY `id_admin` (`id_admin`),
  KEY `id_manager` (`id_manager`),
  CONSTRAINT `pembayaran_kontrak_ibfk_1` FOREIGN KEY (`id_lapak`) REFERENCES `lapak` (`id_lapak`),
  CONSTRAINT `pembayaran_kontrak_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  CONSTRAINT `pembayaran_kontrak_ibfk_3` FOREIGN KEY (`id_manager`) REFERENCES `admin` (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pembayaran_kontrak` */

LOCK TABLES `pembayaran_kontrak` WRITE;

UNLOCK TABLES;

/*Table structure for table `periode_laporan` */

DROP TABLE IF EXISTS `periode_laporan`;

CREATE TABLE `periode_laporan` (
  `id_periode_laporan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_periode` varchar(20) DEFAULT NULL,
  `tanggal_awal_periode` datetime DEFAULT NULL,
  `tanggal_akhir_periode` datetime DEFAULT NULL,
  `id_laporan_sebelumnya` int(11) DEFAULT NULL,
  `uang_kas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_periode_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `periode_laporan` */

LOCK TABLES `periode_laporan` WRITE;

UNLOCK TABLES;

/*Table structure for table `rincian_pengeluaran` */

DROP TABLE IF EXISTS `rincian_pengeluaran`;

CREATE TABLE `rincian_pengeluaran` (
  `id_rincian_pengeluaran` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori_pengeluaran` int(11) DEFAULT NULL,
  `id_periode_laporan` int(11) DEFAULT NULL,
  `uraian` text DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `satuan` varchar(10) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `tanggal_pencatatan` datetime DEFAULT NULL,
  `tanggal_pelunasan` datetime DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_rincian_pengeluaran`),
  KEY `id_kategori_pengeluaran` (`id_kategori_pengeluaran`),
  KEY `id_periode_laporan` (`id_periode_laporan`),
  KEY `id_admin` (`id_admin`),
  CONSTRAINT `rincian_pengeluaran_ibfk_1` FOREIGN KEY (`id_kategori_pengeluaran`) REFERENCES `kategori_pengeluaran` (`id_kategori_pengeluaran`),
  CONSTRAINT `rincian_pengeluaran_ibfk_2` FOREIGN KEY (`id_periode_laporan`) REFERENCES `periode_laporan` (`id_periode_laporan`),
  CONSTRAINT `rincian_pengeluaran_ibfk_3` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rincian_pengeluaran` */

LOCK TABLES `rincian_pengeluaran` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
