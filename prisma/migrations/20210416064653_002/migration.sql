/*
  Warnings:

  - The primary key for the `user` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `user` table. All the data in the column will be lost.
  - Added the required column `first_name` to the `user` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_name` to the `user` table without a default value. This is not possible if the table is not empty.
  - Added the required column `emailid` to the `user` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `user` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    DROP COLUMN `name`,
    ADD COLUMN     `first_name` VARCHAR(13) NOT NULL,
    ADD COLUMN     `last_name` VARCHAR(13) NOT NULL,
    ADD COLUMN     `phone_number` CHAR(10),
    ADD COLUMN     `emailid` VARCHAR(50) NOT NULL,
    ADD COLUMN     `timestamp` DATETIME(0) DEFAULT CURRENT_TIMESTAMP(0),
    ADD PRIMARY KEY (`emailid`);

-- CreateTable
CREATE TABLE `address` (
    `address_id` CHAR(12) NOT NULL,
    `user_email` VARCHAR(50) NOT NULL,
    `first_line` VARCHAR(10),
    `second_line` VARCHAR(50),
    `third_line` VARCHAR(50),
    `city_id` INTEGER NOT NULL,
    `province_id` INTEGER NOT NULL,
    `country_id` INTEGER NOT NULL,
INDEX `city_id`(`city_id`),
INDEX `country_id`(`country_id`),
INDEX `province_id`(`province_id`),
INDEX `user_email`(`user_email`),

    PRIMARY KEY (`address_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `book` (
    `book_id` CHAR(12) NOT NULL,
    `book_name` VARCHAR(100) NOT NULL,
    `isbn` VARCHAR(13) NOT NULL,
    `timestamp` DATETIME(0) DEFAULT CURRENT_TIMESTAMP(0),
UNIQUE INDEX `book.isbn_unique`(`isbn`),

    PRIMARY KEY (`book_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `city` (
    `city_id` INTEGER NOT NULL AUTO_INCREMENT,
    `city_name` VARCHAR(28) NOT NULL,

    PRIMARY KEY (`city_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `country` (
    `country_id` INTEGER NOT NULL AUTO_INCREMENT,
    `country_name` VARCHAR(30) NOT NULL,
    `country_code` VARCHAR(5),

    PRIMARY KEY (`country_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `province` (
    `province_id` INTEGER NOT NULL AUTO_INCREMENT,
    `province_name` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`province_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `status` (
    `status_id` INTEGER NOT NULL,
    `status` VARCHAR(7) NOT NULL,

    PRIMARY KEY (`status_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_sells_book` (
    `selling_id` CHAR(13) NOT NULL,
    `user_email` VARCHAR(50) NOT NULL,
    `book_id` CHAR(12) NOT NULL,
    `status` INTEGER NOT NULL,
    `price` VARCHAR(5) NOT NULL,
    `timestamp` DATETIME(0) DEFAULT CURRENT_TIMESTAMP(0),
INDEX `book_id`(`book_id`),
INDEX `status`(`status`),
INDEX `user_email`(`user_email`),

    PRIMARY KEY (`selling_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `address` ADD FOREIGN KEY (`city_id`) REFERENCES `city`(`city_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `address` ADD FOREIGN KEY (`country_id`) REFERENCES `country`(`country_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `address` ADD FOREIGN KEY (`province_id`) REFERENCES `province`(`province_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `address` ADD FOREIGN KEY (`user_email`) REFERENCES `user`(`emailid`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `user_sells_book` ADD FOREIGN KEY (`book_id`) REFERENCES `book`(`book_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `user_sells_book` ADD FOREIGN KEY (`status`) REFERENCES `status`(`status_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `user_sells_book` ADD FOREIGN KEY (`user_email`) REFERENCES `user`(`emailid`) ON DELETE CASCADE ON UPDATE CASCADE;
