resource "aws_key_pair" "project" {
  key_name   = "project"
  public_key = file("C:\\Users\\RAKESH\\Desktop\\terraformproject\\y.pub")
}
