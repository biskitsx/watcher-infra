module "providers" {
    source = "../../modules/providers"
    project_id = local.project_id
    region = local.region
}

module "apis" {
    source = "../../modules/apis"
    project_id = local.project_id
    apis = local.apis
}

module "vpc" {
    source = "../../modules/network/vpc"
    depends_on = [ module.apis ]
    project_id = local.project_id
}

module "subnets" {
    source = "../../modules/network/subnets"
    depends_on = [ module.vpc ]
    vpc_id = module.vpc.vpc_id
    region = local.region
    project_id = local.project_id
}


module "nat" {
    source = "../../modules/network/nat"
    region = local.region
    vpc_id = module.vpc.vpc_id
    project_id = local.project_id
    subnet_private_self_link = module.subnets.subnet_private_self_link    
}

module "firewall" {
    source = "../../modules/network/firewall"
    vpc_id = module.vpc.vpc_id
    project_id = local.project_id
    depends_on = [ module.subnets ]
}

module "service_accounts" {
    source = "../../modules/service-accounts"
    project_id = local.project_id
}

module "iam" {
    source = "../../modules/iam"
    project_id = local.project_id
    account_email = module.service_accounts.email
}

module "cluster" {
    source = "../../modules/gke/cluster"
    location = local.location
    project_id = local.project_id
    vpc_self_link = module.vpc.self_link
    subnet_private_self_link = module.subnets.subnet_private_self_link
}

module "node_pool" {
    source = "../../modules/gke/node_pool"
    cluster_id = module.cluster.id
    service_account_email = module.service_accounts.email
    project_id = local.project_id
    depends_on = [ module.cluster ]
}