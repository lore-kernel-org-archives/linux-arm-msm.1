Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100088;
	b=otYOXcDcYLFEePxVa19k9m2kh4ehQBwStSmG7+xGst6p0/iaOFEOQsyhQ2USQSNjh5zt
	 FYivh2b0RPzCpgJp7THOs35surLP5lJCg/m0sFzKC7Nw1Pxsls9GS+hAlzIkX08EZh1k2
	 RagC3zP3ZEW1nUrMweb8oiVpd47OoVJ6a4PDsAS1LNpglN0Rfg7QayRRcjjI1MoUQZK5T
	 FdROqqxuxxokKO3gCbLAc9kgM+o9X4ov6gDHGz1TFXHc7e0XMiS5hrHigVQdUBkLLYfmj
	 fWfF1bPmNdmtvZyo4ZZ2H7hjPV8SeA4eC/lX3oshA6MhPL3KVGeF2YQtXG9KW9nxVrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FxapVRMKpDEsmmZXHetp6RGC0wXUKkGAJ98ScQHvhUE=;
	b=swty1lgi5s5tTSbkBkSTuPp/IDpmnh0UHy9HnragzVa0ActO0tDPFiH8n192aAoryK3U
	 /4IG7d6FEZnahWOnlbLwkRrLcnfs01lm87wYrutfwyMghl+u7wcNc3KOTaPs3fxr5yR8d
	 /hDa+CaQLHTREmnLATfZ/rXeQ8rs1psmPoBGtSabdeder2Iq0XTTWJrttBHLo1X+HzPEz
	 92VuQc16BN01ArZzEYPpx7eFqjbXA+sy+f1VQU6iWxtf7MmcN3nn7vFaO0eN+cXBGfWsY
	 NbEQ7xxLSe/HTEoR9n90B3FQ4NBAtYSbVtH4T3/Gvt4ZXlhyzKwAEyNX7kY1P9oXgwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTm+q2if;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZRlnZO2G;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25F2606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A25F2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTm+q2if;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZRlnZO2G
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdv9p2523902
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FxapVRMKpDEsmmZXHetp6RGC0wXUKkGAJ98ScQHvhUE=; b=cTm+q2ifSDhFLe38
	o5RQrj2a7BeytWINEZrGxgVix/c9KLH0ChWmpYI1ZVcfBpQfui1+Ojr1QOVeFB5F
	tKfb37U+IoqhxwoXDsT2tyPxlK6eg/6cgwTUsNLKJCeTrz+2YntAq4Xy/9oANJI2
	OpnNlENmOmxJ9/6AQDoXZIKBfAtutNJj34ogYSpqtoP2TNQKSpeFBpg1C7lzLgjK
	6koiyGGzPcII5dwagV2WQeieCMPgx4Ka3CDIWse/6SnKoDb5seuoc6zff5WjlMIM
	LqYqaD6KEf2dgBMTW2VtmBpADBVAU9Wzi7Dl4hGUh+JKGac41qcD+LHuktvhRiVL
	VQdl8Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw20t73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:21:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53568f05f8bso12957791cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100086; x=1793704886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FxapVRMKpDEsmmZXHetp6RGC0wXUKkGAJ98ScQHvhUE=;
        b=ZRlnZO2G8o++1Pw68odli4RtmINIpboM5Ab10jMnEtkJ8FPuO2B9vq2DO+N6cdPhgx
         d1Uld7atEk2VpaPfwTE6yEsfscDLulZngmp8nkyxgMlS8zymj1Zjr+t7uKf1WtKh6+q5
         qBLXnWlGFRWh59rgxImgmsIMsB6RlY6G+4euubjs3wothqiFaTDNeElqw1oe5b7LUPn9
         RNr6JfSqg43KKWZB0IVZWe56jxXP/INm7iechKS2FRIPiW2gTriT7m0xoHXaLKo4ipi4
         Z1owamNkEp/24MdFd1UC6t3I6WMqDcnXEiKHvUCFdRlY1k4kMwKl8h3ANYbbIAH6PPnV
         UbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100086; x=1793704886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FxapVRMKpDEsmmZXHetp6RGC0wXUKkGAJ98ScQHvhUE=;
        b=j60d+KglFRVHreA1ztVinDA89y/cwWFbIu/K8WAIeVOApsZSMJqCJIuAKKMzWiQjmv
         neBOdXfnklGMNVZwy8xEBpIXxtc5SWGaP7e8hgRhSRHgyM/UT68Rzoe2aoUg2aoaHt65
         6AN2F7XmKySq5/HY7xhEh+Wjw7VZIOhHdR1fFDWClVjj7COJLdR/2V2za1pnkHfVagmz
         d3xIC55VKSuDn7aVa7ANiWZdsp7XBwQQwVo9zjNdsyGBRwe6JcCcOlPnhbaWCGCKAlM7
         iVsVLTCqCVuMrB1sIQ3b6tvCX3HvvdLYbQWe9xGpb9gPYnCDLO4PaasBrVLZYxZSTeH+
         oHPQ==
X-Forwarded-Encrypted: i=1; AKwUvByXxGS/KXxkPg/pTQEZf4RsppoZkgJ4tkor2Qkn70F8T1RMKqmCNqLUj9hhCKiCOKNYQaKHAya4bifwaJtn@vger.kernel.org
X-Gm-Message-State: AFq9FYKKXSs5F3p28FnRifz8dqhr5RIaJkmygw1KNJt3si2/g76wQFSD
	i8GdM/RIIvE8TEMBAByiUUPt0Cek+Q1AmlGEHl1ND2zMJLAIdVdVcHzpAMSSLsrFbCQRgIQAthU
	3dVY2i1LB3w3SxxVOb+K9qyqhJXqFzoQiZ41yzXx2Kmc32txzVdeg+UopyZf6CpsZOd35
X-Gm-Gg: AYBFou2hrmZTscdXStKZWNnOZI5k910/W4kqeOyELwTmYr8Vij4UlNa4ULkfN3hf8Fm
	4wL16vvtvSG6n9gyfXkvwlQgVX8NIte9iY9z+CJRzDkRUSCkLNaSjodBNwHUbs/sEeAzVuSwtGw
	idwd7NOidkL5doLsxuHHygGXZxjODXaQrliX3bixUdhv9ZmTg4vGpf1KdEJarTmFjnRbNkyNohN
	bSU1q5zLwcRL7XEJn2jecTLADoNAWRUDK7idXodiXJtMC27yiVV/Y4coNXbQbUNelNK5sA/PSsm
	AULsSCM7bjFjYnZWcO0JZ9s1TjLhqCfJ6soMobFGViNGodLyB58PcRXxPVpAlUhZiwq2whCVk9f
	hFwZ+vDLVLc2OjlIYQoIAtg==
X-Received: by 2002:a05:620a:8703:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-940ef672271mr1462774785a.0.1793100085800;
        Tue, 27 Oct 2026 04:21:25 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-940ef672271mr1462769585a.0.1793100085311;
        Tue, 27 Oct 2026 04:21:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a4e208d1sm118196666b.85.2026.10.27.04.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:21:24 -0700 (PDT)
Message-ID: <44dc3838-63f9-4718-9aa5-aaac223a81f1@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:21:21 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
To: Manivannan Sadhasivam <mani@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <0303224f-4c2c-46ec-9866-5ea1fd0fb4a3@oss.qualcomm.com>
 <20260825092715.5794-1-wei.deng@oss.qualcomm.com>
 <isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24>
 <83b67ab2-ab68-427a-94aa-881454f457ba@oss.qualcomm.com>
 <CAFEp6-2KDxDrfTZLN7KPRg=aavj8nqQr7ftna23n9C1Cpbwwbg@mail.gmail.com>
 <e26f0360-aaed-4e40-b1b2-956c92d34db5@oss.qualcomm.com>
 <CAFEp6-0b15kV6ehMN4Pv24UmMo7xFYr=H396dvdD1Teh7h+K+w@mail.gmail.com>
 <at9Dn2N-PmLOPaeq@debian>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <at9Dn2N-PmLOPaeq@debian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX2W8ITsXtCpul
 6OZymThz6kz1y13mX+Sx/+ZIBtqSmrwXOCR4hFaRWRtHojl3qjYu53wvPyRD241vFanWDZbNAgL
 pyLA4fv59EwwKsnPhvpQCMB4BP8J6RoBAx4pudL3eMnZAHuqdN8TlGIMoxBzMbNAEfWHEWQ+Tz3
 E8ljddGvIgAdjQFK/fHY9THYfUAR2wz4qWXkxPjnUlVOuCLEy3NWtjEUMirLtTdQ+YGarwtsPpv
 5IszcvI80Ks3wCcmAVKWSJ6YzOAJct3jpn/S/TYR1ar5BwqupgelfLMOxL3GjcXIzuZTIMb5RHW
 EbdqO8FNo6du+4amnsQRFyVwbPauPek0O+Zf0LPOYJUkCyzu2N50uIOzPPrjuVw1sjJVhifay88
 28zGhskSka2L9HN876yDfjqXf136MK6fEQpzxr13e3QPeABb82DW7EhO/b6el/FkMJ6cjJ6Dxgo
 BguvM/vm6zWrouP2jEA==
X-Proofpoint-GUID: LZ0torBkbRx6hUgh0AO63qxFW5BQ3Tx7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX6mfq5b2f/E0V
 XgdeN8t8oms1lSZtkzeCCmIeoZTGDspJF9tzkTXcfeaLQQVTw2Sb+xOKKNAWvgBsslR/S+IZS17
 ezxPtHd7x4u2a6y5PoGxIUuMlYbgsn8=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae08936 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5fzcQa2O_f0PTkyQNbAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: LZ0torBkbRx6hUgh0AO63qxFW5BQ3Tx7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

On 10/26/26 1:13 PM, Manivannan Sadhasivam wrote:
> On Thu, Oct 22, 2026 at 03:08:44PM +0200, Loic Poulain wrote:
>> On Thu, Oct 22, 2026 at 11:34 AM Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> On 10/13/26 10:13 AM, Loic Poulain wrote:
>>>> Hi Folks,
>>>>
>>>> On Mon, Sep 21, 2026 at 2:38 PM Konrad Dybcio
>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> [...]
>>>
>>>>>>> We are adding M.2 Key E connector support for monaco-evk [2]. Konrad
>>>>>>> suggested moving the port/endpoint anchor nodes to the SoC DTSI
>>>>>>> (monaco.dtsi) for clean DTS layering, so that board files only need to
>>>>>>> fill in remote-endpoint for boards that actually have an M.2 connector.
>>>>>>>
>>>>>>
>>>>>> This means, the dummy port/endpoint node will always be present even when the
>>>>>> M.2 connector is not used. I don't see a compelling reason to do so.
>>>>>
>>>>> I don't really see a compelling reason to defer re-defining them to each
>>>>> device DT either..
>>>>
>>>> Adding an empty port/endpoint at the SoC level is problematic for
>>>> uart, port is not always expected, this depends if the uart is exposed
>>>> through a connector or to an onboard device. So we may end with an
>>>> unconnected endpoint but still have a bluetooth subnode, which can be
>>>> a bit confusing... Also why adding a port/endpoint only for a specific
>>>> uart in the dts, and not for the others? This is a board/SoC level
>>>> choice to use a specific uart for M2 or not.
>>>
>>> From my perspective it's removing boilerplate. Currently all USB and
>>> PCIe hosts already define their ports and endpoints in the SoC DTSI
>>> and if they're unconnected, then simply nothing happens.
>>>
>>> Both 'ports' and 'endpoints' are an abstract property that signify
>>> 'X can be related to Y' and I don't see how that's a problem here given
>>> UART is very much expected to be connected "somewhere" (with the
>>> "somewhere" perhaps being external/a pin header)
>>
>> Yes, but in the UART case, where the connection can be represented in
>> different ways, we can end up with devices being described as both
>> unconnected (no remote endpoint) and connected (via a child device).
>> We can probably live with that, but if we go in this direction, we
>> should consider adding a port/endpoint definition for every UART
>> instance in the DTSI for consistency. The same would apply to I2C once
>> endpoint support is available there as well.
>>
> 
> Yeah, that's also one of the thing I really hate. For getting rid of
> boilerplate, we will be just introducing dead nodes :/

I disagree about this being a problem, but I won't block further.

Konrad
