<?php
session_start();
include 'Invoice.php';
$invoice = new Invoice();
$invoice->checkLoggedIn();
if(!empty($_GET['invoice_id']) && $_GET['invoice_id']) {
	echo $_GET['invoice_id'];
	$invoiceValues = $invoice->getInvoice($_GET['invoice_id']);		
	$invoiceItems = $invoice->getInvoiceItems($_GET['invoice_id']);		
}
$invoiceDate = date("d/M/Y, H:i:s", strtotime($invoiceValues['order_date']));
$output = '';
$output .= '<html>
	<head>
	</head>
	<body>
	<img src="images/invoice_top.PNG" width="100%" heigth="230px">
	<table width="100%" cellpadding="5">
	<tr>
	<td width="65%">
	<b>TO</b><br />
	Name : '.$invoiceValues['order_receiver_name'].'<br /> 
	Billing Address : '.$invoiceValues['order_receiver_address'].'<br />
	<br/><b>BANKING DETAILS</b><br />
	Bank: Standard Bank <br/> 
	Account No: 302944842<br/>
	Branch: The Glen<br/>
	</td>
	<td width="35%">         
	Invoice No. : '.$invoiceValues['order_id'].'<br />
	Invoice Date : '.$invoiceDate.'<br />
	</td>
	</tr>
	</table>
	</br>
	<table width="100%" border="1" cellpadding="5" cellspacing="0">
	<tr>
	<th align="left">No.</th>
	<th align="left">Instructions</th>
	<th align="left">Amount</th>
	<th align="left">Actual Amt.</th> 
	</tr>';
$count = 0;   
foreach($invoiceItems as $invoiceItem){
	$count++;
	$output .= '
	<tr>
	<td align="left">'.$count.'</td>
	<td align="left">'.$invoiceItem["item_name"].'</td>
	<td align="left">'.$invoiceItem["order_item_price"].'</td>
	<td align="left">'.$invoiceItem["order_item_final_amount"].'</td>   
	</tr>';
}
$output .= '</table>
	<table width="100%" border="1" cellpadding="5" cellspacing="0">
	<tr>
	<td width="70%" align="right" colspan="5"><b>Vehicle Brand</b></td>
	<td align="left">'.$invoiceValues['order_receiver_vehicle_brand'].'</td>
	</tr>
	<tr>
	<td width="70%" align="right" colspan="5"><b>Vehicle Model</b></td>
	<td align="left">'.$invoiceValues['order_receiver_vehicle_model'].'</td>
	</tr>
	<tr>
	<td width="70%" align="right" colspan="5"><b>Sub Total</b></td>
	<td align="left"><b>'.$invoiceValues['order_total_before_tax'].'</b></td>
	</tr>
	<tr>
	<td width="70%" align="right" colspan="5"><b>Tax Rate :</b></td>
	<td align="left">'.$invoiceValues['order_tax_per'].'</td>
	</tr>
	<tr>
	<td width="70%" align="right" colspan="5">Tax Amount: </td>
	<td align="left">'.$invoiceValues['order_total_tax'].'</td>
	</tr>
	<tr>
	<td width="70%" align="right" colspan="5">Total: </td>
	<td align="left">'.$invoiceValues['order_total_after_tax'].'</td>
	</tr>
	<tr>
	<td width="70%" align="right" colspan="5">Amount Paid:</td>
	<td align="left">'.$invoiceValues['order_amount_paid'].'</td>
	</tr>
	<tr>
	<td width="70%" align="right" colspan="5"><b>Amount Due:</b></td>
	<td align="left">'.$invoiceValues['order_total_amount_due'].'</td>
	</tr>';
$output .= '
	</table>
	</body>
	</html>';
// create pdf of invoice	
$invoiceFileName = 'Invoice-'.$invoiceValues['order_id'].'.'.$invoiceValues['order_receiver_vehicle_brand'].'.pdf';
require_once 'dompdf/src/Autoloader.php';
Dompdf\Autoloader::register();
use Dompdf\Dompdf;
$dompdf = new Dompdf();
$dompdf->loadHtml(html_entity_decode($output));
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
$dompdf->stream($invoiceFileName, array("Attachment" => false));
?>   
   