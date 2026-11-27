Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771544;
	b=G/1qwnC3u77ONsj+9crdr/Q6U/2Il0MUdN/KM93sCqT7EGPOEO3st5qZZ2Bmi8iJ+vOr
	 cXH0ltB/QEw7vVzFCSicKecgHa3H/yxRPWR9eEfNOMbt7aOzo6qxeulefh/kFIIYg5PSE
	 ToEYlmSC589nMmu+M+RWtcPRyYNWyxgD1+PHw0ksT8WMVe2JhPwMZzOaUkqei2KtWkTTH
	 z3mTo7SHn6lxpla6fnHOHQ4qJHQzPIMGPSuOxPCc4Wz0MWzglmoZRUXQD5GFIvHBrmSX0
	 PDZpNLndhQQJlQBMb7kc9rp35g+kwsQHKhJxdpL+DOXec5BLMliG2KDHwP5gsR3oqtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771544;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eb4ShHDEcPbwytF60hBjX+kNmkhn+q3+ARBxWD8KeAU=;
	b=0fcEhiO6CWoi8z+Oc61tsbNFEcy042QBPN51WamHD+Ta0ksymY8fVLYOB5TQDVDIv3Fr
	 F103OgXG6X7NSMaggQ/BnjHBRb9HLk7OsAhFo3LTT0btfH3zOqFxh4A3oWk+d5PmuX4d4
	 RszUh1aToisOzA0u/YLxEx7vBLOfy5naCFb7l+Rvx/lkkn43CPJM1NaFqwx6WsFG7t6zx
	 5QFOBenlnda7Up9aZwQmBo/xoubXy55wrvqDa0S+5wk3jr9WJbs8TvLBxCNRsiLk2UcAv
	 MafD2Wa7v05nfKy4Dbh9EsNU4oT/qfKTcm0VM0Knlifn1PUrH/sFqYzlgcsUI8FTatw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M2but8Ei;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DxsuwBRF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547D2606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 547D2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M2but8Ei;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DxsuwBRF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GbNX3983840
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eb4ShHDEcPbwytF60hBjX+kNmkhn+q3+ARBxWD8KeAU=; b=M2but8EitmsaKmKM
	+Y6azno8QMbXmA6Y4o8zl2+htv6TKv052mk4OQCuoLNQF3f+wtrVjVq2asliwX+f
	3paB/VgAvJI0WpTCgciK5DY+g8pet67rsdIjI+VrnzSwhvs/rHWI2RRNmmpomG1p
	WKa0yKWekFKKGTPxwXwJKiXI9EVqMibpYv7oTRvxLaQS91heijKg4F4WZh63AeMG
	RtPSEtxqzdnR6xkmER68PA2H1YSHzK+erJiwU+df2k7YsetculdeWcubcI6EL9Ak
	LmzO68FQJiGufI4U7v+PgyQpZvoZ5L4fHjUItk3cg58HvtiCqFxJmQVVN24baHjh
	fcIydQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49a9ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:25:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so1309082385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795771542; x=1796376342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eb4ShHDEcPbwytF60hBjX+kNmkhn+q3+ARBxWD8KeAU=;
        b=DxsuwBRFgj4c8F5SkG62XhnLRUgrPGLTEB5pYVxU5rl8+Y5gS1YqkVyiDUMAbXB5VD
         VciAHMhMTAxAxql/JuMtQS3cQlHLiaUF7CpEnvVuesxPMdyhPpppXL3yMz1XcO1s6BxY
         qPyXfvjSTijDoXVsl7UJTJsUeRug8DzF5zgGHxBsdheBCXbyVEjy/ZpxP2HjlKOewkit
         +ZlFaDEaVIAtWN+t3Uls89FIsrocrnZW122DxiV5DJg/Cru+8SrdOBoIDma3GAfT+02Y
         oZdcZ1icXB1ve7XuFW6PyWGYnN5jv7AtpJTnoHPfy0XQ5Wg/Rj7WZNGQ4kCxte3G1pDF
         MWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771542; x=1796376342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eb4ShHDEcPbwytF60hBjX+kNmkhn+q3+ARBxWD8KeAU=;
        b=mzG4rLaZuaurxuaxfMg9E5YxtdYUdIEqROLYZoI8gXvB0qzDzwt1VjLxECCFRPKEJq
         1f2rxVH3BlsoOIBqM2feVIP7iN9/M0nGnuYxSJMaCYwBygObx5B3cKk8DkjmX3/F8fJF
         rxs1m2hA1FaA6Misz2W8KmAwZFGN2dYd3mcsg36EH+U4H2OYs2l3XkawYhgq3L147HBu
         Ye5prmMjJEbC4ntBi8Ki7Y/lNnREY3XhQ9PeA6T+l9B5yblvOI3r3VyNihoYTNQpySjY
         V3yC0nKJpQI7IPs5IYQxeGCjXKl0zWXmK3Aga0zLxMoDcXuD5VjSqv/1YWJfcB17ysld
         RbRg==
X-Forwarded-Encrypted: i=1; AL+hErF0igv2/BYATqtjsm3fY1EB6ODbGWwLmoAp3//A3jcaPsWLEP/QRz7nn7q7tWBl11HPX3gXj8lod3RN9UUs@vger.kernel.org
X-Gm-Message-State: APuU4Z8PhNyxc62/lrTDtb/ZmF+0w0IL2sAviDNzk4tJg9NQWkf8ABAu
	KqmMn3LqY2vyju5SBRqPtdAEDPxM/ByeOwVkwBWcaPwc7hFQ4AgiDWN7JX8gAJviVswu/4VSiA9
	g6etycyKQG1TJl1hP5E3PgBCtIJ+PRgGAHvm2RIADSdaxMlqKsf1EF0WMuevGF0N1r8sy
X-Gm-Gg: AZFdTZeMus7rL88MMPqh9rozYkG+udl/QgKHQXb46ucfO6HK0BaoodgMfBtmjM9o/Yw
	PUtYeVhRn9C4IHIsQr54tiZCHl/dBri58SgGIZzadE/cJLjDzt/MD5lagdBil+l7zbXqkWLG/JP
	zXkDqttvtOBdfRvWEYvzL/xvXbGPacsDXl/WS5kwRG7l2W6EIihUPD3ZVpAoR1uEzwB2uVF2bKc
	hSRLL0M+j7dmDDMRXytRme8YZc/veE0JjBmB6X2IjSInUFqjDO3F4CXYJyRPTc7H9g4B/wX1Lqy
	nSlTYR+hHR5LRiZSNWRsThDa98EP4R8+1CMJl2TM2ghfcOCYL+uZImspZnzeMd1F95em8bf8jbF
	YcP4xdlFdUa9IYDYTmIImYGVaVoGYjYE+FF4s1TDXpvce2lbS5gUJmngS0araBCs34PgwvzCHHm
	NlUPF1SXhlAxmFMetM/zIDnTzHzPvuWaubU/Q=
X-Received: by 2002:a05:620a:1313:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949ba80f404mr4061294585a.2.1795771542151;
        Fri, 27 Nov 2026 01:25:42 -0800 (PST)
X-Received: by 2002:a05:620a:1313:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949ba80f404mr4061290885a.2.1795771541667;
        Fri, 27 Nov 2026 01:25:41 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:32e6:6e2f:3645:b017? ([2a05:6e02:1041:c10:32e6:6e2f:3645:b017])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm896902375e9.0.2026.11.27.01.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:25:40 -0800 (PST)
Message-ID: <8d6f9b42-a7cb-4403-9718-e7752324b048@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:25:39 +0100
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
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
 <20261113-thermal_bin-v3-1-878df6eef8bc@oss.qualcomm.com>
 <20261118205056.GA839455-robh@kernel.org>
 <eb44a4e1-fa9e-466d-9e97-f87f365ce44f@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <eb44a4e1-fa9e-466d-9e97-f87f365ce44f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qrSOXLt5VYsn9riVP86PT5RIVK_bQbUD
X-Proofpoint-ORIG-GUID: qrSOXLt5VYsn9riVP86PT5RIVK_bQbUD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX7lzakr251sFs
 BbTEOAigiPjV6Ekgg7DlzRrcm7v3kQT7dJZK+BBDTnci94LyGH8b1WCx2ST7v0of/QESw0PXeUS
 LoB1WFkAiPWUoL8O6zt6sihi1FWThLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX+iDX6qGtTaWs
 A/gJfKq0hRqsvgsfhOzYp7n8mRq9sqHV53CpeMiR6sVgjK/izCOWs5OSyL8AOhEx/sBqqLyVYE0
 7sCiJL0zMERcf+5Q8ULMqqmajhrIfXsRtEHCHRmVZEOG+6Tix2VVYHF58A97mc4fHQ18pZSMsCf
 f1zNZ3Mp74ylK/SVaTynmEF9M2b11cX6HBb6IOICL63AbBvNCOXUFJcZbqfEuBMkhs8n3bl1MyJ
 hSN0/ytx8K1NNABKWZLHa/veJTitVerqrVqsnTFl5cKKxMjk5oTkMKVWUkYvoRj5FCbQrr3H/C2
 OLbDqLV7Vy5D2vploGhXvs6zDe73ZcWnEUVALOVw2o9jPpAO9+t8JP/shGMDVX9glEBgr+uHZZn
 I9BQXgo03XBC1fNVAs6RO9jRkCRFBCBSQBWVvtnLQJMhz5uClfkvdMhdr6GCzzvgwqGn5Nm/6da
 NczZOtocrsERuBk5vgA==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b094c97 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=7tqQl3XV2vr3itYC2nIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270037

On 11/20/26 07:47, Gaurav Kohli wrote:
> 
> 
> On 11/19/2026 2:20 AM, Rob Herring wrote:
>> On Fri, Nov 13, 2026 at 02:13:44PM +0530, Gaurav Kohli wrote:
>>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>>
>>> Differences in SoC packaging can be used to provide multiple SoC SKUs at
>>> different thermal and performance characteristics. The underlying SoC
>>> remains the same except for how much heat the packaging can dissipate,
>>> thereby influencing the critical trip point at which an SoC SKU needs to
>>> be throttled. This SKU-specific data is typically burned into fuses
>>> during manufacturing and can be read back at runtime.
>>>
>>> Add two optional trip-point properties to describe this:
>>>
>>>    - 'temperature-bin': an array of per-bin trip temperatures, used
>>>      instead of 'temperature' when the trip depends on the hardware
>>>      revision encoded in fuses.
>>>
>>>    - 'thermal-hw-bin': one or more bitmask groups describing the 
>>> hardware
>>>      revisions for which a trip point is valid, modeled on the
>>>      'opp-supported-hw' property of the OPP framework.
>>>
>>> Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/thermal/thermal-zones.yaml | 60 +++++++++++ 
>>> ++++++++++-
>>>   1 file changed, 59 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/thermal/thermal- 
>>> zones.yaml b/Documentation/devicetree/bindings/thermal/thermal- 
>>> zones.yaml
>>> index 999ad40a20d5..cb9a8c96d053 100644
>>> --- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>>> +++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>>> @@ -152,6 +152,58 @@ patternProperties:
>>>                   situation where the trip gets constantly triggered 
>>> soon after
>>>                   cooling action is removed.
>>> +            temperature-bin:
>>
>> Use the standard unit suffix.
> 
> Sorry, my previous reply was sent only to linux-arm-msm by mistake. 
> Resending to the full list.
> 
> Thanks Rob for the review.
> 
> Would temperature-bin-millicelsius work for the unit-suffixed name?

+1 that's the suffix used in the other documentations

> I’ll also add minItems: 2 and maxItems: 32 in the next revision.
> 
>>
>>> +              $ref: /schemas/types.yaml#/definitions/int32-array
>>> +              items:
>>> +                minimum: -273000
>>> +                maximum: 200000
>>
>> minItems: 2
>> maxItems: 32 ?
> 

