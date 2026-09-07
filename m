Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F333FF1D0
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 06:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764164; cv=none; b=HcCMLhuR6VfBmsibJA8HZg9W8ZlbSClAv5y/bM42sJfeJbsWrY4X//FnUUsSVWlwrDbSGbO6lpGy6Ryv6Rvg5OunFA9kfTLuRNKQ/03UCIHwlV4p0Uih3MujQ+elmKmGdGtHZqdkaS7zoOAfZ4jjL7lTq0C+w9gedcaeOxrZ9ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764164; c=relaxed/simple;
	bh=IUdf14I4+jWE+TfxtC/gC9l4ctJDVAQisE6B1hm+Uzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FqLI1vUHNcHcvLIKbn64AoGqJmC2OMt1ZCAXyi5MOPMV/zPDQtcCqhhmMYZkb0K2/ydGE9lmy14+L/hxbutDtgOPWzASa5hG/5FsBZp2c3QOiKGUuRMv6Gsda/PSrWcTrUKK5abGuAmbHIMk5A6PrldzOa1GEd54E/b2NZLgz70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFWQW/OD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGURjKRD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFWQW/OD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGURjKRD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873lAw12916920
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 06:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DrnuhHe7eYsauWd62qNHEpZHKwgT1SJIFquJMZsSrug=; b=NFWQW/ODQjFFJ/1T
	evIckK4mIyUHyRRabJbjJjWGs5miQtVkmMpGiVpB3H1mJCfDZH78rg1fbUI4Hr7m
	5e0w2r+9MbWOnvKI3kxdDCpzDJFtFKGEZP8r61eaaRfNUaW/b9AXW0+sBLhOCSff
	8NeYRXj+T4PopOFJ0yapmMlszoR3S+cr7HYf5ou4EE9YzEHpq03APnqe4ASO1GuO
	Zr3ZpyxkASTZLvHSGPJIFQs4Er0g+k4D/XG2oWpqtfpfF+8SThKY+2o6uwXg+KUH
	OkS0B9SpI2QcUa9pTEULiqI/EaSguswIlgmZOsdFiHbSxNwayop3oSylc9vj7CxH
	AJIF2g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj0kjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:56:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398d7e0f3b4so4032164a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 23:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788764155; x=1789368955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DrnuhHe7eYsauWd62qNHEpZHKwgT1SJIFquJMZsSrug=;
        b=UGURjKRDFBgKioeHBZ2SCBmYK0CrQ2vWW+Iao8fLw6+zbQakVJ/pPFuVlH8q0kgUM/
         BSlT1BdlvNqaNxx+LHWQA4FWsL0SI7qFC6S2DZrGj0Coxmf1ZN0fvcVCdqSSOwenmh/u
         FL3xS1MoANBSq6ylXzgd50joqL2DMdRAy+LAPM/3Jo/71+CxtIi+1zQBeeUEDsOyo5wW
         3KtWgtwJ8JVuuYAf5o50ZspFjcYkUJggyoaHDAeTyzB+MoWxVDiDHRYqMa+KPd0+WzWI
         AehW9o+VRQSMZEenFsjF+O7AMTzZVfN6mSDpDCyMr/okbvM9ORGHbT4znZu0QmQRx1eL
         GEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764155; x=1789368955;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DrnuhHe7eYsauWd62qNHEpZHKwgT1SJIFquJMZsSrug=;
        b=D3DK666w7SFC6E2weOjn+OYFsydxw/N5c0/3Sy2c8v5zm3eg4XLCx4cXpmrsGwZ6AW
         7lrzRz4XAMFnzBRs996Pmi7n+9LjbTWkHjIGbwTyzPaojclYpbPRtIAO9EDgWAPae05G
         nUiLFbJI+A3lanGcNrYyCFOMRNma98cbRQXbaMsIwHX1KkhXsadet1hYfGhyrr3iMDXX
         uVYIoF1IFj70zmCUq5dXZZBacBy55lvWAzC1/1sVzAGKtXv16Sh41t6SnCHcTEQmS5nM
         +DqWHIde3N21MD5cRRbFO1sehjal8gcYUtIqefXEMueb/mNQvqdO7ZIXaNMQTWpqgCG6
         s2MA==
X-Gm-Message-State: AFuF++nd20ziwYXyojrw0+lOYDsBXOJK1EAdhKQzTbk7VyJP9UyWwRRN
	765mwhDTP1cswGUS0XNRStvHtMhMwPsJhtecmomLGb57i2+9GF7Sbs2UrZqTY4xxgxPanHbJYIz
	HUZRnRiLiyxL4OvFSDUH1TOW8k4/Cwb7j8O7WO9Csn2pkzuc6AXVDxDpjR1P4FPLm5wAc
X-Gm-Gg: AYBFou3YidrUDJTsXbSATg7Paj6MSkAa3kv0GYhQ3y+jOv+5/tWXkuS1claPqM4FKvn
	TN4XfuhTpHHoY8rZd3sIDTCJWfOZD7PrV5T1SWRNVHzNSuDaDe76OI9CKIA35szH2wmXwnnBF4j
	hQcqN5XI/LEwBq+3ktoxuRVU/Tj8rNvyZVtdw6EZ54u6+6xEpv2Hw/FBFO1GTVaY/khpuAh40J4
	G5WgZ2/ORqi+w902N5cp5ndTMYGXaRY6S29FjH1WJ7jgZnX28cpN3FrgBiUAEgiDKcSaAoqTMkg
	Jq+EG24P5DFhsG4Yz98CsgHtF11JxSkGm6mt5BSlrdP59W9LXKKYloA3fTufYlX1dGFt0p+vEEt
	X8gnLjEotTy7ZeLcxS+KsKE7Yv8NQng==
X-Received: by 2002:a17:90b:3804:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39b25f4397emr32298929a91.0.1788764154658;
        Sun, 06 Sep 2026 23:55:54 -0700 (PDT)
X-Received: by 2002:a17:90b:3804:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39b25f4397emr32298879a91.0.1788764154092;
        Sun, 06 Sep 2026 23:55:54 -0700 (PDT)
Received: from [10.92.167.32] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33825669695sm2656767eec.3.2026.09.06.23.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 23:55:53 -0700 (PDT)
Message-ID: <581a1f3b-1883-462c-96bb-06b2e7b727f0@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 12:25:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260820-b4-shikra_crypto_changse-v5-1-70eb4040fb25@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260820-b4-shikra_crypto_changse-v5-1-70eb4040fb25@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3MiBTYWx0ZWRfXw6ChwMgdBzmV
 oV8kIH41znLsl6SrRq/CFkEqgCPjwMKg4ocWcxqpn8a4B4ExV2GMUbmv1qHGjmrjQhoxgwBIeok
 WdTy3ktf+8U2r+VXzXiOxX6uEy7tQyRtFCWNrvzBG/G7z+B2hm1g69I4mguseYtyehn8ZBXdl46
 xtwBLIOvFecy65oLFjeiyKByTSctnUaUq0rOzPIM43S1jXOBylirzu5srPchnJ0FryQrxJJEWkH
 6D2EvwCkjdSql7uS+6I6BXl4Zwrk+2oPFXt9nBEbb/cPshR78iGxJYvOua63e35+yDM66IF+NUV
 OzH+5nyZFDNunt81VlF3Jpk7Z3B/6R54TKR13PL7So87yOP19YS0e1LQdmuYe7pTdEhRJnZkOxP
 AQ+WbglI3y3zEgaOa22X51SkOdmE8MT5wFfdqzL4INpQumrKnu6FqTrXl/xblftACkIIOeMn6V9
 JB39fKQOTKlLQJjjGyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3MiBTYWx0ZWRfX0cxrAOPMyei7
 I7sKO5BIS42mM3OeAvPXk5V4WN/dw6vHFPc7pjx95W4UjOW1z5hspgXqJnqgkJ5xQK8bXZEP6u7
 ZSzMnLadio4P8Ch+ca0J4iBv4MZgYug=
X-Proofpoint-ORIG-GUID: ZQ36iEqejV2nj8R8wSj194HmBIWNKbQx
X-Proofpoint-GUID: ZQ36iEqejV2nj8R8wSj194HmBIWNKbQx
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e6001 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eVVSAIOIRSDSNroG8R0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070072

On 20-08-2026 16:23, Kuldeep Singh wrote:
> Add device tree nodes describing the crypto hardware blocks present
> on the Qualcomm Shikra platform:
> 
> - BAM DMA controller used by the Qualcomm crypto engine
> - QCE (crypto) engine with DMA support
> - TRNG hardware random number generator
> - Inline crypto engine (ICE)
> 
> Also connect the SDHC controller to ICE via "qcom,ice" property to
> support inline encryption.
> 
> On Shikra, different BAM pipe pairs (for example 0x84/0x94 and
> 0x86/0x96) may still resolve to the same resulting SID due SMMU-side
> optimization. They are still distinct pipe pairs and therefore require
> separate DT IOMMU entries.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>-- 

Hi Bjorn/Herbert,

Shikra is actually derivative of agatti which is following a different
crypto(qce) configuration different from other targets.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/crypto/qcom-qce.yaml#n40

The current qce _is_ still working by not voting for the clocks as
clk-smd-rpm driver was doing proxy voting.
In recent discussion with clocks team, it's identified that clk-smd-rpm
driver will drop proxy voting and recommendation for qce is to vote for
clocks explicitly.

I'll be sending v6 with the change ASAP follwing agatti's convention.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/agatti.dtsi#n889

Sorry for inconvenience!! as I see patches are applied in the tree.

Regards
Kuldeep

