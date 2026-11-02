Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630362;
	b=cqF3We50rbce93hkwZxd7KyAzyw9V6+RXeG9EK2osghb3f54yWI5pS/wfsvK3zpqCawe
	 tAHKNgXTGom6GRiFr+i2SvkOi+3ReejCM6RdH738CiImOx18zoE07z1bHtBoPj5TebVYu
	 qa9KpNQj1X0BKOcFZCBDwrzDl7dqd8Ta070WC5hGwOZC1yVy6Oueont6SS0E1su/Ut8Xa
	 L2K6P9Yt3Lmqpgw+lLO08QDW1iXgDTuk4uYA04dm8t36sk2RF+lXIVQaU43HdWkQaTAmP
	 aZ55+ly6KIoM6I5bzGpmPmQEMIvRsFXbKLGnvm8YAOI+DZirpu7yERCX5CFKaGBzwXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eSQPv9J+QlCFTNzamqkT43tzwOVTKcOK6QBTK/tnv2E=;
	b=mOk+yLIVpKGW68KifhxA41GtqM99MeUPs6YT+tg4tbBoUc57QRds2kdOo8vQ0WrbCWX8
	 JY6MbX9vHuRoE899bGAHy6Wjx5LbrpmZ7hSwnBtcRKI6Yp//AsIaOUc1G1v2mMOAMjV16
	 XcoPxPZIghT3VR7qiwrLZJQsvaWmrYpMGGdYK6ATVC8I9e3d0fxji+wrC6v5asHoHJZN8
	 Di+THRHXQDmHLYkypn5zuF6drXA9cYFFeNnsQd4Wycv/pNP3XykXYMDMP3eiSP1QsHwmy
	 SRBdIghSVTqnRV2k+rzYHmGG6qhBHgFnYiWC2GPKDMDuDPhkMJ5OpcO7mPRyOqb9IcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iKgJ+Bvs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FWfT5v7i;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13279607B46A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 14:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13279607B46A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iKgJ+Bvs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FWfT5v7i
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpJCE4061987
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 14:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eSQPv9J+QlCFTNzamqkT43tzwOVTKcOK6QBTK/tnv2E=; b=iKgJ+BvsSJcCQgGa
	mJSVvfoMUao9w/aRtCvYNnMCnBDeW7YnEv84V6gfcPnAulp4PULt8v7TDDQMqVSt
	2+fBcox4doGhkA5V+YeqgOYxhvd0Vs5b7FRgP65/71jD6EyljLG59ksaTXV+YF2D
	zD8VSY/ZDhY74AQ6HAqyrXm6oZQVuhzBU1hK+/J9bMKjzJJNdahXXMeu8cBh2/j6
	AOwewqBOUUhEZESuJA7TOe9B0wjRj3XJlE1Po4i/Ymw9qtMLADp0U1tV75Q8lZAV
	5ZWebiOgf6FnbpY3iFZOw/sCVabS9Hvk1R9xNB6Kfl128DpWJSm8hzBHim7oqY7e
	adkkjQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmesrey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:39:20 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso158620e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793630360; x=1794235160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eSQPv9J+QlCFTNzamqkT43tzwOVTKcOK6QBTK/tnv2E=;
        b=FWfT5v7ip5XjQskGOoQIpn/9PXq7cifQ2XWFTDrPdK/mIRP2HS7zWJKJjSLUjbMMjX
         iWnM7ipK1xMCBISyEOn7G+Gsa/IDH8ohm5Zz9KskLMpBMjQS5zd/3lbs+3grbU1J6RPy
         9LwV6QodjRDmelNdUYmxOqUQsQazgfXwN6MNs4pA2tsGIZtxRQDuuYErlueeRKQaFtun
         KhgCr2gyCm5Wke81Ijxp+noqZUb1SIKUyYX1M8dupVUUnbutXeO0a7QeuW8LgHbNE/KW
         lHSy2ofHZHmP9wVSar0a0KvgKm0/AiWxZtqJcpZJVMyCdlUkh9d5O8weOLWj+uaRtEWa
         KuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630360; x=1794235160;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eSQPv9J+QlCFTNzamqkT43tzwOVTKcOK6QBTK/tnv2E=;
        b=Akn6arIDNg9uS4qs4O2MqBnwmovospyaz3664+SkZXetHAXjiU08pdJU4gid+egi2o
         QRcIu/pj79uiLex9EjNcGFy5Jj+ib2eiaPQ92KXuxwywMoOL9q26UtP/undfCHv7LuUE
         MATpf0E8vhsRZUtN6oEzYOLtxLCdScSNjyTXqz0PpvlaDlsYkrKuBGaCKZOe8xmyHjrN
         v9cbqh/lWjjVUDOIICaWLfc0DD9V0Ra/evAddNvfh8csPMSFSnKF/Q+va0LNuiYcmr/Q
         jT3porkTcA7kbwYIAvhbYKG8BwqveOyzdHcWT7j7OAvI5i8CRdqkWAkHAeNuNuDo0ftE
         PACg==
X-Forwarded-Encrypted: i=1; AKwUvBxtgLao69D6aXdPdQpxgLnfOF4/vFakoeBnAEK6kGc3vaqJuPr039l1Gt9ThWNOqpFk04xq/NBed9Alc+74@vger.kernel.org
X-Gm-Message-State: APuU4Z80HfOXErjphE93DpsF6sl/0Hd2Hi+lo4EQfZ/Bh0iE78ozZ4gL
	waPPxtnuNiopNRYpTovxetzyOeDJQaneCK3PiiUt0Zwa9agFQ0pud47brJcVHDwVCPDf3qsJI9Y
	lURscCo3tdfjzRd7CfTIpt1LMupBArh2zfrCpekpQv0s9w7OTUn0JQtR3RdsSXgQyhuLy
X-Gm-Gg: AYBFou3LPfK7o/IxWq5I78KdgeBxKgrTUpf9WBtVOkKCmhPt/y9UjYYwH5oHRUieuXq
	Q8+IQEPrQ1p3tFgz0260JJBZaopAIx07UtWaJ/dFhKs4+QH06Gk3Rs6qOMw4KC9715grO/gnvLT
	dpqIFVIjPtKHg8HLcRQAnP97ajUro1duz0vIwRXaD/WR9iXbvyhkTbi72401Uy4ccZ9Z2ciLPFT
	qoZ4d5rjfjoSW5g3fl7T1iYyba6pX8oi4pkhmtbTt7H2cS/ZIKQ1F/ci1BuWIOG4v5pR2L94osQ
	10FoOjeMQ3nlyGtBVPmG+u1RgIEMM9M+arHs4Q2mtaDyCxB6UcK/3WLuO3q78lLJd3PAj+tmny1
	ewm7gfPCOOpG6bV3IU5IgziMUhGJeVLWXGif9qrG//2vImTkzzxseogvWsD2LkBLkFJBIXDhAaJ
	DxFUAfQOpTUBtYA4hn0TJIaRP5xk9Lmw==
X-Received: by 2002:a05:6122:2b01:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec6897ccbamr4412995e0c.5.1793630359995;
        Mon, 02 Nov 2026 06:39:19 -0800 (PST)
X-Received: by 2002:a05:6122:2b01:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec6897ccbamr4412976e0c.5.1793630359426;
        Mon, 02 Nov 2026 06:39:19 -0800 (PST)
Received: from ?IPV6:2a00:f44:e0:8d11:8079:3a24:c57d:745c? ([2a00:f44:e0:8d11:8079:3a24:c57d:745c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe3c449sm403461466b.49.2026.11.02.06.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:39:18 -0800 (PST)
Message-ID: <e23b0980-4759-430e-83da-52f44cff37d5@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:39:14 +0100
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
Subject: Re: [PATCH v1 1/2] phy: qcom: qmp-combo: Add PM suspend/resume
 callbacks
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
References: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
 <20261022104321.306679-2-prashanth.k@oss.qualcomm.com>
 <de3e5baf-dab5-417b-a9ed-225cbc56ce1a@oss.qualcomm.com>
 <a8104e92-990c-4e1a-aa4a-c97b9a801935@oss.qualcomm.com>
 <a05ddb1a-a84b-4db0-9806-918958f3a962@oss.qualcomm.com>
 <9f7c605b-e7ec-49d9-85af-7dd9d00a9079@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9f7c605b-e7ec-49d9-85af-7dd9d00a9079@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae8a098 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=TnnhYUFuctcyKAmn-PYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfX0xMUVdElHFoM
 pSQgh69vfuw1fRnswL7Kzt1gxy2+jYhUIKBzoXwZJc2/r43SNZ2tuCT3PxvChBcv6ERGBHzQWS4
 XkXddCnFtRCUxSvTYtQqGWk7L8OzTU+v0L1iyDCiYon/qYo5efddU5ZT4VtSqQubAd81qjAkpPw
 FWC5k5fzdAq0yliBNVwU7wCikKJNRgqbWMiCIPnGgVQUrwHpeWAKwG0cIqdzcj/CcozlKVSitqg
 79mmORmBPnabUwzo3fNgCXhexL7v4GdpdwaieRC5ZPZSm94IFMRFNs7bvbwfG9uzhOx17VogRM3
 5GFCGvOL85pEcvamYduEBwcgPWmGcOFFs+6JqstKt3szNAlAKEHLxqNgXsXfOSKSJM4wr6Wipec
 /6etEWrW/hmdUHvCRrKGKdgcL4461M3FyTsKW/dhAW9oNq18EWplRDZhL2OWziE9fs13R41mXDc
 edKSvHmuLah0WcYNlKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfX9vz6LKxuFmxj
 ZdOPF/F4tMtyXfBqAr6Dt/bLj+gPTo+zZTZsVHa5x1n2BmP4ZhsKW6s7QMHI8XW/3bDTBKF8Ynz
 wSqBkQTlkd3WstvTeas01aBmuaMB7dE=
X-Proofpoint-ORIG-GUID: HEZPfi-WwBW0hQLfx2yvK5LbjP9h0xMn
X-Proofpoint-GUID: HEZPfi-WwBW0hQLfx2yvK5LbjP9h0xMn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020058

On 11/2/26 9:15 AM, Prashanth K wrote:
> 
> 
> On 10/30/2026 6:54 PM, Konrad Dybcio wrote:
>> On 10/29/26 7:11 AM, Prashanth K wrote:
>>>
>>>
>>> On 10/23/2026 3:53 PM, Konrad Dybcio wrote:
>>>> On 10/22/26 12:43 PM, Prashanth K wrote:
>>>>> Currently when we perform system suspend, the phy clocks aren't
>>>>> turned off leading to power leakage. Prevent this by adding PM
>>>>> suspend/resume callbacks for the qmp-combo-phy which toggles
>>>>> clocks on/off correspondingly.
>>>>>
>>>>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> Well this still leaves pm_runtime_forbid() in the probe function..
>>>>
>>>
>>> Not sure about the history behind this, I assume its for controlling RT
>>> behavior from user-space.
>>
>> Long story short it was an opt-in because it was broken.. can't recall
>> if the issues were on the dwc3-qcom(-legacy) side or somewhere in the
>> PHY code itself.
>>
>> Konrad
> 
> ok, I'm not sure if we should modify it in this patch, I'll enable the
> RT PM operations and check its behavior. But this patch is intended to
> enable the system suspend/resume ops for qmp phy.

> While at it, you had suggested to add mutex guard on RT operations,
> I think we can add that also as a separate series since it needs
> addition of mutex on qmp-usb driver.

Please assess whether it's necessary. If it is, it's a prerequisite for
the other patch. If it isn't, there aren't any blockers.

It definitely is in the combo PHY case as Sashiko points out

https://sashiko.dev/#/patchset/20261022104321.306679-1-prashanth.k%40oss.qualcomm.com

You can also use:

SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)

instead of adding custom runPM-as-sysPM wrappers

Konrad
