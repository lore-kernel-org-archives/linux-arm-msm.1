Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887786;
	b=5LSTvvmsxcf2xz037g4tICECP3z4yi0P1eeS/+lQY+rNwUkxwUNS3hJebgytpaafUoEV
	 KsxRaPh4cLQpO6IazSHRHKuk8IgigIqh8bR9Hn69A5x/2kazAKH89hCkFr+EyvOZg4DYI
	 vKm8T31BWNaJxMQYnVToF5WfLb+f5BXGG4jiTMfLrRWuBq4E+ZtfkDwq72rJjRSG4RKqM
	 12EZKl6jlrtTP/9tfax9z4Z+pJ+QFb195k5FLTT3VpSvpxIq3Y07ZzEJ3cetZUfHRl3Uf
	 zLfeSHhFyEZPGjMe6nMh4VUPKuSYKI7DAo9VV349ajBtCJD2sakARQw0s6oXG19TKAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887786;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=0zKLVbU5RZ6DdxJiv7uVlVzyect/qDDvDzd/WSk7/aQ=;
	b=nsyzPJucwdEDJF7BTl19tntvLUIq36Ql4nRDwi8F6XkPeU9+pACu5wyrB9CpYpqkFOcr
	 xpsoivOhAb1rwVRVfSg0zCOJbpELWiPfy/fbXEVDr1idWXCgEGHPXFO2Wn1xCGGhKNUu9
	 TwmoAW2/42XagmsljDm76Gf1hhdM4V6T1C9nHGPySAjXhIWoPAAd+glOR9mTBI+uSfHZa
	 Y73BeUTDoSBr//fhwIYtRleBMwY/9wySIPyzwRBu0+5LwPCECUhqhgEbwbgdAO1EyM2F4
	 qyWlFtH91epun4sdEWtY8juX6x+FXRW96Co96VHvNcKGsdX5CzqKSMcY0+oKKSR18dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A4OZItLR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C352606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 14:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A4OZItLR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE181F000C1;
	Thu,  5 Nov 2026 14:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887786;
	bh=0zKLVbU5RZ6DdxJiv7uVlVzyect/qDDvDzd/WSk7/aQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=A4OZItLRsCAHy3njDjr/0C7FugU3zRO60lYOh6f4exxmd5kxs1o4p9fzUAN3a3tdl
	 14cgne9/hRXbWtTD72O8rjnZNjtWYw9gAJ4ZdLCyNSetJXdxbeCqWxKpTiTYqZ0gPb
	 iqbdC+zUKb8e2sN1Qw+tRiXHzJuZYVlyaH67Dvli9AXAs6BJ8FarwAMjmowKs7s/5j
	 g49DV4UvpTX1ME3CM5g/+DS5cD3I9ofJ5N5a2Dva2ZEDCcVeGT6/M2LXfSBwaVM+rw
	 Jd52n0EVLrQM6xxcZVYZkkM2UtiFVEoSY952kAV1+enFUMS/l9R99k2LgZc/TxvNUb
	 C59fCFHxBBQGA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 15:07:45 +0100
Subject: [PATCH 28/83] drm/msm: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-28-763560c2cc3f@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1392; i=mripard@kernel.org;
 h=from:subject:message-id; bh=s/AiEtkp4RDYwGLjOOs1H0bIFYiO/56TBVswalDL67c=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvelcsfz0v+tDG/OWbJxva226yLewQfZ97wFiL+U6kq
 5aP2VGfjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRJGbGhmW+kvHL2dNFpj5c
 FuEc2HDIv1jFTt1q4bbDTxdreIlcXF80rZbzPvN97zk2pm1vA5SWMDa0TRSek/8jlmPrRL3zzxi
 F3dRj2yxfX527fP5Sm6jPh5mOVgsVmy52yVeckqN91Yjh/wMA
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

