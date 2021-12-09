<?php
require('../fpdf/fpdf.php');

class PDF extends FPDF
{
// Cabecera de página
function Header()
{
    // Logo
    $this->Image('../img/logo.png',10,8,33);
    // Arial bold 15
    $this->SetFont('Arial','B',15);
    // Movernos a la derecha
    $this->Cell(80);
    // Título
    $this->Cell(40,10,'TICKET DE VENTA',0,0,'C');
    // Salto de línea
    $this->Ln(40);
}

// Pie de página
function Footer()
{
    // Posición: a 1,5 cm del final
    $this->SetY(-15);
    // Arial italic 8
    $this->SetFont('Arial','I',8);
    // Número de página
    $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
}
}
// Creación del objeto de la clase heredada
$pdf = new PDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);

$total = 0;
if (isset($_SESSION["carrito"])) {
    foreach ($_SESSION["carrito"] as $indice => $arreglo) {
        $total += $arreglo["canti"] * $arreglo["precio"];
        $pdf -> Cell(90, 10, $indice, 1, 0, 'C', 0);
        foreach ($arreglo as $key => $value) {
            echo $key . ": ". $value ."<br>";
        }
    }
}

$pdf->Output();
?>