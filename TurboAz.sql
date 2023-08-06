Create Database TurboAz;

use TurboAz
go;

Create Table Markas(
Id Int Identity (1,1) Primary Key,
[Name] Varchar(200) NOT NULL,
)

Create Table Models(
Id Int Identity (1,1) Primary Key,
[Name] Varchar(200) NOT NULL,
MarkaId Int NOT NULL,
Constraint FK_Models_MarkaId Foreign Key(MarkaId) References Markas(Id)
)

Create Table Categories(
Id Int Identity(1,1) Primary Key,
[Name] Varchar(200) NOT NULL,
)
Create Table Colors(
Id Int Identity(1,1) Primary Key,
[Name] Varchar(200) NOT NULL,
)
Create Table FuelType(
Id Int Identity(1,1) Primary Key,
[Name] Varchar(200) NOT NULL,
)
Create Table Gears(
Id Int Identity(1,1) Primary Key,
[Name] Varchar(200) NOT NULL,
)
Create Table Transmissions(
Id Int Identity(1,1) Primary Key,
[Name] Varchar(200) NOT NULL,
)
Create Table Markets(
Id Int Identity(1,1) Primary Key,
[Name] Varchar(200) NOT NULL,
)
Create Table Equipments(
Id Int Identity(1,1) Primary Key,
[Name] Varchar(200) NOT NULL,
)
Create Table Advertisments(
Id Int Identity(1,1) Primary Key,
Mileage decimal(18,1) NOT NULL,
MileageUnit tinyint NOT NULL,
Price int NOT NULL,
Currency tinyint NOT NULL,
IsCrashed bit NOT NULL,
IsPainted bit NOT NULL,
ForSpareParts bit NOT NULL,
SeatsCount tinyint,
HasLoan bit NOT NULL,
HasBarter bit NOT NULL,
Vin Varchar(25) NOT NULL,
[Description] Varchar(200) NOT NULL,
[Year] int NOT NULL,
EngineVolume int NOT NULL,
EnginePower int NOT NULL,
ModelId int NOT NULL,
CategoryId int NOT NULL,
FuelTypeId int NOT NULL,
GearId int NOT NULL,
TransmissionId int NOT NULL,
Constraint FK_Advertisment_ModelId Foreign Key (ModelId)
references Models(Id),
Constraint FK_Advertisment_FuelTypeId Foreign Key (FuelTypeId)
references FuelType(Id),
Constraint FK_Advertisment_TransmissionsId Foreign Key (TransmissionId)
references Transmissions(Id),
Constraint FK_Advertisment_GearId Foreign Key (GearId)
references Gears(Id),
Constraint FK_Advertisment_ColorId Foreign Key (ColorId)
references Colors(Id),
Constraint FK_Advertisment_CategoryId Foreign Key (CategoryId)
references Categories(Id),
Constraint FK_Advertisment_ModelId Foreign Key (ModelId)
references Models(Id),

Constraint Ck_advertisment_Price Check (Price>0),
Constraint Ck_advertisment_Year Check ([Year]>1970 and [Year]<= year(getdate())),
)

create table AvertismentsEquipments (
AdvertismentId int NOT NULL,
EquipmentId int NOT NULL,
Constraint Pk_AdvertismentEquipments Primary Key (AdvertismentId,EquipmentId)

)

Create Table Images(
Id int Primary Key identity (1,1),
[Name] varchar (200) NOT NULL,
ViewPoint tinyint,
AdvertismentId int NOT NULL,
Constraint FK_Images_AdvertismentId Foreign Key (AvertismentId)
references Advertisments(ID)
)
alter table AdvertismentEquipments
add Constraint FK_AdvertismentEquipments Foreign Key (AdvertismentId)
references Advertisments(Id),
constraint FK_AdvertismentEquipment Foreign Key (EquipmentId) references Equipments (Id)



