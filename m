Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4353EC81C
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785504159; cv=none; b=ISPyV26kNQkYomGHCF2UODzgfMpMpQOIq152hRegb86VYQz5d+9ubxN9sfA6UeYAhFDn8u9GREiDemVeoJr7q4D1UjFZmHKE7oPvOl6G5LNO/8YApVhWUXkyjNihhHWFPfAlD5EtL8G/OwhGddsaiQ1lrFLIXmWrESSDHGHqVFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785504159; c=relaxed/simple;
	bh=uuo89+sAtKtyJaPS4V9rNIjPQmeUr9B7tn/iPGDAsbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m5lLjJMKotA4/EuQUwrRhKZK/iPzzo7ftfraSkcXthwIKDsaEnQOh+WufgWjJsxfqxH6laREhfxfiPoLtDo9mFeil//zhiZUNWeLSxP5nyowaeFdftGptzXu7IfQYT4C49sqd2xZUZ1RryKDlrsxc7fcwx+ZmiFkeI+IEjlf+FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYF4gbzA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MVMjiSKF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYF4gbzA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MVMjiSKF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBeVQd188818
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 13:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v+9qjsOSKXBQy8fGWCIsCrOpr3B6XcgBZrg078GxUsY=; b=AYF4gbzAlx2+5pWP
	UCsAFA9KAm9t1IY/bhHWSy0pT0/7pqVfjP/h/VN2f5SEhaeebEeWqnsmiUtqS0Xk
	llekquycx4Zalnc2uTsNorHi+T1+Y87HYc5a/T4gHNePogc56F2ZJ5kdsQ2SXSw3
	2T2TZ74706nU8VOh+f97wuGPiiPWgndMLlarDYH/FyNn8Gn0ccujkF3AeD8F08wd
	vxerm1UDTMeLa/v0nA0X6OulBlJinHr+kubgPc9uOaIg/9RY3VmtQ2sOhMPnwZGG
	HqCDT75yycY4dbVJDJns5o7mesOWd6sQeCE9obPPlm25QvvxNIElRnHTmNztmO9I
	UXq0SA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1u0ce0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 13:22:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso23877365ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785504157; x=1786108957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+9qjsOSKXBQy8fGWCIsCrOpr3B6XcgBZrg078GxUsY=;
        b=MVMjiSKFzWt5zZsNc7PPWTuwWrsE5alsvRGEdNIzfXxNz32pNsK5vmIaqlFjmLIaps
         XcKJYzEVabxjCK0XpdN0b2RWpCkDWkr65qgErjmcQAZg4AkYZfCr8Zz+frSrvlAsaokQ
         PEOWO0WriNaxPip0k5FdvA9fvKtunhM02wRrHeGC3l4MHdImcbP8/LKsKhatJG7zLl98
         CEXoUqe0H6XuIwHzZbpNwSDQAp/QgOIWvj5RU7M/PleJepJ480SK5UgZkIUIwdulu/6x
         5W4ung6/R3Tz1PEYy7EKprn58iLUzOmOpT5iSBIIknYMQ/wf+ZbnsS8SRhw9NJZ1WiEl
         xcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785504157; x=1786108957;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+9qjsOSKXBQy8fGWCIsCrOpr3B6XcgBZrg078GxUsY=;
        b=VvK9s6rqmNgXq15pEe8ZjhxOEkbGuXNvKFpZMM/GIZ/gju7rNiUN4fC7mUJfAL64xb
         t6ZYU0335bUpNW6v9ck2h3tHtpF4plLQTn3lux9LWDIt4F/1VH1iRexMjKHRv2xvF29u
         L8/KlHMsHEYsqmABWmO51xV++bbQihibv4ujCK+1ddWqclPLYtKWXtog/KK5RoDh79pn
         xr+sHn2jUiCQO1Wk1MzllbGuEPZBQhWq4uIL8o3T7LTdy5qLvoCB9lG6u8Kn748WVZzY
         MuMK5KwwqHdt858nbeyJzawRNt6xLetVB1j+6Iu0yYSpHjtcH+oG9PRXKTc/5nILZODq
         gfTA==
X-Forwarded-Encrypted: i=1; AHgh+RqiUdmPe/dh7FHsj3mzd66UcbAOXyMJNod7vG8qCfCJJzCfC93JRl38jRMHQ7egZJkAWzh15cLGLdDXY7Jh@vger.kernel.org
X-Gm-Message-State: AOJu0YwbbPh0zde6hUmrgQJqAQsiNyci3Q0eqVq0Rrd/IWXpSSnioJUw
	zsXdwvxsbmbHqebydFGLMr8oVp6xCD50v6OO1g0UDZemVdHnXw3L8B29LcAP6TgcNKfXXAG9UI+
	H9vCPBQhf3i2EyrPlm9tGzVwAVcpBeWVhnBbB20fudt2tPZxU46szTcbAD5j+zrkZeDmZ
X-Gm-Gg: AR+sD11z2pf7Gqb7oS7Fn2LQkCYAN2tZB3Hxe4UH8XWJCqVAfzg83S57OD2Rc3qrMF8
	OhK/PMAO1JrUjldEEVycF8szQiEVyLbqPPaqvknu4Yvq3xU5VxpBotzQliYnFPGC6bS3fy5GpOZ
	24FqdKFH699wHXhZVUGq34qV9Vh+VOVgrUJJJsDr8dfQx+KYpGAZ7Scz2daN/PxxHJgUrwsot/i
	WpFQYOmJiwXGnnbzDbUx8hVIZ6NjIksmdpR+myZpbL93MDqO/DL1zsjvpaayNWbcwwW5RfreEVv
	V1jDxPNlZHmQGy77KRt042TjXEgTiX4F21DDkbGGJaG3EBWKA+wuXSGdFGmJmIJA20TPNoS/AvP
	/psi3Y3ERd1eybrpKEnn9m7Coa+yhHUU=
X-Received: by 2002:a17:902:e84d:b0:2cf:84bb:1ebc with SMTP id d9443c01a7336-2d0521e9e05mr385435ad.15.1785504156921;
        Fri, 31 Jul 2026 06:22:36 -0700 (PDT)
X-Received: by 2002:a17:902:e84d:b0:2cf:84bb:1ebc with SMTP id d9443c01a7336-2d0521e9e05mr384975ad.15.1785504156518;
        Fri, 31 Jul 2026 06:22:36 -0700 (PDT)
Received: from [192.168.1.16] ([106.222.229.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae19ecfsm5401795ad.10.2026.07.31.06.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 06:22:36 -0700 (PDT)
Message-ID: <34998a81-864e-42fa-904f-2e5f3490fcf3@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 18:52:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
 <20260731-b4-qmi-tmd-v7-9-3befd44403d5@oss.qualcomm.com>
 <amyFARId5K-Izco1@linaro.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <amyFARId5K-Izco1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H5vrBeYi c=1 sm=1 tr=0 ts=6a6ca19d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=x3UvaR+l8cLCJ1uKBUlNag==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=mOqVw97Yt21F7phKvS8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwMSBTYWx0ZWRfX7B8PM8Z6Y8+t
 Auuig5d0Z1sRuOgFlIizFQDB9EriJ5d0rkRJJZMbtRjsi9MEz1vbcINfLfVdgXfd6odBJVapBU/
 QQB3mKxA0gnTqLLonpcGtYa2xJRAYB7i+/APbYF7AkAMxqeVxsE1YBHwI2s2kCG0mXqKD0x9WKt
 8GR2/aUrqoQNazJ9jzyxpqt7e81JJRszcPEeyN8pOTx1H+qdRYjOCWD9ltllq0oSQEwzxcCGpag
 48WvwHDarmWk7D679FK7sruGpc/SSiTl7gvnUoHH7v0MpfEezvdgfmGhZC4cEK0Ys4sQmF56NnK
 qNQE47q94bCCgSrUKsXnFw3pMnlF1kpYhWcmKt4ucbg93fvKzMf+OcT+UtuiWxG+LVlysoqQdTC
 pCNmI3eoM4WJhwTM9QrzQ8y56WZ9M8N/DfH7RW6sN6RbqPx/NVxPmfbv+xJdbIL5Mnd2BKUv6js
 pUkxdiZ6XwZ7u2+DvvA==
X-Proofpoint-GUID: M9UIujbMPZpIoA9PQT2GLMcxBmH0QGOf
X-Proofpoint-ORIG-GUID: M9UIujbMPZpIoA9PQT2GLMcxBmH0QGOf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwMSBTYWx0ZWRfX4uhK/zXl1GQw
 kt7pnfJycOwoMgLoBX4fAxkndjZ1lVA4mTVvj5VB6ZK8RYeZFLz8c+QtuZYmm8LzDsbGqtgSNyz
 m+S90x5wbC0CDagOvIA9hKg/CVtKs8w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310101



On 7/31/2026 4:50 PM, Stephan Gerhold wrote:
> On Fri, Jul 31, 2026 at 04:03:49PM +0530, Gaurav Kohli wrote:
>> From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>>
>> Unlike the CPU, the CDSP does not throttle its speed automatically
>> when it reaches high temperatures in hamoa.
>>
>> Set up CDSP cooling by throttling the cdsp, when it reaches 95°C.
>>
>> Add polling-delay-passive so the governor periodically evaluates
>> the zone during passive cooling and steps up cooling levels when
>> temperature stabilizes below the next trip.
>>
> 
> Would be good to mention why you are treating hamoa-iot-evk differently.

thanks for review, will add the reasoning.

> 
>> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 32 +++++++++++++++
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi        | 63 ++++++++++++++++++++++++++++++
>>   2 files changed, 95 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> index 9fa86bb6438e..a146be1cb5fb 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> @@ -1684,4 +1684,36 @@ trip-point0 {
>>   			};
>>   		};
>>   	};
>> +
>> +	nsp0-thermal {
>> +		trips {
>> +			trip-point1 {
>> +				temperature = <105000>;
>> +			};
>> +		};
>> +	};
>> +
>> +	nsp1-thermal {
>> +		trips {
>> +			trip-point1 {
>> +				temperature = <105000>;
>> +			};
>> +		};
>> +	};
>> +
>> +	nsp2-thermal {
>> +		trips {
>> +			trip-point1 {
>> +				temperature = <105000>;
>> +			};
>> +		};
>> +	};
>> +
>> +	nsp3-thermal {
>> +		trips {
>> +			trip-point1 {
>> +				temperature = <105000>;
>> +			};
>> +		};
>> +	};
>>   };
> 
> Please avoid overriding node values like this... One quick rename of one
> of the involved nodes and this will be silently broken without compile
> error. Nowadays dtbs_check will *probably* catch these, but if you
> override values using the label reference you would notice it
> immediately when compiling.
> 
> All those nodes already have a label you can use:
> 
> &nsp0_alert0 {
> 	temperature = <105000>;
> };
> 
> &nsp1_alert0 {
> 	temperature = <105000>;
> };
> 
> If the same pattern is already used for other thermal overrides in
> hamoa-iot-evk.dts, it would be good to prepend a patch to fix those too.

thanks for review, will update this.

> 
> Thanks,
> Stephan

