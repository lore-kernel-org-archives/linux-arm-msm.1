Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD3E35C6B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 15:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784735409; cv=none; b=bvsVIwhg+lVYOJuKlchicsNyYYW/cPd1rwVAxKRevE0H8Ofk5bSYV2Xdi96eY5vDvEWtJChr7YrRhrVWaG0TGrpa3gRpqe0TgEBW+KdCf7+j9+opHgjEckeecZ18/2gafsdcOpU/ueqwOkwPHYXdNZsWjT65ZUE4EXgGaAZVgJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784735409; c=relaxed/simple;
	bh=PBr2tMN0OvcJR3gYJbFolLiTwNFzIbmCA+UYzYMEeZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b1iPBxfBCpgKTc891yWFFtxIgr3wMWMAQAwlrZ0h//6TcvhmHXtjUiNgFPFslmd9BOZ2ERqnj73vafuc8pV7nJQxAtU72NIrohjOOOF2fJERU2Ulc09RMrCCdmfuDtaTXkZHM/bvHhb+SrBHP32kzQRXw6SGo5dxJcyW6t8sIwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0FdOl6F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kmh/fcpC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0FdOl6F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kmh/fcpC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MFY3t91310336
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 15:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GbqcNI8dt1vpQMoaCvwlRwERMOsFbBVZz2c2G64BAtU=; b=R0FdOl6FUgfugI7K
	bVwT8gaLpYRMtT3OaQZgojrLRHiN/3dfoKawLVpyjnJxeHwTnQ0h14dBOwV8OH3k
	qy034Jx48vw3W8HlJXac7APz+zugqHopaCQ/ouiT17EPdLusR1iWP9x6bHcPE2Er
	r4YTUhSr1QIXGymm5hPzK4uuceFsjXXqZoE4sL0IqptJDlUGAVRWhmgxU7/wvoww
	6vU669ngg+/I5ES7R1K/wuLlg7KqxwdoVYx6wkdaqnCvPrzUa743/MNz6LRepZbj
	UnJUAAq4frxVla9kja8qhoiWjdaysrBf17ZaaGZlFg1MUGm+QIGiALPohYgaAk/1
	fBjWaA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt799udd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 15:50:04 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7eb60cfd476so8067170a34.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784735404; x=1785340204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GbqcNI8dt1vpQMoaCvwlRwERMOsFbBVZz2c2G64BAtU=;
        b=Kmh/fcpCYWsscFzjR2F8Cf9V3etW6Y9ZpuvZY1/yk0WykoqeUdIjDU3A1Wy8BO4KD9
         JeikkDFQjZI6CH5r6sAewqjLLG0qFp0Dj7rSZbEfuf378pS1q5cGJVIZWe63rlE37Qu/
         DFiHisCEGxqMjtvjDf2pgdGBSqiBq9ObqmXDG771q+iRGT48BLcc5wWW+MtqzTilICFY
         Y5BzKxPyxgbjhPeylmKtL3Kgil3XBAVmK5PTLNhcxCdzpZHzvPrP72XwYy9Ks6e55km0
         elAtHk13MNgDKWiIcHE7fkxTF3drJcDQb7wX/lkPyM4YNr10topllxs4xorxv9RB24Oz
         X10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784735404; x=1785340204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbqcNI8dt1vpQMoaCvwlRwERMOsFbBVZz2c2G64BAtU=;
        b=mVFNqe0/iECeavxyQiKq6GNXL9XpOR223gCmVKYphXykDTAe1P9KjuZUSiawUaKJqW
         Jwn7jElDR+Gh9v17fNEJZ4BAOpLxoY1EVGml6WoPNj4L2j9F3WSYQs5Gv9NLRNf8xaaF
         XCKB7fcjinFe8pOYiBc/dXL3hQbpqvQI4pmH6VF4Mv5l7+o6NFpJCEJFq/YCZxObRkaZ
         kgACCAmYzUlfvIbbu5RUVeI+T3X5mUzMZOUwP61hbOST7BM5+8Un61DbqBh3XdHy3GO2
         Uy1ltFDB3oVNuqPI0VjSSRSw+VDj9dXwaSMSw8Rv6xOcty1msxWZNRpvUGYc3qtVf1HM
         D+5w==
X-Gm-Message-State: AOJu0Yx2QdHrYjQLsa6ukCWkb1T5Or1MC2iLUyIVUh0Pqt3RDSSvEIb6
	JhiGu3pAA+QIsyvw+XKA8BEhgCD2DW03zzhLREiXgkcMDc5S8IxhhNQZkgKIm0uEnUovlXu8OYF
	wDk2Ptc6EyqqWADaUM77/coTLQrJj0fNI6LR3G9V2BkuHt9bjad6PsPIE4rV5Iys6q90f
X-Gm-Gg: AR+sD10IzDAdmAZN5QsNV9ubH9F2Vh7nFp5Hu7CG6xc39GdBxOWhbOsbQEEPCGLT2gi
	QxkY7q3USvPXeYTJEDRZ7h7ddVpmOsQsVY25wr1v0n2QY9AjStI4LSKxhP/Vz0ryrGNTVNSH4/h
	rLU6MadzkyYprrkGi0wpfmb7/xHH/DQ3JAAC+LSItpMxKrV36fDoGiu72J5LTIMyGn2MBQ3Yf7p
	sIRoY9Gp7Xll1Fz+KyFxOc+E2tWVOW4JlkroVWjxrqtmXi0zI0uAN+UjDuHUFGr+uvJfPaYGqe4
	FDeu1T8LvWsdTYjtgHVrIMBAqAz0YCIJFbgFN0XrnJ8f+0SJNwvFggTCg+Fgzhe/IMp4XGqR45U
	xXV5ECgOpJMXfTHNH12JN42Luy3XiveADPiyH
X-Received: by 2002:a05:6830:4517:b0:7ed:ceed:95b9 with SMTP id 46e09a7af769-7edceedb831mr7725986a34.32.1784735403967;
        Wed, 22 Jul 2026 08:50:03 -0700 (PDT)
X-Received: by 2002:a05:6830:4517:b0:7ed:ceed:95b9 with SMTP id 46e09a7af769-7edceedb831mr7725959a34.32.1784735403410;
        Wed, 22 Jul 2026 08:50:03 -0700 (PDT)
Received: from [192.168.1.9] ([205.254.168.131])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee39e9e9d1sm625072a34.16.2026.07.22.08.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 08:50:02 -0700 (PDT)
Message-ID: <7bc2cdf2-d253-4651-8b13-bac1fd7a3ff8@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 21:19:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
To: Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)"
 <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260721-iommu_contig_hint-v2-1-90c731a41163@oss.qualcomm.com>
 <135476af-6f4b-49d5-9727-af77465a79b9@arm.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <135476af-6f4b-49d5-9727-af77465a79b9@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60e6ac cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=FJCQGTV+dYaoHdG4tXisQw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=tA7aZXjiAAAA:8 a=JfrnYn6hAAAA:8 a=m64s7x1Ciy94TSEWIWgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=kIIFJ0VLUOy1gFZzwZHL:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: fErfd9teQ-gzaELwd3q264QG0yYu9yAc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE1NSBTYWx0ZWRfXyDsOF7wacGUi
 ULM36T5uWME/kjtOOOdI9brzr/Y58dzp5d/2SHuNQIgk1u3OD6CvFqwgPHSVLNe3vfhFkiDJAbd
 nHlmN3vFS8zkTGHcJsskgbeq38LOcwqCgWUV160GAnT9Qw+QmSky/hoQNjZbZOuUpJ4xgKmIxNm
 U+sM6//dhrWEA02k8KM6v8Z70nwXkl8yOT5RJ7cDSlgdPvJ0P9mb3haJsgehtQFP9xCHRfr3m02
 eU5U3V/0Jj+EqFtQnm2mw0rmnPdA/L6KTTABjmuJbqMS50jHmsfZQVzhdVNCHn+wnjU+xw3dq9M
 Ui9OjuPENUaHGQXgkNhrszX9MVyFcYaa5bn2l3SyX8eIwCWsH97LGtc6SDVsQYDmd3sCGyDoeOG
 Kz2lu/+dKjZpbxs5jTw24Y5trzl6XL6DTYDK/KXmOqxnfjv6n25vWjofpvXkRvq4wKeKKUleCat
 zUwi3lxYXrvGRxzu8rQ==
X-Proofpoint-GUID: fErfd9teQ-gzaELwd3q264QG0yYu9yAc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE1NSBTYWx0ZWRfXyTx4bh3EDeKu
 GP2CAq/IM80vgfBxR1JaGHkkoboK2gfNIqYyekna4i7hPG+GUYfJAW2+JOPeqvHHwCLgNwJbtrJ
 Rzd9cjqlkq7ik0IbX/6wbUhDLs3gYGM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220155



On 7/21/2026 10:21 PM, Robin Murphy wrote:
> On 21/07/2026 4:28 am, Vijayanand Jitta wrote:
>> From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>>
>> Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
>> When a set of consecutive PTEs map a naturally-aligned contiguous block
>> of memory, the CONT bit can be set on all entries in the group to allow
>> the hardware to combine them into a single TLB entry, improving TLB
>> utilization.
>>
>> The contiguous hint sizes per granule are:
>>
>>    Page Size | CONT PTE |  Block  | CONT Block | L1 Block | CONT L1
>>    ----------+----------+---------+------------+----------+---------
>>        4K    |   64K    |   2M    |    32M     |    1G    |   16G
>>       16K    |    2M    |  32M    |     1G     |          |
>>       64K    |    2M    | 512M    |    16G     |          |
>>
>> Contiguous hint sizes are advertised in pgsize_bitmap so that IOMMU API
>> users can align allocations to these sizes and benefit from the TLB
>> optimization automatically.
>>
>> Partial unmaps of a contiguous group are rejected, ensuring the full
>> group is always invalidated as a unit. The
>> IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT quirk allows SMMU drivers to disable
>> contiguous hint support at runtime for hardware with
>> implementation-specific errata.
>>
>> Co-developed-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Extend contiguous hint support to level-1 (1G) blocks for the 4K granule,
>>    adding a CONT L1 (16G) grouping alongside the existing CONT PTE/CONT Block
>>    sizes.
>> - Replace the compile-time CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT Kconfig option
>>    with a runtime quirk, IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT, so SMMU drivers
>>    can opt out per page table instance instead of at build time.
>> - Simplify __arm_lpae_map() to program the CONT-sized block directly via
>>    arm_lpae_init_pte() instead of recursing into the next level with an
>>    adjusted pgcount.
>> - Reject unmaps that are not aligned to the contiguous group size with
>>    WARN_ON_ONCE(), instead of clearing the CONT bit on a partial group before
>>    invalidation.
>> - Link to v1: https://patch.msgid.link/20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com
>>
>> To: Will Deacon <will@kernel.org>
>> To: Robin Murphy <robin.murphy@arm.com>
>> To: "Joerg Roedel (AMD)" <joro@8bytes.org>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: iommu@lists.linux.dev
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>   drivers/iommu/io-pgtable-arm.c | 167 +++++++++++++++++++++++++++++++++++++++--
>>   include/linux/io-pgtable.h     |   3 +
>>   2 files changed, 162 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
>> index 476c0e25631af..241efa37f8631 100644
>> --- a/drivers/iommu/io-pgtable-arm.c
>> +++ b/drivers/iommu/io-pgtable-arm.c
>> @@ -86,6 +86,21 @@
>>   /* Software bit for solving coherency races */
>>   #define ARM_LPAE_PTE_SW_SYNC        (((arm_lpae_iopte)1) << 55)
>>   +/* PTE Contiguous Bit */
>> +#define ARM_LPAE_PTE_CONT        (((arm_lpae_iopte)1) << 52)
>> +
>> +/*
>> + * CONTIG HINT SUPPORT TABLE
>> + *
>> + *------------------------------------------------------------------
>> + *| Page Size | CONT PTE |  Block  | CONT Block | L1 Block | CONT L1 |
>> + *------------------------------------------------------------------
>> + *|     4K    |   64K    |   2M    |    32M     |    1G    |   16G   |
>> + *|    16K    |    2M    |  32M    |     1G     |          |         |
>> + *|    64K    |    2M    | 512M    |    16G     |          |         |
>> + *------------------------------------------------------------------
>> + */
>> +
>>   /* Stage-1 PTE */
>>   #define ARM_LPAE_PTE_AP_UNPRIV        (((arm_lpae_iopte)1) << 6)
>>   #define ARM_LPAE_PTE_AP_RDONLY_BIT    7
>> @@ -453,6 +468,112 @@ static arm_lpae_iopte arm_lpae_install_table(arm_lpae_iopte *table,
>>       return old;
>>   }
>>   +static inline bool arm_lpae_cont_hint_enabled(struct io_pgtable_cfg *cfg)
>> +{
>> +    return !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT);
>> +}
>> +
>> +static inline int arm_lpae_cont_ptes(unsigned long size)
>> +{
>> +    if (size == SZ_4K)
>> +        return 16;
>> +    if (size == SZ_16K)
>> +        return 128;
>> +    if (size == SZ_64K)
>> +        return 32;
>> +    return 1;
>> +}
>> +
>> +static inline unsigned long arm_lpae_cont_pte_size(unsigned long size)
>> +{
>> +    return arm_lpae_cont_ptes(size) * size;
>> +}
>> +
>> +static inline int arm_lpae_cont_blks(unsigned long size)
>> +{
>> +    if (size == SZ_2M)
>> +        return 16;
>> +    if (size == SZ_32M)
>> +        return 32;
>> +    if (size == SZ_512M)
>> +        return 32;
>> +    if (size == SZ_1G)
>> +        return 16;
>> +    return 1;
>> +}
>> +
>> +static inline unsigned long arm_lpae_cont_blk_size(unsigned long size)
>> +{
>> +    return arm_lpae_cont_blks(size) * size;
>> +}
>> +
>> +static unsigned long arm_lpae_get_cont_sizes(struct io_pgtable_cfg *cfg)
>> +{
>> +    unsigned long pg_size, blk_size, cont_sizes;
>> +    int pg_shift, bits_per_level;
>> +
>> +    if (!cfg->pgsize_bitmap || !arm_lpae_cont_hint_enabled(cfg))
>> +        return 0;
>> +
>> +    pg_shift = __ffs(cfg->pgsize_bitmap);
>> +    bits_per_level = pg_shift - ilog2(sizeof(arm_lpae_iopte));
>> +    pg_size = (1UL << pg_shift);
>> +    blk_size = (pg_size << bits_per_level);
>> +
>> +    cont_sizes = arm_lpae_cont_pte_size(pg_size) |
>> +             arm_lpae_cont_blk_size(blk_size);
>> +
>> +    /*
>> +     * Only add the level-1 contiguous block size if level-1 block mappings
>> +     * are supported for this granule. For 16K and 64K granules, level-1
>> +     * block mappings do not exist, so blk_size << bits_per_level would not
>> +     * be in pgsize_bitmap after arm_lpae_restrict_pgsizes() has filtered it.
>> +     * For 4K granule, 1G blocks are supported, giving a 16G contiguous group.
>> +     */
>> +    if (cfg->pgsize_bitmap & (blk_size << bits_per_level))
>> +        cont_sizes |= arm_lpae_cont_blk_size(blk_size << bits_per_level);
>> +
>> +    return cont_sizes;
>> +}
>> +
>> +static u32 arm_lpae_find_num_cont(struct arm_lpae_io_pgtable *data, int lvl)
>> +{
>> +    if (lvl == ARM_LPAE_MAX_LEVELS - 1)
>> +        return arm_lpae_cont_ptes(ARM_LPAE_BLOCK_SIZE(lvl, data));
>> +    else if (lvl >= ARM_LPAE_MAX_LEVELS - 3)
>> +        return arm_lpae_cont_blks(ARM_LPAE_BLOCK_SIZE(lvl, data));
>> +    else
>> +        return 1;
>> +}
> 
Hi Robin,

  Thanks for the detailed review. I have addressed them in v3.
  Link: https://lore.kernel.org/all/20260722-iommu_contig_hint-v3-1-10923a683441@oss.qualcomm.com/

Thanks,
Vijay

> This still seems horribly overcomplicated - the leaf sizes never overlap, and we already have the per-level size to hand in both map and unmap, so I wouldn't imagine needing anything more than e.g.:
> 
> static int arm_lpae_num_cont(size_t size)
> {
>     switch (size) {
>     case SZ_4K:
>     case SZ_2M:
>     case SZ_1G:
>         return 16;
>     case SZ_64K:
>     case SZ_32M:
>     case SZ_512M:
>         return 32;
>     case SZ_16K:
>         return 128;
>     default:
>         return 1;
>     }
> }
> 

Agreed. In v3 I collapsed the multiple helpers into a single
arm_lpae_num_cont(size) helper as you suggested.

>> +
>> +static u32 arm_lpae_check_num_cont(struct arm_lpae_io_pgtable *data, size_t size, int lvl)
>> +{
>> +    int num_cont;
>> +
>> +    num_cont = arm_lpae_find_num_cont(data, lvl);
>> +    if (size == num_cont * ARM_LPAE_BLOCK_SIZE(lvl, data))
>> +        return num_cont;
>> +    else
>> +        return 1;
>> +}
>> +
>> +static bool arm_lpae_pte_is_contiguous_range(struct arm_lpae_io_pgtable *data,
>> +                         unsigned long size,
>> +                         int lvl, u32 *num_cont)
>> +{
>> +    unsigned long block_size;
>> +
>> +    if (!arm_lpae_cont_hint_enabled(&data->iop.cfg)) {
>> +        *num_cont = 1;
>> +        return false;
>> +    }
>> +
>> +    *num_cont = arm_lpae_find_num_cont(data, lvl);
>> +    block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
>> +
>> +    return size == (*num_cont * block_size);
> 
> This can't be right if it's not also accounting for the relative alignment.
> 

Agreed. I removed arm_lpae_pte_is_contiguous_range(). In v3, CONT tagging is
decided per sub-chunk in the map path, and requires both group/index alignment
and paddr alignment.

>> +}
>> +
>>   static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>>                 phys_addr_t paddr, size_t size, size_t pgcount,
>>                 arm_lpae_iopte prot, int lvl, arm_lpae_iopte *ptep,
>> @@ -463,6 +584,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>>       size_t tblsz = ARM_LPAE_GRANULE(data);
>>       struct io_pgtable_cfg *cfg = &data->iop.cfg;
>>       int ret = 0, num_entries, max_entries, map_idx_start;
>> +    u32 num_cont = 1;
>>         /* Find our entry at the current level */
>>       map_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
>> @@ -479,6 +601,22 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>>           return ret;
>>       }
>>   +    if (arm_lpae_pte_is_contiguous_range(data, size, lvl, &num_cont)) {
>> +        size_t ct_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
>> +
>> +        max_entries = arm_lpae_max_entries(map_idx_start, data);
>> +        num_entries = min_t(int, num_cont * pgcount, max_entries);
>> +
>> +        /* Set cont bit */
>> +        prot |= ARM_LPAE_PTE_CONT;
>> +
>> +        ret = arm_lpae_init_pte(data, iova, paddr, prot, lvl,
>> +                    num_entries, ptep);
> 
> This definitely looks wrong - the io-pgtable design already deals with arbitrary ranges of contiguous PTEs (modulo table boundaries); the only change I'd expect to see at this level is a) something like this:
> 
> @@ -462,13 +462,18 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>      size_t block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
>      size_t tblsz = ARM_LPAE_GRANULE(data);
>      struct io_pgtable_cfg *cfg = &data->iop.cfg;
> -    int ret = 0, num_entries, max_entries, map_idx_start;
> +    int ret = 0, num_entries, max_entries, map_idx_start, num_cont;
> 
>      /* Find our entry at the current level */
>      map_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
>      ptep += map_idx_start;
> 
>      /* If we can install a leaf entry at this level, then do so */
> +    num_cont == arm_lpae_num_cont(block_size);
> +    if (size == block_size * num_cont) {
> +        pgcount *= num_cont;
> +        size /= num_cont; //so maybe it wants to be cont_shift?
> +    }
>      if (size == block_size) {
>          max_entries = arm_lpae_max_entries(map_idx_start, data);
>          num_entries = min_t(int, pgcount, max_entries);
> 
> (similarly in the unmap path), and b) a bit of extra logic somewhere between __arm_lpae_map() and arm_lpae_init_pte() to add the explicit CONT bit to prot where PTEs within the given range do cover an aligned multiple of the appropriate number (which may not be the full input range). Duplicating the PTE-setting itself is a big red flag.
> 

Agreed. I removed the separate CONT mapping branch. v3 keeps the normal leaf
path and only adds CONT tagging logic around it (no duplicated PTE programming
flow).

>> +        if (!ret)
>> +            *mapped += num_entries * ct_size;
>> +        return ret;
>> +    }
>> +
>>       /* We can't allocate tables at the final level */
>>       if (WARN_ON(lvl >= ARM_LPAE_MAX_LEVELS - 1))
>>           return -EINVAL;
>> @@ -660,7 +798,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>   {
>>       arm_lpae_iopte pte;
>>       struct io_pgtable *iop = &data->iop;
>> -    int i = 0, num_entries, max_entries, unmap_idx_start;
>> +    int i = 0, num_cont = 1, num_entries, max_entries, unmap_idx_start;
>>         /* Something went horribly wrong and we ran out of page table */
>>       if (WARN_ON(lvl == ARM_LPAE_MAX_LEVELS))
>> @@ -675,9 +813,19 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>       }
>>         /* If the size matches this level, we're in the right place */
>> -    if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
>> +    if (size == ARM_LPAE_BLOCK_SIZE(lvl, data) ||
>> +        (size == arm_lpae_find_num_cont(data, lvl) *
>> +             ARM_LPAE_BLOCK_SIZE(lvl, data))) {
>> +        size_t pte_size;
>> +
>>           max_entries = arm_lpae_max_entries(unmap_idx_start, data);
>> -        num_entries = min_t(int, pgcount, max_entries);
>> +        num_cont = arm_lpae_check_num_cont(data, size, lvl);
>> +        num_entries = min_t(int, num_cont * pgcount, max_entries);
>> +        pte_size = size / num_cont;
>> +
>> +        if (num_cont > 1 &&
>> +            WARN_ON_ONCE(!IS_ALIGNED(iova, size)))
>> +            return 0;
> 
> So if someone does iommu_map(iova=0x1000,size=0x10000), then legitimately tries to unmap it again, they get yelled at? That's rather unfair...
> 
 
Agreed. v3 removes the size-only alignment WARN in unmap.

> Since iommu_unmap() also permits unmapping a range formed by multiple adjacent iommu_map() calls, we can't infer much from the given page size either - the only thing we could reasonably try to warn about here is when we look at the PTEs we're clearing, if we see CONT set at the start (or end) of a range when that is not at a suitably-aligned offset.

Implemented in v3. Unmap now checks actual PTE CONT state and only rejects when
the start/end of the requested range would split a live CONT group.

>     >           /* Find and handle non-leaf entries */
>>           for (i = 0; i < num_entries; i++) {
>> @@ -691,7 +839,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>                   __arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
>>                     /* Also flush any partial walks */
>> -                io_pgtable_tlb_flush_walk(iop, iova + i * size, size,
>> +                io_pgtable_tlb_flush_walk(iop, iova + i * pte_size, pte_size,
>>                                 ARM_LPAE_GRANULE(data));
>>                   __arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));
>>               }
>> @@ -702,9 +850,9 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>             if (gather && !iommu_iotlb_gather_queued(gather))
>>               for (int j = 0; j < i; j++)
>> -                io_pgtable_tlb_add_page(iop, gather, iova + j * size, size);
>> +                io_pgtable_tlb_add_page(iop, gather, iova + j * pte_size, pte_size);
>>   -        return i * size;
>> +        return i * pte_size;
>>       } else if (iopte_leaf(pte, lvl, iop->fmt)) {
>>           WARN_ONCE(true, "Unmap of a partial large IOPTE is not allowed");
>>           return 0;
>> @@ -943,6 +1091,7 @@ static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
>>       }
>>         cfg->pgsize_bitmap &= page_sizes;
>> +    cfg->pgsize_bitmap |= arm_lpae_get_cont_sizes(cfg);
>>       cfg->ias = min(cfg->ias, max_addr_bits);
>>       cfg->oas = min(cfg->oas, max_addr_bits);
>>   }
>> @@ -1001,7 +1150,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>>                   IO_PGTABLE_QUIRK_ARM_TTBR1 |
>>                   IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
>>                   IO_PGTABLE_QUIRK_ARM_HD |
>> -                IO_PGTABLE_QUIRK_NO_WARN))
>> +                IO_PGTABLE_QUIRK_NO_WARN |
>> +                IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT))
>>           return NULL;
>>         data = arm_lpae_alloc_pgtable(cfg);
>> @@ -1103,7 +1253,8 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
>>       typeof(&cfg->arm_lpae_s2_cfg.vtcr) vtcr = &cfg->arm_lpae_s2_cfg.vtcr;
>>         if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB |
>> -                IO_PGTABLE_QUIRK_NO_WARN))
>> +                IO_PGTABLE_QUIRK_NO_WARN |
>> +                IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT))
>>           return NULL;
>>         data = arm_lpae_alloc_pgtable(cfg);
>> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
>> index e19872e37e067..7b2097aaffb09 100644
>> --- a/include/linux/io-pgtable.h
>> +++ b/include/linux/io-pgtable.h
>> @@ -86,6 +86,8 @@ struct io_pgtable_cfg {
>>        *
>>        * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pagetable.
>>        * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttrs bits
>> +     * IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT: Disable use of the contiguous
>> +     *    hint for hardware affected by implementation-specific errata.
>>        *
>>        * IO_PGTABLE_QUIRK_NO_WARN: Do not WARN_ON() on conflicting
>>        *    mappings, but silently return -EEXISTS.  Normally an attempt
>> @@ -103,6 +105,7 @@ struct io_pgtable_cfg {
>>       #define IO_PGTABLE_QUIRK_ARM_HD            BIT(7)
>>       #define IO_PGTABLE_QUIRK_ARM_S2FWB        BIT(8)
>>       #define IO_PGTABLE_QUIRK_NO_WARN        BIT(9)
>> +    #define IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT    BIT(10)
> 
> This should perhaps be an opt-in rather than an opt-out, but either way it should not result in ARM_MALI_LPAE being given extra page sizes that that format does not have.
> 
> Thanks,
> Robin.
> 

Fixed ARM_MALI_LPAE behavior by setting IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT
internally, so CONT-derived sizes are never advertised for a format that
does not support CONT.

For ARM LPAE generally, I kept CONT as opt-out intentionally, so platforms
can benefit from the CONT hint by default, while implementations with known
errata can disable it via quirk.

That said, if you prefer an opt-in model, I can switch this in v4.

Thanks,
Vijay>>       unsigned long            quirks;
>>       unsigned long            pgsize_bitmap;
>>       unsigned int            ias;
>>
>> ---
>> base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
>> change-id: 20260618-iommu_contig_hint-71ae491fbb52
>>
>> Best regards,
>> -- 
>> Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>>
> 

