Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5CD486E56
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330953; cv=none; b=DiGsVsq5xLM0MvNDCTNdbcqrVWMWH+ocQeIP+NEz1JQaATwlaV2AWEmrHCIsDczdPdCdxO/o9HergSgl4HarwWVTI6BPwSN+vTnaqOR19NuZ+ynRnNCUIDVnURk/kTDUkmTV7/Lfkfe8PuW4AHWSMmzk3yZD6ChVB6JIr3KGeos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330953; c=relaxed/simple;
	bh=nyAse5/UJpPEzPnHBsekh7k3RbahKU4gt6HZXzUrR1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkxfKGmygA1CwdG7EjBADr3gT9v0SCktBp8rOC13fH5i0tkzceSfGY0tF/GUfUlBVu72KtaG/dBxeJRVUvWS63tByEwB25I81B2L1lXMRYoC7l0aK+n2dpkJ8TGYOZJFYJQCcngAFsnlKDZiXtV5x/erYLAy2FmfBXWIl2j6V5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHLcFSv3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7e6OBR3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHLcFSv3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7e6OBR3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD80rW1691473
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	piyeing5sm3Jpk687UCAPCcfeTDfpVNKUnrDk/15p1k=; b=ZHLcFSv3juzbArsA
	6t7SE8BFI6TpbyTrvw/ByZsHM6w4xJtgx2FZBQoV5lAB7xyASms1FOoKEUSLIB71
	gyl5Bqtjr/TnyZIjvT23S4KyzzjM1L+gza051JAcAHINzOcUPciugapyuaMjmcBR
	pYa3DIRa7VC8JajmET3HnNpmKCjiYEzbKrHcZRx6MOWFXoOfDeFACi/CK1cPMJFD
	3aSYHSqGV2i8ixBMM70xiOHF17IM11HUXa77q/GXvHIIqZcJKa7T5bEUKqJPEHXU
	jvTDuGtAHSStpUtM+kglvcHqyfnVDRv5loc0INK/+Dl3/q1uL6EaoSPAT7E3k70h
	5Wsu+Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgy90apr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:15:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cacf17c7e0so14747135ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 06:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785330950; x=1785935750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piyeing5sm3Jpk687UCAPCcfeTDfpVNKUnrDk/15p1k=;
        b=O7e6OBR3gXGqd2I7OTFNTm7NgOp1Oz6LHhFevrCdXUQy+rFxewLu6IzzitWzg9Iu8a
         30jK1meIMioLO4AZqIS4NVLLgvJHxYiizRbPz4p5wmOTaZ7D5Qi6HEdMnFb9vrh7Zf6Y
         VYg/SsD4SWveBgM8sY1mTY+Ma1c7BuTG54GmEeOK97HAV8aQHZkTPavPIYzBlurk+Z74
         nLYLjvpoSP4H4A7d1lPrqtNAWe4EUPr+fTdLfvw7rDvRbLyBwbnTPu8BKCOsbRTmyWtm
         yC56WgDOCsWmStoFHAJYYZT443Vr2l4Nqu79MxVc2iWTNU9h8fLWm98Ngst+qKb2iW9+
         3xSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330950; x=1785935750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piyeing5sm3Jpk687UCAPCcfeTDfpVNKUnrDk/15p1k=;
        b=S26etVZq+j1NtGRSGaAMghSbDSGO2xGJTvgr57t/mvmMFSW+IDQPK3g0URdxndc5Fa
         mvqzQJGmbNVvdLvou4O8ue6qcBKdrVCrUvo4a/Y68pz1ckDJijDtUpu24GPufxCQCFXm
         7BRgoLQWhUG7fD43vJNqzFcNWjiktEWeB4G4sxBH1fZgLdqN2fNRy8NrQWAnobNQEnJe
         3/bMftzcY6cW7SpP82RGStYVXEkSSqyyKGiiIUsMmHYF1uS4JOe/pv4wO8Iuj3HAWxr5
         w/UFiqOsIyWLssGWfFHTzNn1vphDeSwMFKCWvWYjM2343x9dDCmxFgDwn/cGrgb1v1Yh
         e9/w==
X-Gm-Message-State: AOJu0Yw4xyDK4IXyi7FRFK4wio41iCc24SW02geuz/Gnu3/TXi435voQ
	psfYnD/+66jX8uujfwToEcUKGIibaT0jJsIgXlaSx2MLfphop8mjgLaVryFiq02aJaxjNbbbLSF
	RIkmGz0htAr+Pu9oQ2U5lJVKatTKPSCCt4wZvk/fF4scbcos1coS71Q52OA6ynlReoJcZ
X-Gm-Gg: AR+sD12TysfAcfrwTf19ILsfOTiiO8+Wwiqz9b9cRnh5Y6w/HmsNFLLt1E/+xbWpDI0
	oPNRtMOGGIX0D3LoTMT3eFE8NK6e/D75NZK7951cUEDngfgTKftWO3YjcxThDzhLW5t07ZePvNd
	mJ1o7I9oZf0l6NbwamGuPkRiNC+uoE0bziJSOaGWAJgjmxd7oK4ejwqcXEzxHLYwyr85od/MJHQ
	tgE/Fp/kx8Fx7SVW++aUOjXdm01hAKQff9HGZtSpzQxQee13CSJlSULsrJRVyXa4xh0/3czsyJ8
	pN8CUe5escCbMSufGMSh9PizEnl6SCZd0hUeFZK7FifAq4/bI0Gn+RiolNbRqrCfVqvm7WDLRjQ
	dB3UoOndJfN//dmFaNsz+jBGzTlht4qedvIeWEb9CbM3FghBUAeBXPervxpsoELns
X-Received: by 2002:a17:902:c40d:b0:2ca:281:27fd with SMTP id d9443c01a7336-2d015c878efmr81077015ad.25.1785330950008;
        Wed, 29 Jul 2026 06:15:50 -0700 (PDT)
X-Received: by 2002:a17:902:c40d:b0:2ca:281:27fd with SMTP id d9443c01a7336-2d015c878efmr81076515ad.25.1785330949475;
        Wed, 29 Jul 2026 06:15:49 -0700 (PDT)
Received: from [10.133.33.36] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0228417adsm11343225ad.0.2026.07.29.06.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:15:48 -0700 (PDT)
Message-ID: <a9439f32-ee36-4c66-b96e-082b40e9b9c7@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 21:15:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-4-a8b8679d215f@oss.qualcomm.com>
 <a907cba4-c276-4355-986c-44f6e39c310a@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <a907cba4-c276-4355-986c-44f6e39c310a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwOSBTYWx0ZWRfX0tFuRcToMqyr
 EQYXUcm13Mcz9ylnRaXopB+iEZZTnx4NB2KKkN/wyjTHTkV06l7O0fU3HujtYfXUZtQFo8bHHWz
 3WF6avCrgDK6wsCJPASZGd6U913HijU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwOSBTYWx0ZWRfX+nOXTFl+Jqh6
 z6IWqm3uGVL07ZRo6I2p8sqIi6L9nc1muPJqaS2qNM+r5NZFmN0U2uSyIG6yag4HTraF6gvtMYk
 hgnbG7Xf6a4m51GZuu+2tmlF5bhXfl+gxhSnLjQ91kzD/ir/mRDl4rMR+xfDLEhwct7mO+YbuXY
 gphslB7IQHoZp0floVq785mpMRqyUDS43yMte6dSRnM5PGkCWYNpMAeiBd0f/0UZ60MotLtWYt7
 RbqUH/GjnlBr/OEDagAEYlXNRJAgr0Y8KDluh727+CYKgD7C/A/6SuzvD+vGwIC2I9lNVCnXLKE
 5sEdPFq4Zn+rIad7PnWpmLdHu4vnUdcB/k6v39t9XgNMRJMLrMPOhwXGA/bkQvIXBaOrBjarGvM
 kHGtPRv54IyQQqKH1ZDj/4/rBIwjqKgbfx6zWkRwi9EJS1Jx5YUG/mritrfzP0CuTbJeL+fEL2U
 SjDGYrmHTiU9tOmm6xQ==
X-Authority-Analysis: v=2.4 cv=LtKiDHdc c=1 sm=1 tr=0 ts=6a69fd06 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mo-5zohwMfGRhBBTFyAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: j5p5SUZHC05O6ZCEz4S45UhCVSLp-LCp
X-Proofpoint-ORIG-GUID: j5p5SUZHC05O6ZCEz4S45UhCVSLp-LCp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290109



On 7/28/2026 5:29 PM, Konrad Dybcio wrote:
> On 7/24/26 5:00 PM, Luo Jie wrote:
>> The NSS (network subsystem) clock is derived from the CMN PLL output
>> divided by 2 and then further divided by a configurable 6-bit divider
>> with a valid range of 8-63.
>>
>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
>> ---
> 
> This looks very similar to clk-regmap-divider.c (or at least to
> the generic clk-divider.c implementation).
> 

You're right — this can be converted to use clk_regmap_div_ops directly.

The NSS and PPE clocks both compute rate = parent_rate / (2 * div),
where div is read/written straight from a register field with no other
transform. The only thing blocking reuse of clk_regmap_div_ops is that
implicit 2 *, which none of the existing CLK_DIVIDER_* flags express.

I'll add a new flag CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET, to clk-
divider.c/clk-provider.h to express that relationship, pass a flags
field through struct clk_regmap_div (clk-regmap-divider.c/.h) so qcom
clock drivers can opt into it, and register both NSS and PPE as plain
clk_regmap_div instances with .ops = &clk_regmap_div_ops instead of
hand-rolling recalc_rate/set_rate.

> [...]
> 
>>  	/* Register the fixed rate output clocks. */
>>  	for (i = 0; i < num_clks; i++) {
>> -		struct clk_parent_data pdata = { .hw = cmn_pll_hw };
>> +		if (fixed_clk[i].rate) {
>> +			struct clk_parent_data pdata = { .hw = cmn_pll_hw };
>> +
>> +			hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
>> +									 fixed_clk[i].name,
>> +									 &pdata, 0,
>> +									 fixed_clk[i].rate);
>> +		} else if (!strcmp(fixed_clk[i].name, "nss")) {
>> +			hw = ipq_cmn_pll_nss_register(pdev, cmn_pll->regmap,
>> +						      cmn_pll_hw);
> 
> Huge "no", this must be a compile-time constant and not rely on
> some funky detection.
> 
> Konrad

Thanks. Will replace the rate/enable_bit/strcmp(name, ...) runtime
inference with an explicit enum cmn_pll_clk_type field, set directly by
each entry's construction macro (CLK_PLL_OUTPUT/CLK_PLL_GATE/
CLK_PLL_NSS/CLK_PLL_PPE/CLK_PLL_PON/CLK_PLL_EPHY_RAW), and dispatch via
switch in ipq_cmn_pll_register_clks().

