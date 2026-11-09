Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223582;
	b=qVp/r5VkS+HlkOjgM7S87j1cSpHJqMmcH0nqQATnEySFP0MwwIueDd14VeQz+1v7Ojq3
	 m9ov1MwT09TGy2Wq1fkdXf9l89x1/D1dum6eUSvu9CZKMtXLgo78QHzkEFxyLQY1awzZZ
	 DhYjpHFJg/JyyIotxnbTZZY55WK4qKJuIUqez35EyBDdiqmL/45/O0GkdQ/rEAqSb6BZf
	 b4VxMEUJYzV0nRUXFkCPnSCeB/F5p6HMv9NpqhPeHcQZcJ1OURqG+MZGj9zjQwGhvGefj
	 RdgtzDdOkbF+J1B0STWce+Vdq6D5qg/0yPbl1OYN3tXUBaQ8rIxtjt29eNT9UtOFF2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4LnKOcOfjOxw1Gy1LWaPdnyzL4eZDSNOc7K6l6M5+J8=;
	b=M7xov9HykW5DM8My7nxwYr+C4ncgbiKuKoNSqz5vi06zuPVZDB8ojpK5ZsbCb6IQMF7v
	 p4nJ2huSKY7mFVTa1vKKoHyA8/h6KE+XPGcc3nMS/Z2vqjv7PhsbgVnpOBMEyfHj4Szw2
	 IHOqUKTKcJlxO83xzzeD3hSm8S2tohutVVnBu6Zpdl5XC/NepmNtuWEYr9G98j9UyOKRx
	 etoGo1c2sZWRrZSUxyXH3+3yj88xQeuI81EHI+NGsAK9mTZFUQqLwR4cicJCm1TXHbN5e
	 eWkEIHwZAH1E7g4VL9vvrsI3y0eJLmKAgYkwDh2Tw0j8WbmkQjGtIiT+EsfRpOvd8PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Toa6QxoX;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597BD606A339
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 11:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 597BD606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Toa6QxoX
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0d63f60bcso9018277b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 03:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794223581; x=1794828381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LnKOcOfjOxw1Gy1LWaPdnyzL4eZDSNOc7K6l6M5+J8=;
        b=Toa6QxoXSnQoHX2expveKKbcYOW1CPvKMxPlXWNyUAnW2D6kimKi4F2FBq7oDVI3V1
         +eEq0htQSgwENJojD1RQti93F8/SjFTS9eJ2GlOKiBTOiKOd7K2/vmD8TPf3W6AB5E6E
         7NSjLEcYh9efzXT18T6SKSYMzkF5YWNN2ii0ukKlzl3yE/F0Z3kgOxtsw9cL6WiVXfYO
         0l/dB4yYhzy7pE4gnyKF5pQrq91+61SB21hbSH8CHG+PAw+Y+BEqrJtCA5zcTN9odnGs
         +CFBRDx5IhEM5zAfTLrBK/gfWl2J54DQpz5kc3626uD03e2ltRY9juSmwSz70KU/csZ8
         esig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223581; x=1794828381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LnKOcOfjOxw1Gy1LWaPdnyzL4eZDSNOc7K6l6M5+J8=;
        b=WebSw+sbKtvkseuF+wWUvnQHn3waDoOE7ZADtESAPC+pA4WleD44YqEMA/rT/C8QlQ
         cpK99DXiD+D3jE7xDQrR9UTav1LONx2m0C7bYpw7wecYeJ33I6QxZmchGq0PePMBEjyX
         +fL8Mw+Q41sD5tsXVnM4Is13TwEhwpW6LauGczhhQne8B0rKgKpv6RpRDb9XXHXkxqQW
         KDio3nW0ONwjySHz7aW/dGmVCsDej+45f/BzGdvBhhdiAGaPvWB+hG8eRbMPEs7ioBsc
         q9rwUSLkACvgp65SR2Ir4p98XV+hYmAST3yrBMtfhO4Avol202ngFhlH16HgbIzdnTlH
         ppdQ==
X-Forwarded-Encrypted: i=1; AL+hErFvdo5W3kv1EB4uvkxnyhvW0Kio0qYCJD/iqcsCpYSRYU0bgdasRyibI2e8EOjMyb6+4C8WOD5A7fsQuujw@vger.kernel.org
X-Gm-Message-State: APuU4Z9FJzPePabXKSLx392zfLgXChUDGAwjIuqcHgkJzFQXVUSBd6JM
	MGAZqwTZYiTj+5pFN9tJNA/6QiVAngkBFLvHPNOjoTPZ+21PLE7QuBoFwKZpJoewqtg=
X-Gm-Gg: AYBFou2BLXtdE77rlNqHi5aawE6N/+EY4kRf1N+K9AlH9Ci25WBSLeXiZIjK4PTRgB0
	AhsZbr2xLu54gODfP+p28loM26l0Hyd/ydPkd+1TfWOijJDJp7oVZ5BVvh0okp+kEqoOYfndM6w
	b5Lxnftfxbj40DjPmk2vh3zMjY1Xagkcs1wiiC1V+Ic6ORj6xpLkDm00IT0VAECmhiCmAgEbyxl
	mgIpI1FjuZYkTT9Xx0A/O4nq83GZbZpi7/eYgvGqHm6zRXUEkyQvVBm96Oym2biXPRH2PqwVB3B
	rKDkIh/0/n80sgvxvB3DxOYkAfIK36lcpicsU4eRD6WJouZOQWE0XcR9COiB0YS+dsttonJQJOP
	eyBCkp3TckOPOcxsIYDyolwgyLFcnN9+HgJovjQtqBhPk2/mvh86fRmNsvLUxUe7stkUe76UB+E
	7hDRmNHhlxWqUPhNy7BChxiPKbMcp3m1Lr+1soMlZjLEq/cXY4lUpbfHMxP8HWHvdNdU/QpAYoM
	lN5QbEkig3YAifaimXF0il3/aHnBubeGJDuYSpKCxit6Bku1ByoW4176Cqowtnl28nkWtZUJmxr
	utbHf/IROtwWzm7cu3dmozr3Goqgd/HZ303OX9iDf+8bHYsnkuX/BzpklTfWSs6NSUk=
X-Received: by 2002:a05:690c:c14f:b0:8b1:9fef:6cdf with SMTP id 00721157ae682-8b36cadc20cmr17979887b3.60.1794223581496;
        Mon, 09 Nov 2026 03:26:21 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bbffb49sm32385477b3.28.2026.11.09.03.26.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 03:26:21 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] media: qcom: camss: Use contiguous DMA buffers
Date: Mon,  9 Nov 2026 08:26:08 -0300
Message-Id: <20261109112611.94010-2-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
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

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

The VFE write masters are programmed with a single base address per
plane and then write the whole plane from there. video_buf_init() took
that address from sg_dma_address() of the first scatterlist entry of a
vb2_dma_sg buffer, which is only correct when the whole plane is mapped
as one contiguous range in the device address space.

Neither the driver nor the hardware can handle a plane split across
several DMA segments, so scatter-gather buffers were never really
supported here. The issue stayed dormant because vb2_dma_sg gives no
IOVA contiguity guarantee but still tries hard to keep the number of
segments low, and with an IOMMU dma_map_sgtable() usually maps the
whole table into a single IOVA range. The mapping therefore almost
always came back contiguous in the device address space, so reading
only the first entry happened to work.

Where that does not hold, the write master runs past the first segment
and writes the rest of the frame into memory belonging to someone else.

This recently surfaced as patch proposals enforcing contiguity in
camss itself, walking the scatterlist to verify that the DMA segments
follow each other, which amounts to re-implementing what the dma-contig
framework already provides.

Use vb2_dma_contig instead. It guarantees that each plane is mapped as
a single contiguous range in the device address space, one IOVA range
when an IOMMU is present, physically contiguous memory when there is
none.

Fixes: 0ac2586c410f ("media: camss: Add files which handle the video device nodes")
Reported-by: Allan Siriani <allan@fatecpompeia.edu.br>
Link: https://lore.kernel.org/all/20261104202313.72494-2-allan@fatecpompeia.edu.br/
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Allan Siriani <allan@fatecpompeia.edu.br> # MSM8226 (no IOMMU), both sensors
Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/Kconfig       |  2 +-
 drivers/media/platform/qcom/camss/camss-video.c | 14 ++++----------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index b51745c94..e1967bc20 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -5,7 +5,7 @@ config VIDEO_QCOM_CAMSS
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select VIDEOBUF2_DMA_SG
+	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
 	select GENERIC_PHY
 	imply PHY_QCOM_MIPI_CSI2
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f1..5de6ff5ec 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -13,7 +13,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
-#include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-dma-contig.h>
 
 #include "camss-video.h"
 #include "camss.h"
@@ -154,16 +154,10 @@ static int video_buf_init(struct vb2_buffer *vb)
 						   vb);
 	const struct v4l2_pix_format_mplane *format =
 						&video->active_fmt.fmt.pix_mp;
-	struct sg_table *sgt;
 	unsigned int i;
 
-	for (i = 0; i < format->num_planes; i++) {
-		sgt = vb2_dma_sg_plane_desc(vb, i);
-		if (!sgt)
-			return -EFAULT;
-
-		buffer->addr[i] = sg_dma_address(sgt->sgl);
-	}
+	for (i = 0; i < format->num_planes; i++)
+		buffer->addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);
 
 	if (format->pixelformat == V4L2_PIX_FMT_NV12 ||
 			format->pixelformat == V4L2_PIX_FMT_NV21 ||
@@ -699,7 +693,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 
 	q = &video->vb2_q;
 	q->drv_priv = video;
-	q->mem_ops = &vb2_dma_sg_memops;
+	q->mem_ops = &vb2_dma_contig_memops;
 	q->ops = &msm_video_vb2_q_ops;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;
-- 
2.43.0

