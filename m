Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502078;
	b=ClNRA59nGYpOMMdA/BFAMmQTu/rBzrWeMsI0xBHZsI1s5tXl6WXQEq0Jh3IJZRyKFJ48
	 BCgKF+mGdm9cL4nu5G2Z9QCnuQX+VJEOqrT2oCnG5aqdkfomzQ7wPTwY5Pwqrn1U6g9C8
	 AuJHziVmwqDs4IYbo2yV7BeIN0tCaSwB0XnxB292V089b8rnhydzqAPrw+k4ej2KYLB1e
	 zFqc2lUE3K51P3liB9alwIJj2zIplxajZsu6mQDEfJRkPvGSuCZ3Jp/nhOklsz72J4NF5
	 ILghZBKWlMJs8gjgoDYmj35tAXNj6G9E6KuUax2Ap8jLTzF0uihLNcs2/GUSCXUYp/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=947UXbVLxrJULR8svhLGpAbfg1TvUwmh3xE/goLBpn4=;
	b=KyJPxoHInnwzH4v44qCbHc8C4wybx4/wz6PxRp+d2LfEZl29I7YcaCpoySjwQZOsDw7f
	 XSEP5g0hXBW29gZ1pwL8i4FuA1sIzLGo+i4x/vzyM69hTtVIZImFMEWUtrUhaGuN3HLIl
	 r29MA1nhqTROty1ARIaNsis/RUsBb54Zr+Twwv8QQUWx1xydZoY9vEeaobZGTC+Zx+PFG
	 p6ZtjZ2jTLPQeWgdGTdjOetU6r0YFWXbe3tQ/uVpIcTAfdKoycCQIMZnHSnM3lB7Buemf
	 IeJ3bUUcyZE7N8ARChTJA8EP0kHBRVWXNekfJQpBrgIIHF9XZqP+i+DMDa4qxbLMwZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bU8AV/gL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b7xG9M+p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B47606A33A
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3B47606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bU8AV/gL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b7xG9M+p
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k5bg3225375
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	947UXbVLxrJULR8svhLGpAbfg1TvUwmh3xE/goLBpn4=; b=bU8AV/gLvIZUDnNl
	c4CjPO2uIJtRiXJyfv5g3Q6EL2MLLv4IljP47fXUKnBWemRyn0DKL37raB5tDs8V
	Z+87q/uFrtox7vkUl3K4dmbv9WERxoQPvG+tiUYkO/6/THduz8gHh7dFteAeIuBa
	IN90+KxWpGn52YOdzfjICtdKAzcoqzIG/WV/AWcrqaH8MZGw4ABe3g7V5TlOIxs0
	orGJ7nlzFa/yReRa6bZkgRtjrQqH5s7H11bWBEWtbMErS85X6UnXFkr0xvz9C8co
	SsuD6WPkCM0vTFaz1RDP/9+EkDQ+uRfTNw8ILHn8LCHVrdt+yH8Ow6l1f8qRYPfz
	g+iI4A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f1j1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:34:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b203b0c139so3038120b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 22:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502076; x=1796106876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=947UXbVLxrJULR8svhLGpAbfg1TvUwmh3xE/goLBpn4=;
        b=b7xG9M+pprNtmQA1tDIEYq3rHqtlgfuvY7shGOwkX+Jf1Q7sFWZG/s/SAYdwV2UjuB
         DAIjMvVnRmK0IAWLnOvvS7636IIYmJMFJZxe9rOuw+/OXzfy6U8Hb6KfDnW55qH9Qkba
         FYPs5IL3x40CnEQfjzebmqsyDMx8t7dJQCOFJqBlQBqO/DUX2bjg39UaQe/HxS2brYtb
         DpWr7HU53NiKPtSSKHXgtvyOvThrxz9+olFg0xE3JZEBFoOFfaidcRi817m5fBTdHZFU
         zoZbW8gzYDSXqCjsmjpwz8XPFT9JkJtTVgAmUU03L5PCyo0Zg66Rj3293Bg5MDD7FAon
         ikNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502076; x=1796106876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=947UXbVLxrJULR8svhLGpAbfg1TvUwmh3xE/goLBpn4=;
        b=pTNx4bWdiWNPSqYoLG4OUeEoD2XLyx+y5MxAPOOWcj6VPo9BJeHXhRUXmmfHgvvUhp
         0GxRmjqYpz4Jc7KjTph7xWbDniZ2AlBL0O+pvKVLCoWamZNVbg5yowgQbXHQjmAQ8HPo
         lzFeC+kwjG+bT6SbCTuXdAgyzfUq5kH/qhQMfigiajQrQfCIND5waOkDFnsRgJgd/Arg
         BS2zCWapyBvnmuiXo/nFl5yFK96BPLxv7ORBzbIt1S8nne9X+Uoxkp3HyolvxD7b/OYt
         luRFUjE5u7vmXcbslVUleDrDGxKEIr0j/AcXDhjTO3WS5Cv0hcN+idYc+TWjyokGnZvD
         W9JA==
X-Forwarded-Encrypted: i=1; AL+hErHzXlflXQj14wmqfyy1aG/5pxtJoEQ4ee2zk5s5yyEbJmBC9jd7MmMYV3wqI7CnnF3Z0Z4zRtjW5MMcJAc/@vger.kernel.org
X-Gm-Message-State: APuU4Z+W/50hG0qn9W7mWNCcrt8ttQbLTy6b8X3VQffM3zWDRvNi6QJj
	wdreizuH6KLV8lnC4aNnnllyiPY5Bvhj5mmTGak7Sx0DDOWw97on4z4H34Bh5EPfVgItceUfqN0
	KrebBkHx1dCaQwCjcSotbxrHqBJc3REDAdMiZKM0O6kkK63Jtk7Uf6258aujNtUiLyZJi3zlDZW
	Vn
X-Gm-Gg: AZFdTZccQXpbsqD3pYjhMbeeS4XQ4HqkI95sRY524dXqS4Ql86okUpRGmpyfCRVxNqr
	8sJcDfsIdaTAIrIa/G8krIvHE35MzH5h1ZF0cjzU0zDcAUDeY1/kUJvfYZHgGl2vqcajwGwD0CH
	vU5OdqmDSEO1S4ul3okdoy+oCgWI6lF9Hi8wNlFV24bf9aO073IkskEy5GPoShDRHjS9THvI3if
	kHaSSL7QjIi+SGwFQyANVdmbI10unokN3ki6w29hUOSdkHaiyb60P0Jzr777MeyqE1C4eqVkpRr
	FCcNJq62aF90iKYZtI7VzXfnqSoYwakind4rxOqyndtl6aDZrmNj28NznfpLIaGt2XXA0IYrhRe
	Dli59FLNQcMIfJDCOawn9ozJ3eGzlILLdtWrMjeDYmKe1upNHkjcgATrNqLKlJQrMplb/EbFWw+
	Fe
X-Received: by 2002:a05:6a00:4299:b0:8a0:7dc4:95c0 with SMTP id d2e1a72fcca58-8c87b8da5a6mr12005122b3a.15.1795502076109;
        Mon, 23 Nov 2026 22:34:36 -0800 (PST)
X-Received: by 2002:a05:6a00:4299:b0:8a0:7dc4:95c0 with SMTP id d2e1a72fcca58-8c87b8da5a6mr12005091b3a.15.1795502075648;
        Mon, 23 Nov 2026 22:34:35 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm6723898b3a.28.2026.11.23.22.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 22:34:35 -0800 (PST)
Message-ID: <fe9ca68f-8f3f-4989-b366-38c0cc6c9ea3@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:04:27 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/18] dt-bindings: pinctrl: qcom: shikra: add gp_mn
 function
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
 <20261118-gp_mn_tlmm_support-v1-15-703f7badd194@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-15-703f7badd194@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNSBTYWx0ZWRfXytjJakpgRDCi
 p1r5g+9wDgQ85kBYIzQsHvcr4Y+geUBT4Twn/U4iXVG9LTmFTCfMv1hDeMs9vwRPFoSvj0oiwjW
 EUC8/RWe2Sm38zL2jEERmnVEvcdeMQw=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b052ffc cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Ir49MwnX2Lnn_q3bKQIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: ldhwCQHMkPSSK-xZrw_J0kGVncsaHcAL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNSBTYWx0ZWRfX6rfqixVdtgIq
 xEV/MDX9ZSzyBqczc27I0E1Jkw3uvic5owPUbD8TCXlMX4ugI9+fSV1uSaWvZQPZHXFRt/P/nYh
 SffRi1+ekHEhPqFpSxyQuZhts0sSn/8NfJQTrDUU5MyIJue/WUUoGBxiBaaLYmpOdPjDwBgVMTq
 kiKYJ1D6E5TOewSuIvDPrDxThkEeqmCY04N7gYFmAtn756CZ3bgR/FV2NZSlcxyEtjwnArFF4FQ
 43wzYJv9FUaHSFG0rkxfJxbK/uZxGQXqxWdzjoQXASlJcArU2Y1mu8bzbfO03BmAl4CPYkzTrBx
 c9Ljve7tP0KfhRgSjiySuiSfZcwR4+CSw5Owf7VsFiQ1MG2QBG12dIzcDxwMa36CdAoK8Bbr5Dx
 6BCVAei6OaiOKwfsrmF3QwlfkzR9TJcIL2rNOO0PfEnzBgH9MVne/xNhsYkAAkGPjJX1Ws0577X
 k8T1GqlW/ZqGMjKqmdw==
X-Proofpoint-ORIG-GUID: ldhwCQHMkPSSK-xZrw_J0kGVncsaHcAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240025

On 11/18/2026 11:32 AM, Taniya Das wrote:
> Add the gp_mn pin mux function to the Shikra TLMM function enum. This
> exposes the GP M/N divider clock output and is used on gpio87.
>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
> index 411c402f9044faf36c5a2250795a817fe43dc48d..420d0b5eab1821bc81a74cdbe83a5de480f9ff3e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
> @@ -73,7 +73,7 @@ $defs:
>                   cci_i2c1, cci_timer, char_exec, cri_trng, dac_calib,
>                   dbg_out_clk, ddr_bist, ddr_pxi, dmic, emac_dll, emac_mcg,
>                   emac_phy, emac0_ptp_aux, emac0_ptp_pps, emac1_ptp_aux,
> -                emac1_ptp_pps, ext_mclk, gcc_gp, gsm0_tx, i2s0, i2s1,
> +                emac1_ptp_pps, ext_mclk, gcc_gp, gp_mn, gsm0_tx, i2s0, i2s1,
>                   i2s2, i2s3, jitter_bist, m_voc, mdp_vsync_e, mdp_vsync_out0,
>                   mdp_vsync_out1, mdp_vsync_p, mdp_vsync_s, mpm_pwr, mss_lte,
>                   nav_gpio, pa_indicator_or, pbs_in, pbs_out, pcie0_clk_req_n,

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
