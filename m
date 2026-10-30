Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377266;
	b=5cZjhO3Sz4BxpPaph5fU4oUDkfpUBlBBxE/FGYcBkyoVfxRVgvmjsYiE1fKQ/QKm/bIO
	 MKPr3TxGnCWFagvVzLPWSeVHjyJLtDRuh85dSOxpXsrCj5dU4dK1BWDzrDAy7LsQFusCU
	 2un1cWD/UqDLzZls619lhHsuYDDk/pr5zoU8220XqU2fl3J3iSVRFetDdd5uLN9orvDsf
	 V/rhUcJtutizZ7ix6oubAvHavHU/HnLjjiVIAsANYpw7kFIBSqCyHw1fDHk4PUDqr2XY4
	 ZjA2uDhmgLUYw0uxi0Pb7KYpT83rcfy84qmru9IzM2zMxU9lX+WHgSUWPHZfnD52c5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3LJfsKdpKDX4HmeIK5NT3BudGEfehV1hBOYrKs1Or3g=;
	b=ZrWkfs+xafR6SW9LomJ9yUe0WSIsTVPqe63AEPqOzQ6205RuZ2QurfAvu7q/j3E8QxDe
	 M6GQTKMdN76eQrH3jHcHcBHaDd/BAIFDojH+ItjOD3Uve/GP/8JJLpuaf4yXVjetNMhvr
	 RItr40xCguFwY0GHbB4CZ/odaxD5txQdu0+E4zMZHmcx0122iHLBzPVsPEOFYFW5RCkj8
	 MEGLuCSUKmkntd5qiazTbgIIo2bxmDB+U0ZWUHCGfV6V6BXLEe22KuhbWxoJl5rMBlSOf
	 ptczK3NF+Wa69jachqGQS5e3/gVXC6jz69Pk8w+iva+pV+0RsJSMqvXlfY1LSNwtm+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T59Jz92y;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CABB606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CABB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T59Jz92y
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-85c1135c286so560713a34.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377264; x=1793982064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LJfsKdpKDX4HmeIK5NT3BudGEfehV1hBOYrKs1Or3g=;
        b=T59Jz92y5UNIU2Se+frZiyeIsQvDV3jh66PZoH7Dmcv+1IxaZStmuHrav84KWe8tP5
         M1f2zVEWXxkysFGikV/NzJxHIDtyDZaWPtukJx8TqHRblxyD/L/e3twRnVAFpqTJprrw
         /VxoUUmfQsEjp017f7jXT9/+4sQ0ZsOEXwnFoZIBAqDyprHTaUJCxKQq4qivEweYWZxT
         4YWGoiWPCPV1vP8JC0DNszbPn6jCE//vjO7UsIarftEtkNVm4/JT7iXGFvZN2PZtzZZY
         rwOaxyO94uxo/P5YvHelDf62RQ7zkkSZgSIJSv8uahrJ3XMrNFzJt2Bgqr8m+iCMnBSE
         W98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377264; x=1793982064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LJfsKdpKDX4HmeIK5NT3BudGEfehV1hBOYrKs1Or3g=;
        b=dhN/TLBqJb68+fVPDyKLD1p9RodCJB6GXrh2jsWOA6ufGEtkcfgMzrRsTmmXb5l1ow
         I/cQEEmfKkk8PJfsv4BHfsCxQwCibop6p91t5R9qamSrJu10yLtDyODY2mhl8qCX8XeZ
         rxoQfhLWWh7uOFlzHI3M0r/gE8Ri7H8GMOAAq95/HIr5t8tPBaGKEM+S8JT42aDLYrXa
         pLN7hIAweuBswaChJQRJMZqvOkx6VgK3qmOzrnEwuBdkhxST3fRupR18c6MaK3sQUOcW
         zHnsusRYMMhlotsXctUGGjqqIjKhM1j5zqiApuCgg8C8QeltD9kFNov8VM25HkuJ4Mjt
         Mqew==
X-Forwarded-Encrypted: i=1; AKwUvBzTaRnFdlzE766fcMH5esbxlXizIC5SJ4GVWBBdhn/aSN2XBwQFa+KPgyj0zaDF3oCsJ99YEo2IjxmKz6ym@vger.kernel.org
X-Gm-Message-State: AFq9FYIIQBQ33XZQfbVPDrtdIrhwQDXPAW+J+WK1BryQ0z81ETJC8nHJ
	NwtgJIWkUtxqhdZMum6otm1rJI7fs3pniVvM0iFCLdMernvLdMoDSEJ8
X-Gm-Gg: AYBFou30h6g2nLBBtIf/OhzLo9V11n5yJW30BVyfvAt2ojRZD32glWOnLuhSXGZb0vJ
	1dSFe1QJ5/aHaSXImgAJQn721IAG7a0JFwpMtj0PqzuHfH14Si1iJbTYFoD7s2uOL6BA7Hz9mBY
	4+uOuxszY8l5TL149BxAdwAffsyNePnBKeiou+ZF7EggfYVml6JDDAghIfB6sUtdkAcqn10kkbX
	8trCRPCazTGfnENXpw6XI/0VpbKTgab5cfmmGCKH3ZV6JVx//+CQjYtnLMuqkPoBKmkpt3izqjJ
	o0U9hToeEIFV0B4gk5tu7aOUUh7D5fTZI3w0X9igGP5Xu7GhKYEPmD/ung4xbusCXmIBE0dUbE7
	T26cBu5Oi6JmJqErytTKvlNEGeTRt0Kc0IFqSDluqWFilm4a3CGhYCif1VcTf13cBnJ9E90eVzz
	FxufQM+oqCgYb4qsyzS3H36DtzZCwsHkNsvZ2pmuuqWiJFFlLQ5nnw9m0iX6Sha/yikuin6XmBX
	oCHaVEthduh1eNc18ez2kekyXWEQwqGcqANKFb5QDQ5Urm0yG24/+X+YdvwZqk4ts2ET0dtBZ3o
	fxESLJkbP2GNu0ZQ/nt4n+gveSohZJC0EGo3WsNpLbutzfjInZakwL9yFefe0wOLAQqdh/L/yO6
	E73iG4mVkGx8e6Prnuvjf7jECKJmcaSnRPeekM4vbXGIFB23MF2MjQxVhXtVS4g7e4kB7brom+X
	WGYBsdwo235oJdBrs=
X-Received: by 2002:a05:6808:4fd4:b0:4cb:f21b:6f8d with SMTP id 5614622812f47-5640dd9e77cmr2333862b6e.32.1793377264401;
        Fri, 30 Oct 2026 09:21:04 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:20:59 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2 2/6] mtd: nand: qpic_common: terminate DMA channels on transfer timeout
Date: Fri, 30 Oct 2026 16:20:37 +0000
Message-Id: <20261030162041.2998170-3-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
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

When DMA completion times out in qcom_submit_descs(), the driver unmaps
the descriptors' scatterlists without stopping the BAM DMA channels.
Since the issued descriptors may still be active, the RX and TX channels
can continue accessing the caller's buffer after it has been unmapped
and returned to the NAND core. The ADM path has a similar issue when
dma_sync_wait() times out.

Terminate the affected channels with dmaengine_terminate_sync() before
unmapping, ensuring that outstanding DMA transfers are stopped before
their mappings are released. On BAM, termination resets the pipe and
discards pending descriptors.

Fixes: 381dd24539a8 ("mtd: nand: qcom: add BAM DMA descriptor handling")
Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/mtd/nand/qpic_common.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
index 4f3e4dd76..250154a08 100644
--- a/drivers/mtd/nand/qpic_common.c
+++ b/drivers/mtd/nand/qpic_common.c
@@ -592,11 +592,18 @@ int qcom_submit_descs(struct qcom_nand_controller *nandc)
 		dma_async_issue_pending(nandc->cmd_chan);
 
 		if (!wait_for_completion_timeout(&bam_txn->txn_done,
-						 QPIC_NAND_COMPLETION_TIMEOUT))
+						 QPIC_NAND_COMPLETION_TIMEOUT)) {
+			/* Retire every issued pipe before unmapping its buffers. */
+			dmaengine_terminate_sync(nandc->tx_chan);
+			dmaengine_terminate_sync(nandc->rx_chan);
+			dmaengine_terminate_sync(nandc->cmd_chan);
 			ret = -ETIMEDOUT;
+		}
 	} else {
-		if (dma_sync_wait(nandc->chan, cookie) != DMA_COMPLETE)
+		if (dma_sync_wait(nandc->chan, cookie) != DMA_COMPLETE) {
+			dmaengine_terminate_sync(nandc->chan);
 			ret = -ETIMEDOUT;
+		}
 	}
 
 err_unmap_free_desc:
-- 
2.34.1

