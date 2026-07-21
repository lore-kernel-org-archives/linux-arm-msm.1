Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495623BC685
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622127; cv=none; b=EWGXZviAHnUzS7heSfa8I5G78NHgkLF9iJEzGLYJiCSGF0nX9SNg3TtIrgCFgsyxI2rV2Ot9KHrar6+ExG2lYnjuKoEmmfb+TFRc4zWIv2LqkKAYeegrHoCHmECUui/ZHWrY3KIvGzYSvd7Zj58voivzZR96JigUAIKnH964vEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622127; c=relaxed/simple;
	bh=mWumImnjUwOthCVE8QyyeWC7j1UDvdRluhSgXrAoCjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QaCTMdhnq1WCSJMvsxLkb8UTlDBWI5U0Ecuvw/JU2ZcoAnURRtnHB7wUQjBz616yIODEnl48rGpfqvbbMkp1NqglIDrBcOmZbt8uFaOZ4pUO/b0mXYo2VTsLhoSoNpY0SqTWHXbKVWehyCWLXFafjYeuCTpvCwIlyh6FtxFZV+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0JoYaJJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OON3x1G3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0JoYaJJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OON3x1G3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6AQ263978967
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KsWcVMJwJ2v5K6dzKusBzpR5lVUpfbb9D8XZrMSTi04=; b=R0JoYaJJBWBswlFL
	bDt96RZe/Db2JSAkLola8cMVGdYdnVlLgA02vGpGIntAOgfxcRKYH/L8ChPBX74X
	MXReYeJ8erk4qCDYJCh+FACaiamNN60GQlFCorU4OKfFgnVa/mYEGR2n+0CTCx0h
	vRz5Uu5HAUfNoGhNyh6Q/AVA7a8dG9Unatm6VGnHmVkBT2veQM+N4xl+5wcYtse2
	pTMJRXOOTg5AnxA1ie/rZSvGAi1o+mUATnNo27GNDblSIvWfS3mUesJggZ0VPnsz
	O5KYuyZ5iuhj6/FepSnATG1lPaT07RcHQbozmOUzfoAPX4SvpBrKUQfryiCP7m9C
	brcUIg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv437y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:22:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2caf4173b1cso157643745ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622124; x=1785226924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KsWcVMJwJ2v5K6dzKusBzpR5lVUpfbb9D8XZrMSTi04=;
        b=OON3x1G3eqA7cgSEvmeMGyrupCHWG4JFnzp77Wiu+ldlq7Al4nIL8Yw/IBYnc2zGTZ
         nxN5zhpXiTWgqtzWEEb/b4yvj9DlYO/Rl6tYwjx/875mS2xXQtvORwYvExVj+GEC/c8r
         L6TuY2a7rDn9/mI+Za5ZPe9UkKqHOS6zNFeHAQ1gzCyXTqlVCrhkonYNaaqckpz0c1t6
         kK3ZgWaCy15QWHQASxTRXnrfjf5Ri8ULzthK1zR6l3AFs71hMAAT0aiYhza5omG5ItH/
         AmhSc86unVpJNhix7b2Zr6Z+l8yf8gA9WZnzA+r3hYAsfRSR3N4/CucG0RTVrYOxfJ0q
         5jAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622124; x=1785226924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KsWcVMJwJ2v5K6dzKusBzpR5lVUpfbb9D8XZrMSTi04=;
        b=C7yyccaMp17Cw9VidQQF63cEsFbav6GoCw7H9TdwxxS9Z0JKIbYX2r0MlhcQAdO95J
         CsJDoBXtOas2npXRqk8Zh6W8jH4+W0bzyAZES1Nvwxsi54rdg70/0kfiEjAAdeHLtSUB
         WDhcwDKuqt6nGi/ADupKlZr7WI0r/0wuedOKB9lVjWA4VCraVTGpqSVqbZPsNvg5No3H
         cb7FVn39DoG2bqvEItgOs8b+Jf37fcNH3At1ceSXxn5WNpX+Ne40r5Ocbtc4fqfTAl9+
         bAY1hMv+CCKCifSPUuSh2hJ5PlR9mlt0tYFJH4U+bHtXsp9THdE2+ajlD/Ozw/Q+eZdz
         apFw==
X-Forwarded-Encrypted: i=1; AHgh+Rp3Uj6ONCRdxiZqhU3HcHtjeIcbIhFJzKhbrmi4shI4DHUwWTfQvxn8uxGHv+LeA8IBNjgM7sIxULRBZSJk@vger.kernel.org
X-Gm-Message-State: AOJu0YynSUigtkBssQCwllmDsnHh7WCuNNWusAW3xOa864cKFNBL9d7v
	est6S3yPMojkV8M8b/CBvOSnmfLNuYK1EWuirIW1Zro6yZ7LORG4dQqQv4ulEMF3geHKuQq4LHu
	Z7fXIPprftNFJpvdEA5LvopB92rAroX4yNWIqqay1B+miFFPc2l8r48DcelU5fYZCD5/w
X-Gm-Gg: AR+sD13jYTJ4xAHaPEJeCUYH3o7cH6pV3FeN7R0Oy/OcV/b67pIN7W3xr0muMUp/sSk
	cA/Ez6GB/xxvb/fks/9DGhPiUiHdtLKk0iwl8YMZrtlO2I/BaQ2V59XzPLIRqn7VG2Azst/JfuV
	hthm470Xsco0RhSZjo9FBpHgIlwaJI1tTdasNQCaks47XsW8/BuNzPrV2SocYihdeUMNH2EQAMK
	ots78SAgxK764uSutD+8ynbiQRG4E+N/PCwTWARvotAs7d5bZbEXCBxR0p4+2OEAVf8XdbK2+sH
	zsYJyHWN754KwlhVOiEVPzzpChA4ORcUQTjBTJACgvGMUnx4tm33lrkw/0RjwIcndjDKRRVJX82
	8ndzDZ6Pbjw5ni2kEjuRg1xDYAzMHQLbKlg==
X-Received: by 2002:a17:903:37c5:b0:2ca:5d9a:ecc6 with SMTP id d9443c01a7336-2cf3494af91mr190418415ad.28.1784622124117;
        Tue, 21 Jul 2026 01:22:04 -0700 (PDT)
X-Received: by 2002:a17:903:37c5:b0:2ca:5d9a:ecc6 with SMTP id d9443c01a7336-2cf3494af91mr190418205ad.28.1784622123656;
        Tue, 21 Jul 2026 01:22:03 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3476ba24sm70079565ad.75.2026.07.21.01.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:22:03 -0700 (PDT)
Message-ID: <efd5167f-48bf-4dba-b968-d1dac65ccfb8@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:51:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <20260703161228.GA1948451@nvidia.com>
 <b7224dff-7e51-49cb-8421-14d090492dfc@oss.qualcomm.com>
 <20260715113913.GA3775915@nvidia.com> <ald3CuddY6I7gml1@willie-the-truck>
 <2ce09e84-c57f-4087-9dda-07245fadfc02@arm.com>
 <20260715125039.GA50536@nvidia.com>
 <d20d258d-d970-4ef1-bbb6-cdc83fc20c9d@arm.com>
 <20260715180949.GD3775915@nvidia.com>
 <787fa0d3-c1d4-442e-beaa-91a03238f511@arm.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <787fa0d3-c1d4-442e-beaa-91a03238f511@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qGNHb2Y2Fj1ZgDPmAHSdWT4iin_k6kfM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX+iw1c1jg+wTF
 0g+eUZ0FvzeW0pOoBX0KMLsSYa5lzwvyvW+Fewd2AGf77+tSqQmvU4xPliaGlRHEtLTuDGBcLHJ
 lrbh7/jDUcvqD+l7TRz/dqQCKu1qbhoufRd69FAkLBF/72jrmmJITfHAxj+VvRKVkucnWdj6iQd
 mXOLacRRzDWjw2il3PsNAMRuZZ6Gb4a3VYksDqllebBSg+9+FHUL6ETb6ykXwKbIQqgRXnZUwOF
 4wEBuDPvpEHRYOGUyrweACiRMJxsOKrFbzzkjC3cARDC9n4lyksTuzRbWYZ+h1bBjUXBOkfvNBt
 c2Siwdh1gVH9oz5W0LZW3GHL+H2nJ/E9apMmdVDzKwBRD5Yygwufjzh8Lv/+13Yhqn5WSeOwRyl
 80IRSCIUAtc3bABDaliwZG5PGz/yvN7ZEMXT2NBNMMtG+A8K/ZxFxfoHYFVZ3e+gR9rxM56DAlw
 /cQPSau+mDZ0sW7IDxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfXwfl9mZ16n9Bd
 IEuXTRcqEW9X+mTDkVl1BDwH6Dbhv1w9xCK0ajN2HU8zuquCqRNYDeM6irQ4ZuW6O7MIgvgGvpZ
 qbG11NF1R+UCkfSP1blkEaV/7TK8oYk=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5f2c2d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=sSvbjkl6__CUZ7MaMMgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: qGNHb2Y2Fj1ZgDPmAHSdWT4iin_k6kfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210087



On 7/16/2026 5:29 PM, Robin Murphy wrote:
> On 15/07/2026 7:09 pm, Jason Gunthorpe wrote:
>> On Wed, Jul 15, 2026 at 06:45:09PM +0100, Robin Murphy wrote:
>>
>>>> AFAICR the biggest issue with arm-smmu was it using IO_PGTABLE_ARMV7S
>>>> as well. I think it would be fine to implement all the unique LPAE
>>>> features it needs in iommupt, I did most of them already.
>>>>
>>>> I do have an ARMV7S implementation for iommupt, but I did not solve
>>>> the sub page problem. So while it is functionally working it is not
>>>> usable since it wastes so much memory. That's a tricky problem to
>>>> solve since the algorithms depend on the gather->freelist.
>>>>
>>>> I didn't spend any time trying to do anything about this as I was not
>>>> intending to touch arm-smmu
>>>
>>> Indeed between the irregular table sizes (before you even get to the
>>> Mediatek shenanigans...), and the awkward GFP_DMA limitations and/or reality
>>> that many of the systems using it really don't have memory to waste, I'd
>>> have considered v7s pretty much terminally incompatible with iommu_pages and
>>> the abstraction that iommupt is trying to be... :/
>>
>> At least Matthew has talked about having a sub page allocator with
>> meta data, maybe with the memdesc support someday. Even today we could
>> have iommu-pages allocate a companion struct pointed to from struct
>> page that was sized 4x so it could be used for the freelist.
>>
>> There are some other options for alterantive algorithms that could
>> work without requiring the free list. I had some thoughts about placing
>> the free list inside the data itself as a non-present entry.
>>
>> It is not insolvable, I'm just not sure it is worth doing vs leaving
>> arm-smmu to keep using iopgtable from ARMv7.
> 
> Yeah, if you did want to keep bashing at it, then ultimately there are at least a couple more short-descriptor inspired implementations in exynos and omap too, however at this point I don't see the cost:benefit ratio looking at all favourable...
> 
>> Otherwise to have arm-smmu use iommupt you'd end up with two
>> iommu_domains specialized to 32 and 64 bit page tables, with their own
>> ops and a shared invalidation like how the tlbi struct is providing
>> for smmuv3.
>>
>> It is not outrageously bad, but it certainly is a chunk of work.
>>
>> If the goal is arm-smmu support of CONT then maybe there is some merit
>> in doing iopgtable as a one off feature. But there have been many
>> attempts so far to add CONT and they all had troubles, I had the
>> impression is is not so easy..
> 
> I think now that partial unmaps are firmly ruled out and we already have the multi-page map/unmap design it should be pretty minor. I'm also more than happy to stop there, have dirty tracking, splitting/merging and all the fancy new IOMMUFD stuff require iommupt, and keep io-pgtable strictly for the GPUs and "media" IOMMUs that only need to keep providing map/unmap/iova_to_phys for iommu-dma or equivalent usage. By now I'd also say we can reasonably park arm-smmu in the latter category - while technically it could try to support stuff like nesting and vIOMMU (at least on MMU-500), the hardware is in embedded platforms which either don't care at all, or at worst where virtualisation is Xen's problem not ours. As far as I'm aware even the NXP Layerscape platforms are happy with the status quo of just basic VFIO type 1 for DPDK.
> 
> Thanks,
> Robin.


FYI, I've just posted v2 addressing the review comments from the
earlier round — it doesn't touch the io-pgtable/iommupt split discussed
above, just the CONT-hint quirk in the existing io-pgtable-arm code.

Thanks,
Vijay
