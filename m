Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B9B337BAB
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288601; cv=none; b=n9H5OP+mOu4AxUNlZjxFTOCuulszFE0D2LnvsQHgJcrt72VIF6mv89I/coRX7RrWYJ7LhYTWzIMVDPXF0wNCINU7G7cE5X4tzIWphXLd/7uK6SUsWCyY3OFKg105VXgwSGjjoon60vRlaeXJbLA1DyC72ZtY33dxxdSwFpm32hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288601; c=relaxed/simple;
	bh=XnuZsf0nMjLkzfEZKDluhvBN6Lpj8IpIlLwi4mU/wRQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=I4LsmhvkecvycBnogOrV3op/vYcIPBk+HU/HCrCLPXtc6n7kD5OYddiw5rPg1htC2oTNxpkeqMTX2cx5NvygSMt5oL2kRleXV8LztGcklqWWsjOeeiYrVJcBgcHo9NvhfQRx1NyXm3UMCNLKkTSeTWGVfZ7SKFP+JZnpNckCfRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRrL8w81; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D+0L/28r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MRrL8w81";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D+0L/28r"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L46a3A771422
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	is/gf7jTRlgqU5YwXx1zH35HMFgTgN6XMPeMmbQXJZQ=; b=MRrL8w81tcXwTFKa
	iLHncOSbpHRgA21ZcG+X+IUWI7vwiUZ3HeBnH+tiGBtb3MpoqI73OZNE8GrvNZsW
	YUd4z/n/etynVsLIscR8siN/JjeERVxk4KHbya/itzZ5TPRmYzqI3nTas6KRKjp0
	4seMooGYjdpnAOMnGwIvYsbrJTkNYiFJ6vPLUfKSSilAmKwbiRvvTGcH4mwRI6he
	bp8YUhRt3C7SnZE56dH5g40bovNfYRbcXP0B7s2zs7eAGf0nazSV6ak+CsgLvLUw
	9ogqD6LaZGMAscP20qabArQnXUQrCBRq6YlybD44WRvkq/0141Y8e0iMtO79styl
	F9ufdQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fbw854u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:03:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc86a9ef97so12606925ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 22:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787288598; x=1787893398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=is/gf7jTRlgqU5YwXx1zH35HMFgTgN6XMPeMmbQXJZQ=;
        b=D+0L/28rFewFvNuNtMbiwEZZA+57XojfkaGAskSsgWCwXmBuYUodvD5ya6LUieqj4Z
         bx/o3A3wRQTPOUhbRQkrSvtX8/RG3g31IGebvv5DBt7g1b0szaiJTptAmXZ2f3U7KtJW
         kfCPIR+9xP5hSSd0M96/aA4GxT9fsdO/agFMKcX6AG6379494CvmovON8nnSNk2LIGUS
         Ifr00Q4VEXtFDl4SWquvNd17uuE2UbrOxTN4H/ivha7+tktwJJRtGblGsdB2KKzrui4i
         Sdb6WhTdxbZmUCz+YRfN/oiAHQrcbOY/nFAisYCqM8a7dHQpR7G4NaRTz5ErJ4HgkQT1
         dEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288598; x=1787893398;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=is/gf7jTRlgqU5YwXx1zH35HMFgTgN6XMPeMmbQXJZQ=;
        b=Hh9f/eay8eyTu2JCwGgPbdKaa0fTcYJAWGMFU/59t+HjEPfORPOY4KC207tpP93Ifo
         Sv8X43y2nmsmJ2fF03SLlG6NuUpUEyKW6M2maiET+gJ4bqRF8owA5M/tOUqki/vLWdDW
         xT63Jfthhkul9qOJnvpFMzGobkhBbk1hp1KuebFqeccCn5lzsLeAOETJHB3enU4hB+k8
         +Qb7/e3LHWNg5r8v8bgcL4Ipgw0FARvqoEo1J3Dz6E9rJmINhDrSMf45DAhWwwBbHcX8
         IOUhX/oFyzA96TMTbSrD0iRiX7FT6VQPz2j0bPnvxMX8eMAEmrUCu3Zuzqvyn2CFrY+l
         w6Ow==
X-Forwarded-Encrypted: i=1; AHgh+Rod5Ckt5bL0yLTZc0GCxXeF+FW7TAbfhOqz+G+MT7UkSZ9jqOfZru9G/yHsKJnGj6WrCDHOdzwnx/UB5uZT@vger.kernel.org
X-Gm-Message-State: AFuF++lEJhM/qhJTuru1c7nt6ExRZ5BPHO8SE2b+i/h9UW4nUkWU6h95
	ePVx3RsqiB7khBjL2bZ5bfCuV8Y+KUzwQl63IX6HHZdSK10T2LTbO7eavoK0w+HQFFoqbe0RnI/
	hyruYCKcj7Q/MOq26Uu4oNDruHGqCkYdqe+b8/AVWYORo0PNthBb7PfSO9R375+lLuVT5
X-Gm-Gg: AR+sD12FB9Ue5LOrWWn07guUHEUHTvjCuK7pwRWuJMvspTklB4ckkXRB07FJsImchqM
	vLgDItmTIdRBa5T+YaX1B5MsJzWs/FkFipogK+qgS3GJUDSQvla6CJVfuGFgAz7XVkcCD0sozMQ
	MH+bPuenAb8mxGO09pKsZxVaeTDV5+570bfjE//2NQsWVKVfy5OvgdN0QdLdPQlNfQ07EMvuXiS
	IVp2qKkEae0nqInxxttczAk55TAolOfMIsdIsYsCjPTUNtaS1WivtGgjKY1loFfWtsxYdKWlzzJ
	ZGoAlYdw0kzendjLAx3o2lnwI4lgHrMJ45V7tdet1Vls/mkfc75DbCrBSnMVGFZLXfQSGpRVRwM
	YwmtyjGGAqKe3a34sS+vwU0WRfpXqFg==
X-Received: by 2002:a17:902:e943:b0:2d6:3c2f:69b with SMTP id d9443c01a7336-2d64af6f8cemr72646705ad.8.1787288598419;
        Thu, 20 Aug 2026 22:03:18 -0700 (PDT)
X-Received: by 2002:a17:902:e943:b0:2d6:3c2f:69b with SMTP id d9443c01a7336-2d64af6f8cemr72645935ad.8.1787288597955;
        Thu, 20 Aug 2026 22:03:17 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d555f2esm13819795ad.5.2026.08.20.22.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 22:03:17 -0700 (PDT)
Message-ID: <8b728c1a-f783-4660-8ed0-eb131875f2d2@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 10:33:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2] cpuidle: Deny idle entry when CPU already have IPI
 interrupt pending
To: Christian Loehle <christian.loehle@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260403-cpuidle_ipi-v2-1-b3e44b032e2c@oss.qualcomm.com>
 <CAJZ5v0jXwtBz3z4h3ehJTuaqYN4z7=wOv_LGnjQ4LQMP0TBKmA@mail.gmail.com>
 <5cfd774e-8797-4765-a36a-c3dc2d6ac004@oss.qualcomm.com>
 <bc9c2236-6411-4ff1-a03c-d97997b5f780@arm.com>
Content-Language: en-US
In-Reply-To: <bc9c2236-6411-4ff1-a03c-d97997b5f780@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDAzMiBTYWx0ZWRfX6BPnnW2YWDA4
 ZzS1NTHX2iURBwy0+vmZLaj4QEFoAEUL0Wggm8EYNnmr5Pgukm0kj9+XLC3FwRY5BemzdR7JC+U
 CK/210f/R0l1gpOYnfmGJgN3awPqukw=
X-Proofpoint-ORIG-GUID: mWbjd-jTpA6S5tqcSLbCDj2Ig-tf1OFc
X-Authority-Analysis: v=2.4 cv=L9AtheT8 c=1 sm=1 tr=0 ts=6a87dc17 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6lJ8GlR-gWZHLfuqW2AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDAzMiBTYWx0ZWRfXzREKcKhzdSyP
 HGrVL8QLnxFofDhkMHOHxlYyH3L2pHvZSvB1/p5aiMIqza6FL42yvN9Wp4pwy9CxEu33r6vo1kQ
 +tUv7fTV0r/2UwKmjYKncIA12XEQl5wNGUcCq6gnVm35SiJ7Sbb1WnZqvGjlKllE9iurH2AydPL
 GcmlkGfR8bcWHhi0psYulyfFjt33SBLvAOx3DC4b6QEELdKnt5kAkpkBhdbCM9eYoQ78laR4bUK
 Pd4hTs/yUl/GQC115xWgwDo9mfCsNFSaP5qEsUABbmmHnbsZBfSaHtHPdhIBKKnLoZNj9y7ZPFG
 Aio1IiKP+eQMAER8ycWyZ01puKNwT+uOJolVSSTtXT3WVz/WGIjkqZyy0PGyaKA1tbYrn3Ebhug
 lBqsdoUiJcfGQDSOYXYdTcQ1dmUvDU+TvhojDNiSZKh8Mnd44QDLDVh3sEhZdcXlQfnP+BMRqLY
 sh/bJ7RVUNb8mRbyTrQ==
X-Proofpoint-GUID: mWbjd-jTpA6S5tqcSLbCDj2Ig-tf1OFc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210032



On 8/18/2026 9:40 PM, Christian Loehle wrote:
> On 4/13/26 06:03, Maulik Shah (mkshah) wrote:
>>
>>
>> On 4/6/2026 8:37 PM, Rafael J. Wysocki wrote:
>>> On Fri, Apr 3, 2026 at 6:08 AM Maulik Shah <maulik.shah@oss.qualcomm.com> wrote:
>>>>
>>>> CPU can get IPI interrupt from another CPU while it is executing
>>>> cpuidle_select() or about to execute same. The selection do not account
>>>> for pending interrupts and may continue to enter selected idle state only
>>>> to exit immediately.
>>>>
>>>> Example trace collected when there is cross CPU IPI.
>>>>
>>>>  [000] 154.892148: sched_waking: comm=sugov:4 pid=491 prio=-1 target_cpu=007
>>>>  [000] 154.892148: ipi_raise: target_mask=00000000,00000080 (Function call interrupts)
>>>>  [007] 154.892162: cpu_idle: state=2 cpu_id=7
>>>>  [007] 154.892208: cpu_idle: state=4294967295 cpu_id=7
>>>>  [007] 154.892211: irq_handler_entry: irq=2 name=IPI
>>>>  [007] 154.892211: ipi_entry: (Function call interrupts)
>>>>  [007] 154.892213: sched_wakeup: comm=sugov:4 pid=491 prio=-1 target_cpu=007
>>>>  [007] 154.892214: ipi_exit: (Function call interrupts)
>>>>
>>>> This impacts performance and the above count increments.
>>>>
>>>> commit ccde6525183c ("smp: Introduce a helper function to check for pending
>>>> IPIs") already introduced a helper function to check the pending IPIs and
>>>> it is used in pmdomain governor to deny the cluster level idle state when
>>>> there is a pending IPI on any of cluster CPUs.
>>>>
>>>> This however does not stop CPU to enter CPU level idle state. Make use of
>>>> same at CPUidle to deny the idle entry when there is already IPI pending.
>>>>
>>>> With change observing glmark2 [1] off screen scores improving in the range
>>>> of 25% to 30% on Qualcomm lemans-evk board which is arm64 based having two
>>>> clusters each with 4 CPUs.
>>>>
>>>> [1] https://github.com/glmark2/glmark2
>>>>
>>>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>>> ---
>>>> Changes in v2:
>>>> - Fix cpumask argument of cpus_peek_for_pending_ipi() to take single cpu
>>>> - Link to v1: https://lore.kernel.org/r/20260316-cpuidle_ipi-v1-1-d0ff6350f4e2@oss.qualcomm.com
>>>> ---
>>>>  drivers/cpuidle/cpuidle.c | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
>>>> index c7876e9e024f9076663063ad21cfc69343fdbbe7..c01e57df64ca5af8c28da3d971500b3f38306cdf 100644
>>>> --- a/drivers/cpuidle/cpuidle.c
>>>> +++ b/drivers/cpuidle/cpuidle.c
>>>> @@ -224,6 +224,9 @@ noinstr int cpuidle_enter_state(struct cpuidle_device *dev,
>>>>         bool broadcast = !!(target_state->flags & CPUIDLE_FLAG_TIMER_STOP);
>>>>         ktime_t time_start, time_end;
>>>>
>>>> +       if (cpus_peek_for_pending_ipi(cpumask_of(dev->cpu)))
>>>> +               return -EBUSY;
>>>> +
>>>
>>> Why do you want to check it here and not in cpuidle_idle_call(), for example?
>>
>> It can be moved in cpuidle_idle_call(), just before call_cpuidle() too.
>> The intention is to check after cpuidle_select() is done.
>>
> What do we do about the cpuidle stats in that case?
> I'm thinking primiarly about last_residency_ns and rejected here.

As the idle entry will not happen (call_cpuidle() is not invoked) 
the stats would also not required to be updated.

Thanks,
Maulik
