Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CE433F8C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785476177; cv=none; b=myPycgzXDn4j2d3Q3gZsYxsitEEDqtdP56cl01ddZu/EA92W0EqCJn7Xc0U+LSpGaCHaEzMgVf77LG9O+cXfJgXmBURcHKlJD9vLB9UZU+IQLLZCyv5grw34BC+k7VjQWUYHZu7PZtSnWrCaeMdv1SioOOb1t15inVV6XAZjBZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785476177; c=relaxed/simple;
	bh=HlCj3OUYyqKtQ/5rTQybZUxn2k8hK828D1vbxPLMmSU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RRW2eOmIfZeTbzuoz94YNApYh0QoXc+sF0pKnuJdatIqWQVAHf/jmWP1QJf7zuVruJPPa+KFrNk7ZeL68gW2tvLL32uy2BUd2xxna5OIcSC0S54JJ3T4K7hddXyxzq8WqtOAQsCI3Q6KhHgd0yD6jiaOQ1Md9hqFr9l77p29wHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIGQzT9A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTqW3grq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIGQzT9A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTqW3grq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5S9HK3061566
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jysv5gPSXcvU8IySyVYB1omnrR7juLYqFiyOpg6lF6w=; b=RIGQzT9AraOLTzZ9
	bdoKEJFVrrZFwumzgB4E0h6ZfE2CSQALZ1Hn81cHOj0KMRiHeobwba0AP2zvt7HE
	EgFbXylJN8I9knulVquIq0KKMbGR9F6e6H+R0WFv9nPEogT7l15x6oeoJ5UIp5O5
	aoiW6uJnI1aFgs7CkhX2j2wHoPgLbylxj0gwqs/wFeUYOCOTraIaH99JH5g4BAxb
	1VlezU7G1ot84K3ZVEUhAfVh3Jh5pdg1+HZ7fC0LjUiFpwpfi7OP4NRsXkwvth45
	mVB4n9M/fIGfnVxUHVBYjuYn30/0de1FGe+qEO/+coRDDP4//TSpEIeQ9/uiFVSf
	QYHoEg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frnk980t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:36:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so809840a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 22:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785476173; x=1786080973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jysv5gPSXcvU8IySyVYB1omnrR7juLYqFiyOpg6lF6w=;
        b=LTqW3grq02LWt8Cw2WPsPK1WuPDkz37EZNqFudC+ZI88O3PU1QBYMxq+awr87s+Iqx
         pAD6ydTju+0ET4uyWKfiaocNY2hevCqFPEnsrprAFNkdJpxNsJLNStB3IopwlmQJSZIj
         O5xSXPu/Wef/pGE5Ngg2cPuAU/eODvXLK384eVsho32AGESPhLjRcfJ5szggXJ529umg
         cy8CvwPAfriqELWmw70YDIhDJgMwk8kMuyUSzhN07d1EKxYYBIyTMLSWsXQbI4m7V3P9
         QlyBeY72/Lzp8NcrHxsYuYBz5JYErIiDcTIuxe1gzPzGho3pwL/a3v2+Q4CVQKqF5jt8
         +4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785476173; x=1786080973;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jysv5gPSXcvU8IySyVYB1omnrR7juLYqFiyOpg6lF6w=;
        b=IdW9xuuyJr6IGevVafBQdXLlKW9lm7LOJXU8Wz9FAZZm0xeB5RzLrw4yX99E0ojTz0
         SeG+ynFkBuqS6kx0apB6vIWVgsMh4Ss5UfKLiQKsFdf40/MO6qzPnH7I6jSdTpa7k44a
         k2xXPXMCjgT3BkFgPsbUZfkQUXwZ9JdgwMYHQLV4Le6speV5h6ioDHYPN/xuGvf3P0eD
         yNyoa1xdR2+fBFHJndV2GQu85Q1GprVsH+5/vn1SHxiG/0+fs+gapW+EmxtXUpxUKUXU
         FKg6XfU1mGEJDgFUH4hwuzP8RQ0n+iKsiSUCBUZYP68b7n1q1JHgUZjKmeMxPZhcl+Dr
         DiVg==
X-Forwarded-Encrypted: i=1; AHgh+RqeGT8RwhKHwCGN1gVRvbXjaSRu3mtTCPd/POZ8kUX99S+COFXPpKBaJf/cdP5wXerhumieu+Y2+MvSnkNX@vger.kernel.org
X-Gm-Message-State: AOJu0YzSXKk21I+f72IBGgMTKpePup0up579vDmqlwSry7ny/tvlMpZ6
	8In9qiLecmOsdAFn4xBhzii7svr8Sc/wfRIiTenlvKEypWd4wWVxd+Poi1I9Ns4W05laqRs4W+5
	HHt+5q+eEg5O+Qs8AQexTOIeSKhA7wdYIGEF7dsxUg0cs5OD/94lbdVI4KI3W3CmllcU=
X-Gm-Gg: AR+sD10YhlF41ZpbDGEIkf9nd6WsacDPKSp1UFhWGkm+FvTvIEEC2BUMatDyAK907el
	LGsDnhoiCiVqBIXCi5bWVtSTpOVi9HnKUBJYNT3Uo34jh0JFFlHkKdi+qc4ddbTq4ODXwadGXWs
	FSA2gDMw3HmWZ+wglq5Bodk8r+IU47tq6+CXpSyAmYVVI/nceFUYhWNOMOSBhkNs1zBsqAnUoxM
	WR/xV54VvwqAOvdgkgI0bKOncOYM+LQNJkZuijqc3py9kFaWHO/jKLAEA2hjrwcyoMfwyQDBcb2
	z0CZLh4iEPg9yNQRbvHgaCJp+YGHhWvlhqlvBEMG0HuGy67znJTBCLMtt2tdyLXmcnbqh15TtsW
	hp7d26U6sB3bNLgbS87L6CPZjuMVauHs=
X-Received: by 2002:a17:90b:33ce:b0:38f:1f8:1fa with SMTP id 98e67ed59e1d1-38fb11f3accmr613816a91.15.1785476172870;
        Thu, 30 Jul 2026 22:36:12 -0700 (PDT)
X-Received: by 2002:a17:90b:33ce:b0:38f:1f8:1fa with SMTP id 98e67ed59e1d1-38fb11f3accmr613786a91.15.1785476172302;
        Thu, 30 Jul 2026 22:36:12 -0700 (PDT)
Received: from [10.218.33.235] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm169062a91.13.2026.07.30.22.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 22:36:11 -0700 (PDT)
Message-ID: <e6b4a5f9-8df1-4adf-ad7a-ea1e9dd4a88d@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:06:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] power: reset: pscrr: add watchdog pretimeout
 reason tracking
To: Oleksij Rempel <o.rempel@pengutronix.de>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-msm@vger.org, kernel@pengutronix.de,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        =?UTF-8?Q?S=C3=B8ren_Andersen?=
 <san@skov.dk>,
        Guenter Roeck <groeck@chromium.org>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
References: <20260722-pscrr-reboot-reason-v2-0-495ba3005953@oss.qualcomm.com>
 <20260722-pscrr-reboot-reason-v2-2-495ba3005953@oss.qualcomm.com>
 <98e65507-3084-4948-8096-4e2d8d20dc81@gmail.com>
 <amrgDC0s3rb5Xv4N@pengutronix.de>
Content-Language: en-US
In-Reply-To: <amrgDC0s3rb5Xv4N@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzNSBTYWx0ZWRfX63/ssGRXiubn
 oFBWvULq4Uz8nt5OPBJ36JbfBNhIl3DFcKEAniV58XOj4Hw+v8BTcYQFEODIKadspC1H/lxU7Of
 BrCTcCwyCu27kcODy26aJy3eKIMCFVWBVF2z3mLtm/rQLdoyI+PnJQ3Dzsh49PsexflX7g/fnsb
 MMgFoxvydBGgK7lBZAbt9qRv3VfA8XkRqxQrSvCuhJeBPd+Cm5436fgK5B1c6H/WhsGYLIQA0iZ
 hEEhbeZKeRFMbrJfpnato5M/pKnZ1d3+lhXYvNiIyptQsjZfaAlFCaxy4IcFACufc7WJixenyNb
 LCKi/8xIwX01i8lE3y6UyiW8s8m3lJKnrFFX7krLZxGmX5dfisu+A/2hmVWAWmpT02ibrSZlDud
 j0/9ON67OxPASmTECANKTWcpJNI1X6ynjy/Q8y6Az7I8QZ2cJrLi6VK4J8AJn7Cotuvvjzse3K6
 eSUT+E3YRfMhIIcQh2Q==
X-Proofpoint-GUID: NPCPN6J1ZpO841DwUAR6CCVX3jtMczqK
X-Authority-Analysis: v=2.4 cv=c7ybhx9l c=1 sm=1 tr=0 ts=6a6c344d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=w9q8cTZDPmzYZkvZMkcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzNSBTYWx0ZWRfX4IEWMaV/9R8Z
 Ivq6NvXXekhv92fPX4Hc5uc0EiZJyN60gEPcT2fOtocNwwcv15EIsAW9gSQkSjaIIqMN1aisQKc
 ooomjTK+DaAFX13qUFLz3aDz4h7eodY=
X-Proofpoint-ORIG-GUID: NPCPN6J1ZpO841DwUAR6CCVX3jtMczqK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310035

Hi Matti,

On 30-Jul-26 10:54 AM, Oleksij Rempel wrote:
> Hi Matti,
> 
> On Thu, Jul 30, 2026 at 07:49:41AM +0300, Matti Vaittinen wrote:
>> On 22/07/2026 18:13, Faruque Ansari wrote:
>>> Watchdog pretimeout resets are not recorded with a dedicated reset
>>> reason, causing subsequent boots to report PSCR_UNKNOWN and making it
>>> difficult to distinguish them from other unexpected resets.
>>>
>>> Add PSCR_WATCHDOG_PRETIMEOUT as a dedicated reset reason code and
>>> prevent the panic notifier from overwriting a watchdog pretimeout
>>> reason with PSCR_KERNEL_PANIC when the pretimeout governor triggers a
>>> panic.
>>>
>>> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>>> ---
>>>    drivers/power/reset/pscrr.c           | 7 ++++++-
>>>    include/linux/power/power_on_reason.h | 1 +
>>>    include/linux/reboot.h                | 1 +
>>>    kernel/reboot.c                       | 1 +
>>>    4 files changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/power/reset/pscrr.c b/drivers/power/reset/pscrr.c
>>> index b5906f127e88..5b107c62fe82 100644
>>> --- a/drivers/power/reset/pscrr.c
>>> +++ b/drivers/power/reset/pscrr.c
>>> @@ -149,7 +149,12 @@ static int pscrr_panic_notifier(struct notifier_block *nb,
>>>    	if (!backend || !backend->ops || !backend->ops->write_reason)
>>>    		return NOTIFY_OK;
>>> -	set_psc_reason(PSCR_KERNEL_PANIC);
>>> +	/*
>>> +	 * Do not overwrite a previously recorded watchdog pretimeout reason
>>> +	 * during panic handling.
>>> +	 */
>>> +	if (get_psc_reason() != PSCR_WATCHDOG_PRETIMEOUT)
>>> +		set_psc_reason(PSCR_KERNEL_PANIC);
>>
>> Hi Faruque,
>>
>> I like the idea of adding WDG pretimeout resets in pscrr. I am just
>> wondering what makes WDG reason so special, that it shouldn't be overwritten
>> while other reasons can be? Can this notifier be called (now or in the
>> future) so, that there are other reasons getting overwritten?

I agree. WDG is not a special case - it is just one scenario that 
I have tested. There are many similar cases in the kernel.

In the case of WDG, the WDG is the primary reason for the system 
reboot. The kernel panic is only a side effect of the WDG event. 
Therefore, I am recording the reboot reason based on the actual 
root cause, which is the reboot initiated by WDG.

Yes, the notifier will still be called and may overwrite the 
reboot reason with another reason.

Thanks,
Faruque Ansari
