-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.3.9-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- child 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `child` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `child`;

-- 테이블 child.seoul2_avg 구조 내보내기
CREATE TABLE IF NOT EXISTS `seoul2_avg` (
  `score_avg` int(11) DEFAULT NULL,
  `teacher_avg` int(11) DEFAULT NULL,
  `maxchild_avg` int(11) DEFAULT NULL,
  `nowchild_avg` int(11) DEFAULT NULL,
  `child_per_teacher` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 child.seoul2_avg:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `seoul2_avg` DISABLE KEYS */;
INSERT IGNORE INTO `seoul2_avg` (`score_avg`, `teacher_avg`, `maxchild_avg`, `nowchild_avg`, `child_per_teacher`) VALUES
	(0, 9, 45, 37, 4);
/*!40000 ALTER TABLE `seoul2_avg` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
