package capstone.security

deny contains msg if {
  resource := input.resources[_]
  resource.type == "storage"
  resource.encrypted == false
  msg := sprintf("Storage resource %s must be encrypted.", [resource.name])
}

deny contains msg if {
  resource := input.resources[_]
  resource.type == "storage"
  resource.public == true
  msg := sprintf("Storage resource %s must not be public.", [resource.name])
}

deny contains msg if {
  resource := input.resources[_]
  not has_owner_tag(resource)
  msg := sprintf("Resource %s must have an owner tag.", [resource.name])
}

has_owner_tag(resource) if {
  resource.tags.Owner
}

has_owner_tag(resource) if {
  resource.tags.owner
}
