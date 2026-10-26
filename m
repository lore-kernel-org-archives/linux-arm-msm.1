Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009893;
	b=FSlT6BmBn8hn6aeYUCZDHayToiGbXtEksE2o0y50aMIkJy7KBAOEHPf7w/c8Kj+8R91p
	 H8IEdD+xRMnZXsIxfYROwmEi1ilNXge8kIW6oBKOhJoIx3W5zwhkK2+AsZubN8CoHsG9H
	 ewV+RrMZ8pLfpwTYpXVIoZUQ8azV5vrAYPpcUXNU8gaOClzkvwq+HbprATyIysqlAvB5t
	 mxykIpgeJfOmAtJ/r8HvJ9uOSvcGFr2WOCahmSbnzFt4gavt+dsJjfVWXP5X2bF1pcfBT
	 7fYV2Z519qlZEdonEszHpfPfeeEWQzWs9O6/sNNKLH1m5RWHRsd1aFAkZGTo6tgnbcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3R5Zo4yAfimR6LnVWpq1lFnDn9+4WkdPOhsqjK8hrsA=;
	b=BUYk4OrT2iPtPnj/3nDshuB0okIW+c2PRD3v8AM7NGYdsjwmqT8xFJSbcjlIFO2Iy4aq
	 p8uejSPhjLw5a5+W4Yr0jFGlJPhgsMaLxHB8n504jSWVXgwue9J5VpOU/SSVrag8by0cH
	 cywSs94tLSajJHNY9v7MQF3k8CoZwHXZHU102CaEB1KGTWkTMAg43+8aavDUq+nMvtMTV
	 wur6cUI5HQmB7ikJcb3ZTY69bGsAoduGuKizo2/xVTGNYtNGNyQtKRHpu9mM+8X5TAz6D
	 jdBC7Ul7+xOMVqswEfwSSwFpUjsoGujAuzdU0rtUv7OzX5+ehvqU6RvKUdIvR/8I/5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPPxRNat;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b5Nd5Ctt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A03606A33B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74A03606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPPxRNat;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b5Nd5Ctt
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QA3sYL3448786
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3R5Zo4yAfimR6LnVWpq1lFnDn9+4WkdPOhsqjK8hrsA=; b=VPPxRNatdmsu/dNH
	lTUkUvHVX4UCJo1YoQi27WjjVDcUbpcUXACUhnctZT6VunyYiEDbysCZCR8ARfM1
	WuC4DoKBg+91OZ8+E7fY5ymRTAwA9557UZlMc5fBfhTKDIRpfXilN/51A8jQhezN
	yX5M3GhnsaHxAe1gpCVLVpp2O9mHkC9FzK0fxL3fjJ18p9COjtiS1p+dSQU/C+ce
	/ZOZjxOqiBh4olOOOoQhqYLn8bEvDukKgLWUfO//77YZDoSkxvO+pZ51SUoi1hZF
	IZHy7MQe/3tJQa2huoe0gJdttb0R2dgm99+iwf49hoLeNrPGlv38hciKm5lmf6d0
	CGt+IQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s902yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:18:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536708d1a3eso12041481cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793009891; x=1793614691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3R5Zo4yAfimR6LnVWpq1lFnDn9+4WkdPOhsqjK8hrsA=;
        b=b5Nd5Ctt21m9HyPBR1rCiVnyy5PBDlG24z9Ft/UOFYGu4GjIBQeOrUtNC/UDTJD21P
         94dUzw7Y6X0ocv5YTds7mdMF51vqRuVJ7UtUemUxs02W1YeoCf/rviQKA/D4OreRPorW
         8+1fNnG+EyfphXOlFDrDD9GsytQpKEvBO9RrTi3hGUzRmQA23viIWlnzmu4GxoNuBIZd
         X0ck3qH+PRwP5+vLEsBS0JcPTt1QWtABW8xRsbo4P0u233J5aakdlOjb+4ltRwVBfyQy
         eJC7GeRtneaU9DBEXqPUhQKiPcB1VXVjqvhtQ/YRlkblL3JnW01xBHuI6W/urmmsV1lv
         ss4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009891; x=1793614691;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3R5Zo4yAfimR6LnVWpq1lFnDn9+4WkdPOhsqjK8hrsA=;
        b=aVD/LQLR01K3MLIhL8aRf2VMiHzpFXefSGAO0+0vsqVGXSchCNZNdufQXxieLT/fz6
         vjz3hMUdkevCgw/6WnpMt5QWTYiG51AIpRiqlhD3PXHaJWPmN5IC9FJ5b8vjkW6sYpxa
         qibyuKaQb5liB1olwk6uJ1AaZwycL699SA789NzpD9IWzXQ+PT4LCahT8eCURF0J7Vm5
         rav+LkBCXBjrbqnsLZcqdfdsuIIqmTDCqjzfpzEuiqnosnnsY+djcuT/DBImb00dDQk9
         goEErJT8ElskgX54msafXrM8ENamZmDsqFvQT1gKGjRiV7TmlMbUnbByFB1oCtqNPcVb
         pAfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyoR+gTvjSzm3qcb8w31I9bzz0SzlQ/cw/Pz7CLXLYxJXu+C4r0P9oBhzw/aqIwelp4BWXFEq5vvPDsMC0@vger.kernel.org
X-Gm-Message-State: AFq9FYJlc4RiigfWNCvmOPlXflMzUsVsbiX2DscMeL2fsW/wsLRMj1OJ
	vMcHf6G9sA7PDAEwsK2txmiTAl1c/b7ijvY8G7zdjevMBnNQlsyADjCyOrjMoCk+/hPXLSdFPhd
	huCzAQdjwyX7p7aGbzkCx7jLERUa2GxQQparuIGT6F/+sgtMBSdpk4zP5pEjewf0VcKEc
X-Gm-Gg: AYBFou1kPUU0Zoe5lCbHRIUdnKwMfGgbeMhz6puqXaL7JxoyCN99tJCcJsnxY884pL/
	WIOicr75ueS8t5+ztszRPxOZO05TZ7tWl5Dp7p8c2nXqXO3pMiFbBpee75AhomhFeXC+cToUBK0
	OxFFtzhDjm6xdETXxcVqLoQtVCvfIROE8+i40erB16WEsj46qI7cj4sMC2OeKdy/N3Ixl/b/E1g
	a1m6GJ4Wuce02Ir/NLBRAtx39t13ALkJtnzlb/11AmlxYSIALWj8sNZN9qK91hUKG2BVIoKJQHj
	iE2CmCKLqTyy0sFgQnSaXwkrl/mbuSxaBJDkfx61wydhz+WKPUwvzJdkyIK5pZqGCzq9omzVWvo
	ODeracGs0apt/Lb0r1MDurQ==
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr685922285a.5.1793009890640;
        Mon, 26 Oct 2026 03:18:10 -0700 (PDT)
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr685919985a.5.1793009890199;
        Mon, 26 Oct 2026 03:18:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd350a61sm301851866b.12.2026.10.26.03.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:18:09 -0700 (PDT)
Message-ID: <4e7c426b-f3c1-433c-9d9d-45fad28aa5e8@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:18:07 +0100
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sm6115: Correct cluster idle
 state parameters
To: Michael McAllister <me@michaelmcallister.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1792840208.git.me@michaelmcallister.org>
 <b73aaefa59c2aa795af8e1c4ab117b0857b332b0.1792840208.git.me@michaelmcallister.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b73aaefa59c2aa795af8e1c4ab117b0857b332b0.1792840208.git.me@michaelmcallister.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX14hlbujEokUd
 Zo5b6rss43mHuOpDbTQe42IIJ+Mm1+DH9++Gyk58ounwmjmzNwWhevWn/3mKSyYwNK7Hp74QXiA
 10BsBsLZI9PQxDhvcm6lJGvr3Xr1O7Tj6ncZ0jKjMLWWFGNOrN1TYBUjSEPi5vOgmwlzq48fmPf
 z7Rba3QNDs63o8NULSItJBjGkks8vGTXN1fmmyqBcrW1f+HpVVgn7nLxLO0rdEaUIhvX1/Sr5+0
 x572gQnM77UGPdetQ8EZ11N/PIOknseXxpEj3HmFLyfIiFJ4gbVT1zlgLg4M7c1gu8H2c/OdKti
 u8j6x4KPYw+nP+7CJkeD8sG5qyfHN+eZsSLDXWERfZBHBBQgdIVQfuRHMrAhzzC+2fj/BJgpDGd
 wS7R7EKejYL6Lr+5wSr17DPaWz2nwUM89tlMF/tMft2RmZf0dBP/X5qbT0EE0+Fpmm/yv7HF7vv
 4z9lasgvmHbotNrjwTw==
X-Proofpoint-ORIG-GUID: 1Ceg7MtAO2lTrgFZuaMCjUuBz5l7RI8C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX/9p1EIdXkeLs
 WFooTEKBvZ3EtPuSvvKUA2iRWtbfqubYUtPPlufapT4BPNF1CekRkhJLPvrXBmNUkug6FzkJ/gR
 LNd/NoXHBPH9O8TeQYEbJMysJHLQ5Ek=
X-Proofpoint-GUID: 1Ceg7MtAO2lTrgFZuaMCjUuBz5l7RI8C
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf28e3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sim_hGIB01VkqWS-gC8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260039

On 10/24/26 1:10 PM, Michael McAllister wrote:
> The cluster state IDs encode unsupported CPU modes: the GDHS entries
> request CPU mode 2 and the power-collapse entries request CPU mode 4.
> The CPU power-collapse state is mode 3, as already used by the CPU
> idle-state nodes. The GDHS entries also omit the cluster affinity level,
> and cluster 1 requests cluster power collapse instead of GDHS.
> 
> The downstream Bengal power description [1] defines CPU power collapse
> as mode 3, cluster GDHS as mode 2 and cluster power collapse as mode 4,
> with cluster mode shifted by four bits. Its idle driver [2] combines
> these with bit 30 for CPU reset and bits 25:24 for the affinity level.
> For either cluster this yields 0x41000023 for GDHS and 0x41000043 for
> power collapse. The Motorola SM4250 tree uses the same power description,
> byte-for-byte, as the Xiaomi SM6115 release cited here.
> 
> Correct the shared states to match this interface. This replaces the
> board-specific overrides used by the Motorola Moto G10. Runtime testing
> is limited to that device; the downstream sources provide the common
> SM6115/SM4250 encoding evidence.

This paragraph needs to go. It's a conclusion of your LLM's local
work and doesn't make sense in the upstream git history

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
