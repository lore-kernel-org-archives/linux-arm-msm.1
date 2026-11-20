Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156581;
	b=0DuJTa1ZHPTBTzfF8rxrBL/0WuUmaF3/wSeKlpQq8tut7NQHj5iJo1FLZj2p/ahTjOWF
	 cR92a8m5dIMhhi5nzrbv6tp+rtkvatKRXa4IEQA8sBPkof2brsIk3b8gGdtUZ7pKh1uj6
	 fQZFHmYt6q6MojK3yFeY6tmqCghor1wvEnPnsViWgdtGh0Mmbhu2oO9B6brLwrgBFjdvK
	 Q+CyP6dHiOiVtDdUd/QjUycI61CJvOsjjLDYGOMmbAXbAam7qb4hE/v+42w09K7YS++5a
	 v3Ig4TF79ofEzd7MI5JqBF5txDqWK2EESpbRx0C+A+Qm+L3zVJQbmfAIHLbb6dEffTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156581;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UHnGY7CGKzJFfaqllDRam8SyViyTGqi4wTLMLKTDzsE=;
	b=muK4aDXvHPMPJ9Pr1Wo2OLHnFPBJA5I7DZ07mOsuwm7A1ugdEH3ekUpt503F3fnO0i6o
	 TAJzf9uh7A1C5Gf/+HxKfyIm34i6+3cNq8VudIU4q7Vxb9L7LdkRaPtR9R4dt+w1wgwtO
	 aevBSy3SQ6hTtnnDeAeA0I8tALZbN62blfzHZgPIABFkaQx824JSMzry2ljUypdeUy8pK
	 0xYrhSNYP9HeQRft0YTdxvMkL/C/ZaPjcpO8G+uiYtaSI5HW/Cy2f1yqJ4hE0El3dX6yl
	 k/UwqZhG0o8znCggPvFEGYlv/2dDKwkp2xBIFdQeHZ5U5AITCXVUYQ0Y0U7KOvnYP4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nKoNhDV5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RMzxOzth;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61620606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 06:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61620606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nKoNhDV5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RMzxOzth
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK5un9n370968
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 06:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UHnGY7CGKzJFfaqllDRam8SyViyTGqi4wTLMLKTDzsE=; b=nKoNhDV5EOcLPsnc
	WXpp8BMcoaaS1XqfjnlaDvzk/iYpHagPdaAKxk+PcIVoegiPOHZ7Km5YdVaPj/Zu
	VQz7WxiWQiRHeaWE0NKZX9nPUdAWr0qPRNmhTITryBLtJUtyUcfaSWQvYcLcNPST
	124F6msJtndmF3xghC4DhGKwDWVQg9vqLr05srmqt32T8rAX1ydBTerXX5jiz5/C
	4xtlrEWJKHcENWzPQgceaXjrjhEmkrisIUAdFzUpC/CFSD9xk8IberWympN3yNiT
	Ymmbrsqd0+dtB2zyGQrWyEDIuvqYyC0jOAm+1PH1QFlEGCuqo4ofTY3qLLF0XFIw
	Kld/sQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqr4u1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 06:36:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b647bbf87aso571961b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 22:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795156580; x=1795761380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UHnGY7CGKzJFfaqllDRam8SyViyTGqi4wTLMLKTDzsE=;
        b=RMzxOzthoGX21tsSWng3CNre0PuDKb4eiUF1Id5saf4lDJaQuled7bCiLS9LD0bO72
         cdu+yMG6ItZmWkmSnpSwrUPl3wPiRLlz1yWuvOa3+2UVXI96GO0CbGLxPOB+m83SDrZ3
         eq1fL1pRXe6RycroLzJaV4wuhKf+zHA7om8+wYhRqMv4BlSX7PRKVfi2BCZKtoqwigoQ
         dTv7rmL/ZWay/nH/tIaftaUxfh5sD+Wr9PTJieFSM0+WGSar/3p7em4oYK04vJkseOCh
         EKh6vjjv1DuOTm5pBxVvQfQAXznE/wH0Lz9RO4FI2fQ37FNkDG0EWfCfkYyQy7cCPpgI
         sz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795156580; x=1795761380;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHnGY7CGKzJFfaqllDRam8SyViyTGqi4wTLMLKTDzsE=;
        b=JNKkpTPIypPTQu5wRdLGUIoc1ELzXTcaAEeSQ8VD0h/0mSkMqOTYLnDUt/TuDnmdAm
         3//fBlzml0RxGqacHSIrQGhfg5dMSS8m0yfRe0JcyobGMHk8+ItjsJJwUPInvjbcOD/V
         Ct20seNM1eTdIRudQiCXthjPZqvgfwhRogam+R5SJwGHl6T/MgL85IcFV/GdOHIreSGr
         hYVTrVwuZpPuNik1GOqqW6xxIxf0FlMo/9iap99H/EaBBCpu1E54iAxyxUxQyoWXnT5v
         DFubVVUC0YDv8Br4lpSRG1vUcIFyfY8uFU2sMqfEjqM/FN6pbyyY2rsY3F+KPhoMgBTA
         IKvA==
X-Gm-Message-State: APuU4Z9PkY61cef9gxJhZOWJcK8OhCAnwTpPifyiA6v/xy+pRKre93uM
	zlIr5xqTkO956cs4gjyAfmxMFg9McVn1wK376V+5T4isXK8dO78jxmt10NpDPfqvxldmT6jN3T1
	uOHEL/zp8h2PmnhxNpBrTN3Q9m+xaa6i1q4IxEOLEWb5R6gH+mKHBexE4j7VcJoLjsVJIzdTvLX
	IW
X-Gm-Gg: AYBFou39sxstRqNZAHaUIUYRSkfNJUf9azUIFphn65loBoPWCxHWVYH5vmq5ELW1XCP
	ZexjbX7n3eAtYPae5ToAAONd0VS1twWppNVQ26BNA796QyLdkjb5i94PKG5MMjrCjpJRR0xH9Tq
	OY37AFuEDfvCJiMUMlh4iL4Pryefttna7TIiS00ZTUsG5PRl+eRkCz6ExeJ8mqV9D9LTVOIPBhQ
	GJUV9inXGXhiQnTptKzcR4zB5wVruYlByxcKdUJXtMhYrqYBHVjlkP7SVSR2CrfuA1iUmuoKYJI
	La0EGKbe027lArB23AGK/R29Ah+x6bX/TIaerrPEjPOaolJpXEYqaEifRVHAa4fSeMeQAH9iq9L
	THiLNtjE1TJ/FYL2bTrZbhVK9Gn4XuykKaOcHU4Wurrk7O7sl5SrwH0XBpwrMqMgyg+dwVYPopX
	kXiCiX
X-Received: by 2002:a05:6300:8095:b0:3e2:83d5:191b with SMTP id adf61e73a8af0-4014c25610dmr1870501637.63.1795156579707;
        Thu, 19 Nov 2026 22:36:19 -0800 (PST)
X-Received: by 2002:a05:6300:8095:b0:3e2:83d5:191b with SMTP id adf61e73a8af0-4014c25610dmr1870476637.63.1795156579188;
        Thu, 19 Nov 2026 22:36:19 -0800 (PST)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8706844a0sm1044139b3a.1.2026.11.19.22.36.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 22:36:18 -0800 (PST)
Message-ID: <4b03a5d6-bb61-4502-9592-21f7887a81af@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 12:06:16 +0530
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
Subject: Re: [PATCH v3 1/6] dt-bindings: thermal: thermal-zones: add
 hardware-binning trip properties
To: linux-arm-msm@vger.kernel.org
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
 <20261113-thermal_bin-v3-1-878df6eef8bc@oss.qualcomm.com>
 <20261118205056.GA839455-robh@kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20261118205056.GA839455-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAyNiBTYWx0ZWRfX8ZvQ0jcmcLmt
 NND4Udr7xtSqJXMX8ssTm5nGaOjx24IA139B17ycK0lVMf/tQ2VyuJz+RfIskkMrkofK5D371wL
 RSQeuKozA7nBozY8z1lkcqRN0VwKsCJSdGsYviRXTHh7fIe51IbUTIzwfF+oGPvdHzwZSebIRZg
 3NDCgtT2XZuS/UZwYsmZC46+lT1BUGDODUbbduLEn1lcpC/0vHRAmX5bySKnRw6IwFjE6QezOp9
 tOoUbxCfTEF3pg0UGtcwUFgPmgWJUG1PCLoTn2+N4sF47xDJVvvVrV/xjz5BQvbRF+b1QyAV3FP
 cHcmyRmSUyoV+Xv9KTaEt9jJ/yWoW75+zhVFROJT/XZUT1qIeav1bharAOYi3P66w6Oe+BIW+rQ
 rxbKfzwWWQCjOIuG2ClDyooWMPfymJUelLnQp9BCcZuT7o2/oD4+LmJPhvOziJi/jY00l48u4RZ
 9UtptTOIQHwCiwFoRPA==
X-Proofpoint-GUID: rhwprW8hk-V5wNCN9awtx_0s1gC9Lvvi
X-Proofpoint-ORIG-GUID: rhwprW8hk-V5wNCN9awtx_0s1gC9Lvvi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAyNiBTYWx0ZWRfX4XrykSAJwk4S
 zlMbPimQoqG+ZpRJNpwhDodP4emkWWJeoJaCCDLZOjd37oDwu5yaO1FR8YUGR8tZ9AilGUfCPcy
 DTjNU8uPCCPPKPTExFUUjA1MIRiwFhQ=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6affea64 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fXwKFA8GOUhRkyI-wlYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200026



On 11/19/2026 2:20 AM, Rob Herring wrote:
> On Fri, Nov 13, 2026 at 02:13:44PM +0530, Gaurav Kohli wrote:
>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>
>> Differences in SoC packaging can be used to provide multiple SoC SKUs at
>> different thermal and performance characteristics. The underlying SoC
>> remains the same except for how much heat the packaging can dissipate,
>> thereby influencing the critical trip point at which an SoC SKU needs to
>> be throttled. This SKU-specific data is typically burned into fuses
>> during manufacturing and can be read back at runtime.
>>
>> Add two optional trip-point properties to describe this:
>>
>>    - 'temperature-bin': an array of per-bin trip temperatures, used
>>      instead of 'temperature' when the trip depends on the hardware
>>      revision encoded in fuses.
>>
>>    - 'thermal-hw-bin': one or more bitmask groups describing the hardware
>>      revisions for which a trip point is valid, modeled on the
>>      'opp-supported-hw' property of the OPP framework.
>>
>> Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/thermal/thermal-zones.yaml | 60 +++++++++++++++++++++-
>>   1 file changed, 59 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> index 999ad40a20d5..cb9a8c96d053 100644
>> --- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> +++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> @@ -152,6 +152,58 @@ patternProperties:
>>                   situation where the trip gets constantly triggered soon after
>>                   cooling action is removed.
>>   
>> +            temperature-bin:
> 
> Use the standard unit suffix.

Thanks Rob for the review.

Would temperature-bin-millicelsius work for the unit-suffixed name?
I’ll also add minItems: 2 and maxItems: 32 in the next revision.

> 
>> +              $ref: /schemas/types.yaml#/definitions/int32-array
>> +              items:
>> +                minimum: -273000
>> +                maximum: 200000
> 
> minItems: 2
> maxItems: 32 ?

