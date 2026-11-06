Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958558;
	b=ha1CeeGek5OASB7GOSp75/9awoDqKv85N9Mv+c4VbPMPrLG9cOd2dpXJxfhrb6Rhk+CH
	 WJsTAQLBGYgE/N1vJ3/grHgxGRkyJMRugUYx6Rgon/gxvKe7RSWahvEtfaQHZelXJj2ts
	 EvW3YvqT5MdJjSVinEpc0WIo+Z8+jMXHQMyLrklCUVH9zhEMbrkzKZpk45P5mUFYQI2DZ
	 WrqcskDJZWeV3F5FGrPXslI70BpedFRPzSZFDTkdRQfLjJQwNAGhCHW4EyrR6Ljdi2VBQ
	 1db8Kyg68bRjohZwCO+Bpm+C2gq2LE9+mHn7PboXFBWOddG1tEA2NwzUK5FOHgNZCQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958558;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bEiFBIGuKnvGWlaVBGNNBZrHwBL5ZI4s1ODy989ELd0=;
	b=mgmE/Xp8+l0JPBpXE3UdU6HXzooaa5Qn3/V694dVzG13l7nYwNT1PhCrFpKYteMjS1AW
	 zluT/exmKrlwsRrLuk6IUaDiK34QIQxmpzWLS6lnxTi9q8PAXrSDKp+7G2c8b/hORnDhU
	 ZRK6cPIqNADNpmo9LiyBmmwX5KqgRJjMLUbllKQdp6wPCV8IqAGnHzFEHHyKvH+5rVK6b
	 eoVL7satuC4ADRy2Hvgje1gwT0QuKooiY0oCdzFAd00Y9PsXJ5NmFRp/OrXws5mCnWYb9
	 NXbojqPVJn2rRFVXilVhZz4PvCyFTSa8NhWPVGr9huTh7sY8rRve26mheWA9PBiAI/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pXea8PlS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aj36VljC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B93A606A326
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 09:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B93A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pXea8PlS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aj36VljC
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RJmV1679455
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 09:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bEiFBIGuKnvGWlaVBGNNBZrHwBL5ZI4s1ODy989ELd0=; b=pXea8PlS650CrBWR
	9U1j/nunVPsZNqQGJX2eoYifIm9HumZvhma6qMSE/6uayReFkrfyasEcR+rv7DuV
	gMTFJK2224qguo/3yxPQP1PR/7iVyfBOyZvP3aZUYo+ko6WeMKDvs4HghUyQI56p
	4QVdTjplsAQb1BiDIlyUBK4QvrJfXH/lVk9Gnd7MvgA8jTv0pD6uqUlzmtWYZ0Z6
	AgabRvbyH2diAGkCEckt8kUcDh++DewJx64lXLsqxR58MChdcBTNPIFaFDz1dw4K
	U+bjIwbpWjtrLCfUgZCzCacoQqjg7EJcuc7BzYDSncaPGMGS7+MxEpLt8nUwBQVu
	HubmLw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pca6d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:49:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91e7f0b33cbso498206d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 01:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793958556; x=1794563356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEiFBIGuKnvGWlaVBGNNBZrHwBL5ZI4s1ODy989ELd0=;
        b=aj36VljCG/FCzYfOH56u7qZN0wTrTHDdel3RlxwRRRq3YTpM+mV3e3yWwbmsLJ6YUR
         NZBr6JWHw368EJ+BNgKGQQTQtwN7LSvmyY5qsIR3eh8zKvySKhDIlMpM3oTHf/EjLerU
         wOsqybTBgrhthTigMRJA6JX7HQpYC8IKmkdhzNYLcSG8WshpLwtxsWBctW9KXQE57a0e
         mbjUeSa3k53JXZ3HLMQS3D7Z+aI9FR2TYKMjCroXbHjaG2S/WG0ho47rbaIOutGYMZkO
         RIrI2lcMcIFKy0u6Iab7wgg7jlG3cAEUDGRgFttEOMuIZD0hqXSNY0x9pY+FqluVwI1M
         ia9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958556; x=1794563356;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEiFBIGuKnvGWlaVBGNNBZrHwBL5ZI4s1ODy989ELd0=;
        b=ZcocloHmUQ7mQI5gofStoKVkv3LSao5s3CGQhtPlb7Qji5CDX98++8vn17EIVtwsIJ
         P7u459qEgryEODOTMJiGY+z2iaEnCFn94F8FlSqBfsbplMT3mpirWEu+n7PX18Y++0ls
         pSXwTQcpY5xPcsQq6NiaIBpX7oOWJXyDRTo8Tr7Drv6cih9eDDjYomTumITiYflLLN1u
         BilbOGSvjYIFEHGNllCGtsbKM27cp26AvNPuHZLnq7ggETsdX3ppT1FcZn9aLnyHJAYM
         3KZf54VhdJQrlSVZTp2hPmWmmPbGDaVRfDG/aPY0j4m9qFqgpG0IaWTVZLqVHlv83o1T
         OHhQ==
X-Forwarded-Encrypted: i=1; AL+hErHep61rHIpEZ0TrvzGUQXhR+XTHATLCj04DFBSRubSz1V7/3HK9tefON2o0niGMWICXn/9XnExFLgbJxWot@vger.kernel.org
X-Gm-Message-State: APuU4Z96+gJP2yTX4S56c/h6lvSrr6e1EspzZbCsKLSNGgLJ7NZxR9Wz
	9qw1qVRYHyMTic6YBMFsFaAAeRUiChIuCGT54u0ykk5NbNmuccw0Pdt3Q6x2JByfg5tG4qEh+SM
	tG8dEbSKgQxR6DneLlmr4bW1bZtiYtdSKSExwF1/dteR/04NvqcnigHDdXSuLZaUXn8ea
X-Gm-Gg: AYBFou3e4EK7yY/Bxnq44/NxBWtoJNb5p+eH132sc5n9uvnB7TOxexe+eDVF5qKWOm4
	HoFZgTpY1wqMANIKZ/ptkpsPN1deEsOMJ2Sss4WJ6Gq04Ur3L/Yc8GxohhBpw4y4QulguJh82Q3
	TARkn2oGwFuFCf1Z14chN5JMDpjEtmhnLhkIT4gwlBqpcsJVFYN5aWB8ULz6ujLDIFmuVxLS4iB
	4G26SMKM8JMVhryvqjEWwHnBdxKVf4vRFOvSXXP8JlOUCysdLHxxYst4NJZB3ZRUrUsXP779hMg
	0AVnElU1XmfNQjaPd6OaQQPoxeJL335FTm60nzFbjUzl/yngUwQl0eYY05bDj5VA6BKJXleh/U3
	YTJyUUzk1tFHjJJbU7FCJaM+E6hehWtTddhVBKzdrAWlJeJlQNX5EQdjUDrgnflu3WcIzkQ==
X-Received: by 2002:a05:6214:1c48:b0:91c:6c27:d5cc with SMTP id 6a1803df08f44-91ea988dd32mr33495586d6.5.1793958555861;
        Fri, 06 Nov 2026 01:49:15 -0800 (PST)
X-Received: by 2002:a05:6214:1c48:b0:91c:6c27:d5cc with SMTP id 6a1803df08f44-91ea988dd32mr33495146d6.5.1793958555226;
        Fri, 06 Nov 2026 01:49:15 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356e7035sm62951066b.80.2026.11.06.01.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 01:49:14 -0800 (PST)
Message-ID: <6f15892c-bc2b-4f83-8c81-53e7b40fe35a@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:49:12 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Use GIC_SPI macro for
 interrupt-map
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106073742.99552-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106073742.99552-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rHp7srySjTOFUM_HQe9yTmYY_CguoiTz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX4mMUe059XgEq
 VSeZToGBIAIkOn9cQbwn7vry33d79GzFBSzNzaadIR93OguxNC8+m203+injyCsw5DHqTpJEtIB
 6hAMdYnkJX6VEEbmB4Rz21qro3Vri8vdDV9DQs5NMxv6jtA7vsFC4M9btLB89dFAM9VOl5jw0Cn
 /6XPuGvze8Ez6SaWXOLIk0O9LRWjZgXMgpV9B+AeEvSeEzqiWkH/dmeZph6YtTjI1K8jpICLmGL
 XPc/JA1HtMGjsrQR2Ip7NwJtWB47Kmzzh9A4J57f7WXBUsbJEAZf6giNohcj2bTzUd1//BNMjzD
 ZcpUn3wB2AmhHdW2cRFFQIpJcX0B6ZbL0ZoELtPsPMnvMAHkWFW3jusVIMFqrAAS09weDfjS/74
 pCeKc0pnbHqX/jrLl5ZuvQkcQZxcboWb1kHNZyS9rX5MO6Og4cBk5TtyVZeDpwc/MIevRHZx/hf
 d0a7g7lP2hKUKP6OXpw==
X-Proofpoint-GUID: rHp7srySjTOFUM_HQe9yTmYY_CguoiTz
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aeda29c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hdY4OLW_gtqzIo9ogFYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfXyPgvWxP/RUR9
 poa1HF3X73TYKo/1o0XuKGrELYvUCQ+T6DvBObuAj4/tUvO1kxAT9RAHWwlWQv5Pl4IAHF9Cit4
 pVe2ipIrTc5pRLIpEz/PerigPc8Pv9w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060038

On 11/6/26 8:37 AM, Krzysztof Kozlowski wrote:
> Make the complicated interrupt-map property (with multiple '0' entries)
> a bit more readable by using known define for GIC_SPI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
