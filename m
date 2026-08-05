Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5048440A944
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926859; cv=none; b=K2TwRjDAa6p/m8DqD5PcjAhaTJkxQBsPrH5q8B+0vfc2vhmHd2Mlobkxy3Y37rrJHWkm5icfJkzk32ScVcHH+FNa/SJVxxLU5X/tbbtjnMI0eHg+IkIYq3imhlygt5BcZSRahIvFVtaZGhiLpRZKaGIEWm2Ezwtw2Yo3Ts33brw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926859; c=relaxed/simple;
	bh=/PWgap84eb3PT1vleRSyOWs+iiOmgUCOw0Xq2cxMshQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uYqoAo3r1vbrcTDTPCHjtufMaYIkD2KYMTa+cdEdBPMKfvKM909Vi5QX28686n3WfwHjIx3LLWGT2YPCIacieHc/Le2Ai11Y1FswO40PNVEMI0aETlwNno2VaQGCF8MZbma58RiyCCpQgd2UVERfImSmmU9zIozU2GNEpHvhsDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UmftY71P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QyL1iTdB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UmftY71P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QyL1iTdB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dEMx2912018
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 10:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ss/eK8cGELilAVeOlfILSBb56cf4qKwKczaCfskWD/I=; b=UmftY71PWWRdkCSl
	QPyRRH/qp7st/mTNnUr8FAnvF3jXeE1cbfAEyoeOwmecjSMEmNWB7TK5WgAsxk0+
	096stGNpyiNK3eOUjpudoCBrEuxdBiNmz0zUICEhAUBtPjjWSuLjXhgddh2NyUvs
	rhQ2u86OQHBuic9PqdmWJ5QcH/afH4/fipUTui0+g0KvGWzM4dpvwtePQTc4msQ8
	xYNYXkpfyMo8B6K5VMwZhP1X9czdI64dcY+AdNkG7q6/zWZYX7I8UEkpUZ7UhSyV
	KBH/nyUHEccPOVu/Ku3hU+T4jJVcIUFddxqeE0s/Y1/r3kLu9BCoFFFvttcgBQuq
	tL4JHQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuku349rw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 10:47:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so889238a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 03:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785926856; x=1786531656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ss/eK8cGELilAVeOlfILSBb56cf4qKwKczaCfskWD/I=;
        b=QyL1iTdB03C/3h5X/Og84we0DVfqVtmeHajEnzLNy2DfBUtg6D/t3AJYTYPCHg7ZKc
         usEhxnNl54A0MhdNRkJC5UsiPM2ABoF4XPQgNeOm+9cmP3HzLIScl9xLqzMiOFS3zUXB
         kLlW1fwZSHjK45Jr5B7y5oiyxJIJWcn2BByn8B136hnnI7ln0zoYoHqCZXooFeGOEB3f
         09mt9LrZo28wwOgum25inoIpp199MMZTS/W57LFBtJ57J7hRmvai3ljFzFnbTkL1Lrnv
         HmbMY2pIzC+TdIU3e5CHsYIxLb4dhMtjiwSL+PItKy7z/0haL196dnEHuDIWOr+g3efy
         5t3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785926856; x=1786531656;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ss/eK8cGELilAVeOlfILSBb56cf4qKwKczaCfskWD/I=;
        b=pFcDu+nQo6m9+UWL674hhVLVpJ2XrrzAIpfYGCiCwohTeI8sBsf/KZLSpA68PLiH0M
         jOh+qDije2ZB0xWgCQlbNBCwlVg3xo2t1RY7+c5f0sWUvmz28HipdTbMmpn7t5CvzZk9
         d3xHqVmqtqGeD1Wq2TkUZWxNcO44BwSbkqZTthgXTUEW3YyVMvVZ0bMCOyBkdzgE3sNI
         mvMtCGJHsqFOcPlLUYMdfUQ3WLfZ/GvsO5XTNW0UMA8eiZ/c79r5fba4Xjldgz18Otvb
         uh8Nef5pe2MOWueP07y1SyeEdE2zkmx75yceAYVRwFpgjCtI8afyW6wzavKvrJP4DSMS
         WCwg==
X-Gm-Message-State: AOJu0YypSyEjV9io3hGbGHvfCbvfanJpxc7Fgy0bf8fOCT8ZWSlScd1F
	alhsVPY5QEVuFTi5Yzox9odGlW3dK0XV8L7mAdlhnwXzyXLHICF9T4acjB7MF1GFqYNPiEAifQD
	r16AeIFluDRe2t+ZXQu2D7LsNAUBCdCucSZ/SgDO7g1HfQHN8aLUgy3fPnacwTwUoSI3w
X-Gm-Gg: AR+sD11q/HVad/rg0CC97Rig1xRfK0BFqJCZHipQ+8JX1NXrHntQ0fU3FaOVwkDUylT
	heK/sbgGE/GzITQUkG5Y+2T6P4uE+iMiyWj4iuj0yBp0jxp5xeDYhNkQ0eRQcwI+nvGr+a6Zbve
	T77fEveeRbyg6rfr+W7nP1Vl8IxNtAD+iIkpjFs8E+tVqF2un24ByLJSm5b4R5PRRVoYxuE1iHm
	A+K9vmaTjaQw2HRX9VO2cHd7Rt5AQAI6QoK8bByMewNQXSggSqJ/PL/bMT6jw8wggLwzxS59EKU
	ME9ZLGxQPXrwIYFUW8g2PsUxjXMFWJ+FZ+2Au3/5cP2NoInlHbp1mdsFwJ6Q6R1wD0xLI3eIOlA
	WU9Hk480HA+RkL3NCJpnJf24TwO7idyoP
X-Received: by 2002:a05:6a21:4685:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3cb85f4a279mr6962694637.31.1785926855969;
        Wed, 05 Aug 2026 03:47:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:4685:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3cb85f4a279mr6961166637.31.1785926842212;
        Wed, 05 Aug 2026 03:47:22 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe707c9970sm1315488a12.6.2026.08.05.03.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 03:47:21 -0700 (PDT)
Message-ID: <06c37244-d589-4867-a189-efdb300bbce1@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 16:17:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20260722-gen3_adc_tm-v4-0-011981f756c8@oss.qualcomm.com>
 <20260722-gen3_adc_tm-v4-3-011981f756c8@oss.qualcomm.com>
 <a68078d9-9b80-48af-808c-af24d97268c0@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <a68078d9-9b80-48af-808c-af24d97268c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DOlVRncvkOaOeQAKBZWrqKSbD_bH15LD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4NiBTYWx0ZWRfXw9qbkquduNRf
 efvFjC0cF97qU4yYz9vqo+c/e/t3xOpSwj2wPt9qG0/4QMZOzoXCUXCK92+xpcfq9C1pilr/rat
 duxxYQMxjsRlEFsQOGGNtZjjpaOo8HA=
X-Proofpoint-ORIG-GUID: DOlVRncvkOaOeQAKBZWrqKSbD_bH15LD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4NiBTYWx0ZWRfX7toaIHgTlXjy
 Ty7w7rJVHQhcP+133yfCnjedfcW1qYcvfLmBKuZbPu0wLOD417ZsrOUCEBKaE2Nk4xGptkECfgS
 iBV8OBicRE6e+piwkALOULnEdtczyASSgMdN8zjzxrpBkNCW4GldoLEY1PUp14I++xe2LLA35/h
 Y+MOCeg5bS1Cs/Qec2z6RuT/VtCSsA+c5Fc4z+k4jJDbeAtTkT0Wnlx2irVd1dBb2/1s300Oz5t
 Kobag3a1mKr+4btq9+5WF8O674/c70XF8UqHSO9Edy9CaKQTRMROCPHBXeV+ZC6jvAKNrBcLe89
 NgZBnEwWh+93R8+YRh1ltQFwy9mn0AJuUeSQAzqWABh+6V1dGUkobmNfXFmcLLsI6brSJ6HOgmN
 GW+NkLPpkPG8Z9SKoXaGCoeNsK54wxUsVMTH3pHcu8IMYzaqU9Hqiz8WsqWiZnPjayqbvTfAqL8
 C7MEohL07cVneKmQkGA==
X-Authority-Analysis: v=2.4 cv=X/hi7mTe c=1 sm=1 tr=0 ts=6a7314c9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=y6G8bwdjvvgfd2dEMfwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050086

On 7/27/2026 9:13 PM, Daniel Lezcano wrote:
> 
> Hi,
> 
> Andy ? Are fine with these changes ?
> 

Hi Andy,

I have addressed all your V3 comments in this V4 patch.
Can you please check and confirm if it looks fine to you ?

Thanks,
Jishnu

> 
> 
> On 7/22/26 13:26, Jishnu Prakash wrote:
>> Add support for ADC_TM part of PMIC5 Gen3 in an auxiliary driver
>> under the Gen3 ADC driver. Its functionality is similar to that of
>> PMIC5 Gen2 ADC_TM, which implements the threshold setting and
>> interrupt generating functions, used to support thermal trip points.
>>
>> In Gen3 ADC, the register interface is implemented on one or more SDAM
>> (Shared Direct Access Memory) peripherals instead of dedicated ADC
>> peripherals. Each ADC SDAM has eight channels which can be configured
>> for either immediate reads (main ADC driver's functionality) or ADC_TM
>> reads. By convention, the first channel of the first ADC SDAM is reserved
>> for all immediate reads and remaining channels across all SDAMs are used
>> for ADC_TM functionality.
>>
>> On the first SDAM, the interrupt line and configuration registers are
>> shared between the main ADC and auxiliary ADC_TM drivers. Access to the
>> registers is protected through a mutex shared between the drivers. The
>> ADC_TM driver accesses this mutex and some other functions shared from
>> the main driver (like adc5_gen3_get_scaled_reading() for immediate channel
>> reads in the .get_temp() callback) through APIs exported into a shared
>> namespace.
>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>   drivers/thermal/qcom/Kconfig                  |   9 +
>>   drivers/thermal/qcom/Makefile                 |   1 +
>>   drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c | 434 ++++++++++++++++++++++++++
>>   3 files changed, 444 insertions(+)
>>
