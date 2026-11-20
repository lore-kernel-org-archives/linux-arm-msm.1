Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157282;
	b=J3FInD+ylLEdv3jgdGmBUPTUzvPMCAaD0nIRD+iacqLoj0OKYse0mFHBhaA+qQAisget
	 2Y5+DBnoZYgTxersTG374dEmps7X7fR82OHq7wSS28wWhVpg9IfORD+dmVwP+o2rElAku
	 fXHFeGHcNhlM9qOhfakRN8/cSSmF5cUIGRUkfbzpJVtH+1XX424GiintHkwj9g4V23JeM
	 zkzFAHpxlkMSudBeOIsdlSAQDDTfB1eoxAWqZmo3YDHpCZplx7AK3MdUFYb8zVg/mcvqQ
	 o+qLQgqJ9LRHpx37jYnfyfSo+nUYGAaFG9c78fiQF6tcExha/xhTH3JGUHfcU3dJwBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y5IdSOiR1ak5akmhkE6pI8RojC6EEhOJLCG9nz5PurU=;
	b=MBEmQguHUkzGEnrj4FV/2VhsgHyAavRh6mkHNo6OlUHOq7/kcTm1fpfysIDmrrUuwGA2
	 /HCAjdVB9vaesBfW/+rl09XWWesNM3VHI5lT7JOWcRCtaDtHWxHHNtAVHFBiJqK61ZMOk
	 i3Xs7uB7xTJ2io8ojbh5me7ZvFIZsCUEAlEt/ZmWku8fcFJrXwhYHGJ+SRFSCer1Jl3Lx
	 3hjRqJEJHAUi7uCE2qucYwdzaLaXoqV6zpveqZeP3HMfk29HWhYDclSWeocL01WV+DMon
	 t6xXElfpIPcAWcutur0D1hSy5+wTJDh54tn3LzDnANW5WsMhTglcqCDEpaB3klK6QTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hkI4QR6u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="UoL7P99/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CA3606A337
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 06:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21CA3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hkI4QR6u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UoL7P99/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK4NSmQ1303767
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 06:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y5IdSOiR1ak5akmhkE6pI8RojC6EEhOJLCG9nz5PurU=; b=hkI4QR6ucta5eWG1
	nyjdT1vUjsi3zvTTbwhohx6zH3N8uS7jrj1zPoY9ZP+PiTbUTqkHLSZ4KEMtSal/
	R4fcnQ8nz4z3aaQirfBCv9WObKJw3847lOJVxS8bm5p6Bj5jrQluFvmyVDxNvahF
	wRP3KVEhK6a9+xbLOdhyrXIXeJVhCd6fGhz75pkHLhwMiPtGxabtmCC3mACSej+n
	EwtePSZAQXWkWTKCXRhdTvT2iNMnnA7EjaLdUn1hXqcsYmDj18kjvFAQnlV/nw+v
	2Gfjcm1vvOX1uPdcpGe7Kwf1ILb3uM5eroHPBXjmtkFSJ63R8NFHJsrOH85dPJHT
	RfBX7w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yggcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 06:47:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0329e57eeso5771695ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 22:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795157278; x=1795762078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5IdSOiR1ak5akmhkE6pI8RojC6EEhOJLCG9nz5PurU=;
        b=UoL7P99/nP8ae97HuQdP+qRNbqfxhH+rHwpJxRIn07lLNpUim+kbrE9SCySebAuZue
         7gWiDCCrvbIYpwITMTn3K0XPBkbcjrACh+9iJsQztZMK+sVE/hDiXJpkY5p3KDUqJXrD
         eGLKjRkQbYa/ZWStHRYc6CW0mKgE/HuhXxLc7ZOLdgiHivc4RbiVlRjOKO3VyPzRp4gR
         7tjtK0354Ek6QaDsVqhUKTxcwZsBKaOc21DLfn/KeqAQN+6Pws+bTI8sMbrIrQuldDEk
         Y2KnmD2BgR9kUXemi5T7dHdHFxp/yRzdZ2Y39CDSVu020BWHFhYePzTLWX8IBhGxbfsh
         Z0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157278; x=1795762078;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5IdSOiR1ak5akmhkE6pI8RojC6EEhOJLCG9nz5PurU=;
        b=Jdssr49IGX0R4h2wrXYAkB25Pid6yleQ/8CbTYM+oj9labmMgZUkxYnLnjoJnQMIUx
         EEaM4qVuV3X2NCx/Lqb7TbxTpqpomJ175zENT0xNBptOiMWUh9v8nSagf2oNfcm6tsyU
         OpeLY7Ap+QMprYfE6/MHQhHqkZYL3NFIeYb+L68BJFRe8KcRobpwstjP9NAxWQShOUZ5
         riOkj6582DQdAXvsKj75H2I9W0uyW/LQME/1uIuv4fY5gmfaq2ul+/TcyvEjrx5R8uLm
         ogPzLPaiaDCVSHtrnMGffnQ7FhBRtLyJdnHdTdT+OEy/cBu2t0fh1tawhOq6utFoNsJF
         Kx4w==
X-Forwarded-Encrypted: i=1; AL+hErGm2z5dpvTasDrRtwXMNBV0UfHuI1Sf705QUaL9M13NIJRY/yFgHubUgxKaCfnD1E2AoTnrr0ezcR43+FX0@vger.kernel.org
X-Gm-Message-State: APuU4Z+BM7ohBiD443i7EViRocvT4N7M/X3krF4EczT0boyZ66aw8n0j
	9DkhlmwWQ240IBGlAej+0gS9DCcwYF+whYrJWhGFJvB1zJZ4VFjBisColRf18y+Tf/d61tIRlzX
	pwbCgIeHddghvRVsqMyxrkV+W4RMobhFJHzV9Z4Sgyt8AHEv70tplMmttGzXu+u4Ryzvp
X-Gm-Gg: AZFdTZd8apCdSTAdQRixE7Z4F/eltXXgNKGHIwt8zaA/B5dNyKaLSyBXmjwLtEPabKi
	I4IipG/bzn4f/ZVjM2lzDV93nl+Zcx3ecFTS8S3KEQJkGZ/6nD6pTD2WqR8ZASvPUArpsj3cPBH
	xzePx+m6a1XIpCl2i2djaoBlXAfaOe5hM1LV00h+LSslzWtszUFnu2WJa/cGq/cxPgQbVEWfGVK
	G3GXTdaZ3OBhGDn/EIey/oY/P9MVtt++IRiJci+64xnByrZn5WvSNR/9U0hpQEGyAGrzpsrdr1J
	ZkKb3nnEJvNZ/0rmJ+4n9b9O3AZ+c2joU/QDychYA1FVT0yYHetBDCZ+8b2rPmzgR9dvt7h4TxR
	9Nha8timFm5gntLy2nnOkKRD8LnRCoZBrf5QGNo2gVC6J+FWMi14ULdYw8OgLa2GxItqmE+Rlf1
	+FU9DK
X-Received: by 2002:a17:902:fc4b:b0:2e9:4b65:369f with SMTP id d9443c01a7336-2f03f1ba464mr20069625ad.34.1795157277838;
        Thu, 19 Nov 2026 22:47:57 -0800 (PST)
X-Received: by 2002:a17:902:fc4b:b0:2e9:4b65:369f with SMTP id d9443c01a7336-2f03f1ba464mr20069505ad.34.1795157277401;
        Thu, 19 Nov 2026 22:47:57 -0800 (PST)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120769sm9781855ad.57.2026.11.19.22.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 22:47:57 -0800 (PST)
Message-ID: <eb44a4e1-fa9e-466d-9e97-f87f365ce44f@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 12:17:49 +0530
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
To: Rob Herring <robh@kernel.org>
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
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20261118205056.GA839455-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6affed1f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fXwKFA8GOUhRkyI-wlYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAyNiBTYWx0ZWRfX+zjwVzGni6ls
 zkqIeaqY6xShaoZ+Ndz7yGQJAF9XhK88nVXlCPJtkzoaCfUc0AxlumRQHyKJ10DjO7W4rLlYfoo
 ke+3ds2bAe4iXFdflMti7CqwFOzW2idxqJo+/P+IDuj8fsLN8Wtc2CnATLLELsfDW/xNlw3/VUu
 4g5/pm6/jE7O/7UgSCefPwOW6HwqVLLSxU+Jhiwy94dISKqtcpl5HziRf51XF8TLm/1+pwrk/fa
 IDOHF+7TAiFuI0q+z/XOBrgHDGG9NMfg5cFbqt4HAfxpfWupk/MkJAGxjZ2NPXwH4GaiaBOg8cr
 MGsTqNYsw5xaLtF6wadNtvHAYC9Jn1V3Xr16kTJ3t0KtyDO2nJ+lIvHkyYbRPyspaegKu//0n15
 KZ5/UvKSQ7P3UsFuXTMpN1vRJizco+1p86/Lef95wtAruhUz+NwK48DPDq5Eoq+frEMtkqDV30O
 t6TKAuqvhBRq+3LUdkQ==
X-Proofpoint-GUID: RsdJ4gNrtP07T5dKfFOCpcvlKTHnj6_X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAyNiBTYWx0ZWRfX5DNzFSm/I5tF
 Ws5bzvMWHW4LpXfuJ+J8Fd7w27z8C2vTOHdS933aBBn8NjfRLuJq3lM1H/UAUoDyLgcWXxY+I3S
 2CqcBMqE8VY4g6yBdWnC+jOpqx745FA=
X-Proofpoint-ORIG-GUID: RsdJ4gNrtP07T5dKfFOCpcvlKTHnj6_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200026



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

Sorry, my previous reply was sent only to linux-arm-msm by mistake. 
Resending to the full list.

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

