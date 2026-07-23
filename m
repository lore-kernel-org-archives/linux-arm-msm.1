Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8D0438024
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808323; cv=none; b=il8UFt+oF2CFRvdj3T/mkzGLjrQf4PvJrmQL5bRpgHNF1zR4e4sdGMHLBZtuqAzR7EqO5EVR5VJ4kkx1T5j3Mey5CF6LiCbYRuanJybO5oV2WppT8p8E7bKrA5Adz7WVa0NEfCXNbTprY4YNT6YBQks8tjfpU13QM3c6QnWTdOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808323; c=relaxed/simple;
	bh=ACzxvPV7vra5qA+hMv+7yW6gYZx1YXG7wPPaYGWThks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f13uK0Rm9AGbh/HH+wUkTjDEFmoghnc+UWYMa0BXOp0qx+AkdmjKk9iWFayc3cvHRYIIzvaXe+PMVb1SKh7s2tlYqlGSIlbVDU5EKkrveLuA3WB91SQizEA4m/CLf0fPI+nWf2UFITh3GvHbSjbReDo9A0th6fKjehjLEaFM0oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jv6pkxYr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7x6fsgY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jv6pkxYr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7x6fsgY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qbxl3606118
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMKUqxc+rIEZeKT8ufnpN8oi8S7g7PqEIVgl3NYOaK0=; b=Jv6pkxYrcfEXFfuK
	DR+nXozpfiZJdN2a8xxu9dRl/sj2KNF/ryiY95SdCtQBdhoPqx9JEcPrBxUsPTg/
	zF1DZnxzle0DuUc/gWeXx0Ie6TLswgoExanTtjn/Fa58YZtafjhB2zK4E+JJfW76
	6RoinSY7iy3tfAwY6ls+yE/mjDnZ0hnRUO9wMCWX6I1mnHVDA8EwvlvtR4/R8dej
	cUwGJCdWFBtRrfpU3h3vdqKI2pyFA6ulc7dZ+9ud5Y4J/HW5NJXddwxzaBwjzd+Z
	NBfj1Go6cRt2rq5U4yYR/eAMZug64EhPDYZyMO3jgDQldpByD4qUT7eqcW7SPCKp
	iBNVCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qh5xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:05:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6cb57d25so20885085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 05:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784808320; x=1785413120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMKUqxc+rIEZeKT8ufnpN8oi8S7g7PqEIVgl3NYOaK0=;
        b=D7x6fsgYneBBwfI89oci4BFLkkZCSTJ7SKq6eI9hIvI795gesrkR0eU1iEEWQldl56
         Y0exytOJqVdpYlQwkRwxJbJZF4FQAdHd9+Lbnm25SsfZaKR9AZ2NTopg8CpEnHhaC+qY
         iQrBw9EQ9lrZDn+AbJf3d8jQWt1wibItoy1I0AjBjkCLjyepuIQ+zfFph90bmxdQmGqL
         AxXtj3t3xi9jBclyddpd9MF/ttMIBQl5lAy2xEzpvbzh+AGDuwHj7z3zuXAck8ub3ohw
         3G/w6QiFLEhF1R0NIkX+/youmNkPlrJCqIJEHW4VnvjRGi78Y2iZPlBpk8N7e0lHM4nw
         ZGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808320; x=1785413120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMKUqxc+rIEZeKT8ufnpN8oi8S7g7PqEIVgl3NYOaK0=;
        b=PfYhWpNKJGcDZkBBvkyWF7U09TFAYSH6umLSvggMl9pPbsJoUTBXZ1hxVHHa4uwCHp
         L+izYak84GgfxlYscq/6g9xJury0i1mq0YWxmWDU2r//Nk3SOEvcYVZGrZiflkenRYvf
         YjfBDOrpqOnx/Lk159K8/YDXfmZffyyL/CIk43fXVQj5vAZO/b3onc5NBWQjCB1dKa+6
         m0JacT5814I24UWzIBQPCwUqis+QQ9SA/RXw8yDT0ALkcEUlyaqFK/LIE54Q77bMW1ek
         LHQwW/c/Xak2ndv9jmJEZOl20ISWgyE3wRyuZ8nLN9lS1sARUiOWOYUszF9GI0Zz53Vk
         iuIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrvlSfAFKaElW7Snt6/A4eBxdQhaTWm60XX5gElptMpDG5Jh8PfzyGtskTXglNFmKkFRyUqZj6klSB9llmO@vger.kernel.org
X-Gm-Message-State: AOJu0YwOndMJh2PU0W+GtJK0VB+W3c8XA4ki1v8P7UVhQFu/7+cmED36
	6cl0JwFk4hVzyQAZJEvvfahyFYLi1Qi32IVpVt/WLviBBsVEnJWLbpHLCrHpq8JWYohBwRW2D5/
	nCwUBVCGZbUYEyOguC/LRPO/vN9TpAOmjgbXOAJTz2xEQgtr+oQb5433X3IpP6Kt9IB0t
X-Gm-Gg: AR+sD11YBi45M6TIfDnrJSQulaCbqoaMllmKCVNKi7iT1CtlnbhU+YFn3oyIR0+K7Hw
	fDAHFRD9vtP1ao7W31bXPluvGxPY4RpTQjn5/jCADKyUBo83Q2KN8ZiC1WVMHwEu7hPjaDyPgTO
	lMxtgYwzskFXcghiSQuk38oFes/08MaIvVzkYMPFO9jVFREte5SM7aOEQmnjOlfuuE77budc7KR
	OBAnlAm4OhfIIuirGlvlWP9ojcquBMYOfeq+jAftJ7vb9xjfbF2dFbig2LUBU+2b9Xx8s+mycty
	pz8zGjULMEfY0Dk4GFHFsR6icxUeKvDc8KTjx8/j+tnPALd3J84N9S2Q0b+XG0fcIWLPN7FaDKg
	Pzp1f6F7J0vV/1BzUmAExmlvw
X-Received: by 2002:ac8:5cc2:0:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-52846fdf76amr2142481cf.3.1784808319828;
        Thu, 23 Jul 2026 05:05:19 -0700 (PDT)
X-Received: by 2002:ac8:5cc2:0:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-52846fdf76amr2142091cf.3.1784808319339;
        Thu, 23 Jul 2026 05:05:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f345b1b9dsm1994224a12.6.2026.07.23.05.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 05:05:18 -0700 (PDT)
Message-ID: <5d6da74a-785c-4c02-b065-876d8a46f2b2@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:05:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: add initial Motorola Moto E4
 (perry) support
To: Aneesh Pradhan <aneeshpradhan2004@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Catherine Frederick <serenity@floorchan.org>,
        linux-clk@vger.kernel.org, Aneesh Pradhan <aneeshpradhan@acm.org>
References: <20260723012431.48499-1-aneeshpradhan@acm.org>
 <20260723014627.63310-1-aneeshpradhan@acm.org>
 <20260723014627.63310-4-aneeshpradhan@acm.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723014627.63310-4-aneeshpradhan@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExOSBTYWx0ZWRfXwoAPVABNH9s8
 kRF6P3PPWyXFRiI9z1xQ4rxldJJ1RtLFDbOH3VuzJomqFY7+z17ijoN5B1SqhUsyTpSEWt97TQV
 LoDyvUKq0P+tb2kYEbtwgBEsyzyVb44=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a620380 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=DhTvykhhAAAA:8 a=QjXiKPweKVnjtAxLVzIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=bLiRU7DCRrRo9wiowOr6:22
X-Proofpoint-GUID: Zpd55xdCdIp60B5PVe8SZm8BxM4HjW2N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExOSBTYWx0ZWRfXyOgsKEzAeGex
 cK5KQ8ZFPbkhtwOdNeGaPuNTSEncohKZVF33AvEPLmoMAl01dPdK3m6NnzMBksvICrF/rmkMb65
 /4HBKzOuAEgrir3SIwGwVH0dOBxBmjLlKtg0oviTNiV0EMgnH2DfzVn6feI0IbP7lc362h/Eo3+
 rfVl6zl0pts3IloAqq3P5TzFFrahOyNh2Z4bLSI7jU+wNe2vLukJqlT/r+exzVDzh2bVLv9FFBI
 g2RS9GENU/ZGvJ8Yu0rtjlLSG6wCizCP6pX0ony1ng0zIJQjkR48n9rpYu27kWIkJKQ06SO6i4C
 6AWF00R8fkhOjyaPR7VPVg7lM8+2ckFQZK+YhjwLKw97/MF+L0WqCmgz7JedGg2FpjmJHs7hMAj
 Y2QodabokjYt2DA3BtNPpGXy9pdeGskCPFhkHPWQBTqOtEEAZ7Zc7R4B4x7To4IJQDu1e4OswnD
 gbtwRiEpfrDrIxQD0PQ==
X-Proofpoint-ORIG-GUID: Zpd55xdCdIp60B5PVe8SZm8BxM4HjW2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230119

On 7/23/26 3:46 AM, Aneesh Pradhan wrote:
> From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>
> 
> Add MSM8917 and MSM8920 board files for the Motorola Moto E4 (perry)
> sharing a common dtsi, shaped against in-tree msm8917-xiaomi-wingtech /
> msm8937-xiaomi-land so every referenced label exists on mainline.

Do we know whether both MSM8917 and MSM8920 variants actually exist
in the wild? It's common practice for vendors to include an oversized
set of msm-ids in their downstream forks, either because of negligence
or because decisions change during product development.

> 
> Initial subset: regulators, eMMC/SD, USB OTG (gpio extcon), gpio-keys,
> Synaptics RMI4 touchscreen, BMA253 via i2c-gpio, WCNSS Wi-Fi
> (qcom,wcn3660b), and PMI8950 WLED.
> 
> Deferred (missing mainline SoC/PMIC nodes or drivers): DSI panel/MDSS,
> IPA, QDSP6/WCD audio, PMI8950 FG/smbcharger, modem/ADSP/Venus remoteprocs.
> 
> Validated on XT1765 under postmarketOS with a fuller fork DT carry; this
> is the trimmed upstream-first subset.

You should definitely validate the changes you send on their own, atop
linux-next/master

[...]

> +		/* Early console deferred with MDSS; panel driver not upstream yet. */
> +		stdout-path = "framebuffer0";
> +
> +		framebuffer0: framebuffer@90001000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0x90001000 0x0 (720 * 1280 * 3)>;

Please use memory-region instead of reg here

> +			width = <720>;
> +			height = <1280>;
> +			stride = <(720 * 3)>;
> +			format = "r8g8b8";
> +
> +			clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_MDSS_AXI_CLK>,
> +				 <&gcc GCC_MDSS_VSYNC_CLK>,
> +				 <&gcc GCC_MDSS_MDP_CLK>,
> +				 <&gcc GCC_MDSS_BYTE0_CLK>,
> +				 <&gcc GCC_MDSS_PCLK0_CLK>,
> +				 <&gcc GCC_MDSS_ESC0_CLK>;
> +			power-domains = <&gcc MDSS_GDSC>;
> +			status = "disabled";

Is this disable an oversight?


> +&blsp1_i2c3 {
> +	status = "okay";
> +
> +	touchscreen@20 {
> +		compatible = "syna,rmi4-i2c";
> +		reg = <0x20>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <65 IRQ_TYPE_EDGE_FALLING>;

interrupts-extended = <&tlmm 65 IRQ..

[...]


> +&usb {
> +	extcon = <&usb_id>, <&usb_id>;
> +	dr_mode = "otg";
> +	status = "okay";

Please uniformly keep a \n before 'status'

[...]

> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8920-motorola-perry.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Val Packett

I'm confused as to why Val Packett's copyright is there. Is that the
same person as the aforementioned Catherine Frederick?

Konrad
