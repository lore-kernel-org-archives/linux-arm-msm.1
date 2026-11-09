Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223587;
	b=QKAkRHVi5ur08fNkZKUXciYlUrGrgdLsCuKcGCx5tCT3CSfcb5ongUBRkbZPRopAoYL1
	 NhOMrdWLlRMfoJUdjwNeuVMr2hyFjQ7C3CoWpW8OonlATMwF6HWgMZiFT1WpRJAc9+rle
	 QKBSnEyUxWfpALaIKlqIK+3MJkP9ebhK0zwcNQSDbhYGGLXcGJDHH35lCRKJrcnelwCVm
	 BQ8laVyXNMTfvYVuMDiqi53q3Xw9290F68wMXn8zIpn1CT5kLixEIZh6/7JEIkywhqW5v
	 NazObP0HanTqc/8+3HdXbPR+g7WG7at0NR69/OL2uMccQ+hJpfcTay+rfFik44f0JIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7OADbxMRrJk9ViHbHj+40nGiyF3MmPNTVpb/SYTVwYg=;
	b=xT6CJiQ89fHItRcDSoAfTptbtvqyf8E42qZdeOEpdKF8zkxCz7BBXbmH62sgo5o5jmN4
	 WjMCUD1sn/B2lgBteydeR0NfmdJZo8UXr4bsiQfRcvYoaQGjbDP5vL09L1zcbqIdUvi9n
	 gILu4KXDKL7752ZuChRAUPOmWvahm4t8xc2kBPQkaZ+A6ia6XcdX2J++udV6OMJpEso6Q
	 vqbRDCZ1mWB4qfJczg2gyoOIKGoVIeykD4o0VwneMz1jv2iHB4dgYQ1vgc/b/IvY/Ngmi
	 HA7lUu6ZHazs5SIYiJXLtfDWQOFop4Xh4HyMUy14SVXUhwxdNyjKQwh2c0nUExTp7Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eIOTZTOc;
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E6D606A33C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 11:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4E6D606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eIOTZTOc
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67be7b9abc8so568671d50.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 03:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794223586; x=1794828386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7OADbxMRrJk9ViHbHj+40nGiyF3MmPNTVpb/SYTVwYg=;
        b=eIOTZTOcfNImoH1UbMU1sjyHjADSTni8/f5LhkO2WlWtDaOIiT704rh8nw53voLfto
         Z0GE9A4XezzZuAqEtsoycFMm6tjjB2ZKZeAWT9OSHshMBXmti0/b9pDfd6L+CLzBRZQi
         9jqDrRBQAtRDhQdaxG2GB2jqG2Iqc1+XV6SrhzlgeO4UfKJ/Oimr+2im4eXA77K7wWyq
         AbevrUZxHZx//Xt0UtJymC9LS77vqfY3O19X/dERdHKxwk1g6UiD3S4n0P1pYuLgBLJq
         s3jrJf9bRgenEAPCfscu6LrKPTRJXNiYwibThb3cadnefveExHlsBpkFXaTa9SOT1R0x
         FCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223586; x=1794828386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7OADbxMRrJk9ViHbHj+40nGiyF3MmPNTVpb/SYTVwYg=;
        b=nVh81VD3yaKuEXL9HJnNJnZy/B3af0fJQOku/g73ugrBnvHkMgeoIPN6iI3LNiMssM
         K9pxgXO290vXJq56jxE/PiXhl083hvCFKcn3DYki/WIRIQEOKC6q986tSHmZZydPhgZ7
         gCK4y5Sbv4B4HNpMUo/OVeB+w0AhamqCp1l9BYiY1Xi0EG+2F3b8kLrMQpm2ZP5/nKps
         5iul4Wg55FRxxKfDdjnxlWulpIjKy0ZK5ChbR9UaPEehXYTFXR42NNkB8tgNc3i/uR4O
         6TL9qKd/WQdFeSHVqIQzgeC1VITADGtyvV4VAWyzBwlzVw+2CIBtO2ErOa2pMJlw65cs
         Tv4A==
X-Forwarded-Encrypted: i=1; AL+hErHxHmjYAHsJ6bPC1MNSsBDJA5rwi5mSNDNn5USl4isE/UnQ0SwdkufHfEuQy9T5J3UgiDwR39gB8kYzVcZc@vger.kernel.org
X-Gm-Message-State: APuU4Z8BYyn1qkmxhbpd5SVqbr/J09VRBpmQixjzHnpTarD3028a8IDT
	i9U1AQX6+r8W8FOkENEl84npI8OpQ1qJxuz0Tmle63yFEUicfIlaZ/CAEsv5WOwmneg=
X-Gm-Gg: AYBFou3u+arkv/keFJrAiuui9EoUhKyT7HspVaFt3O+55sACKpbfZ379IayToyiWTxy
	F4rNStRw3cEld/1cI4FsNzjx+/NDJNBoWaz45g2CxC51ah8v9hJBSrhaHkl3XuqPEmvxxOLv6tE
	rPeGbtDTiv+9EdFF7deZHMstKT3rYk2TUYcvLZDk20p0VorM6pN88pYgruVh0WElpyoIYpEolH1
	CMq2F42MGSp4YIKryOa5X5P6Jv56BNS5gFWEmBPqGYKD4t2gwY9KJIydDzr0gmgNVjCE1TKdSJk
	afQyubqVmxgYPa1fvJ6mDT+Q8UjWvSs4bLACiPDAq2BUYtPW27hfIcDiL1KMbNkMIakAJ4DkSYd
	+vuDAHP6HFr802UZbQt2kN0CXnki2uVZSEQL92cvNpyH9ealim5zlBF9OnftEGViKRF7kNebsps
	6vNohA8A3d9CP5/tjHpTW2OHfD/DqeWmDVdnvKQ6hqY8SUXlYAVCWg51MM9DjU5ouZueNrlAWv7
	/LXtvrY/YiPGQcPeDCAXm7FSxfwzYZU2wQUJCw2b0QiZfOwWcykWN7sVM6rYVNHDgicptqq4nPL
	K3fkU7XvDYmNPfFpVzzHpR0vJ4dtOTpjgWZXBB8y/xNZCGbA2Q1OL1AK/a+MhBp+awk=
X-Received: by 2002:a05:690e:134b:b0:677:cdbf:41ad with SMTP id 956f58d0204a3-67c3d7ab40dmr2809227d50.12.1794223585596;
        Mon, 09 Nov 2026 03:26:25 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bbffb49sm32385477b3.28.2026.11.09.03.26.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 03:26:25 -0800 (PST)
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
Subject: [PATCH v2 2/4] media: qcom: camss: vfe-4-1: program the RDI write master buffer size
Date: Mon,  9 Nov 2026 08:26:09 -0300
Message-Id: <20261109112611.94010-3-allan@fatecpompeia.edu.br>
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

The RDI outputs use the write masters in frame based mode. In that mode
vfe_wm_frame_based() only sets the FRM_BASED bit of WR_CFG and leaves
WR_BUFFER_CFG and WR_IMAGE_SIZE untouched: they keep their reset value or
whatever a previous line based (PIX) stream left there, so nothing tells
the write master how big the buffer is. If the sensor sends more data
than the configured format, the write master keeps writing past the end
of the V4L2 buffer. When the CAMSS runs without an IOMMU, as on
MSM8226 today (the SoC has one, but it is not described in the upstream
DT; its VFE 4.0 shares this register layout), that corrupts unrelated
memory.

Program WR_BUFFER_CFG in frame based mode as the downstream VFE 4.0/4.1
driver does (msm_vfe40_axi_cfg_wm_reg(): words per line, lines minus one
and burst length, IMAGE_SIZE unused), from the bytesperline and height
of the active format, and clear it again when the write master is
released.

Pass the active format to the wm_frame_based() op for that. The VFE 4.7
and 4.8 implementations, which use a different register layout, are left
unchanged.

Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 .../media/platform/qcom/camss/camss-vfe-4-1.c | 34 ++++++++++++++++---
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  3 +-
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  3 +-
 .../platform/qcom/camss/camss-vfe-gen1.c      |  5 +--
 .../platform/qcom/camss/camss-vfe-gen1.h      |  3 +-
 5 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 9cf1ccdb2..53ebc12c4 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -107,6 +107,7 @@
 #define VFE_0_BUS_IMAGE_MASTER_n_WR_UB_CFG_OFFSET_SHIFT	16
 #define VFE_0_BUS_IMAGE_MASTER_n_WR_IMAGE_SIZE(n)	(0x080 + 0x24 * (n))
 #define VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG(n)	(0x084 + 0x24 * (n))
+#define VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG_BURST_LEN	0x3
 #define VFE_0_BUS_IMAGE_MASTER_n_WR_FRAMEDROP_PATTERN(n)	\
 							(0x088 + 0x24 * (n))
 #define VFE_0_BUS_IMAGE_MASTER_n_WR_IRQ_SUBSAMPLE_PATTERN(n)	\
@@ -269,14 +270,39 @@ static void vfe_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
 			    1 << VFE_0_BUS_IMAGE_MASTER_n_WR_CFG_WR_PATH_SHIFT);
 }
 
-static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm, u8 enable)
+/*
+ * In frame based mode (RDI) the write master stores the incoming data as is,
+ * with no line structure. Program its buffer size in WR_BUFFER_CFG (words per
+ * line, lines, burst length) as the downstream msm_vfe40_axi_cfg_wm_reg()
+ * does, and clear WR_IMAGE_SIZE, which may hold a stale line based setup,
+ * so that the write master is bounded by the size of the V4L2 buffer.
+ */
+static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm,
+			       struct v4l2_pix_format_mplane *pix, u8 enable)
 {
-	if (enable)
+	u32 reg;
+
+	if (enable) {
+		/*
+		 * bytesperline is aligned to 8 bytes (one bus word) on the RDI
+		 * outputs, and sizeimage >= bytesperline * height.
+		 */
+		reg = VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG_BURST_LEN;
+		reg |= (min(pix->height, 4096U) - 1) << 4;
+		reg |= (pix->plane_fmt[0].bytesperline / 8) << 16;
+
+		writel_relaxed(0, vfe->base +
+			       VFE_0_BUS_IMAGE_MASTER_n_WR_IMAGE_SIZE(wm));
+		writel_relaxed(reg, vfe->base +
+			       VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG(wm));
 		vfe_reg_set(vfe, VFE_0_BUS_IMAGE_MASTER_n_WR_CFG(wm),
 			1 << VFE_0_BUS_IMAGE_MASTER_n_WR_CFG_FRM_BASED_SHIFT);
-	else
+	} else {
 		vfe_reg_clr(vfe, VFE_0_BUS_IMAGE_MASTER_n_WR_CFG(wm),
 			1 << VFE_0_BUS_IMAGE_MASTER_n_WR_CFG_FRM_BASED_SHIFT);
+		writel_relaxed(0, vfe->base +
+			       VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG(wm));
+	}
 }
 
 static void vfe_get_wm_sizes(struct v4l2_pix_format_mplane *pix, u8 plane,
@@ -313,7 +339,7 @@ static void vfe_wm_line_based(struct vfe_device *vfe, u32 wm,
 
 		wpl = vfe_word_per_line(pix->pixelformat, bytesperline);
 
-		reg = 0x3;
+		reg = VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG_BURST_LEN;
 		reg |= (height - 1) << 4;
 		reg |= wpl << 16;
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index 76729607d..308c845f2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -317,7 +317,8 @@ static void vfe_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
 			    1 << VFE_0_BUS_IMAGE_MASTER_n_WR_CFG_WR_PATH_SHIFT);
 }
 
-static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm, u8 enable)
+static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm,
+			       struct v4l2_pix_format_mplane *pix, u8 enable)
 {
 	if (enable)
 		vfe_reg_set(vfe, VFE_0_BUS_IMAGE_MASTER_n_WR_ADDR_CFG(wm),
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
index b2f7d855d..65df06a42 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -290,7 +290,8 @@ static void vfe_halt_clear(struct vfe_device *vfe)
 	writel_relaxed(0x0, vfe->base + VFE_0_BUS_BDG_CMD);
 }
 
-static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm, u8 enable)
+static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm,
+			       struct v4l2_pix_format_mplane *pix, u8 enable)
 {
 	if (enable)
 		vfe_reg_set(vfe, VFE_0_BUS_IMAGE_MASTER_n_WR_ADDR_CFG(wm),
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
index d84a375e3..f05676c2b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
@@ -66,7 +66,7 @@ static int vfe_disable_output(struct vfe_line *line)
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	if (line->id != VFE_LINE_PIX) {
-		vfe->ops_gen1->wm_frame_based(vfe, output->wm_idx[0], 0);
+		vfe->ops_gen1->wm_frame_based(vfe, output->wm_idx[0], NULL, 0);
 		vfe->ops_gen1->bus_disconnect_wm_from_rdi(vfe, output->wm_idx[0], line->id);
 		vfe->ops_gen1->enable_irq_wm_line(vfe, output->wm_idx[0], line->id, 0);
 		vfe->ops_gen1->set_cgc_override(vfe, output->wm_idx[0], 0);
@@ -244,7 +244,8 @@ static int vfe_enable_output(struct vfe_line *line)
 		vfe->ops_gen1->set_rdi_cid(vfe, line->id, 0);
 		vfe->ops_gen1->wm_set_ub_cfg(vfe, output->wm_idx[0],
 					    (ub_size + 1) * output->wm_idx[0], ub_size);
-		vfe->ops_gen1->wm_frame_based(vfe, output->wm_idx[0], 1);
+		vfe->ops_gen1->wm_frame_based(vfe, output->wm_idx[0],
+						    &line->video_out.active_fmt.fmt.pix_mp, 1);
 		vfe->ops_gen1->wm_enable(vfe, output->wm_idx[0], 1);
 		vfe->ops_gen1->bus_reload_wm(vfe, output->wm_idx[0]);
 	} else {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen1.h b/drivers/media/platform/qcom/camss/camss-vfe-gen1.h
index 6d5f96565..83856c0bc 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen1.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen1.h
@@ -44,7 +44,8 @@ struct vfe_hw_ops_gen1 {
 	void (*set_realign_cfg)(struct vfe_device *vfe, struct vfe_line *line, u8 enable);
 	void (*set_qos)(struct vfe_device *vfe);
 	void (*set_xbar_cfg)(struct vfe_device *vfe, struct vfe_output *output, u8 enable);
-	void (*wm_frame_based)(struct vfe_device *vfe, u8 wm, u8 enable);
+	void (*wm_frame_based)(struct vfe_device *vfe, u8 wm,
+			       struct v4l2_pix_format_mplane *pix, u8 enable);
 	void (*wm_line_based)(struct vfe_device *vfe, u32 wm, struct v4l2_pix_format_mplane *pix,
 			      u8 plane, u32 enable);
 	void (*wm_set_ub_cfg)(struct vfe_device *vfe, u8 wm, u16 offset, u16 depth);
-- 
2.43.0

