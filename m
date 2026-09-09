Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4705437C0
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954584; cv=none; b=PCJZZkPOxoHwShOH1RdpGsHhDJ5gspA9zLTd/KsecyJSGdIBVHUc+mN1smgBx+bEqrWEoXRSgTqa9ZeR4gpdYNhaY8oNZ553Xg8bY0O2XrcGonG346HjPqfkjEolHy18KAJSBZuueYIxNRWeYn2vTkEG4IydJF5JjdSFtnS9VJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954584; c=relaxed/simple;
	bh=11sQXof3ue6JP3cwDjHHz3P9mnE9zJKkzWdPrS+G4lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cySnh2GWON1S8443ryr1NXCg7SFDilWz+IywhADEyfFnQxUf4kWuBunyPce5EdgBZTIyzFBLwoXW8oFa0O2Anu76hSGmNNm9OeTQjEf+TMyZytpR1MTX7FvuDph5pYbouPrdcHSq8c+Zq8StLtvWqUZe4ThspApGi3W6m68lPRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K8elMYXB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RflDsTq6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K8elMYXB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RflDsTq6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU28p2019091
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G+i5sN0oSRQdQrTAbL76h6+fmDfqPx5G35ipOQhrdr0=; b=K8elMYXBjUE4eFDc
	2my94nIq5pEnB/ZL+RE9/a8MdmTl60CPh8geoQ2hZrYdNUSl9qbDMJDx/pLDwgb5
	n48LRCRpZp+OA19It7MeChwmazwr6iGpdmnxTF7L3iSe5gxkH92PjDMjatg0XOr7
	otJNtyDskp7+cqGNtxEbXLmIp8pzJsk4BL2iEjnWWZFkVm8yh1YljOCiSV8h97oh
	dWkO5Nl54ZXiMRlz7s6htSsVz8vhjsiKOvTgv3gtC/xG8bLFPeIW/gT+BxcNqWCw
	x5GjEnsXZlQhd2jiff9WcG00LiG9juV/RtLVAnNm5XYG2wA4y7Gd5yHmroJkYxGU
	sUd21w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x86dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:49:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088202so5189564a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954581; x=1789559381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+i5sN0oSRQdQrTAbL76h6+fmDfqPx5G35ipOQhrdr0=;
        b=RflDsTq6SWSoGhg72cObJDsw1Hd5HTQaDXSE0U92dZ8xcNv4zEeVGqvanhOHxF+Dkg
         sy0NUcFRlLBBskCSe6ijcficJcbC8WT31uVIbG96NcVlbk+kk20oGxxuKUWK2Qi9gOcE
         Iev8A5ofSxG759OngbXjZQshsRwuv9PhhArVdotvPNtbE45OseLRL8t5d0jtVXIW6b0Q
         LdWooUxmz4Hc+smqkE8XYGvUQM44AIFNNX1dCddiiOywKaRBkUShMFHlx2wLetAWry+S
         wHe9i/0fKFBqkGaspFUxWAbXZAVhFDSTtvI3MnvIjz1Ku+W6BA271JCmgh4TT4va9bVa
         jZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954581; x=1789559381;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+i5sN0oSRQdQrTAbL76h6+fmDfqPx5G35ipOQhrdr0=;
        b=nauMcDpgUJ1un2bCj/QrhMRnJPx4B8iPnkr6GUqkyjIskq3PojPg8WdGV2DQkVGw1A
         eL5MZBVBRRTxw82bzWqHhvXXOCJq6rIwDph6F1Es0jX3T16uL6AMgGLgyByiPjcL+Wqq
         67keq3Oam3yM8YvFvRUCbO2nTPud7NLr4FMn1dQ3fxoBe7RfL8dw6Xi3YMlVIm6ZMB/O
         G0qLKD1Yegx4T2HKt9w2o0dilDLm0d7cPJpuHoHElLzErlMUEgjFMKZu3QSHIVdNwRFq
         UfBe4ESR7/twW/xtnMsPeSffGiUYlwggx0fKjBqNKYbyXLcYndP3VWuL4BfKl6dD8U7f
         xpRg==
X-Forwarded-Encrypted: i=1; AKwUvBxlZuFxvrPS/0qRHCMR6qK16JT3ozbMKYIEuhx1pDTR0N4Kjdy9dCV8Auznn6LwqEUnG9+OYjbq3zwLHJtt@vger.kernel.org
X-Gm-Message-State: AFuF++ksVhj/azZxDcwRnjyT1JzdpaDhZYbm1uauwXo2pBDif3Aec15r
	ayrLa5QyqzZAXc0ITLKG7+IBh+kYQWpvJ9+ampPModD8HiJqme2pEnkRgr1uh3Jq8HsVjdFvSHn
	A00CGEWK1/97eTF6EeCizw5dc8RE2Oa1777+U23O+F3dz2MoKo54NgmwSJUB91wk9T4KW
X-Gm-Gg: AYBFou1TmrzWr3wzt74SNPy4C1uk4l1sG+4K3e3JnYMU6g8lBcPJqNU2w2MEpIn4Ofw
	V2mAIQdsqX0/IhJwJ/L18xO41f3goW4u2M6IyFkmkA0hYJ5U9/bedrcSrGilcB1MU2l99aPSb2p
	Z8p+D8HmOxvHPA2U4dig+0hcPvPvrPSiNoQFQLT2i4PKELjNztlsRO7vOdSveKjHRJvpUK83GcM
	5pmKiaM6CPy9zkW3A2yducra/OAlJWegJebZgEw7GzXU3A4AB6mMNRMDGzzkkpK0kZaDPOeqOw1
	3x4lQYEEJu+IfzLMgYH3FeWI3ghuBiuYuqorYZP3QFfUkTQ9qYSOTZfm7iyr1v9CqAA8hw6h+2f
	6EZcgDTgTIqrzK21ZroHcXHXG57SW1Rpv
X-Received: by 2002:a17:90a:d406:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39d70b4e3bfmr523733a91.16.1788954581350;
        Wed, 09 Sep 2026 04:49:41 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39d70b4e3bfmr523647a91.16.1788954580694;
        Wed, 09 Sep 2026 04:49:40 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm69001290eec.15.2026.09.09.04.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:49:40 -0700 (PDT)
Message-ID: <d888903e-7482-46ef-82db-c35c39d5bd6a@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 17:19:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] PCI: qcom: Implement shutdown() callback
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260905-shutdown-v5-0-f0c6bafa1d4f@oss.qualcomm.com>
 <20260905-shutdown-v5-3-f0c6bafa1d4f@oss.qualcomm.com>
 <ca45caec-01a8-438d-a91b-98a2ef411576@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <ca45caec-01a8-438d-a91b-98a2ef411576@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX+9qMNx9OW/uF
 dvUH8ezd0TBFe2MtL2Yv8aJJg23ru4nqJxGhJr6hGF6yPxNNMiNAnMalZB/yfgRx30Cjb7H3mK9
 q2Dgad6cPoWsQNNaAD8kwIIVYmLHpGA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX/HVRSxaD4r/V
 duCyJjCzY+UWwrwRCkyvlEUIJTFpTvPoPT2ZdNQOEwfyF3OhN50N6L5YcD5H4oXJNnoOR6bNPEH
 TEPUNNbhjb4ca4YMxCE9H6ZjeldDHBPQzghN2x3qu7ywomq8hRDipwD8yXb1rcMgngKnIGMh5IF
 nO/YYiIBjEfnvS+h84GxbC3HH8GRsVUCXs1kV0xTbv8zhL08NDk2tp8T0wI/Teo/3kqrs7x6jcI
 Riyt/9BZTTD4mROTdZFSA9hMDi++r7SrR3zdwcIwWFtq324XHQX1/pwnF7k2K8q4LK2piJxek6z
 kHSb/ivaoutpzq48T//5eAAiTLx+2cwy6VDE+wzuyIXW0F8F84cM1jFPWeRqf2ymZGXfBkk3sWd
 9oVHAn2WxlVF3el26jxIlyqo62vreml4nxn7sbQtgoXXVnLU8FPLTL1slwi2EZrdDIlXH6rJiD9
 IB1Jursk3q7JbSLmEUQ==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa147d6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=DzEHcH8_ZUqq09089R8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: VlYPp-JsOlIVop1YwkQQHpfa2Klf1Iek
X-Proofpoint-GUID: VlYPp-JsOlIVop1YwkQQHpfa2Klf1Iek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131



On 9/9/2026 4:26 PM, Konrad Dybcio wrote:
> On 9/5/26 2:48 AM, Krishna Chaitanya Chundru wrote:
>> From: Manivannan Sadhasivam <mani@kernel.org>
>>
>> PCIe host controllers should bring the link down cleanly before system
>> shutdown/reboot proceeds to remove power/clocks from the controller.
>> Without this, the link may still be up and endpoints still have
>> transactions in flight when power/clocks are cut, which can trip SMMU
>> translation faults or NoC protocol errors.
> [...]
>
>> +static void qcom_pcie_shutdown(struct platform_device *pdev)
>> +{
>> +	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(&pdev->dev);
>> +	struct qcom_pcie *pcie;
>> +
>> +	if (pcie_cfg && pcie_cfg->firmware_managed) {
>> +		/*
>> +		 * Firmware owns the link teardown and clock/PHY shutdown in
>> +		 * this mode; Linux only owns the chained MSI IRQ(s), which
>> +		 * still need to be masked off before shutdown proceeds.
>> +		 */
>> +		struct dw_pcie *pci = platform_get_drvdata(pdev);
>> +
>> +		if (pci->pp.use_imsi_rx)
>> +			dw_pcie_free_msi(&pci->pp);
>> +		return;
>> +	}
>> +
>> +	pcie = platform_get_drvdata(pdev);
>> +	if (pcie) {
>> +		if (pcie->pci->pp.use_imsi_rx)
>> +			dw_pcie_free_msi(&pcie->pci->pp);
>> +
>> +		if (pcie->global_irq)
>> +			disable_irq(pcie->global_irq);
>> +
>> +		pcie->pci->pp.force_d3cold = true;
>> +		dw_pcie_suspend_noirq(pcie->pci);
>> +	}
>> +
> if (!pcie)
> 	return/warn (should it be possible?)
>
> if (pci->pp.use_imsi_rx)
> 	dw_pcie_free_msi(&pci->pp);
>
> /* abc xyz */
> if (firwmare_managed)
> 	return;
>
> will save you indentation and de-duplicate the free_msi() call
Ack.

- Krishna Chaitanya.
>
> Konrad

