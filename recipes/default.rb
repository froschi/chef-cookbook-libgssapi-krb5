include_recipe "libkrb5"
include_recipe "libkrb5support"
include_recipe "libcomerr"
include_recipe "libk5crypto"

packages = Array.new

case node[:lsb][:codename]
when "lucid"
  include_recipe "libkeyutils"

  packages |= %w/
    libgssapi-krb5-2
  /
when "precise"
  packages |= %w/
    libgssapi-krb5-2
  /
end

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
