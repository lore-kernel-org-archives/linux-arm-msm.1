Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2FD3FFABF
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 17:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998945; cv=none; b=c7UzSxhCjJT5yFDTwYKmxvZUdazfYUNUy201sRAUADjCq5vkjhquq2cFnivW4ARb4jcUJ0bg9nHetM7Uywgak6NEsbCjIgbHY6JvzZcQnTzMKquhgTAiueIovZEhRAe9iu91ilGuIz0SEDm9q37PcFsAegAm6HtPeNv3f1YIoL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998945; c=relaxed/simple;
	bh=uLponYGqmToRARXqmy6GD86QbPQqk21briaRdNpQIwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kX4KoKEz11IJWDSODm6jqMZGyods8E9zaVfE8j0BgKikIpTsbORdSUwtzNn9XiJtucl6Xnu2obZC40QFpTU9Q0C+Uk8J2YZ8nWBSsli3CLZpghmJBHAvrkAVC5Tijf4Av62qShzReMt83SkEHrSkijXLrkPbTRzS+ZIAN8PCu38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOiU9Snl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOiU9Snl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB411F000C5;
	Wed, 14 Oct 2026 17:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791998941;
	bh=Mtm0gpP0jfUV05JjmrY8CpdM+WJrgq+lZaIu+jqNZv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LOiU9SnlvimxJF6q37UNoXpVS247+IwQXA5QfJ+P26UagJEAqHqTR9mdlZUV8xCdJ
	 WiBbiFisQ+ZIyEol3ajz4ynhLaKIGwnwrSmNuBw6KDoSMUYUBs4/94QzVzkq2o+j7b
	 yyIGIbN6utI96qHwDfwQ2mM1QRxEMdwLlU3ej5PpyIY7lhepMCTdeYrTPINEJm6tTM
	 vrAEn+rl/yhW2haiM1nyBmoQGlo0aejbDFkST9I+yziZI+cDkZmy3XZAq1K0y+efBX
	 SB2CpQVSBlNIkfFYy+AtD8a05WkwhFqzu95iE5YZarN5yZLdMx5AKMpaI04x8YN33j
	 UN3hnG7YGHRwA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 14 Oct 2026 19:26:53 +0200
Subject: [PATCH 30/75] drm/msm: dpu1: Switch to
 drm_atomic_helper_connector_create_state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-drm-no-more-connector-reset-v1-30-586c9c026823@kernel.org>
References: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
In-Reply-To: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537; i=mripard@kernel.org;
 h=from:subject:message-id; bh=uLponYGqmToRARXqmy6GD86QbPQqk21briaRdNpQIwc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnnd4ffn7JRd7n8Heb3Pj1LU/Rnq0u8WcDv/VPQTOoXn
 +CKOdNedUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJ/NNjbLhZuVb85yNxBu6W
 iBLvWvfMee7nbuRm7q2zkV4ot7xByXY123HmG4ZPvMLve+7mfm+sw9jw+uwDpp3+Wz/lr3Vp73X
 W+bhbqZvXxsHqvfUxD3uFHzyZ1+2S/y96wNX+xejstBMLohwB
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The msm: dpu1 connector implementation uses the deprecated
drm_atomic_helper_connector_reset() as its reset hook.

Switch to drm_atomic_helper_connector_create_state() instead.

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index e7b09013ae4c..83ff7122a187 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -80,11 +80,11 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
 
 	return drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
 }
 
 static const struct drm_connector_funcs dpu_wb_conn_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
+	.atomic_create_state = drm_atomic_helper_connector_create_state,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 

-- 
2.55.0

