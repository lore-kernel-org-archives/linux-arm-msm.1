Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B4A46A612
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 18:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787768767; cv=none; b=sRndIDCbx7NiT9wg/SEiK0T+jsDYfID0mVxbtutA+MpknNtoH0Swt8gG7xOCYeBrn2/H/T74Jq+hvPdSsVwUP0TdYnFjdU+zMEBpEKPXqpxYj0SBOBcqembf/g2Spw1ZYCG9n9Jy+YVBKZl/B5VTQCyhzjEqqPoNnceIvK6cchw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787768767; c=relaxed/simple;
	bh=Nc1rNU2E7DHLdveCumxpbnt9mfl76U9FIsZQStRq2/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fbbax+PC67RVkCGZH0ZOIIzrusCuwx1BNlxTW1xTICdypqYD/vAcWQoQpkEzDxvdD9i573exId9VGS67W0qm+iBVHSEzYTIs9OiG36sfrzcETPwhdx5VEvCPkpU5OUV3NaWboOWvsk2J7ZqHqpbdNPTFh/VGgcZmCpQz1DB4yYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jtjw68om; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jtjw68om"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c20ce3c118aso44643866b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787768754; x=1788373554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2AANzETdmnhX2GAGuIhUsamI5Im+2Kfn2eShC6d5HLA=;
        b=Jtjw68omAmsPWFkAz+W7nIDSn9rw5RVVfw0Bfmx2Xuyoh8ku//cnaVf2o6uXA3jVyz
         QIhp83hFE9ZHBNVt6CWFrmZGFegCD7Niu/ArvQRJxjzyKYYGc8bBdJNU+Q9/ocYqf2dP
         NDI7uencRd7Ht5bHY35MmnX1JAz6Qc/+xj2fDQdOCUakenI+9s/CS/UwN8BxGvC05tRT
         hxg5Tw1y3X+qQnDzFbeXtWnmblv2nusXiuUownTeqSY88bMFKAj3D0tm17Z78zffjIVJ
         kW2fjXAjtmo80wPQ8HBSLLCvmvj/+n1n5X2fTfecvUdoWXFPaX35Ks4mrK2F57rSYEXz
         Ezeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787768754; x=1788373554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AANzETdmnhX2GAGuIhUsamI5Im+2Kfn2eShC6d5HLA=;
        b=NBrVBBCP14Y1cPHGnSNf5WO2FQ6hCuEOPQUBvVO/eJnfpA01plDi7B07NnN+SysCKf
         Y4Cu2BqF0ppwjBRk0A6COvi/3tlX8AsrER5HTn3cxliWWgqC+V03ReBehHRBZt2JIG15
         BkHuOlA/c+y7tIE6lMfdBlhIMPTv6ciTYQ83tQYzwTnBRiZP1luIaTeiO+2iP1I1A7hJ
         ZyMT0mI3m5/lOTGdhsSmdMMT+1y4ed1goOw2iJBRho8aIoMfDiTGrmRBYkKigodh90nS
         ze4YtJSzIk+fDvwGsIT6uqAlWz6GkmFoGBoFArs+G5JN83dpzBdci8h7NHz481V9K3vW
         Giug==
X-Forwarded-Encrypted: i=1; AHgh+RrglYWvWXsAodnFcTUndgnFyHW33j864+JVInUx6WCqIjx/XqMd8Ec1oPD7ZGoLlcqk5i/BXstkLUi+WvsV@vger.kernel.org
X-Gm-Message-State: AFuF++nUaZ6VGmklI4fpcRm4LN7wlfT4g7e3bpaOw90Lbsg713wUU6r2
	r082kM0rbJa43l2C9N5pih/Ye7DM6j9110SSYcWxOd005fTJrlsJlvX9
X-Gm-Gg: AR+sD10P0XzU1hvchOIqHuTBVXqNf++oZf9Mv6CHzRNf9l/+jmy1nBioJHCka+UMxqw
	gyF35NSGxHCJPcCirsByna3eoDe1zslOBv7GPliNq5FAnSuvMiYs+lZvva4iTtppIMGRbg+G3jt
	8FlMzS3sREK5O5ASCBvaPLUMk8D1iY2fkOgpVpcQYkYgDvXHWdM5NAhOHLg/3tqC7WKbUy2BaSQ
	6BLUmxiEAB8LuWFoWS/dhNfnrmpPrN625lrgcH+uijxL+v1NmzcQXrHdFhOxOwINxsMR7FXt6ZG
	XsEDkeNDM/IvKc6J055rK8ad3+1y+GULIfO4Vlo/DEFHiZ2hqDOUpP0Fp+Lt2QNKKJRVBPs0zAv
	0pWFQkuqB3aldgRsEtZ9K/VTtftCQTn9fIQKP3ol00WSBgnavzkLEB8gTLmsOnV9Z5i6yHh0Bcq
	11S++YAFiE2tUUVMCOlnldmfuz2dlajlsQKFwB9jSI6L7XKdeZ3FDkYmFIUVfXAg7iI6w=
X-Received: by 2002:a17:906:4784:b0:c1c:49d9:4c34 with SMTP id a640c23a62f3a-c25360ae6f6mr120564366b.11.1787768753983;
        Wed, 26 Aug 2026 11:25:53 -0700 (PDT)
Received: from fedora ([2404:3100:1006:efb1:8177:ae9d:629e:eab1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b43absm612769666b.51.2026.08.26.11.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:25:53 -0700 (PDT)
From: Saim Shujah <saimzst@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Saim Shujah <saimzst@gmail.com>
Subject: [PATCH] drm/msm/dpu: clear pending flush state before physical cleanup
Date: Wed, 26 Aug 2026 23:24:59 +0500
Message-ID: <20260826182459.1506522-1-saimzst@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hardware can consume an active-frame CTL flush while the cached software
pending-flush mask retains the submitted bits. Video-mode disable stops the
timing engine before physical cleanup, which then adds teardown bits to the
stale cached mask.

The teardown trigger can replay source-pipe bits after timing
stops, leaving one pending and preventing the first commit after re-enable.

Clear the cached pending-flush bookkeeping before constructing the teardown
state. clear_pending_flush() updates software bookkeeping only; it does not
write the hardware CTL_FLUSH register.

Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
Cc: stable@vger.kernel.org
Signed-off-by: Saim Shujah <saimzst@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 778e231..f3b1fdc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2264,6 +2264,7 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 
 	dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
 
+	ctl->ops.clear_pending_flush(ctl);
 	ctl->ops.reset(ctl);
 
 	dpu_encoder_helper_reset_mixers(phys_enc);
-- 
2.55.0

