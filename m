Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E854330662
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Sep 2026 17:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788714234; cv=none; b=j5Zspy2gKT5cSV4fEyrnZ+gCFo5izJdEDkP7ZBD0kovVzCn3q720F6T6SwGv6UOfkTXDoupR8HfXWuJlqTaSy9kTBengsMWPYb4ON2nIaEWNxVvr18a0khtwhOVNx5F388GF3Y3OwrYmSfNhJvTPzMQ835fHViuXx2bn67IInl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788714234; c=relaxed/simple;
	bh=MRdeut16+8KmwC4yWAYbPC/aqh/GD+VnMAFN1ydBH2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fWM4s/M0IT1pBmCIGD3uktsltq29u9mLGyuCe85ad/t/Lj1/z2Nsrr8SGF6MgeFuDBtqd8u/a8ZH4aWh3qocZDCO+v82VfTJW3L7i1mAU+BJ8Vc0wftL2K0rcnhhaGlc88QUKzxC6Qxg6fAbbZae1KgyCIqMPvoSSs/ygpEpYtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyiL4NS2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyiL4NS2"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so1895693f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788714231; x=1789319031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=THUyQtBNkmYvdRFdNm5FE+fhYKPDNfLX377CAHW/VUc=;
        b=UyiL4NS21x7k2o0EeuIC7lvGtdtnFQo77EQxsTLnQdoNwxnyUSb98QmFdtR7mrm+Q9
         lerNCHebmlbx/EbXkiTFLYZByQbGY1YZYLtgvg3Z5P8GeCWQGZVOGv1hycFkuv7JM8VM
         PkY07DHkoSf+xzdawwP0B7+c6OzljgJ/uAQGvz9L42kRRmnFtGQ9WFR8k4AGANYtJAed
         UivX9xdQoGDvZD69OLrHJeW88Y8+LuR/+JeQlSb9mZi5KMxN/h2BOTgUVCOX1w5YPXMV
         PvTo4IMgIQk1NnW9RBnpPdJetVr0385qiAr7EWgcrj1NbIFWwkJcPOQSTHAdrcCVyeGI
         wb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788714231; x=1789319031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=THUyQtBNkmYvdRFdNm5FE+fhYKPDNfLX377CAHW/VUc=;
        b=UG8anHuQv61ydFmJvMxcNbwergPFpBwAEwOkhJC6xo3d1lIP7mLNvKVQzYm+/V5mWJ
         0pgYNOuwziZVUK3lSvqFnXFM1/uVk/8mOLFL/Yx1Rfz+kLWc2g1zIs8aTQ4mFTVzuUOx
         pR16x7YJ+tylOyvzDuEEEoVy9OM+ic0zmXAEuwSFafb4JDIsEd8oqYWj39cRP8HkqtlO
         1lPJhANvfvetG7DyeJLByOmm/69q4yKINxV/U5An1RRNybWxSmZXfeN1XV3SzSLv2MqM
         MEFJGcL7cLfBl37Lfmms60b6CPrY9T54mE0Ide1EsCKZG1hZREMW7tTxqwAIoWgvbsHj
         NJjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbfj1FR5uBYQk/lTloBLW/our9zgnsIZSV2iO8lysz4ZQ3x3sQKx7ID0LLL4EOuf70FTDXRt2uv2ix4i18@vger.kernel.org
X-Gm-Message-State: AFuF++kw0MRoaJfdpxrEzFQj8CPiOcyQ6Hh0HaUNcoiUBcrVZ8YISNrj
	8CFiRwICuQ4O+3ENmdcK/f+PTU0c5iC9Wq1zIEwH6sW1EV4Rm4NYhvKW
X-Gm-Gg: AYBFou29z42vXysSFNeURbo/A9whcif8vtxWbpf4LRPhf9TXxNrLzkfefOrhaq2wEK9
	dNL8XPhS9tTH3xu6WukkhTlT2KtWtpDNN/rMy5Ynwuc4NZllAveHvJpegwUaYzTfVc0mr8ILUtD
	sYEcjT0g0QNDTpeBRmjGOLAkq/lefFEopeGWoegFgPCpzwSdwe3Jy5cO7+NCZgidU6sdDA9XObr
	YByub7Y/ns1suBBiF1/lqm37MMruFNL63szK/9MgThVis+EuSerpbGoUg408oYWXh0G5QIf/Gge
	6WLa4cmgkehfsDPsEojOIygMLXEPntJyPyYHTWhDTeB/cAksPmpIn0XiZc067hj7aUW363xI6Ke
	eOwGEJS+lpj8xjVCKPBPA0FDp1jnnYdYBop/Cv1emhurECAvm8MObuI5UdDLH12PwxqS7r/F37k
	EBtCHN+HAdyngLOGX8kxOUYeMToRGSmn055FFaxu7er7ZSlICZYpJQf604zWOUdyxv588uuJOmo
	KHt1wna6EnGusdf1h2JkQqVC/jpsi0qkjLFIUedqM1eOIdXsr3Z4HWaROasLbXS8jKxYLLQgu01
	RWctte1wVX4wHEE8JSw+oTJ886H4LHTccHh81GWD47arHKtSqCLVgRyDS5dTqImVIMCNlt1R
X-Received: by 2002:a05:6000:41db:b0:485:8c17:9768 with SMTP id ffacd0b85a97d-4858c179982mr14761414f8f.42.1788714230809;
        Sun, 06 Sep 2026 10:03:50 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9d84-5101-9c80-d25b-14b6-410c.310.pool.telefonica.de. [2a02:3100:9d84:5101:9c80:d25b:14b6:410c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bf3f0sm24566946f8f.33.2026.09.06.10.03.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Sep 2026 10:03:50 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix the separate_gpu_kms parameter description
Date: Sun,  6 Sep 2026 19:03:47 +0200
Message-Id: <20260906170347.2427-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The module parameter is separate_gpu_kms, but its MODULE_PARM_DESC()
names separate_gpu_drm, so modinfo describes a parameter that does not
exist and shows no description for the real one.

Use the parameter name in the description.

Fixes: 217ed15bd399 ("drm/msm: enable separate binding of GPU and display devices")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index db1b655dd055..f3d2eaa04f14 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -55,7 +55,7 @@ MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disab
 module_param(modeset, bool, 0600);
 
 static bool separate_gpu_kms;
-MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
+MODULE_PARM_DESC(separate_gpu_kms, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
 module_param(separate_gpu_kms, bool, 0400);
 
 DECLARE_FAULT_ATTR(fail_gem_alloc);

base-commit: 986c24e0fe44f844b44d365b71ce831947f50298
-- 
2.53.0

