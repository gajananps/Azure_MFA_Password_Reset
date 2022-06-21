
<br><br>
<div class="content-box">
	
	<h4>Azure IAM Users List</h4>
	<br>
	<div class="table-responsive">
		<table class="table table-striped table-bordered">
			<tr>
				<th>S.No</th>
				<th>Date</th>
				<th>Team</th>
				<th>Manager Email</th>
				<th>Sender Name</th>
				<th>Sender Email</th>
				<th>IAM User Email</th>
				<th>IAM User Password</th>
				<!--th>Delete</th-->
			</tr>
			<?php
  $sql1="SELECT * FROM azure_password ORDER BY azure_id DESC";
  $res1= $conn->query($sql1);
  if($res1->num_rows>0)
  {$i=1;
   while($data=$res1->fetch_assoc()){
   	?>
   	<tr>
   		<td><?php echo $i; ?></td>
		<td><?php echo $data['azure_created_date']; ?></td>
   		<td><?php echo $data['azure_Team']; ?></td>
   		<td><?php echo $data['azure_ManagerEmailID']; ?></td>
   		<td><?php echo $data['azure_SenderName']; ?></td>
   		<td><?php echo $data['azure_SenderEmailID']; ?></td>
   		<td><?php echo $data['azure_IAM_User_Email']; ?></td>
   		<td><?php echo $data['azure_IAM_User_Password']; ?></td>
   		<!--td><a href="javascript:void(0)" class="text-danger delete"  name="azure_password" id="<?php echo $data['id']; ?>"><i class='far fa-trash-alt'></i></a></td-->
   	</tr>
   	<?php
   $i++;}
}else{

?>
<tr>
	<td colspan="6">No Message</td>
</tr>
<?php } ?>
		</table>
	</div>
</div>