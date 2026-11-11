Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405231;
	b=bOQ1AXGFy8PEv4ZVim/P9ROodsG6w3U0ujH2XebU2vubajTM9IukQ4ncYS0rd0X8EnSj
	 E/w0oy36HI33kZeBuCIu2xqWsdfAw+x0lNOOI046WP9yrBne78w5Ke4v3cPt5v0O1sWfC
	 i27Kc99jxVluSICXqYHwTmPdHt0Ne/HnOoZnU1xP5BTnXBLL9StDdSMTYmBbKUabdoVCo
	 spL7agYE4bOOh4D/GM6v6FkVUuqT54a7Y4apnokDDyF+avxxJRYdLM6K6i2ijbhjNAf/u
	 iYqagygyE09FWhXwS+T5lHb+mWWJHUnZA7KJmeD5/LNnFGTU99zfAYuuXpkEFKFctug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4LnKOcOfjOxw1Gy1LWaPdnyzL4eZDSNOc7K6l6M5+J8=;
	b=mJ838X7FgT1O5JgT0nZfUH9Vmf0LK1M8u+PaD6Btlie+uR1s77nmY7eao5FiRVEyJr3G
	 X6GOpPGJJa6gUdBg2cpu+cpkXVzoh3e4LpmadmlNd3730MfoKENehTzgpULjv+0EqMhHP
	 WHjJfOjLSG0UxXySXWLxr2H6KvcsFwZJb52q2FO2H5WPStQvCFiRJfsg/IgL1cHloqe6k
	 HwMwvP3VrdNhMp33PeXjkOSS4UHJM5xQMDBphsEp3J1P0Zkax8Px4aGFV1VGTizLO7LY7
	 bqeWWAiLsQP0+f2VWB7ICFGHaFRMcbE3IEp0DVO76aLvx63eyXv2EfiOHf3rYm6JuvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mSGsVa6M;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A548606A334
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A548606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mSGsVa6M
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9906870a9baso1381266241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 05:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794405229; x=1795010029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LnKOcOfjOxw1Gy1LWaPdnyzL4eZDSNOc7K6l6M5+J8=;
        b=mSGsVa6MpoA0wwqqzUZGMS1Cfv9b3he1UpVvnji8ex3161GXzP8G3PSlbdn/B/btrX
         l8/vnWATVYuPA3HS8z0UDdJUfoRyx+xa/spzUi40IhdYjJsPA6/A2MjGqNY1S00yxV/e
         gnizpnEGwfgDb5fD7rq4QfQE8vWCEpNPPq7sanEvmRiBiQFqxpNanntt/dT1FeB2icgX
         ZDdxI53dBKUvN+IVaruho6evdWXTXVN9JyF6H8KXwbOpkfgoUNI+4uekWNFJo4OcsVdq
         +sJbBZKqNzi+Q3fpEydCUMLrKnzPJ5brap5CAznx+TV6yymxtvCITvpLvIpl3Z9HGGHu
         dD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405229; x=1795010029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LnKOcOfjOxw1Gy1LWaPdnyzL4eZDSNOc7K6l6M5+J8=;
        b=GNP9DpZHy9FarVnf8PlckHNA3Y0xw8P4MC9JWHQAo2ipy4br0YVyKloW9ioJWCe4MN
         ajFoUw44Tg/fzOSw4YW47MOV5AF55lLNDXtg7aheekUZasKjH7fyCs0Ik/Q3UkOnE2Ka
         mtpca/bDTCzisv1YLka6AA+AxJ1MXAGzOFCMQRREa+SR56aXITH2Sgw5Nc/V7YiQsneu
         PBbyRrsnGADSf4e3rrW9tTHYbqRX4tTUiZuHO70wGdoyucqKxJ+vMCI/Kg+NMaMN7xXy
         nwPhOKw2W1bcfTJJ9YXmxhYdQZsxYYb2ehUGPnrNUmvgWVhIie69Rq/7nmYnvRTjvDFY
         Z4XA==
X-Forwarded-Encrypted: i=1; AL+hErE5AsgHAdkMN6A2VScU4Yg0BY/W8lB9YzcblWiKQlnaDBS06xqbIpCpetzx4HR3cT8sUnaLzqQNeUTOtkuo@vger.kernel.org
X-Gm-Message-State: APuU4Z/MNQOA8UFBsNRUYIzUc5oCHWpoq8vGWQdbNTjBzmq4N4ZHouUY
	uFITzI/MlTekjD98kdENYGdMRrS83HkVAHFqJ+LKcdU2b2HZXSWdCGSABMreyUsF/WQ=
X-Gm-Gg: AYBFou19PEskjeK8ov1hnMWfv278Ccao2peD8xoxxhUkenyr08izaIhM/u9LAdkWA8W
	8XQ9+fOa5l+x8MQNNkpJj8tTs2PR0LyofSLkeZy3EGw3nMWwcCyMi4sdRkd1x0iU9kwSS60Wbua
	iFYi8xjfjeX24nvEagS+oMLYBluVJ87P3N6bMRn4VWp25+A9nIU305HjAk8pySJmvAjCKsUwtqq
	R8CnoiXISVQIWbt/kvoyjX7+VrTnEUS8zAd543Xt5EB6l4yalMEdAKutchQKs4UCXm0nRVZV3Up
	r2UFDa0eiU2CR2XFNPP89pwtWO4wt5Aeca4OXdh5d6OG8rExbMuH5llO0wIxnG47XmZuMkSA5kB
	WsatC1UYABh//oO9r1X54y2fstcUSUo7pww6oBdY76RlsPCX/tztbwFviGWoI8qbQTZYRULYXs0
	k7kXrONDgdZedDDckZKtjeJuF9N9V/AWSk0AuOJKpAcCeFh8z/+ALZ2ZMPrA+spr9VYA9+pu71G
	paTzMfYUofGuhM3yjINSpUcq1IjgrayWXzFw8gIDRKPxtdYM3l+YkM+MJs1GUgjt6x0Dg8rqdKj
	vH9dPokODu+NjbGuHMgiwQNG1zrhpq2CKpfRwp1xqeJaHrctzZJXQANag4n5fpj6DvBUDa2EFS8
	RiIg=
X-Received: by 2002:a05:6102:5125:b0:7d0:65f5:2bac with SMTP id ada2fe7eead31-7d50624044cmr789463137.35.1794405229433;
        Wed, 11 Nov 2026 05:53:49 -0800 (PST)
Received: from localhost.localdomain ([104.28.212.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d62241eca6sm786932137.11.2026.11.11.05.53.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 05:53:48 -0800 (PST)
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
Subject: [PATCH v3 1/4] media: qcom: camss: Use contiguous DMA buffers
Date: Wed, 11 Nov 2026 10:53:35 -0300
Message-Id: <20261111135338.27008-2-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
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

