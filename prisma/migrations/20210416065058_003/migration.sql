/*
  Warnings:

  - A unique constraint covering the columns `[city_name]` on the table `city` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[country_name]` on the table `country` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[country_code]` on the table `country` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[province_name]` on the table `province` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `city.city_name_unique` ON `city`(`city_name`);

-- CreateIndex
CREATE UNIQUE INDEX `country.country_name_unique` ON `country`(`country_name`);

-- CreateIndex
CREATE UNIQUE INDEX `country.country_code_unique` ON `country`(`country_code`);

-- CreateIndex
CREATE UNIQUE INDEX `province.province_name_unique` ON `province`(`province_name`);
