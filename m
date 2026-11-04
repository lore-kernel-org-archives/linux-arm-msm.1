Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823804;
	b=IAU5CDYAINY7kw9Z1BWwEsQx9xK8JJug/BZ7iRDD37w0iQPMeWqIIpAs2+4iSg1GhYCp
	 8X3Cp+QIpyajpQ53L40wPOQedWTPW0p4YY/9t+Zff+41LedQ1R5+G+LOd0buHwI2SVIpQ
	 LLQ+Ffyq2yl6l0LY1ODb7YOW3Vz7e/5f8cDXTaTVN1ap1fzen3tznBs3sSsUTY2PSxoz8
	 xoCVz1VLko6ElMva5XPY16zXGsf4/QFzXHWDVqhhPaklYxNTnrLzTmJQIN65CO0CN/i9G
	 673OZq+XF1qveB9/lXnOHdpVxiZj5KqAQgcmS0fuK4bamcSNLnamg+7Ui1U2J7lctVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aBaDIUYvApa045EP5EUWzH/DfONwjW0SyQDKAQn1bhg=;
	b=b3HGGnd4No1Hfokkte8k39occdqNITrGTaJnadG713X6OsTVvPEFL7kf1I9gZbpdeedg
	 FgZOr89st75bB6w87IMAlXmRs4uqEUPSWpMY9Beqihjxl00G+H38meRljOiQGqq4jCy4n
	 S3i23jIk1LR134H1cSxkTh8cRyvKR4jJfjF5ed/OZDJm7tNxR12dqPEfnlDk0FanfsJ9o
	 Qb0RPsKxdcGskxWi68dWoqPafx1BHqjXNS4ae3DR1ku//5LCr2fND7Fp3LRXh26RiCWBR
	 sHTMnOLyfYwsTFkt7hhUg0tE2k9pLkQzeOLivBTm1M2GyvkIkrLeOo1giANuSd4hTNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A66QhM04;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02AD6070751
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 20:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A02AD6070751
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A66QhM04
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67be1e468a8so734165d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 12:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1793823803; x=1794428603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBaDIUYvApa045EP5EUWzH/DfONwjW0SyQDKAQn1bhg=;
        b=A66QhM04t4FenUCvKRhts3PJR61qzN8QlzfKvK4IBROw9wS24YksaUjfEdMBe8FqW+
         wS6Sif4uUh/bEKoDRw22/BJP/CQPyL1+ZrfKS2l8Q037dioQzuwnVYVxMqs8qB1u/0I9
         cEcH26rwUcsw6uLnHl5JQaGJMAMqtxfVr492VK5yTGKML1/z/ytFb95oCdGa+oMKDQ5J
         kkddE7Kq5YvVSAGaP3kE8nTH/Qz423bq8F2ll9ZQYv8P4mWDkh44HEasJtlHWgBlbN78
         8ZGRbfXB3m1pnf1KQlezFPiYSBZ1REzruVAnyu6OYpdQYi+RiHNR/ADuag1/Atn05BXY
         cfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823803; x=1794428603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aBaDIUYvApa045EP5EUWzH/DfONwjW0SyQDKAQn1bhg=;
        b=vVykW+JKaXuTMdT2lZ7B8ZvEz4I/qKijFPr5HMH3hIOLH+9qQ85z8wOy2Fh7wBkKRJ
         WJK4i9RTMk7+T8a676HhuqaHIeImdhUvBEACS1Nqm+xaYWTJrQ1JZOIqXpqbP4gPRExj
         F5LLJ9UIx3Jd34tYS7aok+POUHVHdxBZkjOPM0kZbrc/SFeiOjE3WCVXBdeDCHXXc8P7
         fXmvofsc4IeNGqW8CnWfXl++jZHYBsTm8C9G2+011cFlya3di8t8lzF9ivKE1wZ1oLdS
         2MUMoZMYag1FjeSJDZqZu8hYMPdK0Q1xv56pQ1wo7r6jTKIYaaZmg8zp2xQq9oWF50zv
         EufA==
X-Forwarded-Encrypted: i=1; AKwUvBxyYLhV6yezRTVhs4MQBlfo81qlNAr0geCD18nooGSuek3/eksUD1KOTN92eeLNL/gTBSDodk0HK/5yTaWG@vger.kernel.org
X-Gm-Message-State: APuU4Z/JZk/oj75jjKbTcpc/xVGv45/nWvkVAZEfuGlPkc2awlmDpNH/
	4nMUlSeYbxICaXgi6TiMMUrsEwkmilbAv3dHtvY/BEpa9vuQ1l1+AQWYRdKzYEzRb2E=
X-Gm-Gg: AYBFou2B2ZN1OLBUpIW87UZ2y7pq3MPXRuNMfVWISL0xLx6RL6523py04pglwbS/DcS
	sZRoyI5DrgJZu40EA0KgIpWWHJZR42NpSJ/yx1j5YfhLhySgIJn8pMs3B2Ltu0za1LPN2aV9cQ1
	y4PfX1HGl62LV4281jSTuraOr1qr1PFSJpDmqzNn5EnSmMr9fmkavEY5cr1vK2px3SIVhokLX4f
	bO6MqyLqFNmxFiqdtBJ6rX5NE1i68ha6UF8EhBer4df0iXtdk9UqSR4YTL8fLhGlfJ+gLTvrYBu
	yPYkYsqZIgfGojKTJ7MOVvT6qJczYHNEDrsFNSWcS8HrOJgjMhI2bozmdEPV4bZaKjbfa7I7TE7
	9f+j0LRM09e8W51hvc8eet3kZqR78BsbOeMYF6x1ThUNQklVYKiIyOda86vFxEyQntomn5YPx7Y
	LGryuU+F7muG1HCJy2QQ2PFyAcbG6TFjuYEwxj/jCJvpBZgWIhSz+u1pL7rzuYLSkJAP6p/Xh0A
	ntTDAAInLveuuScz8AUKo5eSbeJ854YgrziLEoOS9Y15xRJyhw+qiuuL+thuWUEXbt0wMVpOUSN
	+vua01TJtgllEIjq+39gghGMmlmYtLYay1PpxKacHdAgiErKSWZNXHrxS9xsL5SzFUCbrweKXdI
	vgPs=
X-Received: by 2002:a05:690e:400d:b0:679:94f9:5e7c with SMTP id 956f58d0204a3-67bd9cd336dmr3823187d50.69.1793823802601;
        Wed, 04 Nov 2026 12:23:22 -0800 (PST)
Received: from localhost.localdomain ([104.28.244.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bf91b6e7dsm1298292d50.13.2026.11.04.12.23.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 12:23:22 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] media: qcom: camss: use contiguous buffers when there is no IOMMU
Date: Wed,  4 Nov 2026 17:23:10 -0300
Message-Id: <20261104202313.72494-2-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
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

The VFE write masters are programmed with a single base address per plane
and then write the whole plane from there. video_buf_init() takes that
address from sg_dma_address() of the first scatterlist entry of a
vb2_dma_sg buffer, which is only correct when the whole buffer is mapped
as one contiguous range in the device address space.

That holds when the CAMSS is behind an IOMMU, but not on SoCs where it is
not, such as MSM8226: there vb2_dma_sg allocates scattered pages, the
write master runs past the first segment and the frame lands in memory
that belongs to someone else, which quickly brings the system down.

When the CAMSS device is not IOMMU mapped, use vb2_dma_contig instead,
which allocates physically contiguous (CMA) buffers and checks that
imported USERPTR/DMABUF buffers are contiguous. Keep vb2_dma_sg when there
is an IOMMU, but refuse a buffer whose DMA segments are not contiguous
instead of handing a partial mapping to the hardware.

Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/Kconfig     |  1 +
 .../media/platform/qcom/camss/camss-video.c   | 64 +++++++++++++++++--
 2 files changed, 58 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index b51745c94..3d3555b55 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_QCOM_CAMSS
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
 	select GENERIC_PHY
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f1..2c15546c8 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -7,12 +7,14 @@
  * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
  * Copyright (C) 2015-2018 Linaro Ltd.
  */
+#include <linux/device.h>
 #include <linux/slab.h>
 #include <media/media-entity.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
+#include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-dma-sg.h>
 
 #include "camss-video.h"
@@ -146,6 +148,48 @@ static int video_queue_setup(struct vb2_queue *q,
 	return 0;
 }
 
+/*
+ * The VFE write masters take a single base address per plane and write the
+ * whole plane from there, so every plane must be contiguous in the device
+ * address space. Without an IOMMU the buffers come from vb2_dma_contig, which
+ * guarantees that. With an IOMMU the scatterlist mapping may still be split
+ * in several DMA segments (max_seg_size): accept it only when the segments
+ * follow each other in the IOVA space.
+ */
+static int video_buf_plane_addr(struct camss_video *video,
+				struct vb2_buffer *vb, unsigned int plane,
+				dma_addr_t *addr)
+{
+	struct scatterlist *sg;
+	struct sg_table *sgt;
+	dma_addr_t next;
+	unsigned int i;
+
+	if (video->vb2_q.mem_ops == &vb2_dma_contig_memops) {
+		*addr = vb2_dma_contig_plane_dma_addr(vb, plane);
+		return 0;
+	}
+
+	sgt = vb2_dma_sg_plane_desc(vb, plane);
+	if (!sgt || !sgt->nents)
+		return -EFAULT;
+
+	next = sg_dma_address(sgt->sgl);
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		if (sg_dma_address(sg) != next) {
+			dev_err(video->camss->dev,
+				"Plane %u is not contiguous in DMA space\n",
+				plane);
+			return -EINVAL;
+		}
+		next += sg_dma_len(sg);
+	}
+
+	*addr = sg_dma_address(sgt->sgl);
+
+	return 0;
+}
+
 static int video_buf_init(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -154,15 +198,13 @@ static int video_buf_init(struct vb2_buffer *vb)
 						   vb);
 	const struct v4l2_pix_format_mplane *format =
 						&video->active_fmt.fmt.pix_mp;
-	struct sg_table *sgt;
 	unsigned int i;
+	int ret;
 
 	for (i = 0; i < format->num_planes; i++) {
-		sgt = vb2_dma_sg_plane_desc(vb, i);
-		if (!sgt)
-			return -EFAULT;
-
-		buffer->addr[i] = sg_dma_address(sgt->sgl);
+		ret = video_buf_plane_addr(video, vb, i, &buffer->addr[i]);
+		if (ret < 0)
+			return ret;
 	}
 
 	if (format->pixelformat == V4L2_PIX_FMT_NV12 ||
@@ -699,7 +741,15 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 
 	q = &video->vb2_q;
 	q->drv_priv = video;
-	q->mem_ops = &vb2_dma_sg_memops;
+	/*
+	 * Without an IOMMU a scatter-gather buffer is physically scattered and
+	 * the write masters, which only take a base address, would run past
+	 * its first segment. Use physically contiguous (CMA) buffers instead.
+	 */
+	if (device_iommu_mapped(video->camss->dev))
+		q->mem_ops = &vb2_dma_sg_memops;
+	else
+		q->mem_ops = &vb2_dma_contig_memops;
 	q->ops = &msm_video_vb2_q_ops;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;
-- 
2.43.0

