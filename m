Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702792;
	b=M75yjyy0gadrfe/XplWVebfygsYtotPHUJTI5QcGCRYMdqsXHYFaboxGNC8QXAeZAFdx
	 PzjXuu0kgh1WYmASgpT0T2fg1dB6HqXfOy8V9QxQAicKdB5NMrKj7cNHLmSqtHiYObBJF
	 vQ5MCm9Zm48ZKAh3aBJYlG5ceoJYLzCZjSDVeJwm7b8sjjdrvFRHbWUlATXHjN2evglcm
	 w4bx2l7vFIXwg/l852ArWQA3EPBU8Q7Kz5UazW4sAtotsd8UX/OA/OM9ER4a4DmtTdyxs
	 7HvcR0QvW725rdclyWBGTrGa35PrTzkFehoT0FL0lDBFJjHrPDbNobt8MEetpIl8T4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702792;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qTtoQav1e0mPKUJi3xGwyEJuXSQqz7+AIi65Xpjvqks=;
	b=BUJm1T8VaHxMprsYQANtgwPAyaU/dl9CVKtLWpIOamKJrFQTpZdE9Tgvy3GeI0dCAWou
	 ME6+aKBJuDQwDIgxVhjFsGnTl327nrAxWog7Ij/i/aTLFjw1VIxFPC9QPud+GKalb7R3f
	 5WRnMrEgt0OO1hIDmzHirj4R7n/nJo5ZHcI3Wfz7S3Boc9h8q/6XBAEjy2sWjntcq6YHP
	 19W7+UTgi3kDUisT8idXGV5gAA8uWE46rCyQztjV3XZsSZtdKFpZ9XaqlAtqBwsPOq1hr
	 pS79iprmFk8/d87R1e6WFRZBRZFET6Y5rnCV4R9ac4YhRp9ie/7atyrzSJWgxdLJwLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mYNg7xja;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A8A606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mYNg7xja
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460CC1F000CF;
	Thu, 26 Nov 2026 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795702791;
	bh=qTtoQav1e0mPKUJi3xGwyEJuXSQqz7+AIi65Xpjvqks=;
	h=From:To:Cc:Subject:Date;
	b=mYNg7xjauKUq3DGtXABXWAVcEK4uEr4zclFPym8iC8JbMgBbHSuAZWQl9Yu91HwSs
	 epPTm3viGzuQcuhGwWcIjzKwo9SbJdab9dIxwQK3q+lYAwvw5ZoqZG+uIxGRITxGed
	 unq99GPU+17FAJc4xubKvCO2ORQdt58S3VChW6fQO0dyinJTkpfJGmYk6O6yIZnabG
	 Y+UUsuIDH0WcXcH55EpNmtlQgyKuC5rkGwukNNyrEid9+YGw/nBuhPN/GiXWDa41Ma
	 9ebARrA1rIDqdxnqSo7fh4FQf5K51PxloamzkgzTFUweOJAqZGzp6Y5JRLlxqp9i0r
	 kx10pG7elvshQ==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Alexander Koskovich <akoskovich@pm.me>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Kavan Smith <kavansmith82@gmail.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi: Fix TX buffer pin leak on command transfers
Date: Thu, 26 Nov 2026 16:19:42 +0200
Message-ID: <20261126141942.335280-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
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

The DSI 6G TX buffer is allocated by msm_gem_kernel_new(), which pins
the buffer object in the KMS address space and returns its IOVA, but the
returned IOVA is ignored. Instead dsi_dma_base_get_6g() calls
msm_gem_get_and_pin_iova() on every DSI command transfer to get the TX
buffer address, and the buffer is never unpinned after the transfer.

As a result the pin count of the TX buffer object grows with every
transmitted DSI command, and when the buffer is freed by
msm_gem_kernel_put(), which drops only the pin taken on allocation,
the object is freed while still pinned:

  msm_obj->pin_count
  WARNING: drivers/gpu/drm/msm/msm_gem.c:173 at update_lru_locked+0x90/0x98
  Call trace:
   update_lru_locked+0x90/0x98 (P)
   put_pages+0x8c/0x104
   msm_gem_free_object+0x1bc/0x244
   drm_gem_object_free+0x1c/0x30
   msm_gem_kernel_put+0xa4/0xb8
   msm_dsi_tx_buf_free+0x2c/0x64
   dsi_unbind+0x20/0x40

Save the IOVA returned on the TX buffer allocation and use it as the DMA
base of command transfers without pinning the buffer again.

Fixes: 9fe041f6fdfe ("drm/msm: Add msm_gem_get_and_pin_iova()")
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 78f0fd259421..5a6fb1a5a890 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -153,6 +153,7 @@ struct msm_dsi_host {
 	/* DSI 6G TX buffer*/
 	struct drm_gem_object *tx_gem_obj;
 	struct drm_gpuvm *vm;
+	u64 tx_iova;
 
 	/* DSI v2 TX buffer */
 	void *tx_buf;
@@ -1261,6 +1262,7 @@ int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_host, int size)
 
 	msm_gem_object_set_name(msm_host->tx_gem_obj, "tx_gem");
 
+	msm_host->tx_iova = iova;
 	msm_host->tx_size = msm_host->tx_gem_obj->size;
 
 	return 0;
@@ -1422,14 +1424,13 @@ static int dsi_long_read_resp(u8 *buf, const struct mipi_dsi_msg *msg)
 
 int dsi_dma_base_get_6g(struct msm_dsi_host *msm_host, uint64_t *dma_base)
 {
-	struct drm_device *dev = msm_host->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-
 	if (!dma_base)
 		return -EINVAL;
 
-	return msm_gem_get_and_pin_iova(msm_host->tx_gem_obj,
-				priv->kms->vm, dma_base);
+	/* The TX buffer is pinned on allocation by msm_gem_kernel_new() */
+	*dma_base = msm_host->tx_iova;
+
+	return 0;
 }
 
 int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t *dma_base)
-- 
2.51.0

