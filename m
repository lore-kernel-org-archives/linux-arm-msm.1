Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F70051A15F
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166652; cv=none; b=VqUrBrlD0E4WAINwiAJ1AkDjQ20ng0JI5b/YtOiiXnVS13rWJT1R2CQpa0xMDkAE0+kLIweWWEX3cdVywSIkgN7p0IfcPbd4HErghPyPaWEoowYsXMYRPlME5JVu1Uhm45syJ6vo0g49kiGd/h0jra3oZOapI8dbB51iXAD/q2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166652; c=relaxed/simple;
	bh=P2KMjpECG8nbDMf/4txi0vvfgQ4Eaw95S46ULcI2wFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQDdwZrFHBUaOWiVOP3ZTvrOz82i7Le0hg7xALXOXBRrDq+aqngC7ucZXYzhgsBeVq8nLGHAsIRmmEAc/pFFVCfzn3/yaOVETflpnOmvsQ+pwjWNcgy7KIVDgmnctuCJci10Xstjig+uhHD2ttegt9mpNToAaccexULOygGmCBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=URbtABXv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfQrf2aK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="URbtABXv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfQrf2aK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbXAD3616458
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P2KMjpECG8nbDMf/4txi0vvfgQ4Eaw95S46ULcI2wFM=; b=URbtABXvmexx3sbp
	0Iq8Qy7UnglB1B1wqM08d+rIFKiY/wGdbmVLlMafKrfnaaR103Mx0gVDYPhatMGY
	LAtfStdAycxXjyqnMTkjUgZq+1KUiJkfnAFPJh5PI7fiGW7fld8OXsVELQze2HLE
	T5DLSPQMek4d2AW4JLxccKdoClCBgWGZYrW+Kkjnj+YJDrupl/EeA48rRZ5TSz9e
	iHzg50j+Q8+QPRFzbUVr4M7BEyvIr1qrlVtW9lFn5ODzjBt72CZ9Z7saMZIrqp5G
	DjOahZ/LyT0VZ+7oWmViwHt9i80mREtW9PocNnUvVdZknwKVQIQBKFyXEvJ5roEK
	HIUipg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux864brs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:30:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db87f759c5so8489535ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 05:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790166649; x=1790771449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P2KMjpECG8nbDMf/4txi0vvfgQ4Eaw95S46ULcI2wFM=;
        b=gfQrf2aKR3kDN5r2KnnbeqLYm5S8FTpB2VeBr1gamyolpjUeeUuC0WsVlexrWCiYFe
         zrmfsg9YXJ7nm53MrD/QlxvGtVQjQBKjA/W8tY9Lf47ohevnxQHfw8YueVlMdP0LsTlp
         dhf/cn9oRPJMvaxD/JTqrGtXbOF+JVrggM8AcEBe5TS92UefbyZhDdxeN38ih53NiNCZ
         tkrsrMPueUBxAXsNwaa/efplHhMSMqRkE8EelAx45cuQ4z16y3qMmcHHiXuRC6NxzWu1
         QMAeD4fZna43PSP4fHoqnKnP7C9/Ck9JE2Lkq2dXIkrYJkiXYdyFhkNZ8xEfySJSHZ7w
         616w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166649; x=1790771449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2KMjpECG8nbDMf/4txi0vvfgQ4Eaw95S46ULcI2wFM=;
        b=fFjIgMUulQh2v+TtE9XP35EAezZQpyPdAKpkM9EnxPFCzuEXy1ngSL/08PHFvn/Scu
         2rby/c8SM8kHGeuc0nsgx6m5SuhWCq+m1EV3pc5DMDUtAt1HiR2BI4fXgLQavnDJR9LS
         d4QkOWJ9Nm45hLWw1nxr3W85lqSiOiED7DjgeR5yQFE0APqrpAFaEV5pFw73ZeMvxLC8
         OvUuOaHI2qRcneth9bdiuOK3RNlgkpJHIOFFxD4yl3e2lXs91TMPjqgm+y+am6a6gzQB
         suK6SoAyDwXQ0SNclLQzKZXwUEPyaLhPCCo2igFcAIDMjSGO19ewosZz7T3TVFUgSTwV
         Ym5A==
X-Gm-Message-State: AFuF++mAi4e2od+yTjGi1+yzGCt+ALfSmiyB1ESRZbhChd7khNz3ZLco
	XM2r7630e1AJDunR/z5apeZpBapKosPgAyM8Yi2ShaPkQonEWy4AhTAmQt+LNCW/xcwtCYgC3N8
	cO45tDSTcYQxngKsIfYHCGm/FEhmBZngZTM4fyr83WWgYRTsQ948Ge7gMkmS0Xn4u1xGc
X-Gm-Gg: AYBFou1Zgu94acsIqONzoOSTRhaYZ5g+R/apzB+WqLReJXp2FE0Zp0plQfrjNpkKWg+
	PLFJPpfnnNu218J/xxwaquILPgucNqI/T0uY65ABNRNOHs5JpXr6hfYrN7pfrG18ADc/9KdsLl2
	1V85BDnkJTTO4TMbchmjAJCImwAulGgLjhz3L10YkcCKa0xX7OCsBB3u83m+r0uRiVRsKDPT5a4
	KZ/RcUTigN4CEiZ7LdcvAxU9l4v0bJ+yZIrab2D7qSE1y1DI87M6A/P7r0WLDFgrm6/i+JuLPxm
	75ZDc6f6qDvTIiaj5mWeCOeDn3XtcpUwHsw1bescvqTMjnYNA6bcZXtaBl6ylf0d7hKWMFamF2X
	iR0pYBNoRF7boFgosniItrUxOmzTKv8Lm
X-Received: by 2002:a17:903:46c7:b0:2dd:ad74:6d12 with SMTP id d9443c01a7336-2df69d6bb3amr23165245ad.24.1790166649082;
        Wed, 23 Sep 2026 05:30:49 -0700 (PDT)
X-Received: by 2002:a17:903:46c7:b0:2dd:ad74:6d12 with SMTP id d9443c01a7336-2df69d6bb3amr23164885ad.24.1790166648501;
        Wed, 23 Sep 2026 05:30:48 -0700 (PDT)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a69f7sm9548575ad.16.2026.09.23.05.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:30:48 -0700 (PDT)
Message-ID: <91ef0d74-2168-4bf1-b390-98d3963db672@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 18:00:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] phy: qcom: qmp-pcie: Add endpoint PHY configuration
 for QCS8300
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
 <20260921-monaco_ep-v1-3-63c5282fb0db@oss.qualcomm.com>
 <07ad0b0e-f666-44f7-b5a2-bf9ad016b297@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <07ad0b0e-f666-44f7-b5a2-bf9ad016b297@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9C_ieExw5LRY_EB9rmWjrqo7oY9t4qTm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfX0DJ15zCK2jKm
 uz1v8GCOq69TURprG6dJ/muaDBejvTMlz9O3rl/fHzYxZqHjoGrrBsUNVHI29Ti8p836u/zDIvm
 QWEYF976vg0Sz5ih1bmJQGeOha3Tef8=
X-Proofpoint-ORIG-GUID: 9C_ieExw5LRY_EB9rmWjrqo7oY9t4qTm
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab3c67a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Rbhxv05cawg-pCmlirwA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfX6yZrHgtl8h6G
 4oFoenpfShZDwU8OXGJ+znk66cpY5ZbFBrZ5P8SW7bILU+XH6Mp2+isQ+3t3pcU7dIcdgjiGpN6
 vL3pV69o3Y8ozeakXC8jodfHLC5ClXmALX2jbR4qtWk1lmHkB4PJFgiZHk7i4jUgn55qOrItCeE
 3zx/hwlP2PoOaDsI1JzlXiALUlAo81mfv4QOil3QJdyHJH0bJoWHnnmfS4OuUvDm7m3yNbOTgBp
 ClnTGVZelkh9OdXEd/BhOkJ+IQXzpqLdhvgLpzFS8RmnrqanSMkh4xbKbK56xYDiGNIuuuDWe/i
 ZvLF1d08zxIukNy+zgey4V18M7tUrG2SMcNZ8LNJI4uzAlo/33mnCMBtUhVI2isWIGIiAj1geH6
 4yePkr6DWa2pD/pBrttl6Mobq+ANNR+8nA0OLfEmqyqEoKkHlS35qL7ylWtqlCKcygZOAf228oo
 Y6iefyuqgFTmB3oqHCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230049



On 9/23/2026 5:49 PM, Konrad Dybcio wrote:
> On 9/21/26 12:58 PM, Krishna Chaitanya Chundru wrote:
>> Monaco supports PCIe Endpoint mode on both PCIe controllers. Reuse
>> the existing SA8775P Endpoint PHY programming for the 16 GT/s x2 PHY and
>> add a new 16 GT/s x4 Endpoint PHY configuration with the required RX
>> tuning parameters.
>>
>> This allows both Monaco PCIe controllers to operate reliably in
>> Endpoint mode.
> Does that also apply to lemans?
Lemans and monaco EP phy settings are differing.

- Krishna Chaitanya.
>
> Konrad

