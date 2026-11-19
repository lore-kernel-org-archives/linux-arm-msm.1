Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060098;
	b=iLUa1kt6Jze//W+xmUdi3ur+FYTG1ir7XOvekfCZiO4ZuzRnbCv5+Wmiy1bU6MgTcp53
	 VKMMKB/6Di8EqTKIQ/XAaMVFQMGfCFp/jN1N5ksur/oHb2UXqnOmDCXvB6n5EOP3aXIwX
	 ci5tb0oKMUWqtG0B/nIQ2EENZOFQGtuZ5zHuXN7S5hoVNOMnzbC6ZVLTsz5nrfRtVa5yZ
	 Re/dvECKbsfVnOMhAuqxaFMXDMDZbTFSrAO45Hhhk8N7F6vmbfn93wtlIBkEwI3r0gWOA
	 6lNPCaPnTwetJoFPsfO3h5MCwR7AuaGaDNgKFZPY33DpHMxunkMI4JWw4sD4uIY+0VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060098;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=vwTZeo7iBYBs+QejrwiRws0+OdtO38BbVpGXCkhgvvE=;
	b=dWhmpy9YpLX+TxUKZuSLPXesuSdJhKZulRUCkNc9d91aiTVA6xAAknOq53AKIU0mBb62
	 OIWcLS8/MtZHZcdJRD3nnyFTSFR+FvUWLWfvQIWkngHyX9zTAx2RIUuA4ydlt27c2bupE
	 0saOCHp+mvNb2Ttb2PF8LXVYAve/zG4O2Mj7u5jqkU4veoflU44Urs2Cuv6I05AdXIajq
	 RvM/lANjEd/BO/JhGy9S/qss41d52gQuMShnFlYk+WJ7Nbj58cRmS9QxD88i64egpw4kf
	 30mmPXiJ63WkIqh9RQNnFsy+UYv3fq6FGYjjBkvB4zpGCKpwyH7JBbIZ8leWmNXqF3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MwMsvsOq;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F61606A32A;
	Thu, 19 Nov 2026 03:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3F61606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MwMsvsOq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=vw
	TZeo7iBYBs+QejrwiRws0+OdtO38BbVpGXCkhgvvE=; b=MwMsvsOqUuoy5QcTAd
	hL/GhAeJkifpYQORLcUmSxG7p0L5oTbDPuxoStAMxEp7Q+2cCRGgKcn+PxgfCOHP
	8UOT5d/yg6a29XsinV50psgNX7v7F/+g5lefja8gkj5KehBsSJxgmTEReHVBpu3Y
	tS9G3du98N2GduVAxLKt5sBBM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgA3En9Icf5qbvhPGw--.13124S2;
	Thu, 19 Nov 2026 11:47:22 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: robin.clark@oss.qualcomm.com,
	sean@poorly.run,
	konradybcio@kernel.org,
	akhilpo@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] drm/msm/gpu: Unwind power and clocks on resume failure
Date: Thu, 19 Nov 2026 11:47:18 +0800
Message-Id: <20261119034718.2818183-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgA3En9Icf5qbvhPGw--.13124S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF1kWw43XrWDAr4ktrykuFg_yoW8Xw1fpw
	srJasYkry8Z34Ig3y7AF4Du3W3Aw48AayxGwnF93yfAw1Yyrykt3W0yayFqFn5AFZ7Gw4a
	qFs7JF17uF1YvwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piGjg7UUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7QrIN2r+cUrK8QAA3M

msm_gpu_pm_resume() returns without disabling the power rails when
enabling the GPU clocks fails. If enabling the AXI clock fails, both
the GPU clocks and power rails remain enabled. In addition,
enable_pwrrail() leaves gpu_reg enabled if enabling gpu_cx fails.

Disable gpu_reg when enabling gpu_cx fails, and unwind the completed
power and clock stages in reverse order when resume fails.

Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 8319119041eb..5480abe1aba2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -40,6 +40,8 @@ static int enable_pwrrail(struct msm_gpu *gpu)
 		ret = regulator_enable(gpu->gpu_cx);
 		if (ret) {
 			DRM_DEV_ERROR(dev->dev, "failed to enable 'gpu_cx': %d\n", ret);
+			if (gpu->gpu_reg)
+				regulator_disable(gpu->gpu_reg);
 			return ret;
 		}
 	}
@@ -110,17 +112,24 @@ int msm_gpu_pm_resume(struct msm_gpu *gpu)
 
 	ret = enable_clk(gpu);
 	if (ret)
-		return ret;
+		goto err_disable_pwrrail;
 
 	ret = enable_axi(gpu);
 	if (ret)
-		return ret;
+		goto err_disable_clk;
 
 	msm_devfreq_resume(gpu);
 
 	gpu->needs_hw_init = true;
 
 	return 0;
+
+err_disable_clk:
+	disable_clk(gpu);
+
+err_disable_pwrrail:
+	disable_pwrrail(gpu);
+	return ret;
 }
 
 int msm_gpu_pm_suspend(struct msm_gpu *gpu)
-- 
2.25.1

