resource "aws_vpc" "handson_vpc" {
  cidr_block           = "10.0.0.0/16" # IPv4 CIDR ブロック
  enable_dns_hostnames = true          # DNSホスト名を有効化
  tags = {
    Name = "handson_vpc"
  }
}

resource "aws_subnet" "handson_subnet_public_1a" {
  vpc_id            = aws_vpc.handson_vpc.id # VPC ID
  availability_zone = "ap-northeast-1a"      # AZ
  cidr_block        = "10.0.0.0/24"          # IPv4 CIDR ブロック
  tags = {
    Name = "handson-subnet-public-1a"
  }
}

resource "aws_subnet" "handson_subnet_public_1c" {
  vpc_id            = aws_vpc.handson_vpc.id # VPC ID
  availability_zone = "ap-northeast-1c"      # AZ
  cidr_block        = "10.0.1.0/24"          # IPv4 CIDR ブロック
  tags = {
    Name = "handson-subnet-public-1c"
  }
}

resource "aws_subnet" "handson_subnet_private_1a" {
  vpc_id            = aws_vpc.handson_vpc.id # VPC ID
  availability_zone = "ap-northeast-1a"      # AZ
  cidr_block        = "10.0.2.0/24"          # IPv4 CIDR ブロック
  tags = {
    Name = "handson-subnet-private-1a"
  }
}

resource "aws_subnet" "handson_subnet_private_1c" {
  vpc_id            = aws_vpc.handson_vpc.id # VPC ID
  availability_zone = "ap-northeast-1c"      # AZ
  cidr_block        = "10.0.3.0/24"          # IPv4 CIDR ブロック
  tags = {
    Name = "handson-subnet-private-1c"
  }
}

resource "aws_internet_gateway" "handson_igw" {
  vpc_id = aws_vpc.handson_vpc.id # VPC ID

  tags = {
    Name = "handson-igw"
  }
}

resource "aws_route_table" "handson_route_table_public" {
  vpc_id = aws_vpc.handson_vpc.id # VPC ID

  tags = {
    Name = "handson-route-table-public"
  }
}

resource "aws_route_table" "handson_route_table_private" {
  vpc_id = aws_vpc.handson_vpc.id # VPC ID

  tags = {
    Name = "handson-route-table-private"
  }
}

resource "aws_route" "handson_route_public" {
  route_table_id         = aws_route_table.handson_route_table_public.id # ルートテーブルID
  destination_cidr_block = "0.0.0.0/0"                                   # 宛先CIDRブロック 
  gateway_id             = aws_internet_gateway.handson_igw.id           # Internet GatewayのID
}

resource "aws_route_table_association" "handson_route_table_associateion_public_1a" {
  subnet_id      = aws_subnet.handson_subnet_public_1a.id        # サブネットのID
  route_table_id = aws_route_table.handson_route_table_public.id # ルートテーブルのID
}

resource "aws_route_table_association" "handson_route_table_associateion_public_1c" {
  subnet_id      = aws_subnet.handson_subnet_public_1c.id        # サブネットのID
  route_table_id = aws_route_table.handson_route_table_public.id # ルートテーブルのID
}

resource "aws_route_table_association" "handson_route_table_associateion_private_1a" {
  subnet_id      = aws_subnet.handson_subnet_private_1a.id        # サブネットのID
  route_table_id = aws_route_table.handson_route_table_private.id # ルートテーブルのID
}

resource "aws_route_table_association" "handson_route_table_associateion_private_1c" {
  subnet_id      = aws_subnet.handson_subnet_private_1c.id        # サブネットのID
  route_table_id = aws_route_table.handson_route_table_private.id # ルートテーブルのID
}
