output "for_directive" {
  value = "%{for name in var.names}${name}, %{ endfor }"
}

output "for_directive_index" {
  value = <<EOF
%{~ for i, name in var.names ~}
${name}%{if i < length(var.names) - 1}, %{else}. %{endif}
%{~ endfor ~}
  EOF
}