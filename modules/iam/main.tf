resource "aws_iam_role" "access_ssm_role_handson" {
  name                  = "access_ssm_role_handson"                                     # ロール名
  assume_role_policy    = data.aws_iam_policy_document.instance_assume_role_policy.json # AssumeRole ポリシーのJSON
  description           = "role to handson"                                             # ロールの説明
  force_detach_policies = true                                                          # ロール破棄時にアタッチされたポリシーをデタッチする
  managed_policy_arns   = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]      # アタッチする管理ポリシーのARNリスト
}
