Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792614837;
	b=ulK6SiqTcB6PAzOAdAV41cxEpMzN0z54CaqeyQOPiXKlJKAMGpzeGmvJRDKb/Ge2Mj0s
	 DrFhlrp2mnqYVDzbjEaT6jPj0DVzrQgLIzfZFJl+tIHTgPC6mVsxiEkfxrIPmkjcWDjwL
	 /tTPP0rR7PEEdYP4X1YfpieOKdij0kYVfL5YFlSN3qLBDBbvl1EVZLX97l93BUePh00ML
	 W87tmbbt8d7yVGKUmOkO9lz8JmI+vhjWoH86RXBMImdQUjrt7f0RtQbYfVeC+8c4XdZJE
	 sx/OCsqyrF0atHsFhMwbJsINJmxu0Mvd2y2y61R2DB0dCwIQpKOrVCYLfzF++xH2qNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792614837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ych/Zf08x28o9LLrYkYPAjNwcDM5guKZUT1kj8rPdFI=;
	b=Rao+FTPU9Xy6o8khT9fsa4xfraniXa2RKB/fCs1c1muTBA0P/zHMCHzyaxgnlP5ml2cz
	 oY/yWLtHm+D51NuBnHZ7DgOLAFbOOdKgSRwTMLCzxhh+ecRIASRRZox5vBS0bDR+V335F
	 GJ9Zid5hnc7K7tKY0KYbrF+HEBqZ6cvHl817GKlvt7sb1hAEK4SzGtGBwXxUd68cpIy0m
	 B6MYcSefv8N34Z98RoDP2+T2hUEiNsblEy2R5oKrz9ZWGPH95hDF8z2h21eTC6LEKT4PG
	 LluB4hSSYo/OE+kiKcaO+rveddOCBUUG7nbAzW3Q6s7jbSmQ03AwMdfT90Enj4j4pEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1GCox7h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RdbjUuwk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7982606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7982606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1GCox7h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RdbjUuwk
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LHpHPv2415598
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ych/Zf08x28o9LLrYkYPAjNwcDM5guKZUT1kj8rPdFI=; b=P1GCox7hGAIm/O10
	RkUKDcUdwgBtJh5DEYYKv2HJLQFB7IZ6yjgwRq3u+8yogg44VxbugAedosyDvBlh
	f4S95RgA3DUHI3BYMv7lUVAdEqXn2SHk2nYSxleKRHWja2aLoVpu/KdGw0QSR7Rf
	OnBKGSwq00QT8XUJ6J0xPbGNMsXaeqMLzZ6+Zvs+FQOPrL8kq0bTv6Dz+oMKphns
	D+olk46YyJ4BJCqWT91yUwNmbtYbvU/n0vYB3TMWur7D+P7DlzZZy0Z8IrYZCtum
	XMyXmoU46tAriNOpJzKgExr02iNrdV7Hq5uP+NKf4fI6VFnmXruwzacR2w32ELJZ
	nO4BNQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhujfau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:33:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so253564985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792614835; x=1793219635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ych/Zf08x28o9LLrYkYPAjNwcDM5guKZUT1kj8rPdFI=;
        b=RdbjUuwkP68wlv3KlKj+BEX+ODK1v6F3OgVoh6qRfdlfBtdxLxZ1Mf8P5eNIMw0APU
         FrHq3xDtGpW5segmUAdyuaz6EkhK4kkofM3DKNfYrZ6acyY1smsiD4fBNK+BKfwasOQz
         4hm/dxmtvQGEbMh2jT9axYGXBuH/ZtWKBx6AqZaYgAx5ElB/ZCpkL3HOgdZh1R7IsmZG
         UsfcuELITGi/ag669QUeKeinfMx2r3MTUeRAM7yVl0ClCn8QZZzWdm3PdV39seKz+kUM
         UnaqWhfCFemxi6UDwzGvH1OTi7P9EVKMUcLRUXnG1ACZ4819wYJkKyW1VI5hRkgHQ9VG
         6rQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792614835; x=1793219635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ych/Zf08x28o9LLrYkYPAjNwcDM5guKZUT1kj8rPdFI=;
        b=MdyfI2SHEspKgRzb38N/PKRXTrJEEwY8KuRf/mIdl7+/kV+IvcC/Sx4DwifIDS8Irt
         Mq613lPQwgaq33GAhDBzG6UC/KCgkFH6A8Y8ktd45sCefcs8to/1IQPRQLjJfWa3Ocd/
         vqamRyfwcU3Ibgy9OM96UoiKfBbG4sq9nMwY4EdqUFNRd7RF61Y81CnF3VwWniGGFx8t
         WIJ9fuv36tkyualjmSH+J92MGzByujzJWcGyAZNN1ro5F+6Pqii8gSSEJpweBNqU1yG5
         0fGB0SAC6u07Qw1052KpJXX8kZzu4muff7w6uTfnJosm6E8sXyo5UHkrSYDg/OwD4GkP
         ZA/w==
X-Forwarded-Encrypted: i=1; AKwUvBxr/sZ2CAyVF0/WfpPGCoZOavhPWEah3RtznVJwlb49MoRjUZXar4jx8YOMH89svYqOIJeW4F05G2PnFNQ+@vger.kernel.org
X-Gm-Message-State: AFq9FYIdf7bnY24EFoa22mZqFD+59z2LUHhRLg6LDeQ4cEDorcA8bPpV
	9oHZGWnl4t5JjyzySNOdfFEC38YosdypvsD3JDPtNnwtuIi0IGFT3NS3xpeSnfiqAOgAABEtXQK
	xnZfgQvwSff3MPRB2ukfESdITLBMAVtWsmO6yq550xpXXnqASz1eDq054szszVV1rlYGa
X-Gm-Gg: AYBFou1UtH71szUgorjeRM4djGFPkQJpFvSHwdOVEGdlejeW2CroyIgL+IEhKeH8YWx
	bd2RAx8LbEvl74b6m6Njm3Zw+sEtccuAjhlzaM1Ju1OwZu8ow9gUO3kvVUqaGhX1VCzw6LBG9+v
	HkFjUd1oSWmFIvL5FN1Yi1rGDxkDyaF0q61ZRfCnK65V1TTeui2CMzF2mjCfCBrR04TmOMH9Nl9
	xVeK4kIAW1VHpj67JRwEljjN2ku2Tzed5K0CJXfL0phvA1nsH3xOV5uiIt+V9mPkDQpXTrohgwI
	Tt6IkkN4TXPPHslwV9KtnVWyPr/M7UVZ9MfXrExaPvh+D2G5Q7DT49U+vJY0Yo9/s0F6FkIBIxZ
	d3HF7sP/VWmaqJ9qU7I2uO589S5beq7SRai1/Hx+wVQUax2+sftD1Nbg4251htg==
X-Received: by 2002:a05:620a:6605:b0:93c:c98d:e1b6 with SMTP id af79cd13be357-93f57f9c47bmr614752785a.48.1792614834759;
        Wed, 21 Oct 2026 13:33:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6605:b0:93c:c98d:e1b6 with SMTP id af79cd13be357-93f57f9c47bmr614747785a.48.1792614834122;
        Wed, 21 Oct 2026 13:33:54 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3887:4025:a805:2ac9? ([2a05:6e02:1041:c10:3887:4025:a805:2ac9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254ef1bfsm8068153f8f.6.2026.10.21.13.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 13:33:53 -0700 (PDT)
Message-ID: <912b3de9-cb81-4d90-9d2c-9b99297e2645@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 22:33:52 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Stephan Gerhold <stephan.gerhold@linaro.org>, konradybcio@kernel.org
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        johannes.goede@oss.qualcomm.com, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
 <atH0oW5j9pxsTty4@linaro.org>
 <aca2cd5d-18e1-406d-a062-e219478b243c@oss.qualcomm.com>
 <ath8tHxHOdA7G-Bx@linaro.org>
 <2d885d41-7d05-458c-8364-e206dab12792@oss.qualcomm.com>
 <atjy8ZVUW61VBa26@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <atjy8ZVUW61VBa26@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad921b4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=DpSQHuFe0l2nUacwF_0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MSBTYWx0ZWRfX56AQ5GmEuLqr
 zLFaBanvAArQm2imd9vnNO/FUzJhzQNcXipjm6tA4tu5r2ymNFUbzB2rRlVRu0m5GSICTc2jKDV
 SPA7w5tDmtB23H07x8pUamJI5coalEA=
X-Proofpoint-GUID: dQR201htI2OTFX7KxL4QCa6mIik1Kvxv
X-Proofpoint-ORIG-GUID: dQR201htI2OTFX7KxL4QCa6mIik1Kvxv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MSBTYWx0ZWRfXwol4EUh81lA+
 +e8oqxW7oAnaZbCv6jyiajAK3ebJTKkdR09w1KHUEOj8by96wxYECju6tOPx3Y6fCoQ+vQ58Aps
 +gW8MrB99ZWyJK1trgSv3fDqAHp/RenPvBt6PQXzbITpVa322ncbdffLViisIhRH1XWGf1V8JLZ
 zd9JsDFXdp0ZNGk7WXXs1yLm2FZXKWLIoNi8Bm8NchaAFBzS1JChaoEBjrCuXE/QPmCCjXs9v7o
 VAoafJGOxOFP4KN8AiXXJpK9qQ0SXHpCiz2jRvzlnN3V8AP2IpvCR8Od1SPWT2lh81VkeGIjUDh
 h5D3sN2gSzsorOXFy92CjF2ffJhOU+UkgbRz2PCz54WefzThz3/zaIuSCvEuHRlgwx/3ErLy3rb
 NrSajfzHSH3+aHfCtzVqi4JyyxhiZqTFoY/hdjTDgZkix++oIASTdOcV0nx/UIdj80oWYG6c0tG
 6w2MS/Cv+UGYTmFCNxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210081

On 10/21/26 19:14, Stephan Gerhold wrote:
> On Wed, Oct 21, 2026 at 06:20:55PM +0200, Daniel Lezcano wrote:
>> On 10/21/26 10:49, Stephan Gerhold wrote:
>>> On Tue, Oct 20, 2026 at 06:08:56PM +0200, Daniel Lezcano wrote:
>>>>
>>>> Thanks Stephan for the additional information, that's very helpful.
>>>>
>>>> We currently have an urgent thermal issue on this platform, and getting this
>>>> thermal mitigation upstream is important to prevent overheating under
>>>> sustained workloads.
>>>>
>>>> Would it be acceptable to address the sensor naming and description
>>>> improvements in a follow-up patch, so that we can get the thermal protection
>>>> in place first?
>>>>
>>>> Of course, if any of these changes are critical for the correctness of the
>>>> thermal mitigation, we should address them now.
>>>>
>>>
>>> I have no intention to delay this patch. In fact, since I'm using the
>>> latest unmodified stable kernel on my T14s, I'm also suffering from
>>> these thermal issues. :-)
>>>
>>> On the other hand, we are at the beginning of the merge window and Bjorn
>>> is unlikely to queue patches until that ends. The changes that
>>> I suggested are purely cosmetic (the names of the thermal zones), there
>>> is no need to repeat the thermal validation. The throttling behavior
>>> will be identical no matter which name is used for the thermal zones.
>>>
>>> IMO we should use the remaining time until the merge window ends to
>>> correct the naming to avoid any confusion for people reading the patch
>>> once it lands.
>>
>> Ok, fair enough
>>
>> I propose the following names for the thermal zone:
>>
>>   dram-board-thermal
>>   gpu-board-thermal
>>   fan-board-thermal
>>   wwan-board-thermal
>>   chg-board-thermal
>>   cpu-board-thermal
>>   typec-board-thermal
>>
>> so we can capture with the name the ones related to the non-on-die sensors
>>
>> Sounds good ?
> 
> That works for me, I don't have a strong opinion about the naming (maybe
> @Konrad has?). I guess people reading this might mistakenly assume that
> these refer to separate "sub-boards" in the sense that there is a
> "mainboard", a "Type-C board", a "DRAM board", a "GPU board", etc.
> But I can't think of a better name either. :-)

Hmm, yes. That is a good a point

