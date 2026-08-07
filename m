Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF142DF13F
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112622; cv=none; b=tEKYY+2aOHvsnDViFnnJVMOv/BgYX7JC8bcLcdJVU80KPHXh5h7GCJvrTT5xlL2Rb+2RL0O5nGKC+Hpsy6eXp4/c2Dm5U5cs1A2YvUIaRJr2hwcS3qGYn9Uuaws3MbpzCKl++Uowm4JSCkS2jWw2qUr75OTy9wYiqYvQtoITBOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112622; c=relaxed/simple;
	bh=jQhFbRYm93ruAawqV15mAUpTn83VRe6x2MjxiToAjd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qd3dMZBccYJr2MqvPcp23KjcDB6Q4iP0a6L5WbJX83VPvoDioK2vfCPitSDeT7hCxAENjjKdapxBOiLFZX246S1jBTwJUW1uQ5K2oXyj6s6+xQGRgp8j3O6xwtAZ/36rvBmUZSHYSTJjOEyvJzRWZ9qQAz93T11CCW4JTDnPi3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NxwSmYwK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TtXm45z/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NxwSmYwK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TtXm45z/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677CgHfi989351
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 14:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QyyokO3A6QRheYN0On3jJMUvxYqa90KaOIOgOoKZ0zI=; b=NxwSmYwK0N7Ms4Sx
	QqijgMDfkJDy2e50K2anc2/g7G+CMIC64odllwqxr9xYEHXhXfAh/mvJpNTPNMXJ
	jfRnmp/ecAwMWDF0V4wl1rt08Vm2VrLOYnC+GAhbv7/bAuSzonLgJPFhFXB/pZVG
	MecZ0exe3CllhGCZWMNijYNDrG9R1YG/kIJDDS3iZyJCwcO2Ntcus+8ZxwDpClHy
	kfHj+uX3KvTKBBK16i3U+kDSd9bk7ZQcBHhDfdo5feFUrqMSXUZTv2VHFhRcRUzx
	hNO9hZJaPAHhU4YzkFrmjHLQUCaE6VSZMSvwU8h4zr0Lm26ASKq04zXnGyPCT3HH
	I0SnCA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwctp92pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 14:23:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cd01a14e81so48656535ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 07:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786112618; x=1786717418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QyyokO3A6QRheYN0On3jJMUvxYqa90KaOIOgOoKZ0zI=;
        b=TtXm45z/PTestgoGz414QDzuh+uw55f8iMPAQLx9ke3fzFsbBNQ85QeSo6QcIsMJGd
         KCPXfSZUAJJ47ZrSx80fsYRy5V/Dclas0StKiIVt4NNslbhsAc7PqWNy6aIek2jqw++N
         xthCCMWutD5Vzj9xqcbUmmVzc397z0RSJoDvf8qneaet/wJISKg41xQ5JTVs+76183hb
         LmISCX+NU0d2dOuLWmF883JpwPAcv1yC5b6w9AEm6S5CTfAoCTtdMiE2WMoPYDdmPqzL
         k1w+uIWrFCqkKfyGPW8UCkdiy8TNU2oDqC3w86Z4q7bVisUoeo1oGEHxqXGVYAn2EU6I
         SXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786112618; x=1786717418;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QyyokO3A6QRheYN0On3jJMUvxYqa90KaOIOgOoKZ0zI=;
        b=ScwJVftZhC8FLZaoqTfdUmu1TbA31dRLYGUxpSiNd2MzwxZ+nj4MEmBVrmV9yCqxnJ
         QD9PM3L9dMAGBVZ133ApyDT4xQhu319/amH5yzJZsnwJ/7WmfQackVCmr9wVH36uW2sJ
         urJY4zWuerzPEb5sGGI0nNptTV/NGetcfsYIrzNsY7r1I4v6vLOlTU9WIK/+xWvDrPL1
         4Y4GgtsoFFMnYJ9D+DDN7qKR216qD+4pEHOR/XauDbWUZ5NodUFFzxVYclpJQ3L51C9w
         zZBfHD2PYi139irzJR7vSpCdCWS6w7HekpIKiKJMWYry8qZvs0gG8Gr08hYW1ra/99ho
         KEaA==
X-Forwarded-Encrypted: i=1; AHgh+Rqi1TYPwx1VIfN5u1OA+NIILNF9krf6liFXtcOEK1exFP4uQM67JMmHwXX8RjUg1/uxg1ANd7LRTrQT+v2A@vger.kernel.org
X-Gm-Message-State: AOJu0YzBKhozy8Go0ersjruEvKaA2vDMsJP/y6wuvzomA0+dPF5TbBVx
	G9aU/3XFMn5I1vizSXMzzDWOO2YlhqEcXaGu47JPj1UNl9C3pkU6lot9+M5DJ4OBc7uOFXlfRGO
	JL87hy9ZoNLlZY9ZEbjlQwbNH7RVdiVRDtnPVsUBFHTA6PaAA3avPReug2Wvrr+Z/VElp
X-Gm-Gg: AR+sD13ZFXtWsk2JahiCCQUGpJ83o7RB/OH3jFsOGoNnQE8n49Gif/7G2dQTsfGbEo9
	PYqpY6OSyCpCV5oW7YYMaaCnLdwiN8aeF+0KD0jbJbYFJQZHZ1i6Stm+UeX+0+TvLqvXbPBGVXz
	8X3yBGeQ4gY26lEM1axskqTlErH4JI4miN8mSvDNRotJOdHp3f9nM2bMQadiA1+NV/++eHoABL0
	HF44hzLnUVjFQNMkdx7ic/z1meS768L9Xjm7YJAhGgDFS8oyywHejB6FGQw/lNqhKikoQcOj2bJ
	b/1XL3ln95f9PPN7QEM2DHJVqD/H137grgHAtKGgG7R/8omEDNzjTH+qIYwtyzdfmNeyHAY7XCn
	jiAvwZqcA7mTe53Q+bUnXGmSKtj/xoN3W57vYFNB2z0jwleduDO8O2NiesPBaStDqmCYj0pWQQq
	8SAttK1W/buafQ0c90qA==
X-Received: by 2002:a17:903:1b28:b0:2ca:d975:5bbd with SMTP id d9443c01a7336-2d0ca9623f6mr298253435ad.20.1786112618076;
        Fri, 07 Aug 2026 07:23:38 -0700 (PDT)
X-Received: by 2002:a17:903:1b28:b0:2ca:d975:5bbd with SMTP id d9443c01a7336-2d0ca9623f6mr298252715ad.20.1786112617575;
        Fri, 07 Aug 2026 07:23:37 -0700 (PDT)
Received: from [10.190.200.255] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4e957esm10119125ad.75.2026.08.07.07.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 07:23:36 -0700 (PDT)
Message-ID: <18d763f0-d817-45d3-8c79-10639d5a5e47@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 19:53:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] cpufreq: allow cpuinfo max to decrease when boost is
 disabled
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, mingo@redhat.com, peterz@infradead.org,
        linux-arm-msm@vger.kernel.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com
Cc: linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
        linux-pm@vger.kernel.org
References: <20260806044230.909961-1-sibi.sankar@oss.qualcomm.com>
 <20260806044230.909961-2-sibi.sankar@oss.qualcomm.com>
 <54e74486-12f2-4b09-916a-1a8806871b6c@oss.qualcomm.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <54e74486-12f2-4b09-916a-1a8806871b6c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Fp01OWrq c=1 sm=1 tr=0 ts=6a75ea6b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6-LVY9Q0Gh_YKDuc58AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 0J_eNV2YDwyLbdCON79M5xIHCli4crcO
X-Proofpoint-ORIG-GUID: 0J_eNV2YDwyLbdCON79M5xIHCli4crcO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDExMyBTYWx0ZWRfX/s33mSNxkHJN
 sbWToubZjv8xol7uIV8uS1xw36yGpFNPvtSkiesVn20YtD6uvCyxhgqJurQKL12auHTOcyGBlEa
 2XkqA51tCypaBm3x+jkVCTHCzLFzYSzhJLYASVNFgORlxzk5C6A/bWi54VfPkZOumDOXQb5JZzw
 OOrU5yKjRRKsmXHUx+Mg9DVG7hDYng6y7pBZoDew7rYaXqzKuLgRFQyA6QNQj7JLj0dbGLz3sQg
 /A418OHkMYSwLgBKQbfL1si8bLRiB6+j3GycdDDFycGs2p8BdFDscBeV7gyrgbJ2PuUmFUi70iZ
 N0fsGqyAnNUFyvlGu21rnNCP5cozgpXbMyJD1yM1ZyWhToVN+9Fe40+aY6Vbal2PXaLOYk9CV3F
 embwdC1Pj1rSohH3KP/toXyvplD20/FbzRkWbZmZu5U+GEP2EkHudMvHYGjDqiPvNtrhzWmEOeY
 ThRvQ2vm6kA05951KgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDExMyBTYWx0ZWRfX0Djdo5w5srYu
 OYfCFXJ5Gz8jm6CnsF/2ZIahJRcDZ1wF6VXYDl6haXMTvFjui19Bahrh1lJwm9O15R3rli7e7yO
 8uQFd+CCFcbFuIZnjeNZ6fGo3f3D6H0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070113


On 8/6/2026 4:52 PM, Zhongqiu Han wrote:
> Hi Sibi and Ananthu,
>
> On 8/6/2026 12:42 PM, Sibi Sankar wrote:
>> From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
>>
>> Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly
>> if max boost is known") guarded cpuinfo max updates to only allow
>> increases, preserving values set directly by drivers above the freq
>> table maximum. This prevents cpuinfo max from decreasing on boost
>> disable, leaving policy max pinned at the boost ceiling.
>>
>> Remove the guard so cpuinfo max is always derived from the frequency
>> table scan. Drivers that correctly flag boost entries are unaffected
>> since the scan already excludes them when boost is off.
>>
>> Fixes: 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if 
>> max boost is known")
>> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>   drivers/cpufreq/freq_table.c | 7 +------
>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
>> index ea994647abc8..791118466ca4 100644
>> --- a/drivers/cpufreq/freq_table.c
>> +++ b/drivers/cpufreq/freq_table.c
>> @@ -50,12 +50,7 @@ int cpufreq_frequency_table_cpuinfo(struct 
>> cpufreq_policy *policy)
>>       }
>>         policy->cpuinfo.min_freq = min_freq;
>> -    /*
>> -     * If the driver has set its own cpuinfo.max_freq above 
>> max_freq, leave
>> -     * it as is.
>> -     */
>> -    if (policy->cpuinfo.max_freq < max_freq)
>> -        policy->cpuinfo.max_freq = max_freq;
>
> As I understand it, the guard added by commit 538b0188da46 is
> intended for drivers (e.g. acpi-cpufreq and AMD) that may set
> cpuinfo.max_freq above the maximum frequency in the frequency table.
> Removing it may cause those drivers to lose their boost maximum
> frequency.

Yup, we did mention the same in the cover letter.

>
> The regression should instead be related to commit db80ad776cd2
> ("cpufreq: Remove driver default policy->min/max init"), which removed
> the "policy->max = max_freq" initialization that previously allowed
> policy->max to track the result of the boost-aware frequency scan.
>
> Please feel free to let me know what you think. Thanks
>

The commit db80ad776cd2 is unrelated. The problem comes from the
fact that policy_set_boost uses policy->cpuinfo.max_freq in it's
freq_qos_update_request. If we modify it to use a frequency that
adheres to the boost and per-policy boost flag instead might be
the right thing to do here.

>
>> +    policy->cpuinfo.max_freq = max_freq;
>>         if (min_freq == ~0)
>>           return -EINVAL;
>
>
