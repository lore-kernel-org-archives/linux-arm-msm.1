Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B2842DA53
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184887; cv=none; b=GTmq2IucnSlqMzOFSKNqJRIerN+U30YeUVkap/rZdUqId6k3PALhpLdVCNij0e50whwtixBknEBrZ+MtA2e0LMfWcreil4QQxHF06y9ObdmxbhqnWeKfXt+aQpwWW7vlyc9ONiZHc/h7n/VATnCh56V1gPbibRXvJ12DCW8XdCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184887; c=relaxed/simple;
	bh=1+RjEKy/8bef6J9AgL5WU4GH6Mh/0Ws3rnJl/ZvqY7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJG639hHdmeVE9QWWb0/4ulLVL01gpqejIEHhdWABV45g6L4XxScJTfH0me0u2CY7FiAe+k2JFSj9ll2nQtoCnH9WjSLTU20/+E8zuMDPVVA7zb7STBxucoFh0ZkYcRDILWZ1sBgNCjUvK+qSpDczK68JscvtYUOhfjrA6ADrm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9B9tcxQ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9B9tcxQ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8485b358552so3309859b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184884; x=1785789684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unmJIhiFh80mB2cfi/xAL5DrDya+ekG2bWj53vn2wK8=;
        b=f9B9tcxQw5H74uduiDilmoGZutbErowi4mV2gbeeLCrPZB52fz3DMGoC6T4QUiEhN6
         vPytHPxMRuA7vAF+I9zBrPIhn9dBuyPYD4fJHE72MxMvV3MT9+H8zuiNubgbhd8cQDBB
         Z1kPXCjP2Qnl6E20QgCMtbPyXHrgtpi0PigB8NFF5qYxpKTcr55PCmjXPpdd9NlxPpNc
         UwppG0olkT0Bilw1YtUsDi04moEZD6TKzOqUtufzFcq6kY+gAWnk3e2kcPT/BwcKXUyl
         TZ4MQQWRS87DoK2od8aylBbFTrPNn3CYxoJTIja/OluLns/AYxgcj5Zq+kQWXgyFa1WT
         xd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184884; x=1785789684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unmJIhiFh80mB2cfi/xAL5DrDya+ekG2bWj53vn2wK8=;
        b=OCyvmOOowlOwv7QwcdBZGEXopomy6RLNXRjV6QybJtdmxMZxRqU6ttDh9EhLRj0rJO
         yZxGeDZtAeDxw2jJwshnXf6fmnFJN/RRPU9McUkc12wVKKId6WsLqhzL/gTXllM2ymrO
         ygBHlzlO2SA4KcEKXb0VuBbUAotvLxFLrFirJjR5E9gSbQ/Ij9UD8FHYXOWK4ja/1RPy
         DzHcn/XWhfUuL4B1XkbDwNMu3XzeQmVY5Zv7kDiIuatRTjr0A5ttvh63jZ6z0z57fx8H
         hRckMX0Kdp2P6cpCO/k6/GGZCC1CbkpEh6kO6xvUVPp10JFKY3Ib8Rk50yS+KXSzCYYR
         4sMA==
X-Forwarded-Encrypted: i=1; AHgh+RplQiZSUSYtHQnEmzz4z3h+DbwJuzBxMviF86AQakOY3NMQJ5fScqXCmBOfMSaUCrotnpI6NX4G7FRFwFdF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcytkizku57rYK6CePGxcFz5kIr7OqCT3kBJ5h+sfwpwTXz3Zn
	s0fQmKNQqfV++CLu6g5RtEeucZPTnSr1x4FoyhyKP/NITXOq12Rc7Y4J
X-Gm-Gg: AR+sD136qSq3Umyirl4GlGC07W49wFvVk2udoOj0mDClt0KjjqAV/1u0E8Ft835S7OC
	wJVUKhHfuIPUgSIzfsFUQ+CMi3BVLnBVJDtp2SXgQyut3Foz/lAppxoBS0HIFHScLU/Y8m5hCMC
	6bGgAqZyczVwUFfb3RBRlg9odRxtK7mePazb4mcrMF43V0LPMZt7ifZNiGao/QE9CpLVcu2DZ1B
	YHTbKX3iUwNHzusY7G42WSGiv7GPKWMfEuKNQ9bGYp5EoUL8wAKdu3a4dDrQliIZhAfsxUIDb3B
	0FUw+kc5yix6nxtpvOnd7kCuGKbTPlt/AbZiyUJKu37b556afhlsoEZgO+ivS7y6uvAoEpC7q5H
	BjjqBwmBWIfI8GGoJT2d0oCHy5Er+zSBoY8SpRE5SGRQgJji/ilClkePYcFrmEjeuk8B9lyjRI6
	ml7XjTUTIvczHJd0Q=
X-Received: by 2002:a05:6a00:e8a:b0:848:731a:fa47 with SMTP id d2e1a72fcca58-84e8d0fc273mr831213b3a.59.1785184884453;
        Mon, 27 Jul 2026 13:41:24 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:41:23 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 60/64] dmaengine: bam-dma: use dma_chan_kill_bh
Date: Mon, 27 Jul 2026 13:39:22 -0700
Message-ID: <b4d1a1d4b56f548e157a4d9d8bed785f507dc157.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virt-dma now dispatches completion callbacks through per-channel BH
work instead of its tasklet. Cancel that work during teardown before
channel storage is released.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/bam_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 1bb26af0405f..74bc2fe445b3 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1387,7 +1387,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	dma_async_device_unregister(&bdev->common);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
-		tasklet_kill(&bdev->channels[i].vc.task);
+		dma_chan_kill_bh(&bdev->channels[i].vc.chan);
 err_tasklet_kill:
 	tasklet_kill(&bdev->task);
 err_disable_clk:
@@ -1413,7 +1413,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
-		tasklet_kill(&bdev->channels[i].vc.task);
+		dma_chan_kill_bh(&bdev->channels[i].vc.chan);
 
 		if (!bdev->channels[i].fifo_virt)
 			continue;
-- 
2.43.0

