Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2702348C5D
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 14:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113187; cv=none; b=l0/JVl6Qi8193Wh5/PcxxRvceBDWLNh3yuHj9n/UhNGMvrN/xRi4K0OY2WvvjBRpHoh8su3zTPDmzpC3TJ5jRzw7sodLDH4nsawBBkskYiX9w7rO1WBAt/aV8u7TfB3XZhD993lKwxQiKCuspaJgndGAl1X3pQLtmfqawJtQOT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113187; c=relaxed/simple;
	bh=0hzL95W0DgdNg01n0jx3iFRTfBCebY5iM8aNdz1ZD10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nz0UZSG52RUAsMFMvweImBOIaj5yqUs29XM3Iz9aYY3Q+fHQjuyBaUsCNFaiDXb9sjB6KDLtmVmwAcwjBMYVFfG2XZMzXWGE/XkEq4igt1eel8Uxv4+aSOp83a1c/NPBhSlUBm/fuHflNqY/z9aykoJlsnoaGrvG7s6cCNYnXAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4sUpvH4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=geCx6kMA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4sUpvH4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="geCx6kMA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677DeaDa1435610
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 14:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	901SYsPovy4rPKGGIpqTt0xDPadw7CcjZOa24G+R6jA=; b=m4sUpvH4M8auwoYu
	oi2Wbn4CZO84wqDghNRFiCR9TwpFHws1ctR7KfxDJdEHB33Z5XE/Cmm4bm478BCu
	0mdi5CgB7WFCrSKRCmmZP9GHh6y/lzn2S+bIQ/giDWhz8io1IVKJGPt7Bo0Z6CKy
	TdHicwf+4dqRBqghqRoDUXRpJRbuye7mMv+60Gf5T6+EzNNMmW2/LPOoqTljZgkd
	ymp1S8s8hBCbiCOKy4sAhUHOkZZ+t4O2PCv5QEmp+z7ch02CEzHNxUZN+neu4WUu
	qhSPN7zKKRR/yvtIEUfMilz+EohdXoBxpPr1mw/ffZy8YPg9CN3BBGGxtdadlcEn
	Xe72vA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwgewg75b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 14:33:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9087f2fe592so22695866d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 07:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786113182; x=1786717982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=901SYsPovy4rPKGGIpqTt0xDPadw7CcjZOa24G+R6jA=;
        b=geCx6kMAStffg5uox+A5gO+0KSz0SQrK8d11pVTeI/EN37v6lsx9S1N8CnD5QZysB/
         wSHouaSq11S/wxEQHxWciSZDLbjA63hYEonI1L+/AgjwqvVziGpcRg5nTEtwm58BBPg3
         s6Ebf1gKOxmf5M/524+n97/jMPYsMvxutFsXTXZS50MJYoIHV4SZRxrWrlWqCEAYaFLI
         tmdivgIFYWrkPkufPMxjh8ou+/dSM2/3mhuOtMUfxMp92IqBqrwrxutBKckAo7miqG73
         XLDLMcNVhdEhrdGm4UYcP0yDyX92bjCcsiSPjEjRx4ugrqkgfUrxyqHy7apO5qlULjMp
         mrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786113182; x=1786717982;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=901SYsPovy4rPKGGIpqTt0xDPadw7CcjZOa24G+R6jA=;
        b=GDkYKLJ4BJF2VGdVT8AbDTj4DLxovg2314hRpUmGmP0O7E3E0wyqSLVTOYmKT8zHYR
         HgIEpq3bUl72i53JeWKLtOFpiI3sHfJzj/PlrrU3mIOGt4gjYglNlkkKCrSjydvzNNFj
         ENj64hDIvVas/MnjlsSV9aPpkIQUKWFA2wC02CHWH/TQTYFMAVBbRSBwJDcmvb9oi/aV
         TPcXx2NCZ8wYdmPrno7KwQk3K+jWqqgG5kJruY9GriAjHbG/suaoiFdMUcSr1b25AnyS
         q1Skk52CGWduepma30rkiBlxgTkSDnZ/qTdCjR9iVD2B15u8hgqhKe33TqoLRAx4vbkV
         k9SQ==
X-Forwarded-Encrypted: i=1; AHgh+RrvkTdFC4b2wRGGmYl5Al0ZltpUygP2O6e7zvfiI9Pu2mdLWnNawR7/IKyGW/5KTl6NwnoGnNuO60DSVL58@vger.kernel.org
X-Gm-Message-State: AOJu0YyPn5FrqWS+CkBrr5fBBEl/DoMO89eyAp84P4DQTSE+uzSYRerQ
	K4KGTsL2mf2zEh+q3cJGaTFQHHp/aNblOe89GKT6IXNQn8hGW9HGQvoNoo9e7MhRxWZ01dGQjo+
	O1DP4Cf2jJmELu2NuPcQkwPEHUwYmPPxaju0VLr3EtzVbMHdcTYTQvJdQMjs7H5sUz2fUZwg0ui
	9J
X-Gm-Gg: AR+sD133kFPr8YwuL5P7fMk38UVOeLfHr8Efqdy+Lb5Yc/KF8lZYr0Es+TDmfNoLUIG
	2KfugjSiwAGgf7M79yFdYHUIGwGTc7oVKmumAs2yBFN0Xcz5yJNTeXtpEGuTT4JQltpmSrw0JfV
	UnYK81jgjCJdnezNCAmPZ3E4X+bVmsMaUErWsbG0NvJnXofIzX0FOsUgwTbGkjq4S87dsIvKKtv
	oVFQgbClIMRdHlBJX2O1yxVwhksvHTJCgq+7JaA8E45a+wJmH+BHNftWO4stkcsV7fUe2xp02oD
	sIAzMMXA6LBQqIbD7b9sK8YXFgBK1HPMX7bypKP2cXb9vUSwNyB4PIifC8zmlICnvEY1E2z3IWv
	X76XfOg0z6AnWrVNKNOK9hOB3J0zfO4c/NwtbgDQHh+GwwHB0uOTuz8Ey80B63jg2zwM6yUjqHh
	5cs9MZMXe1+wdAuNvJFA==
X-Received: by 2002:a05:6214:48f:b0:8f2:5a3e:c619 with SMTP id 6a1803df08f44-90a345985dfmr7374376d6.4.1786113181521;
        Fri, 07 Aug 2026 07:33:01 -0700 (PDT)
X-Received: by 2002:a05:6214:48f:b0:8f2:5a3e:c619 with SMTP id 6a1803df08f44-90a345985dfmr7372926d6.4.1786113180952;
        Fri, 07 Aug 2026 07:33:00 -0700 (PDT)
Received: from [10.190.200.255] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a92fe515sm9918976d6.24.2026.08.07.07.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 07:33:00 -0700 (PDT)
Message-ID: <c1f9c858-f14a-405e-97ad-0c1748b7c5a1@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 20:02:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sched/cpufreq: Update schedutil's DVFS request to
 reach the boost frequencies
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, mingo@redhat.com,
        peterz@infradead.org, linux-arm-msm@vger.kernel.org,
        juri.lelli@redhat.com, dietmar.eggemann@arm.com,
        linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
        linux-pm@vger.kernel.org
References: <20260806044230.909961-1-sibi.sankar@oss.qualcomm.com>
 <20260806044230.909961-3-sibi.sankar@oss.qualcomm.com>
 <CAKfTPtDQ+843t5fgknAMcfkYP_ZLxxYU8D+KJtx8QzMy=qMoCQ@mail.gmail.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <CAKfTPtDQ+843t5fgknAMcfkYP_ZLxxYU8D+KJtx8QzMy=qMoCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDExNCBTYWx0ZWRfXzWsCW1FT0kB0
 mKOVF+8su2gZNJOOy1zhBCXRQ0GvLRPUUkxMjefRNTu/IlZnspFg5Ddg89GUj99UjN+XVzaZ8yb
 XRX9F+8dqttE+wDjZUA+pjoivWPO3cI=
X-Authority-Analysis: v=2.4 cv=N5cZ0W9B c=1 sm=1 tr=0 ts=6a75ec9e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gPUjsufZEJvEUY1ZO68A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: o57w83IkTct1Sp1MXBD0rIh094I5w6PD
X-Proofpoint-ORIG-GUID: o57w83IkTct1Sp1MXBD0rIh094I5w6PD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDExNCBTYWx0ZWRfX8bBkmUuomMZV
 ngX7x5gNCkmSRr/085gS6i1ALI79fl0mxOrGC3YmV3EG7INGqaQUZlyYBSHRXtgvqzUDMuB+nSX
 Ps46cEKDL+qG+gG9TLkeQC/GEG3+4ybEqrUNZLMSOVRFNsoo11tAqK/cvh5rpagcKlV41QbO9cV
 GDSNJG4f8gd/cZzleNuGEH6xfcBHvE5OVWhGf3Z+E760DF9rMfZDB8Ih8fYjn6Kehgq/xz5Stoh
 137NYBDOfiAzNIKWY1W4BM14P90S/qkUscWkMTi8Ojfcuk+WJGtOB9mYR7CO80WL4iPCo5Kl2TF
 HoosQ17QkE/zYYUayKPTlBBpToXxB29QSskZSE4Sm9fPb3ZY0/+rqR6ommSZzRsPH3k36Zokt+P
 9ax6PiepiqhByGv9f6u0J7MbbeY9uICcatCJFK102ip3XSZxoauV7afJ0UGgjeOms645TpyGjRe
 AchDpaRN3H1cXl7ESjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070114


On 8/6/2026 8:39 PM, Vincent Guittot wrote:
> On Thu, 6 Aug 2026 at 06:42, Sibi Sankar <sibi.sankar@oss.qualcomm.com> wrote:
>> capacity_freq_ref, exposed to schedutil via get_capacity_ref_freq(),
>> was introduced by commit 9942cb22ea45 ("sched/topology: Add a new
>> arch_scale_freq_ref() method") as a fixed anchor that does not move at
>> runtime. However, schedutil uses that same fixed anchor as the reference
>> plugged into map_util_freq() which saturates exactly at capacity_freq_ref.
>>
>> As a result, a system with cpufreq boost enabled effectively never runs at
>> boost frequencies under schedutil-governed load. Fix this by plugging in
>> policy-max into the map_util_freq equation, so that the DVFS requests
>> translates to the actual cpufreq driver ceiling.
>>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>   kernel/sched/cpufreq_schedutil.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
>> index a1782755efcc..dcefbeaa0702 100644
>> --- a/kernel/sched/cpufreq_schedutil.c
>> +++ b/kernel/sched/cpufreq_schedutil.c
>> @@ -195,10 +195,17 @@ static unsigned int get_next_freq(struct sugov_policy *sg_policy,
>>                                    unsigned long util, unsigned long max)
>>   {
>>          struct cpufreq_policy *policy = sg_policy->policy;
>> -       unsigned int freq;
>> +       unsigned int freq, ref;
>>
>> -       freq = get_capacity_ref_freq(policy);
>> -       freq = map_util_freq(util, freq, max);
>> +       ref = get_capacity_ref_freq(policy);
>> +
>> +       /*
>> +        * That fixed anchor governs how utilization is interpreted, but
>> +        * the DVFS request is free to target the current policy ceiling.
>> +        * Using ref alone would saturate the util->freq map at ref so
>> +        * use policy->max to reach boost frequencies.
>> +        */
>> +       freq = map_util_freq(util, max(ref, READ_ONCE(policy->max)), max);
> But this is wrong because arch_scale_freq_ref is the freq that has
> been used when setting the capacity of the cpu and is there to make
> sure that the translation between freq <-> capacity is correct and
> consistent whatever happens later on the freq table of cpufreq. This
> ensures that utilization tracking remains correct vs other CPUS and
> prevents or minimizes utilization oscillation, which triggers other
> problems
>
> Either we enable the utilization value to go above CPU's capacity when
> we transmit it to cpufreq (and above SCHED_CAPACITY_SCALE which could
> trigger a number of problem while computing pelt)
> Or, you take into account the boost freq when setting cpu's capacity
> and associated capacity_freq_ref at boot even if not enabled. With
> cpufreq pressure feature and the policy->max (not  cpuinfo_max_freq)
> correctly updated with a freq_qos_update_request when boost is
> enabled/disabled, the scheduler and pelt should handle that correctly
> as we normaly take into account cpufreq_pressure everywhere in
> scheduler.

Thanks for your inputs! Ack, will try out the latter since it appears to 
be the
right way to address this.

>
>>          if (freq == sg_policy->cached_raw_freq && !sg_policy->need_freq_update)
>>                  return sg_policy->next_freq;
>> --
>> 2.34.1
>>
