Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5083E2747
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 10:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951375; cv=none; b=mihuubJYRfjuBehy7/MvviVNo5wa7VeacaFCIAr4Cp8GePJ1vLbmtrgnd8hOed4bAaC2JARoTkgFdSLKbOYqddhqyoQ5NF7+gEjsK/WdottNyIWVtxpF4HINPFx5XE/EDsw0mb3x1v+L958+LJ+TtOF/6KEailyFGVx3niF19yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951375; c=relaxed/simple;
	bh=DxxddZWg+QBWyHQkUpleRuQRXk/I9FUByrHy5QgB98g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KRE5RbL6dcnK4KiJJiuDyWeYGhDOe7dS28bJb/CC8JSvar3hlFPf60jg0ahJZRl586UPcXZc/d+0Lr1wJXDMh+kdzEHolvoSkZeFEgTwZzVHV/aXtxCsdDjgTkNdkM9rAW2FTm+ndPjxddPKOuf9B9JzSNJmvftEF4VJwuQKD6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hclNH5M4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F1gwJRde; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hclNH5M4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F1gwJRde"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689Aq7cg1101373
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 10:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	auQFLUmyjDXuDTVQTivuKNJ2Vj1/bxUapYoge8mUhQA=; b=hclNH5M4ux6dUmNI
	R2Ru0QWruT4/BEHvLI6nILGeRAot9YguXGZ4dlB3v9J32SUYxFQOQUTUYcHAzVBa
	jHyDIIWTlDEKqNCSYcV1AI649MQ5JjqBgZ6mUq3vOs6+hD8vGEn+WEfy2eqaDpQr
	Fva0CtM0OPGp6TwANOJQ66Ra9iQ+8jr0wcTeqvqhfNGDFR+1w11x/90PP9mJjAAQ
	N219zCcuq9DsUltUlC+ld90esYdar9b06dUoGGx93QWiv58sTnsUjtX3RwvRBcaV
	p/oum13fZr1Iw8zq/Qb0CoMFIbvehnWHnxcw+biINwPmNqq8j/tW3/efr3WLlDIJ
	14eh+Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559r879-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 10:56:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9106c9b53b9so1141516d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 03:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788951370; x=1789556170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auQFLUmyjDXuDTVQTivuKNJ2Vj1/bxUapYoge8mUhQA=;
        b=F1gwJRdeXELiEziaKtSkEvhlUA8eiDzlJQ13xllQdM6aMTzkggvZOWp/+VBs2hR6vc
         qoEhran81t/dxM4QC0j4fE0cQ9zMtmswCO4IHR4Wa8avbP4idtU+oL5H7mOIP35zUHKH
         jRsaU2hBbgx1B+T2TmnFZ9k7MVioDyKn1d6BJ+LmTfLPD5W+myTtf3mqyMsYQYbb4iUX
         Pr730k+kfCeR4o97+xu4fzGWNGThE7eXfXmH60ktyLwrTnmUJgtwgEUmhJM+rZZujYs8
         QmxG6Fub+0lI+5FaZRPRhbq9gaxq6H4nyzFcnUOpIivu+bUZILMH/e99NA5rjcdKTVQu
         xRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951370; x=1789556170;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auQFLUmyjDXuDTVQTivuKNJ2Vj1/bxUapYoge8mUhQA=;
        b=g5c66o5WGGMj3Pj25IGCo/tnOs4HLkm5H6pH3ZUHbvup8XkevCfirlKE5IuMEQ+PE3
         EQmpAL1gJFmWCJdb5PF2uAIg7kLJIBivoF89lPouLgKm2nWndK4gWUO2WE05ER6wLv5A
         Mi18qPpGMsnXLzWRTKPx14p6fEPxnuRBacCU8v1qm+aCUKfAo6zb/Cc7z2fGqMGMUUUu
         kegLJ1lAtWbo8qaH8SAsbcxIN7xJB8OYfeIVwEtRjN2LhhZd2rz+a+7a5+eWFP0oi6Ca
         cpn+a3PF+PGWxSBXusXr14ophzG3hf/F9b8sTIe/7qrh+2oiIH4DOtue1W/QbpnGf4DZ
         hRtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBePYv0Obd4OAN5gwzEy7uAXdHpOu3h+Tlksku/r4gNPI1h8KNkm+4HMHEUweta6VqpKDoS4aKAdq6gPK+@vger.kernel.org
X-Gm-Message-State: AFuF++lnRwAkCSrAdErNmol6m9sxOIA3t65syq1MyR9z22taL+nlyZNG
	5kVpLqcW32EG2XogbvKKpktJ6nAPAOCD048q+sj4J9/Aawx5dTLVY+0h+x6xrMCYjCbsFnd5+Gu
	ioro8MlV3M3vytiah/3NTI4Mqqn+DQmoHnq+NkefbfDlx8tq4nXW53M0R8qNtwU5duZlH
X-Gm-Gg: AYBFou3GTKzbH1BcR71ccZ7F9PJxgXQhVj1oF2bUI9KaFYLVhbzoBrRAg7dkaB6kk8j
	roiQ12v8QDm6924JfZKRYUPHH5yZldvtGHbobr1j5gmJ8zcxNqGKvY3rQlgF1kfBYjYpxvgMr9m
	D2PuAAlL1dlSwwGw0z874Au7Z2blXpNSmZ/LA5f2IPlw+ZRQmb7LhLIed1ENOQJPUCeDDF44c4S
	xy4QBVErKNyD2Rd+C/MS3x7A1A3u1Q4AYQEvTeyqgWS45i42w0cjx0/vN8S6uvfX+RCKe2Tf+g8
	5GSDfJTe1KLm7trCGTZ0/soZfW7C3JF0SrwSCYAfRpswu6qTj3QyS7OkPJlgPcWuhiqS3FGlXm/
	5qRiQzNE6fWz/Hxj4e/T+4A==
X-Received: by 2002:a05:6214:5015:b0:90c:76c3:2aea with SMTP id 6a1803df08f44-910479f881dmr288319846d6.5.1788951370036;
        Wed, 09 Sep 2026 03:56:10 -0700 (PDT)
X-Received: by 2002:a05:6214:5015:b0:90c:76c3:2aea with SMTP id 6a1803df08f44-910479f881dmr288318726d6.5.1788951368368;
        Wed, 09 Sep 2026 03:56:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036469sm756477166b.1.2026.09.09.03.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 03:56:07 -0700 (PDT)
Message-ID: <ca45caec-01a8-438d-a91b-98a2ef411576@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 12:56:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] PCI: qcom: Implement shutdown() callback
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260905-shutdown-v5-0-f0c6bafa1d4f@oss.qualcomm.com>
 <20260905-shutdown-v5-3-f0c6bafa1d4f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-shutdown-v5-3-f0c6bafa1d4f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa13b4a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=Z7REpkxyZKBgooIMAs0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: fVRSEGB-WtaKyiDJHJGuWHsnY8sg1f05
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyMSBTYWx0ZWRfXzLUkohStQMrN
 8ueAKZ9IOF287NqB6IK45mGoLmBikNIdVpEUxUaFwgKyeoO/rBMZh/OF7j4sRNUy5p2F3gZRqfu
 wwDncQTHblBkVuzjF403dJq8MGYORGw=
X-Proofpoint-GUID: fVRSEGB-WtaKyiDJHJGuWHsnY8sg1f05
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyMSBTYWx0ZWRfX/I0P6Yf4P7jn
 2xM67gINmD1TLO9zX5ZWBc+DW3olWrgamQE4803oeyTGv9k02N+nK7BXNqxxJds79PcGrZSKaAx
 VSqtAtMpSfiU3VLpQG72uYT6s6Bc8xpHhMyfOXBijU1b0QRAMuhGHDcjpwIYSpdgrdsla/ThflD
 bTqY9o8k0gw2CWO39QeL1LxRyuZNLdN8Ws6O+AcZuc0W5RMxEdA/kWJO8R5bfHuCk8AMRpPPZOa
 qAjHPg6RPrvv4upcMaFLrsSgJWCTiYVR/BUqGiyEBg2c0ctglQZAeSLnpKGcaRkuvk33q5HGjFp
 VIcYcHfTFYg9A6Hp7GdDJME6s6T/tWq+swI8t4yPstVJW26el4Zgp+xu5wxac7BwvouohLJd1Ih
 VCOUYNMfvAZcVlKKxDN61P3829AabStiSihE4UXPxyXENpgfXaHPCUQdP8Nz40knG92d31Qumo9
 XUIIolFNaribaxQCpwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090121

On 9/5/26 2:48 AM, Krishna Chaitanya Chundru wrote:
> From: Manivannan Sadhasivam <mani@kernel.org>
> 
> PCIe host controllers should bring the link down cleanly before system
> shutdown/reboot proceeds to remove power/clocks from the controller.
> Without this, the link may still be up and endpoints still have
> transactions in flight when power/clocks are cut, which can trip SMMU
> translation faults or NoC protocol errors.

[...]

> +static void qcom_pcie_shutdown(struct platform_device *pdev)
> +{
> +	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(&pdev->dev);
> +	struct qcom_pcie *pcie;
> +
> +	if (pcie_cfg && pcie_cfg->firmware_managed) {
> +		/*
> +		 * Firmware owns the link teardown and clock/PHY shutdown in
> +		 * this mode; Linux only owns the chained MSI IRQ(s), which
> +		 * still need to be masked off before shutdown proceeds.
> +		 */
> +		struct dw_pcie *pci = platform_get_drvdata(pdev);
> +
> +		if (pci->pp.use_imsi_rx)
> +			dw_pcie_free_msi(&pci->pp);
> +		return;
> +	}
> +
> +	pcie = platform_get_drvdata(pdev);
> +	if (pcie) {
> +		if (pcie->pci->pp.use_imsi_rx)
> +			dw_pcie_free_msi(&pcie->pci->pp);
> +
> +		if (pcie->global_irq)
> +			disable_irq(pcie->global_irq);
> +
> +		pcie->pci->pp.force_d3cold = true;
> +		dw_pcie_suspend_noirq(pcie->pci);
> +	}
> +

if (!pcie)
	return/warn (should it be possible?)

if (pci->pp.use_imsi_rx)
	dw_pcie_free_msi(&pci->pp);

/* abc xyz */
if (firwmare_managed)
	return;

will save you indentation and de-duplicate the free_msi() call

Konrad
