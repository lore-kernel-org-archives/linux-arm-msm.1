Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA8338D006
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 05:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573959; cv=none; b=TRbWXKOWHhYAvGJ2ZOp3Ps1pXTSxXo/4oeMLo9XM887zUwTmUPWi8DP8/+2IL1wrNk3u1BSeqwbAPqsrAYoXPhfslN3pa4NpjTG8+7y0fgD/alsIAqs5LHQ7C4eizln3vdE5gPo0ouetp8I4ZTDCy4l3UaTa0mI3WgtKerA3Vnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573959; c=relaxed/simple;
	bh=PAtF/PNKxtMzgWanGm0UJ8I09oPtXYVfYF1UgrzHWr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NQdtfpmV/iKWw5yYgtBwOcZyFRV8CzBEZWFOlk678rlcTHRwoHy9mO+204PqX6Yu5j1XRCOaHT/LLc0xreXxf+4gqLQbpp9wQEZL5S6WZ6LVh/9zATqzDdIl39WmzTtJ8XvuSep4uBjMN9ybu6X/Bg9sQv2D+9JvfWEt8mImoh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgSu7xmI; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgSu7xmI"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-86323e4853aso71009b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 22:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790573950; x=1791178750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1GfyXNzZ7U9i0Z+Tk5I9ck9dnyRvvtvnuEFHqewoGY=;
        b=AgSu7xmIqIAlSTHT3IA2u9M9XUCC9OEnJ8npB/mFKwI0Lzj+ZQ0qUnAadbkRFreDDN
         tO2AA6dbpjBA5ns3agePT+anxLq8/WNWigA1GmyNU8084R2V7XxlSgJ5wA9uMOLpZRDY
         g71IggMSls3XTU/Br8HzMbsC/yysvuMQ2pGu1REcQltdx4IkoC1HShVsZORjfcF27I6T
         qDCMjWy/HMoSScEv98NIsLpQS2F0BFVd/ZwlloHBFMUfncdGvZDl8wwibXAWcQnzPns+
         TeZNSF4cCNNznjmGJzis11ALp2K3Yqwr5bkarlbDSlqcR9fN2NvgaTdLeLsrGteJYhMT
         UeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790573950; x=1791178750;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e1GfyXNzZ7U9i0Z+Tk5I9ck9dnyRvvtvnuEFHqewoGY=;
        b=EJLuwbeQBqPI1J66z5fm/n/JcVmvSPAxVQQYGzo/3GcYh/7mhq/cy8D2PiPjy9yqIG
         UDgEvfVOeNTxG+i5I/tO9fGhMdCj6e3MxpxGZqsFmt+vTda24/aTqAwBgvkJEwkPBXHS
         BbxkSux2k8ubsOa+KfNP19MRbfLRGCSB9ov+rD4eOs5YLzRELKMyJm6KJLSme+KYG/Qu
         1R/h1czvdBEA1zdzCuxlBThdR88fkbTm/ARI0NnzzPW2Y54A6ANL33jzmnvprssF6SnB
         oj8O32r/iUa9iuH2MmCC4g08hWvVkR7H9fpkkrxOZEkS+c7lYempoEcriY404N66UXfu
         B6MQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzjRZ3QViiEGBpMZsR/zS5/rHtvbYfLvSia+mPajuA+gVxIvIhxLwLYha7AxBN/pCPBkmprypTRgUNPLQh@vger.kernel.org
X-Gm-Message-State: AFuF++m1l2PNapb82uITQauSp5HKadFt0H7BUYkUYsaLn/HnOW0Gn9Ub
	iQAhYawxtM+MsoxZOlqbsJepQorAIjFcYkEroHZSePtZopRi520Wbnx/
X-Gm-Gg: AYBFou1jCDeBScg+dzezszn//t/rH0cgxdkT+V5GaXmWNfKiWCxEA+VWg8qFmIFldvg
	UPA49064RfqRZjIUpS+GjfH0I4e3t1bpqGLxODi4cQkseLY4+H0C44VCH22H+B7rQHgfBSszC3r
	Db/wRBodks6tfBrYoKXNKU1iP7Q19ar5REpBmPB5X5x19gDh5JVaREB9o8tibCRtbsWuf0fplok
	1ME8BosbEN18/U47b+U6GLHrESqGv0HK9qHPFghrbc31qSrndePpf8RDkDUzLknfxo4AzJDDjTA
	M07Oh5QT+GQMaUp521VpOLR8BeLL6tqVDoqAH6YghWcu3Me764Hk3Oq64e79TyP3Hffq8sn+Ifo
	qiHhh5lJor7SmFCs/imWYWZWEyvjAexdQaUZoX8CprJSTvBxRtGcEvjP/Nn1WMcl+7dTcj86vJ8
	U5zwQTMfeHU7pIcD2Dn9tY/6Uh9jXohLCCYdIVjMOqouwmHdnMhDPiZlDq5tX0NZBKLL0xLzhst
	/SNNXWotjiYBQ==
X-Received: by 2002:a05:6a00:4807:b0:864:59e2:2968 with SMTP id d2e1a72fcca58-87fd0d8cbc6mr6922416b3a.0.1790573950242;
        Sun, 27 Sep 2026 22:39:10 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87febb82357sm3591121b3a.61.2026.09.27.22.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:39:09 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	freedreno@lists.freedesktop.org,
	iommu@lists.linux.dev,
	Dmitry Baryshkov <lumag@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	Bryan O'Donoghue <bod.linux@nxsw.ie>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v1 0/2] drm/msm: followup - map page-less imported sg_tables
Date: Mon, 28 Sep 2026 13:38:49 +0800
Message-ID: <20260928053901.7270-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Hi Rob,

this is the follow-up I promised: it fixes the two remaining map
paths that still consume struct page/sg->length of imported
sg_tables, and therefore completes the DMABUF_DEBUG=y story when
applied on top of your series [1].

Test results on x1e78100 (Snapdragon X1E78100, DMABUF_DEBUG=y,
kernel v7.3-rc4 based), which is the machine that originally
reported the UCHE translation faults and the one hardware test
environment for imports of buffers not first exported by drm/msm:

 - v7.3-rc4 stock: arm-smmu UCHE translation faults during hardware
   video decode in clapper/chromium (bisected to 143755bdabaa9)

 - your series alone: video plays via the userspace copy fallback,
   zero GPU faults, but a WARN storm from __arm_lpae_unmap()
   (472 traces within a minute of video playback) - every map of a
   page-less sg_table silently maps nothing, so the matching unmap
   finds no PTE and WARNs.  This matches your cover letter saying
   the map paths are not addressed by the series.  Your patch 2
   ("mmap imported dma-bufs via the exporter") in particular works:
   a test importing a linux,cma-heap buffer via
   DRM_IOCTL_PRIME_FD_TO_HANDLE and mmaps it both through the heap
   fd and through msm's GEM mmap sees the same memory through both
   mappings, including writes visible in both directions.

 - your series + this series: zero arm-smmu faults, zero io-pgtable
   WARNs, and hardware video decode displays correctly in clapper
   and chromium.  The GPU per-process pagetable path is exercised
   with real decoder capture buffers (videobuf2-dma-contig, 2MB
   frames) and maps them from their DMA addresses.

Patch 1 exports iommu_get_dma_domain(), which msm needs to look up
the dma_addr -> phys mapping of imported buffers through the msm
drm device's DMA-API domain.  On platforms where the drm device is
direct mapped (like mine: ae01000.display-controller is in no
iommu_group) the lookup degenerates to the identity; on platforms
where it sits behind a translated IOMMU the translation is needed.

Happy to rebase on whatever your tree looks like - and I can rerun
the full test matrix (WARN count, fault count, kmssink scanout of
real V4L2 frames, chromium/clapper hardware decode) on any revision.

[1] <20260926183051.25754-1-robin.clark@oss.qualcomm.com>



Jianfeng Liu (2):
  iommu: export iommu_get_dma_domain()
  drm/msm: map page-less imported sg_tables from their DMA addresses

 drivers/gpu/drm/msm/msm_gem_vma.c |  9 ++++
 drivers/gpu/drm/msm/msm_iommu.c   | 90 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_mmu.h     | 13 +++++
 drivers/iommu/iommu.c             |  1 +
 4 files changed, 111 insertions(+), 2 deletions(-)

---
base-commit: d6882ed4e5b3970a13d721a07d2737c4831cdced
branch: msm-map-followup-v1

-- 
2.47.3

