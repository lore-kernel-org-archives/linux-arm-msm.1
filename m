Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793163301;
	b=Q3LNguszqLgtAco2nNWozzSqiGn8NTxryVpqgBpUn/XLHN1gpOO5JQurSWpAYobdxB4R
	 pA84ROmLrXNKlPQKiNO1RRuUHLh/QUCD9EXn2eNNydzQLQ/H7ErmPKGgclV/05SOuOjjz
	 oEW0WZ+wJ+o+9LEH/2epdRH0+tR0//EqIGwbmxcgiwkU6LMeODqpRHsRkkGnosYF4kl3u
	 5l/GLLwQq4J4YRPNmStOt1LTpSfzmXubF/diLLqi/xxfcmpXr6bQvs+Ms4yCta9w9wPPL
	 TBRQm3uSk+5oso7lsYfgQ42+tV6uYGddBtk3KwqL8ZNPIfMFjBgzwCvNlw/E3PuF5pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793163301;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3ENjMukqGezBEqDx8E0hhaO96niseWqvsdOzSH3ZOCY=;
	b=aKhdWEFgubPVvTM4a1LEZvt/I3S/UaYGJMcwCzTDefe6qlqNO1w+SFrQuRUVn+y9F8Px
	 +9w0fldoHr742V4Ics2gxFaA0Ly2q3zeaQAD/5eynZzONIPEKloThnCrG4Ltn9vAUHMkO
	 O5nmhF5HS3Tsj0K5raqJn2uKZknR43+c6+nQ2XPHZPfauiv7NeQ8jGu8o0fFNWDmHHO/8
	 7gOf95yvDzowm8tFcBfZ7VqGi6LOXDiXHq7GFc75Xvo07DeZOlXzZxBh2Lv4OneI9buos
	 tNiQrnbAOhsbSYbxwtZ8/z2X2QUviCt6Cd7wuwetbWGOcoi/9joyD/woUVFLQ5GisfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mfxua5a9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LeOWFQYz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E502F606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 04:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E502F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mfxua5a9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LeOWFQYz
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PZJW3209114
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 04:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ENjMukqGezBEqDx8E0hhaO96niseWqvsdOzSH3ZOCY=; b=Mfxua5a9zWi8i4sd
	omurzAKhHvS0ndcgLcuCsn+7AevgJbXeRvR9pr+nsbFnJZd69SmM6uXk1JqkFdEw
	Q6Lc9gkGtZVA45mKxjr30ejLfFdsDqPlBTX3E0VrEIN7S7Fb3spCPaMeyUFzTFA5
	+2Yg2eDon8AGNuoiSdvCkKRJL0w4SdGBdOqnCzbxW+/G/4gfiW+ZReOtXdAgWYW1
	75FpV7vDbmrcQTQhwg/B/9CNkSMcqaERx8JSs1mj0qKrrSuIUqvCJRerelrXEiJ5
	v2h04vqGq2buw+t9lI/m78bo1l37+3QJcYJcoR2ZVbfPgNPCvPZ0oybPCK3g77sK
	nrT0dw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux9bgky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 04:54:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso211146eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 21:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793163299; x=1793768099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ENjMukqGezBEqDx8E0hhaO96niseWqvsdOzSH3ZOCY=;
        b=LeOWFQYz8cyHJ6YKLhaetUejud4TD/ni93fFd/BPqF6t6jWwuo+cccvnUIEjDE7awA
         YGcUeLpsU6afNGxan2+XwQDqp6pHOAorabUWVp7ygWClf3gxUyit5sFplJ2r/o3XDCi3
         Wws5itQlav0Gxl8v5Qtnwa50ElGBgtB+eFXo5cmT8Yl62h9Am0bkEuHj1Oi3neGs/xfX
         90Id+hzHlAmf158LFUTzVeBWX+0T7QYcSTkcqpjf5y1/mvlFsuWnhVi7BXGXpLrIMNkM
         a1a9yOTrucZa4JzNI9huI/H77Srg7yv/rAAeSOLmh5ipVmOTf3/bI8pXt5DeEJFY0A1x
         oXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793163299; x=1793768099;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ENjMukqGezBEqDx8E0hhaO96niseWqvsdOzSH3ZOCY=;
        b=K/1Y9lua8eXbKTRP2e9oAMitbWxqz0Y36E/qwkyRSkrayUSTZf95gZwxPhKMTBRoMD
         88YenpBT0GA58nUKiGkxYLpKL/EHbNKQ1jlgCjtEcVQPVa57m96BvLd6vx2051vFpsfg
         +DrT9uKv3vtPTrTjt+7jkVuq+LGw4aWUf2AANJdeYw4hPDNMUJYkUaKFu1UlfS+PUw2U
         hJx1gA9hk5zkwZZ23EvJ4aOHwKwmMZTqmJjLYxnwWf7DSvOS4haoucK73vSdTHeQTECO
         P+SjU2DyYrRihxOb+eOYkyfWIBMcnSFkQtltyd0WQ79d0erfkjv+Vpqa8oW5QGu9hVo9
         OEqA==
X-Forwarded-Encrypted: i=1; AKwUvBzQuAp2Dyxk1Hu1t25NxtoE+UkDIuqGdKmwjEW+Jz/ctcTAhv+fnFbhr6n7HN6b8YjRFpO2k1fpmsuEzyFi@vger.kernel.org
X-Gm-Message-State: AFq9FYIuYahhpN8SqZcBmVW6lFBlYnmcC6MAuB+L38U3gAiVC7J2tRL9
	f6UTEXZXDGkgYqDVnJ/u7V+ESTG4520G5SINqGGYVYv5txkOO/qYnUgoFR+tdP/gGkwgkZkPkTu
	pkvDRvcTNnH59+rHDFD8qyGxDwYuqy2AlAYcJgu/q8xJMC/yeBRedPGRH5OiF1yZnEOP3
X-Gm-Gg: AYBFou0Mec8sNIkmDg3a9KaX88ID4aey5vwAJuytDd8k0KBjqOPmiMKQROZmf/vl/xL
	ufCQRAMUCjIdGn8fUGcH24O/rO5gV5n6cLMuNvoYGAjy2/LqJv+c8YrgpahHzrxs0w2o5+lpxnH
	Kfy0m/YNJgFWa0MGMtL28SgSPUL2mTCvGbCyoC6h0XEccSihLKoeOS6y2pVeyuPCz0OR5W/w1SR
	x4xlmJp1x7EXbncR+Ldywqr5PZhuW/VVrJbWTe0SFff6ARuGXzTzR/9T3jBFvCPAXhnQ+vz0Vrs
	w1KgLu5wg/S7VD99AIvw22MzOyzJDxcPAiK+XFZ1EMLuMmMnK0gdwuz4vGFfExUeo7ZcaHUYhmD
	IgBjujqi/kaN5+j6izoW86tK2ra9+xdLIUKa9DrHlxPsM0yYKrtlOQloGPaMGD4a+7wwV0A8vYj
	Rs
X-Received: by 2002:a05:7301:f05:b0:369:f126:9ce2 with SMTP id 5a478bee46e88-36a204d6e15mr1983702eec.41.1793163298708;
        Tue, 27 Oct 2026 21:54:58 -0700 (PDT)
X-Received: by 2002:a05:7301:f05:b0:369:f126:9ce2 with SMTP id 5a478bee46e88-36a204d6e15mr1983670eec.41.1793163298111;
        Tue, 27 Oct 2026 21:54:58 -0700 (PDT)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2396276asm2031284eec.22.2026.10.27.21.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 21:54:57 -0700 (PDT)
Message-ID: <cf069a42-4787-4704-8aa2-e2035d6bf593@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 10:24:38 +0530
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
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] dt-bindings: ptp: Document the TSCSS on Qualcomm
 Lemans and Monaco SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
 <20260727-tscss-v1-1-beed14e72510@oss.qualcomm.com>
 <02792987-7ad8-4a6b-81ad-559c63174bb0@kernel.org>
 <640acacb-1704-4ee6-aa34-d6be3b30b44b@oss.qualcomm.com>
 <f5aa313d-0e23-41fa-b59b-9388839b2525@kernel.org>
 <7f6839fb-59b0-4f6d-a3f8-7579f6d40857@oss.qualcomm.com>
 <aa76425c-0579-42c2-832d-cc767703f3f5@kernel.org>
 <237b2f74-4a9b-4df2-a0fe-a7b783ed5267@oss.qualcomm.com>
 <8fdc66b2-6047-4f3d-932f-1e6883e370bc@kernel.org>
Content-Language: en-US
In-Reply-To: <8fdc66b2-6047-4f3d-932f-1e6883e370bc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae18023 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bmQgafSgubap5fUq5zoA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: vcvxpfV2TJkAlYGM2Dw-AUH5G8Un5jZd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAxOSBTYWx0ZWRfX6Vc/99f87/0K
 HsU7cS2pEke+Bd6hEfXnTTsZYXu2skeWsZ2OE71F5xtGHkPwvCgRG0cJ8yxGq6j7+NlwnfF9/pm
 GhFzGR6rCVmmUPkkme92nkwcH2VjxKYPK2wE/cOJ+6+kDJLmMn95SyY3kZw6iTIZ0PMvbnISDLp
 bo1yJYb6tKPv4KUsKQ0Bthe2cTupLi5HtCXWh+Lawu/3qBl96GC3xqLwXXbWv1gl++q5bYYPZVX
 fxYKIEH9Z2OEIi/U3UkUdeJlv405uBpcEK/kIfcoqzeBZinlhZm+cMcXzYXKVLjsoiyKlmXZmQ/
 sCahOvJCo4h6SVlyzYxnTxSZIMJkz06g6iA55plIf/rmmAAQq+32msBgr4is7h7L/WGK4rXr1vw
 icWJc0yyeJ/tmjZaIjSX+FlSmQ/1X9sqOXalx7A0ylAqipPWinpHf0e0jCzFEGGlvtHXOicdo3t
 GlvN+F/3ZqrkBQdOQ6w==
X-Proofpoint-GUID: vcvxpfV2TJkAlYGM2Dw-AUH5G8Un5jZd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAxOSBTYWx0ZWRfX4PlwmgPX0EFd
 Mj8lGyHca7HmpReYm06RkGiQxSwZy9sbciv/+GdWwofk2irECrYmJNUe0FM6sONTUxBPjHBMghn
 oyzKhnxMKrBMY2+vx8yy9V5ZEWyNBZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280019



On 27-10-2026 08:49 pm, Krzysztof Kozlowski wrote:
> On 26/10/2026 13:55, Imran Shaik wrote:
>>>
>>>>
>>>> On checking further, I found that our etu-slice sub node deviates from
>>>> that example, since we don't have a compatible string for the sub node.
>>>>
>>>> Please let me know if we should move the pinctrl properties under the
>>>> tscss node with per-slice names, or instead keep them under the
>>>> etu-slice sub node and add a compatible there.
>>>
>>> etu-slice does not feel like device at all unfortunately. I see only
>>> address space, so one resource, which might be enough but lack of
>>> description for the subnode is not helping. I have doubts that separate
>>> subnodes should be there in the first place, but if they stay, describe
>>> the child node fully - what sort of device it is. Just because there is
>>> independent timestamping counter does not make it separate device, just
>>> like independent interrupt in GIC is not itself an independent device.
>>>
>>
>> The ETU is an independent hardware block within TSCSS that captures/
> 
> How is it independent? I see no resources, except address space. A
> channel of some device does not mean it is a separate device.
> 

Sure, got it.

> 
>> snapshots the TSC timestamp in response to an external hardware
>> event trigger, for each slice individually. Hence the subnodes approach
>> was followed and will capture these details in the description as well.
>>
>> If we drop the subnodes and add everything into the parent TSCSS node
>> instead, then all the arrays here must stay index aligned as per slice
>> mapping. Example DTS node looks like this (QDU1000, 3 slices):
>>
>> ptp@1da0000 {
>> 	compatible = "qcom,qdu1000-tscss";
>> 	reg = <0x0 0x01da0000 0x0 0x2000>,
>> 	      <0x0 0x01db0000 0x0 0x10000>;
>> 	reg-names = "tsc", "etu";
>> 	
>> 	...
>>
>> 	interrupts = <GIC_SPI 329 IRQ_TYPE_EDGE_RISING>,
>> 		     <GIC_SPI 333 IRQ_TYPE_EDGE_RISING>,
>> 		     <GIC_SPI 334 IRQ_TYPE_EDGE_RISING>;
>> 	interrupt-names = "slice1", "slice5", "slice6";
>> 	
>> 	pinctrl-0 = <&tod_pps>;
>> 	pinctrl-1 = <&gps_pps>;
>> 	pinctrl-2 = <&hardsync_pps>;
>> 	pinctrl-names = "slice1", "slice5", "slice6";
>> 	
>> 	qcom,etu-slice = <1 5 6>;
>> 	qcom,etu-event-sel = <1 3 2>;
> 
> Why this is not continuous? The slices are all fixed in the hardware. I
> don't get why do you list some of them.
> 

The slices are fixed and contiguous in hardware (e.g. QDU1000 has 16 ETU
slices, 0-15), and accordingly will describe the bindings. But based on
vendor/target board requirements, the slice configuration can use all 16
or only a few, and might not be continuous.

If the board requirement is to get the external hardware event sourced
via certain GPIOs based on the availability, then accordingly, the ETU
slice and respective event sel needs to be configured. In the example,
slice 1, 5 and 6 are used to route TOD PPS, GPS PPS and hardsync PPS
pins respectively on QDU1000 SoC, and the remaining slices are not used.

Thanks,
Imran
