Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795698;
	b=1zkyMZ4C3v6XKja/wvn32BriW22D1rIFBq40dcF30UtOaN7lvIEHoX3VqdpwMNtU5w2+
	 I1TZqt4xCQAYy1tGz1CP/hzc1pcuoEub19hc9u4fylFCE2lucRGwLvhtgR6sQ9Gdx+qDD
	 j4QH/AsuaDyOyJgNDSzQNItJXsQfChfHqNDqB5zTHMpDguEEQE/ySRazHKqrRQUjJm8G6
	 ZZIJ8hPYyJ3FKXi7Hqo0u7dRjQGph2+IC0ZIrsvNSpbJp3MMBxXjaD5dNoyybSPgiC/EF
	 tMeQOw4yrcrigoCK8LUprXittmcWGNJuwWkoSYJVEvq7ECdo++m68OMjoYPcXutedXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795698;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=;
	b=kjA5hrc82+cFGd05CbvOOhQVF51ugCqWEWI8yIr8sVjBuNNCbZSQ7/kptsg1qtPc/Jso
	 LdcEf2c3RTpgcCKxo++ALUzIcAxOGQYSo2fD0lx5+LWx+1Jzv/WW18jhIaDi00hvhiWim
	 qYk31itsUM8a+gODaPmoOX2cCKRxUlYMNDsar/k28zdUz4FBgpY5d+kuOYwTNhV5D3+Ji
	 iUkerHRm+0ys0BYqivJpWT5xNvWA1U8HBYZLBjZG++rm3UctVSqECKdeoDvMYKWJvq08E
	 H4Ezq4UAPGKcvRH0DRhMUBBrPTkyHIBq7ACCVSu0penNxZm2idtJC1tFXwcbZOe9KpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pOfqafgI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dpGhNB/x";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0DF606A326
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 12:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA0DF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pOfqafgI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpGhNB/x
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZx3d1667639
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 12:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=; b=pOfqafgIiyQ3bF1F
	wCGdEsEymDm2DhPxE86PtdcXoDmoWAokBuaB+EABu0eo7mt50FqVGPRqsTkHmgxn
	h66k/NByR5wpJeHuR7omk7Gdp+cUFNDikpZc2tmnTdbTH9GggWJO2n+Pd39qRvXf
	sc5te/+SfEZihjhJElibGAhEjxJCz5P8SfKBSc85bG+DnxIHgrMfWbbRZGloG2Hi
	s4bNDBAFsJoQf8qgcuU1CuRq2a/UxdsE2wBFL+cKkIUg/PWzjqE543GAy3BQnrh+
	MwLyEeMDsJcfk07SDFx3sjeyORqaWjK4ni3lxqj5y4CPYWTsJ5yBmLciC6tJtFVK
	zrV7YA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nktnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 12:34:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eaf3f829b3so6077635ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 04:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795696; x=1794400496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=;
        b=dpGhNB/xfvSW4grebQtPj/ZQrkIen78I8JiGV92g/WX/oMcACV1GJ9fl965nHnQTp0
         JyN4/Qd3sNHUKhnboVUUZCQ7rehlIIwRLw9C6h9loCM+zCDRPmyJN2GU0Yl/L3Wxzkim
         EzPQnMw0xDB8OTYSkycL2PDelqiJOK8TJCrQrLWZv+24dYIoZzqaS8qKSWsvDMxSsRsR
         u/l/L2kRszEwQBNPcSJHNX+dtTp0I2ySbMo4Jpou8v2+E9oRJ2XF9xXYZEFFZgS2Fzih
         kUukyKBVwtlAYe7Mqs1BF/0mGCRc2Smw9t9X5c6MgvU2QMTgNn09/NNr3fdQGlI3mrrz
         eMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795696; x=1794400496;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=;
        b=KoJ0YYl7Ibacm/859cRqgRZ5CNAV9Q/1AXauIFSVIK7lRes73NAMJmj8w+Rl7wpUhM
         U/9aHap9k560A4c1/dV7HAGNWmSnKWl/QALlI3CA73qn/XD1z4QAHKlfA9QDw6TiTAqT
         eKbiuEjwL34aT9adr6azSc8qxcdsgGv82FsFrIuEImANQWLySDxWrQ8m/Br8JMVxvfxV
         eYMJMf1Iu6Kwvgp2pwadFaBY1eCQykDP2dqjuLWm4XN4SrRaE6OZQZb7VD9k0NQBZcB9
         P1/u+gPQiLGm/j5LQUgqMexFLg30IpQNHTCD+TNokUvL3XmMjVA3Bwvd2V1X26lav/+H
         /rfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzp+AUz+M/LT5dBnRJDcO3A89ory6Tg7TjnehsjK9/Be0v/aiGLg9D9tt8ITDmyieeNgYUREJHYd7BL5o1m@vger.kernel.org
X-Gm-Message-State: APuU4Z8UVKJzlpsr7Nz9TozyO7XfKHTMmJ/e7xYnUsW6Vk4TsKQSsv6x
	VxdwSLo5jWRqLhxX+lxwHhd14/dwBi5wBo0ImNUlNtQgZLaMT/NO0T/V/NdpT4kCRwOxNoQ/5eX
	D8GJ0d+fkeSxpevBZhjI/sltTWMAXY2bGUU33w5+GxHcr41CYwiKM3Z3oHhUAH1HWlaUC
X-Gm-Gg: AYBFou25d6OMYdaKZi9sUwLLJDsZLl2b6dksUqV3MfpMtZl+Xa9as8Uk6/1fYATyNe5
	g/NalcpHF0tN0dDwdV2GzyZnoRYH4O+YwfvIGRRXZxZLOub32fsa+dS8Z0eA/6lbtHl24sygtDv
	anGy06kBX05hSI90o+MRrrxjHDR+mtjb/lv6uHujoF+zOSPgtVnsd9fz/7F3K9zvvwkP2W0Vshk
	s278hxhSa9Vd09zKWc9RHLf+IXJNry0s6wcUxxmmu/PHclM4rBQ953/XGHYyhTaLrh75ZF41d6Z
	TkoVWkeFjngz5FPYztLawi++cyTMblnhW7crTVxAQ8cuODPlSVO+Kqn/UoPC2h58CU5RAI6+qFC
	0eCteUdGEV8BJ37SH3zw7i22HDYkxy1FI+RQqIBcpcJyTThBpNE+G3Fqc5apyDvaktoRlp43tlK
	aULoA4Pw==
X-Received: by 2002:a17:902:ec8d:b0:2e2:ffcb:87a9 with SMTP id d9443c01a7336-2eb3642fe66mr137002455ad.24.1793795696236;
        Wed, 04 Nov 2026 04:34:56 -0800 (PST)
X-Received: by 2002:a17:902:ec8d:b0:2e2:ffcb:87a9 with SMTP id d9443c01a7336-2eb3642fe66mr137002075ad.24.1793795695582;
        Wed, 04 Nov 2026 04:34:55 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e6asm7038525ad.22.2026.11.04.04.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:34:54 -0800 (PST)
Message-ID: <0face2f0-deaa-4a3b-9e81-de68f206d2d0@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:04:48 +0530
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
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
 <3a5ff85c-0629-493e-baa7-543958764219@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <3a5ff85c-0629-493e-baa7-543958764219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX3ua3bRUOU72m
 1yK7E4cOdQHwGGMDCYL9sk2BgYtRr0HCgoOiD4EN19HLWsyUPLbHANUVqSnqYjOgyPqoMN8kc1v
 5ae/vk68valC2BClDuxRxkH6YxfWVXpBMXqw8Fg0cFW2lMK+NkaKKY2Y69i6KLNLZ6hWgaz8iey
 pcEk8jlGrErUc2qz6FG2EexGxtmomhQyNNuLazAu+Ae+6iXwpbzrIURdjoDdFXDbiZz2dXdkoOV
 f2veXw5+HYO2At68qv0+Cxgc3zZ18/CCsX7jc1LpSKkXEA7ZJsO0qRQ3B0KqnqYDTcmhKhDl7I8
 VXJngqq9cmyEOEfv31k6liQ56g++utdPhUyVb1VE7NZBDhFgiv2DFKlPKJyXcfaDPDV7Wp6R3DN
 AoSuQlT0MS9N0MwcF6LQfGXEj+D2++uOELxCMKgOVvKtT6dLT3BgONnWdYPaLfqIn/cJBqIO42p
 WG+aTltglQjeJFEypAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfXym8+ewfZ7UcS
 v4h4lkdWz02kbJ6dB/Lr8x6jeJi3APf5gi3IxEGgQUcK4qFhiAGNxYlSTpiQd/dPiBl/bX2aZrc
 dsfzW/50OqUaE69RSWxA4txisgSuLpk=
X-Proofpoint-GUID: C3XCfV_YYcpya6gRTrjaRxpshCp0wbWW
X-Proofpoint-ORIG-GUID: C3XCfV_YYcpya6gRTrjaRxpshCp0wbWW
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeb2670 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ex46fzmS382XuAsv_c4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040050

Hi Konrad,

On 10/12/2026 5:01 PM, Konrad Dybcio wrote:
> On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
>> hardware monitor. The driver exposes battery voltage and current
>> monitoring through hwmon interface.
>>
>> The BCL driver provides
>> - Real-time voltage and current readings
>> - Configurable threshold-based alarms
>> - Interrupt-driven notifications when thresholds are exceeded
>> - Automatic threshold management with polling-based recovery
>> - Hardware-specific scaling factors and threshold representations
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +struct bcl_alarm_data {
>> +	int			irq;
>> +	bool			irq_enabled;
>> +	bool			irq_wake_enabled;
>> +	bool			shutting_down;
>> +	enum bcl_limit_alarm	type;
>> +	void			*device;
> 
> Why is this a voidptr?

There is circular dependency for struct bcl_alarm_data and struct 
bcl_device. To avoid forward declaration, used voidptr here

Thanks,
Manaf

> 
> Konrad

