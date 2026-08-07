Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D9B30E0F2
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 14:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113717; cv=none; b=o5T7umK85W0Yyd7e7/SnOVht5KyJI+lCt5TLLum7uKK1o07uqPmnDh3xFRYChCB10msrI3xpfwMa7ulIiaT0905YcbivZhFD0trKOk4SGtY2Nf35W1fc6v1P/7guAhLQxvUMWWG2f+bF9vViS0/4aBiz3Z0I13s4zxRX2ZiXmag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113717; c=relaxed/simple;
	bh=Y/56oPVEffBjxjNx1h3W7hMYUb1prIOk5BYimmeMUXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tsgif9VYbkSej8huzQbRuM4sr0Bsq0r1Qx51erKYtJZ/shrBlQfgfeaJY2PJHIB7/Aj90noeke1hgv8qUc2Bl94KMrCVTqdaYcHLSF5US2t4cN4Fyo3xoHAINM0+bsB53HIQdSEPfoXgnPFijDN4BRgOIKrVjmM/92HSJ5wW0qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inE+e8Zu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ks2S1i4R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inE+e8Zu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ks2S1i4R"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677CgYhF1004409
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 14:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sjt0nLmUyvEX6y/ApHEY54VT/ZTHOS9hutf9WJJqwBU=; b=inE+e8Zu3U2Owgqb
	RRZyczQhWDCJuW0ZbaXjYA93JFyksduCDH78lpaiXp00n0Q5J0Pd0dZ8mVAvYrrr
	jEdOCjIE61mT1LXwtZbNUUQdHHQoC3zKjYoC+31+ZxuIlZrQp8U9qQ8JMPKh2F8e
	/VrxAOk5NHw8nuBrY0GGKu+pLBqn7Wd99kHpbh13jAWg9ISNKoajtDJbO6KzZHyc
	KwLau6KKiMGJbM1h09xfB1WpLz3/PdUhNg9biLATmoDX6rjffoTQnkfOK2LeNWq8
	lqf5HxqQYaflPkEJoLcwKS5ve3rwYgjPSPb0YuhwhO5FcCJvKTv4tWuZdRobLMHA
	ipYMOQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6fvh8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 14:41:29 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e67e87752so34362607b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 07:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786113689; x=1786718489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sjt0nLmUyvEX6y/ApHEY54VT/ZTHOS9hutf9WJJqwBU=;
        b=ks2S1i4R8qeMyEqrHFqhERY2LMmU2kgHH08YS/h6jxoWuhKrOr4mhVEsVmegKrXSO0
         4xrmTNdqW2gJKc69IdkIWATcpkvT8MA+kAjHxeJoncrgWQ7wEyQBiI85J+/ePsZ5Cwge
         /Sjt5Kw6bgrVSjrj4QAJcT1OFE08h72i/JOjcRqV6Q2w8FK31e1/e3+8MsXgq0U0Nt2n
         nBWn9qcYi+ak4VBOWG9eoXsQmuaNzv9wGY0OQ62poTZcaYUPCMK74L7quQt4b1p9llAk
         e9kn8NGjEebhed+8X7TKkDyOAHBSF+1uIXhGLckMuBZ1S2AuV5v91NH601enovQfAMKG
         8NaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786113689; x=1786718489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjt0nLmUyvEX6y/ApHEY54VT/ZTHOS9hutf9WJJqwBU=;
        b=apu9hKLVANZoxU01gArONJPQTWbXgav7NgzDSTHnOuqNfCFnF9wG/gb1GxwfaSB4Zn
         TjKuZg9m8ny199Vr0jgrwD3wI805OZY5sKH+7AgzNeqWLMuA5C7A1PEMOAerwgfbUVta
         KHPHNCe6l4ksHrhURgmae6rexsm8ipFBSociHP2ERE6o+Uu4DZRuuJuAKaDv9f5Z44nM
         gMA+ZeQGAVikYf9dPVWtlatgwDIPHBzLCIM160xOssuPa5ynIfT8lF5Zs0HblP7ARWch
         LZZQPA5J1GCS8T+avLR25wbs5kTJulRlRFOD6VGp1x1wY8IvOrP6pjSGUc/z6KzncYOc
         CmUg==
X-Forwarded-Encrypted: i=1; AHgh+Rqei+QWzF3mXM5wEcbN5bKbfNfHppeRpSo2VEmHdtr9thiVSpgCwEAu8BpMHYrDYuSZM9YIqImeIGtwP4pu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8uTK7FAONYOwSxKpIATjhdz4GCy8zdJbilgCJyYMpguaBoei6
	oLG7s5Jn4HhLKG22EpCZNAgBnzbYMrpZozVYQH1Y503AOivfuc0kTSIiuYDTok1pN+bp4a8q20/
	17k05KtZJwotDg+J9F7xSSAS9BvGPczjG16TKOC1BUMvK+/AL5ipHd4inpVHc6GcIjcYA
X-Gm-Gg: AR+sD12NxYgRe9ioQSLxBmrV6KT+igiz+2jYi69xumVgLNG414RhlGuGX6WKmLeNQAG
	lrIOrThMlz7k06qLTy17VUrQHYwRvZOwFg9vHq5YuU4kQMnJrdZVbuOmSHHgAa9bNK3qitu3LFN
	SsyNlPEXkilO3sV++4zKm2xDM2nlmiIQ4m2b4x96FgQJPs/6Ot3UUPuOMMw2QV7PBbvHxkQTiLD
	xnrLY8pgQ4MtN3kzi6tb5+ZE9+GbV2gRZCYWYiv6TAF13r7L5uqwzhuwhh5srXbpQ4DmC5/sNm6
	+Kx5jjf49fTcZeS8Eq3SU6RDYYAR7AQfjWI4fY+7P5aS3f624r2f/XLgcZArcIrACjrleNONafI
	/mi/aj5Q23IqtAaI2ajdcfkL+bMlJFEk9QuE4qtUKUJOKbZBmmrvECM4ljn/nzViGFJ5LyGNDgW
	xnBLktdDuuIqGUbN+87g==
X-Received: by 2002:a05:690c:111:b0:820:1251:d2c2 with SMTP id 00721157ae682-82445b54398mr18986177b3.28.1786113688554;
        Fri, 07 Aug 2026 07:41:28 -0700 (PDT)
X-Received: by 2002:a05:690c:111:b0:820:1251:d2c2 with SMTP id 00721157ae682-82445b54398mr18985777b3.28.1786113687954;
        Fri, 07 Aug 2026 07:41:27 -0700 (PDT)
Received: from [10.190.200.255] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f6a0f824sm10637287b3.42.2026.08.07.07.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 07:41:26 -0700 (PDT)
Message-ID: <5a0a9216-5dba-4b25-968a-353b30f642b5@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 20:11:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sched/cpufreq: Update schedutil's DVFS request to
 reach the boost frequencies
To: Vincent Guittot <vincent.guittot@linaro.org>,
        Christian Loehle <christian.loehle@arm.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, mingo@redhat.com,
        peterz@infradead.org, linux-arm-msm@vger.kernel.org,
        juri.lelli@redhat.com, dietmar.eggemann@arm.com,
        linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
        linux-pm@vger.kernel.org, Ionela Voinescu <Ionela.Voinescu@arm.com>,
        Beata Michalska <Beata.Michalska@arm.com>
References: <20260806044230.909961-1-sibi.sankar@oss.qualcomm.com>
 <20260806044230.909961-3-sibi.sankar@oss.qualcomm.com>
 <7a4be9a1-4b00-49c4-bdbf-649268e78c7a@arm.com>
 <CAKfTPtBoevmq8_Rens2Le=AGqMZRo56oD4eMGX2_2Pj_Vt9zCg@mail.gmail.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <CAKfTPtBoevmq8_Rens2Le=AGqMZRo56oD4eMGX2_2Pj_Vt9zCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDExNSBTYWx0ZWRfX7RjtClPBg9Dy
 aZNzRQ4ZCdjkh4KeBubRWxppgvzkFhM+bdobChvCbKkp3yNQL6ifALOtQDvVTy40xXcHj8Zsjhk
 /pTcm2d/ZwZLEDcjeDF4wjMKDn0isRt/NDo14pHD76gp2LoLg8E/tT3w1fDLWKxbUliJVmzV8UQ
 a0WZzkf+OExeVGTtdW7Gxdu0H42tPMz+CjgZkmYKoA5pPsv8zomGGdGPc6HH5uHVt8pGcsky31E
 OY0v4lGEYqyeb0LT1Ho/H88lM9co3V7u/D4+0RuU+fRfHZGuhiXMZldIjdTSrSw2LIn+37UIj9r
 4v6WZsP4VsOdRiHnZMRXBzxU2ywK97JRNTIW7X60ZZpb4eCkDrary9KktSdmqBdiclGPJIVHiMh
 m1KzwF3opqOVmWpBNBujDdeseu6snLYEDGcGot4R+grhVAzIQc62U15O/oIqb5Hn9AoE2HM4GX9
 wef2THB+DhwKPgsaSDA==
X-Authority-Analysis: v=2.4 cv=DvhmPm/+ c=1 sm=1 tr=0 ts=6a75ee99 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=bYoXCjE1SysOf1r2alEA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 9RYOlr44_FDpQejw3bJZh74CSwGK9rmS
X-Proofpoint-GUID: 9RYOlr44_FDpQejw3bJZh74CSwGK9rmS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDExNSBTYWx0ZWRfXy//sFg1fXzY5
 r6LZd3giyYTGIINCJNeq2cQ6567rflrgHX895Lka5Q/PyyOyuF368m9nigWzqwneUdgluC8mu8b
 K4HJK2VSTMcmPffNLY/zEavpnykv7oM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070115


On 8/6/2026 8:43 PM, Vincent Guittot wrote:
> On Thu, 6 Aug 2026 at 11:02, Christian Loehle <christian.loehle@arm.com> wrote:
>> On 8/6/26 05:42, Sibi Sankar wrote:
>>> capacity_freq_ref, exposed to schedutil via get_capacity_ref_freq(),
>>> was introduced by commit 9942cb22ea45 ("sched/topology: Add a new
>>> arch_scale_freq_ref() method") as a fixed anchor that does not move at
>>> runtime. However, schedutil uses that same fixed anchor as the reference
>>> plugged into map_util_freq() which saturates exactly at capacity_freq_ref.
>>>
>>> As a result, a system with cpufreq boost enabled effectively never runs at
>>> boost frequencies under schedutil-governed load. Fix this by plugging in
>>> policy-max into the map_util_freq equation, so that the DVFS requests
>>> translates to the actual cpufreq driver ceiling.
>>>
>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>> ---
>>>   kernel/sched/cpufreq_schedutil.c | 13 ++++++++++---
>>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
>>> index a1782755efcc..dcefbeaa0702 100644
>>> --- a/kernel/sched/cpufreq_schedutil.c
>>> +++ b/kernel/sched/cpufreq_schedutil.c
>>> @@ -195,10 +195,17 @@ static unsigned int get_next_freq(struct sugov_policy *sg_policy,
>>>                                  unsigned long util, unsigned long max)
>>>   {
>>>        struct cpufreq_policy *policy = sg_policy->policy;
>>> -     unsigned int freq;
>>> +     unsigned int freq, ref;
>>>
>>> -     freq = get_capacity_ref_freq(policy);
>>> -     freq = map_util_freq(util, freq, max);
>>> +     ref = get_capacity_ref_freq(policy);
>>> +
>>> +     /*
>>> +      * That fixed anchor governs how utilization is interpreted, but
>>> +      * the DVFS request is free to target the current policy ceiling.
>>> +      * Using ref alone would saturate the util->freq map at ref so
>>> +      * use policy->max to reach boost frequencies.
>> I'm not sure those two statements are compatible with the implementation below?
>> util / max is expressed in the capacity scale established using ref, multiplying
>> that ratio by policy->max changes the interpretation of every util value.
>>
>>
>>> +      */
>>> +     freq = map_util_freq(util, max(ref, READ_ONCE(policy->max)), max);
>> Isn't the underlying problem that schedutil can't handle requests above capacity 1024?
>>
>> effective_cpu_util() caps util at max, and sugov_effective_cpu_perf() applies
>> the 25% headroom before clipping the result back to that same value.
>> Therefore the input here cannot exceed 1024, and mapping it against ref
>> can never request a frequency above ref.
>> Using policy->max makes boost reachable, but also stretches the complete frequency range.
>> For example, with ref = 4454400, policy->max = 4723200, and effective util 640, the request
>> changes from 2784000 to 2952000.
>>
>> Making 'boost frequencies' truly compatible with schedutil (or PELT/CAS for that matter)
>> is a discussion that is yet to be had?
>> See also
>> https://lore.kernel.org/lkml/20250626093018.106265-1-dietmar.eggemann@arm.com/
> cpufreq_pressure and freq_qos_update_request could handle the case
> where boost freq is used as the ref freq when setting capacity but
> disabled. I can't remember if everything was already in place when we
> discussed this last time

Christian/Vincent,
Thanks, will look at how acpi-cpufreq/ccp-cpufreq in the x86 world handle
this and try out some of the suggestions in the link and get back.

>
