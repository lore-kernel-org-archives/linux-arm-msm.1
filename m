Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E96E5616BB
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874114; cv=none; b=rIcZ9u4RCV7KmxcIKZjk66mLnY5i9GmeR0zLvWS1odmUHpUHrej5aWO8khyRg0/JwBQnERt33VjTsVFisXMkWGtfo9TvzUqbMVaNsQ+WR3PycoO755FR9hIFEc8CXcD0W97doVrm/hg50vkN295wdxUt29M5+iK/Y6dY1NmkQJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874114; c=relaxed/simple;
	bh=hgC/ODhmvpQIXajTqQbdCbpcyTOqi2fqT0bk/7HtYG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSBGl1VvF88IEfTIvFSx6EzfiLjoUdvgrKd0aCU1bQZ2yiEvNV6YAXVEeXhsOR3U/ZhrQ9rJW4w+YNEmlaYwq8sYcus3XoGsnf90intyxZhbUcUMrXXjC4SMyuaVOVJd4JWyO/4UalFDivNRnczrSQomg1CiY+ABUZA8kBmQsW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=rBJ1oOPz; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="rBJ1oOPz"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-930c0f9c1b1so443242785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788874095; x=1789478895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCrdWA50X2yOwE1UwjNDpc7YkWkuiPRBy93RdSxUyhs=;
        b=rBJ1oOPz/jSRJMLnRchWFhqxnI26YlMaqgzbpQjskpz44QQNSmg44QJOqeFNg3kDSB
         jo5y43yGK1owuJUWVQ7PV58CN/A/LIB0C/PPj+ARzujU3eb/sRsS7sbId5qT798ALA8b
         ww5nWri9X/BcRiQ7ioEl6IVnP5k2e8dByx61ya4qTgvQb99OoieP9jdGLjwsYfKTKy57
         18wdr1mGTDYhUrkXqPQZbW9KzIwXEeh+zDLyhptrfz2096XWrPEXvzqVe9Uw8wZAsqUM
         2PcU3MmCSaTO+E1ykJxg9DcQxdpQj+BhfsKjAfOD+vBYUqWv6Qxg5uUbKBfPOHQgceCB
         FNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874095; x=1789478895;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCrdWA50X2yOwE1UwjNDpc7YkWkuiPRBy93RdSxUyhs=;
        b=C6gsvpO2i2Q+XDvn2ToyEnEw95ZS13F27SxjN4dejoudj/jxA1DkqyoQwo1eNHO6Tv
         CaSysn0sM8qgnqkBk4A7ffJgVy8yrDnlkoDenlCu5417LVCdSs9ZENHs0HlZh/QBKQ/n
         pgjg+XkGuIseRYtUd71cWEjPEI6GUvhvF5YpoMO8Ufj5Aex0kGDaPDMqvVgCbihQ47Ge
         oz60PcKp5XAwK2DKvLTx7hzgc7RAR/GiMT++C9pRda9ETeL5XtJE2qQy3GY1gWp66qUv
         ATpt5L3cL/rmAetoONDUmkGfeHcXB3dZXmBszcmUJNtK48SlpdmGzg7ISuxScWrQEF90
         KDiQ==
X-Forwarded-Encrypted: i=1; AKwUvBw72wMuHYGau0rUvQMpFOcfh79yOFiG2lrWmgEqgr+IJ2KiA1oMZAIfca/pUVCd7N4MGdY1Sj0aGzr8G2/p@vger.kernel.org
X-Gm-Message-State: AFuF++kRzOSXR5rmOMkIV3sYYWGBQDa3n8ZKpsmD18YAX/UDUUKV8isR
	osL7Jri2omxRuIVZr/OAfeTnSoAb9RWypbftcCw6qpzrVU84MP/D/e3Vkkatt5bIsXM=
X-Gm-Gg: AYBFou2bn11np9ZgL6X+GoGqIdkZ25QlZLPqMghnvqsO1QSQiMRM4tBCvgA4vdmLglG
	nN3XhjU4qWxVMDwE/to+tP6R+3dpRZ7pGx2T0xiDeeSryUuQVzCzR3JC26U/EAqYm3Wficxri5W
	5GOVuEhyrFmLqtsCK7Bi2f0YEUcLRj1g5P4oTUnUJ8OuFBJ/WvY5xERQWyaavUejXHWd7ImDdmG
	ZriPWCwowMUF5jTF2iAjM2VRarvyS+EMvjjLIiIN0I844jD7cKFlGaDSfZSYFFNbHGa7DRNR1bR
	nMxVH9jNKv3Q7aEma9loJ/HNU7dLUC7syheYAEvZSSd/L+N7rdZe0xdvP8fqDowoBHhWNB2dbbC
	JlqRc92bY5A4G5ynErWV93j/IiZS0ffuZdhPtJLviGUYQOdvjxln6cEzwSZwthulEG9Ma09MQWl
	A2UT5r0zeD6ac7pUYmMZ3L+p3UUW7Dq0EwTg6B5GJoELKPEWEWVG2dk12Jtffu
X-Received: by 2002:a05:620a:7115:b0:939:6df7:5e0f with SMTP id af79cd13be357-93980506519mr3377731985a.51.1788874070415;
        Tue, 08 Sep 2026 06:27:50 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939b8fbc1dbsm249492285a.11.2026.09.08.06.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:27:50 -0700 (PDT)
Message-ID: <aeb341e6-0019-47e4-9522-7780cce9dbce@riscstar.com>
Date: Tue, 8 Sep 2026 08:27:48 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: qcs6490-rb3gen2: Enable TC9563
 embedded GPIO controller
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: Daniel Thompson <daniel@riscstar.com>,
 Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
 <20260904-pci-tc9563-aux-v3-5-5b1449d62ba2@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260904-pci-tc9563-aux-v3-5-5b1449d62ba2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/4/26 12:15 PM, Lorenzo Bianconi wrote:
> The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> lines. The controller is registered as an auxiliary device by the TC9563
> power controller and accessed through the same i2c device.
> 
> Describe the switch node itself as the embedded GPIO controller and us
> it to drive the PERST# reset lines of the two external downstream port
> (pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
> switching to the GPIO descriptor API for per-port resets.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Looks good.  Thanks a lot for doing this Lorenzo.

Reviewed-by: Alex Elder <elder@riscstar.com>> ---
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index a13315bf0fb0..4da7342ca90d 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -867,7 +867,7 @@ &pcie1_phy {
>   &pcie1_port0 {
>   	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>   
> -	pcie@0,0 {
> +	tc9563: pcie@0,0 {
>   		compatible = "pci1179,0623";
>   		reg = <0x10000 0x0 0x0 0x0 0x0>;
>   		#address-cells = <3>;
> @@ -891,6 +891,9 @@ pcie@0,0 {
>   		pinctrl-0 = <&tc9563_resx_n>;
>   		pinctrl-names = "default";
>   
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
>   		pcie1_switch0_dsp1: pcie@1,0 {
>   			reg = <0x20800 0x0 0x0 0x0 0x0>;
>   			#address-cells = <3>;
> @@ -899,6 +902,7 @@ pcie1_switch0_dsp1: pcie@1,0 {
>   			device_type = "pci";
>   			ranges;
>   			bus-range = <0x3 0xff>;
> +			reset-gpios = <&tc9563 2 GPIO_ACTIVE_LOW>;
>   		};
>   
>   		pcie@2,0 {
> @@ -909,6 +913,7 @@ pcie@2,0 {
>   			device_type = "pci";
>   			ranges;
>   			bus-range = <0x4 0xff>;
> +			reset-gpios = <&tc9563 3 GPIO_ACTIVE_LOW>;
>   
>   			/* Renesas μPD720201 PCIe USB3.0 Host Controller */
>   			usb-controller@0,0 {
> 

