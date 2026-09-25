Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5ED32B116
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 04:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790309327; cv=none; b=o8BTeJ9k3wTMpp1TD2NpaR6EfBYGjYvaQFmnMBjlEC0V6b+DhD1BP9V5XUZrKdIB14SALHP7P4m8jBpNKbiW/9oy1epOj65gn2R2RfPPOYmO69TX+HK6nVjxFJfjGIemxxz92ahyq4uik/fZtRRc8rdBrii5tbz2pifFPJuzoNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790309327; c=relaxed/simple;
	bh=+dOAda3zxjmUol975BAwpv4/X02vCxfJi2PJaeVTH0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jn2oaIuwTW7kVaVMDXR4DaCWbXsN/yvDPtbglIz4Aa+yxsheTvP23VZBDe7wlWFr685YL9v6U5wHfAY/hX1Y6COKgasptp6Cp7II+LPA1XQigGxqai62ntRV1WTl2rEPCeabzge8dLxdKT/uuHARwUNigXTXNQJUpgLHAnYbkoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmuYVbRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3IpTb5W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmuYVbRV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3IpTb5W"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P1lQQ33753101
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 04:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yC18zP13i2KmpC/DV5boNOGnrL3YTVpI80ZH1XUdZTQ=; b=AmuYVbRVJXy5sSo4
	UbuJgB+9khPaiVd0aePcJSbRgHYrJ/sjsYXcbNKSxCkGndfEzCKU3Tst4sM4eN0x
	MZMngQbHIx7743lf5fw5i28pu1d27guytyrqpvUr3VvD8oJHaWa89Osaarb/Gnl8
	aG+OyANgooxpiYhIdWKeoYo6vwSocvyot+TYXDMsfKFr4jkcPUQs3kWZ7H7Qif8Y
	DBeWWcDuZAdCBfYKyBUFgqxevSxVr4R+ZDqEKjTAB6c3B25zXifseRG1+Mje/68o
	3cF+bYK1ZuZuVfQiGFKS9f82D44fkfvF8a0L4g3I3oxhcPqTlZyibquqZnu45e77
	cfAeCw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8tryd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 04:08:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-313d1015161so1552935eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 21:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790309324; x=1790914124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC18zP13i2KmpC/DV5boNOGnrL3YTVpI80ZH1XUdZTQ=;
        b=O3IpTb5W+Da+KJoVTUeUDCvLG64D+93rVBFmhMdnJskR8ApCckRdq3UctKmBaeNi/u
         fKTBGbPoPVF3l8HLFMjO4rpHZNKZf6GGD4tC44woGZyUQHJQWnad+sQ7h7K1lGVKp+Gn
         pLIrH1RoKhhetC0Rs6CFYnAdNJky3NI3qPEIxDcZjKHyVW4En2/C/LyauVDkmyhClNvt
         sJCvurJclortcan1qJRAyZ50a/EkfFdYDU/F4WUpGncuyEnTF3MjvQ8k0x2Bv1V615UL
         25eeIjMKSOabLSrPyQ13PHGLVtYtoONL/fCRxCMGMs8JP46McNQ7vGSk5cj04Iy3LRti
         uKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790309324; x=1790914124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yC18zP13i2KmpC/DV5boNOGnrL3YTVpI80ZH1XUdZTQ=;
        b=cOlbN3Rat22KZCMfn9XEwP44hxPgtN8L4WIZJuOFtUV8zFRghOY0R5salOT7Bpce28
         EXKh6jhuMw+DVALiKyYWx5KbwcAyDKuSDFPXusWTqXmpVAlp+P7347ZhozjHDXE5vl+y
         kcv+WgO1e/jVRwtqD7pDkT1xpeNima25Sz0M+Gi0U5ge6yfXLVxmEg4TlRwspXqBsFlx
         72NJAMOlb0cK+0j4Ak4TKfpbpstU07a/jl6UsYaPojSj+oNxn2Y5Uqi0KSsivzKaij74
         cvK5ENDVSDKtZoS7EUJAgHmBlkbym4KLu+4h5NvQyNzG11mZcL3KsEcorwxKqOYmjh43
         3cWA==
X-Forwarded-Encrypted: i=1; AKwUvBzK3tBje1SdkuJpYJfy2UdJAG1mRGIGE0zopPR26MmgJUfqx4pJ6tY0MZv247fo1YFXo8ep66ATAUmwIKIZ@vger.kernel.org
X-Gm-Message-State: AFuF++nJ00Q87rnXwGub9EsMnDqA2nQgFtimeAFInKG8I56h5M633Pbf
	8/sqJcuFwsqe8z7F0/qrLDZdYCJVfUg6AU2oYUMxGYnxbHX2inxlAuop+48Me7ulb/TxllpLbwp
	EjD11BXybfMU3jZhbrBs7+SIeM+3KqB23Vj+jJCLiartbvIYJie3px4DOlfnRpRY5l/Xo
X-Gm-Gg: AYBFou1YKo2tsqSZFtkfjyXNceZkTkIpRkaHX9HaNiYmROX3oYCMHL1mNabkzjenNu7
	eBhNn8aWliS5f6jNVySMZFUMedgwIzw1NAwFxMvmH/AY/oB85xysd/7CvIppbqJIkTxiSwgFMMe
	bBFag419ev1h6Oj3pA+i5OQkSRaUHL3RgHmPSp99Ud+MbAvxkGYVFs0CmWeX4Apu8DzjExsA3A6
	oX0KVXm2DxpUnHU09wmXlfpzKDR09sAfMXsOfc4RGhGUquPfxchx8QiWWjZvdu+m6tVpoB/Yn4L
	bzAtvtIjLYNTscA0ICSqg8+WwGYS14doFmAzCblI6t66P+dWMiGMjr734nxBPyDeN7/7ICwofyV
	WbZkNINjhdETi+a6DjV1bz5BIjBmv8BdO
X-Received: by 2002:a05:7300:818e:b0:327:affc:b506 with SMTP id 5a478bee46e88-34004e839e1mr5134631eec.15.1790309323705;
        Thu, 24 Sep 2026 21:08:43 -0700 (PDT)
X-Received: by 2002:a05:7300:818e:b0:327:affc:b506 with SMTP id 5a478bee46e88-34004e839e1mr5134580eec.15.1790309322832;
        Thu, 24 Sep 2026 21:08:42 -0700 (PDT)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm2812641eec.0.2026.09.24.21.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 21:08:42 -0700 (PDT)
Message-ID: <050f7d22-48a2-4114-babf-7cf21c4bc08b@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:38:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] dt-bindings: phy: qcom: add Nord QMP PCIe PHY
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
 <20260921-nord-v4-1-ed05c6e09240@oss.qualcomm.com>
 <20260924-lumpy-robust-fulmar-1bfbe0@quoll>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260924-lumpy-robust-fulmar-1bfbe0@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAxNiBTYWx0ZWRfXzgGjHVKPyx57
 3SainFlpKAmAXBj4IoEfx3IKnWWOqw9ExSLnTAFRm4itujV/DPt5S1yyTnrbQslT/i7rk6MPtyy
 qIZHJ9keoD8uU7X6RCnLQREZs5QhoSs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAxNiBTYWx0ZWRfX+vLXmX3zXrd7
 XgYHtRaGktqdJJE1pyRiNHyLBGBkwpjVChJ3tUxJ8GpMEjFxNPTGG8YL0AXmBzaP7ViL4v0At6p
 FLq6d2+iflGZ1qBtmz8r2n4C5n7l3UpwbHUAfhnfQnnNRjznMuMuDBDJMk0F1BrwAGrLfHEZO/q
 rIoqAd5PW+loc2YAAYLWEi9h+JrAtI4G58TRJKQ8lAjfTl4/4ejojDKs/C/Qa37QhTuVYPgQLIJ
 39fTJxnDTzDB/wHOIuSsmxIJHhm6tTqf3XWIG+BIGy4vfNSekYtlxSAJ59ScWuvm7TBPjdbUgU2
 35n/o68MLDV3EedKEaXqmo1k6QZZNfXXBvB7HPo8CU9viTIJsV8Dir07mL0DjOhWOESH1pHw+cn
 urGjE2AwXhIXdaPJnr3tuXaDIuNugk8Pshf9AyfJ95F5t0GUEhPCuFy+4hk/Wq98Tzl2XGl/wf7
 k41tPH87Yo/hjMqzq7Q==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab5f3cc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=l-6eX-iZw65OgPShCm0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: mpffTurzegi9JMWTDIYnZtkKVFTMZnOm
X-Proofpoint-ORIG-GUID: mpffTurzegi9JMWTDIYnZtkKVFTMZnOm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250016



On 9/24/2026 6:52 PM, Krzysztof Kozlowski wrote:
> On Mon, Sep 21, 2026 at 11:07:09AM +0530, Krishna Chaitanya Chundru wrote:
>> +
>> +  vdda-pll-d-supply: true
>> +
>> +  qcom,link-mode:
>> +    description:
>> +      Reference to the TCSR syscon register containing the PCIe link mode
>> +      selected by firmware. The property consists of the TCSR syscon
>> +      phandle followed by the offset of the TCSR_PCIE_LINK_CONFIG_MODE
>> +      register.
>> +      The register value selects one of these topologies.
>> +        0 (QMP_PCIE_NORD_MODE_X16)         — all ports combined as one x16 PHY
>> +        1 (QMP_PCIE_NORD_MODE_X8_X8)       — port A as x8 and ports B+C+D as x8
>> +        2 (QMP_PCIE_NORD_MODE_X8_X4_X4)    — port A as x8, port B as x4, and ports C+D as x4
>> +        3 (QMP_PCIE_NORD_MODE_X8_X4_X2_X2) — port A as x8, port B as x4, and ports C and D as x2
> Same question as last time. phy-cells tells which mode you are here.
> This is duplicating it and the register value CANNOT choose the
> topology. If it does, then phy-cells should be 0 as topology is defined
> by hardware already, no?
phy-cells does not describe the topology. The PHY argument is only used by the
PCIe controller to identify the PHY instance associated with that controller
(for example, phys = <&pcie_phy 2> selects PHY instance 2).

The qcom,link-mode property serves a different purpose. It provides access to
the firmware-programmed TCSR_PCIE_LINK_CONFIG_MODE register, which describes
the global lane partitioning (x16, x8+x8, x8+x4+x4, x8+x4+x2+x2, etc.).

  - phy-cells identifies which PHY instance a controller is using.
  - qcom,link-mode reports the overall topology selected by firmware.

- Krishna Chaitanya.
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: Phandle of the TCSR syscon
>> +          - description: Offset of TCSR_PCIE_LINK_CONFIG_MODE register
> Best regards,
> Krzysztof
>

