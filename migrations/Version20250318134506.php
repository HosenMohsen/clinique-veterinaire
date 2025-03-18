<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250318134506 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE consultation (id INT AUTO_INCREMENT NOT NULL, animal_id INT DEFAULT NULL, assistant_id INT DEFAULT NULL, veterinaire_id INT DEFAULT NULL, traitements_id INT DEFAULT NULL, date_creation DATE NOT NULL, date_rdv DATETIME NOT NULL, motif VARCHAR(255) NOT NULL, statut VARCHAR(255) NOT NULL, INDEX IDX_964685A68E962C16 (animal_id), INDEX IDX_964685A6E05387EF (assistant_id), INDEX IDX_964685A65C80924 (veterinaire_id), INDEX IDX_964685A6C5AE08D8 (traitements_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE consultation ADD CONSTRAINT FK_964685A68E962C16 FOREIGN KEY (animal_id) REFERENCES animal (id)');
        $this->addSql('ALTER TABLE consultation ADD CONSTRAINT FK_964685A6E05387EF FOREIGN KEY (assistant_id) REFERENCES user (id)');
        $this->addSql('ALTER TABLE consultation ADD CONSTRAINT FK_964685A65C80924 FOREIGN KEY (veterinaire_id) REFERENCES user (id)');
        $this->addSql('ALTER TABLE consultation ADD CONSTRAINT FK_964685A6C5AE08D8 FOREIGN KEY (traitements_id) REFERENCES traitement (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE consultation DROP FOREIGN KEY FK_964685A68E962C16');
        $this->addSql('ALTER TABLE consultation DROP FOREIGN KEY FK_964685A6E05387EF');
        $this->addSql('ALTER TABLE consultation DROP FOREIGN KEY FK_964685A65C80924');
        $this->addSql('ALTER TABLE consultation DROP FOREIGN KEY FK_964685A6C5AE08D8');
        $this->addSql('DROP TABLE consultation');
    }
}
