Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D983932E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 09:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786355658; cv=none; b=olRkoRFJAOU0Q5lDfT7fmHXK6LMkwsPFYHzHqjNuXfcqkAccCgwMuicJ4Xc+fZqPgErpDPFgxmXKoVw6ug5XhOueGK5/4Yfl90+bN3Fz8u2rcFgCi1AuXTSKOAnHXU84VhfpPiDRbF+d8x/KRDlQ8OlEMuWSAWfeZUPDTCeCiXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786355658; c=relaxed/simple;
	bh=cKOor2fNTKRGf+jPzcfQ4SSvtrlkntAd67pXDZl2Ock=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NwB6oB9uUqgiIuQDaT5pRwZpWpjPlQxHtCO+BqhzUr4MLmEhqHgstG/ZhsnWG44ysCjsSt6I+UM5qjxFi9B2RjlBWcWeVAnUo2CFlIJ2yVvMLtW4nuQP1/ECmlqoMQwPzvf4wxh81ofPn3mTeuvHqOGKYxZyO0PAqEV/r0gBIgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8vMUjRp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bo3UHqDE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8vMUjRp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bo3UHqDE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9S2AV872626
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 09:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1yaupPD5ZYBbc+QOdbQUWR4btXhlOZTk84i+SjbBKU=; b=N8vMUjRpLTKymt1J
	MV99G/o+nFcMOhEUVjpTJyJYM2gjruCUIPdmZ6ubfR1pU29GJn78M2NjqHnLQXng
	luKXhXxWGQcYXkbSeRXnOeQLHGmpux5Bv9+llHS2fdprQ9kdzKfFezeS+UbotdZI
	zO3Bz+lnHMtkjiFEmt6UGZqXJ2qz4unGTiKWv/8plzV+BOGaruoKErP597SdbKMu
	wWBXyWhzUgvS5MBAMK+f1LBDSVmUVM/vOtRJ+lfIJhxB0I28TFoSJ4kfgKxdwYZ2
	PWjR9sr3x5fr78pKrc7fOEsBHgvtH6b1jgIgeTlfUT66mhpCDis/ybhjuWPWOWVG
	O191fA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v58vge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 09:54:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-caf5fa127d4so3143356a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 02:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786355656; x=1786960456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1yaupPD5ZYBbc+QOdbQUWR4btXhlOZTk84i+SjbBKU=;
        b=bo3UHqDEozuCkfNBzcDoPc8IgeU0RjbSHu3RQzK+kn29vB0gjDRZ8HNTJJ2+k3IVST
         zy1nEemjmbcZHmY2xS02C/X6j0RlHZFboJMmf66lp3kCcLwZDj/yRdRNTQuE3++wRyzo
         aQe86mqwQialF7b3iUmygEZ0FUrRNwVLkEsLesShgW/74k/d6fIqskcOWOFzvLRXd3rk
         dMHjqhzdGQz+yNVmXfsR60XNE1j0Vfo1+SeIjnQy7KAyaC5gt+VBcjDo2SCaywbt/olk
         oWOh6Cd0/KVVxXXtXybHAke1Ip87Y3cgqdY3zYO0wEd+xdIIjLvkLytHImN7SMUhXSz5
         Jctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786355656; x=1786960456;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1yaupPD5ZYBbc+QOdbQUWR4btXhlOZTk84i+SjbBKU=;
        b=qo/KB2GyYIyBM4oMX9Nt5CZvx1pEwiolHra4hUClIL6dyJmj/AwnkHrATk0vzenkVF
         C77QggBzfriClmCQw82NVb+mSDA0at1tbDTGVPHVf14auVyp46wQlO2FLrqrdLsW6mgt
         NWBvFJo54g6Nb+zg3/9XwBxE/nuw+GDsbNHkaR2pLJuIwyE4Y4LVhbku2CijwJdExDO4
         6PPOoiiGbmLsHh8trRDm/JDMrrmKiU3qFLn7uAR2JLk0OJKqQqBtyX3BhSdzE+7RFP6L
         Uf325LOhr6KolH1bFFP4huFh9dXmsjhkTCfoG2OBB5Ad9LMAOct0ym1LB+JvMm4o5A1m
         /p8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqO8QEynl+2irQYGkhctBYPFE5mpqBkurFTZlhtw5nRXeF7nf3RjqKOLDOXoxJ5fnrHelv+3tDe/XxqPFQl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3JVH5VzC+8m7dOsHUven5NosxjLxwwpvZJTer4gNGyhpb3MuF
	yHYaveUXNZyI7lLSDLUeailXLJmMXqP3qrmChvymwW0w7ZwkdX7EEPuoqsjOlGo/4jMLdkCBvhK
	yiGXUoR2/i0QdSdlpUMP9N1Dtg2ziC5LKEKecFpxZWOOCkLUx60Eei2F+za+jYjfrDrRj
X-Gm-Gg: AR+sD10CfbCtPokLHb2ekH4G+9dDClB2nghynXMVdK5PfA2ljlFN8BYtSvc2YH5fshQ
	cvJtLxBxl+S1CSDRH6D3rFJEWTnIAeaS480XM5ecmjrxlsPUYc8QGT/YOu5AyAxF/3FgB2r7DIt
	372/3eg52bu0PaTjMb/BCCokv/btxmRmVqKlhxY1NRTVMnIXyy02Od47gP0vRdeFKkFaUk4o/us
	V23HbSqHZa9tONGBpr+hp9bRvBWHEsHGKEAJ+Y/HhniZAduDWAZDKR5OlaSW0ZyXYFx92cCYFs4
	pYy7WKF9fZl/5iyVSfYKt8FnsYsH97V0+jv/QYLcU7Kyct7ZvoqkHi7Ilqpbz1cd5ORl+ymf9yr
	pDswdtTKGzHKjl2w77h4i7AaO4uhuESKUC73y2I3WKXwzbToLhz4yeTBzlqK/B9dUieVuFMg=
X-Received: by 2002:a05:6a00:2187:b0:843:49f0:f5a0 with SMTP id d2e1a72fcca58-84f5e0c4b15mr23847258b3a.32.1786355655673;
        Mon, 10 Aug 2026 02:54:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:2187:b0:843:49f0:f5a0 with SMTP id d2e1a72fcca58-84f5e0c4b15mr23847227b3a.32.1786355655243;
        Mon, 10 Aug 2026 02:54:15 -0700 (PDT)
Received: from [10.133.33.19] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a596a10sm3708327b3a.60.2026.08.10.02.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 02:54:14 -0700 (PDT)
Message-ID: <3a20b69e-b072-4723-925f-514d8162e259@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 17:54:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] cpufreq: allow cpuinfo max to decrease when boost is
 disabled
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, mingo@redhat.com, peterz@infradead.org,
        linux-arm-msm@vger.kernel.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com
Cc: linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
        linux-pm@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
References: <20260806044230.909961-1-sibi.sankar@oss.qualcomm.com>
 <20260806044230.909961-2-sibi.sankar@oss.qualcomm.com>
 <54e74486-12f2-4b09-916a-1a8806871b6c@oss.qualcomm.com>
 <18d763f0-d817-45d3-8c79-10639d5a5e47@oss.qualcomm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <18d763f0-d817-45d3-8c79-10639d5a5e47@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA4NCBTYWx0ZWRfXy3x92ZfKJfxD
 E/2a6k7b7bkAsEpSaCg9NewbBDlAlqzK3EDyk5FuGdzhOFUXoKgmVKsVmXI6nlxzwV7tJbrrb3B
 SHAGbo8m3Gb1MCz2tp4SFpXTYLpAA3Y=
X-Authority-Analysis: v=2.4 cv=J6qaKgnS c=1 sm=1 tr=0 ts=6a799fc8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=oDw6gA2hALo5y0joJwwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: qH3_EYonxD58ooCCp_LmQxIZoOT1Nico
X-Proofpoint-ORIG-GUID: qH3_EYonxD58ooCCp_LmQxIZoOT1Nico
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA4NCBTYWx0ZWRfXwuPtNm4dShD/
 OM+8px0ykDL8r6l5Qx9Vh8huBm9UW0UnVeWIqytSe41EZ3PiMMceUxXpJWElr/lDE6DLW4tvOCj
 b41BOfqyR0psRfPf/DqyeOCKme1v9LnMZeD7fPE8tKZO/wqv9hpo0eiEwVYssPe7SuADmCeGTov
 Ig0LTNFlcFs810wZslD45nwGzVBc9XC6L6IYD7XRAW3kLWXR8R5xc7RRS9dev8TwFqjqahb6gIf
 6e6LOWtjhtEa3CkXAeEaXVSwt44sGWsIgPnLhuYcxyKxaDqMDdRg/4jErJtBHVYuFdp3NC0DPbl
 7OxbtKn65aKnZnlrATHs/LvaIB17WuJ5Cf5QDodfxeQMi3kOVBztbjqvQuN9tS+RmoCeei4kh1C
 j5QhK94aPhlQ08ivSW5GySeHVrM0evs0zUmob3fJCR0fpa2IKU10GJe3yGj117ZNAHGwvt5Tymf
 lwSo7b5Nvt++20Ifrgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100084

On 8/7/2026 10:23 PM, Sibi Sankar wrote:
> 
> On 8/6/2026 4:52 PM, Zhongqiu Han wrote:
>> Hi Sibi and Ananthu,
>>
>> On 8/6/2026 12:42 PM, Sibi Sankar wrote:
>>> From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
>>>
>>> Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly
>>> if max boost is known") guarded cpuinfo max updates to only allow
>>> increases, preserving values set directly by drivers above the freq
>>> table maximum. This prevents cpuinfo max from decreasing on boost
>>> disable, leaving policy max pinned at the boost ceiling.
>>>
>>> Remove the guard so cpuinfo max is always derived from the frequency
>>> table scan. Drivers that correctly flag boost entries are unaffected
>>> since the scan already excludes them when boost is off.
>>>
>>> Fixes: 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if 
>>> max boost is known")
>>> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>> ---
>>>   drivers/cpufreq/freq_table.c | 7 +------
>>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
>>> index ea994647abc8..791118466ca4 100644
>>> --- a/drivers/cpufreq/freq_table.c
>>> +++ b/drivers/cpufreq/freq_table.c
>>> @@ -50,12 +50,7 @@ int cpufreq_frequency_table_cpuinfo(struct 
>>> cpufreq_policy *policy)
>>>       }
>>>         policy->cpuinfo.min_freq = min_freq;
>>> -    /*
>>> -     * If the driver has set its own cpuinfo.max_freq above 
>>> max_freq, leave
>>> -     * it as is.
>>> -     */
>>> -    if (policy->cpuinfo.max_freq < max_freq)
>>> -        policy->cpuinfo.max_freq = max_freq;
>>
>> As I understand it, the guard added by commit 538b0188da46 is
>> intended for drivers (e.g. acpi-cpufreq and AMD) that may set
>> cpuinfo.max_freq above the maximum frequency in the frequency table.
>> Removing it may cause those drivers to lose their boost maximum
>> frequency.
> 
> Yup, we did mention the same in the cover letter.
> 
>>
>> The regression should instead be related to commit db80ad776cd2
>> ("cpufreq: Remove driver default policy->min/max init"), which removed
>> the "policy->max = max_freq" initialization that previously allowed
>> policy->max to track the result of the boost-aware frequency scan.
>>
>> Please feel free to let me know what you think. Thanks
>>
> 
> The commit db80ad776cd2 is unrelated. The problem comes from the
> fact that policy_set_boost uses policy->cpuinfo.max_freq in it's
> freq_qos_update_request. If we modify it to use a frequency that
> adheres to the boost and per-policy boost flag instead might be
> the right thing to do here.
> 

Hi Sibi,

Please let me know if you see any issues with the analysis below:

[Background]
Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if
max boost is known") made `cpuinfo.max_freq` hold the CPU's real
physical maximum independently of the frequency table — for drivers
whose max boost frequency is not in the table and added the
if (cpuinfo.max_freq < max_freq) guard so it can only be raised, never
lowered.


[Root cause]
Commit 6e39ba4e5a82 ("cpufreq: Add boost_freq_req QoS request") changed
the value fed to the boost QoS request from the boost-aware policy->max
computed by each driver's .set_boost() to cpuinfo.max_freq,
overloading one field with two conflicting roles: a boost ceiling that
must track boost state in both directions, and a constant physical
maximum. Only cppc_cpufreq_set_boost() and amd_pstate_cpu_boost_update()
were taught to update it in both directions; cpufreq_boost_set_sw() was
missed — it can only do so indirectly via
cpufreq_frequency_table_cpuinfo(), where the 538b0188da46 guard forbids
a decrease. So on boost-disable boost_freq_req can't be lowered and
policy->max stays pinned at the boost frequency.


[Trigger]
Before Commit db80ad776cd2 ("cpufreq: Remove driver default policy->min
max init") removed policy->max = max_freq, that write still pushed
policy->max down and masked the issue. Removing that write just made it
reproducible.


[Conclusion]
Removing the Commit 538b0188da46 guard maybe therefore not the right 
fix, the drivers that rely on it would lose their real boost maximum at 
init. The fix should belong in policy_set_boost() / 
cpufreq_boost_set_sw(): source boost_freq_req from the boost-aware table 
maximum instead of the sticky cpuinfo.max_freq. `Fixes:` should point at 
6e39ba4e5a82.


>>
>>> +    policy->cpuinfo.max_freq = max_freq;
>>>         if (min_freq == ~0)
>>>           return -EINVAL;
>>
>>


-- 
Thx and BRs,
Zhongqiu Han
