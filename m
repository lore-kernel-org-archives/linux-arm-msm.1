Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478858;
	b=EUnLRgXVQAt6YoDRDyc1WrmSQZ93Kxw44uLzKU5KAoLo6SNJZ/EiWDdsINVXok26S2yc
	 k4LrtusaTQteRzztPEMSaf1jQoToY/88QCrH5GAJnwmbAbDBoDRH5zAWY1xpkdXzoQSIF
	 LUAUOMsNfNC5J5FlUIPXXOMAir19mmGPn7nFghMtIdmNTPW+m+cLoTHQm7ieweYRYolVe
	 MwmqmInkD/txBpnhvUvfPbwZA196FF5N6IG+qSjeoL5BM8BArBOoP9ItQn9fPvy+O2yYG
	 VI11dAhNu77VK7UQkrE3AF2x0ikQiNaCYDtqRQMLZFcp+A/pe3nFeun8TwkYKMRKGiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xE10P+uk4zNthoMOfJL5g1Osej2zE7Y695Cl7w1M/C4=;
	b=R0/Ib3Bp+NsPR3OA7C4Alg0T2fKY5t7ioYA83SR3YQzgKfjJKeSf5CxFtGH0MTI0kpU9
	 GWLo/Tn+2mk5HtjFJgqTnXaNmhU47MeOh3c6+4uSTQ74LxcQgumLvX7dbr4yI9qpsmdmX
	 Pb1a4uuXZsn8x6hFYjoVFBU0SI0VWO0Pn2sTPlnZ4KFSjmW6XRoMdmcjRsTrm/aUL5q6D
	 KVXzaQDgiT8HazbNICpM1rZ0T9l8dN4WxVDx4rOleKvLZWQvgGDpCna8zEB+ezhPM2xY8
	 z20mGRKV47sv9PZhglWu8iDXQRJpQwDuhwXmfK4K+DLpqjyQzdg1fJuE+ZLZm5M6RaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DY6c4zsy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJuiZnWf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C40606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9C40606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DY6c4zsy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJuiZnWf
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9RNnm4092529
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xE10P+uk4zNthoMOfJL5g1Osej2zE7Y695Cl7w1M/C4=; b=DY6c4zsyIIwudJ1m
	GOmaVOyhORdZCQ9jgXWygIpWrNEYD3F8l0sontN2nfn8SQfB1L8Fq2AbVkUb+pnY
	pVorlf+IPVY6jwl4DNnPhU7KZeZgerFbuUnaNBDXuvK/TeCvzhuJ4kLEZQoXZ3l/
	Q0nMePy8ykK2JiHc903UXiB1L6XV+/kE0+6V06s/+cBQxkjH0weq+LAwmnbaee68
	zaVwXwKWMti3Scg4InGG2DW94VOQ0KojE3t+1SSiwgtPH9dzEHJElIt6LZ8qB56D
	WEFXWvxenAmnJ221Hq8rQjPikHecWi1CEtSWy+nFds+dZvuSSOLvz6dLh9fi/lBL
	pvrQ2g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8jc3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:20:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so3718926a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 02:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478856; x=1795083656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xE10P+uk4zNthoMOfJL5g1Osej2zE7Y695Cl7w1M/C4=;
        b=OJuiZnWfvsNGQoGPCxDdggYBIUHIfAJT45kdjoCrUgO+DC8+TszyEm8UJh4oK7t9fq
         1P2w2XPJSIJxFnYCRb2c7W0aCwTT3vtEEFSEoDI55dF/E1dsbeskfMWHrl30eFNVPbLv
         AXflwhEQHParZdWTszPyMcYxs73jQzz2ESaQJceafGdG7yx1X54puoiHwEt+ah7e9oko
         9pwu4E9PV82fniFYxiFH0ETYGoSP6roQQewasvl+5nPZbvag/uL1H2zV7nf/TYen3rsf
         DihNyY1U2/xcsvOaSfUS3wkefZ9hn5cGlZS2TDtkr4l8tb+jMrYjoN1t+M6wKEk1Yhzj
         lqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478856; x=1795083656;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xE10P+uk4zNthoMOfJL5g1Osej2zE7Y695Cl7w1M/C4=;
        b=b8q6x6tBPgqd3Op7FM/qN0GNXAAtRiuKufI5om8Zyuvxvpvq+sMR+D8unx4P1+er/K
         TP2wXpzF7eDmCmZzTNxVNRxzGwNu3bb4l33V/fwQkAcMmFahz4ExKfIMUIrf0YDDj+Qq
         wM1FFVih2Gln+TgME1I6Sx7MgBXyMLxEFUg6+2BFjcjzTINmDGGyxYQssJvhrzVUV3AF
         ULZia9zcyyjX3NzuGxxp7W2ocsQnlaAbd9TD3iD2sqMbFRbQ5L686t754tdcgD0eDz6H
         I0M5prX0jjjmWrMer/Nr2UVBcLxFFAyJC51yFM7JKL1dHP4r9pS0+9/F0Da7KPtJgvkB
         Zv+Q==
X-Forwarded-Encrypted: i=1; AL+hErEIHkd7SU1kH5oVONKXoKpNGvOLRR0VWgVYjhob1QLfBbTHSFz5Zu0eUrbodjIDTPoSCDqO6zyiNMZE/SDg@vger.kernel.org
X-Gm-Message-State: APuU4Z94A1Vvu8iXyk9kK6w4AxIWjNrO9O/qYJuzuMTmqdjkqMKagr43
	4/FFSVq3gWQN7RiBWvO6BNuh7V4Acek+CJPU9PGJgA3rg9L61i+wF1GkAH7MYygbn1EseGVow9w
	GojRnsz5adt7VPu0yJIbXU7VP1T0QKiVXCq+Tw6ukTETyH84rGpGhsGdnG0RKCg1PdhJP
X-Gm-Gg: AYBFou2hprrpfDYKB7ZKTlV7/uVUtZ6V1yPuGGycfFA4l4pJjfv5/UdtsEu/Zle4fPf
	2ZoI5NlsRJMEUsCh+s9RrFE0uLsvvxgVFps90/SdADzxoVx2Ffngs1c2Umxw/e2NVi4wi2sBOHL
	bZfvHg6X22TlZ9U69RKUWzNL98hj1/g5Bh6eE+1uDYvMfE7J5uPCdZGRmNnIw8TXzDgcAVM9BGu
	tNdzQEvA7xTVrnvmjQvwGOEs7mBkVwgfbf0rsu80Dg1z4D0eMGTR/pPPTvanwsFbMao1fKsCM1A
	EcGSwpe5a23nlJeXRJjMffybNOeBDyGu03punhV9u58joh06KeWxGuM6zPTlDlSFv81wgDvfXkt
	YBoO2/6IOmgZ4GM08Fslox+BclGBjg3FnbpSooRnIB3iid2UidT10YU+z2SZVUk0MBzIQCmfciJ
	c++5H6L11j4f0=
X-Received: by 2002:a17:90b:35c2:b0:3b0:a3eb:75a0 with SMTP id 98e67ed59e1d1-3b182efb666mr4818038a91.23.1794478856373;
        Thu, 12 Nov 2026 02:20:56 -0800 (PST)
X-Received: by 2002:a17:90b:35c2:b0:3b0:a3eb:75a0 with SMTP id 98e67ed59e1d1-3b182efb666mr4818004a91.23.1794478855724;
        Thu, 12 Nov 2026 02:20:55 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm4011387a91.3.2026.11.12.02.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 02:20:55 -0800 (PST)
Message-ID: <50254309-4714-45c6-8989-7963637df690@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:50:49 +0530
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
Subject: Re: [PATCH v6 v6 4/9] ASoC: qcom: lpass-va-macro: Add shikra
 compatible
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-4-2cda302237cc@oss.qualcomm.com>
 <179436005594.790675.8837636459182556844.b4-review@b4>
 <25ecc2ac-434f-4eea-b144-51fbc683201f@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <25ecc2ac-434f-4eea-b144-51fbc683201f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MSBTYWx0ZWRfXwqqbQQlkSN4B
 GFBU7OsgASijUSXakp3NcI+rQ6NkGi/yb7Et5ZsKAEfbxTCcmM3ynbThCkUZAT1Wdoy9ncM/0D+
 NU6GVfSO4UBV4yLEoxJr76ipoqdEZeA=
X-Proofpoint-GUID: UKV-AtQTIGU3zvgr59u8znZz5HnCUC6z
X-Proofpoint-ORIG-GUID: UKV-AtQTIGU3zvgr59u8znZz5HnCUC6z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MSBTYWx0ZWRfX8SAXWI01I8k8
 r9xsx+S6omeTIaszoo87gDsfyptC0x7xHzYEHkKe2UA0SHRqcY8DnVu/F0nyFot9Ie+1ulxuQ3B
 Jcq/0qYkeWS2+fgfNF4Uj+MHs4EADDBXeQW5/Ai7A2kQWlZaY1/fZb2ipxCmC7TBgjRXuQOsjOz
 Ozauh2hIuvFQ00SyR6dbUybsSXVLzwPU921QjSGQcxtPM8K6o9U/wDSniKI/fWsY3XatRNDe65b
 zmUnxWjDOQ2HOq8jSlzf/p6Q6IjyzoXAq6nzIVVXL2s9LjAa9gmROUVn3JZxLMnB16XE3YAa6Xu
 oyPE0vyVtybsB2UwixJpB/xZBYZUK9+aAd9G6gRyE99oG51lAWLZxfY3/3T7dx3BJ661k23oouS
 l34+OZiHWFh1+PrpJa4U9WmrIqQc0eGeqIn6WAxLULs4Vg1qkkXKcT4Z9YCcX7lr37A50VmfjYz
 rBG5JY4nXko9IACLSaw==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af59309 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=hEKXFTEi-1vmzGoa-5MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120041



On 11/12/2026 3:47 PM, Mohammad Rafi Shaik wrote:
> 
> 
> On 11/11/2026 6:50 AM, Mark Brown wrote:
>>> Add shikra specific VA macro data and register programming needed by
>>> the LPASS codec v4.1 implementation.
>>
>>> +/* LPASS codec v4.1 adaptive filter (ADPT) blocks */
>>> +#define CDC_VA_CDC_ADPT0_ADPT_CTRL        0x0800
>>> +#define CDC_VA_ADPT_CTRL_EN_MASK        GENMASK(7, 0)
>>
>> Is the enable mask really 8 bits wide?
>>
> 
> Good catch, Mark. It's actually 6 bits. I'll correct this in the next revision.
> 

Fixed the typo in my previous reply.

Thanks,
Rafi.


> 
>>> +static const struct reg_default va_4_1_defaults[] = {
>>> +    /* VA macro */
>>> +    { CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
>>> +    { CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
>>> +    { CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},
>>> +    { CDC_VA_TOP_CSR_TOP_CFG0, 0x00},
>>> +    { CDC_VA_TOP_CSR_DMIC0_CTL, 0x00},
>>> +    { CDC_VA_TOP_CSR_DMIC1_CTL, 0x00},
>>> +    { CDC_VA_TOP_CSR_DMIC2_CTL, 0x00},
>>> +    { CDC_VA_TOP_CSR_DMIC3_CTL, 0x00},
>>> +    { CDC_VA_TOP_CSR_DMIC_CFG, 0x80},
>>> +    { CDC_VA_TOP_CSR_DEBUG_BUS, 0x00},
>>> +    { CDC_VA_TOP_CSR_DEBUG_EN, 0x00},
>>> +    { CDC_VA_TOP_CSR_TX_I2S_CTL, 0x0C},
>>> +    { CDC_VA_TOP_CSR_I2S_CLK, 0x00},
>>> +    { CDC_VA_TOP_CSR_I2S_RESET, 0x00},
>>> +    { CDC_VA_TOP_CSR_CORE_ID_0, 0x00},
>>> +    { CDC_VA_TOP_CSR_CORE_ID_1, 0x00},
>>> +    { CDC_VA_TOP_CSR_CORE_ID_2, 0x00},
>>> +    { CDC_VA_TOP_CSR_CORE_ID_3, 0x00},
>>> +    { CDC_VA_TOP_CSR_SWR_MIC_CTL0, 0xEE},
>>> +    { CDC_VA_TOP_CSR_SWR_MIC_CTL1, 0xEE},
>>> +    { CDC_VA_TOP_CSR_SWR_MIC_CTL2, 0xEE},
>>> +    { CDC_VA_TOP_CSR_SWR_CTRL, 0x06},
>>> +    /* VA core */
>>> +    { CDC_VA_TX0_TX_PATH_CTL, 0x04},
>>
>> Are we missing defaults for the mux registers?
> 
> I missed in this version. will fix in next revision
> 
> Best Regards,
> Rafi.
> 
>>
> 

