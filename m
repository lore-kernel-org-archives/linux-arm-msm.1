Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2903435AB5
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784221268; cv=none; b=f++ZLr3HeJNU8QZ0hC6BS25KuYQnfqfhFlQcrFYGBSfenOEiW4BUv1oISmKBppvjIsxKdk3ccb9HYHAeDj2TtJdCdFdjSfOPdxq4IwxpCwJDNHTVHqvbaZGoNr/7nhmU1py1ganWjVBSM9QYjwnpKfHWYNhVeJ2V/BXP64NTdp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784221268; c=relaxed/simple;
	bh=7khya+JmkdbvAZW/BjR0XrmZTc8RUlPWx5VB4LgQKvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pt18RXiY/R2SqBGdZEnSRTFGZa+Tz27JHbPAkp8vHDm1RnbrzTB2QtVaJFh8ZODmW+JV+RIwTGGAaGE70+UXP5JDYJ+GDnz2PXF88WEPQ1QcrPGc1qKE6sm7aXqwtaI9RFrLo4lBpmEiI8hjgCHr9ecqwaQ85W6CSUNi94He9sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FYrv0YaK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACRzedo+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYrv0YaK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACRzedo+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSwtF3172368
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xE2n21XGGPNscn1wFn7RjZ1dRi3w18S9apohZyiCsRQ=; b=FYrv0YaKOVYcALYO
	3oQCHLNMTPZ1Ce3MMKuu9Z/pfs+O4hSE0TEtliKodGgHpKpmbb5//UuTl45b/V2l
	unrlcHbvVueVuei7NjPsISKU8sLIGVzJVI10Mkw3hwIUFzW3k4PmP4u45IJYjuPU
	jkoW0xFmKXLQJlswtf8R7RvVY/vMxhpiIrP4jT2W3/W0hSmMah0NtLuapl9vraNj
	D64KuLoRJ+oJ852aN8whmSQ+oRY8RciGQRxH6CuuyOx664t47puFFdoA++hqMLAy
	hYFYwfOFN8NEewDL4v/bnPgCgenIT7Sx7YuiGrqFihENdfrUTRXnUboF395m7Ixb
	zFt/mw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv21aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:01:05 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bf9f0ec129so404624e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784221265; x=1784826065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xE2n21XGGPNscn1wFn7RjZ1dRi3w18S9apohZyiCsRQ=;
        b=ACRzedo+NlHLUMAhAX/vjUlhcNZGeJqWPEnQvMgwK0B8Pw3NKm92bVvPnOU4nLVaCk
         J1zR7/tfIDPfeLRle/fM/bFc50QUyF7wa7KrDdedyuNeZV6wxKGkrvhrV+zvpBP2tj4J
         YhjaqEJ5DZeUP0BZnTgsDwAN/q7OWfyKPPP+fo8dkuLB5GJW3Q+uOdPkwYTJfREdV3HN
         S9ifpeWn6+dSC6UeO/4cJxjsNSwkkpH6+kloxMCi2t0OVfjZQncy8aplKG0MrYRCRLD3
         7UyYoIXHzGdCAgkzh+lABvhHoJ6v5z34HNOkzoU2q6655MvXSNojk8DUfu/OTRTyQhDV
         EAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784221265; x=1784826065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xE2n21XGGPNscn1wFn7RjZ1dRi3w18S9apohZyiCsRQ=;
        b=dKAnMphud3tIcmRgfnUH0uF+wh2PZwSLWGie5hJKnHJLkSi+Ezq6jVyIF6pBwr1QnF
         ttqJDweX1z0VULfbLse95xIYE68TvCrf1ZgDea1kVaHn2O6lKnUnifyiu2uBj5xnpFc9
         2YzVE0wHaXwd5m3E30p6OJbQM2KGbc4ZANhO5HoSiH39E72KHkQ0Ko20wKqmRlMxulQs
         2+fRHTxqceRdfcXU2frV40NquPyArMqsu2646/2r+Ejz58oBxfh88UBzNLQ7SAmTzJsO
         IHGpd3xrerK+DlVdYBprVbcZ/HveiDDqcF13NAfaJkwQYaQzxj9EcFy71rBYpxAuKlbq
         7f0A==
X-Forwarded-Encrypted: i=1; AHgh+Rosqt0qqorOcpRbOogh9nHyGF8xeCMDU+uyCnlOGJwS3jRV9b9DO34rLCJpSGDKdFnsaAtmdrEMyeXOKME2@vger.kernel.org
X-Gm-Message-State: AOJu0YygyEuBaUlxuAf991R6gmRLzPENJCbqeKd64lOTBh0R0RD12MrI
	+LSBxB9zI1cCY9hh1qlsuwnQ21j9JNVwKr+eSXt91l5RURY/zPsQaUajBWqK8/mNMJn5bsFvbi5
	BufdYsa9LadRXwT6S/wsggpLnUWqaCTVLkk7CK8zEGzS8hRbFZk9D3NIGqjYXIJERKR1a
X-Gm-Gg: AfdE7cmTSRiP1UoKY4g+8OtDzBYRtu3ELZ0x25pH23h+QFhJKZCy+igtCVHoZ3v4Fr0
	ld0nsjxzx4Bpk9Ft+kyL6S9liUV6GGOo8ENkLzXLD2GhFlZxrlbNV5teV8N0F2qExiXYOJSdLAn
	vL5/nY0ENOwK3oeRpQDfdJ4c9B2VswunazBHYWczx+HUvfEd/+M4muHii3vaDcoTwHGYGZUf6sx
	1lu7Xo8NzM+iPjQIB4TvDyqN6MwHwxtT67l2uqBsL7G9ngUvc8xL9jU0qlqNuCDRlkKXxKGMu8z
	cyuymIDSlBJA9H6cQTU41h6Gp7LL9NHbOtrSl5SJW6/nGEndERxnxjf6t4+vgzoaMqU4Ny3TCWq
	gwqzeUK9oTlmTDFEFgWE3XUI4
X-Received: by 2002:a05:6102:5a95:b0:739:64ad:bf4e with SMTP id ada2fe7eead31-74533ee2e53mr4993955137.7.1784221264615;
        Thu, 16 Jul 2026 10:01:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5a95:b0:739:64ad:bf4e with SMTP id ada2fe7eead31-74533ee2e53mr4993905137.7.1784221263968;
        Thu, 16 Jul 2026 10:01:03 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744e183sm250900566b.51.2026.07.16.10.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:01:03 -0700 (PDT)
Message-ID: <916e2f7d-6f9e-44db-aec8-95532d265dbf@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:01:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] arm64: dts: qcom: Add device tree for Nord GearVM
 variant
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716142605.2398433-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE3MyBTYWx0ZWRfX+Lnt5xX1s7IO
 t8XzluJnTKIafqtrWNkNPsSZz8Ar/VdC8/71qv48vHN4r5KcReGvtzAfPcmqBrBT53a0HnyK3KZ
 nqHM79tVkmbMMkitt5FpvGSpG16kDiX1gx0SKukMybAPP4rQ+zewcOavI1wnzF/DQmVol4WnxyQ
 2RBAOaQUGa9mPROwZDPCS4/0qvSeNvNH7k32Vkcvyp2gzWMMWSWMZaBtDrHBIqw33Lih+jz4gPc
 Ms3lVyWHzSrijteMRPUjpL2MqX5jxh6B3F3htOhxcLRtMCimFqXV5BV2hjbcJ1cBqNz1qvroyqc
 B46s5FzRu3nRG631BSXkRVRlQx5C4Qp1+auhvNX/nXeIGDeQM+vMMvntwf+pVo3+kYy6Y8HuMRY
 ImEFfySDiG60zcIbjkdVr7pSDbIDFfn0GZH5HQmSgPrw0vo8bdqgS28079+VLvZ40c5UAfqf6uO
 D7H8nO9fMe7MlHsh8LQ==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a590e51 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ARTuZpYo9qy-_ZSH7p4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: wobu87ZueiPH-xHjA6xOBrQXMGGfJvi9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE3MyBTYWx0ZWRfX2kfQXAOyXf65
 VGhT7OTfIef7jsDwlF0y3KH2lFtRziXl/sjZjP2sOdai3PV8yxc116uXUgv5NteGHiFkXz+phJJ
 2iBFjT4GYiUmwaoBSHznVN4W6xF/TeA=
X-Proofpoint-ORIG-GUID: wobu87ZueiPH-xHjA6xOBrQXMGGfJvi9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160173

On 7/16/26 4:25 PM, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add SoC-level device tree include for Nord GearVM variant, where a VM
> controls platform resources (clocks, regulators, powerdomains, etc.)
> as SCMI server. It currently covers:
> 
>  - 64 SCMI shared memory regions reserved at 0xd7600000-0xd763f000
>    for SMC-based firmware communication channels
>  - Three QUPV3 GENI SE QUP blocks (qupv3_0/1/2) with I2C/SPI/UART
>    controllers using SCMI power and performance domains via scmi11
>  - UFS host controller with SCMI power domain via scmi3
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-gearvm.dtsi | 2911 +++++++++++++++++++++
>  1 file changed, 2911 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi b/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
> new file mode 100644
> index 000000000000..8db93c361c2d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
> @@ -0,0 +1,2911 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "nord.dtsi"
> +
> +&firmware {
> +	scmi0: scmi-0 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem0>;
> +		/* We expect the bootloader to update the IRQ number */

/* I expect this not to be pasted over each of the 64 instances */

Konrad
