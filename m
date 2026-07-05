Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7305B3769E4
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 15:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783265349; cv=none; b=K0WkR8viJN985R2h/XW+6aN244aUOLOukWbaSDpJIv4ih3/ZxVg617ZYmwTi+O6lcF73NKP/xrSFSCaU0Ioh3mrfRpNKBbjeWJoxVkCEtvPgIYe74EjuHLJsIEfc7PVlGITHRt3u8LayJF7axdv6VYc1BNh6ncTXT+zRYmPDgUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783265349; c=relaxed/simple;
	bh=exC+UdUO3XeyXvyzztH8ExhjvNdHt5vRxl1URazO7nE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ivCvha6NjYbu99p21B19ip26qeAAJaWHjAAbzZo0Pryq/JtK+8f0pUta/zGIxZOsAN9YSDpheqOgSNxJSoX4PybCgenE6kdHvwceZezqUY6cmky62/5t7j52ARnFFj6oJ+t/Mkz+/4ElUf7zJDdOGjTtgCmkBk0J8lHADW/iN70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSQ3nnkF; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSQ3nnkF"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37e0a189b0bso1320747a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783265348; x=1783870148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7L1YMX25uctPYMxza+CMs3tBM6l8yVba4bYt4/Eab2A=;
        b=lSQ3nnkFXV1vApXciTcjqt0n/oLxmgI+lPfFTBgvP0+fDUvhV0PY6YNnM0WafDAwQQ
         c+MUZZ6HH3PtC0xRTIjd2OVHhY+ojPUYw1P1v5HNYmW0GHaLV9oIX404UJbRLqW1RPTr
         jTta2lRjlyFNE7EEnaNX5cfZvHuIpgBl6L+DgCoDFlSMfrZV2he6geIpN3CLp1otMKXz
         PjpyMWYkxwFI0jfzuddZY3JCw5bJxFJjbROnz5qbMd07Ra+Mtsv16XSSlljDT/xNiHlV
         Y9zNPLdg2oMuE3hi5ky5D1KojGx4D6oErI4vEVmtNq6mSs17HSHBclrchTYR5aPnJSkS
         wmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783265348; x=1783870148;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7L1YMX25uctPYMxza+CMs3tBM6l8yVba4bYt4/Eab2A=;
        b=XuaEaV8kodg9bst0Nv2lwIrnMfBWuuQ6wjiayxXnDsnhyS27dBwom7+f/q74sDqA9b
         GhyRGJm/LfIkGbs7DEstBysPylgmcFrDaXIPx3xGmCIG6jAKDED87syCS/MtoYdZ2U4d
         XKtoHkcS37ugwdkjZycddjuudb9VxKH7A393U+mQH+4lhcZ5DFmEEmdOWCwCpRgiIqPL
         jHJLcTRP76kAVcq0c3RjxvucUFHdLjzmR/as6t8L/TReZZyNHc687gyk9EcgYf5yscFG
         fGRyFZIB1FCWduuGvdgrwDgebVGUM8anfwZ1tbEjkbv330bPBqhFAVNQegZOnxOUGhEB
         wpOQ==
X-Gm-Message-State: AOJu0Yz7d4v/RGgwxWAsftgKU3/ryqKt3A74/lPO56gxaKTG42KUVWHb
	oLC2NiI3Vqc2lV4bNpH2tOiGD0mwmuE/TKh9vbhcYIfSRt8nWK1Q4ZkQ
X-Gm-Gg: AfdE7cmkTNfFsqhCoqtfNRU89JFaxthTv7sZTCJ3bbb+qzS1RsirF4mLF1dFRa9G6RZ
	PJIcmvwAn1UNl6ZHNQaeCDR2Z7hsP64lOutKYj2mNbh+0aQGlyCGyJa1/Ni47Tk/UEmj0XwyCAr
	JP/lYHbB/AposKV0tvsEqXUUp/SDV+EFeMX1C+5YyjOrr2YV3mcbs86rf2xdUl51OFq9DbVYJBR
	8Xf/UsTFtJSWmJhEtJkKCbH0uS84idBQBmtnfZHdodZpxibi6hQ4rmweGSN4t3fcoz8iSetjQcT
	IQmE6fYLa5PPtSW/hy+pvCYMR1mJulrZ9AtUn4y6zGBsrYmZDD0VFMWKQPG3hA2XBt7hg4HGgZf
	p+XeSQcGuD2az/qm5Prm+6uSLh3V3T/wrPSL9IFVlGIobXuvVUvcEI3p+UMDjmWmdY+zg4B2PZW
	Uc227e5FQA8KELzyvAB5mOaKnIAw4YswMnplQjkyc=
X-Received: by 2002:a17:90b:590c:b0:37f:9cdf:f03b with SMTP id 98e67ed59e1d1-3829f5e72d3mr6328124a91.30.1783265347624;
        Sun, 05 Jul 2026 08:29:07 -0700 (PDT)
Received: from [192.168.1.91] (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f38ee1333sm27531956eec.24.2026.07.05.08.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 08:29:07 -0700 (PDT)
Message-ID: <13138cbb-815d-46b1-aa82-cca6e44878a1@gmail.com>
Date: Sun, 5 Jul 2026 23:29:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kaipeng Zeng <kaipeng94@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for Acer Swift Go Pro
 AI (SFA14-11)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, konradybcio@kernel.org, andersson@kernel.org
References: <20260702063156.35169-1-kaipeng94@gmail.com>
 <20260702063156.35169-3-kaipeng94@gmail.com>
 <5791feda-226a-4a22-a79e-e6b72be141b8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5791feda-226a-4a22-a79e-e6b72be141b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Konrad,

On 7/2/26 19:45, Konrad Dybcio wrote:
> On 7/2/26 8:31 AM, Kaipeng Zeng wrote:
>> +	wcd938x: audio-codec {
>
> Nodes should be sorted - by 'reg' and unit address if there's one,
> by name if there isn't (minus some special cases like GPIOs), see:
>
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>
>> +		compatible = "qcom,wcd9385-codec";
>
>
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wcd_default>;
>
> property-n
> property-names
>
> in this order, file-wide, please
>

Got it, I will fix the property order file-wide.
Should I sort all nodes, including those copied from the x1-crd.dtsi?
For example, vph_pwr is inserted between two vreg_* nodes in
x1-crd.dtsi.

> [...]
>
>> +&apps_rsc {
>> +	regulators-0 {
>> +		compatible = "qcom,pm8550-rpmh-regulators";
>> +		qcom,pmic-id = "b";
>
> Have you verified this against the DSDT of your device? Incorrect
> settings may lead to hw damage
>
> [...]
>

Thank you for pointing this out, I had not verified this before.
Looking inside the DSDT, I found some "PMICVREGVOTE" packages that list
a value as the required voltage.
And I need to check if any required voltage falls outside the
range set by DTS. Is that correct?
However, some PPP_RESOURCE_ID_* seem to be mentioned only and lack a 
specific voltage.
For these, should I retain the original value (from x1e80100-crd.dtsi),
or is there another way to determine their correct ranges?

>> +&iris {
>> +	status = "okay";
>
> You need to specify a firmare path
>

I will add a firmware path.
But since the firmware of this device is not archived by linux-firmware, 
is it proper to use "qcom/x1e80100/ACER/SFA14-11/*.mbn" as the firmware 
path?
Currently, I use it for all firmware paths.

> Konrad

Thank you again for your helpful replies!


