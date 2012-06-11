packages = Array.new

case node[:lsb][:codename]
when "lucid"
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
