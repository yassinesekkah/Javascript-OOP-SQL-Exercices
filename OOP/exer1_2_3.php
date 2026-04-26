<?php 

abstract class Product {

    private string $name;
    private float $price;

    public function __construct(string $name, float $price)
    {
        $this->name = $name;
        $this->price = $price;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function getPrice(): float
    {
        return $this->price;
    }

    public function setPrice(float $price): void
    {
        if($price > 0){
            
            $this->price = $price;
        }
    }

    public function getDiscountedPrice(float $percent): float
    {
        return $this->price - ($this->price * $percent / 100);
    }

    abstract public function getType();
}

class DigitalProduct extends Product
{
    private float $fileSize;

    public function __construct(string $name, float $price, float $fileSize)
    {   
        parent::__construct($name, $price);

        if($fileSize <= 0){
            throw new Exception("File size must be greater than 0");
        }

        $this->fileSize = $fileSize;
    }

    public function getFileSize(): float
    {
        return $this->fileSize;
    }

    public function download(): string
    {
        return "download file size : " . $this->fileSize  . " MB";
    }

    public function getType(): string
    {
        return "Digital";
    }
}



