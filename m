Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADE53FA5EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803494; cv=none; b=ZK0ZR49cXAn4Jn9ricUg9QUhIo5OEAhiPBJjwOKvb+mOfgpO09L2sSOQV242ik06XpFhtFlbljTsKveYXk+HxarLn2HRqfH7ucD2c5BgJInWoA5VmS8oUde+UKFY3B7zsoTyqVqxApoUI3QWhGLtKgADgNpekNQKupxcQmb+zQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803494; c=relaxed/simple;
	bh=yItWL3c+OS6k18uzUiRpkFbbNdNjokIgL9umHpO/PXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2BGjNr20zWfjtLGIyaYIOgVL0UTHCvZqGJe1H3XyWw090M85UHygnjiXUhSXxU3v76GfBl0Dww0Ke2Eu3R7Fb/M2L6b5Kf5+rLJWgXugLGNenq0aFg/QA/sUup1F5mLEEu6kzQHRvBiYLL9E8qO7dCZkYPZTnkraRxeuV8Dvjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkiV1L/u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAdTgbDe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkiV1L/u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAdTgbDe"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qwKS3789575
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNWzteKUJDDrezgHK2pPHptQNAYDHgVe9x2wwVDkaUI=; b=RkiV1L/ui0O03Dq3
	Mbqz1wRJDuCQ7IJKUywd7PgqochTtXxJCZrkWCIlWmm5wtUJnW36SIxjWHpVIwfH
	Jx8VSuVWZq2PG9rJ7nSk/Y0o7tbslhN4syj7bmcsCHuQHmxwQJTfPO7v95v64UBA
	5jX1k/wZQTsw3Af0H5NKGQAsnJLKNbRk/OAjN8UqXosXNxHX27UBiLXpoH2void8
	ZPHh10F0kd9nsum0MbSUI4ZZLrEXTEIdVZFMPie8y7qIM1hmkCt60n5ab3AFBJ5o
	BHj3tvFEWfg0R2U0g9F5hm6M+vctUhjYOP8yCCY3n7575o5AngKWOhBEE7SLGrPP
	xJEgxQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b52cua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:44:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so493232a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784803492; x=1785408292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNWzteKUJDDrezgHK2pPHptQNAYDHgVe9x2wwVDkaUI=;
        b=IAdTgbDeWzXzcckoi4VgyN2ZkG2dhAYmQZbRi0zpLe3tGUHbQCagqDjkZd1r/p7vX4
         3IJDnhjF2btYHi264htnnWWOEuhMbj1ddBVJ/QjUxvubJ1nQmFFA6oF7kD1qdekUOC2Y
         kpPPe4Y3YKifgQt4B78MVY+gToSUvSoYVdIUqidRscXNdGD6qxhsFJsnoF4sO6ubYiti
         KSMwu716Nuy+BE7/8sKjA6mKBsuIVyMXgYezJIkneA9+76hl8nYlzda3MJnX3iHLVuor
         PzB3b+zRDKzMCbemrOIVFHeI7bcLmgb6ZBieMZa+XRIic3AAjj7dj88Okp+/tV7Dlcm+
         hC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784803492; x=1785408292;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNWzteKUJDDrezgHK2pPHptQNAYDHgVe9x2wwVDkaUI=;
        b=nwDX2yD4Blzw5rZKxK7Zl4EdIpzeH8ccECCQxHbgiRZiOMn3dR0mOOyB5Ig78CjRxp
         Sa0ZJnvdpWgetjzcFTrglQSbSQku6AeGoerUdni77HeFZ1ndrkDdkgxlQCPVWBkpx4gE
         X51A+EsuoWYs8v9BNV/UsR3n0byAM4WIu9O7Ak8q1Y1Ym0YBC34KDPLKC1Nx5u3ZkCma
         hCS6LpCZkC9cE4GnOpbPfz7hoOhcl17m04KfCYH9Bl1sN0FkVEo6E9wTmAPrlO3bjwsX
         uMRbZwNv8OL+n5ARQrz5VQcfr8hn3yrL0bFrKuNhoq3QLAtDuP1w6p2E+nPVk+ekxLhs
         o/yw==
X-Gm-Message-State: AOJu0Ywb5dcPHmIDKGE25TTHo6rw8UjFsY0OhO1eCSg0KrIjMee4kxKq
	XiX+xRVBx8fxRcOr1ytL77ItVFMd24bcwq4Kwf7y3k9hBlELPzI6WkkqNjgV+f6rUVGKK8vse5M
	+8qjdvWvcUA0cOHVKvn9leFoximQqK9gf2SBbcqrY3X7AOQdSeZNqW4OthN5u7dvphAef
X-Gm-Gg: AR+sD10P3eHbEJ3b+X4ncniTmJDn/gU5fM/X3NzEEqOKr4OdLLDAYFYFc/dLzlcfPxw
	0XwiMh85gAN9Ej5XT2pA+IVXxZdbNJHIT/ZApRS7953we5WRpIvDj8HRcEAsvt/OwMhyFvsPMxo
	/M89826xU6kUNbWjgHEFU4Zr3S6UGVmeZlH7YXJquJrP0sEcMTTFDCrWFz03Ze5NBKCQsGVhFM0
	yzuLfQ8NBibFOcsTC6Ma3J1iW5DNPCoba/WHokGfZOxuHkoGc3G9O4Agwtps7bDYsDY+mGXWK9k
	aZ03gu8Vmn3QKI38YL5Wz+GKwl8m0WUlwpMa2OWuwNx/O+75U+6niUAu4Eqi6nAs3WdMV7I9bvg
	Ukvb3XtIddEaSeb2RqjSl9FyH2zwhfHRCGw==
X-Received: by 2002:a05:6a21:6b16:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3c44afceac0mr2620900637.11.1784803492033;
        Thu, 23 Jul 2026 03:44:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b16:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3c44afceac0mr2620870637.11.1784803491586;
        Thu, 23 Jul 2026 03:44:51 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314a4206878sm294902eec.10.2026.07.23.03.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 03:44:51 -0700 (PDT)
Message-ID: <048506d0-7dac-43f1-a50b-f9f4c1d125a1@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:14:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: media: qcom,venus-common: Add IOMMU
 IOVA reservation region
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
 <5nIoqMekE2B3CTU4TIlUJxoI3Exckc2sUM9RmZBqboEOvgmkdrhKlRX3-FiMOiYFCWXwzO5pii52NJ6epuy1Fw==@protonmail.internalid>
 <20260722-shikra_vpu-v5-1-3d80babd4672@oss.qualcomm.com>
 <557377b0-7a21-45b6-b62c-d3b34a6a29f4@linaro.org>
 <67c78d88-92b8-44b9-bbcc-6f53f6c60ef9@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <67c78d88-92b8-44b9-bbcc-6f53f6c60ef9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX3RFiu6EgH1JK
 nAt29HsXhb9OHSGWCvcunxRYL9r+pJODNISKb+r6htT5F70vXAdon4kvW42Fnnp87s/l4lr89A1
 CbDzqLMlU2KOw6RMp2ZNukJTEMzsVOzlKkl0JImGDgzj3DVduIm3QcjuUeTM8U8LyFhaqFC0iDb
 T2T0+d814RL6JxdivFEZgl58mhpAOtx3S9VBEIt7iklkcbJgblkRm7OkPehz/XCnQHRfToze/Cr
 CsTq98e/gXEziPbUCM/XK2D1o9++j7lPsjHkbL32xQXKMGDPIgtmSVpkOsRlyntTxjHtBQSZazU
 0BQuHHJsekWSFL909jgtNkA+FPNa1M3MHuV/3RnkdKUkmKT3RiYa2Hvg+o735pJK1lCyqwquMMJ
 /sLHjxrntek0oW8Ymb4Jeod6bSfm+A5QemB1Yk8BTmT2up3joq+VaL+UvNTl37yJ0c3ObA55u04
 FiijZUgO8MSoywtkeUw==
X-Proofpoint-GUID: DTBCsfFSjkaCK-GNWiy0uHDAz1LEr-97
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX0X+AeWO957Ur
 ouegWQSUX0RNgQmTg4aKs13gQLqvy6QgWawCPs6FN6KRtNZ+sVhXXJkYYRxafI7rYlebExcIqY4
 xZ3pq8GhXCweYR/Y86GcY8Buy6eHmF8=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61f0a4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JQ8ddJNmfgoLVfyDzDgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DTBCsfFSjkaCK-GNWiy0uHDAz1LEr-97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230104


On 7/23/2026 2:36 PM, Konrad Dybcio wrote:
> On 7/23/26 12:03 AM, Bryan O'Donoghue wrote:
>> On 22/07/2026 14:41, Vikash Garodia wrote:
>>> Update the memory-region property to support two regions:
>>> 1. Firmware-loaded codec carveout (existing)
>>> 2. IOMMU IOVA reservation region (new)
>>>
>>> The IOMMU IOVA reservation region is required to restrict usage of
>>> specific IOVA memory range. For example, VPU restricts usage of 600MB
>>> for specific streams, which could otherwise lead to device crash. This
>>> change allows platforms to define separate memory regions for codec
>>> carveout and IOVA restrictions.
>>> This schema update supports existing DTS having single memory-region,
>>> thereby allowing gradual migration of DTS to support two memory region.
>>>
>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>> ---
>>
>> I'm not mega-happy with this pattern being used - I prefer the pixel pixel_cb sub-node model you've proposed yourself.
>>
>> OTOH you're the maintainer so its really up to you how you want to arbitrate this - the 600MB constraint will work even if its not pretty or the best thing (tm).
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Doesn't this cause the same limitation that the initial patch
> by Daniel (all HW contexts can't access 0-600MiB anymore)?

Yes, it does, but for cases, like Shikra, which have single streams 
(with SMRs), there is no additional benefit in going with sub nodes in 
such case.

Regards,
Vikash

> 
> Konrad

