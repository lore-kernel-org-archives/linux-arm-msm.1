Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0AB3C81B2
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 02:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.38.64.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791857087; cv=none; b=AZB1mr/oarNGAbW7oomC6QP7arIYhhBJ9Jam5MefOOSQ4qR8kJNYqhl6+8LQ5GfqxnTXGwg+H7Kbnk0rgrtaNXaa96X4hfkSqE4An86KUKQu2JRhiOcG2JMMLIrGDozkLuYjZjL5tWsfuzG/Ye/q/U6GQ5kOqNkGx1otP0JzCO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791857087; c=relaxed/simple;
	bh=/jYxboUjl2icRUS8AQSdnWqlZ16AR2DcL50+aQgSSEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qH3/XeZWifrNkFRnf5Xw3tVejnoix/7v2wDEhwsBSZ+yD/kXu0Jz2Boung24uYN7PGtK7KxqUCNdpi+XPwHepR2lXOh1VmHKIfPAMAfyAfuAVUuaPpUcVv4QzHgoGcaYDvfMVtKC92wzE7AqHEI60uM1RHydlbtgBFYG52UOLos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn; spf=pass smtp.mailfrom=mail.ustc.edu.cn; dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b=ZCEDHm+e; arc=none smtp.client-ip=202.38.64.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b="ZCEDHm+e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=l8RtcIRMpj
	6HK78VVM1SomERGRxjnCGQbSgGXKIV4Mo=; b=ZCEDHm+ek8UFMloHr0rNIHLQ8Y
	skeQJCbOXTFuXnSq9gl9yRsFIYt4hQbv7JxWIfmYWs24TJSwWv80tQz7X7wghSUi
	knrwQ200pZO7dJaDrN9FVn00bwKA8gRLGuJhDyKNDyoPe3lckBlkp/zSMAuCfyI6
	7yIJ3+4oXoCRsrkEs=
Received: from 5700g-x8664.ustc.edu.cn (unknown [114.214.192.228])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCXkSipkc1qznPdAQ--.16S2;
	Tue, 13 Oct 2026 10:04:25 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
Subject: [PATCH] drm/msm/dpu: reject undersized gamma LUT blobs
Date: Tue, 13 Oct 2026 10:04:25 +0800
Message-ID: <20261013020425.408928-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgCXkSipkc1qznPdAQ--.16S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF47WF18uw1DKFW5Zw17trb_yoW8uF4DpF
	W3ZFy5tr1qq3yfKwn7GF1kKas8CwnYqay7Gr9xK3sxZa4xAr1YvF95AayDuryUZw47Ar13
	ta4DJrZ8AF109aUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbHa0JUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARETB2rNcIkC0AAbsT

From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>

_dpu_crtc_get_gc_lut() packs DPU_GAMMA_LUT_SIZE entries of the
user-provided LUT unconditionally:

	for (i = 0; i < PGC_TBL_LEN; i++) {
		val_even = drm_color_lut_extract(lut[i * 2].green, 10);
		...

The DRM core validates the blob against the maximum size and the element
size (drm_property_replace_blob_from_id() with max_size and
expected_elem_size), but not against the exact size, so a blob that is
shorter than DPU_GAMMA_LUT_SIZE * sizeof(struct drm_color_lut) is accepted
and the loop reads past the end of the blob.

Reject such blobs in dpu_crtc_atomic_check().  This is reachable from
userspace on any DPU platform that exposes the GC block (SDM845, SM8650,
SM8750, ...).

Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 42d0a529b4..7a2ed9ad64 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1534,6 +1534,21 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
+	/*
+	 * The DRM core only checks the blob against the maximum LUT size and
+	 * the element size, so a shorter blob is accepted.  The GC path packs
+	 * DPU_GAMMA_LUT_SIZE entries unconditionally, so validate the size
+	 * here to avoid reading past the end of the blob.
+	 */
+	if (crtc_state->gamma_lut &&
+	    crtc_state->gamma_lut->length !=
+			DPU_GAMMA_LUT_SIZE * sizeof(struct drm_color_lut)) {
+		DRM_DEBUG_ATOMIC("%s: invalid gamma LUT size %zu, expected %zu\n",
+				 dpu_crtc->name, crtc_state->gamma_lut->length,
+				 DPU_GAMMA_LUT_SIZE * sizeof(struct drm_color_lut));
+		return -EINVAL;
+	}
+
 	/* don't reallocate resources if only ACTIVE has beeen changed */
 	if (crtc_state->mode_changed || crtc_state->connectors_changed ||
 	    crtc_state->color_mgmt_changed) {
-- 
2.53.0

