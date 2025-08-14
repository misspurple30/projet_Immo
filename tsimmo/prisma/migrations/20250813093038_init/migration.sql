-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `role` ENUM('ADMIN', 'PROPRIETAIRE', 'LOCATAIRE', 'RECOUVREUR', 'USER') NOT NULL DEFAULT 'USER',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `T_Commune` (
    `CodeVille` TINYINT NOT NULL,
    `CodeCommune` SMALLINT NOT NULL AUTO_INCREMENT,
    `LibelleCommune` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`CodeCommune`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `T_CompteLocataire` (
    `IndexOp` BIGINT NOT NULL AUTO_INCREMENT,
    `CodeBail` BIGINT NOT NULL,
    `DateOperation` DATETIME(0) NOT NULL,
    `LibelleOperation` VARCHAR(300) NOT NULL,
    `Debit` DECIMAL(18, 0) NOT NULL,
    `Credit` DECIMAL(18, 0) NOT NULL,

    PRIMARY KEY (`IndexOp`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `T_FormeJuridique` (
    `CodeFormeJuridique` VARCHAR(4) NOT NULL,
    `LibelleFormeJuridique` VARCHAR(35) NOT NULL,

    PRIMARY KEY (`CodeFormeJuridique`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `T_ModePaiement` (
    `CodeModePaiement` TINYINT NOT NULL AUTO_INCREMENT,
    `LibelleModePaiement` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`CodeModePaiement`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `T_Module` (
    `CodeModule` TINYINT NOT NULL AUTO_INCREMENT,
    `NumOrdre` TINYINT NOT NULL,
    `NomModule` VARCHAR(100) NOT NULL,
    `DescModule` VARCHAR(200) NOT NULL,
    `ImgModule` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`CodeModule`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `T_OperPlateForme` (
    `LoginOp` VARCHAR(10) NOT NULL,
    `PlateForme` VARCHAR(17) NOT NULL,
    `CodeGroupe` VARCHAR(100) NOT NULL,
    `RespoOpBq` VARCHAR(1) NOT NULL,

    PRIMARY KEY (`LoginOp`, `PlateForme`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `T_Operateur` (
    `LoginOp` VARCHAR(10) NOT NULL,
    `MotPasseOp` VARCHAR(50) NOT NULL,
    `TitreOperateur` VARCHAR(5) NOT NULL,
    `NomOperateur` VARCHAR(25) NOT NULL,
    `PrenOperateur` VARCHAR(60) NOT NULL,
    `DateNaisOp` DATETIME(0) NOT NULL,
    `LieuNaisOp` VARCHAR(50) NOT NULL,
    `FonctOperateur` VARCHAR(100) NOT NULL,
    `Indicatif` VARCHAR(3) NOT NULL,
    `TelOperateur` VARCHAR(20) NOT NULL,
    `DernTentative` VARCHAR(19) NOT NULL,
    `DernPoste` VARCHAR(100) NOT NULL,
    `DernAuthentif` DATETIME(0) NOT NULL,
    `DernSystem` VARCHAR(50) NOT NULL,
    `DateSaisie` DATETIME(0) NOT NULL,
    `DateModif` DATETIME(0) NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`LoginOp`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `T_ParamSms` (
    `PlateForme` VARCHAR(50) NOT NULL,
    `CodeConnexion` VARCHAR(50) NOT NULL,
    `CodeExpediteur` VARCHAR(11) NOT NULL,

    PRIMARY KEY (`PlateForme`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `T_ParamSociete` (
    `CodeSociete` TINYINT NOT NULL AUTO_INCREMENT,
    `RaisonSoc` VARCHAR(100) NOT NULL,
    `UrlDoc` VARCHAR(100) NOT NULL,
    `UrlMaj` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`CodeSociete`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `T_Pays` (
    `CodePays` TINYINT NOT NULL AUTO_INCREMENT,
    `LibellePays` VARCHAR(50) NOT NULL,
    `Nationalite` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`CodePays`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `T_Skin` (
    `CodeSkin` VARCHAR(3) NOT NULL,
    `LibelleSkin` VARCHAR(50) NOT NULL,
    `DescriptionSkin` VARCHAR(50) NOT NULL,
    `CouleurSkin` VARCHAR(50) NOT NULL,
    `TexteSkin` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`CodeSkin`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `T_SmsSortant` (
    `Id` BIGINT NOT NULL AUTO_INCREMENT,
    `Destinataire` VARCHAR(20) NOT NULL,
    `Message` VARCHAR(1000) NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `T_TypePieceId` (
    `CodePieceId` VARCHAR(5) NOT NULL,
    `LibellePieceId` VARCHAR(50) NOT NULL,
    `LongNumId` TINYINT NOT NULL,

    PRIMARY KEY (`CodePieceId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `T_Ville` (
    `CodeVille` TINYINT NOT NULL AUTO_INCREMENT,
    `CodePays` TINYINT NOT NULL,
    `LibelleVille` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`CodeVille`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_BailLocation` (
    `CodeBail` INTEGER NOT NULL AUTO_INCREMENT,
    `CodeLocation` INTEGER NOT NULL,
    `DureeBail` TINYINT NOT NULL,
    `DebutBail` DATETIME(0) NOT NULL,
    `BailRenouvel` VARCHAR(1) NOT NULL,
    `CodeParticulier` INTEGER NOT NULL,
    `CodeEnt` INTEGER NOT NULL,
    `BailTermine` VARCHAR(1) NOT NULL,
    `DateFin` DATETIME(0) NULL,
    `Motif` VARCHAR(100) NOT NULL,
    `CodeBon` INTEGER NOT NULL,
    `DateSaisie` DATETIME(0) NOT NULL,
    `DateModif` DATETIME(0) NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,
    `ModeFacturation` VARCHAR(4) NOT NULL,

    PRIMARY KEY (`CodeBail`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_BilanPeriode` (
    `CodePropriete` SMALLINT NOT NULL,
    `Periode` VARCHAR(7) NOT NULL,
    `DebutPeriode` DATETIME(0) NOT NULL,
    `FinPeriode` DATETIME(0) NULL,
    `LoyerPeriode` DECIMAL(18, 0) NOT NULL,
    `LoyerHorsPeriode` DECIMAL(18, 0) NOT NULL,
    `ChargePeriode` DECIMAL(18, 0) NOT NULL,
    `ChargeHorsPeriode` DECIMAL(18, 0) NOT NULL,
    `Caution` DECIMAL(18, 0) NOT NULL,
    `AutreFraisRembours` DECIMAL(18, 0) NOT NULL,
    `AutreMontantProprio` DECIMAL(18, 0) NOT NULL,
    `Deduction` DECIMAL(18, 0) NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`CodePropriete`, `Periode`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_BonSortie` (
    `CodeBon` INTEGER NOT NULL AUTO_INCREMENT,
    `NomBenef` VARCHAR(80) NOT NULL,
    `QualiteBenef` VARCHAR(50) NOT NULL,
    `ContactBenef` VARCHAR(11) NOT NULL,
    `OperateurBenef` VARCHAR(10) NOT NULL,
    `CaisseSortie` VARCHAR(10) NOT NULL,
    `DateSaisie` DATETIME(0) NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`CodeBon`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_Brouillard` (
    `Operateur` VARCHAR(10) NOT NULL,
    `DateOperation` DATETIME(0) NOT NULL,
    `LibelleOperation` VARCHAR(200) NOT NULL,
    `Entree` DECIMAL(18, 0) NOT NULL,
    `Sortie` DECIMAL(18, 0) NOT NULL,
    `Solde` DECIMAL(18, 0) NOT NULL,

    PRIMARY KEY (`Operateur`, `DateOperation`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_Caisse` (
    `LoginOp` VARCHAR(10) NOT NULL,
    `DateOuverture` DATETIME(0) NOT NULL,
    `SoldeOuverture` DECIMAL(18, 0) NOT NULL,
    `DateFermeture` DATETIME(0) NULL,
    `SoldeFermeture` DECIMAL(18, 0) NULL,
    `SoldePhysique` DECIMAL(18, 0) NULL,
    `MontVerse` DECIMAL(18, 0) NOT NULL,

    PRIMARY KEY (`LoginOp`, `DateOuverture`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_Carte` (
    `SnCarte` VARCHAR(8) NOT NULL,
    `CodeBail` INTEGER NOT NULL,
    `NumLock` VARCHAR(13) NOT NULL,
    `DateCreation` DATETIME(0) NOT NULL,
    `DateMaj` DATETIME(0) NOT NULL,
    `CarteActive` VARCHAR(1) NOT NULL,

    PRIMARY KEY (`SnCarte`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_ChargeBail` (
    `CodeBail` INTEGER NOT NULL,
    `NumCharge` TINYINT NOT NULL,

    PRIMARY KEY (`CodeBail`, `NumCharge`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_ChargesLocation` (
    `CodeLocation` INTEGER NOT NULL,
    `NumCharge` TINYINT NOT NULL,
    `LibelleCharge` VARCHAR(50) NOT NULL,
    `MontChargeHT` DECIMAL(18, 0) NOT NULL,

    PRIMARY KEY (`CodeLocation`, `NumCharge`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_ConditionFinanciere` (
    `CodeCondition` SMALLINT NOT NULL AUTO_INCREMENT,
    `LibelleCondition` VARCHAR(50) NOT NULL,
    `DateSaisie` DATETIME(0) NOT NULL,
    `DateModif` DATETIME(0) NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`CodeCondition`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_ConditionFrais` (
    `CodeCondition` SMALLINT NOT NULL,
    `CodeFrais` TINYINT NOT NULL,
    `QteFrais` TINYINT NOT NULL,
    `UniteFrais` VARCHAR(7) NOT NULL,
    `MontUnitaire` DECIMAL(18, 0) NOT NULL,
    `Rembours` VARCHAR(1) NOT NULL,

    PRIMARY KEY (`CodeCondition`, `CodeFrais`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_ConditionLocation` (
    `CodeCondition` SMALLINT NOT NULL,
    `CodeLocation` INTEGER NOT NULL,

    PRIMARY KEY (`CodeCondition`, `CodeLocation`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_Decaissement` (
    `CodeDecaissement` INTEGER NOT NULL AUTO_INCREMENT,
    `CodeBon` INTEGER NOT NULL,
    `MontantBon` DECIMAL(18, 0) NOT NULL,
    `DateSaisie` DATETIME(0) NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`CodeDecaissement`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_DeductionLocataire` (
    `CodeBail` INTEGER NOT NULL,
    `Num` TINYINT NOT NULL,
    `Libelle` VARCHAR(500) NOT NULL,
    `Qte` SMALLINT NOT NULL,
    `Montant` DECIMAL(18, 0) NOT NULL,

    PRIMARY KEY (`CodeBail`, `Num`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_DetailsBon` (
    `CodeDetails` INTEGER NOT NULL AUTO_INCREMENT,
    `CodeBon` INTEGER NOT NULL,
    `CodePropriete` SMALLINT NOT NULL,
    `CodeLocation` INTEGER NOT NULL,
    `ImputLocataire` BIGINT NOT NULL,
    `CodeReparDegat` INTEGER NOT NULL,
    `MotifSortie` VARCHAR(150) NOT NULL,
    `Montant` DECIMAL(18, 0) NOT NULL,

    PRIMARY KEY (`CodeDetails`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_DetailsMontantProprio` (
    `CodeDetails` INTEGER NOT NULL AUTO_INCREMENT,
    `CodeMontant` INTEGER NOT NULL,
    `CodeBail` INTEGER NOT NULL,
    `Libelle` VARCHAR(150) NOT NULL,
    `Montant` DECIMAL(18, 0) NOT NULL,

    PRIMARY KEY (`CodeDetails`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_DroitEntree` (
    `CodeBail` INTEGER NOT NULL,
    `CodeCondition` SMALLINT NOT NULL,
    `CodeFrais` TINYINT NOT NULL,
    `MontantTTC` DECIMAL(18, 0) NOT NULL,
    `MontantOk` VARCHAR(2) NOT NULL,

    PRIMARY KEY (`CodeBail`, `CodeCondition`, `CodeFrais`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_EtatAutresMontant` (
    `NumOrdre` INTEGER NOT NULL AUTO_INCREMENT,
    `Operateur` VARCHAR(10) NOT NULL,
    `DateMont` VARCHAR(20) NOT NULL,
    `Libelle` VARCHAR(200) NOT NULL,
    `Montant` DECIMAL(18, 0) NOT NULL,

    PRIMARY KEY (`NumOrdre`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_EtatRecouvrement` (
    `Num` TINYINT NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,
    `Propriete` VARCHAR(150) NOT NULL,
    `Location` VARCHAR(100) NOT NULL,
    `Locataire` VARCHAR(100) NOT NULL,
    `Contact` VARCHAR(20) NOT NULL,
    `Loyer` DECIMAL(18, 0) NOT NULL,
    `MontPercu` DECIMAL(18, 0) NOT NULL,
    `MontPenalPercu` DECIMAL(18, 0) NOT NULL,
    `DatePaiement` VARCHAR(100) NOT NULL,
    `MoisImpute` VARCHAR(500) NOT NULL,
    `ProchainLoyer` VARCHAR(100) NOT NULL,
    `Observation` VARCHAR(150) NOT NULL,

    PRIMARY KEY (`Num`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_Etats` (
    `CodeEtat` INTEGER NOT NULL AUTO_INCREMENT,
    `NomEtat` VARCHAR(50) NOT NULL,
    `CheminEtat` VARCHAR(50) NOT NULL,
    `TypeEtat` VARCHAR(20) NOT NULL,
    `pLocataireCible` VARCHAR(1) NOT NULL,
    `pLocationCible` VARCHAR(1) NOT NULL,
    `pTypeLocation` VARCHAR(1) NOT NULL,
    `pTypeLocataire` VARCHAR(1) NOT NULL,
    `pNbPiece` VARCHAR(1) NOT NULL,
    `pNumEtage` VARCHAR(1) NOT NULL,
    `pSuperficie` VARCHAR(1) NOT NULL,
    `pLoyer` VARCHAR(1) NOT NULL,
    `pEtat` VARCHAR(1) NOT NULL,
    `pCommune` VARCHAR(1) NOT NULL,
    `pNationalite` VARCHAR(1) NOT NULL,

    PRIMARY KEY (`CodeEtat`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_Frais` (
    `CodeFrais` TINYINT NOT NULL AUTO_INCREMENT,
    `LibelleFrais` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`CodeFrais`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_GroupeAuto` (
    `CodeGroupe` VARCHAR(100) NOT NULL,
    `AttributGroupe` VARCHAR(1000) NOT NULL,
    `DeclenchGroupe` VARCHAR(5000) NOT NULL,
    `DateSaisie` DATETIME(0) NOT NULL,
    `DateModif` DATETIME(0) NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`CodeGroupe`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_ImageConstat` (
    `CodeReparDegat` INTEGER NOT NULL,
    `NomImage` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`CodeReparDegat`, `NomImage`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_ImageLocation` (
    `CodeLocation` INTEGER NOT NULL,
    `NomImage` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`CodeLocation`, `NomImage`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_ImagePropriete` (
    `CodePropriete` SMALLINT NOT NULL,
    `NomImage` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`CodePropriete`, `NomImage`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_Location` (
    `CodeLocation` INTEGER NOT NULL AUTO_INCREMENT,
    `CodePropriete` SMALLINT NOT NULL,
    `NomLocation` VARCHAR(20) NOT NULL,
    `CodeTypeLocation` TINYINT NOT NULL,
    `NbrePiece` TINYINT NOT NULL,
    `NumEtage` TINYINT NOT NULL,
    `Superficie` SMALLINT NOT NULL,
    `MontLoyerHT` DECIMAL(18, 0) NOT NULL,
    `MontTvaLoyer` DECIMAL(18, 0) NOT NULL,
    `TvaCharges` VARCHAR(1) NOT NULL,
    `LoyerDefinitifTTC` DECIMAL(18, 0) NOT NULL,
    `DateSaisie` DATETIME(0) NOT NULL,
    `DateModif` DATETIME(0) NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`CodeLocation`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_LoyerPeriode` (
    `CodeBail` INTEGER NOT NULL,
    `Periode` VARCHAR(7) NOT NULL,
    `MontLoyer` DECIMAL(18, 0) NOT NULL,
    `MontCharge` DECIMAL(18, 0) NOT NULL,

    PRIMARY KEY (`CodeBail`, `Periode`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_MajLoyer` (
    `CodeLocation` INTEGER NOT NULL,
    `DateMaj` DATETIME(0) NOT NULL,
    `AncLoyer` DECIMAL(18, 0) NOT NULL,
    `NouvLoyer` DECIMAL(18, 0) NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`CodeLocation`, `DateMaj`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_Menu` (
    `CodeMenu` SMALLINT NOT NULL AUTO_INCREMENT,
    `LibelleMenu` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`CodeMenu`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_MenuForm` (
    `CodeForm` VARCHAR(3) NOT NULL,
    `CodeMenu` SMALLINT NOT NULL,
    `LibelleForm` VARCHAR(100) NOT NULL,
    `DeclenchForm` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`CodeForm`, `CodeMenu`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_MontantProprio` (
    `CodeMontant` INTEGER NOT NULL AUTO_INCREMENT,
    `DateMontant` DATETIME(0) NOT NULL,
    `CodePropriete` SMALLINT NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`CodeMontant`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_PaiementLoyer` (
    `CodeBail` INTEGER NOT NULL,
    `CodeQuittance` INTEGER NOT NULL,
    `Periode` VARCHAR(7) NOT NULL,
    `MontLoyer` DECIMAL(18, 0) NOT NULL,
    `MontCharge` DECIMAL(18, 0) NOT NULL,
    `Penalite` DECIMAL(18, 0) NOT NULL,

    PRIMARY KEY (`CodeBail`, `CodeQuittance`, `Periode`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_ParametresGeneraux` (
    `CodeParam` TINYINT NOT NULL AUTO_INCREMENT,
    `TVA` TINYINT NOT NULL,
    `Devise` VARCHAR(20) NOT NULL,
    `CycleLoyer` TINYINT NOT NULL,
    `PeriodeDebutPoint` VARCHAR(7) NOT NULL,

    PRIMARY KEY (`CodeParam`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_Particulier` (
    `CodeParticulier` INTEGER NOT NULL AUTO_INCREMENT,
    `Civilite` VARCHAR(4) NOT NULL,
    `Nom` VARCHAR(35) NOT NULL,
    `Prenoms` VARCHAR(60) NOT NULL,
    `DateNais` DATETIME(0) NOT NULL,
    `LieuNais` VARCHAR(50) NOT NULL,
    `CodePieceId` VARCHAR(5) NOT NULL,
    `NumPieceId` VARCHAR(20) NOT NULL,
    `CodePays` TINYINT NOT NULL,
    `Fonction` VARCHAR(50) NOT NULL,
    `Employeur` VARCHAR(50) NOT NULL,
    `SitMatri` VARCHAR(15) NOT NULL,
    `NbPersonne` TINYINT NOT NULL,
    `AncResidence` VARCHAR(50) NOT NULL,
    `Indicatif` VARCHAR(3) NOT NULL,
    `Contact` VARCHAR(20) NOT NULL,
    `ObjetLocation` VARCHAR(50) NOT NULL,
    `CodeModePaiement` TINYINT NOT NULL,
    `RIB` VARCHAR(50) NOT NULL,
    `CivUrg` VARCHAR(4) NOT NULL,
    `NomPrenUrg` VARCHAR(60) NOT NULL,
    `ContactUrg` VARCHAR(20) NOT NULL,
    `ObservUrg` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`CodeParticulier`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_PointRecouvrement` (
    `Operateur` VARCHAR(10) NOT NULL,
    `Libelle` VARCHAR(200) NOT NULL,
    `Totaux` VARCHAR(20) NOT NULL,
    `Prop1` VARCHAR(20) NOT NULL,
    `Prop2` VARCHAR(20) NOT NULL,
    `Prop3` VARCHAR(20) NOT NULL,
    `Prop4` VARCHAR(20) NOT NULL,
    `Prop5` VARCHAR(20) NOT NULL,
    `Prop6` VARCHAR(20) NOT NULL,
    `Prop7` VARCHAR(20) NOT NULL,
    `Prop8` VARCHAR(20) NOT NULL,
    `Prop9` VARCHAR(20) NOT NULL,
    `Prop10` VARCHAR(20) NOT NULL,
    `Prop11` VARCHAR(20) NOT NULL,
    `Prop12` VARCHAR(20) NOT NULL,
    `Prop13` VARCHAR(20) NOT NULL,
    `Prop14` VARCHAR(20) NOT NULL,
    `Prop15` VARCHAR(20) NOT NULL,
    `Prop16` VARCHAR(20) NOT NULL,
    `Prop17` VARCHAR(20) NOT NULL,
    `Prop18` VARCHAR(20) NOT NULL,
    `Prop19` VARCHAR(20) NOT NULL,
    `Prop20` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`Operateur`, `Libelle`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_Professionnel` (
    `CodeEnt` INTEGER NOT NULL AUTO_INCREMENT,
    `RaisonSoc` VARCHAR(100) NOT NULL,
    `CodeFormeJuridique` VARCHAR(4) NOT NULL,
    `NatureActivite` VARCHAR(50) NOT NULL,
    `BpEnt` VARCHAR(30) NOT NULL,
    `Indicatif` VARCHAR(3) NOT NULL,
    `ContactEnt` VARCHAR(20) NOT NULL,
    `Banque` VARCHAR(50) NOT NULL,
    `NumCompte` VARCHAR(25) NOT NULL,
    `CodeModePaiement` TINYINT NOT NULL,
    `CivGerant` VARCHAR(4) NOT NULL,
    `NomGerant` VARCHAR(35) NOT NULL,
    `PrenGerant` VARCHAR(60) NOT NULL,
    `DateNaisGerant` DATETIME(0) NOT NULL,
    `LieuNaisGerant` VARCHAR(50) NOT NULL,
    `CodePieceId` VARCHAR(5) NOT NULL,
    `NumPieceId` VARCHAR(20) NOT NULL,
    `CodePays` TINYINT NOT NULL,
    `SitMatri` VARCHAR(20) NOT NULL,
    `BpGerant` VARCHAR(30) NOT NULL,
    `AdresseGeo` VARCHAR(50) NOT NULL,
    `ContactGerant` VARCHAR(20) NOT NULL,
    `BanqueGerant` VARCHAR(50) NOT NULL,
    `NumCompteGerant` VARCHAR(25) NOT NULL,

    PRIMARY KEY (`CodeEnt`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_Proprietaire` (
    `CodeProprio` SMALLINT NOT NULL AUTO_INCREMENT,
    `Sexe` VARCHAR(1) NOT NULL,
    `Civilite` VARCHAR(5) NOT NULL,
    `Nom` VARCHAR(25) NOT NULL,
    `Prenoms` VARCHAR(60) NOT NULL,
    `DateNais` DATETIME(0) NOT NULL,
    `LieuNais` VARCHAR(30) NOT NULL,
    `CodePieceId` VARCHAR(5) NOT NULL,
    `NumPieceId` VARCHAR(20) NOT NULL,
    `CodePays` TINYINT NOT NULL,
    `AdresseComp` VARCHAR(150) NOT NULL,
    `Indicatif` VARCHAR(3) NOT NULL,
    `Tel1` VARCHAR(20) NOT NULL,
    `Tel2` VARCHAR(20) NOT NULL,
    `Tel3` VARCHAR(20) NOT NULL,
    `AbonneSms` VARCHAR(1) NOT NULL,
    `RepEnt` VARCHAR(1) NOT NULL,
    `RaisonSoc` VARCHAR(50) NOT NULL,
    `SiegeSoc` VARCHAR(50) NOT NULL,
    `AdresseEnt` VARCHAR(50) NOT NULL,
    `TelEnt` VARCHAR(20) NOT NULL,
    `DateSaisie` DATETIME(0) NOT NULL,
    `DateModif` DATETIME(0) NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`CodeProprio`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_Propriete` (
    `CodePropriete` SMALLINT NOT NULL AUTO_INCREMENT,
    `CodeProprio` SMALLINT NOT NULL,
    `NomPropriete` VARCHAR(100) NOT NULL,
    `CodeTypePropriete` TINYINT NOT NULL,
    `TauxPrestat` TINYINT NOT NULL,
    `CodeCommune` SMALLINT NOT NULL,
    `Quartier` VARCHAR(50) NOT NULL,
    `Localisation` VARCHAR(150) NOT NULL,
    `DateSaisie` DATETIME(0) NOT NULL,
    `DateModif` DATETIME(0) NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`CodePropriete`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_Quittance` (
    `CodeBail` INTEGER NOT NULL,
    `CodeQuittance` INTEGER NOT NULL,
    `MontantVerse` DECIMAL(18, 0) NOT NULL,
    `MontantReporte` DECIMAL(18, 0) NOT NULL,
    `ReliquatQuittance` DECIMAL(18, 0) NOT NULL,
    `LibelleQuittance` VARCHAR(50) NOT NULL,
    `CodeModePaiement` TINYINT NOT NULL,
    `RefPaiement` VARCHAR(50) NOT NULL,
    `DateSaisie` DATETIME(0) NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,
    `LieuOp` VARCHAR(3) NOT NULL,
    `Sync` VARCHAR(2) NOT NULL,
    `Contexte` VARCHAR(9) NOT NULL,

    PRIMARY KEY (`CodeBail`, `CodeQuittance`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_Reliquat` (
    `CodeReliquat` INTEGER NOT NULL AUTO_INCREMENT,
    `CodeBail` INTEGER NOT NULL,
    `CodeQuittance` INTEGER NOT NULL,
    `LibelleReliquat` VARCHAR(50) NOT NULL,
    `MontantReliquat` DECIMAL(18, 0) NOT NULL,
    `DateSaisie` DATETIME(0) NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`CodeReliquat`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_ReparDegat` (
    `CodeReparDegat` INTEGER NOT NULL AUTO_INCREMENT,
    `CodePropriete` SMALLINT NOT NULL,
    `CodeLocation` INTEGER NOT NULL,
    `CodeDegat` VARCHAR(20) NOT NULL,
    `LibelleDegat` VARCHAR(100) NOT NULL,
    `AmpleurDegat` TINYINT NOT NULL,
    `DateConstat` DATETIME(0) NOT NULL,
    `CoutReparation` DECIMAL(18, 0) NOT NULL,
    `RespoTravaux` VARCHAR(10) NOT NULL,
    `DateFinTravaux` DATETIME(0) NULL,
    `PaiementOk` VARCHAR(1) NOT NULL,
    `DateModif` DATETIME(0) NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`CodeReparDegat`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_SmsRappelLoyer` (
    `Periode` VARCHAR(7) NOT NULL,
    `CodeBail` INTEGER NOT NULL,
    `Contact` VARCHAR(11) NOT NULL,
    `DateEnvoi` DATETIME(0) NOT NULL,
    `DelaiPaiement` DATETIME(0) NOT NULL,
    `Statut` VARCHAR(30) NOT NULL,

    PRIMARY KEY (`Periode`, `CodeBail`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_TypeDegat` (
    `CodeTypeDegat` TINYINT NOT NULL AUTO_INCREMENT,
    `LibelleType` VARCHAR(150) NOT NULL,

    PRIMARY KEY (`CodeTypeDegat`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_TypeLocation` (
    `CodeTypeLocation` TINYINT NOT NULL AUTO_INCREMENT,
    `LibelleType` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`CodeTypeLocation`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_TypePropriete` (
    `CodeTypePropriete` TINYINT NOT NULL AUTO_INCREMENT,
    `LibelleType` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`CodeTypePropriete`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim_Virement` (
    `CodeVirement` SMALLINT NOT NULL AUTO_INCREMENT,
    `DateVirement` DATETIME(0) NOT NULL,
    `TypeVirement` VARCHAR(2) NOT NULL,
    `CaisseProv` VARCHAR(10) NOT NULL,
    `CaisseDest` VARCHAR(10) NOT NULL,
    `Montant` DECIMAL(18, 0) NOT NULL,
    `RespoVirement` VARCHAR(10) NOT NULL,
    `Operateur` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`CodeVirement`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
