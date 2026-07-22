Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E531C35200D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727229; cv=none; b=FD12KuC/HA/5/NLd4wP6u4E/Z+I0OimarM8/rgMc3Hc3XBuVJ8qsmeLIR9NWG0i1kRa3enRBCBLZlSjPcteIOyBiiGsr1AuwcxDi3aGayhs432YOXlBpHHbMYc8+50amxweTEoeh1e+T7xlhkNum/ji3bARIHo2yiflOrqDvBpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727229; c=relaxed/simple;
	bh=IK0nPNyVliHInYc5llgRFImUtg/oBw1zId3SZsnZemc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVv9F1PPDl8PPpZags852aYaz1lx2DI2I3j/vxFda0uh1a5gudAd8nktB1U6IaahM9MIq4jgaKBpJ5rgatOkzG6sLqK1u+P/xADmu4ByeJxFCGZIGtNmVdkzqzrnURkUVd+ge8XJ5Jkm3XrkCf3h05l8sl7/QHC+kivVAuiAqRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6jGh0aC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i/HEY8IF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6jGh0aC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i/HEY8IF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDXCXm446071
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ss0O6hRBUHxNH6IxnPNV86R5Z0G3U/HPz/CmgoZNFtI=; b=p6jGh0aCk4giX1im
	UEUXR3cYR9ostzr0WwPUNMeTC2ZStLqADyNqeLXAuWslFmvcLOCRSbI9C9LAtlbn
	2yD9aSRJfArOChaUI0IOO7kuNkzsxci+L1TT+skYRM6oL1FSGpu7wbGV7U0ynamm
	LtR5jO8ABsmqGhPQJ/4S41otNC6IQHC1eUULxg/YCMtQP9j6Q/AnfxYLPO8Q2h9/
	In/CeWZyFGFW985RtvW3qda/Z6N7MHZSP8XnL3n/dYc23XSc7ElaTzSPgfsdMSA4
	MaR4E2/xjjno6CV85K5uXYCx/Szg5/ql4EjAD5XTDM0NyPYKfFFmUDAxbSu93wg9
	Dn7PbQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxmgg1t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:33:44 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-456b5122c7cso6295444fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727223; x=1785332023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ss0O6hRBUHxNH6IxnPNV86R5Z0G3U/HPz/CmgoZNFtI=;
        b=i/HEY8IFnOf2jwnuf4A2j5p2M+/qE6ylblcXSPN1hGJohu8sC6Oigl1ER9LgrYu6G2
         rU00xEk/ANmGB4v8Z9ZQ0V47zsmDgaFgraGB6AvNlcfjeq2AtF+oG9pGKEsZv4QPA0BY
         FFKdhUPGX8fEEDv3HL3rJSnBfvhqWPqEocVnoe48cVBi48qj38aYRLAV5U2nsbQ0QNv3
         BFAZn12LLGQLBOB4mTcEIgXZPYUrr/sQ9yCtBI9gFRwU9hUKNvV5SkwbfNCBGrKLkzdu
         iuf6fzMZrceboX4FqljAlQzHB/LxkOM31bfyOL5q7C43gq9tR0Ecs53ePfR1rLyEUd9e
         P9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727223; x=1785332023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ss0O6hRBUHxNH6IxnPNV86R5Z0G3U/HPz/CmgoZNFtI=;
        b=rM7BS4Fn2CpWc8hLsctlg50AQW8HcO7UO4V6fjSW8PcSxTipE/BAVjrJrkKnBdPBJI
         kHz33J9/IF7+6/PdyKPmgmKsY//hoP8lb1kOJi9+R2RxLWPvqwkLVsLntkuhLs5WhBO+
         SqoCLrHknXbqM88AFRSDjywJ+zCQGOvUp6ZQn3B61p2I/yHlXFhInYi3GgSFyVeEm5le
         h81g22kcjnOw++QNokHbqvgdvKQLBkp4OIYlyTAk+NikPbMNnluqhmGa0XM5PggjAxIi
         eO0ztnl0dpSh9qIUXmfS3jFn/Aar6csIAQWJswFgF2qMyk/w0QOdSyfzE1yELqUHYK6B
         XYrg==
X-Forwarded-Encrypted: i=1; AHgh+RrgjM/Wti7K+9WNCDdZYazSCtHGXhDSbpbzB8SAm1oNxnsI6hMt7k/UhnVD7M+0nHd6Ndkmhr2gcRD9fyX2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6+Wd+CqhQiJPWRnoRVoPGgZsnvEHK4cJZ+FfOQUDqfwhff5ST
	kWUQ1FRvYGw4QTFWgxgIyPbFw1XS41+jkmhlVBtrquoytNUXey2z4NJJEnFtgqXrY2H+YjPmBfO
	duGgNd81z1DXwUd0Coy6YFKw4SOfQlVzT9THa29VSxtQBndUZR52/VxCKVFH/Ye0KF/Na
X-Gm-Gg: AR+sD12LdX82paolECZzsAGF/lBQxxUhzl5MvjzAgIy8MXFmHXw9mMvgXHM/PlbTIS+
	6IwXlLW4HBVNEnhQ42qAnMaxRvQPrigZ7qRjNmtINPhzrJDoUO87urQvBp+YW0g/9CTGQxvblT8
	u6cxu7iiA1pv9Sf+uMrUnrg5K77WLFCLe0d754WiLJixLy3b7/CFrL67T65gNomxagZxPSZ0LDf
	LfQ/ryur9uxdGHkypLrAjHmPhLUziYxz4fzDESfdhWSkeY/cl0Q41QINkCIu88DaQbOH7+UsJmm
	od+4Hm/Bzrlu+LWnUoBRbj5qmKdaJAVYfl+Tpquj/WQge+7qzABq3HwW24ObWZKwPuOcEgZ9PsG
	JH/oBE8/QNjjFypxbrxqM6j1fibh5eprg+8g=
X-Received: by 2002:a05:6820:16a0:b0:6a3:e0fe:c4ef with SMTP id 006d021491bc7-6aa4bbd56c9mr1653218eaf.35.1784727218613;
        Wed, 22 Jul 2026 06:33:38 -0700 (PDT)
X-Received: by 2002:a05:6820:16a0:b0:6a3:e0fe:c4ef with SMTP id 006d021491bc7-6aa4bbd56c9mr1653117eaf.35.1784727215447;
        Wed, 22 Jul 2026 06:33:35 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aa79a09cbesm1395149eaf.12.2026.07.22.06.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 06:33:35 -0700 (PDT)
Message-ID: <fac2633e-db28-494c-9b31-358ed6d0ce14@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:03:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 02/13] power: reset: reboot-mode: Support up to 3
 magic values per mode
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
 <38115586-9913-4d6e-9447-e82aee811dd1@quicinc.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <38115586-9913-4d6e-9447-e82aee811dd1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D+V37PRj c=1 sm=1 tr=0 ts=6a60c6b8 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Fs1vR9WLwBkDfa--pcoA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: Z4K_SlyO-WlFKQmBtGZXYDSDeTuGsuUW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfXyTTB6HET3PvT
 ZLUJlMSisAUgAOslAkYefIgvQNrZFfht3FA/LSAiB5nl6O/+/0Hf+x+pbhwrH4K9n/uFB4Cxu2s
 MK9+y5pQJnprbh769MbZzvzF8Yg2zr4=
X-Proofpoint-ORIG-GUID: Z4K_SlyO-WlFKQmBtGZXYDSDeTuGsuUW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfX6by/ArSj/1pW
 5fdlCbeqrqr4SK5nsptt9miquaeyPuwGoZ4IO+67PizlhA0ajvx9MLvK4rW+dDUotJ0vwy/LpnI
 0VI/XJqZEstdojiXn84AERIcy+QAO1+rusBqNeW0E0pfL3bbOv9gzvLmjOTdCnGuC5MZ0M77CGM
 42Dk9FzW8H0OVAqdlHtLr5C1R7jmnqqqp/I0N+QhCu9jAQ1pG7bDhbo1tmIRm9KksTqzDgjUT1D
 XVzX8njxlZGSfizYeTeyPNuYvHgi+MjeO/wrX7tQ8NhU3vK1HF6twXm41de8vMv0uagft7oJdX4
 p4qMpV/sszQMtd4UCsJDmiAWW4FYDmnrGYcY0x/kpa6ebwOigoKgZaJ5Ec7/tPWgxPSlHgnu5BS
 IkAjaGh4fmsMp5OFnH6AEbAhEokh2en2iVX/A47X0rcfM8wbgfzNI6fyPtpN7aHnlia5+XV7bXs
 9Nb4Uz5zH7aPN0ZSsKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220132



On 22-07-2026 15:20, Pavan Kondeti wrote:
> On Tue, Jul 14, 2026 at 10:46:30PM +0530, Shivendra Pratap wrote:
>> ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
>> cookie as arguments. This cannot be implemented via the reboot-mode
>> framework, which supports a single 32-bit argument as magic value.
>>
>> Extend the reboot-mode framework to support up to three 32-bit arguments
>> as magic, per reboot-mode.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/power/reset/nvmem-reboot-mode.c  | 10 ++++----
>>   drivers/power/reset/qcom-pon.c           |  8 ++++---
>>   drivers/power/reset/reboot-mode.c        | 41 +++++++++++++++++++++-----------
>>   drivers/power/reset/syscon-reboot-mode.c |  8 ++++---
>>   include/linux/reboot-mode.h              |  4 +++-
>>   5 files changed, 46 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
>> index d260715fccf6..ac69b5f39fb4 100644
>> --- a/drivers/power/reset/nvmem-reboot-mode.c
>> +++ b/drivers/power/reset/nvmem-reboot-mode.c
>> @@ -17,14 +17,16 @@ struct nvmem_reboot_mode {
>>   	struct nvmem_cell *cell;
>>   };
>>   
>> -static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
>> -				    unsigned int magic)
>> +static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u32 *magic, int count)
>>   {
>>   	struct nvmem_reboot_mode *nvmem_rbm;
>>   	size_t buf_len;
>>   	void *buf;
>>   	int ret;
>>   
>> +	if (count != 1)
>> +		return -EINVAL;
>> +
> 
> The count can be different per mode. Because `struct mode_info` has
> `count` member. This single `count` check across all modes may not be
> useful.
> 
> Either drivers need to use count passed to them or drivers needs to
> receive `struct mode_info` in the callabck.

will add a once more write function in reboot-mode to handle the 
multi-count support. If a driver implements it, the multi-count write 
function will be called. And no change in existing drivers.
Does that address this concern?

thanks,
Shivendra
