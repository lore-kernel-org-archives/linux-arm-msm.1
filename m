Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010751;
	b=SN5bp5qFAQGSuIykFjo8u5dnRWMTxBtQP7LbzBiDNH9a/rbTkYsMsnqtHLlHZ7f4s/9/
	 N2sRejIH/Slpi0+LWiArld1Tvv4XC63+anEMQ9nUos+w/Ow3AdVbsUod4rubGAZNwJRBC
	 2kO2fmjfy7W9J5H6hxHV+0uSh1bezXna5PaUU/kH0MydywA/g56l8chrb+CrWspSVivGp
	 llSdcoHlyoxWtPVVbofzkxYMtt9MrWgS+z5iAnorpxvXKHOwKBp6EbUJsLm/u0Hp/Jrf2
	 miWT+709FyfjODV2x82ivfTxV7xmiRpcVNyB/3DCPB5ftTPGdxGWu74nH5aLC6kWBEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010751;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SqNVN0NTswa3cRcCZzARPyshpWFTY6ZijbCqSsQ91+0=;
	b=WZ5JxGqYS/TgSfisE2pdns73/rNaHxo+oRBafN+ldgfom3niDmuat9iuVkjIcVoqwFKy
	 0vnqk/xfOFhYKi9M234Plti1Uz2dogbcBCVO4wWqws3UwSnXzE4s1GUZZUsxh2OESuYzY
	 X4YLVcV+mZPbu85LgmZw+lr3FQSseuFLi76IZOAV16o1NTBiOEcLJLqKN4l2ANGSDmMt0
	 HST+0lt06jFJb4sFIGHQUWJFI5WVMA+lWJDFYe5j7muwT14CDIL9wug5dG2irzzyH25NC
	 Pckvffv0mplTryct4MPvOXUsP4QW+qyl/9U9ZAFsGITwNeCteKonBbVLrqUcNXTC2uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YVLtPNNb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FhThKXEY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C07606A322
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67C07606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YVLtPNNb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FhThKXEY
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QA3ise3521383
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SqNVN0NTswa3cRcCZzARPyshpWFTY6ZijbCqSsQ91+0=; b=YVLtPNNbGlUHy94g
	8RQOzlnrgJYZ/gT4incmst9z61tp0MdeHKIiAabef/e7CaVvis4Glct8lwcNBpEx
	COWiE0w1D+JnRkGcZmlHY+dWLzIY++dpAX1/SF/Jdi0AONfeJQMy04DX6+xU3Y0Y
	NMr8MLz7HvyiXvgYUim8jQ2XBBCHrNXkFlIXa4h9mQFQc6tSY8zkf0tr93Nf1y9L
	XG7/cV9pk5AZhDG94FZeQO0a2aCX/zoafpB+R/8d5THjQqAWcuZxdIRReppRA0io
	EdEXhiW1s0QSmkbtKQYZkON62/JTMoxEN1zP5O6u3r624dQCm2gm2GwYYYuIVzol
	TIaUdQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf03h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:32:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso35312185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010749; x=1793615549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqNVN0NTswa3cRcCZzARPyshpWFTY6ZijbCqSsQ91+0=;
        b=FhThKXEYKVY5HD3k8KcwSa7H5USWV7IMOHMyXq2pZhRsPO5gWbZ5nZtCJRCq3267bd
         MQ8gYAy+yCZnw+1I1OI/Tj65ku4J+ex6vBnN4dP9FylnRQDXnDxBOaEVDSqYXRXL9SKS
         BpZEu39i1WQa/1XtWQTCNrsQB+kjwVTYXL0WMRGrULqTfSsw/hE5P4AJR0XideSfT2xU
         J7YFRu9ZCim4NmPjT4xFAB7SoDsJN5p0t7n1wXXTRjaNHMbCfHnCqBkUQag87A9SiNi7
         8jIn8kKyyyVLIpdKFeCw8ZwfMpInpIRa13G4zFeCT/GYCmdEut5EqUbOmPhGkblMrzGE
         ypqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010749; x=1793615549;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqNVN0NTswa3cRcCZzARPyshpWFTY6ZijbCqSsQ91+0=;
        b=j5tjQGk9lJgAZLYzHdTCd+Uu/8vYE/CfdeQ6SZeEcgG5yC9lbcULRQ++JB8UcfbAKy
         fOJYaAZEXY72NU4TOvPq71HhxncZbOOtwoTyOgj/5Mzve1wS6/1KVsyaZC7+JPHaOz+2
         B1snpXzDkkhSpHVRTMBosofbXEOsbdk6981H92aRPCXxnPXaQPsKf0+LEfnSNq1Q77UF
         ciF79BxKqeGDDOxZCfQL5xkcwzrA44dGLxELNhDY9Yr3YlzXnvVrvs/ZnozcGwP2/rMe
         3wlRF34/uuMa8OvPWcSFpiDL+GPwoASGIN7/6eskXGAQCoRSeB6rsk4p+w8z+TRM4hpP
         9Zkg==
X-Gm-Message-State: AFq9FYIkZlI+rhSvmSUlMMVlp8HdKdtlNiBovpPqq5Y5QZRUMSPrySA1
	vwHMe3MQdlf++rww0hsja3E5XiF7tpUzMWYJfFP2ZllQMbXRXu34N9UwgpxJx3G2skflNViu3t6
	xG89sUj/ooZtnfr96xSrI/FVutxEcDci7sQERoUxlrx2F8dgjyy7GgFl+a673ijQloQr5
X-Gm-Gg: AYBFou1b0MSaaM6eZsXZYOP7ox5JtQtqWDquRuj2CpZaBNX4rXDMgvcoecYlT6cxKnh
	uRkFLn7opDNHVahoqi7qW7MI9B8LGKujat1IEMbG2wMeeoohq4tN/HOcyAmTGwFn4ENblw9CEn7
	mLMh8k2ruLSBRt4eo2sEoraGq9PU8uUgNSC2IbGBwK2M6KhVbyO7VFw0mBG3WYRqF0gLtUWLVus
	MOeFY7BEpT2BYbenEE6jkSykOsCBBixLPRgQH+xsJZzOhZg1cOtMJtwqEntUVKfugeDcGbaZ51R
	YU9r2SIJ9kvVZOJBuYWuLsvuIBeEW70maTPUzVUGUk8gwDcW2Z2ymsCuxfh6MsfBybgc6Umnd7h
	JoHrLKOD0tAfTvNV4e5YZYA==
X-Received: by 2002:a05:620a:8794:b0:93f:43a4:a48f with SMTP id af79cd13be357-940ef96b4d0mr925850185a.5.1793010749539;
        Mon, 26 Oct 2026 03:32:29 -0700 (PDT)
X-Received: by 2002:a05:620a:8794:b0:93f:43a4:a48f with SMTP id af79cd13be357-940ef96b4d0mr925846285a.5.1793010748912;
        Mon, 26 Oct 2026 03:32:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7984e9sm299947666b.74.2026.10.26.03.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:32:28 -0700 (PDT)
Message-ID: <c25a9b96-dd9d-475a-aa4c-760b5ab1af7a@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:32:26 +0100
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
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
To: ShiTou Hong <redstone.dcity@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ShiTou Hong <dc_redstone@outlook.com>,
        KancyJoe <kancy2333@outlook.com>
References: <20261023072832.2642647-1-dc_redstone@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023072832.2642647-1-dc_redstone@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX4rlnfYNP2IRk
 mL94NbSRcZcMPCvFrlNap1t3FVdRqACO8i+Ap9O/Yy8r8ZT+589V/StsoxL3A19ESm/zTKtpIFY
 LFESR/IpxbXW7R2Iv+KZrPwti3AdigQ=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf2c3e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UqCG9HQmAAAA:8 a=EHe6ishlvMgZby2v5DgA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: u4GicsZWO9w3NcqhgBwxMFfnypJgKWIP
X-Proofpoint-ORIG-GUID: u4GicsZWO9w3NcqhgBwxMFfnypJgKWIP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX62otRoyO3Ub5
 voWj2eBxgghUotBd+9C89CIWTYFzJC9XeNkg0zkcYb/o2Tu+Giwm6CQeiciG1UPJygjsefy6CIH
 /nQioZ3CyHx/FWDdaI3Ge/VrzZcMU1gXH8V9bStQgFa/vA/PUNXYiGeUiE5Qqs8ctg9TtZwd5rN
 HvCwX4+2OkfczR2E68tnQ6MkPaoI6SB/hp3VCr37jK5B+3Nqgt10QvI83ZZGx7x7ZmkJiLosryo
 cy6VBwE1I+4kMAXQz71GtDIu0M8eabrnlXDe+AHZX+3aqrvylulBVkW2bvZdcJdolaA7E6swGn5
 6bLlm+vf1M/8VeB5TsP2JU5cx2iwTbMZGgnAh1HBEm++YkU1KdguZis9g6BsyAcuDq6jicllAIo
 xS3YdUNoh8Ysrs+Mt13FagVGaYmbSBP2699oWSDSvigl8+kAF5P2vQ4vwJc91VruZZYXdxeM1zv
 5VsVYeyc8G709CoTY4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260041

On 10/23/26 9:28 AM, ShiTou Hong wrote:
> The sm8250-hdk has an on-board SD/UFS card slot,
> but the SDHCI port hasn't been enabled in the dts,
> so we can't use it after booting.
> 
> Enable the dts node of SDHCI for the on-board SD card slot.
> Add the pinctrl node of the SD card pins.
> 
> Co-developed-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
> ---

[...]

> @@ -467,3 +493,16 @@ &usb_2_dwc3 {
>  &venus {
>  	status = "okay";
>  };
> +
> +&sdhc_2 {

Please keep label references sorted

Konrad

> +	status = "okay";
> +
> +	cd-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
> +
> +	vmmc-supply = <&vreg_l9c_2p96>;
> +	vqmmc-supply = <&vreg_l6c_2p96>;
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc2_default>, <&sd_ufs_cd_pins>;
> +	pinctrl-1 = <&sdc2_sleep_state>, <&sd_ufs_cd_pins>;
> +};
