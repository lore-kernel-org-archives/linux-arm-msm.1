Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778907;
	b=S3SU9kef1riUovIqb1cU18Qo8GwcbsvAKNb0QL9839bU86+uhEPT9g3ELWrWDpsC20OJ
	 6brEX2B0tfvg20cqeL6clk9ON5QXiUvwT+ZqbDN9yT/z5Qq2JQ2sh5SctP9YDMSl0GOZf
	 vz0vWB7K/XBkiwseT/Mjbm/2yfDry+qfV1ccJuqpHGv51DyZTIYuEgeIuDSSvaGdLu1zy
	 sA54K4yNWex//Ak3j0JNzMmH8e0WVpBkdaGnkhtcNyrKeVquu46qPF+0Nqus1c6V+KWyZ
	 SWMvT4jCzY8mWZE7/SecHJV12vCM6NPS3wZpqT5mKONNDA7yhP0BOCUUi/x3GoGO6Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778907;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=ovwA8C4L2f2YTDkgYeK95d4Xlfyh4rEYZPZ9ijFVL+0=;
	b=Po8rjqw6fF1a3S2X/E6C3GQZvGSF43wZ+DW9IuOgIkisWTaIKoaDCumWk0+w0QHGkSSZ
	 rALY++jaYaQYpxY8BWa25UjFeTwZg+aKdh+JQ0ljvWflkTmCB4xi7s6q/oUgMv1/1yfN8
	 FXbq8jf5vY31s0FqPX9L4G/QIdCc/QdE+DyrWwP0s9gQhXXIJX9qjlqqxmGEYCi5T5y9p
	 efATyRsasNl+UxKvWYKMITe9cQMo/5PjoCXdY+y7B8ol2JCNMcn9nV33SFH7+9GLv2742
	 +ozDQoUyzag2ErAJOGO8WeUJ+F74SepnKJ9IyYdKSalhmiZYVafeO3pQIAmR1Gpps8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=cq3fDY26;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014F6606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 014F6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=cq3fDY26
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261127112818euoutp018a757528edc11ea7581bbfcac0223d3d~r42TUSctE2826128261euoutp01B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:28:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261127112818euoutp018a757528edc11ea7581bbfcac0223d3d~r42TUSctE2826128261euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795778898;
	bh=ovwA8C4L2f2YTDkgYeK95d4Xlfyh4rEYZPZ9ijFVL+0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=cq3fDY26WxdkOtr2wvrAMNHtBdUlvtSuAz4bUreP6VV3Lci1VShvARvL6nwtwMqs1
	 j3mhV6XQD83Cdtc+6/sflyhda+YCsVDSCDMkSJ/Avr5ItBmXMvnXxPYJ1UCHxFlv0y
	 zpnXHX46VJ2oO+cgZtmRYEjuG89BBETW+eYQwx2k=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261127112818eucas1p2c2280bf5baa3d1c424717d498fc5ff10~r42S01KK-1031710317eucas1p20;
	Fri, 27 Nov 2026 11:28:18 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261127112817eusmtip19aa7f07db4b16f85fbf1b4a11fd2fc46~r42R1qFwR2119421194eusmtip1k;
	Fri, 27 Nov 2026 11:28:16 +0000 (GMT)
Message-ID: <c5e4fc4e-0e63-47cf-8b88-93ecfb3646de@samsung.com>
Date: Fri, 27 Nov 2026 12:28:16 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] Revert
 "iommu/dma: simplify dma_iova_destroy() and drop the free_iova helper"
To: Leon Romanovsky <leon@kernel.org>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, will@kernel.org,
	robin.murphy@arm.com, honghuan@amd.com, Jason Gunthorpe <jgg@ziepe.ca>,
	joro@8bytes.org, prakash.gupta@oss.qualcomm.com, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261125183419.GB774860@unreal>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261127112818eucas1p2c2280bf5baa3d1c424717d498fc5ff10
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261125135138eucas1p141ba6b5e09623562e2033e290fba811c
X-EPHeader: CA
X-CMS-RootMailID: 20261125135138eucas1p141ba6b5e09623562e2033e290fba811c
References: <CGME20261125135138eucas1p141ba6b5e09623562e2033e290fba811c@eucas1p1.samsung.com>
	<20261125135120.1126571-1-sibi.sankar@oss.qualcomm.com>
	<a3722347-4b88-41ad-926b-455530020c6b@samsung.com>
	<20261125183419.GB774860@unreal>

On 25.11.2026 19:34, Leon Romanovsky wrote:
> On Wed, Nov 25, 2026 at 06:21:06PM +0100, Marek Szyprowski wrote:
>> On 25.11.2026 14:51, Sibi Sankar wrote:
>>> This reverts commit 1acce29926d93f3eba427696fe3da6451504dae2.
>>>
>>> Before this commit, dma_iova_destroy() unmapped through
>>> __iommu_dma_iova_unlink(..., free_iova=true), which set
>>> iotlb_gather.queued from cookie->fq_domain, skipped iommu_iotlb_sync()
>>> and freed the IOVA with the queued gather, exactly like
>>> __iommu_dma_unmap(). After it, dma_iova_destroy() calls
>>> dma_iova_unlink() and then dma_iova_free():
>>>
>>>   - dma_iova_unlink() never marks its gather as queued and always calls
>>>     iommu_iotlb_sync() after iommu_unmap_fast().
>>>   - dma_iova_free() passes a NULL gather to iommu_dma_free_iova(), so
>>>     the IOVA goes straight back to the allocator through
>>>     free_iova_fast() and never through queue_iova().
>>>
>>> DMA-FQ domains therefore get strict invalidation on this path. That
>>> includes the block layer's blk_rq_dma_map() path, which NVMe uses for
>>> all data transfers, so iommu.strict=0 has no effect on NVMe I/O.
>>>
>>> hw/sw details: Qualcomm Glymur CRD: SMMUv3 with no RANGE_INV,
>>> 	       4K pages; NVMe SSD on PCIe Gen5 x4
>>>
>>> Fio sequential read/write numbers:
>>>   Domain                          seq write    seq read
>>>   DMA (strict)                    2694 MiB/s   2693 MiB/s
>>>   DMA-FQ (lazy), flush queue      2707 MiB/s   2803 MiB/s
>>>     bypassed (this regression)
>>>   DMA-FQ (lazy), flush queue      10.6 GiB/s   11.9 GiB/s
>>>     used by dma_iova_destroy()
>>>
>>> Fixes: 1acce29926d9 ("iommu/dma: simplify dma_iova_destroy() and drop the free_iova helper")
>>> Cc: stable@vger.kernel.org # v7.3+
>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>
>> The performance data clearly shows that the flush queue was there for
>> the reason. Together with this revert it would probably make sense to
>> apply the v1 of the reverted patch:
>>
>> https://lore.kernel.org/all/20260701092033.422867-1-honghuan@amd.com/
>>
>> Leon, do You see any other option?
> These numbers shows clearly that we had iotlb_gather.queued != 0
> and never performed iommu_iotlb_sync(domain, &iotlb_gather); while
> destroying mapped IOVA.
>
> I agree with you, v1 is the easiest solution, however my preferred one
> is to cache gather when it is created and keep it in dma_iova_state 
> structure for whole life cycle of that struct.

I've played with the code (using LLM ;) and there are some issues with this
approach:

1. tso_dma_map_completion_save() copies the struct dma_iova_state by value,
what breaks internals of the struct iommu_iotlb_gather.
2. adding iommu_iotlb_gather to dma_iova_state increase the struct size
from 16 to 64 bytes, what lands in every NVMe request, RDMA rw contexts,
TSO maps and HMM.

I've decided to put only the 'use_fq' bit in the __size entry and baked the
fix. It looks quite nice. This approach solves both above issues, although
it requires to also fix some drivers which already pokes __size directly
instead of calling dma_iova_size().

I will post this in a few minutes.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

