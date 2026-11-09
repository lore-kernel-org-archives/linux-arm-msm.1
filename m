Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234586;
	b=izher/Eq8kJg9OZMZDt/6OC5C3C/ZuxTUJ3zqTNtA0rLlsax94Mk6WddeYINnpm9JjEP
	 BSPb552RjtPCig40lvb4cN4iHHgfQv7C70v3Qb5qMzZgxtV3bFOsBXx0qb63SVhQr3TlZ
	 0E/FK+deN+A3gasT1HqZ542X/3DOOjhTeCd0Nhp4mlabCzhyfVDC4O1L4oyZt+6PWsrNZ
	 FwwRG1JzjoPj6tJ/ysjciXxlLzTfaI3ME07/wPXOVxoPvJnoDPQOVX++J3ibX+JjuPBEA
	 LpHdalNoxBAhjyEO8dGc1TRBzgj3o1uAfKTnPUfR95V0UvQ3pytvxXnpD6GYlNvE5+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234586;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S7KDZcKU/Io5XgxBPImwgDSYRzpyHFK91x9pGyphsAM=;
	b=BJwyQ+Ma79bp47vAbNic1gahBFGX1jyr1gW7M0JPLDvysDpLqjDbUooLPKWKLxkFdE8x
	 yooersGgzLH25pW4LdizRfifNEj5UHaJchG6O2MtQNgVvnwa8GhAGVPtjyS8JH/5Rw21W
	 pjAQ4fLCJEcmEBFPTiIP+tg39LM6/cy9gNtSBgjeTiwsTWHWv7Y4S4zF/xnEae0LN6EUg
	 Bw8jEnH1rIxt4QZKYW+9ydOdYnAcdGJ8/0Z3SSJoveiph/Fc+5xtl8r4XfTv3Kuqa3o9b
	 9zwX0Nv+tuR8jq+B44VYblQfgBYKmbJERo+Oglx4me+S9GAPgTHKQuyg9rKyEsUZqag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hsUSmamq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dt0m4BWO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F6D606A323
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5F6D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hsUSmamq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dt0m4BWO
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFLND971519
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S7KDZcKU/Io5XgxBPImwgDSYRzpyHFK91x9pGyphsAM=; b=hsUSmamqp+4mG1SE
	KUW3SAIjEc099jEXwvCQNZqDxsS3vQvHCjIM+5B3BoN7z7sqS7O7QrgeV88ZoJTh
	mjt+RbmGUPGbyQGVrx+LoWEJuhY+eDxW8H7C3p4T+C55dPaQH0Z6d7ZimAalRx3q
	BOF0MZB6HkO8jSfTK0Ra40Z6nvrkckSC9pa3mIFiYUS79qzRsS+2gqDcdYk80C07
	/qLRjX7YjRhwcuTFP7yTF33rjKenqqsila2AURcFh0f2/poJv+Efmqvznmu9YSdj
	v3MwHvujMgKbY0uKlOEDvlQCWK5VOPUg9Jje2gA6hpT4usmLQWJruPJXdSVohW1r
	7fQ3og==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm3j4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:29:44 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2f843bacdso23630137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234584; x=1794839384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7KDZcKU/Io5XgxBPImwgDSYRzpyHFK91x9pGyphsAM=;
        b=Dt0m4BWOe/YA8aELwuFjAOZYBdspZ/NqbhMD0bGx5OqwsgF1LlOETgnxpMwWWrtBgz
         EaJ6b1z1eWAhB5b6IMW5rRQr7/APE+fWQ0VD9wv+0+6/EQ09hb+fzFNuYtP4FpnrycLY
         Ca4XO9lP5tCGbp9QAd99+1AVeyHf4BpzoDXK7aWOay7BEtPmkR0860tmW2y4w8AQBblS
         pp8kM4VRlo8doJV8O99GBxm8k1cnIB9QXQq6l1/XaPudPY1qSQXKQvL11S+o/A78XvSu
         yBfOweXbKKECepekZMOrZ2WK/8IXnbzP4Arz5WTodrX6NpBIgtcmC+tkqW3+/nvdKCrs
         lWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234584; x=1794839384;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7KDZcKU/Io5XgxBPImwgDSYRzpyHFK91x9pGyphsAM=;
        b=VDBqlPalslF55nickmPOEvzXTrrCt1FSMC0bmN4QuGLB11NyOrGoK+SHdRZ2W5/thD
         9n4O6Gq2BP2dNooRjk7TWyko6imMGGY9CfmX56WA7d22Scp/5DOOtgUAh36J5ypglZOG
         ljb771/d1y8s00+eTTBbeEZXdia/WqELdxVSxNGa6vJ95nZaoKyxuY0lMGH5q9hWkYDo
         5CWQ7EolG7p9Lrs7M9d8jiiuEyCbId0JKVOXNDSSkt8iGfGwFkXD+PQO4565eOQb2iZT
         hCDmRLpRqMW7oD7J256pWUqJu9TSgGtajibWnOF9MnIGtsLH8VfLO0IH8KnQvU4MjapQ
         epFg==
X-Forwarded-Encrypted: i=1; AL+hErFffxvhEi1uDLK2eeR9FZNPBbw6IhEU7B2mHcq3Zuixzu1XOBSJ2g8gU8ZcARnQLQMPKcf3YN7gNbQ3SnRW@vger.kernel.org
X-Gm-Message-State: APuU4Z+56OM1UhAuYqdGyeZkViq4oLUU2EWly8couvcimtIZkSNZSuQZ
	ZQdDsvrVezS+EFaG6VsfTtGMo98GGGdtBPAhrYhfqUOjJ7z6ZVe1gMW6xt4O3dyUSJPPW+db5v1
	AB7jzUsUYM41kFWAhA8zhBYImfqf9RwM2BfT+szvCwMSFA0DD81heXK3xaZRw5bQpxlvT
X-Gm-Gg: AYBFou38pbgG+RZvi8D3Hg4S2iNb7qf79RECl0Hacm+K/2gb3T7iEucCEEb3ApYMLpr
	Pos64iEUDjbHkS2mtimXbvU8iMPwZR5wrp5BcP7J1eoCjdZRNDaPpEQaCyNoZ5z/JWQDdlI9g2E
	bxQbQImYpA/PLmbECP9ggKRdzpIel3b8694XUYIxr/ZLzZlZlv1GO0r1IZOost5linqxtdvnBwH
	d38WACTC/w69CRJsl4V9usXGHUNd0Y34Ne2rlsCQMbTYpnSPatQtt3GxLkwiF7Ez5YiDtPdo4wX
	nonJOa4pwPyepCCjFtMgWXhs4TXPv8rr2ipBauSUc8g+YdkyshYi7z6dk4sP1fEQkEFXhyCm4FY
	IdzNCD31x6Mm9bMd7q+azM0BXxRxh2jGtVOkhUZR0Ygdmq3HXQZP/q8ZSiie4aCElLkLnHQ==
X-Received: by 2002:a05:6122:360d:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ece737a062mr963297e0c.4.1794234583892;
        Mon, 09 Nov 2026 06:29:43 -0800 (PST)
X-Received: by 2002:a05:6122:360d:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ece737a062mr963286e0c.4.1794234583423;
        Mon, 09 Nov 2026 06:29:43 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a47515dsm173047166b.44.2026.11.09.06.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:29:42 -0800 (PST)
Message-ID: <fd8b69b2-5487-4e99-a45e-d6c2ce9ae1f1@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:29:40 +0100
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
Subject: Re: [PATCH v8 4/4] PCI: qcom: Implement shutdown() callback
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261107-shutdown-v8-0-bf607c6429b0@oss.qualcomm.com>
 <20261107-shutdown-v8-4-bf607c6429b0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107-shutdown-v8-4-bf607c6429b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXwJ2TxAelpMQd
 XjB621nJmkCwArnvZEekVEzF2EaQCZoehGxLTCMTbcv27nQV2S5Yc7xkPjl1pMfFUNHHxULFI7N
 yptHn7suqmEwedoSNmvVmSGmkR1uodo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX/dGhI7ZAh2I7
 +A+UD+NTbxWzYN1LBvbSzUGtIFO4HEwLBmFsWgaq0DfTS9r1cdAPKzmD3AA6G7kZuY20pFrKQQ0
 p0V/0x3Oy2OxMoNuIBlTMfd9ZG1PJ/9AndDKPdsNfhdBjh/4ZCzsBlt+GXD0GaX6jmeqpZcIbjo
 wWeTKOKTfh2fyeGEryGcju+vYnGD9oWW96jeMSMgm8UD8xIKkV5B9as1FOzBEM79kIcB1kWSn2T
 dReE0DDO99YFQyeiV2g4O7b5rmNfYnRhrIfy+6kNTJ9j8MXNLzJzXX5VFrolqaLoHrLyfIe9dz3
 YbHfvnQG1AcWmtz4eN2LOtmQYjiamWYwTYIQTMIo1pxFccdgSh9tuasFCfEEcjv5/8Am2OpYuba
 9VWgGMf1tuVRu7Vt6sSyyBL6OOD6eoFgz0FLsICAMCMaxgrV512vfp7ADIj2uXp4r4xvtbZ6q9f
 eXXxlngoL0/7lwde/gg==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1d8d8 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mifKogskm1HCQoUnOUEA:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: GbYtnwixRj6sbCivaLeC8oKRfOTbEKMC
X-Proofpoint-ORIG-GUID: GbYtnwixRj6sbCivaLeC8oKRfOTbEKMC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

On 11/7/26 2:45 AM, Krishna Chaitanya Chundru wrote:
> From: Manivannan Sadhasivam <mani@kernel.org>
> 
> PCIe host controllers should bring the link down cleanly before system
> shutdown/reboot proceeds to remove power/clocks from the controller.
> Without this, the link may still be up and endpoints still have
> transactions in flight when power/clocks are cut, which can trip SMMU
> translation faults or NoC protocol errors.
> 
> Reuse dw_pcie_suspend_noirq() in the shutdown path to force the link
> into L2, putting it into D3cold.
> 
> device_shutdown() runs with interrupts enabled, unlike suspend_noirq().
> Mask the chained MSI IRQ(s) and the Global IRQ before tearing down the
> link and clocks/PHY, since a late/spurious interrupt could otherwise
> reach a handler that touches now-unclocked PARF/DBI registers. Use
> dw_pcie_mask_msi() rather than dw_pcie_free_msi() so the MSI IRQ domain
> and the MSI mappings held by downstream devices (which device_shutdown()
> does not remove) are left intact.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 41 ++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index d39753f0e724..c5b06db3b92a 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -2046,6 +2046,9 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
>  
>  	dw_pcie_msi_init(pp);
>  
> +	/* Stash pci so qcom_pcie_shutdown() can mask the MSI IRQ(s) later */
> +	platform_set_drvdata(to_platform_device(dev), pci);
> +
>  	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
>  }
>  
> @@ -2466,6 +2469,43 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static void qcom_pcie_shutdown(struct platform_device *pdev)
> +{
> +	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(&pdev->dev);
> +	struct qcom_pcie *pcie = NULL;
> +	struct dw_pcie *pci;
> +
> +	if (pcie_cfg && pcie_cfg->firmware_managed) {
> +		/*
> +		 * Firmware owns the link teardown and clock/PHY shutdown in
> +		 * this mode; Linux only owns the chained MSI IRQ(s), which
> +		 * still need to be masked off before shutdown proceeds.
> +		 */
> +		pci = platform_get_drvdata(pdev);

Revisiting my older comment, we can still stash `pci` in drvdata regardless
of the flavor and do `struct qcom_pcie *pcie = to_qcom_pcie(pci);` in
places where we need it

Konrad

> +	} else {
> +		pcie = platform_get_drvdata(pdev);
> +		pci = pcie->pci;
> +
> +		if (pcie->global_irq)
> +			disable_irq(pcie->global_irq);
> +	}
> +
> +	if (pci->pp.use_imsi_rx)
> +		dw_pcie_mask_msi(&pci->pp);
> +
> +	/*
> +	 * In firmware-managed mode 'pcie' stays NULL and firmware owns the
> +	 * link/clock teardown. Otherwise, skip if the controller is already
> +	 * suspended (e.g. a prior resume failed), since dw_pcie_suspend_noirq()
> +	 * would touch DBI registers with clocks/interconnects already off.
> +	 */
> +	if (pcie && !pcie->pci->suspended)
> +		dw_pcie_suspend_noirq(pcie->pci, true);
> +
> +	pm_runtime_put_sync(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
>  static int qcom_pcie_suspend_noirq(struct device *dev)
>  {
>  	struct qcom_pcie *pcie;
> @@ -2657,5 +2697,6 @@ static struct platform_driver qcom_pcie_driver = {
>  		.pm = &qcom_pcie_pm_ops,
>  		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  	},
> +	.shutdown = qcom_pcie_shutdown,
>  };
>  builtin_platform_driver(qcom_pcie_driver);
> 
