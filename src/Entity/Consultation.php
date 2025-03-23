<?php

namespace App\Entity;

use App\Repository\ConsultationRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Metadata\ApiResource;
use Symfony\Component\Serializer\Attribute\Groups;
use ApiPlatform\Metadata\GetCollection;
use ApiPlatform\Metadata\Get;
use ApiPlatform\Metadata\Post;
use ApiPlatform\Metadata\Put;
use ApiPlatform\Metadata\Patch;
use ApiPlatform\Metadata\Delete;

#[ORM\Entity(repositoryClass: ConsultationRepository::class)]
#[ApiResource(
    normalizationContext: ['groups' => ['read']],
    denormalizationContext: ['groups' => ['write']],
    operations: [
        new GetCollection(security: "is_granted('ROLE_DIRECTOR') or is_granted('ROLE_ASSISTANT')"),
        new Post(security: "is_granted('ROLE_DIRECTOR') or is_granted('ROLE_ASSISTANT')"),
        new Get(security: "
            is_granted('ROLE_DIRECTOR') or is_granted('ROLE_ASSISTANT') or is_granted('ROLE_VETERINARIAN')"),
        new Put(),
        new Patch(security: "is_granted('ROLE_DIRECTOR') or is_granted('ROLE_ASSISTANT') or is_granted('ROLE_VETERINARIAN')"),
        new Delete(security: "is_granted('ROLE_DIRECTOR') or is_granted('ROLE_ASSISTANT')"),
    ],
)]
class Consultation
{
    const STATUS_PROGRAMME = 'programmé';
    const STATUS_EN_COURS = 'en cours';
    const STATUS_TERMINE = 'terminé';

    #[Groups('read')]
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[Groups(['read', 'write'])]
    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $date_creation = null;

    #[Groups(['read', 'write'])]
    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $date_rdv = null;

    #[Groups(['read', 'write'])]
    #[ORM\ManyToOne(inversedBy: 'consultations')]
    private ?Animal $animal = null;

    #[Groups(['read', 'write'])]
    #[ORM\Column(length: 255)]
    private ?string $motif = null;

    #[Groups(['read', 'write'])]
    #[ORM\ManyToOne(inversedBy: 'consultations')]
    private ?User $assistant = null;

    #[Groups(['read', 'write'])]
    #[ORM\ManyToOne(inversedBy: 'consultations')]
    private ?User $veterinaire = null;

    #[Groups(['read', 'write'])]
    #[ORM\Column(length: 255)]
    private ?string $statut = null;

    #[Groups(['read', 'write'])]
    #[ORM\ManyToOne(inversedBy: 'consultations')]
    private ?Traitement $traitements = null;

    public function __construct()
    {
        $this->date_creation = new \DateTime(
             'now',
            timezone: new \DateTimeZone('Europe/Paris')
        );
    }
 

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDateCreation(): ?\DateTimeInterface
    {
        return $this->date_creation;
    }

    public function setDateCreation(\DateTimeInterface $date_creation): static
    {
        $this->date_creation = $date_creation;

        return $this;
    }

    public function getDateRdv(): ?\DateTimeInterface
    {
        return $this->date_rdv;
    }

    public function setDateRdv(\DateTimeInterface $date_rdv): static
    {
        $this->date_rdv = $date_rdv;

        return $this;
    }

    public function getAnimal(): ?Animal
    {
        return $this->animal;
    }

    public function setAnimal(?Animal $animal): static
    {
        $this->animal = $animal;

        return $this;
    }

    public function getMotif(): ?string
    {
        return $this->motif;
    }

    public function setMotif(string $motif): static
    {
        $this->motif = $motif;

        return $this;
    }

    public function getAssistant(): ?User
    {
        return $this->assistant;
    }

    public function setAssistant(?User $assistant): static
    {
        $this->assistant = $assistant;

        return $this;
    }

    public function getVeterinaire(): ?User
    {
        return $this->veterinaire;
    }

    public function setVeterinaire(?User $veterinaire): static
    {
        $this->veterinaire = $veterinaire;

        return $this;
    }

    public function getStatut(): ?string
    {
       
        return $this->statut;
    }

    public function setStatut(string $statut): static
    {
        if (!in_array($statut, [self::STATUS_PROGRAMME, self::STATUS_EN_COURS, self::STATUS_TERMINE])) {
            throw new \InvalidArgumentException("Statut invalide.");
        }
        $this->statut = $statut;

        return $this;
    }

    public function getTraitements(): ?Traitement
    {
        return $this->traitements;
    }

    public function setTraitements(?Traitement $traitements): static
    {
        $this->traitements = $traitements;

        return $this;
    }
}
