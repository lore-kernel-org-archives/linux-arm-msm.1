Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793685467;
	b=iyOvJ6foAX6t6redqOG+7XyMSS2IBH/Etoi8tx3O13zW/t9DteMjTDm+/amGBN78OcjP
	 tLOvxbmuWVcIRaoy7h9CjgjDs04ykFkrz5nrTRbNNqMcJmhJ9QRMqtrUuL6e30kA9pH+O
	 aNbrWASh5GuC4JNv4cx3VLNHLlVUFgyDfofRDTJ54VfSx7+qJ7TXKOd1sAKmSr5YxDW/8
	 fRJUYGrIqUxRciCQB08PwumFrF1rlbiqsthzOTPksoJL7QXa5BpToLk8IzAwFVDxjsOWF
	 ht/CUaeXMNhhKYNoC7hZjdGVjHO/WWZFG6QpsFDxpRIZN2WQ4lKdsOsTaNw+HDyMqxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793685467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PJsG2kFUzmWIVpV233fDLAY1GQdDB0aSN4idiIfFSMg=;
	b=XVQZLOZJ54JR3vDk6EXzD5fz8KhtYPvkMXeI/V0fBQWPfi30F1wRg5AAH0+8oKn6kb5u
	 0rxoVTeQrKKJJNAyO3q/VVmkFY0VF497oWz5o4eC4GIPX74cY2M8L3X70e3MMhkYSKvbY
	 XD5Y5T7V8hV25Q0+E2kqtFjAfKkhSytcxx5v4WhnMJnDGlO9pCW5jajgCKWdxvWbEFet2
	 +cCo0mtJcSozTyPEuMkF14nxDaa63yIhtpNRwkSgvz0Vf3bgWEvwQeY2GlUZDKHDNYeD2
	 d4y+r/zoRNOdIO4vqGOqu+Wu0AcvqpNH5CD68WErbM4drFONwmpBVAiF3tMRc0xrFvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S9AesGBP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IPCl2tQ2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980BA606A32E
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 05:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 980BA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S9AesGBP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IPCl2tQ2
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A353Gnm2451177
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 05:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJsG2kFUzmWIVpV233fDLAY1GQdDB0aSN4idiIfFSMg=; b=S9AesGBP9hSJljeV
	ww3dgpha13lRM5zcSnS3feur4P1jZnXP0q+bCwLoaM83bVFreJ4eKk4lSO7sV0Ju
	0aZdeeRvA5X2Pqj0IKuLFuPKq8CXb02W0x7Sv89jEDg7Sosv+PFys6myY2RL4yKZ
	IAz2j4Mq7an33cLPGhd/LK9OM4Zo3Cbx9+hnNfnMTZ1uu+4a+mRtiFoqjDOdrhC4
	EmU7TKiKJvt4+Z9GWSaXI2kVjgIXmmi+N5LylNICjm5ZKaGdQ9n05GjNfWVNKJYg
	y3DIqexGT/ypBE5B1L+98PYcm2zv2p6Az+5eSxdYn7d67IMV7ZON/Ipop7xAEFkj
	uimAsQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94cr5pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:57:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so1510532a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 21:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793685464; x=1794290264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJsG2kFUzmWIVpV233fDLAY1GQdDB0aSN4idiIfFSMg=;
        b=IPCl2tQ2nWBR383KPUh4rk9EnWD83UOyzXaLKMgjZBIVNl+DnwTqIRLkWroTvhn6DN
         ePGjlsCtFqIfCs0N2COVeIFqTOVV6afBkokvGlxlPd0bH230BLe0n7jJaPZ/s0KtEIxl
         8JEBtDkaMrVnQ09kZf4egi3fgQYUxDCcylwquijPWMXdd6ygNRy1s5CEzSKaOOU7jH0V
         VIezK2Mp6IbzZ9gez8CP7Df1hKIEiSf8pIUWpMbTZsMq/C0PQmKmNIsa3BJu95g8TjoE
         qXTrm7wJUqY2DGoNE6NpC1/ZoC9T+uyd7mFCWFV8afN8IGLrGObO/iy0IjvGXJMAnoNJ
         lVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793685464; x=1794290264;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJsG2kFUzmWIVpV233fDLAY1GQdDB0aSN4idiIfFSMg=;
        b=1d59UsgmraZz9oid5AuloAiqJKywqAVNslf+rMJDMhX/3SVqSFohQA9UZYZqF95GMt
         NQxjU7DrAF63wbXnTw1LVrAR7gedqHzfReruBt6bSkMhtqhBzliZHnjO1S3C9YmSZeqV
         QqyNpz8YsAB8xeadICVKRtpKaNMD1BbnWurKUUsP5yBDRwR8/Wdn4vXTk7HDDUuR+EtJ
         EfdpthdNADE4h9YShfdItwKIgylTrgiM1UPXnw7z+wnv6rBKtmO8QR57gbPvxyy53NlH
         zBzZfG+4q146aU/VbPfGWEOsqgLGFvDu/evSwe1Qaj+K9ZkrwZhrWM36EVEVcKdF/ejs
         yfEA==
X-Forwarded-Encrypted: i=1; AKwUvBzdpV9FvXOX1BdyEeDxmGWp+1kH8a9bo4vXXs9GlZ1xB3TDgYcs5mD6eao2/LJqqUN5YzDGie2pGLXyMBCR@vger.kernel.org
X-Gm-Message-State: APuU4Z9/LctQIhn8YN2Mz37B8oLgFGUkB3HRCvra947B9/a2L5x74HU0
	u8NP7apptqcFO5VF9ukyf3J2Ku5vE+tguMvadq9PsOiA6XqYaH78pbs9UYgno7bDr+ltGg04OrO
	TNiYppvY+4N+lyjHMSD7mGrnj3Ldy1QpFdn2ZGFSQ4LPB6WDSMH+wZJtFb7910lm1SyVL
X-Gm-Gg: AYBFou0IFpx2ZPRHOQLXL9q3NeB7vJTdK0HYnEPncIOGsRiiUAkMwgtH1KnqQVTGeYF
	5OZSxYdJsCB2EQ0PLQrqfsl+MxTltvGbkgOfOMxZ+mLeF6K4CaRvkiPt9bcr+VtMt3iO3wzn9VN
	0ZeCUzpL6f/oyLxUtt083SjTBW+nwjsYFLEwRb1BpwLs823hEX8lYhgOtOjG0GOrw7yOmxjG5C3
	cag2nJ+3PT2pmNDY591RMBOYkTuITWe5m01iIAzQDqSo2Lkv5vF5CVPtnK8+6tmLYKm+TzsbQBE
	M9R2d+4SKztvDg2oPT1ThLoQiGfcVygt73uMVuBL/nyIVc5KJQolOffK7WVIdl+XAmSaq0cEqqP
	UzfWrbLuKST1P3ayF2W4BJlAmhei8r5RwxT0+ha3XYihLqGL3i/uabQuXclwJ94Yhem9n9hLTJO
	90+A==
X-Received: by 2002:a17:90a:c88c:b0:3ab:884b:65b4 with SMTP id 98e67ed59e1d1-3ae8984ceddmr10250871a91.59.1793685464254;
        Mon, 02 Nov 2026 21:57:44 -0800 (PST)
X-Received: by 2002:a17:90a:c88c:b0:3ab:884b:65b4 with SMTP id 98e67ed59e1d1-3ae8984ceddmr10250861a91.59.1793685463790;
        Mon, 02 Nov 2026 21:57:43 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5d7f82sm2470465a91.5.2026.11.02.21.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 21:57:43 -0800 (PST)
Message-ID: <c394d2b5-8f66-4fba-a38d-4ba52778b471@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 11:27:38 +0530
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
Subject: Re: [PATCH] dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-qspi_dt_binding-v1-1-5249111cf870@oss.qualcomm.com>
 <f71369ca-5963-41c7-9103-dd39a7369e38@kernel.org>
 <53640a9c-395f-4faf-bbac-20c47013cec4@oss.qualcomm.com>
 <20261102-crafty-beautiful-lizard-36db2b@quoll>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20261102-crafty-beautiful-lizard-36db2b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae977d9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3EltNRdik5pUTb2ctQ8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Vg7nsZBRQ2P1a7Hp82XODfLlTIkRmRth
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMyBTYWx0ZWRfX6UC7hyfu3awm
 F1yGtkYFitVDiSiyZ4QI+sbh1+/vbxJpqLJPhNP20Jpm/XyFgvqVdcQIRd1unS0q9J1aLqc9aNQ
 6OpFfYmm/AI+11JN4Wb3C1DAXB/P/8gTI68sqFH1BptQ3fqnIyqI13uLfgwnf9aIHacPLcm76zh
 KHBff3WuwkO8qSXPnIFN68+ev3WtxH40UkhYKrz1B2f02D0Xwz5R26TuRo5qHnnoEDXssPJtFxD
 GDDGeVueFJtdmsQnVvV+DxSznPHqZSsDtt3j9HpbW5i+cLLUQKS4c1LlhWEq1dqLBBlHi3ucCQ7
 kPcA3c16D5iO8yl6xiPm8c1n397nBcCW2TLh3Ne8Gn6AsycQkHlL3N1CagBcxZbzrcGnIwwEf5U
 qNmEBJi2FUsm8NpHfozbGQvQ932rKKnV+EngyWhPp/I5CfG38PZ1bk4GecugKeLKe/B/hQI+tFR
 /zpaBAlFd7Ss33hYcog==
X-Proofpoint-GUID: Vg7nsZBRQ2P1a7Hp82XODfLlTIkRmRth
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMyBTYWx0ZWRfX0VWUfeR34p1S
 k9vc+3sh6MA4g5yXvxe4WgWZkHk++TlwZmyUD8bxSJGBuDCvPJd9VWb16gJCXtXMBNvj8oA1SLq
 MyhNsaq/IBdfnH/9IshYihF5awuZoF0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1011
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030023



On 11/2/2026 4:59 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 30, 2026 at 07:28:57PM +0530, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 10/30/2026 7:06 PM, Krzysztof Kozlowski wrote:
>>> On 30/10/2026 14:30, Jyothi Kumar Seerapu wrote:
>>>> Add the "qcom,geni-qspi" compatible to identify GENI Serial Engine
>>>> instances configured for QSPI operation.
>>>>
>>>> The compatible also allows the driver to select the appropriate protocol
>>>> firmware when the Serial Engine is unconfigured (GENI_SE_INVALID_PROTO),
>>>> distinguishing between SPI and QSPI firmware.
>>>>
>>>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>>
>>> Where is any user of this? You speak about driver, but there is no driver.
>>>
>> Thanks for the review. This patch only adds the QSPI binding change. The
> 
> Please avoid stating obvious. I can read the patch.
> 
>> corresponding driver changes to add QSPI support will be submitted in an
>> upcoming separate patch.
> 
> So no point for this submission. Please read submitting patches
> documents (both).

Understood. I will submit the binding change together with the 
corresponding QSPI driver support.

> 
> Best regards,
> Krzysztof

