Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CDA46D573
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 17:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787590819; cv=none; b=kfRGsqXnIFScGotczlPttw3eW7vlENrrph2CfBaklN4XXJufrndpRjoAwvHL+Srr/wtR+bmRxcP1KX6K7hcm9bxA5lJjc+t8l7q2s3Lzm67j5TQuJu4yiLTsh1PXNQmRVGyXX3EO+V8aYjgJ4D6LUo7GGObxrcSRf6MZ82YU1L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787590819; c=relaxed/simple;
	bh=x/KdzJwoa5zKxm6NKRxHEpBvqzGa7toXqXps2h0m+FM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UdDPziSI4ncDrF3jPMCbAVssVbkJX3Z6E4Kvh03vraEIfkbQXxGT6rKmYmRhjCaln472gHmUcJr1wpSAEly1tWLcw3xvIgDFXixdq6dtUOQhokMUSupfvDMjHNsHIxppPyi/QFP0/tUiHnDEXmXvbogDjR2rEk3XR++yVHIrNRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kp235+Tr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PB/XsJc1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kp235+Tr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PB/XsJc1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFncth3785227
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 17:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/PFBQEZw27Yxkqm/8BheVqymzKB2ikrlKjRCFFjz/i4=; b=Kp235+Tr10HCOUDw
	TcQJpm1Tm12Y3qg9XiTawDjjb/6V7gBSvJ6UZHw8dgfn3ilBN7GOlgPz5++Vnchj
	7O30j4rG/bKc6Ti1B1JQmj8jK0xGEu/slqrkQx+Z/LTCRREvNeQa6vpptO3SjKA8
	34kja9iGtGfyxcOhOaOK+2ceUC/aIpoGU8iUxHa9b/ejAmlx5gy76BNzXSYrKnL1
	02iPddG9v4jqBqmx9XZEJFu7peR7RHSdT4kI2MpWYBik6dG5sQqS1sh/Xrq8U5k5
	BHxuaJ/gSL6HtrRmU1VNjwcjfW+kH48Z5P5g7CDhRlMoPWQRe7gCt8i7/LNe8rGS
	6SjJeA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgtda4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 17:00:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso5276043a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787590815; x=1788195615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PFBQEZw27Yxkqm/8BheVqymzKB2ikrlKjRCFFjz/i4=;
        b=PB/XsJc1v0b636ux0OnGkHtWzrh+FAOAVlTJkW4XGBXN8yxdOvM1Gb/4Fe6lI0JBD1
         Ja4qUTufVQ1EUoZE6Qg+6azmhOYsGgtOwdzkmfA1Ju1tkbjTPcS/tQgpM5i65/xfd+7F
         76eFMlAwqE5Fuhk7LGQqJCWTynEUknWuj61EdVcSC6symcYAhWzOmU+ppJWsg3vaukYs
         HVg0cLGVFYWwxbsbHYd/YVyb6Ah6Pz30z4mAkNTCM5sZsIW4KcXLkRKWVanx6VLp5+o2
         y8HkUd1gwsMSgVdC/+y6y21xoJLaHnBclXIP/xZxT30q7yRDuFc8flMKcxk+Ko3xITDX
         /gSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787590815; x=1788195615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PFBQEZw27Yxkqm/8BheVqymzKB2ikrlKjRCFFjz/i4=;
        b=KX9yZKbXRjE3Tq5nPKjKj6U+g7U7plbdT0n6QoWYicO+HmFa/p1ufgCM28rLwQ/Sxx
         eRNF7GwZvoHAL/mXZ4gYsY5wO70YdMR8iPPSMMs3uuw2AV2iq08buCWNkO8CzFHao95H
         p1VyJCvsR+TsKrjoiAU6gsc6kzQMq7VEN7x1nysGezielTbawiXhJ9fGKSCY3y4/pAW7
         FC9RU9jKv147m8qf8EhXYe9dLmgtxETbHt4tWvlU6mIHxABeSRgGo8i39kclwtSND321
         e6CjdiM6qo16grpS9yLg/C7FW9Fm4FD3yG+dT91WwxHrQ1wecY3Q/N4rCv1W2Rxl47JI
         oSyg==
X-Forwarded-Encrypted: i=1; AHgh+RqqeUiGjCWtM40lkxIULcw3KXJRldi/y1Dm2M33A/anO5aLZLit+HLtNaDW6/H9eN/Pv0DaXC3N6YpyrcGN@vger.kernel.org
X-Gm-Message-State: AFuF++nWOOzKLpgBCEviuLS6KXZJrKyEpPleGLCwpekylqWiv/h/RU3j
	8tUbyR725aJQt1Nb0IW8vMwCayBbGNBavICZsieEFFg8y+uTocbUzJFP01Au+sPVISND2NVX57V
	OToVJGYsXhZMEvzpd/l0uI65vE9p0eKmZYQFHHtgTQazC92G0DTtDeg9rPrW4tkSqd84T
X-Gm-Gg: AR+sD13B6H+w80WxNccOGOYLBJ8oowOszb/JJHJmPCTcQqheaP5Kg8lVpUh8JHOJpJ9
	vAa54W+yfpS255ZBmxAouAlp0p6X8WdnBwpYPBfEbggCPoEhSxlD+74qgQSpVsi2DuNp/laYY/o
	bvimm6Lof4y5sqFf/BgvusM7PbrTgUXT4dEFzU3FwmQd0EOxRuAWI35OylXhL4STiPv3tN6WMmJ
	vjnhrsnoPJi9X6MadC+gn7ZzGEs+rzDFNqo9AzKl+WMhmPTP0TXKPiKMyAodY64Bl6po9yjUgTo
	GMVyYmgPnc8dW3RNSsU/tkIumS1AXStwIN1+1FejwcQEuqx9AYEt1Afpup8+6bSEtftTJuy//p6
	1FqLu9fBB0Pn9qnkQq6n5TB+TOb4Tbw==
X-Received: by 2002:a17:90b:4b0a:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-396462ff21fmr510440a91.1.1787590815378;
        Mon, 24 Aug 2026 10:00:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0a:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-396462ff21fmr510221a91.1.1787590814598;
        Mon, 24 Aug 2026 10:00:14 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.106.1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860fe08csm41584554c88.8.2026.08.24.10.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 10:00:14 -0700 (PDT)
Message-ID: <52ed6e1d-57a3-49e2-91df-0886b416282b@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 22:30:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] soc: qcom: geni-se: Add helper to set SE clock rate
 via OPP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-3-61171ab1cdce@oss.qualcomm.com>
 <5d2504be-0691-4174-9d98-7759205718cd@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <5d2504be-0691-4174-9d98-7759205718cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE0MyBTYWx0ZWRfXwr9EdTbAKz0n
 DayzMAVGgU+Xq1POl+pbKyAlgaklcWuiYGzC16JGqpb7knlg9PZ9yWH2++HO/GRZzJNIuApu9Au
 lzF+HlKMoPwaR5WBRm3lIBoFjL527xc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE0MyBTYWx0ZWRfX9sSspmL1jSWd
 CjtYo3sYqIE3Fsi8eOgQ9f4AN9LzuGW1Yj8ShbV7Dsr7/YOdBCd/79Y4+lKKs+GtBOrkxinqFVY
 aVRdJ1ih2ZSu8ngH7vCt6Q+NbFFqdekwgiqOFZpvMQFNCtJdp2kt89gDm+ARCjNg8ojTdqNNKE5
 KCSdMpdUipa0MARR0Gy6l2hsxmAgzS0S3lpqYIfNTM4O6ks4jNEhF0THw36jqtbIE72ffRJEtOQ
 1TPc+UFSGHHP5WF1dPMMV1f3AFBMBs25/+XBDJ2WBNEqc780wzKuODxygatHbkevgjOFWrR4FKX
 D6AtGqGrddImYltdqS5PPKtY0dv/j9EAJPNhJy4VANB9TC5/JjCBKBnj4L6Q1EBS7mp8FCaAWqH
 QtGEN8zgBLMQjraeKMrNrvffLu8BKLbGwrnlXjNkjFiad0jfHz6AO6yotrw0PhEWy007TLtHIJq
 f0lSiUPtDmA6OxCjMWg==
X-Proofpoint-ORIG-GUID: VgtTZVRt-E4h-d5VRSkiCQqmU5IJ5NS7
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c78a0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=3DKySdf3VQHjbkfL60kt6A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=k7YlSEv--4VGoxf32YcA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: VgtTZVRt-E4h-d5VRSkiCQqmU5IJ5NS7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240143


On 24-08-2026 20:28, Konrad Dybcio wrote:
> On 8/4/26 9:57 PM, Praveen Talari wrote:
>> GENI protocol drivers need a common way to scale the SE source clock
>> through the OPP framework. However, the device that owns the OPP table
>> differs depending on how the SE resources are managed. For Linux clock
>> managed platforms, the OPP table is associated with the SE device,
>> whereas on firmware-managed platforms it is associated with the
>> performance power-domain device. This requires protocol drivers to be
>> aware of the underlying resource management model when requesting
>> frequency changes.
> [...]
>
>> +/**
>> + * geni_se_set_rate() - Set the SE source clock rate via the OPP framework.
>> + * @se: Pointer to the struct geni_se instance.
>> + * @freq: The source clock frequency to set.
>> + *
>> + * Applies the given frequency through dev_pm_opp_set_rate(), targeting the
>> + * perf domain device when the SE has power domains attached (firmware
>> + * managed path), or se->dev otherwise (Linux clock managed path).
>> + *
>> + * Return: 0 on success, or a negative error code on failure.
>> + */
>> +int geni_se_set_rate(struct geni_se *se, unsigned long freq)
>> +{
>> +	struct device *perf_dev = se->dev;
>> +
>> +	if (se->pd_list && se->pd_list->pd_devs[DOMAIN_IDX_PERF])
> The latter will always be true if the former is

Sure. I'll simplify the condition to just check se->pd_list.

Thanks,

Praveen Talari

>
> Konrad
>
>> +		perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
>> +
>> +	return se->has_opp ? dev_pm_opp_set_rate(perf_dev, freq) : 0;
