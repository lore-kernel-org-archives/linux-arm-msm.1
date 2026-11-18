Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983128;
	b=sLIvTFctIxVGAp7BHZOWijT6JOUgMeSBtFx+x8o2s/I8KLLkvpcnQD0GentPWcWwm/sS
	 nAjzMifqCz4nEC0i0UX+pU9zYIEuZAfbd05Cp7cmEWlIprvzTNUPRevpulMI9EzGGdDbh
	 nCCZHlpffB8O33E5Egi7IGFzZPGon2XawhC2/2PhxGQhHAmg21a/wqZWwWMd4ajvxWnVe
	 /1DpAA28iyOE0TqgX+4Oy5CjBqM1THQzAZqWgYPP8qInTevXRh+N53AezMmxoGSowB9XJ
	 K//v9Qsc9d2Kzba5q3bcKY664rLRl4WLYFwt2DzYuOPfbcVnUpUu8yM8fHPD71C42FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983128;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vHktRanl2tt0UlSkckJQ6mb0uteRAyXN7CZHm6pyMuY=;
	b=Tok8ThT5445VbLPPUho92ufohBOOqKUamYjiDaZU4wtEK8Ol0l7Raz9dRvJLrQXMLuln
	 nnbmSw/Vl+o69KC7ATdu3WvSaJUk6h3zIifBGHb+yAPMDfkCgyaM+SrunQee4oEgmixza
	 J2VOn3CUdK0xH1i7DDqdijeWMpKLhyNyU2ik1KzPPR76kLJz9ilIBYZYmMUcZw9ikys6E
	 H0LCzrQsTkw7uFD1Yb0fTqpLdVRSyzYmf6uD1mCWIrz+A5c9dqYzy0TfGFgliIdmk9lEO
	 40Epo0Ais5lQdoK/qP/LCVdmPuW7aGamW7ihnaK55/3VPZrX+CiPlxVZeBWrKTKFPwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AQTOwXO7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LMpNOTIJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720B0606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 720B0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AQTOwXO7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LMpNOTIJ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V38W2453769
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vHktRanl2tt0UlSkckJQ6mb0uteRAyXN7CZHm6pyMuY=; b=AQTOwXO7FiQkVjmD
	5axA+ItGGGgIE4xstftS8mxDgz/nA64w2UWB3ElFZwoFM0QdQgtjodwMBGP6UJvO
	4d41JnqG7o1DsQOOX+LdW8sOzbiYnT0bwtNi/UocGxiL4Z/ZdQKkjrV6KVErVmgC
	UCWkl0FTecYv7ng+9YVVUMM0d8dy8yIYmWwbfCf1B9QXZeAG0HfOvfzO3HIL48Aq
	oDmYpsMQSGhtiQchuoyxHCEbDeDvHSYbqKqdkEe/l2nGdeEbJtzwA95Lzpp5VMln
	GFosUPSzA2weirAV2hVK5q/vVU91f0Mt4gG7v9w4xXfylALiD1p1gcgbZl0Vtk0w
	VF4Hrw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99hcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:25:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efe2a88b7cso3488035ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983125; x=1795587925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHktRanl2tt0UlSkckJQ6mb0uteRAyXN7CZHm6pyMuY=;
        b=LMpNOTIJgeTocO/gTNrWM/6r5/1SM/RkoepX4xDrhAO2NJs/JIuhx63Nl2dAJWvyHS
         oNjcQISi+GewZ6hooku/012DXHEd5A2xHIARgAwB60d6ILQLPgpGu9xNauLW/NwTovL3
         wU0Y3Rc6d5exwG7rZSO5W3lrk3E7RSQ8NSfy+IvfitZ36LVb1r0d5ds1fLzn9DxAf96U
         SIb02ftY9bo/pxJdZYYNjxDaiZl3jucu+735VaQSTnEP4CAUfY4KEeeDyIglvZsZOqXu
         EFcrOO60gL7CviHfc5gshEwCW93THvO/d3B4FVrnvBDtGjczNuuIHRZDp+SeLspQNRS/
         VETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983125; x=1795587925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHktRanl2tt0UlSkckJQ6mb0uteRAyXN7CZHm6pyMuY=;
        b=dnp2lU+DwYmqjRwQBhWZjNYm/QsP45lwrhX/YS6aD+U2bcgjYpPtJX7Ifa9KPuZy2L
         bDath50zw4IsxeP6GJPNV60X+Y/iCsc/iluWmXuI/tBqE1xgbgfR0SWMC8/mv+HOJWA+
         afXrbXn2CN064iGaWRNZTYf4N362L6cWBA4esdiAJ1GoTDIOzrBHzRkM3GIljnFKIDZI
         IdOrNh30YRxt9ZXjXMOh5IjgjjQyUHDI0fQKQEKf+WBVssg1wn7iA2KhO1nv2uk/pzgZ
         HggAHRdDsOpKsicDJjqyy1rY6w3uefE6Y8Ro3AcZsXYj0E6IUpwR2tW6joivItbLQQBh
         3vcQ==
X-Forwarded-Encrypted: i=1; AL+hErFslIegmZIkLNP88dU7r4RxatOcRWgwQON3GKvRFoGivOyTUb2MouZcYtQhqBCU9HxRZG4oRw+1BFsjnXKF@vger.kernel.org
X-Gm-Message-State: APuU4Z90/X1WCIZcHdYL0cBL/Bh0i0QnzHCtRvkhjjRsLiOk/LXd8kQl
	RxJk8tBlocA5q68uyWOEzXQnTEVkAKdKwMSCBve01zZw0d+FhfUKgibq6UUetm+LVbRu6Q3ympi
	u0VeCYPbm1f7IVJGvVWYBkDTL1q+6XLq07yRMAOCN4PJeXTrDSvFyXbY96pi7QwtYqArQ
X-Gm-Gg: AZFdTZcxQYw/M5sTdtj2qxzP5D4f6t87eP6rOg17amBc+U+eA2gNVMrPDZ9uc/34WWw
	4ahCIu78BDMJbeYxyeWPXz83AE/zYDyy+5wmkHKExJvClICmmhcFZX25opsM3WZ6Hdpl6HsZjYp
	Vn5hugXsQTMWj9eAtm8Ncb3PLHfV2ggZRwRwzy50r/yhHpxegSXC5dw9jn7479o8KZzbOc6wqE/
	7GBbQsS02gYRq3u0lAsM5AyUzojas+ohJ/Z2MCYRhTqijLI6jzTs1U8qQBXEUiG+nvSck2W8c0S
	ShXRQyNZprFLcSU5rFE2Et/jDAUOqM5VlrJp+eRhczO2oANXBmwU72Mic0jmBnu02c/JvAQYU/2
	Kc1Dtl5RNCAvj6gsKo7DhYOGR3RicMy4yDfMIydE106q+z6/905Se+W4JADWAhRXQlS7q5loOHv
	WuFw==
X-Received: by 2002:a17:903:90f:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2eff7100c5amr16624385ad.5.1794983125083;
        Tue, 17 Nov 2026 22:25:25 -0800 (PST)
X-Received: by 2002:a17:903:90f:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2eff7100c5amr16624175ad.5.1794983124581;
        Tue, 17 Nov 2026 22:25:24 -0800 (PST)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61841aasm7605435ad.34.2026.11.17.22.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:25:24 -0800 (PST)
Message-ID: <e2967948-59d9-4937-8c21-39bc8b48b195@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:55:19 +0530
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
Subject: Re: [PATCH v2] thermal: qcom-spmi-adc-tm5-gen3: move hardirq actions
 into threaded handler
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
References: <20261113-adctm5_gen3_hardirq_removal-v2-1-a0c9c4800941@oss.qualcomm.com>
 <avcpU3P1jw8NESMu@ashevche-desk.local>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <avcpU3P1jw8NESMu@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNSBTYWx0ZWRfX059dazAiLbEB
 k4oJzqiMORGH6kidB8FLjo7+cKTlI5N06VUWUmov84MV9w3W494S/eqxGF3+f/NDxOjP0JCkq+J
 vXiGxDz7Lk8uMJPLCKqem45zIhvfU24=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd44d6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=niP4JTYLpQ8y5GhiJJEA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNSBTYWx0ZWRfX0VJj7NeHTAEH
 7gac3BAHXebc9mz0HOIsTWy5VeOYHZCu/4+0E7KH8ngI9zcJBtNFnD1J59v636LM/yPCKydX9OG
 CeCZB3Sss0FVaKt/CJx5NQgm4FAXDMi6MRXkDjlsyFExq1XQk55OzeLUT2k4sCfsvTCMNGwcztC
 9Vo9Kc5XNM5jbzTyTQrEddiqh2P+2WiCAwI15lIQsHKXQb7/dnRRTNfpp9nH+iQHcsbzxrORuOC
 p7EhC/dSvxkgT31+6fRHVBp7oSD8Dik41RHf8gZs6XiN75fPtsJ1TSkESmoe6RHd4aruo6EstI8
 5bgxew4w2zpQC/6ihNjwYAN3BcPk3uZwAqXW2yt8lG9Nus0OrWwW8m/yCRmxPaNPgTkwz2B/KoW
 VcjS5M1fa8BR5uJWPIZM4Hqn1JtWkWfMZXQRefxy9OuK4NVDlyBl6hajisQI1GsXWtfWj86j86X
 x2mBk85yKXwLyAoDj/w==
X-Proofpoint-ORIG-GUID: 7cJVjVSWv9aGv0XFojeWem8u6Pb6at2g
X-Proofpoint-GUID: 7cJVjVSWv9aGv0XFojeWem8u6Pb6at2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180025

Hi Andy,

On 11/13/2026 8:44 PM, Andy Shevchenko wrote:
> On Fri, Nov 13, 2026 at 05:23:03PM +0530, Jishnu Prakash wrote:
>> adc_tm5_probe() registers the ADC_TM interrupt with both a primary
>> handler and thread function (adctm5_gen3_isr/adctm5_gen3_isr_thread)
>> with IRQF_ONESHOT. The primary handler calls adc5_gen3_read(), which
>> takes the SPMI regmap's lock (a regular, non-raw spinlock) from hardirq
>> context. With CONFIG_PROVE_LOCKING enabled, this leads to a warning
>> about an attempt to take a lock in an invalid wait context:
>>
>>   swapper/0/0 is trying to lock:
>>   ffff000b67201018
>>   (qcom_spmi_pmic:259:(&spmi_regmap_config)->lock){....}-{3:3}, at:
>>   regmap_lock_spinlock+0x20/0x40
>>   other info that might help us debug this:
>>   context-{2:2}
>>
>>   Call trace:
>>   regmap_lock_spinlock+0x20/0x40
>>   regmap_raw_read+0x88/0x328
>>   regmap_bulk_read+0x10c/0x340
>>   adc5_gen3_read+0x38/0x50 [qcom_spmi_adc5_gen3]
>>   adctm5_gen3_isr+0x90/0x130 [qcom_spmi_adc_tm5_gen3]
>>
>> There is no requirement for any of the work done in the primary handler
>> to run in hardirq context. Drop the primary handler and move all the
>> actions in it to the threaded handler, which removes the invalid wait
>> context warning.
>>
>> Note that both handlers used a local variable to hold the index of the
>> SDAM whose IRQ was triggered ('sdam_num' in the primary handler and
>> 'sdam_index' in the thread function). These are the same value under
>> different names and 'sdam_index' is kept now, since that is the name
>> used for it at other places in the file.
> 
> But this is not the point. The point should be semantics of the variable
> and not frequency of use.
> 

OK, I see, the right reason for keeping the name 'sdam_index' instead of
'sdam_num' is that the variable represents an index instead of a count
and not simply that 'sdam_index' is the name used for it elsewhere.

I'll update the commit message to mention this, but do correct me
if I understood your comment wrongly.

> ...
> 
>> -static irqreturn_t adctm5_gen3_isr(int irq, void *dev_id)
>> +static irqreturn_t adctm5_gen3_isr_thread(int irq, void *dev_id)
>>  {
>>  	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
>> -	int ret, sdam_num;
>> +	int sdam_index, ret;
>>  	u8 tm_status[2];
>>  	u8 status, val;
> 
> I probably missed to point that at the same time we can split semantically
> different variables.
> 
> 	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
> 	u8 tm_status[2];
> 	u8 status, val;
> 	int sdam_index;
> 	int ret;

OK, I can make this change too in the next patch version.

Thanks,
Jishnu


> 

