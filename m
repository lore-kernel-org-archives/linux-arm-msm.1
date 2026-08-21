Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEE33A5430
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 04:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288094; cv=none; b=S3o+xbnPJ3pRquxfi351fmOK9H6EpwfpWa54R/Tin/ex+GMd/GdDqBaQOo/zPPeAn2IBbGgqITVsyaA15tTe2HQ2PYNou6oB/289vT5f1aCjXjbeNBcty/Lsj7oRUTqbxlALyV5umqu7ZXJMYN6BiC46w3k/cQpKTJ/yTWm0OCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288094; c=relaxed/simple;
	bh=jJFqgVQ1xwob2w8K+J2uHQ6676Cn4hsN1VOaawuThpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0C/uhMC0jeiDbTyo2mmWKt5V0ni6iaIX8NyLS6sXJc1tDCQyfZVxLwr3u3MKNktQQ8/WjQQqyAqPizWz5/FKDd54QvtZM/z6N6F5kJ3n2HF8ofotsa4ccVh6dYh2Tf/+okZbTefurrZCYZQFG72Qe2NhEsEk17fI5MVTalVKak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCK+nW8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XJmpQRSU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCK+nW8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XJmpQRSU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L46a26771422
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 04:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVPRdpKQ6Z8b1wwWbv6uhUylN+tu2/L/LH6uVlvCTo0=; b=cCK+nW8s2CiKTrbe
	YjL2ENSbeZfWg+crErkiOyrqwA0DGPwMWm5YK0YBjssY6MTbyHeRxeVq5Axc3/+V
	drtYKlW6TQVGbFPHb77R+6PwXMgLyy4dxSfryUyheDY7MaNyu24G5IEVZdQzVcvO
	6Cv13plEF6f2/+HdysLBdm2cPkiQej7H/U1IlcrsmqvhXn9hq8T/pNJx8DNcAc5u
	8IYmnlzCrM1VXlgH9BEg6VPV5LDbCITTNOFzV9bVgoQtR/Unq0cIbHuV+U4v3dpI
	OFSc5bEvuGXdmQBumQLDNCb0zs39wxVcPE9qe73Ti4xN3JBVwDGJauBjRKf8vzrg
	o8/HSQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fbw8494-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 04:54:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so1133307a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 21:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787288089; x=1787892889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVPRdpKQ6Z8b1wwWbv6uhUylN+tu2/L/LH6uVlvCTo0=;
        b=XJmpQRSUqIDf73TTjFxfswh+Mmm/W1Bk2JPr9fim4SKke+QLpLrFVP8OJdbZg6EI3W
         OxyerVc1DiBpt8bVQ5VfcplOUuNbZ8Sh2Cq5XuIRo+Ou2hzAVQ+7RUNdBs4XDykL0sd5
         Y5p7WWPkc1RRv5/2tM+pRHEi2DTYfY/aNJBOgHx2ZBKDt8OjFRAzE0gGhEKgHt5JAeF5
         rUFsWJSO0hoLYzsXUdu3qhGo3JEi4XcgkJz4Fq7KEgNG8qNj1AyPo9aZ0rneYciCBlt3
         wezOFMRIEgVsQcPr3ZZljJON/qwar23Uilg3RUdOhQRN7Bt5MTcKd3m1+pGFfUl2ViP0
         5bWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288089; x=1787892889;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVPRdpKQ6Z8b1wwWbv6uhUylN+tu2/L/LH6uVlvCTo0=;
        b=AGmOdvcLvD6OjV+HO3nfSQNwFAPFtKpCJfW+O7+2ybrzgZQLWTppfdR/QMk+KoMfGG
         kf4STHtqueQUNlwX73R1u1+mEqA0n+JgZyr1T9pFsTbERy7ckI2BCtMtfL1SoW9hnYh0
         x69D8+p82byGNOlsw6DANbCP5Rg0h6zGVCfpqpHest6hzM8R01RBSNIX00GkwYJW6jo6
         Q+fBX5KoA/OO/rNS+DYowmfq7H/f3r32dxBVxoAHq5CqQBso2/dfD01izA8T2xm60E0f
         NETeU/VPoFAi6NKAnOr4s5g102WaFwUoRFUJkBfqZU6XpnClxXgnRYcRctceejUSxOGP
         lp6A==
X-Forwarded-Encrypted: i=1; AHgh+Rp/nbqo60Pgze2g6CF3JgCXIZ09z8BcLGOK/OgdFqMQO4zzAc7O9Rnnh4NX0RlFe+C5jU0RrJ9hEM3w0epT@vger.kernel.org
X-Gm-Message-State: AFuF++l8QwhhgtybZlDkApL3mPd5XQoUBmuBPcEX/qai/cXKn8mn9m14
	6SCbg3LvI7tizfQTHeENELxp9zjQ5sXsumuEWm/ooqAECNhBWNjRLDaSaRyTR1t/yhOpS0somOC
	SukOgVJenHtaFXN+xNMs/VZzY1NnTnE6EIgz0zZmLBlkVu6m37yN6aq3ZboaY6LRKrxff
X-Gm-Gg: AR+sD12RivSwKASGpQ2UdtfVeLJiN7netb9w6hTZn+O6NkhN8ZqoOkGsFKNwU7/v+Lk
	Nuxc60JqpMc8iXTsr3DkxDDDHV+RAwqcZSC093AA6XyzVBlbFxq6oBQji41eIu632wtGvtUcvxJ
	YlbF1y/7KvnB9HXDvSfLkijKF+jukfY/dqy3I+s7Nns0rAG0iZAmtH0F7KmryyMkgbpiue14Tjn
	Gv+ELFslDrRrKliY4ZAKfiWf2JXjPBRdpbRFScf/MIFyV7Xs8o2vHIgbbpISum832g+xCC/fNHN
	PorXIEeHM8qIw3YCUQfFknEoSLPemlIhZX2i8jQZb6fq32SPPabdE34aidzNpx4pF0Qb5YVF5sB
	VY9URtm4O+N4hvsoOOL/2DKuxdXQMMQ==
X-Received: by 2002:a17:90b:4a89:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-395c33bd6d1mr6622738a91.7.1787288088936;
        Thu, 20 Aug 2026 21:54:48 -0700 (PDT)
X-Received: by 2002:a17:90b:4a89:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-395c33bd6d1mr6622618a91.7.1787288088440;
        Thu, 20 Aug 2026 21:54:48 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4553168sm1530980a91.1.2026.08.20.21.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 21:54:47 -0700 (PDT)
Message-ID: <04990044-45b3-45ca-9e39-925d5bbe62e2@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 10:24:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] iio: adc: qcom-spmi-adc5-gen3: Add support for QCOM
 PMIC5 Gen4 ADC
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
 <20260731-pmic5_gen4_adc-v1-2-9c49b2eea6f9@oss.qualcomm.com>
 <20260803011400.1fb6c93a@jic23-huawei>
 <a98d90bd-aa9d-4af3-aa54-3a34300070d4@oss.qualcomm.com>
 <20260807001822.31f7c137@jic23-huawei>
 <f2b2f590-de3e-4f10-b883-92845f59412d@oss.qualcomm.com>
 <20260815030830.24fc732f@jic23-huawei>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260815030830.24fc732f@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDAzMSBTYWx0ZWRfX0wm2vq1Kfmqg
 GGG+JoooeYF4TAp8cKabmuuzkPfQCMgkzoqfbkbv6an/kEI+DnJQJjZive9HJzk4yvmhzUArfbk
 XyduYkqVWne+zdUsKXQV+Jz184mVJ2Y=
X-Proofpoint-ORIG-GUID: OuixRme7em3ghoqEKIrGngQJ67CMk9HE
X-Authority-Analysis: v=2.4 cv=L9AtheT8 c=1 sm=1 tr=0 ts=6a87da19 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hBCwbVwefb8Xt-lYK48A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDAzMSBTYWx0ZWRfX9XlU1f2JcD4v
 Jk9tn+aTCcdEueUimwrL9f0iJTcQyhpbQc9QWyXSHd4GEdP4lRRK2s3MOJh8bJiUq6w0r2u00gJ
 nc/CuOUBSaYdzm36d8adeISSYy1KDzhKBUgkL3tbq8QYAFrpg692jU8vSm5DYGaC9cFIu03nS0I
 FuYNzCc20fE8cbEDcOkmoYlyPprFdwmR0eU52pTdvObttJeQF9CmUUq6g0yqXVyB0LFqg8Qinj/
 GyYPI3z5LXoePz7DKuF0oghgOmCb7/abVHxB2nRyPiKGLbfdWp8qkighuWNHIZ8JVX4sOffBP5X
 6IB62WCn426pFBYTk0T5i4AW/SPX0N+a71tdd/YUknwIx3bAx4IRBSA7pn9mUnMuPQXhCbCBUp1
 YeQ3otXbrwzTQDPIK0ILblE6P7O+XBzR58e1bty5KFFxC38rsoAlQ2SoyRMeVN+GaGzTf5dj170
 zzo0RW9xJhxD3xyKEkg==
X-Proofpoint-GUID: OuixRme7em3ghoqEKIrGngQJ67CMk9HE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210031

Hi Jonathan,

On 8/15/2026 7:38 AM, Jonathan Cameron wrote:
> On Fri, 7 Aug 2026 13:37:02 +0530
> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
> 
>> Hi Jonathan,
>>
>> On 8/7/2026 4:48 AM, Jonathan Cameron wrote:
>>> On Thu, 6 Aug 2026 16:22:16 +0530
>>> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
>>>   
>>>> Hi Jonathan,
>>>>
>>>> On 8/3/2026 5:44 AM, Jonathan Cameron wrote:  
>>>>> On Fri, 31 Jul 2026 23:36:15 +0530
>>>>> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
>>>>>     
>>>>>> PMIC5 Gen4 ADC is similar to PMIC5 Gen3 ADC, with several changes made
>>>>>> for improved performance, mostly at the hardware level.
>>>>>>
>>>>>> One significant software change is that ratiometric conversion resolution
>>>>>> has been increased from 14 bits to 16 bits, so the maximum value of
>>>>>> these measurements needs to be updated for Gen4. Add a new scaling
>>>>>> function for thermistor channels which use this type of conversion.
>>>>>>
>>>>>> In the latest PMIC arbiter version (v8), there can be up to 4 buses
>>>>>> under the PMIC arbiter and 32 PMICs under each bus. In order to
>>>>>> support communication between ADC on the master PMIC and ADCs on any
>>>>>> of the other PMICs, a field of width 2 bits is added for bus index
>>>>>> and the bits for SID are extended from 4 to 5 bits, in the SID
>>>>>> register. Add support for this.
>>>>>>
>>>>>> In addition, it is possible that the master PMIC has ADC of one generation
>>>>>> and it needs to communicate with another PMIC with ADC of a different
>>>>>> generation.    
>>>>>
>>>>> "Possible" sounds a bit hypothetical.  Can we state this actually happens
>>>>> on some devices?    
>>>>
>>>> Considering existing upstream platforms, this is applicable for SM8750. I'll
>>>> mention this in the next version of the series.  
>>>
>>> What happens on that platform today?  Wrong values?  Should this be treated
>>> as a fix rather than a feature?   
>>
>> There is no issue on that platform right now as ADC channels needing this
>> support are not added yet. SM8750 board files only include pmk8550.dtsi, which
>> has the top-level Gen3 ADC peripheral and some ADC channels on the same PMIC.
>> Gen4 support would be needed only when PMIH0108 ADC channels are added.
> 
> I guess chances of anyone running an older kernel that the device tree on
> that device is low as other critical stuff won't be supported?
> 
> If there is something easy to point to for that, add a note to the patch
> description as it justifies this not being a fix.
> 

Sorry, I did not fully understand your concern here. Are you asking if
SM8750 runs on any older kernels and the lack of Gen4 ADC support may be an
issue there?
This would not happen - let me try explaining with some more details.

DT support for SM8750 has been present since kernel version 6.14. At that
time, it included pmk8550.dtsi, but this file did not have an ADC peripheral
at the time.

The Gen3 ADC peripheral was added in pmk8550.dtsi very recently in this series
from Neil Armstrong: https://lore.kernel.org/all/20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org/,
and I see this series is present only in linux-next right now.

With this change applied, the ADC peripheral with 3 channels of
PMK8550 alone (which is Gen3) would appear for SM8750. This
would work as its functionality is fully supported by the existing
Gen3 driver.

Gen4 support is needed only when we add full ADC support for SM8750,
meaning when we add channels under all its other PMICs (PMIH0108
specifically as it's Gen4.).

Would it work if I mention in the commit message that SM8750, added from
kernel 6.14 without ADC support initially, would need this mixed-generation
support, but only once we add the full ADC support (for all its PMICs)?

Thanks,
Jishnu


> Thanks,
> 
> Jonathan

