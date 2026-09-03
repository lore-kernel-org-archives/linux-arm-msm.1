Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05F1490BFD
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436774; cv=none; b=GCtMxpRdN7hrkEwCCUt4GF9ECfRvmpI1mvUBMrWifk49aBYwbeGP+Lbk1fHo/ibpgWMQfzaO0lDTmC9Qu44cmA/v6qXUkYC6dk1QeVzNj4+VK1BWMPdZSEZ5H6cfGwbJhMQDIzqT7CaoSN3ojDwCAn71c+oBsPWZxjUCQgxsh/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436774; c=relaxed/simple;
	bh=7QmXtZAxTs7eawrjZ02CXScDt87oRJ5G/NUCVI6qPuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dr4vfcPIKiK2kRAszgLJ0qYdFJMPlIcHI16gIgn3Bd8OPHtVMmUh09+Us0WgGASpJHFsauenHU2Qbhw6cdiFk5VukgkTXQPTCdbWTH0xcFKBuGzD3158/56VlyOsZT65D1AwKpAd/JxDSm7SeHKWTDj2oGYtIed01fOWsDtFXr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gxmLwF5f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eux9TEup; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxmLwF5f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eux9TEup"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683BTJ2w210335
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 11:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1Qym9kgY4rq9h5EI/XXBuMVMLgjEotX8kn67PH7ku0=; b=gxmLwF5fBmd8f75u
	sRW6IU9ZMIG0PRXHPGElLnWFEJo4TKNXOKYuluMo14b/JlCYJvZ8EGGpOza4K1X6
	sM25jcFk4HFwdTSdvxpaUVE/aj9of/m2Dyum9SXHIaYfjkLNqma7dB5fViCFfYZj
	h8oTky5qQ9OeDJqrxRi8kYf9L1p5P5Ys25YlnNtDTbcCAsxoQXK2DUVn7Q0seEOo
	BuIKAf0U/mxQu6sNp11ie2mgSrcPXoe3HwgK5YrtkszLW7bxTkanNEGXpgCNUElU
	1p3GhJtaSdaA0WnDfBOb6IOsDMbXHyzNMsmpKWcDBXgvGbd1olhWmDMDVCEty64T
	b28Krw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf82k83e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:59:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934a8cd3a8bso48500885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 04:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788436771; x=1789041571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1Qym9kgY4rq9h5EI/XXBuMVMLgjEotX8kn67PH7ku0=;
        b=eux9TEupaydYJcau6OXsSY9Hjr9pURAILSGJ7okAOfMZFX3ApfbLc3UL/Yyy5aUUT2
         ftiZHxCHy3cqr0hZQaFNCgTfzT+BHjHc5QY3BXdqym3Ks0K/o2N1/bBYlo0OH4v7D027
         ssLYpW4Te+q9v4x1y72gVAV4aLLCRw2EbpQhO5yzz7B6t4czrkYkJd32f+RZ/WdS/c8n
         /Z/Yjeu8u0pEzp64UePDgXZq5NQMc/tZ4KhKlnJjxzXTTq5ifxUWs78vdnqLB36AwnOD
         vD3ey9U98wzJnbF6CRSbBZJumWQMZuuB5YZu28LaKXOC6EiliSbuAMI4qDZGJLnEJ85P
         X1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436771; x=1789041571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1Qym9kgY4rq9h5EI/XXBuMVMLgjEotX8kn67PH7ku0=;
        b=DmyysavdkoX8MMyllE6ogg0p7waVAyOOQAcAxUVgtgLdF3CgcO3XzkdJgpnGO8bCr1
         nK0oZCtMUzKkORfxFWIPbt04f0e7Oe0dQag+jaQMW0DMswgsFwE0ScADw/1/w8W5E1K2
         ZCv9ZlqxyjQtaRyE4CQs+nEPyyqBQ458Flbsoizv5j7lip1qu6ueHogMjQTty/loWVFp
         6avx68pUikYE38qvwgbzl1RAsvVTP8H3NOehB4QMZqYNT1weDOBQn2s85u3eLDNoA1pU
         TnPLFuSdZVZizhhufL3OFgUeRDtLP0/xmNmm+GpkAz2IZp9eFQDyMVlmDLI5nTfNPID/
         DAoA==
X-Gm-Message-State: AFuF++nXfBnEJemRU6Vpz+p9epZbMep5QMRtlxhOd4fVHH14dg4nIQAH
	Q0tPhmtFvE04Yc+5CuKJYX3EI4UPl06/jM2OzNeWKBQtBZnNCTrWpruv1VSBQiFR9MgX0Ql6vsw
	s+F9BfSxgMB0GSQE3me32iP2NE/27FXLTOkvEbWrUNdoHhOYTKtHIyuULaFppwthpPhXO
X-Gm-Gg: AYBFou12QO7pjVbyjiBc1r56k39lMLjLoRWGCpLl+FJQszKM5oAYHwtLbFoD0nwkvZu
	sDCggpS0pMCjWTApiD3RtIFkxDV6fec7LpRQZVFXc2etK+cJOQLWwD3eMt6zlGr3DXLv1NHE1yw
	gIaj8Gt8+IUMGHLHroeE9y0WX5U9PVSmYw3DUTuvno76CbJML/cOL4q5R5BGQaSE0sdkfSULvu3
	G0dAQvNT19seGx4CsBXzKMfPo1GzkFMdS+XzsKkrAo3KHUjY3zmAg7bg9PP+o8yOBMV+/ZasInQ
	ysLVeidBAK9+x7ZInJA/M9pRjXNH1cPFz3sX2gGN9AZR3brKmxcQARmANMlADZd9Y9raRIIjLJ8
	Vc4NY5CiOCDJE6MlG3msSCQ==
X-Received: by 2002:a05:620a:6492:b0:937:6f83:e80f with SMTP id af79cd13be357-93960cd1505mr798649585a.1.1788436770748;
        Thu, 03 Sep 2026 04:59:30 -0700 (PDT)
X-Received: by 2002:a05:620a:6492:b0:937:6f83:e80f with SMTP id af79cd13be357-93960cd1505mr798646085a.1.1788436770236;
        Thu, 03 Sep 2026 04:59:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f42307e6sm88905266b.55.2026.09.03.04.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:59:29 -0700 (PDT)
Message-ID: <e5509cfb-0b97-414a-98b2-c030758f9899@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:59:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] clk: qcom: ipq-cmn-pll: Add clock gate support
 for fixed clocks
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-9-21c3db378611@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-9-21c3db378611@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D6cNjQfc-qsh7TsyeP7QDheraTJ_DNWd
X-Proofpoint-ORIG-GUID: D6cNjQfc-qsh7TsyeP7QDheraTJ_DNWd
X-Authority-Analysis: v=2.4 cv=OuJ/DS/t c=1 sm=1 tr=0 ts=6a996123 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=lXqaDxtV36Dhfzo6gJMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX2DFRF9kGawhT
 gTF5DZo5IlQv6cRZqlJL5QfT9YhLwQKq/w4MyW/4mbVmLIvSMW4tjWuNu9yUMqRRc5pdXx81rZ+
 bDCCWjKo7NYmBtgFKgdTQjfg3F65KGolKt/DJcJBSssaiBh4JsylxFENfLr/vo4E5lihs6yEh6a
 ZkvR60oG0PSHUGnD2FRSB0dwK9PHkcS2UypePIuJc73fWIDuMTlpbM7bnXhghNqe2KEjlOrCxkU
 dP6l/5TE3bqu4d8gpUY2rawXKF2NNFN3BrsQnmP5IibHag4+KurgeZExL54agMCnHmLm9ozDdXg
 cxemellJc3jZQMjrcJyK6VXl2bGcc3oXlP+9mJjW84JTHgDs25tr/pCtf2MdKwwaE+giIpGbz9l
 Pa/radiuCqTWuKuY+h8H1VLbFZgm07ai/kjs5TqL75iUFcgmHq9cQq1rXE51Mi0xOsi3h8aCYBE
 eL3NrEtEBifc5RGQ8mA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX5xScQoMKJHMF
 ZiOAj45J4EkCNtTkKyxGAnsGUP982olgCOHInK38lPW5doKAA57m95K5dUIQb6oH9I8BZw8Z0eG
 1BvLu3Up4TXF6hEvSWj3IvnpeJwHVN8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030104

On 8/14/26 2:48 PM, Luo Jie wrote:
> Some CMN PLL output clocks require a hardware gate in addition to a
> fixed rate. The gate control bits reside in the register
> CMN_PLL_OUTPUT_RELATED_1 (0x79c). Each such clock is registered via a
> new struct clk_fixed_gate and clk_fixed_gate_ops, combining a fixed
> rate with enable/disable/is_enabled gate control through the shared
> regmap for CMN_PLL_OUTPUT_RELATED_1.

[...]

> +static int clk_fixed_gate_enable(struct clk_hw *hw)
> +{
> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
> +
> +	return regmap_set_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
> +			       BIT(gate_clk->enable_bit));
> +}
> +
> +static void clk_fixed_gate_disable(struct clk_hw *hw)
> +{
> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
> +
> +	regmap_clear_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
> +			  BIT(gate_clk->enable_bit));
> +}
> +
> +static int clk_fixed_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
> +
> +	return regmap_test_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
> +				BIT(gate_clk->enable_bit));
> +}

This is also all just clk_regmap / clk_branch

Konrad
