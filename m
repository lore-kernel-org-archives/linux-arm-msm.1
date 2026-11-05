Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892715;
	b=ONk3H/O5hUwtL/2ZmiLPFhpN/LCXQdK+amFiEhXHk4udHvosRW2+7O9S0bSIe04WamSH
	 2QAhR6fyxrHuje++A1/n4sxKr/TUPniNlzCX0zZh5sNCCy/eI8VYss20TWxFRJuSdaIwv
	 h4t8CwjDS0bTjf3zYOkhbBezmE8Z9dyS2iMEN0DGLe+DGZbeDIkZBVVd/fHChczD72lJo
	 pNsHAVdXrokDp/j7eJ69Z8vawyAQOcPDanhmdnaI5sAdUYgzveGiUm7gaEiNXWKQ3/xd9
	 +Y3MOYnDH3nIS4L3QuZVJrKTq6FcyqfohMhr6StsLGhSKk/kBGdaunalSoE3PoKAX2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892715;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=0zKLVbU5RZ6DdxJiv7uVlVzyect/qDDvDzd/WSk7/aQ=;
	b=xofnjAT1HTDmJijUKKgCS2C6rqPt4wfmxOdmBWGGr2/A0NjrH0t+0g1/mK4arL0h+83c
	 sA1pctaPnsbAKjr7XsyGro1VWTUv1GyhrOYOvVODL1YBSFAVK5+QlGSsZKiyvlQdosYH0
	 Zvynk6jmEU5Y0uv6M08B32ZRVInTDGuw7aHfPRGUBtGAL+HtbVICvspK9WCeiNZ2lKoW4
	 FUemjePfMdRtdVcHNUg/WoAdY2MPl20gSlOoL9YOWLtKGP+DsvNyFbYSWumsj9iEjcZJi
	 CGZbxrPr5rcP63kdJBAyGxT4QHbcWJGPReKBhAT/aAcmn8WEP69BT/E/zIU39sjfEzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NXhJm7Yg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF2B606A332
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 15:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NXhJm7Yg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5CF1F0093A;
	Thu,  5 Nov 2026 15:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892715;
	bh=0zKLVbU5RZ6DdxJiv7uVlVzyect/qDDvDzd/WSk7/aQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NXhJm7Yg4SdTU5/7uzjvrUJp97DY2CZRWlpI1PNJ7Bl/jYgIRzvJwtT7RiB4hbVX8
	 gAIxl/jmw3rnUEvc2mJeN+lEq7/LDuSsH0giUD8D3sZkhVA08UUsbCr0fH4iuhr7fw
	 1wVTeYGzelsR/j73LlrrkdJ7re89rrxQIQMRHOa6L83ZmAMZ7MRzww20BSEGlOk4tO
	 WrnKCFc2uhHtB8ud8iZHEYo6ne2NaIwmKaewIWwhJKJ+DXXh6/sEPYcO7t7RSRoJ/N
	 OlNVsWAxCGtppEDpgSLaqCwkV1WVepgeU0sJRghdOZwh8fyc/s4r0HsfVm0FtsfeJ3
	 FUEwgfELpL9mA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 16:29:37 +0100
Subject: [PATCH RESEND 28/83] drm/msm: Switch to
 drm_mode_config_create_initial_state
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-drm-no-more-config-reset-v1-28-1f58d1e33380@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
To: David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1392; i=mripard@kernel.org;
 h=from:subject:message-id; bh=s/AiEtkp4RDYwGLjOOs1H0bIFYiO/56TBVswalDL67c=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvFryM9WhRdr0T7MqSMGVHor3/lHcl95sjgh6t3bRHP
 mjDroRNHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi3ZGMDXPVkozzb3Wfun+y
 Olzp9ok1u/7J+b4407Cs8hBnovyEh+abpm/9yGT0VOXqpBMrBO3Xn2VsWJtSvl6pKNx72yPejW8
 Wn8n+Emat4Op6wkFDUzv/z+8E89CZf7iPOv7qnLbS4qbbm081AA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_config_reset() has a dual role: it creates the initial KMS
state at probe time, and resets hardware and software state during
suspend/resume cycles.

Since the two roles need different behaviors (notably for objects like
drm_private_obj that must persist across suspend/resume),
drm_mode_config_create_initial_state() was introduced to handle only
the initial state creation at probe time.

Switch to drm_mode_config_create_initial_state().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>
Cc: freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org
---
 drivers/gpu/drm/msm/msm_kms.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea629448..9592fa28c85b 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -332,5 +332,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	}
 
-	drm_mode_config_reset(ddev);
+	ret = drm_mode_config_create_initial_state(ddev);
+	if (ret)
+		goto err_msm_uninit;
 
 	return 0;

-- 
2.55.0

