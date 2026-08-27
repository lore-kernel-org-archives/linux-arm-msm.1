Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ABC314A6F
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 05:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787810133; cv=none; b=A5GMExNG7Kep4Cj+wDP6tWonoYy6KD2g+IhEbU9TQfGXZE3iqTt3z4UWQHZ6i6wunk88vqNPM2lPFQX8OrBPVo51PaMNmytWj1mN/H3Vx0DUwWUHatYLSogQq5pTzAivJhRWymIHys6Ne5CWR6IUMdn3G9USpXgGt32SYybswTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787810133; c=relaxed/simple;
	bh=hPMuyywoVecl8ax2KcK5SPpsS7pAlk7mB4FHSFpJk6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SAlBga/k2D2p6wqpEqGQ8uP28gUSkcQsd4+C7QTieQPYa4D2Gr3yR9b5Ys+BZC/WskCRRrlv0DrvyTwM19ySqOAEieyqjM32dgWyAIukPQnvSIUi/wa9TWeaw1W2Nipenzcq+0+UrT0eL8oPwwqOJkBT4fTe09LWk4WI7DtI/vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cv1Q9mLx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kejDy50V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cv1Q9mLx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kejDy50V"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R3J4oP2851107
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 05:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9KwtqjdHygA+JfB7KLbWaNqlpDVgF/I0UutfMHntlA=; b=Cv1Q9mLxWzu4kkmi
	pojw3wJuTKcBQU5/brnmhfMjXRBQQ2UzSk0XLb5fzssGnUQzae/brdDrsb2S2Bix
	hBqOwlwd36CMbh5aV5SUjinaDLe8AxjXmDccvSUk1+sXvproKpqaxOSN7K4didVZ
	TrW5KNcsHenQWr2suhF5nLgMXI3PpOYhSjNpnwVfKC33S2TE0U3K9OCINcd2Ma0O
	JmtW5Vz+fSdBKVhWleTO4Ns7iwfXSGviWgF6PMaaspspdLaVSp+IW45k6QXeYcTi
	Y691rCLDaAviGRACwt6LslSFusMC90FMd/D7w5P1D2OX4HeLqOf8DYHBKrhuSNGV
	sDKkXQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4eca6bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 05:55:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso3135211a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 22:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787810129; x=1788414929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9KwtqjdHygA+JfB7KLbWaNqlpDVgF/I0UutfMHntlA=;
        b=kejDy50V7d7ZxipPtxk51ExLxy2msywQE97bBcDXc7C9iufkTFSzSDYaI6tq7+NewB
         bc0t/ibjhxasdMvVbcwVuiw5vDiFV+UkLcAVsKGxGpVAY5aSdLNMGLwbU22Yk9lzl+PP
         xv8+a76nKepTNGHvuLSPVfIqrOZ+YZHk8+iCeB+dCBJKILAQaYjafPkFhICH8tfsfXhG
         S8LVn5w/1AGs1uFq0C3YAHQxwmvu/BAccyNNt9DInOhx0PNMs017bRSWpK5gHXris7Wl
         9sjtLcYvtRCXJtsMbYNiG16o+qqeKIzRq6/qyk3HXidWGJgDbjy8EnpIhgVkunrfz4tE
         bicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787810129; x=1788414929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9KwtqjdHygA+JfB7KLbWaNqlpDVgF/I0UutfMHntlA=;
        b=bDmySyMRTBXn5EjhX5mOFRCajtHqUyaVkIEo/gGb8hDe3U6IIIDZe8D6UEQ/y6YrOc
         uNtzQV9tOO6o5JGlmWLY9SLJ8xzSOHBORVxbjQrFrgaDHjNlbgHd8n9Ak9LpD60JvHEZ
         DMvhQchFtZ5jyxg7DT+EFTLzFOy+Gu3zFdxUC6tk3t6bc/ny0qaSJpn0hFyUZw6gW2xn
         Uyd4HRUNrcuXOLziR3fWfdcNeJtcjirFrtYWD1luIJIOIMugQ9LUnfb6VhdB/PMrHLjr
         RPyY4O+OyNwnZf5upIJk7p8Ogq6M69MncLtlGLoQH5q32Xt+CHmM33lgquXFokrisv0K
         WvEg==
X-Forwarded-Encrypted: i=1; AHgh+RpjBbkgJNQl3+uCP/bCXq0o7MVUGUfUttARSGkN28n2vUdo+TX0/f1y81839WGwOgTv6hxkxwxFADyXKmMG@vger.kernel.org
X-Gm-Message-State: AFuF++lV6EkslcXmXhcjrLKtXnf87ojFnB/1fVIQ3DECBshg5kGFZaWK
	0M6YGq8EruE7QZoxtEinrEefy2HOkiNnmXn7GOpXoVGvwff9sdbSK2mQrwqo28s9X80k+OTVzoi
	zg6/1OQIyRYWBsG3DaloPeObKnoUQXv+JBL4LfckInSlSnwkflNiqMGknpxMl1849TSaf6C3FCo
	rj
X-Gm-Gg: AR+sD11vDBUoVWMeAIdLTolKvwU//gwImvIB5Hqh3itNHG462yhpAMFskh88X27AYSe
	InviEhski6mS+xpxQ7bRYS6ZNDYW2dlatbQ9CzpKNzg2tfpy7v3dyeu2GvTdWXcULYSGDgoXmnY
	JyjqyAkhGsK1qxsL2Pasw1X7sxPF4qnlSd5g/RcVKmtxyci7bzezyLs3Bpn7xN950NfnCN77JRc
	AQwnfH3cYgOaeRDu3QfurEROo92WLO+7btK84B0Mm56/SagTCPyfJiQLuHvLcobOiVrwQjpWmzw
	jFx1jOdcZirxKU092biqqxmRJz9sF2st3W7oTL9zRDfVdfxadb1PpkeaSSmECTrKcNi3rCyL63C
	x58vzOvMbOskQU+IaD6DO7IwiBgM7a3IeTQ==
X-Received: by 2002:a17:90b:586d:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-3966d491c45mr26906383a91.16.1787810129206;
        Wed, 26 Aug 2026 22:55:29 -0700 (PDT)
X-Received: by 2002:a17:90b:586d:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-3966d491c45mr26905985a91.16.1787810128348;
        Wed, 26 Aug 2026 22:55:28 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm22588440c88.5.2026.08.26.22.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 22:55:27 -0700 (PDT)
Message-ID: <9c28300b-a17f-4324-b9d5-8fc800e4d794@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 11:24:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
To: Daniel Mentz <danielmentz@google.com>
Cc: Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
 <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com>
 <c84e61b1-785e-4a47-9082-c5111bf35fd4@oss.qualcomm.com>
 <CAE2F3rC80=ZpiHVtmRDU6f8g4AwV_RrJ-Zqr0Xi7zbUc0fsQog@mail.gmail.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <CAE2F3rC80=ZpiHVtmRDU6f8g4AwV_RrJ-Zqr0Xi7zbUc0fsQog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KIBqylFo c=1 sm=1 tr=0 ts=6a8fd152 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CZE9kkL2blzp5uFjx4sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: mTv17uRCQAniu_CPZ5Mj0t42votRc-A9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA0NyBTYWx0ZWRfX87BBV9EcKZ+a
 u184zxBm4QuvqMPQyXHg94GV/Qorp4dTmkPfw7nqOctYjOXk1fg++Z83fWhRrcBHqenE8QYRV4e
 mJjJQEuISxyYhbXZhoX9XKWJ2+UUutQm8hrKVoDRkGrJUyP+224oCl9/j1QEXaOAG0qUVbE8TDN
 oOrtWIGla6Z92HVsd3fbLUyDzLb7hm1bJTSvPQJzws1iJOau8VpaxpE7EXuc/h+Maez50hb1UCk
 kgX3Orkb5N1DL9mQTaS9uJmZMze0jLvo3ZmFc4RUkyS9j0lBsF2tMmys+lnwC2zyET2VIULfqc8
 9trpGaBbfO0TgevIz6UHlQkfmn8fLiYdzXyH+VgWWTQDXvM7ppBsjMHpVPXopDCGHdgBpb2zvgA
 0XrQl3UCufF0r6GmaY4UkrAAamPcfWeLD/o3cAoa5xp3eHuTgwydnRiqeWloAlzVK9oC6Tf+fq3
 h2zi26zh5UGyiSi+KbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA0NyBTYWx0ZWRfX+88uAAp2LsZ5
 BJrzMclHlP3ImKVaW0jM3HuSFzjCuMj4KAVU27S0SG3mi24d/reljVPQ2puvVBJF95M5VxkSdhr
 mT4hWzf65P4M17hgykvSh53ouj6oWN0=
X-Proofpoint-GUID: mTv17uRCQAniu_CPZ5Mj0t42votRc-A9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_02,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270047



On 8/15/2026 2:15 AM, Daniel Mentz wrote:
> On Thu, Aug 13, 2026 at 11:13 PM Vijayanand Jitta
> <vijayanand.jitta@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 8/11/2026 10:34 AM, Daniel Mentz wrote:
>>> On Mon, Aug 3, 2026 at 11:19 PM Vijayanand Jitta
>>> <vijayanand.jitta@oss.qualcomm.com> wrote:
>>>> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
>>>> index 476c0e25631af..23a238de53ed5 100644
>>>> --- a/drivers/iommu/io-pgtable-arm.c
>>>> +++ b/drivers/iommu/io-pgtable-arm.c
>>>> [...]
>>>> +static unsigned long arm_lpae_get_cont_sizes(struct io_pgtable_cfg *cfg)
> 
> I'm wondering if we need this function at all. I'm trying to
> understand that would happen if we advertise page sizes that cannot
> possibly be used given the constraints imposed by cfg->ias and
> cfg->oas.
> arm_lpae_read_and_clear_dirty() appears to check if the end of the
> iova range is out-of-bounds (WARN_ON((iova + size - 1) &
> ~(BIT(cfg->ias) - 1))), but function arm_lpae_map_pages() appears to
> not have such a check.
> 
> If we need to restrict the "cont sizes", we could consider Will's
> suggestion: Add all the sizes to cfg->pgsize_bitmap in
> arm_lpae_restrict_pgsizes, and then subsequently clamp it like so
> 
> cfg->pgsize_bitmap &= (BIT(cfg->ias) - 1))
> cfg->pgsize_bitmap &= (BIT(cfg->oas) - 1))
> 
> That would be shorter than the 39-line arm_lpae_get_cont_sizes function.
> 

Agree , I think both arm_lpae_get_cont_sizes and arm_lpae_cont_size_fits can
be removed.

Instead I'll add something like below to arm_lpae_restrict_pgsizes as suggested.

+ if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT)) {
+        unsigned long sizes = cfg->pgsize_bitmap;
+
+        while (sizes) {
+                unsigned long size = BIT(__ffs(sizes));
+
+                cfg->pgsize_bitmap |= arm_lpae_num_cont(size) * size;
+                sizes &= ~size;
+        }
+  }

  cfg->ias = min(cfg->ias, max_addr_bits);
  cfg->oas = min(cfg->oas, max_addr_bits);

+ cfg->pgsize_bitmap &= (BIT(cfg->ias) - 1);
+ cfg->pgsize_bitmap &= (BIT(cfg->oas) - 1);

>>>> +/*
>>>> + * Install num_entries leaf entries starting at ptep (index map_idx_start
>>>> + * within the current table), tagging arm_lpae_num_cont()-sized groups with
>>>> + * the contiguous hint where both idx and paddr are aligned to the group
>>>> + * size. Entries in a misaligned group are installed without the hint.
>>>> + *
>>>> + * idx and paddr both advance by block_size per entry, so their alignment
>>>> + * relative to the group size is invariant across a run of entries within
>>>> + * this call: once a group qualifies (or fails to), every later whole group
>>>> + * does too, up to num_entries. This merges each such run into a single
>>>> + * arm_lpae_init_pte() call instead of one call per group.
>>>> + */
>>>
>>> Can you provide an example for when this function installs descriptors
>>> where the contiguous bit is only set on a subset of them. I would
>>> assume that the contiguous bit is either set for all descriptors or
>>> none of them.
>>>
>>
>> That assumption doesn't hold in general -- it's only true when the
>> map request happens to start and end on a cont_size boundary. For an
>> arbitrary map_pages() call it usually doesn't.
> 
> I believe you won't see arbitrary map_pages() calls. I understand that
> these calls are exclusively coming from __iommu_map_domain_pgtbl()
> which uses iommu_pgsize() to determine optimal page sizes.
> 
>> Example, 4K granule (num_cont = 16, cont_size = 64K),
>> iova = paddr = 0x1000, pgcount = 34:
>>
>>    - idx 1..15  (off != 0, misaligned prefix):        installed plain
>>    - idx 16..31 (off == 0, paddr now 64K-aligned):     installed w/ CONT
>>    - idx 32..34 (off == 0, remaining < num_cont):      installed plain
> 
> In the example you provided, I expect that you'll receive three
> separate calls from __iommu_map_domain_pgtbl:
>  * idx 1..15 with pgsize 4KB
>  * one call with pgsize 64KB
>  * idx 32..34 with pgsize 4KB
> 
> If I took your argument further, I could argue that we'd also have to
> check if we can put down a block mapping if iova = paddr = 0x0 and
> pgcount = 512, but we're not doing that either.
> 
> Could you provide the input parameters to the iommu_map() call that
> resulted in the parameters you provided i.e. iova = paddr = 0x1000,
> pgcount = 34:
> 

You're right -- for the iommu_map()/__iommu_map_domain_pgtbl() path, iommu_pgsize()
already splits the request at the boundaries you describe before install_leaf() ever
sees it, so install_leaf() doesn't need to handle a mixed prefix/CONT-group/suffix
chunk for that caller.

That said, install_leaf() is shared by other callers that reach it through
ops->map_pages() directly, without going through iommu_pgsize(). panthor_vm_map_pages()
(drivers/gpu/drm/panthor/panthor_mmu.c) is one -- it allocates its io_pgtable_ops via
alloc_io_pgtable_ops(ARM_64_LPAE_S1, ...), same as any other LPAE consumer, but does its
own chunking with a local get_pgsize() that only ever returns SZ_4K or SZ_2M, with no
notion of the 64K/32M CONT boundaries. That can hand install_leaf() exactly the mixed
iova=paddr=0x1000, pgcount=34 shape in a single call (panfrost's map loop uses the same
get_pgsize() and hits the same case). So the prefix/aligned-group/suffix handling in
install_leaf() is still needed for that path.


>>
>> One arm_lpae_install_leaf() call, three chunks, CONT set on only the
>> middle one.
>>
>>>> +static int arm_lpae_install_leaf(struct arm_lpae_io_pgtable *data,
>>>> +                                unsigned long iova, phys_addr_t paddr,
>>>> +                                arm_lpae_iopte prot, int lvl,
>>>> +                                int map_idx_start, int num_entries, int num_cont,
>>>> +                                arm_lpae_iopte *ptep, size_t *mapped)
>>>> +{
>>>> +       size_t block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
>>>> +       size_t cont_size = num_cont * block_size;
>>>> +       int done = 0;
>>>> +
>>>> +       while (done < num_entries) {
>>>> +               int idx = map_idx_start + done;
>>>> +               int remaining = num_entries - done;
>>>> +               int off = idx % num_cont;
>>>> +               arm_lpae_iopte pte = prot;
>>>> +               int chunk, ret;
>>>> +
>>>> +               if (off) {
>>>> +                       /* Misaligned prefix: advance to the next boundary */
>>>> +                       chunk = min_t(int, num_cont - off, remaining);
>>>> +               } else if (remaining >= num_cont && IS_ALIGNED(paddr, cont_size)) {
>>>> +                       /* Aligned: merge every full group in this run */
>>>> +                       chunk = remaining - remaining % num_cont;
>>>> +                       pte |= ARM_LPAE_PTE_CONT;
>>>> +               } else {
>>>> +                       /*
>>>> +                        * Aligned idx but paddr doesn't line up with cont_size,
>>>> +                        * or too short for a full group. That holds for the
>>>> +                        * rest of this call too, so install the remainder
>>>> +                        * plain in one go.
>>>> +                        */
>>>> +                       chunk = remaining;
>>>> +               }
>>>> +
>>>> +               ret = arm_lpae_init_pte(data, iova, paddr, pte, lvl, chunk, ptep);
>>>> +               if (ret)
>>>> +                       return ret;
>>>> +
>>>> +               *mapped += chunk * block_size;
>>>> +               ptep += chunk;
>>>> +               iova += chunk * block_size;
>>>> +               paddr += chunk * block_size;
>>>> +               done += chunk;
>>>> +       }
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>>  static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>>>>                           phys_addr_t paddr, size_t size, size_t pgcount,
>>>>                           arm_lpae_iopte prot, int lvl, arm_lpae_iopte *ptep,
>>>> @@ -462,21 +608,44 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>>>>         size_t block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
>>>>         size_t tblsz = ARM_LPAE_GRANULE(data);
>>>>         struct io_pgtable_cfg *cfg = &data->iop.cfg;
>>>> -       int ret = 0, num_entries, max_entries, map_idx_start;
>>>> +       bool cont_hint_enabled = !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT);
>>>> +       int num_entries, max_entries, map_idx_start;
>>>> +       int num_cont = cont_hint_enabled ? arm_lpae_num_cont(block_size) : 1;
>>>> +       bool use_cont = cont_hint_enabled && num_cont > 1;
>>>>
>>>>         /* Find our entry at the current level */
>>>>         map_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
>>>>         ptep += map_idx_start;
>>>>
>>>> +       /*
>>>> +        * Normalize an exact whole-CONT-group request down to the
>>>> +        * equivalent block_size/pgcount so it funnels through the same
>>>> +        * leaf path below. arm_lpae_install_leaf() independently decides,
>>>> +        * per sub-chunk, whether the CONT hint actually applies.
>>>> +        */
>>>> +       if (use_cont && size == block_size * num_cont) {
>>>> +               pgcount *= num_cont;
>>>> +               size = block_size;
>>>
>>> This appears to me as if you're throwing away information about
>>> whether this mapping request is suitable for the contiguous bit, and
>>> then in arm_lpae_install_leaf(), you're trying to recover that
>>> information. Can't you just do "prot |=ARM_LPAE_PTE_CONT" here and
>>> then completely avoid the logic in arm_lpae_install_leaf?
>>>
>>
>> That optimization only applies to the exact-whole-group case already
>> handled above (size == block_size * num_cont). A single map_pages()
>> call can also cover the general case shown above, where a misaligned
>> prefix/suffix surrounds one or more aligned groups within the same
>> call. Setting prot |= ARM_LPAE_PTE_CONT unconditionally here would
>> incorrectly tag those misaligned entries with the hint.
> 
> Due to how __iommu_map_domain_pgtbl and iommu_pgsize operate, I don't
> expect to see the prefixes and suffixes that you are describing.
> Instead, I expect we'll see separate calls to __arm_lpae_map(): One
> for the prefix, one for the set of aligned groups and another one for
> the suffix.
> 

Agreed, Replied in above comment.

Thanks,
Vijay>>
>> arm_lpae_install_leaf()'s off/remaining logic is what detects those
>> group boundaries per chunk, so I don't think we can drop it in favor
>> of always setting prot |= CONT at this call site. The size ==
>> block_size * num_cont check here is just a fast path for the common
>> whole-group case, avoiding a walk through install_leaf() for something
>> the caller has already told us.
>>

