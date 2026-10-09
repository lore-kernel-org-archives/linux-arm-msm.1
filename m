Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330E535C6B8
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540597; cv=none; b=GMzi/M4hVGq9G6glQyBzF2IYN7HB/TIQGirjqDUcx4ZsOptWR2OJVmr7qv/wYB7ynijiGNG0h+86TjzVvHD8tiosVSW/deq2VAoPIagS0Tw1MC2q7QFQ0EjUTlEo9tWdPPS1wcFQcdSs1XwIUfc9LD7kSO7J9SpusY3BZM/PjRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540597; c=relaxed/simple;
	bh=RojMG25mfLm/DZzwFxgu93kfVSJUhFHHMYlqpPJ+GL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uFzqVlG6ANoJul6Afj6lQKap0EvpymqGOQw5deXkVkDAUtAPlDIXazeXxwY0BH35s9Xl0UF2Mf8larzHfGIY7Otu4hRaPKTuejhWtNUA3Th4XiaZ9QFw583AuEXYk3j52enj81QCzgVbwSOWjsBGl0AViFWbtAZVEMBDkdJb0t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSubTwXB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bn2/OZeU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSubTwXB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bn2/OZeU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KG2j1625878
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 10:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N+fBuMRCFeooJsUQbzMEzmXJA0656ALYkaVEwLsyNAc=; b=lSubTwXBIZExw0y3
	mCKZ5O4RcU+/WWJNznioXRJFmxmv2GrYHrkRjOa3R3q6tSX7A7IwWV72YHThbB1X
	BuThoo8If2omR1gAoC1f2v7eykSQhm0ccmnHC6i6CM47K9us4bBUeBOAjmN3eM4n
	GIGSlqKAfQ/9VN7U0HZSYpCQnLW5jXDly/MjbPKshHYSFObcG1UJ9C6dWVHcsF28
	80m3hnNpGuNXfSqOZ/B/RTxtQ49QS/WHvEGq3kXN072GEDoeM32Y1QN9NKKszayG
	IQB869AkZhR9JErwJOvj4U7kTI5QFl7X6qj6II8IRs6KHfN8EGJSNUQR7sqSSvj/
	wZfbLg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj30yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 10:09:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34ef0362d95so12858677eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 03:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791540594; x=1792145394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+fBuMRCFeooJsUQbzMEzmXJA0656ALYkaVEwLsyNAc=;
        b=Bn2/OZeUj4l5AMiD2YJbIJjmNOWFjbeNrWODyuHqE82JnAfvvgo57OaSySF6+ONrfE
         IZ8ZaCCvUVgVdV4LJ1O6ywcHfMGSejY4gCfMD0p2znXwm/3x2O8d8kxB8woe5ng1BPQ1
         pFpgqL3uO08cnRbwKWCDpHFa6rAqHNDZePbjM4p917EJLnVymE0frqpmxbjsn4sjJH4a
         TBryB0HElXQZh56n79OYiEmn9CaLb77rAUAxZE3wQu2lPRbvIdgHWB3q5cVjUl1Av9Nl
         Zd1hwbdEZNfmP4TXWh7nVT96cAAcl4auHdPQvHu9NBasldCB43x6/bZWvptVI8dL2nRG
         eBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540594; x=1792145394;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+fBuMRCFeooJsUQbzMEzmXJA0656ALYkaVEwLsyNAc=;
        b=OtoJvRNf15EYYUEd+MPx/+j9yXUU/W7d9kpYO8/iiT+BP+9s9FxhkWFgi0byJRFd+b
         cTX+VlswqNjDrXOck5VuFrZvqvI9U+oDXaNfdsJhOrO01RdgHOn3bfS/jdSuFP66PcsH
         0D6YaTXGb+w6gdDDMjDI9wY1xuzPr3XwxH+10YMwrSaro53ptVNplasdRzwN14p9jn3m
         K+qLJgUo8pLPcehmYYHTA8121rlJJflnRejDjdiyv+IBPx6I/wliQh28Zn5r2maUlz/e
         oN3iJ4+zW2bmzYMwapMae1ugEW8qpMLa2mc+TsgFeYO6zNXvvs4UbujO1n7Ky2RNPSyE
         rIPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOUx/UiOMnQkWZzzaFfcui+kAwc+AZh81q0QzInXexWc5w1z7U3pSHkt+Br9E3LixwGZYAqCdyVdJp7IkY@vger.kernel.org
X-Gm-Message-State: AFuF++l2OKv5PBItodzzdAR2qWEVkH34tkstZrt87uvGlhzWNSAgasrc
	UpC2ZR/eP3utHgMCdRAsh1bJA9LxFebiagfeks5FxdrcpEFtZkrMzSNHxSXrNNsHAMYmzOsn/Jt
	nJDJIk+YNPZztztdz6JhCfnn16bOx/I6PGVxOJJQZSjN5u7fQCeOemgTroXBIhis0M1ZX5yD/ls
	v5
X-Gm-Gg: AYBFou3ZxqhiQzv9/70jMasykGZljqQWakGHovK5SI2XX9AFTpDkWw35Ndj0mjl4QsC
	PrrfJ1fbWe3nmNbMZLuKb86aJvIhFkNZ7hpN3QDKcRPKnJ6kFqcI5YytCj63xTh7okl104QC5xR
	qtuEIOib++wsS8iQhZIjv3g6ooxRGC6CTmiqf1lhjThjveIYn57mvWpfuoG6RQmH7r8eKrQL5cL
	JEVhtCapFVq8weMjVUPlbbm/lKvOtyDZUGYIhIaQrOuT2Kbo2tsDMYagCHVevkXTfDurGq8wmzi
	cdzMlNyMXnx61EhU94TaY53f9usHDJs0VTkcGb3BG0xGcl0j5gz4Nk6GD9UeVqumi0uftMVg/Oz
	u8RNxe1NO6RjT+WF5rpS/aSjcw9ZyQisB
X-Received: by 2002:a05:7022:3b87:b0:148:80d4:84b0 with SMTP id a92af1059eb24-16a60de2f7fmr2202193c88.23.1791540593810;
        Fri, 09 Oct 2026 03:09:53 -0700 (PDT)
X-Received: by 2002:a05:7022:3b87:b0:148:80d4:84b0 with SMTP id a92af1059eb24-16a60de2f7fmr2202142c88.23.1791540593160;
        Fri, 09 Oct 2026 03:09:53 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1cc25sm7332804eec.8.2026.10.09.03.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:09:52 -0700 (PDT)
Message-ID: <7ab6eab6-ec6e-47dc-b387-eb380e2e365c@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:39:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Mentz <danielmentz@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
 <20260924001502.GO1540250@ziepe.ca>
 <CAE2F3rCVh0CmW6+a__PcCrBgsMJVompKJX_qYBdQ=exj3bYtCg@mail.gmail.com>
 <20260924225340.GC16465@ziepe.ca>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260924225340.GC16465@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac8bd72 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=9jRdOu3wAAAA:8 a=EUspDBNiAAAA:8
 a=YC-9j5RmPirwrlDSig8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-ORIG-GUID: UZDRQPXN4urOrKCrgATHsqKLL1_3_OA1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfX3caVUjRJkWUh
 U3sSHohs/W4GEm0A1rVHY0m9XjK4JAhaIb0qhShqq5WWU7G5LHV1fR5jq7ifY9JDTglvmrD/ESS
 wy4ncy9tg/74bmFKN6GkGgq1F6G8iFboLE2dKHwZvnR1onIefPMVI5aJ+Cve4ZGwXl4PYnGwLMu
 fsTaNCPpxkeBn0E+4ghBpcDx3JmJRKBsVLdA5qLoCaOnuETETtvyxfnyScKhltVrtDdIWpEyqz9
 LcelyA5q5ojJd4qzMJPaDrscBI3Zq5jZloBSXVL6vfJcvrVCyADD5f1Ab4bM6kyhDHbApOjHxkI
 iUXKOPMQp/veY1cZfmACMgiSgyFOvMZ1Cjidji+7X6Z+7ZOlZcikrKsnygxfWWwr6l59vOzE4Vz
 x7gKnQ6L0ym3JWckUpTY4bQSwQGbno3d9vc5a9Hf7fnBJh62KOlLkn4A0heaITBS5tdnaked3Rk
 EdOy2Ssfs6CsqvD6RBA==
X-Proofpoint-GUID: UZDRQPXN4urOrKCrgATHsqKLL1_3_OA1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfXzwasw46l33Rp
 bZn3n0rmIOjNPoEYJ2mxjehzIsCWVm2yeGBZxt9F06Ugp5jYxBVx/bCyVsb+QH5WcO2eBK5BwgO
 FqkZA2K/ZCqjsJhS4G9ZL0S854iMQUc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090040



On 9/25/2026 4:23 AM, Jason Gunthorpe wrote:
> On Thu, Sep 24, 2026 at 11:49:50AM -0700, Daniel Mentz wrote:
>> On Wed, Sep 23, 2026 at 5:15 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>>>
>>> On Mon, Sep 21, 2026 at 04:44:07PM +0530, Vijayanand Jitta wrote:
>>>> From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>>>>
>>>> Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
>>>> When a set of consecutive PTEs map a naturally aligned contiguous block of
>>>> memory, set CONT on every descriptor in that group so the hardware can
>>>> combine translations and improve TLB reach.
>>>>
>>>> Advertise the supported CONT group sizes in pgsize_bitmap. Callers select
>>>> those sizes through the normal page-size selection path; io-pgtable-arm
>>>> then installs the corresponding tagged descriptors directly. A partial
>>>> unmap of a tagged CONT group is rejected before modifying any descriptor,
>>>> so a rejected request cannot leave the group partly unmapped.
>>>>
>>>> The IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT quirk allows SMMU drivers to disable
>>>> CONT support for hardware with implementation-specific errata.
>>>
>>> smmuv3 has this errata, it must be disabled there too. I didn't notice
>>> it in this patch?
>>
>> SMMU is an architecture specification. I am not aware of errors in
>> this architecture specification that would preclude the usage of the
>> contiguous bit. I understand that Arm MMU-700 has the following
>> erratum
>>
>> 3777127 Under invalidation in TBU possible when using contiguous page
>> table entries
> 
> And a neoverse one too.
> 
>> The recommended workaround is described as
>>
>> "Ensure that contiguous page tables are removed using a single range
>> invalidation. Arm recommends using range invalidations to remove
>> contiguous entries anyway for performance reasons."
>>
>> and I believe we are already doing this.
> 
> No we aren't. Go read my fix on this:
> 
> https://lore.kernel.org/linux-iommu/1-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com/
> 
> I have another patch that fixes it for iommu domain mappings too.
> 
> Jason

Sure , will disable it for smmuv3 for now.

Thanks,
Vijay
