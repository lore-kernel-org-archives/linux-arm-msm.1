Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0593C33372A
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 00:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.38.64.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791850901; cv=none; b=BOXvq8Wmo0pjwIGV4iI5nYiIUmEDGxCtGZjOzAL8U+VVoUFByrWeIBfY6vNMv/LK2sC4SX4GV3axdToq9GsiGNwQRYty5dDaBeJELiMVbxb8RvCPXstvLzwhczFu0urP+I9hFHjLV5qMDrGqEbN5XXDgGyWn9+7NK4o61Tp/P9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791850901; c=relaxed/simple;
	bh=WfAfQPBCCDW31aFTRDE4j8Rm+Pk+lnSIQdIVvPs2a8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rv8CoMVP+y1DFCEBgO2neGerGsidqigpR58Tfdw2aN1FffOeiXK0dShxeNl8gmEQeKHvLWSknbr19of+igBKYjK8oC9sW+KjF6xFciR24nBajXBjz2ItN+i6ctBQrxEgB61oXw+lC7/J4sXY1thWzEzDgLs10iOvi7QGRD8f4pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn; spf=pass smtp.mailfrom=mail.ustc.edu.cn; dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b=YO+fu6rP; arc=none smtp.client-ip=202.38.64.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b="YO+fu6rP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=7qFgjGaUkR
	ZudxR5rXzD5LEzR7NVO8WD+Q8LXfOl/7s=; b=YO+fu6rPfZTLYYRcKKFSy1ZxkM
	1rXIIrcdbEZr+6EVVa6VHGOG32qXeeBu+YlvoWEu4dXGdhV2ygvLeijTTJy/IFdy
	MFnDxo4jQwVXLASBVT6hQDXGMe4EiyuHZYIQa6quW4Jwc+i7lHY1j0XImunzF4J9
	fxEW4chx5a/6UN+Ko=
Received: from 5700g-x8664.ustc.edu.cn (unknown [114.214.192.228])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCHbBOEec1qS7HcAQ--.928S2;
	Tue, 13 Oct 2026 08:21:24 +0800 (CST)
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
Subject: [PATCH] drm/msm/dpu: add the missing GC block to the SM8750 DSPP catalog
Date: Tue, 13 Oct 2026 08:21:23 +0800
Message-ID: <20261013002124.332074-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgCHbBOEec1qS7HcAQ--.928S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr1ftry8WF15GrykXF18Zrb_yoW8AF43pF
	17AFy5AFyDJa1SvFn7Cr1Dua13CF4vqrWxKr1qk3sIvr1Iyw1IyFZ8Aa9xCryDJry2yr1a
	qFsFkry3XF18XwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCV
	W8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUL0edUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARETB2rNcIkC0AALsD

From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>

SM8750's DSPP sub-block description only lists PCC, but the hardware (and
the SM8650/SDM845 catalogs) also expose the gamma-correction block at
0x17c0.

dpu_crtc_create() only calls drm_crtc_enable_color_mgmt() when
dspp->sblk->gc.base is non-zero, so on SM8750 boards no CRTC advertised
GAMMA_LUT and userspace could not do night light/color temperature
adjustment, even though the hardware supports it.

Add the GC block to sm8750_dspp_sblk, matching the offset/version used by
the other DSPP catalogs.

Tested on Lenovo Legion Y700 Gen4 (TB322FC, SM8750P): GAMMA_LUT appears as
a CRTC property and changing it visibly shifts the color temperature.

Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 9a993cdfab..11dc08e4a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -428,6 +428,13 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
 static const struct dpu_dspp_sub_blks sm8750_dspp_sblk = {
 	.pcc = {.name = "pcc", .base = 0x1700,
 		.len = 0x90, .version = 0x60000},
+	/*
+	 * SM8750 has the same GC block as SM8650/SDM845.  Without it
+	 * dpu_crtc.c does not call drm_crtc_enable_color_mgmt(), so no
+	 * CRTC exposes GAMMA_LUT (night light/color temperature).
+	 */
+	.gc = {.name = "gc", .base = 0x17c0,
+		.len = 0x40, .version = 0x10008},
 };
 
 /*************************************************************
-- 
2.53.0

