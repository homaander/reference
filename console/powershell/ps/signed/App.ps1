do
{
    # wait for a key to be available:
    if ([Console]::KeyAvailable)
    {
        # read the key, and consume it so it won't
        # be echoed to the console:
        $keyInfo = [Console]::ReadKey($true)
        # exit loop
        break
    }

    # write a dot and wait a second
    Write-Host '.' -NoNewline
    Start-Sleep -Seconds 1

} while ($true)

# emit a new line
Write-Host

# show the received key info object:
$keyInfo
# SIG # Begin signature block
# MIIFcgYJKoZIhvcNAQcCoIIFYzCCBV8CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUcJUrbM54e4q7GomL+tZwEGju
# LdegggMWMIIDEjCCAfqgAwIBAgIQMbtBqGA7dLJPW5BHIMAqUjANBgkqhkiG9w0B
# AQsFADARMQ8wDQYDVQQDDAZIX1JPT1QwHhcNMjIwNTEzMDMwOTE5WhcNMjMwNTEz
# MDMyNzQ5WjAQMQ4wDAYDVQQDDAVIX1NVQjCCASIwDQYJKoZIhvcNAQEBBQADggEP
# ADCCAQoCggEBAKclD0YF+w+rDag8+IQv82LOGRbdompNwIC4v/z8Tk2GHFEWiVO+
# E+K0QDwkARh6kzOi1vXO6Z1K7NgmD/VFc0myjY265u8KwasDvPtqGC105fuk/58A
# rsbl2uN8t9OzFPSTgAWZCm2Azlf7wGG4deaLE9uarAPHAER1Yxlm+lwb7OmIv+pQ
# v9d45pRh64++CXs/vrGYyX6Q7/7Iv6EIM1yHo4YRcO9w5XXDRZbOBlIS0S/bpsJF
# uiosobZHISS+rHreF4JowO/ozbU6UnLxcb+k0u7eiidLyuW0SzuilOQICmPBFB3j
# q9+oK5jaZb3e004rWMWhkdBoEOB9s+2SQU0CAwEAAaNnMGUwDgYDVR0PAQH/BAQD
# AgeAMBMGA1UdJQQMMAoGCCsGAQUFBwMDMB8GA1UdIwQYMBaAFEU2T/2K4S3OH9IY
# BGgaH+14mS8iMB0GA1UdDgQWBBQ+s2frPbClrfgXUvBGcbpS3dtLQjANBgkqhkiG
# 9w0BAQsFAAOCAQEAPbcGFiMjpRVivGDfpuyGAqSBhi7yYC5WmSyXKZyJ4TVpkS21
# CXUi06GCa0BMobH7hjxLMqQZfKetcbjwxYaT2y8yjD5blBSCE7dzrMCPvpfq3/h+
# ApOdpXQ3ibtjwSrEv7IqCeKWu0afA8+BEFZ4LGBVV2qShtgA33jjX2b2GkA5sJ6T
# woq9Eli1XGV/paKeMjfa26Vn81ONua9GKqDKvT/qE/DkpS/yvW09HgEZntr7K29g
# ltdo4OTh84K4zlApT7hZiwa6259BRynIAPeFwnI5Omy7DnTdcc4XrQwO+iL/8IHv
# S4PXPju71RUTXXKK/Ldg3ubWKASRKLfaQjwUpDGCAcYwggHCAgEBMCUwETEPMA0G
# A1UEAwwGSF9ST09UAhAxu0GoYDt0sk9bkEcgwCpSMAkGBSsOAwIaBQCgeDAYBgor
# BgEEAYI3AgEMMQowCKACgAChAoAAMBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3AgEE
# MBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEVMCMGCSqGSIb3DQEJBDEWBBQ7
# qKzaLzfuxqtU03KASGIondg9qzANBgkqhkiG9w0BAQEFAASCAQADQOAilgC0WjBR
# tn3s3D6K3BnBZ1swPQEr92AhiXeeIS+aq55IwDkFwPmICQ2+17BA8tCEXy9j9Db7
# ZNsK1v6djan7y7p8xsc3nSItfgQ2LwXPkpI2ri2liuzaiwydiCcf1SKz6KGAIFRv
# ZtSn/NrT3ZrPnIoKkSkxowjtxzEI3E+PX2C3/stfR46gdzbCctK5bgULCvsHeEou
# +tt4mZ4t9+yRV4pSkfvwy0l+XJTy37/HkorItTCwkq2VcSTL4zS27knHzvZwp5d9
# y8MAv4I/waJvpPx4aYq3Y803zAc47IYgemOM/TOQ0RenXAlVmOZUBO9NcrcItmHa
# eP65JHfj
# SIG # End signature block
