Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05D213DBA0
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 12:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723537; cv=none; b=LvwFoAvOEbINlrSyPs54TSY6AfloqcsZYz1vS7YXnlikxh/3+9KitDGvjjT6I+NV8MOrqVZIds2v1FWt+POaMMfdLARAMed+buOYV/i2gzxA7GqoK1oKutkgDQjOc2lX/ZeZOo4mI2kz0XT0ACOyMTI16XgTdVW/M40YeMgAAeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723537; c=relaxed/simple;
	bh=/dKr20+S0lxt3Qnm81FUeEE0LP3pRcGbSrcT0xfVUc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVqzNNw3xdvswMzeFUKJBMw8xoBRScaUpTPoNOL8xy8C1+2wvU5BgW8xdcXZmniPhhMDyqeOo2DJLWUSuVDshVkblBbC9vFpfZJKEKrPaDCNib5CN8d1Q0225MnmghhuMqIkoYpl4uNdO0ZKpKsn7bT4M3QrXzFxamW914xPe7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VV4Yb3PL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b2bSJqE/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VV4Yb3PL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b2bSJqE/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x6JX140602
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 12:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AyfZ1AGsNFCY7Vy8azTP8G/03OAP5A5XNV25gHm9a4Q=; b=VV4Yb3PLfUC47MwO
	p3TCnTvJCi2SnOKUgpDzdj8gNxnfs7Qcs5X1WFw2Vn9nsgK8ZAcoqcOp2RZ6QgvC
	b7SbNBpCdFTb68f53bCZrpM4wEiTzYIObhtb3DChubri+FAbMjI5zdomph1IrNv1
	QyfwrUT7TVepLLSQvJbFMohIfOBZdUMkmtEq6q1x1tmi9T+vrD1EQ25gMQ6BQIBO
	2RGqSOS3WwDEr0cRm5jzc0Dj0jMZX/HgLvIQfVnSF/n5dJ/zqa02Pk/JIgDSEfG2
	wstp4deEUsT/JvHSdzpbqQlZiTKucU91YDQhDuFD5RiZZ7RJjWWItRTXheNMMqIq
	bk7mHw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2rwt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 12:32:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccd1958e8fso127497125ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784723533; x=1785328333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AyfZ1AGsNFCY7Vy8azTP8G/03OAP5A5XNV25gHm9a4Q=;
        b=b2bSJqE/2WKPqArLWDczbTw9EkLXZ6N92lGOKg+RFKwQDbZCbW40R47NvhB/fOJCk9
         G7Chgv388JPPy02EJi3CCoxaze/vkwsBOoh2w9bBZGUQzgU3JtABscM5objBlCs55gDG
         bvJ4xF7WykX1hSdhySRx8F5mYxcq82Vs0QH51rIvXc40KXGkk5CrN2MnYB9ZlfanvknK
         JPU3h1y4bXRvV7KrFeqEc/xswP6AY6+liMvA3yiIbbRolO/HD+U1YMq7CC4LKdp3rpxK
         7KLAJzJLj9kNJkibq+EpblBPl7D1D3qWmkoN1TQkF7yvZR+MUVFHOx/zBFHqoe46OdYO
         iTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723533; x=1785328333;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AyfZ1AGsNFCY7Vy8azTP8G/03OAP5A5XNV25gHm9a4Q=;
        b=CHVyBjFMMxnEU3Fm4BEnRHP9dvVEPUSQLCSFlhcL+ZrcqxwVfGtofjPbb2yeJ+y2u7
         nRhArSK5KvqoRV/G0HLad5KkDfFjRMebbAwq0sRCJH2qlJ4LnasyLcjiPCFxxwXLnT68
         Fb38N/aj/5nvCRj3iHO+a2KjHp4wQop9+7cKuTFPIVNJxskvXtdY/xVALGEW6HRUmfwm
         mgWbPiNhooqENWdl9dxBqB5cJBNnxsmgt+rI7WifpayBdW7AGHvYO8Uac5S6A0A2m1M8
         bF2Wa/g2iM+p8aFTd48EnUE944ixbb0NRDH+tdV7r8to+IomHpHPkftVCjpSTS6/vY6y
         F26Q==
X-Gm-Message-State: AOJu0Yz8cq8E0pv8XQgDTh/E2StfnXQesoWLkeUU8JLSgdXmXuVNxpWO
	s5j5llCveSj2092C6qSSYrQSBoJQ01jkxosb43tmTGE48loLh4PHylfZUEXqXNjMYkOXd10+bIT
	6vOB36hqabvK03w+zbQwcabgS7R0+W/u3aLslv1FYmJ7wCj2sKej8cTxKOJgaflEyNvbb
X-Gm-Gg: AR+sD12AHFbbuW8b4+waHsTpKlsujmRt0OQIC8K7bAP3aB4wldQ7+Z9QP35SoMKkYt2
	Mv+HCm+4mYySjmwdEIKczKky/9BbxT3elQsJBS4fTA1X5tg1qz0XL47F5ojC4mhZFY1tAo7ZWT/
	ce/u3wQ5K4KBwdFrN627qJz6U59bTYaDAlTPXCbIxUbouaCJx+LcEkJtpBzxToJ3q/BvGkS/MYP
	V3EqaTeXKWdWPip7ftQTIZEEAvmZJAD1JLih9Y/+kcZyOVBI10fMnDsTmPdzwxDv/F2LkdJRLIX
	v+nWRFBMvoHkuadGjINblaniXbIxw6HYqrg4uS0i+y93ZLyxakLhOQmk3GAhaj5n6DSdHLfhKVL
	jRlkFNyAARsxxPh+rBkqUhC86xLxjJ2b1PRSQSWNHAAU=
X-Received: by 2002:a17:903:2f84:b0:2c6:a012:6241 with SMTP id d9443c01a7336-2cf34850f28mr257908395ad.6.1784723533267;
        Wed, 22 Jul 2026 05:32:13 -0700 (PDT)
X-Received: by 2002:a17:903:2f84:b0:2c6:a012:6241 with SMTP id d9443c01a7336-2cf34850f28mr257907815ad.6.1784723532702;
        Wed, 22 Jul 2026 05:32:12 -0700 (PDT)
Received: from [192.168.1.6] ([122.164.85.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e5f17sm14379875ad.41.2026.07.22.05.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 05:32:11 -0700 (PDT)
Message-ID: <bb810003-51d4-4dc8-9aba-19d09d9fb33a@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 18:02:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add support for the QMP PCIe PHYs in Qualcomm
 IPQ9650
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260710-ipq9650_pcie_phy-v3-0-ef6018818d33@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260710-ipq9650_pcie_phy-v3-0-ef6018818d33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyMiBTYWx0ZWRfX5DtQP6gTeB1P
 jqUrbu3oAc67PMCrkq7xH/oCago0eQF60wGsw6JJyqTFDvMmJYs/gGu/jcvOJbnUn/QqIx3Mles
 ScqjIMxn1U63w/YpAa7Iqb2XCC/rJxJyA3C+kRSVG7VLoqW4aNCzzu9j5oWi/VnMmqCIEseaN0s
 6JfaORcA3ZWB4714cY3RExlmG9pUnVh+mmCSwzCNp6yXmHS7T/Jcqn8iyPil4w9vd7nzlaEu+Xw
 ztDmxevaM5/kLHCZqHHpQoahz3azlXeqShNL9txE4lqPvBvIZucAtv44lBdyEwK2N9lkWtNLuFg
 RUd6awBD5rBWyuWXC1o+GSj16cjlam3sdEQv97QsrrnuEKwUCQWKAWjI1cS2oKKRQjLtbr+ZF1V
 /hvGhNhxNcn3YntB5NTALt82/pt+grNoxL1gCYHu2arR/UOzBgzyxjN+PtS3KiwUttJ7aCt2EtM
 InwmtlMDsfor2ghKlUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyMiBTYWx0ZWRfX7/z/wIIMiFmC
 ThzFRujbkKm2Mf2PayWfYDSGdiWgeVwdKH8lzxeqVwTBR+G2SQjTlVsjSTwzk+9DyC2AM4muznA
 74O/lEtYjWQapjT1bKB0CDeIIIXvf9w=
X-Proofpoint-GUID: 0VLGhFPK3BpYjoMfVA4EwiubD2g45HNM
X-Proofpoint-ORIG-GUID: 0VLGhFPK3BpYjoMfVA4EwiubD2g45HNM
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a60b84e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=C8tbAiBpJ+kDtIH6BY8zzQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JfrnYn6hAAAA:8
 a=Ebsc_R1zknWeFji_XzQA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220122


On 7/10/2026 11:16 PM, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ9650 SoC has 3 Gen3 dual lane and 2 Gen3 single lane
> controllers with the QMP PHYs. Unlike the PHYs in the other IPQ SoC,
> refgen supply is needed to bringup the PHYs. Both single and dual lane
> shares the same HW init sequence. So reuse the tables.
>
> Document the compatible along with refgen supply and add the phy driver
> support for it.
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Vinod, Gentle ping...

> Changes in v3:
> - Rebased on linux-next: next-20260710
> - Pick up R-b tag
> - Incorporate the link stability issue fix (QSERDES_V4_RX_RX_MODE_00_HIGH4
>    from 0x35 to 0x3a) recommended by the IP team.
> Changes in v2:
> - rebase on phy-next
> - pick up R-b tag
> - Link to v1:
>    https://lore.kernel.org/linux-arm-msm/20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com/
>
> To: Vinod Koul <vkoul@kernel.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>
> ---
> Kathiravan Thirumoorthy (2):
>        dt-bindings: phy: qcom,ipq8074-qmp-pcie: document IPQ9650 QMP PCIe PHYs
>        phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
>
>   .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml    |  19 ++
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 220 +++++++++++++++++++++
>   2 files changed, 239 insertions(+)
> ---
> base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
> change-id: 20260521-ipq9650_pcie_phy-60d7df32581c
>
> Best regards,
> --
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>
