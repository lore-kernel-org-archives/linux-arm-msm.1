Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825122;
	b=qOadt5FIXmgfQVEoVC0YeuQpgXzcroliHwW0AhPisrzDK3He0kwpqX+2DHC7QYMOlqcK
	 nC18NHz2v1Vg2tByUKQvHzR+bOBh4Io4ifYYrCxzaIQn/O48MVFlRO5VtMuqkmqBmy4wt
	 2vOym53OPXdtBnWajsV4WXK5LDENWnWkHVl6Rf2Yxe26Ul4kdwTbcLoJJF057NEwTKmhC
	 /8dmYYx0Hfqe31XUydCjnCMZPP9GsCT6IpEmTvxR3XUx/cyy922Cy9TiEDUD+I3xRBXQI
	 o7C6lxc91PE7E7fXhFAWcuHvy84+XQ2Cb8wooSyqslTqFBwQ2aWSa7cuqduV3jtHCuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825122;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=knOyFaUO3FKrhtRHRqH99Z/CNRw2SZfnLMjOYRBuGnU=;
	b=uUDLLswZZBtU1HJfdnFLd+s1Nop4DFLTjLc5PxbiLjuKoPDtaCKq0WQ4lGDxnJYA5qCm
	 kh/3mQVBPDchW2vVjcJ1x0n+MKnQIeKMQiKRN3nSO+L71AMuK7IVKkOypfIwOqJJFLpzV
	 TeBT2AQ8j56ribw73uKNQrb0sZtPn83Xjw8pZhhkqpm3BMVQGGcTIZelkmfBWLJ/UEfUq
	 072TY+UDOsQjoYFLY8y2pmHzYpHxD09eTdkObp4SZbqz3YTJUaebkvb8l45zd3+UyNlQB
	 qsX/S+dBdcUMjiiIvpTu8o1fPYSjcZlDy4E2cjPAQPLgtrB55rvwxEF6jsC/Bt6LNMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lbhcYG6T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6E7606A33B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 10:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lbhcYG6T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B12B1F000C5;
	Mon, 16 Nov 2026 10:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825121;
	bh=knOyFaUO3FKrhtRHRqH99Z/CNRw2SZfnLMjOYRBuGnU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lbhcYG6ThTQrKKTCgi81ikBzpWvTujiLVp5oJZNIx1XVg5yVFqFpW5+S5WE1EudfM
	 pISg+uRhbaTNF7MhwvhzJW2LBhZhiyOOfO9umtczIqM/Qog0cSM9gYdkRUj0olRm2w
	 +chNF3+rwDavZIZXr6OddKX3UGZIPqxiWavvZvDivFV+4CsLlNlFGs9zhNbX45rjqw
	 atIUXl8yt29H+gTFghkUYRpLCG9dVcL3tmYZV8lcoZvZCl+PtraQkdyv//VwuFZS6t
	 ep/wlk7WQrm6FfvY8NWn/eSdVw1rI0uc5Se+QJTMblnCDW0Zg0qsTdfR4xNYBNYqvs
	 yDbtAAZE13XmA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 16 Nov 2026 11:30:36 +0100
Subject: [PATCH v2 20/64] drm/msm: Switch to
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
Message-Id: <20261116-drm-no-more-config-reset-v2-20-0bb471f4d1e0@kernel.org>
References: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
In-Reply-To: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532; i=mripard@kernel.org;
 h=from:subject:message-id; bh=PcY4ZpeNGzN471kZUkkkcGkDS5JzxgkVz0ugy/XkvFY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm/bnscL0iQqL8xmTf74Zn7wb4rn+1b8fgHz6HjTtoyr
 ke2Zp+Z3DGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAm8lidseFbAbdcyWcR3Wm1
 +fyBq5banFp9lu/H+ySBCcyO55d3Xt6/7baaONsS7+n7WDKeS6y628RYH9GTv13fL+hMxZr2/U8
 KLrcfXr/N+33JbidBtX2rVXIibaxWb1tVL5q/UIDX/RjLL75lAA==
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
@@ -329,11 +329,13 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
 		goto err_msm_uninit;
 	}
 
-	drm_mode_config_reset(ddev);
+	ret = drm_mode_config_create_initial_state(ddev);
+	if (ret)
+		goto err_msm_uninit;
 
 	return 0;
 
 err_msm_uninit:
 	return ret;

-- 
2.56.1

