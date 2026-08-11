Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC15A2BEC4E
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786461014; cv=none; b=GXzvobBQ+JCM7w9Jy8fXM4alvVN18q2LkNkCCKOkZZ5NdOqpDV+gylphWOy6dJX2z2uIvqVoPTq5nGvX9CL+Pbu5Ly42x0i/wuJxKPbXtOBikE6E2k9i78ZEMNpF9GgK9BnQTvqfNUnqYI7N1Nfc5FMM4UrbIW03ybMnvf53TsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786461014; c=relaxed/simple;
	bh=S86o0eKx+02t1WAXn4FhF+jQUV2e6dBCJoz6z5dt5ls=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TtLZa5pn0TRwmKhHMBnSSrrxi2lGaSLws/qL2NgdM0Aj6QBwhLoXKyh3uU7wm1gDT4+WnQY+n6A8jqhdeeNRugTazEAUID9Piz/bB0qDdPf+cGb3D73YhyNN0DM4rDzmsv1ifyWscQxfr6+T9XCcJ1hoATKMpKoS+CA5xRDNoAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdMN0Ndj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFgNonaz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdMN0Ndj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GFgNonaz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWieH410027
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fLmbfzBbmwEHJMWWKfeQ9KCK6mpkgcHpwny+DSlSQKc=; b=TdMN0NdjLUGAgQxY
	tjx9wjb9d4NJWK/0eWqzeQeGQFpi/KuLyxUNPIB+lkIFwXsJ+579gbWyeY1ByD5e
	05S40M0qliYwJYsLHDRLom2Z87Vcc72lNfe64GXDK4Q+mMRlYDG2D4E+mcLyRoqb
	Car3TKcQYxypRmI9mq10n5v3M27Rm0zDVG0JVOWDVdt695GIgSCBEiNi3sGaydEZ
	JZ3C56PfxlBM3oD6p4uoOig3lcxPtswVhDcOwO5FWlY9gvZF6GsqBpMICBdVuKmd
	0asrJUav2BuQGSe6XrX8Uy91E+3/4gzGhRjYoMmFyIdlKfPaSshBPdd7MSDqlEQx
	xSJa0A==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyvcrag2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:10:11 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7fe835353acso55182257b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786461011; x=1787065811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fLmbfzBbmwEHJMWWKfeQ9KCK6mpkgcHpwny+DSlSQKc=;
        b=GFgNonaz5OXP+TzdW1xpS7FyJAM30CjFgUlcjFhSn414S0ORwwnzijelK7vqaHW1xL
         CMhbbpErD+SF+0HCpFvmJV/DTjHSgsUOcRQ9stMfVrtaOi5dXee8QSI49oMxse9crnl3
         tgCJQjIf7njCfrFVw/L77BDjhX0IbLkVx9aydwuHOiR7mWaseLDmdoyO6nJ9btn0rCWs
         +tMOtEFb7CHfi9d3oPR5NFNjUxH+dTZtwSfMP7zOViGjsZ1M8i0jaDcRQRDxL1mdsHS6
         qA+39gFIfoTcmEeiKr7mivy4o5YoIXO7J+c7Xy7uar2dYoKn4Sc5Tq9yRmrczJqG/UyG
         LDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786461011; x=1787065811;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fLmbfzBbmwEHJMWWKfeQ9KCK6mpkgcHpwny+DSlSQKc=;
        b=JcpgEa7II1jAV9myJKQaPzWPr18/kDSsolr6aUZYwgPxhuXv/zupE7B+jPO5nODu+i
         XdILhgMe4WJxHEVAYT0ECA1YyFfNnsmn3L+vHJjXZhSDvlSjWo3EYDbCbtlpBKlK2GpS
         m3J7nyFYMrVgRp7ErUnWTSIt107w+LnGpzYhHWDcXOlknNCQ6mQvf/Pctf8G16HTcyL1
         Y1pxMtFr8xED7/7PjqdfMLFvpr0VXSlgsCX58sgGuhrbMx8HpcOF/n4PI6Xc/JdbztvO
         svzJsCuAsicMkvoVtdWBPEZUoOJunFuh9cT4QqqQkhw/xPSSrgFexrDs4QBkv8RtWbfb
         +Syw==
X-Forwarded-Encrypted: i=1; AHgh+RpYYxJNhKDx3KdCqJf53NzsJcW5iN9f88viySb0rko4ElLPpx9ddN69CIW8yedJrmDgvAx1XspnBg94V7Uj@vger.kernel.org
X-Gm-Message-State: AOJu0YwqfTdUsYFitoeKOfjnVMHSu7bpQvnw17Wb2T3FrPwQI7fY6dgb
	7xYfFED1kO5vFEbATDpCbOHy1lJd7CYrDr9H8sSXcLZuU4TfEgw9MrKSCjjOAx213/0FHN3gKHF
	UO3oVaBa2by91guFD88VMwDsmh4AIAEewRGhKy5U5JNYXPGAZH9EFAYh4rX+IuzJpluBQ
X-Gm-Gg: AR+sD123cFXZZaTsfvOB8WyoYW5InAWwtSR64gHIe+wPHNM6VsOs9sfknz2wpPjctAv
	D0hyhZNfLU8MPuUvjyj94zg77TbRjKsOlDsTEegK24JjwVAEuQiIpKviosbmse1kE3mkOKtKPSR
	NSDMMRbvbXOSVjuq/gBW6KlAMxrojSquAaVWNLl85KJVerTTVA5zuvNYVySy0SumdpW8k4a8B1T
	93aVgDw/aGaoJh+2mnTc1behL3sUYI09uLCJVeq1wM2s4txdIcuK0xtkoeYwlfSGeD+jbZetKdR
	dTAwO5QrLnSHEySSH1pnQh0WeXjikamJDnpf6SuhK8yQT6JQ1HMK3E0N1J5AfnWuh2BggQQv8qv
	WQHAcEGhWSBcr+k6QYUWGoZPN3Ysi
X-Received: by 2002:a05:690c:e3d0:b0:812:be92:6ea6 with SMTP id 00721157ae682-82f2e45d7dfmr27386227b3.28.1786461010586;
        Tue, 11 Aug 2026 08:10:10 -0700 (PDT)
X-Received: by 2002:a05:690c:e3d0:b0:812:be92:6ea6 with SMTP id 00721157ae682-82f2e45d7dfmr27385417b3.28.1786461010018;
        Tue, 11 Aug 2026 08:10:10 -0700 (PDT)
Received: from [10.218.33.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-82ebdb7bad4sm11169137b3.12.2026.08.11.08.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 08:10:09 -0700 (PDT)
Message-ID: <328b2179-3284-40fe-808e-b1bbda322e1d@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 20:39:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
 <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
 <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
 <4e266d45-ee88-42f8-91da-6253927686ae@oss.qualcomm.com>
 <ak5pC_meP8KRc3wJ@baldur>
 <9f31bf3d-3c7d-45ba-bc25-e6349f689b70@oss.qualcomm.com>
 <kb2ftnhyvewqgfjdsteenrd3vr4qbrcy3ooiasiui2rchpytol@u2wqjrsc6ebb>
Content-Language: en-US
In-Reply-To: <kb2ftnhyvewqgfjdsteenrd3vr4qbrcy3ooiasiui2rchpytol@u2wqjrsc6ebb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEyNiBTYWx0ZWRfX+ho5ffWRWPr9
 UYF4n3yafHfbT3wpny/smrR/3LKytAat6Uhgd7DUNfVrrhsZup5M3KknQ7HeQdcXNdOyiHY5aSi
 wagJbzmtR36KEXZmtC0oizYO5UgSpblPYupeVB9TV3NzHTgP0Fxlj/EgajR+ec6TpqBq2oYCcVL
 rysPEDubaLTD+IlEO5r72GUDlJap4ZK7Gt0qpHlWjQVA2TMY4owtEK0gWOpVN8m/Rxn2ATjkGlf
 38ALSfniNwE+n0PtrQU4Mzk7cnRiyA/8tZa0kZ969B2DzuaBirGq6b19MsK95ickUjXdjzxqz4L
 6AdujBLs+GmbFbnWxO4kfnBjzvw3HwSjP2/kwzBIZWBKVZhx9AO4eR+gumTpWjdIzkPhwpps3wS
 h2KMeYx+Q3a3flTeUxTy4RMN4tKK+1W4sCUjpKPPdCr/qUZOrthz5TmalalP0OEFWAzwE0cQ8bq
 UTq0E+RRwROVxLUvsaA==
X-Authority-Analysis: v=2.4 cv=e/A2j6p/ c=1 sm=1 tr=0 ts=6a7b3b53 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=vyUGYwsnUGOcFljtYcEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: uZeqiD1v1YuMC0g9EoHm0HXt6bHnvbvj
X-Proofpoint-ORIG-GUID: uZeqiD1v1YuMC0g9EoHm0HXt6bHnvbvj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEyNiBTYWx0ZWRfX2fiSbEPn+OyV
 WPEP/t/GQ3DAv+bgpfw+mkIYqQIJvFNzxMFCar5ZsIiOzvFyjyxBDyPP5mfWxHaXXEiEYOCQgYn
 BFMcxX21YRCH2KLnm8IQaoCuaBKXb8U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110126



On 7/20/2026 8:10 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 07:41:35PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 7/8/2026 8:48 PM, Bjorn Andersson wrote:
>>> On Wed, Jul 08, 2026 at 08:22:00PM +0530, Bibek Kumar Patro wrote:
>>>>
>>>>
>>>> On 7/7/2026 10:12 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jul 07, 2026 at 06:06:59PM +0530, Bibek Kumar Patro wrote:
>>>>>>
>>>>>>
>>>>>> On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
>>>>>>>> Some SoC implementations require a bandwidth vote on an interconnect
>>>>>>>> path before the SMMU register space is accessible. Add the optional
>>>>>>>
>>>>>>> Why is it limited only to those SoCs? Is it also applicable to other
>>>>>>> Qualcomm SoCs?
>>>>>>>
>>>>>>
>>>>>> I was hoping to keep this series focused on the core infrastructure
>>>>>> changes: the bindings, base ICC bandwidth-voting support, and DT
>>>>>> interconnect properties for the platforms currently supported on
>>>>>> Qualcomm Linux and have been validated so far.
>>>>>>
>>>>>> The additional targets have not been tested yet, so I'd prefer
>>>>>> to add their support in a separate follow-up series once validation
>>>>>> is complete, rather than growing this series further. WDYT?
>>>>>
>>>>> Then it should be a part of the commit message. All SoCs since SDM12345
>>>>> need to vote on the interconnect (and then, in the cover letter mention
>>>>> that you convert only a few of the SoCs). We possibly can help with
>>>>> testing on other platforms.
>>>>>
>>>>
>>>> Ack, sounds reasonable.
>>>> I'll add the first platform onwards which interconnect voting is required in
>>>> commit description.
>>>
>>> But to what degree is this related to a specific set of platforms? If we
>>> look ahead, aren't we expecting the list to grow to include all
>>> platforms in the end - resulting in a lot of noise and churn.
>>>
>>
>> We have seen this issue consistently on SM8750 and later platforms, along
>> with at least one customer-reported instance on SM8550. As a result,
>> downstream Android implementations already vote for the required
>> interconnect bandwidth explicitly on these platforms.
>>
>> On Qualcomm Linux targets, we have observed similar issues on Kodiak, with a
>> few occurrences on Talos as well.
>>
>> My understanding is that the interconnects property remains optional, but in
>> practice it is needed for Adreno SMMU operation on these platforms.
> 
> So, it goes back to Kodiak and Talos. What about SM8150? SDM845? Earlier
> platforms? Is it limited to MMU-500? A6xx+?
> 

Thanks for waiting this long for response,
I rechecked all the legacy platforms which are present in upstream.

As per the design it will be applicable to all targets with MMU-500,
(Even though issue hasn't been reported for all the targets on MMU-500,
e.g sm8650/sm8250 but the nodes will still be needed).
It's independent of adreno version i.e A6xx+/A5xx+.

Reason being the design difference on
how TCU works in QSMMU (SMMU-v2) vs SMMU-500

   QSMMU (SMMU-v2) — SM6250 / SDM845 era
   ──────────────────────────────────────────────────────────────
     The TCU is NOT a separate hardware master.
     It is integrated INSIDE the SMMU-v2 block itself.

     GPU SS
     ┌──────────────────────────────────┐
     │  QSMMU (SMMU-v2 @ 0x5040000)     │
     │  ┌────────────────────────────┐  │
     │  │  TCU (integrated, no       │  │
     │  │  separate AXI master port) │  │
     │  └────────────┬───────────────┘  │
     │               │ page table walk  │
     │               │ issued on same   │
     │               │ AXI port as GPU  │
     └───────────────┼──────────────────┘
                     │
                     │  qxm_gpu0 / qxm_gpu1
                     │  (GPU data + TCU walks share same NOC master)
                     ▼
                GEM_NOC
                     │
                     ▼  qns_llcc0
                LLCC → MC → DDR


   SMMU-500 — SM8150+ / SA8775P / SC7280 etc.
   ──────────────────────────────────────────────────────────────
     The TCU is a SEPARATE hardware block with its OWN AXI master.

     GPU SS
     ┌──────────────────────────────────┐
     │  ┌─────────────┐  ┌───────────┐  │
     │  │  GPU Core   │  │ GPU TCU   │  │  ← distinct HW block
     │  │  (rendering)│  │  + DVM    │  │
     │  └──────┬──────┘  └─────┬─────┘  │
     └─────────┼───────────────┼────────┘
               │               │
        qnm_gpu0/1        alm_gpu_tcu    ← separate NOC master port
               │               │
               └───────┬───────┘
                       ▼
                  GEM_NOC
                       │
                       ▼  qns_llcc0/1/2/3/4/5
                  LLCC → MC → DDR

   ---
   Why this matters for the ICC vote

  SMMU       TCU hardware          NOC master        ICC vote?
   ---------  --------------------  ----------------  -------------------
   QSMMU      Integrated inside     Shares qxm_gpu0/  No — GPU data
   (SMMU-v2)  SMMU, no separate     1 with GPU data   traffic implicitly
              AXI master                              keeps path alive

   SMMU-500   Separate GPU TCU+DVM  Dedicated         Yes — TCU can be
              block with own        alm_gpu_tcu        the only active
              AXI master port       on GEM_NOC        master on wakeup;
                                                      no implicit vote
                                                      from GPU data

On SMMU-v2 platforms the TCU never needs an
independent vote because it physically cannot be active without the GPU
data path also being active.

On SMMU-500 the TCU has its own master port — it can be active (e.g
possible page table walks during wakeup) while the GPU data path is
idle, leaving GEM_NOC without any other voter. Hence the explicit
MASTER_GPU_TCU → SLAVE_EBI1 vote is required.

Following are the targets which I found out available in upstream with 
qsmmu/smmu-v2 and mmu-500 respectively

   Adreno SMMU — upstream Qualcomm targets

   SMMU-v2 (QSMMU)
   Platform   Compatible
   ---------  ------------------------------------
   MSM8996    qcom,msm8996-smmu-v2, qcom,adreno-smmu
   SDM670     qcom,sdm670-smmu-v2, qcom,adreno-smmu
   SDM845     qcom,sdm845-smmu-v2, qcom,adreno-smmu
   SC7180     qcom,sc7180-smmu-v2, qcom,adreno-smmu
   SM6350     qcom,sm6350-smmu-v2, qcom,adreno-smmu
   SM7150     qcom,sm7150-smmu-v2, qcom,adreno-smmu
   SM6375     qcom,sm6375-smmu-v2  (apps only, no adreno-smmu node)
   MSM8998    qcom,msm8998-smmu-v2 (apps only, no adreno-smmu node)
   SDM630     qcom,sdm630-smmu-v2  (adreno binding to be fixed)

   SMMU-500 (MMU-500) — with qcom,adreno-smmu
   Platform   Compatible
   ---------  ------------------------------------
   SM6115     qcom,sm6115-smmu-500, qcom,adreno-smmu
   QCM2290    qcom,qcm2290-smmu-500, qcom,adreno-smmu
   SM8150     qcom,sm8150-smmu-500, qcom,adreno-smmu
   SM8250     qcom,sm8250-smmu-500, qcom,adreno-smmu
   SC8180x    qcom,sc8180x-smmu-500, qcom,adreno-smmu
   SM8350     qcom,sm8350-smmu-500, qcom,adreno-smmu
   SC7280     qcom,sc7280-smmu-500, qcom,adreno-smmu  ← our patch series
   SM8450     qcom,sm8450-smmu-500, qcom,adreno-smmu
   SC8280xp   qcom,sc8280xp-smmu-500, qcom,adreno-smmu
   QCS615     qcom,qcs615-smmu-500, qcom,adreno-smmu  ← our patch series
   SM8550     qcom,sm8550-smmu-500, qcom,adreno-smmu
   SA8775P    qcom,sa8775p-smmu-500, qcom,adreno-smmu  ← our patch series
   SM8650     qcom,sm8650-smmu-500, qcom,adreno-smmu
   QCS8300    qcom,qcs8300-smmu-500, qcom,adreno-smmu  ← our patch series
   SAR2130P   qcom,sar2130p-smmu-500, qcom,adreno-smmu
   X1E80100   qcom,x1e80100-smmu-500, qcom,adreno-smmu
   Glymur     qcom,glymur-smmu-500, qcom,adreno-smmu
   Milos      qcom,milos-smmu-500, qcom,adreno-smmu

   SMMU-500 — without qcom,adreno-smmu (apps SMMU only)
   SDM670     qcom,sdm670-smmu-500  (apps)
   SDM845     qcom,sdm845-smmu-500  (apps)
   SC7180     qcom,sc7180-smmu-500  (apps)
   SM6350     qcom,sm6350-smmu-500  (apps)
   SM8450     qcom,sm8450-smmu-500  (apps)
   SC8280xp   qcom,sc8280xp-smmu-500 (apps)
   SM8750     qcom,sm8750-smmu-500  (adreno-smmu not available yet)

Thanks & regards,
Bibek






