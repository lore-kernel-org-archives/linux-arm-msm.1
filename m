Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10AD40D57D
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 12:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784549257; cv=none; b=SWShuw2pEEyD+bqUNyVs7CR2nM+Chd1pedwefkfwy0TUXtTlZQV2hirltxemElvHOXk+x2qcyWF/+APFpWRMZFE3CuK18Y+cHiau0ZMVrxvj87fV5+pfwyGS6VnOdOax4m7YfTVK+bjisya8djFYMCfC23DFOqxedqTYydwJDZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784549257; c=relaxed/simple;
	bh=3LskwaJt3gSEnF5JMMS9r1mC+PR+I4B+DXgOi0/4Wio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mSscPkIznpfG7t36XDyTAI1NF6zavwVotQdR1/uqd//bSRUSXI5Q/Ts1t2oOofjZCUzdvF9zd3rQlBD46ACKv8HpXjvjVwU3ZAHFYBdCLD4MMO4UDBdP7Nq4shWsRodvdXFIPM4JQeWYt8pBhhgIygZkXvrSIjULTiErhkUTb5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jhzf6LBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=faNA8YJI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jhzf6LBq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="faNA8YJI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAvSWF2421638
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 12:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/kl2WXycavBl/r+S0QQtS641iykNoKyZyvG2zsIuek4=; b=jhzf6LBqrfs64pby
	Ud9I7njR4JN5gwJxTSRBmmXhxHgap+h/VRvnW9yK79HYJ0V08jJQI7p/jiRsZqo5
	YTCYbYlJaRDzheEuBwpxfmUmDiy5/fh1bXwGeqnZ2y6lrRxxutAOWgkQOtfplQn0
	IQytk7JS3xhKs6dGcVi71BGt4HRG1+bgiPQ/YR11ny7rsLxri9Hm5Y9T2xWWBBta
	gvT5vnLrfD+gNtDu26OeNFyUOjEItq3g38XyIM4v6zR54WNNCGBAhMx+LBYkVwpn
	jGumCEyhA3JRjX16IT5pa6HD3HclC41D8pve2x42ZC6PxAB+hr67pPWGdDUf7GgX
	88FukA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxh2g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 12:07:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8488ac68185so18479875b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 05:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784549251; x=1785154051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/kl2WXycavBl/r+S0QQtS641iykNoKyZyvG2zsIuek4=;
        b=faNA8YJIq35JDYbaW6Xl6PKPs3s2jZk4PVVRcZI1gG+mkLrpfySznl3LRnZuHF+8QR
         Uumkov2Rh4+c9DogJjvHQy7NyRvjkIHbJkI6KGk+aByjL6eD3fXpdFp9SkXlZvCrA4C7
         gDxF64qQW/ey2Yr06dULCoEsADUdpFk+RR1rpLW9ejhGRURELS4woQDDruzoZBPvUZaD
         DQys/KA9Zm6XzTKhb0xZ2eImvM+xcgDrW81Kr+hTi4oiQ8ZfPM5h+eTJoaZQ4bU94VyH
         DQ4aXx5aVMemCJn63in+aY+aQ377Xvk3HNVnbwtaMDjSGzLbXUM9yIWZIODW7POMj7PM
         ISSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784549251; x=1785154051;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/kl2WXycavBl/r+S0QQtS641iykNoKyZyvG2zsIuek4=;
        b=RdIdqxtmPr8BYg4S/aWV48Pp6bi7uOW8vFKWQXBeqRkTmwBje+lkHLhqVscUCpRRzr
         qsq72evpuqNV3TfrvwXNtqVQ+09XBwCHiuV1sSHsYDcw+fFBKWNZQt737EQkC6im8j3G
         Pw2Mzo5rtwL0HBRKPz/vT67+AwlbYxO9qiNEj6VmoFgMv8DiZImo/bm3/hrTFLafqIby
         X2R1Erg48qVvsrTv/chjMUg520w6ewNL0fifkp8X8sevu53h9f9gbLp6yKRXzCt7XNGK
         ofkR9HfjOIQ488bNlGGZscYbQGzAUsCTJiAFO88Vze1daE+zBoj4YRYtxZ7OCrMSSjUv
         KG6A==
X-Forwarded-Encrypted: i=1; AHgh+Rpt9rcL1zj/eqsC9aSoT7DmsPIqcuKDQBtCO8rdGmXvgmlNZTwM7Wbj6Nti9u/fSLMwuZM3bwU2TB8VEDEN@vger.kernel.org
X-Gm-Message-State: AOJu0YyuRWzHLqtoA2HXS+eoti+Z4pCi6KdljFhBI7ZKvKDdsbhOTOV4
	0f6DIuc/clE8Fj4RXFw6Z/uXPY7dJwWgZ0D+pDp8sY2ZriXSDC+MBglx7QHflkgpb/5vAKpYx3C
	z73nnLSsnO5DpTrnkE065a1Va1rKS1iP5eY+zFlxq891NeKdMblXbYrUbiDmKMOSnLO30
X-Gm-Gg: AfdE7ck/NryyD5RthormtJtiWa38qcyQ2BeNHzupc8+wPQANAuc8oYRmDeJX7tD+538
	l28fQuvYyLxv9uWehlVix8HsaDI/0MmYfxA83q5ginJ8JChPQ0o41RC8u5JJRAitlg6Fx3Gq75g
	x8/IFA4PhwuWlgp+uEG/mxhRI1hE6sKxoVQkNXZKC8G3X4mqWFw69UDkEwlLF6YL4eVqN8yLw86
	QL7B9JE1n7YEBeRBVBkdCZwzkKXXrLuefnucRan07jQe+ENUqKHH7TlwdKYpBeXvqT7wgJKpyVn
	CY87XIzzkSaixyTpTz3LtQ8co2gEKch+Wi1TSm3tYsE3PKwosZ6bQq/PzIwep9bUXMkXBY3bbrt
	PMX+uun/vO41sKD+mqqNf/yA7mzFHfg==
X-Received: by 2002:a05:6a00:418f:b0:848:75a1:a0fa with SMTP id d2e1a72fcca58-84c294ca1d9mr12215371b3a.67.1784549250759;
        Mon, 20 Jul 2026 05:07:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:418f:b0:848:75a1:a0fa with SMTP id d2e1a72fcca58-84c294ca1d9mr12215329b3a.67.1784549250309;
        Mon, 20 Jul 2026 05:07:30 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c3793ec61sm4276969b3a.42.2026.07.20.05.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 05:07:29 -0700 (PDT)
Message-ID: <6c89ef9d-3551-4b92-904c-316dbcffcfbd@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 17:37:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
 <h37rmadj4yallpbm3n4vehm2rcflocwen65jacg7kd3zmpo6hu@ohjpgawid6jf>
 <4efaa8d7-56c8-4581-a161-51abb319bdcf@oss.qualcomm.com>
 <fa5bf9e0-66ec-4506-a2fa-bf1d95adf9a6@oss.qualcomm.com>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <fa5bf9e0-66ec-4506-a2fa-bf1d95adf9a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5e0f83 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=U5k8SXBAhPj4dsil1kcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEzNSBTYWx0ZWRfX768UrMdAohjV
 cJoXfBi45YTa0igEijIpxHu/1ZGHxGSnseKnVV7SK7OXAut7WdAZKrxXazgslRUGSqWFM1ym29A
 FQpmN5aFWL8farfuJT7+3yc/LI9Fas4=
X-Proofpoint-GUID: YDlMBgtiy4cyqufKogvRtyyDVgVE-w-C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEzNSBTYWx0ZWRfX0YEDQcGnzLgo
 IcNnhWVPDdvURdtiqyCTCwC03U7Aq1KkNSmJIu1hSeTqJdYdQuX8py8Aa+O6kr27f9A0A4vx2cX
 qQq2RM+XRTm5afH/sHQV2BthecHHPDncbCFFuk2nARxL0QsaBKe9YZYqbQOjGCbDuo6dfjb0I9W
 ThyrILSrz6GkW01GYrNGGTdKBEd5BxdmI1KgKRL34tRoqcFhnITe2gxq1lmv2X8poPcxirgg55Q
 9sqld3upNSi1zy+L1mhhrn4uxp7aM+wwCgb9O6plRC1Hbg2uniX3lPBX45GyiB3YAPPI4dJmtLu
 uw5fUXuJzNNTnigbPFkEC0TnOiKWblNewPF1R6PLBKtB+02EgOXiX4t3THXVyyWF3So7lQUz2fy
 MJkMFnRZ3ZDf2JUX0JG7GnofGxCq668xxFCaiVtwz/q2+sEZnSkfsno8ks4lNr3hLIl7IeKxq2n
 KWa6dSW62eMZhT0VTng==
X-Proofpoint-ORIG-GUID: YDlMBgtiy4cyqufKogvRtyyDVgVE-w-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200135

Hi Konrad,

On 7/16/2026 11:21 PM, Konrad Dybcio wrote:
> On 7/14/26 9:21 AM, Arpit Saini wrote:
>> Hi Dmitry,Konrad
>>
>> On 7/10/2026 6:09 PM, Dmitry Baryshkov wrote:
>>> On Fri, Jul 10, 2026 at 05:28:04PM +0530, Arpit Saini wrote:
>>>> Hi Konrad,
>>>>
>>>> On 7/10/2026 2:31 PM, Arpit Saini wrote:
> 
> [...]
> 
>>>> Normally the backlight EN pin is controlled by a backlight driver.
>>>>
>>>> However, this panel uses MIPI DCS based backlight control with no
>>>>
>>>> separate backlight driver. Since there is no driver to assert gpio91,
>>>>
>>>> we control it via the panel's pinctrl default state..
>>>>
>>>> So this is platform specific pin , we need this to enable/disable
>>>>
>>>> the backlight.
>>>
>>> Handle it from the panel driver. Also please fix your editor to prevent
>>> it from inserting extra empty lines.
>>>
>>
>> Earlier I handled it through panel driver, but this GPIO is specific to our
>> Qualcomm Daughter Card, it is not going to the panel connector.
> 
> So is it an enable pin of a voltage regulator maybe? I'm having trouble
> understanding how this is all tied together, given the panel driver
> uses DCS commands to control the backlight status
> 
> Konrad

No, it is not a voltage regulator enable.
GPIO91 (WLED_P1_EN) is the enable pin of the WLED driver IC on the Qualcomm daughter card.
The WLED driver is a boost LED driver that powers the backlight LEDs.
The backlight control works in two parts:

1. GPIO91 must be asserted to enable the WLED driver IC itself.
2. The panel's CABC output (a PWM signal) is connected to the WLED driver's PWM input
and controls the actual brightness.
This CABC output is driven by the DCS set_display_brightness command sent from the panel driver.

So the DCS commands control brightness via the panel's PWM/CABC output,
but the WLED driver IC needs to be enabled first via GPIO91.

Since GPIO91 is on the Qualcomm daughter card and not on the panel connector.

Dmitry suggested , it is not appropriate to model it in the panel binding.
The current approach of asserting it via pinctrl default state in the board DTS keeps it board-specific.

If you have a better suggestion for modelling this, I'm happy to follow your guidance.

SoC (ITP Baseband Card)
 ├── GPIO91 (WLED_P1_EN) ─────────────────────────────────────┐
 │                                                            │
 └── DSI ──────────────────────────────────────────────────┐  │
                                                           │  │
┌──────────────────────────────────────────────────────────┼──┼──────────────────────────────────┐
│ Qualcomm Display Daughter Card                           │  │                                  │
│                                                          │  │                                  │
│  ┌─────────────────────────────────┐                     │  │   ┌──────────────────────┐       │
│  │  DLC DLC0697 Panel (ILI7807S)   │◄────────────────────┘  │   │  WLED Driver IC      │       │
│  │                                 │                        |   │                      │       │
│  │  DCS set_display_brightness()   │                        └──►│  EN                  │       │
│  │        │                        │                            │                      │       │
│  │        ▼                        │                            │                      │       │
│  │  CABC output ───────────────────┼───────────────────────────►│  PWM                 │       │
│  │                                 │                            │                      │       │
│  │                                 │                            │  LED outputs ────────┼──► Backlight LEDs
│  └─────────────────────────────────┘                            └──────────────────────┘       │
│                                                                                                │
└────────────────────────────────────────────────────────────────────────────────────────────────┘

Thanks,
Arpit

