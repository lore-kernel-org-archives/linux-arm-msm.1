Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621572;
	b=LQxSMXyQia6yG6YHJiflR8raScnqmJ4DxpS+B7q0CHSeWUB24BN/eg2c4Ed8MFoxg0zI
	 /RexbPX7OPWNMzl/Dm7uVnmxqmECDvb+8tWy3G8CqfbPOuSNd8m5UL1Ur+UsbyN7D22Yk
	 3VH2fbGW+vGL2hYZ79PogP9kPG1oPrLCUgsDbcznzgpvwaq4x374OIkVwLcZfUDiLKGfJ
	 W7NI0CRviEzRlOLmrpXaKqoguCNMf6oozP6+wZeLXG7oM+taGtt2eZfHF98ubyi9TbjEn
	 5mBZquXZY9E4GHbS6dPiOkMzOcj7D4z4L7TDbmg5Oe10+cV6YlXnLIincjeHxFdgcDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621572;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H47W/ULwr2k6/yvJ7HvMMOZaxS3u2gLpACgrzkSuK2k=;
	b=x7+LCFwVzXKVyc9F6M5w1C7AaJm2LkUtAVTMykbJWyIJpnMcgVj6XiWWXH41PjEejVCf
	 arjk+Td+HsDq22EO2+f2sqVc17MkXETm4+3vJOmwG13hjBI2Rjecg2ZxdL0OvWgkymhak
	 vOFXaeWNEqA/oHwU9RfC+Gh0CPfbEe4wxUS9P3hf+zHst2L/s+7RYU+4EJILytSULMabB
	 bVZ0JQaa5XZv5/T7m+SGK+J3fnbM0OGeGT+1Fl+/EfshXNIYXN/4rakYZ8Th6bvd8HRaf
	 sVXvW1ewiw5hu10MteU1zs9klZThU/hWv3kTNWX2cT9uWBUKoJc+1vPOiI+fzRlF8cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mWqzWnOt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YqGW0fVJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61007606A33A
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61007606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mWqzWnOt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YqGW0fVJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADMbQ0n1645143
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H47W/ULwr2k6/yvJ7HvMMOZaxS3u2gLpACgrzkSuK2k=; b=mWqzWnOtyjcZ28PX
	i8rSPIzVIxYYHi20GiKVcYzP1YAPyQsnsquh0C0SLRS9x8D1Io61rEf0Z//+7lQD
	J9P+4q7sMlpA/j0hFS0bJt9lZPr0I2thEsY22C4WrDr/NQSZ6uJGL6lFxgEq//7B
	KpcLO8ENn/rOWnfXbVpGLVX1/6urGa+e9Ied3sn5VK9GPKh4Ll3hse6LcEw/DVKk
	jM9pxF2LzHDSoOTCjBvHCETJyhuxRd4jRH9qVCrCw1hw3kjMOn3NANp6uHvUmNPa
	g+CZzb+gJsG/7zD5zr1hsfraLRRwtYrUsKBaZHC1JkQSiziGYlaelhRICkNd1nIJ
	8a84Eg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvjac2vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:59:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f479b9819so1851733eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794621570; x=1795226370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H47W/ULwr2k6/yvJ7HvMMOZaxS3u2gLpACgrzkSuK2k=;
        b=YqGW0fVJv8EqIUevGZqgCIRhLgPy0Cwns5ltjmcNvdfd9Ud6cJwlFwTkyoHSm7gX9k
         Rbq0pJUZNloYVlFmKTiQPmcIlkzuLe1SKXfacZWm9DeQr5TSpWSqynFRMHabWqmnG2sH
         6rVkubjeVrUnx9k5HsHhiHQPRaqqIXifGdMatW76OG/RF1CGyAJj3TxVGItAJnKAEwQN
         zqypw7obwQRupKXunE4BsKetyX3BwSAbuE7aAoD8m48h5Hn+OrBR5cVL4ANUyND42Y3G
         POKH9t2Nnbacbq7j4gbYmSfnYMUtfP7TN4xcvf+Ek2Lk1D80a5YcE/G8fK/RvaUTqGLe
         Vd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794621570; x=1795226370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H47W/ULwr2k6/yvJ7HvMMOZaxS3u2gLpACgrzkSuK2k=;
        b=C/VCbtX0Ob5/txKut3BFFYqum9fnjgHouY9ujxREEYdskDaPdPuzbbLmQ7xQYVAA/M
         ygMoWF+w53mYONjQLWCwtTUPynhfPzL7NiuWZkSZkV0BebyewrnuR4eD47I2+IsUTgf7
         5Kj1OhmIkGydNiwAuU4+l5qvb4G9xH5lEf0DksGNk6xtdZSz4tIZM3A21tZQJPnen/fU
         uRPY63QB8xC4gQq8p9xfWOG6tCoBPYV17UvoZJMmc4XmzeuiLXX7Al5zCho6ezZcCZOY
         KOP58XLfWZbVkf7XymUISxpV7cwRR9tnPEUUZVbYYS4+GN5kkLGZa4A3/wJkcYYTaioE
         GArw==
X-Forwarded-Encrypted: i=1; AL+hErHA0XCcpitsfhc132cYb2s0OEXKG2zmKZGOPOoUnwuz9JjeMtVNewRu9rwCGJB2DakBiFWC3NaNKjEG2tEc@vger.kernel.org
X-Gm-Message-State: APuU4Z+rrbtTp8vO/hlDNsP9o66M5c2sxuEWq2aCEBHWpRDWHGlRdTeO
	GaRpYqdpEyzjoDUnTlMkJCdtvyzaE3gmaxRGiZzF8mrJWUsMJlSI3bukIap0IXuDm1DkhKbheFy
	Ix5k8sWWoqfP9Nr3U7RNyo4Sww7AshAp0N9JCfHnxiEGRpY+LOGqzyQ98o1QQn/0H4HEI
X-Gm-Gg: AYBFou3LTsfxAIcHAPfMvPAj0Ayct/nO4gIoCMWMpfBgAV5ycf1uGs6Bhszht4taaSH
	RYHZwTIlZPO0ESvrVJZeOolT/Su/zoj9idWnzW/cucNx4LH16gtTtEld83aKJhXkpDpJ2vhYOPx
	vdZXEcjLutBAonqbeLOxdLvns0kf/lCkclZQcrMucg5M/qTckJBGfkd4eXsvuvjAyqIFaFYqQZl
	Sj7MMby85y2G8soY8zYh4zme20y0npA892T+uwHzKKZs2xCgZbekP3NiNTM8Q+Lx7CCU8aOai4M
	2jZ6PqqR8rssGRmg4iReF+ywkRxTkNdTG9kzL3TUXa0VbomyXoHgoHY4hCMnx0CQW4Bgz4dE33n
	mh+KYsLQDTQg9fRjvRkJSS4QDzCTZk28qkIErv6TTyDI1UsKHLDubkkNZS0Kqya0auV68pkfVDa
	h8Vxzmjzk/
X-Received: by 2002:a05:693c:4153:10b0:36c:9af3:22eb with SMTP id 5a478bee46e88-379681c99b3mr4512353eec.34.1794621569703;
        Fri, 13 Nov 2026 17:59:29 -0800 (PST)
X-Received: by 2002:a05:693c:4153:10b0:36c:9af3:22eb with SMTP id 5a478bee46e88-379681c99b3mr4512315eec.34.1794621568916;
        Fri, 13 Nov 2026 17:59:28 -0800 (PST)
Received: from [192.168.29.63] ([49.43.231.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm11346264eec.0.2026.11.13.17.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 17:59:28 -0800 (PST)
Message-ID: <6a87cefd-7dcc-4e68-9c4b-413176360a00@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 07:29:23 +0530
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261107-shutdown-v8-0-bf607c6429b0@oss.qualcomm.com>
 <20261107-shutdown-v8-4-bf607c6429b0@oss.qualcomm.com>
 <fd8b69b2-5487-4e99-a45e-d6c2ce9ae1f1@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <fd8b69b2-5487-4e99-a45e-d6c2ce9ae1f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aQ58bBHxbdFUQAQRfW2bGTgkxR2uvdxr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNyBTYWx0ZWRfX3LPXd8aRSYd9
 5ot/HGnw4UX9DsziOgFdF4D1Elv2FDFW47K51ldqegKp2D7DpBAAIaioYVq/xltWvEfYcMr4BEZ
 YAvvWM8P6z4wa32t0RDnPgzFrd3BaOs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNyBTYWx0ZWRfX17v2UJgNRdzc
 Unmugqn0tmAcdzDheJoytoJZLl897LPkrAYElFFwFgEBKIu6NfrW+/jT0ZvwOo7P2TqnzA3NJ7f
 cDaJR2gpHH9FDGiN6loKnM7z7vBxXcrUMVAfXfNEqdC5ZJjMNmKoK3B18gGDx6PBbeYq5BHFw7z
 QbE9s47S94PpyytmjZSB102iU6hVRq2qgr6v5H3/V68dBUinfYAGWeOIBM/x22foKOVSFDLPAHS
 JESZbeTtsoL+kZdMv+StqGsPqkTUmqPabf88KUAKGMwW8IJ3mV6YFLlFNU+6fSZ8eCOCpVPE0X+
 FQ/P6worDef+7uqOu1zIwyqkBkNd1dps9iwqNB/Tq2RLiUwH4ObH0SEzOFkOrJ+kEaiZWWtK0OP
 KzLEakbiTzL0Z/jWQvBXkJ9UMI9hrQxNPGSgmbPB+gJJ2TXTYuQX++/JWHER2voHfC3e1CSWM78
 E87OJPBtrAdgVQLfnmw==
X-Proofpoint-ORIG-GUID: aQ58bBHxbdFUQAQRfW2bGTgkxR2uvdxr
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af7c082 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=OgdsqUoHhxF4GfobPiU6/w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3O9PIZBSMK0NwXvH1SEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140007



On 11/9/2026 7:59 PM, Konrad Dybcio wrote:
> On 11/7/26 2:45 AM, Krishna Chaitanya Chundru wrote:
>> From: Manivannan Sadhasivam <mani@kernel.org>
>>
>> PCIe host controllers should bring the link down cleanly before system
>> shutdown/reboot proceeds to remove power/clocks from the controller.
>> Without this, the link may still be up and endpoints still have
>> transactions in flight when power/clocks are cut, which can trip SMMU
>> translation faults or NoC protocol errors.
>>
>> Reuse dw_pcie_suspend_noirq() in the shutdown path to force the link
>> into L2, putting it into D3cold.
>>
>> device_shutdown() runs with interrupts enabled, unlike suspend_noirq().
>> Mask the chained MSI IRQ(s) and the Global IRQ before tearing down the
>> link and clocks/PHY, since a late/spurious interrupt could otherwise
>> reach a handler that touches now-unclocked PARF/DBI registers. Use
>> dw_pcie_mask_msi() rather than dw_pcie_free_msi() so the MSI IRQ domain
>> and the MSI mappings held by downstream devices (which device_shutdown()
>> does not remove) are left intact.
>>
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/pci/controller/dwc/pcie-qcom.c | 41 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index d39753f0e724..c5b06db3b92a 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -2046,6 +2046,9 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
>>  
>>  	dw_pcie_msi_init(pp);
>>  
>> +	/* Stash pci so qcom_pcie_shutdown() can mask the MSI IRQ(s) later */
>> +	platform_set_drvdata(to_platform_device(dev), pci);
>> +
>>  	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
>>  }
>>  
>> @@ -2466,6 +2469,43 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>>  	return ret;
>>  }
>>  
>> +static void qcom_pcie_shutdown(struct platform_device *pdev)
>> +{
>> +	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(&pdev->dev);
>> +	struct qcom_pcie *pcie = NULL;
>> +	struct dw_pcie *pci;
>> +
>> +	if (pcie_cfg && pcie_cfg->firmware_managed) {
>> +		/*
>> +		 * Firmware owns the link teardown and clock/PHY shutdown in
>> +		 * this mode; Linux only owns the chained MSI IRQ(s), which
>> +		 * still need to be masked off before shutdown proceeds.
>> +		 */
>> +		pci = platform_get_drvdata(pdev);
> Revisiting my older comment, we can still stash `pci` in drvdata regardless
> of the flavor and do `struct qcom_pcie *pcie = to_qcom_pcie(pci);` in
> places where we need it
I am going with uniform drvdata but stashing struct qcom_pcie (not the bare
struct dw_pcie) in both paths — to_qcom_pcie() resolves through
dev_get_drvdata(), so stashing pci here would have returned pci again and
broken the existing dw_pcie_ops callbacks. The firmware/ECAM path now
allocates a thin qcom_pcie wrapper, letting shutdown() drop the branch and
recover everything (Global IRQ, cfg, dw_pcie) uniformly.

- Krishna Chaitanya.
> Konrad
>
>> +	} else {
>> +		pcie = platform_get_drvdata(pdev);
>> +		pci = pcie->pci;
>> +
>> +		if (pcie->global_irq)
>> +			disable_irq(pcie->global_irq);
>> +	}
>> +
>> +	if (pci->pp.use_imsi_rx)
>> +		dw_pcie_mask_msi(&pci->pp);
>> +
>> +	/*
>> +	 * In firmware-managed mode 'pcie' stays NULL and firmware owns the
>> +	 * link/clock teardown. Otherwise, skip if the controller is already
>> +	 * suspended (e.g. a prior resume failed), since dw_pcie_suspend_noirq()
>> +	 * would touch DBI registers with clocks/interconnects already off.
>> +	 */
>> +	if (pcie && !pcie->pci->suspended)
>> +		dw_pcie_suspend_noirq(pcie->pci, true);
>> +
>> +	pm_runtime_put_sync(&pdev->dev);
>> +	pm_runtime_disable(&pdev->dev);
>> +}
>> +
>>  static int qcom_pcie_suspend_noirq(struct device *dev)
>>  {
>>  	struct qcom_pcie *pcie;
>> @@ -2657,5 +2697,6 @@ static struct platform_driver qcom_pcie_driver = {
>>  		.pm = &qcom_pcie_pm_ops,
>>  		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>>  	},
>> +	.shutdown = qcom_pcie_shutdown,
>>  };
>>  builtin_platform_driver(qcom_pcie_driver);
>>

