Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9324519A7
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 07:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149405; cv=none; b=NLw99Ch2LLBKvPwju4XGOhmVdtRnHQJJyLobZVGf6hlOPFjWggsZSy2gUmagvccv3TD+fkffsmdIQC2+p5Q4lAvr/oZDvFghoPgrqipp0jXwWrh5sYpLVz4LmcJYfrYbLR1FANHCQtMBVbvNuiz8LWCGKCPG18QdMms3i9RFmUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149405; c=relaxed/simple;
	bh=tAwt1UHEbyP42ASJ1X5HiAjvk5UC20sOlxN5oqFNYf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PrFAu3A8FSxWqLz+V6qEXbY2Joz4Gv8oNby79CGPM925wpzsci2Ltda6SIUI6kW2hs0YPP6hYdlB1MPf32driSstWyLj//GJU6wkhEMqGPLexM/6ajkoieEo6RLr4JMTZ4MSWJiOia4mLzBCupj+jVyqK7CpPiIa1360BGi5mwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCK9By0J; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCK9By0J"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dfedbf80fso81479a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 00:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790149403; x=1790754203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/3yqINp8iie30Eysp9fZFTFNFw0R4zJwE8ZATQluE4I=;
        b=nCK9By0JtLKgw4QsJWKPmgPl+S4zxxVdvvEn7PWf3uXLROQt+Bpp+oMLqLGOWXCZnW
         VIP/Tdm7ZzlgH8bzDFzf0ELcVKBGfBMAUjlZInoucOykHmMQrookApa30BnNk3M8xlBW
         5k0SzMffUebJKNW7v9AkiBDCm74xcpZmreNubZ9pTZHgLTL5BQiGNskBhaVBtlMfHBBK
         3bGM9Qf1QXP4+lQ/nr4IPvu53A4XQel/iFv4dDmKdkEDWgttvXlMGgYew3Rj5HGBhG0f
         uDFitHO3X/Iu5tDCQV8T9P4HyDUaxphPfyOEQ8nz/K2BAWRflr1+ugQZDmpY2qRHy+rp
         i/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149403; x=1790754203;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3yqINp8iie30Eysp9fZFTFNFw0R4zJwE8ZATQluE4I=;
        b=Xt6/vfkMPfG6OQnNi3VhEL7cRpUVbDgxxja0G5tFsarH1bqqzSnql32LOD213jLal1
         7Sz1QeA/mXYnqqjfbTOFetLxVlyRumG3qGSk1kKnTcvm9a1+odeUQrznpmzYs/Tvoz/s
         tny1fJIQHtr7tvctZ8bohjmhrK2fVue+w/oOaHrq5ZKtCrGRQfPl1SjS3snfiLpgwq8l
         K6o3+WgWrGTzBJ6lfX2NYXYpG04s+YXa8dUv0jCp+ln5Q296G5Kb6Z5qYJZh4V/mTFRL
         dWXiE5x0TpGnQu27TuOhFrtD9p3APflTrTsCHEkO+pB/EtTUhy0FyvNF6pLtaSnEildG
         R/4g==
X-Gm-Message-State: AFuF++kA22LDuw9mBp25qw/7T5VANKes0m2COK7aiI4yLK0JEyLDdUvi
	0thuXittrqsN7Mv275YnrXlnqazyuepSDdc93v/WLtlKhQvPXJpYOVVZ
X-Gm-Gg: AYBFou0/K0Hf67+52GtxARhEeQJmcsQlJFHJ+cDBpktHZ2YXz2a1j7O26ZDRPBX1d87
	Kzb+fmQBFePkh7eLM3UzLQ6ImI8k1EVb4h8QJDEhyj5iarPjQUBGf+WLk29oaWIlY2ZWFSlLRFV
	FJHRdRcg3w5H8yyUW1AGAlNk3WhEzToHaXcxTyk1jge/LICf2ilBT0232SrsNq+RwXzO4DVX8B0
	csb4lFhQnWNlDAK38FmuXzZOKSNenLBuzl53lBnRAJQJBM8VXrCH/+II09uJpu5Or9tooBGGFeI
	htrCN4fCXs5Jkc50W0pNJ0afdK/SbdHbLzg4ajDqH+YiKIhc7XsORsRNju804TtRr8wBTu3HsbU
	+UFwcVAojOZBvm+XoDakZonnVqDml4gal6MX9EtcOicS/JyO/dYSp+6WflP1oGuksoB/GY+uYlD
	rFuKerhBBWKCQJZIZbscu0CNZ4mCgQjAWUBdM5w7uCWo5ibZIeizZqNAafq+5yMZwSie+YfK94P
	gOGJWFTDJV60w==
X-Received: by 2002:a17:902:d2cb:b0:2d6:3c1a:85ef with SMTP id d9443c01a7336-2df69e1769bmr25554635ad.4.1790149402890;
        Wed, 23 Sep 2026 00:43:22 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5d9273sm6406785ad.50.2026.09.23.00.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:43:22 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linaro-mm-sig@lists.linaro.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>,
	freedreno@lists.freedesktop.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [RFC PATCH v1 1/2] dma-buf: keep DMABUF_DEBUG off by default
Date: Wed, 23 Sep 2026 15:42:22 +0800
Message-ID: <20260923074256.9357-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923074256.9357-1-liujianfeng1994@gmail.com>
References: <20260923074256.9357-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 143755bdabaa9 ("dma-buf: Make DMABUF_DEBUG default to y on
DEBUG_KERNEL kernels") fixed a dangling reference in the DMABUF_DEBUG
default, which had the side effect of enabling the option (and with it
the page-stripping sg_table wrapper handed to importers) on every
kernel with DEBUG_KERNEL=y - i.e. virtually every distro kernel.

drm/msm is broken by this: it maps imported dma-bufs into the GPU's
own pagetables with iommu_map_sgtable(), which needs the struct page
of the attachment sg_table, and it fills the GEM object's page array
through drm_prime_sg_to_page_array().  With the debug wrapper in
place both silently produce garbage (the wrapper zeroes sg->length,
so the page iterator yields nothing and an uninitialized array is
kept).  The VM_BIND map job then fails asynchronously after userspace
has already enqueued GPU work referencing the mapping, which shows up
as an arm-smmu translation fault from UCHE, e.g.:

  gpu fault: ttbr0=000000088a889000 iova=000000010741c000 dir=READ
  type=TRANSLATION source=UCHE

This breaks hardware video decode (clapper, chromium) on Adreno
systems; bisected on a Snapdragon laptop as v7.3-rc3 good,
v7.3-rc4 bad, culprit 143755bdabaa9.

Revert the default until importers that legitimately need to build
phys-based mappings have been converted.

Fixes: 143755bdabaa9 ("dma-buf: Make DMABUF_DEBUG default to y on DEBUG_KERNEL kernels")
Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 drivers/dma-buf/Kconfig | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index e4f078a326a41..b3c581ef4c987 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -43,7 +43,14 @@ config UDMABUF
 config DMABUF_DEBUG
 	bool "DMA-BUF debug checks"
 	depends on DMA_SHARED_BUFFER
-	default y if DEBUG_KERNEL
+	# NOTE: keep this default n.  The page-stripping sg_table wrapper that
+	# this option installs for importers breaks drivers that build a
+	# second-stage IOMMU mapping (phys -> iova) from the attachment sg_table
+	# and therefore still need the struct page, e.g. drm/msm with its
+	# per-process GPU pagetables.  Until those importers are fixed, making
+	# this default y breaks hardware video decode and GPU workloads out of
+	# the box on affected systems.
+	default n
 	help
 	  This option enables additional checks for DMA-BUF importers and
 	  exporters. Specifically it validates that importers do not peek at the
-- 
2.47.3

