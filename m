Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1E338C42B
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784834188; cv=none; b=nVzPN5ecnpTy1EUWWpvE7LlwgQWCJALpctqvS5m4I/N8twZAQjNefBeWMoR37DNsOgFchlbW0ZesXuagBv74YhHtWFvXNUYKEdRqfEosMVv7iw7E3GImq48Zj8zWQqRgUzOT6ZnpAX460ev9g/E+ANqSi1RKTwFjbrXOeYo/fm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784834188; c=relaxed/simple;
	bh=asxDQ6fQtq0+zoBrpTtg4hSVuljD7ouxIXdiKSHzxcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cd5WUdYRAtxTwDUob9BXU9mntgehWcqcRVFlkmJvjFDxUxSzKvxh8vFB9sBueMY7w1E9IDLhcncHiD4mHS+t8EvO2YH9h5MbD4Y/Rs7VomFCVHLKphOJbmGIbHWI1m5Bqz+98iT6VpskK/a19WZDZGU3xTbAoMP0m4RbZXabb8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j8YM4+5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VMt+lrpx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j8YM4+5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VMt+lrpx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NIm0eT840073
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+YmIG/iZNAmovLkMBYqbYn5P4DPYWwSvMf5WH1pV7/Y=; b=j8YM4+5/mxhtJZA/
	Fw7grVa5EXsQG9wnVw9HnY/SkxNvYuRc+KqREeqWrcAbdrgMwtgUlreKPlhKffSe
	QOdGt9Po7AW6PQhp2dL96ei7Wfqo4PvYz1j6CncO9SHhGeGCIM3m7tf8/KxI3BpU
	GvVrcq/FHHJPplYmVe9EvbkhfttV4pURzXDt0sSGGq4hbhEPKL0Pd+b3SSektTCI
	m+6T4DRiG7MV5i16v5NqXKGtPLT3+llMwFHZyCSHctzuPITLA6aCnzrDhKOc8W11
	JLn/W0OJcSzxD3Ex7XSd3M51TGMEGaXcJG55m404MdQ5QiDFkhTQEanX+ZorN+/p
	eubtxw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa18fjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:16:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso897745a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784834179; x=1785438979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+YmIG/iZNAmovLkMBYqbYn5P4DPYWwSvMf5WH1pV7/Y=;
        b=VMt+lrpxv1soFVh/cvDopZzSBOIw9Nrn4NfQVPNlT1wuQlyM9rgsvd/DZQfi/y1tEa
         6YqxHEqN7qGV8KlAqgWGOBc2moinph0krJnxtfA1TH1KlpxyU/+m+RXia2gKLd2JYGAN
         du5MmuqsF8PDei0ZIOz8Uz0eu7BMnuoRN6zHc/Ue0qvBsDxfBXfNMQov7VeuZQGq1sUs
         fp8MO1xAoecVXOgFjeX9diBWr5GJHDdJGOnQMRpPYgvv/VGua4CqqoHS1Hxhmj2c02Gu
         zoZBXfoq7Word9GaojBoHiVPxAMsHRSNA8mSQUnyOc4Gvs45edz76UI3L+icXcdBIunI
         YH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784834179; x=1785438979;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YmIG/iZNAmovLkMBYqbYn5P4DPYWwSvMf5WH1pV7/Y=;
        b=SYI+6zZf/C1PvDD+G+ZR2MEQntKkvdI0pu+u1HncfA6Au2hDF7laVXHGlnVN4/SKG8
         PdsJFDZPLhHeOL+BQM56Bw7OZXm5xpXBb4tJ4qzlckwyjauRH5rIWvCMo4R3hI3a7J+r
         s9hCBLQbNtG7bqdaMOVcWG8r4ANrEcrU4U7KjslmKSXSflbNU+6isr/5F92nBhoW1nzY
         s5bazVFKpqSmOZhw/G29MNEoHZaref2LMUm2n+CuoDOBfTDbds5Tcvp3hODjzMNnA53j
         IEjWevGPO0Ok0HfdAYABRoDI49yVvM5PR1F6duvf0tS7SJ+eGq5q9Un0p5Rv4r5ebxA2
         MD5g==
X-Forwarded-Encrypted: i=1; AHgh+Rr126nL1AvAOK8qRRrA5y1WuMYCFJOKVv5H7xh+XGWWx0Lb5DCa6/TqngkEz84Zr90GLFvm4BwpqQTjHQgn@vger.kernel.org
X-Gm-Message-State: AOJu0YwbGvN/ky4m0a9WYOBBmBMJ4b1maKK+kdq/x/l/oPZbmJdFKWA8
	UvYisv8ibHibvs6AkNK4BghKsbJvaC5A+K9I0jpNHdgJAhn2GBquCIQPszdhvwgZvKqpXlytR5C
	DLErpmhb6OexlZolxc+owqTDcluVA/Bl3y5dQgXZQZpqhWKDHOfNqPNvJ0qVR2whLOC7J
X-Gm-Gg: AR+sD11jFPMbkWT5VckqwnuQLCaw4oy/iy4Ysj7pej+9cJZJUGMURkMgWg4wCHYTZUv
	hTqp6Pcq2mnSeIByvN/b9YIY/BDyWo3fN0gHE3Mtu7+gLJT4/9JkLvsiknM5M2MiyX7iphkr/oY
	aHF7Q1d36LLDuh54fjWo9d0HB3FNUycgcMce9qZkq6ZzI1bJEmWAWaWu/v35FZFyoypqT/29w9Q
	V26vquf/Zub3x6Hc33wRW3Y75UBwl+XN7HLB1l22Xc763xYRFSA42zLjML71EYXhXYAuLH3MgR4
	FT8LKLvmyXuxaulsstYWsASd8Hr/o+6YFlqea/B/HV2A0v41CGCBdlQVKkl0kbkELhxZ9LpRVE0
	nGb1O3O0uC2sYeYXFiA9fhXtVucLVywBY
X-Received: by 2002:a05:6a21:103:b0:3c1:d78:6457 with SMTP id adf61e73a8af0-3c44b02ea57mr4433556637.32.1784834178842;
        Thu, 23 Jul 2026 12:16:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:103:b0:3c1:d78:6457 with SMTP id adf61e73a8af0-3c44b02ea57mr4433501637.32.1784834178262;
        Thu, 23 Jul 2026 12:16:18 -0700 (PDT)
Received: from [192.168.2.3] ([49.204.16.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e070538sm22149978eec.20.2026.07.23.12.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 12:16:17 -0700 (PDT)
Message-ID: <c1db2ca4-ad1c-440f-bff8-eb7660af8021@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 00:46:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
 <373bd00e-bfcd-4f6c-b64e-a707af01417c@roeck-us.net>
 <cdc0fb5c-d277-40b4-8b00-c73eb881c062@oss.qualcomm.com>
 <4f2d9c51-1059-489c-a469-562ec52015da@roeck-us.net>
 <24a0ac2f-792e-4296-949c-047d9ce1c1f3@oss.qualcomm.com>
 <3635cd34-4c11-40fe-a9ff-48b752fb5150@roeck-us.net>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <3635cd34-4c11-40fe-a9ff-48b752fb5150@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Xq4FCRiaJ2UfyK-AIR23RBfiT-iWwrHF
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a626884 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=BvtW7Q8lqb1UdYndl6lHrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=l_Mds-CbMwRO_PrwST4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE4NyBTYWx0ZWRfX2AriPBO/Kbnl
 fPKfzuIdKB/I7fIa4+MK1nR9nyH0QfsQhk+DErR2+N13nUHzGCtrpr83fOc4SGebhEEj+DPWcUU
 Xl3UVT3kOl9mL5afTLd0gMv01mnFMP/x+vpYlww+iXLS1M6Bu9gPyRoaieprvTiIQp3NuUNtZaX
 ZT1RU32UkNnoygch7Tcxaz3br+vnY8YYp7Z5YPC8pPvEG2qdNYNaPpPRj88/YRt4m/FBoGBcTWo
 ukLyCUTujxN8Y6rmZXLR8qVDHE9fZdb6LYXmsdFeLohU/PxlxCHB3u8pXx2cXJP7qJw7K8Tz1Zs
 l+Poan3tFv67/5FCQFoI7TtB3/pFnOf8DcCq9DW1Vb9Hz4RznddcQGGT34v5HBVYzkl16e7XTPf
 ewVXcE2HaKOoZaYP4DFN+l3KORBiMoKdJAsiYDkc8rgu6jdeHPTmr8zZTEKDgEdptbYwgMY2aKF
 E4E9Fues94ay/wzjbtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE4NyBTYWx0ZWRfXzsyF25eAOUMh
 gXtfdBgUFizpXDGX4xL0Lo6vvmz3R43stHO52ud1yQ9F8KLQWf6QyJcarFFRfuwJwkq1w2+zIfu
 3vW3+HxNsHuT4FVpZdQldDJmK+U7Kq0=
X-Proofpoint-GUID: Xq4FCRiaJ2UfyK-AIR23RBfiT-iWwrHF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230187

Hi Guenter,

On 7/23/2026 12:29 AM, Guenter Roeck wrote:
> On 7/22/26 11:19, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Guenter,
>>
>> On 7/22/2026 11:16 PM, Guenter Roeck wrote:
>>> On 7/22/26 10:38, Manaf Meethalavalappu Pallikunhi wrote:
>>> ...
>>>>>
>>>>> I am curious: Why not use static initialization and use the is_visible
>>>>> function to determine if an attribute is visible or not ?
>>>>
>>>> ACK. There is already a comment in v1 suggesting the use of dynamic 
>>>> allocation based on the available attributes rather than static 
>>>> initialization. The intent is to avoid having to perform enable flag 
>>>> checks in multiple places.
>>>> . >
>>>
>>> You lost me, sorry. There is only a single is_visible function,
>>> and its intent is exactly to handle situations where some sensors
>>> are not always available.
>>>
>>> What would be those "multiple places" ?
>>
>> Understood, thanks for the clarification. I'll revert to static 
>> attribute initialization in the next revision and use is_visible() to 
>> control attribute visibility where needed.
>>
>>>
>>>>>  From the earlier exchange I had the impression that there is a large
>>>>> number of current and voltage channels, but it looks like there is 
>>>>> only
>>>>> one each. That doesn't really warrant or need all this dynamic code
>>>>
>>>> Yes, this hardware only supports one or two channels (voltage and 
>>>> current). What we discussed earlier was that each channel can have 
>>>> up to three threshold alarms (warning, critical, and emergency). 
>>>> However, the hwmon framework currently supports only two limit 
>>>> alarms for these sensor types. I have not added support for the 
>>>> third alarm threshold in this series to keep the initial driver 
>>>> support aligned with the existing hwmon capabilities. Once the basic 
>>>> driver support is accepted, I can queue a follow-up series to add 
>>>> support for the third limit alarm.
>>>>
>>>
>>> What does that have to do with attribute visibility ?
>>
>> I was only clarifying that the channel count has always been small 
>> (maximum of two channels) and has not changed since v1. The earlier 
>> discussion was primarily around the limit alarm attributes. That said, 
>> you're right that this is unrelated to attribute visibility.
>>
> 
> Feel free to use (and test)
> https://lore.kernel.org/linux-hwmon/20260722185749.2313572-1- 
> linux@roeck-us.net/T/#u

Thanks for working on this. I'll use that change as the base, rebase my 
series on top of it, and add support for the third alarm level.
By the way, for the voltage channel, the hardware monitors undervoltage 
conditions and provides three threshold levels. At the moment, I am mapping:

LVL0 → min
LVL1 → lcrit

For LVL2, would it be possible to introduce a corresponding low-voltage 
emergency threshold, such as lemergency (or another more appropriate 
name), to represent the third alarm level for voltage sensors ?

Thanks,
Manaf

> 
> Guenter
> 

