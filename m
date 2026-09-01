Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CC647986D
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278192; cv=none; b=RCWPWzQ9OCcLoaiB6GWM1Yag/KBRRQu6lwaYQrCWQ1QOK9jF7G2YjcMSTlYkWhTo7qJYD2d9bMA08DA2B4V7+syFROSWbkLq8nINBHr91gxqx/iYL22p3dEJztX2R5IMrqTCxPXWadJl+P/jsGcjmIacTU50YBkUyohI0ItltJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278192; c=relaxed/simple;
	bh=lc0SWLpcQVTbTeNUJ77O7aLsobiha5VLom0ObsPZTsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tlG7sqHVgChz2ee3azKPnysA18tndhIkXcp4pRkNdr3TZ/iBPmra172cf+KA2StXmswWLsqgXKVPZ8LWRVUThs0Bg5Jqr4iPE4AgR2AWSMa1u6hCCkhrt+672ZDgpMcGLSyaQggco1bTnU4HRD9pZM5YnoJBRcJ8iuUPslzDcv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9I2e5u5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVEbEOnu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9I2e5u5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AVEbEOnu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9S7i1638707
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 15:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jwr53RGsm4/NukuHmcmcy0N3sAukN970PME26WprnMs=; b=d9I2e5u5dGEQ5lbm
	yr2u5cAOVDuOBR/A9Nv6Dw6TjAgEoI6v6CmwjdpV4n/hnQnXmMRYIa1JOeTDzfmK
	grjV1WrRbi+6EA5uj/10za9ZhQdD0xpcOkwr4OMEkTOFnMAg2AxOlVNTocKiatIX
	tICDGzYGDC3zVuRlnV5VZNyaABwxk4Kc/QbWSOwFG+4Z3TUoZh4fT/giKggDHtVg
	l6cgtHCgZ1ULlvpmw4/OOYR8+Axl5fjzxcap9Pm95OFxnxuvyzbMyd4IxcKjA3rP
	seGt/BlYkvUnrb38IobgkVYVpQMzP0GE5fgbw8a+ZnGftlNfws0PKn+Y+Kk8/a9K
	sGxV3w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsjt8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 15:56:29 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c673f01b76so4135e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788278189; x=1788882989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jwr53RGsm4/NukuHmcmcy0N3sAukN970PME26WprnMs=;
        b=AVEbEOnuzpRaWhD17qi8PGIb5Dnfihwsp1fCp4v5gCsFZv4PbOBQIm5jNt6RIxhRQB
         k9ondBtDFgnmVDFPEhKrhwH30MkXQQEk7IXwdPyNq8RdjwK6/kIZJdPAO2WwR4hpSa7Z
         4SeCnXy9wg8Vf0pMIJl0OybRBbpjigtiyRHrz1xb6Kkrply+oOaYpALL0vWiVH0EFI4j
         7WUO0M2tTgsWUkv0jHOV0MD/ZBEYSzpR0BatMBzSIvLrfuKx4Ty0cD/K8lbABdQTLuHu
         PG7GfdKXntf+JF5e/AbzayD0XJUDkIdox+N3R9+KR70TCQ8oQrGPkMFadNYJgmIAsk2F
         e0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278189; x=1788882989;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jwr53RGsm4/NukuHmcmcy0N3sAukN970PME26WprnMs=;
        b=Y6xP7dinTGgBnXqG142G46HsCEU56ztggIyDoaSltPibgbp3xDEKB311MWZM7xh3Wj
         iteFTwBJ1CezRyNmsSFG4OBGHppQmXVJypaVPuo3H7ERCGU7tbsUXMPpWR55vR4zuHcE
         C8qaSuQlVuLSeEfhVkj9kVcLvi2CivBrZw/cXBWRCzh2KEqOw/VdOot6gSf8LLNHh5V1
         aQzXIsKlsFLc4NVVC5Gf8r+NrhE93E3oMGoV0Qukj7ZVfjGsiOCaXDopzMjvOV74l2Gr
         WQ6NHgKWkBicOQCFkfrV7040/GxVhKSzsCmL0SWg1b0HMOn0hfSYe1+BlB8IifgDdBXq
         lgng==
X-Gm-Message-State: AFuF++nFmt0/l22inU9Qd9mgVczjUCNPAbdwOM+HXp/ZuxC9AAzrg68+
	27qjSWMIC7ftIjr85wXg+EYYrSzJK1uz2AJnRl9Xe3wcmm6RHZky+WwAU/dsyVg72g7REXZ0KEY
	DGOzpleErteRv3GgicI5QgxJ4AWfUbgxhtX3wIa7olHaOaXIpzxaxfmf5o+NueAZCZPZo
X-Gm-Gg: AR+sD12V/Eo0qMbhI1zrJtHR4bfPjHCsKo032wyJOXUw9uAQ0Au0rcGAWyApKKqPqBY
	iTnoR7bMRVy0xwd5oFG2N8Ln1WtarpNA6ap0jA6kq1P79F0EERmSsSB2b8E6RRz9ESlg6waifHU
	AAuG0eNlXOZt8I0K3yVy6F7l3Zp/NirOC4CLuC2uajD44Mh+akw2zbaJHDXjk4K1nL4wCSoJb7Y
	JEj/+VLatR1XRZX4fr3Vc+YVnlU0nVtEJemV3GHCm9ZBAJVEn+B97Wi0HSA2cxzejPw1q6S1Ez3
	XeFBvik3XEsZpORpt4M93apUFly0cXYqYVEbfWNEY6AJA7sKmb6JQJL+kkahjJweeq5XVyXnqed
	Z86zK2J5D5gVlpSCLPJeO7w==
X-Received: by 2002:a05:6102:6a84:b0:786:8d84:5aca with SMTP id ada2fe7eead31-7868d845f20mr2619338137.2.1788278188938;
        Tue, 01 Sep 2026 08:56:28 -0700 (PDT)
X-Received: by 2002:a05:6102:6a84:b0:786:8d84:5aca with SMTP id ada2fe7eead31-7868d845f20mr2619315137.2.1788278188442;
        Tue, 01 Sep 2026 08:56:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a11f80sm3018433e87.70.2026.09.01.08.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 08:56:26 -0700 (PDT)
Message-ID: <1a167d6f-2dce-4d06-a416-9fd1e25c69a8@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:56:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MSBTYWx0ZWRfX+Gt1z7e9dCB0
 DQk9wYHiCVsJtR27Cs82TinvyVOWpTvoaJc8x+YPzXe5GzcnYq84dju/q441+abYEy1YF3rRD3i
 4sPiM0C32dpD050Nvg59kNy8sUjYNBM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MSBTYWx0ZWRfX+nw4HJAVnL+I
 KqA/snHys4rWG9AeD8wFi7vf5N7Qwdg+ZU7fsG5Tw/E0qEXPNa+9JNy4tmRUc3P0g/3cqG/OvLc
 CcisBb4cehk9ypwiEabn4nAMEcjxNNpVyCFyna/znNFEjqTU6zZG/B2ftSyUCgNMgKNvIMNvTLM
 bPzhqd2pkStBwrvc13jfQuaiUXoaT+QxqnUlGFXhJtCLmXE6GmuaqkWPIY56msPpTMqFj8Gf8bP
 V3IiD1VKYhzIUEOonDhlfJ3Omt5/Y0nd9kXGedq2yy/3TCCjK/ega10tov01468bEVmDT0nORNz
 HA0WCaIeTYnU4WUZAAvxWOkHDARQOaM2C5m32OZmlNje/5xxK/BvfVKTbCtGPkC8ISRkUCNFNPd
 1HmufdOJT/bMIXZXuX4d1PnREwHZJWHbd/kRemW6PT7/7iAejonrX/jXOSMtIHDj5xw+ox2iVc5
 yANImn1Lc1GNE2nmwFQ==
X-Proofpoint-GUID: 7VEQ87PM7bygn2nqgf0v0Ge2XqfvdaPS
X-Proofpoint-ORIG-GUID: 7VEQ87PM7bygn2nqgf0v0Ge2XqfvdaPS
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96f5ae cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=OHs8NuuX1ptjo3lIKY8A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010141

On 8/27/26 7:51 PM, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

[...]

> +		pdc: interrupt-controller@b220000 {
> +			compatible = "qcom,kuno-pdc", "qcom,pdc";
> +			reg = <0x0b220000 0x10000>;
> +			qcom,pdc-ranges = <1 148 6>,
> +					  <9 156 2>,
> +					  <17 164 7>;

GPT reports you're missing a whole lot of entries here and that will
lead to the wakeup GPIOs silently failing.

An old local script suggests this map is correct instead, but please
check yourself:

<1 148 6>,
<9 156 2>,
<17 164 7>,
<26 173 1>,
<29 176 1>,
<40 187 1>,
<46 193 6>,
<52 266 32>,
<84 249 1>,
<85 256 1>,
<86 315 4>,
<90 43 1>,
<91 45 1>,
<92 154 2>,
<94 158 6>,
<100 171 2>,
<102 174 1>,
<103 23 7>,
<110 147 1>,
<111 31 4>,
<115 175 1>,
<116 177 10>,
<126 188 5>;

Konrad
