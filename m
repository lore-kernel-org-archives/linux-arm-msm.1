Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EA538D415
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 15:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276295; cv=none; b=BhU7BM6rW2cehWQOGH6b3ZuW85m8mSIru0lF7J2kojAyuKqN76IQJMMcLkoJIluCyY+PWN81NE0DEtRXxGQouiTlaUrSJTeumO3rVxmvmRnZwztgyXH18eC9GGZgsoq5GyCpv+mNeLlstng0zvvjw1nsY9dRmXXzNbiSeRpxv7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276295; c=relaxed/simple;
	bh=pPhJgHfrcROjobsHow5Oxnu2biZuSv+iISwhseA3TaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IjwWu42vVxEofdAISinHCN2l3YkFouD7ZFLHg2YYZKDrMFrN24XwJOv361Tmn96+66OeSS9a5k7qTmfAiXXLAJngAK+zTLgzKXJ02ewaT3bTYz7kf0ISUQl6hd6XIghLJ0jspxNafLF9rUpgRtrw5+ly15ClRYSGu3FNMkImQro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muVxvYW2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QctJEbvY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muVxvYW2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QctJEbvY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9XiY1639028
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 15:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xjME20aToxnhz3+QwdAGYRX2CsUKY1brED6ajTqF4qw=; b=muVxvYW2xOTh1Qh8
	0IdDOqxK6W9136XN64vhff6g/0bs3E5WZ9lhTvPtqZ9BimoTidDmlRD/NvyGoT3S
	1qcPEAIXiXhGOKfe7XvbARI/3pkEtQWTSSl15fBgK3eUFBAhy/FO43/KBuq65bEQ
	h0ma+KnYAykT7tgVNmHsAaFibQEW+Tz8y6RbaVtg3Enj9wUjiPId7Eo7aXGjBEmu
	V2ofuDssdH5LrFC1Na/Pc3DnVfQIH4SQDEb8/QxgohVkKIrRcxFIKfhG+PSwX40T
	oOelfBnKB1wT4yJCJKARkfXCWMiIjxPWSDbAWQaI9RAgW4CsuOkyLRQ6pr3VseK9
	Bdm8+g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsjmbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 15:24:53 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c676017194so1163e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788276292; x=1788881092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xjME20aToxnhz3+QwdAGYRX2CsUKY1brED6ajTqF4qw=;
        b=QctJEbvY81cOCnJ/Rf40Peetm5QAQmsYq+lqzVxjjlT6fnZfdiqbEVdc9xUbHy+l7A
         Rt/Kb01T7s+y++wN4lC+QtH4Yx7hqPc9475KWDeTWZp7HhQ97PrJaTsjn9mA6YRlQBPI
         Frtd5IaUNpwy0O69mtN/ZYOLYK5UILy37gKUSFhre7OVayvd3pWvZYk7pCsbnO3t+ST3
         pW+OqWsAPFp6ZKmMxmvtPnXQq0s+B7gub8LiKtzwn9U++wvc+WgZ8tgdFlTwajH1VUK3
         YXzSy2id86OySDDNUrUa+IFolA+SzV42HDYS9u8uNGK3JuKC2mThrysZh23CtGqRyPCY
         b3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276292; x=1788881092;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjME20aToxnhz3+QwdAGYRX2CsUKY1brED6ajTqF4qw=;
        b=XG8F4IePZPUvD1tLP6IjxX8E1BpXe+GYH/rL1XxMBYzpIfih0kXJSLizsRUgk2pF2C
         nh0nZW/Iuae3yOknmPyC7FwOY/Obz9iyPWFbk1lFGXw8xUhWvUMhcL9pZj4G39VJmeDy
         wcrv/Uf2Cxli48mpAyBXfGF//IRIlpRmw4RD4sYZFmoXdsffmS9hkOJtJM3PRtX643wH
         elenEX81D3McD0LS1CR5qk/hQyOPz/j9otXUY1kE7+uA7+cdXNgAW7v+u9maAwKGCbOQ
         PCQxi0GQ5wetmslS1Jnh23y+lIzqnT/WRqTZpI/s9n4ctmjShBnhiHT6zLqog0ZAR36d
         KCpQ==
X-Gm-Message-State: AFuF++lAeGOcZGQTJReFSiEREEToZRUiAXo/HDKt8vqbPQLDNbDhKyqq
	RLPWxsRrxkPnI9dRDfO6YRz1+FqtirefPZhKznx2o2odPJXADvo8wj4Z+xyMNsnoo+8JjBCPNSj
	dNLNURW+LewhniPplGt+nHIK6l60nRCFESC9aespqcBI7wpikNajHM8EQgJjM0sTxYg7P/erYRK
	dA
X-Gm-Gg: AR+sD13DvpMuI4onqYl4fYKKDz77FySHdoQGI3K72JemFE0Naeh52BH1DvEx55vv2Fa
	TSIkh6pRE4wvugSD4bDJ9p56yFeEnJHii/Prz6jRT20JLysfVpJl65AInyAzWHppU0NyTbysc5v
	r4wLXtUJv1U92HK8w6qFaQz6I43w7iiXQF75olk0w6uJz3JJGZh82RCHpnUEOAEA1yFRxfakUnH
	vAlob4EZQLt5I3SBV4m9STZgBYjUIsRuJsGCpO4ToZwmhpUi1QaZWRhFaz6jTOS9ExA82cvsbgR
	r4vOlniidFCGfLj58U/LvA8AMjjiO3UwWDKRflnA2xlk4XjhDT2k/sSQMMNpkOe7tx4AWtmk5V1
	0WWjDOgr3hU4qNEnKEag1Qw==
X-Received: by 2002:a05:6102:c16:b0:787:74cc:2b68 with SMTP id ada2fe7eead31-78774cc2e65mr3308967137.1.1788276292407;
        Tue, 01 Sep 2026 08:24:52 -0700 (PDT)
X-Received: by 2002:a05:6102:c16:b0:787:74cc:2b68 with SMTP id ada2fe7eead31-78774cc2e65mr3308951137.1.1788276291866;
        Tue, 01 Sep 2026 08:24:51 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34a8f03fasm294011fa.9.2026.09.01.08.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 08:24:50 -0700 (PDT)
Message-ID: <4d96c593-ff1b-48f7-9e33-ded415056f99@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:24:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: ipq6018: Flatten usb controller
 nodes
To: George Moussalem <george.moussalem@outlook.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-7-5c1f3170bbe9@outlook.com>
 <bfb0d840-fc9c-41a2-9b05-959f2222a298@oss.qualcomm.com>
 <SN7PR19MB67361579E71DBC197E21F44E9DAA2@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SN7PR19MB67361579E71DBC197E21F44E9DAA2@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzNiBTYWx0ZWRfX4cIJFcXoiChP
 KcXUVcigemdxWsCBF5qQkm2WuMuYocNEvEvFUIq4YWEZamXsWbQGS1JOHqtdgt/x2RYj5czlQIQ
 wmU8UfZErMTxYedP4FXTrwlnj+qlNtc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzNiBTYWx0ZWRfX3xSzLzoiDW8N
 /DNSRaJInrxapEShKSbMMzVEMCsX6empHdIAH/Ix8BaaFv6Fj6Rvwkt/YvGPQZKWxBx09kvIlwo
 PlkK/avwH+0cIl6OvkZM+Ix5pk8/rQhUvz2W9GVRnpIOjWNzww9UDC0EfY6NRIbo5BRYbKEbwCD
 vM3+OtRMwCVrCd1hue1Bq7w7in2NZoDMOX1toTc0s0pBhigcWo89XGW9Kb/8Bs1s8HpPkjegu3i
 H6pO/xzjmnSCO8oGJ+7Wkf3uhMY4aGETQD0wcll0R1Ua2Fc/KuWfRFWKFBJSD4RTWDnqLpS7pKo
 zq1oBztZ164olbh6CU4bmtKcnH0jbbfP66ZGU/eHbIkg3Y5kpHosUetKWUdjbIx/DofMtHd7Rhd
 gixXIYGSt/pkLlPembcmISI+7VD9XynoiK4SqGIDVifYiGe1heM8MKdEi3Ga5D+tysaSfSd0OH+
 ncYQ6Zn/f+b8pO1CnKw==
X-Proofpoint-GUID: Ej9K6CP4bnbaVB3ZkM0ab2H95jPLQaQq
X-Proofpoint-ORIG-GUID: Ej9K6CP4bnbaVB3ZkM0ab2H95jPLQaQq
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96ee45 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=TRAoSw-b2ojpbG_mUrMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010136

On 8/30/26 5:12 AM, George Moussalem wrote:
> On 8/29/26 20:48, Krishna Kurapati wrote:
>>
>>
>> On 8/25/2026 4:12 PM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> Flatten usb controller nodes and update to using latest bindings and
>>> flattened driver approach.

[...]

>>> +            tx-fifo-resize;
>>> +            snps,parkmode-disable-ss-quirk;
>>> +            snps,is-utmi-l1-suspend;
>>> +            snps,hird-threshold = /bits/ 8 <0x0>;
>>> +            snps,dis_u2_susphy_quirk;
>>> +            snps,dis_u3_susphy_quirk;
>>> +            dr_mode = "host";
>>
>> This controller is DRD capable. Please move this dr_mode property to DTS
>> file.
> 
> dr_mode was already there. Removing may break existing implementations
> and should require a separate patch.

"Yes" and "yes, please"

Konrad
