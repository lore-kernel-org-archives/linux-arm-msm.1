Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450385;
	b=yulJ8Tw7oy29oOB3VKiS3LKAJtA7rfoWIZf+XZ22+UOFh7susHZkYWrD1H6z8BAUtiCW
	 TRbZVvqp2Fsbbx+TlV+88Dz75DYx+RaxV1gSHvrKVOWBG6Mnjmyms8R6jXb651oUp9X1u
	 49K6wFvXAFRZEROkvOTBWTvZT/pqk2E5CSMV6ZoOKKjG1C7YGaSeNiE+3wVRDOSHGBLNA
	 OfWLhaawmI+UfsYn+Q/QBN76OMgUBFRe9k+pwgzTI1M4LW3+8o0KwPxftgSJlT2DnwJ/c
	 5exm//MQApnsUZUo+IWtKYUDLOwfKzdd5/XNn4YKU+LJ8ANfVgB0RM5v0BgvMj6gpLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9lYqqX+robUheapeipscKVQntLqlVNgi48T6H+L8K2Q=;
	b=ZhrsnJYS7lT00VUWirIEwjM28GU3lG3ccQ2r6JBTBOknZlwBsJyH5DF16l0jvm4KWVMA
	 izZoWzT9onUiKEB91ARU+INtTBuDYB8IXzflimBf7uQfuZSjLe61A3JKsrq6cSs37XFiF
	 H52OdWwI8YxHZz22sM1/LEWlhbGEx1SD81fM47nyJoOLMUiQpKoFZRHBNQE1/YzN9jwII
	 koAebt4UDLz1UqwQvzhJ8gs2wV/h48zWLTxNkBW9JzEezWxUh9rQUyxwewJcC8Am/hulI
	 NPrL4ZOqU3DwadwivjjAmUqEwhWkkq4AyC4Lup1GoTl7E+hT2npSnuHZaBs7ennU37Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOrUj+85;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AA1606A322
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 12:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2AA1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOrUj+85
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3514b90bb89so3072541eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 05:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450384; x=1794055184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lYqqX+robUheapeipscKVQntLqlVNgi48T6H+L8K2Q=;
        b=gOrUj+8519T2pA46LxOphlK1zNFHwSN41ceBiRGJAgYAb5PSzf7IzjnkBf4OH/X4N0
         p6oBNz6J7VIsngicPqtxG/17AOwKIq7cl5/ISU9x4OPErIOcGINgrkKF6t3DwBkFgpSN
         o4O3SHgkqsosqoaSquQdPSH+3kfb2VqMsnUkEfVjZRc9rJp20boJZKeTjac491DsYIub
         msYaNqqw6ER6GxNFDtA8qmu23PvlDuN/kwhYo5NwBq1VCk0m+qbn/FFNtlHaVCJOAIGx
         PLg9dqwGx6snsttOmfsuPjcSLJfSexSnpQhw1uoP5o8ntynqvRcGT8THTK047zi/zi94
         xWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450384; x=1794055184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9lYqqX+robUheapeipscKVQntLqlVNgi48T6H+L8K2Q=;
        b=Sty4r000s+/c2pU8IVLcxSUzhlMCH511cBntcCiet9t3QB97+Ahv+kceREf8PxpZH+
         0eYUTrpGYy719YeMVUBQlrfuGSuTZGCNygGB2+/Gb8tY07Z1CPcMcyZUjZwoWqAWNRBE
         6os/djbPS127cpTxiT/mjFUzhJDg7G9eZjv0GI7vIw03jOudL+d4AB/jEJzAlv6Ot2uC
         z0V/najpgds/UhPPc4CtxTPZaQomCWfSUq5X1afHKZYc8rSICn1vi+k+R7qiQgFRScN1
         QlGmB2P5SZAQsY8Q9hMie2DFE6aZxG0ZWu+XG4eoPonT3JkTq1yAb5DbQdCf0K+tpAFS
         hsvw==
X-Forwarded-Encrypted: i=1; AKwUvBwaLSf1pW52WV4yGVROGoBkKNkZkjD8FmgGou+n/ZLscfKAjd+dl03mAJ2Ay0mX4Q0TKo6iV9uEHZPvePVi@vger.kernel.org
X-Gm-Message-State: AFq9FYLYWqOdX38/QdMVqumUn/GKzL17T2PS8D0fO6KtkAqvmL2G8BPt
	SmbbEPQOgBtCFWuXkPU2hCo7mDHv2GSHGQvTLYuSWv+XNHIOqbV8lGdx
X-Gm-Gg: AYBFou202Tt+TkrchTr829gp9AtWCBeaU495ga59bXUwPu88NPRA3RIPYmbUihceQSo
	BbTj+4iNmv9kAccG6gHU8lImGgQUvbuv7CxDnp9e9m1jwVrlt9gz2LesAQMUjlm+/GqSWlK1O1L
	CdwQwnPobjmKIXdFEENmKjPh3naPCauu+0RVAwuuNcl10n9d9U84IRMIvwuAS7VLmhH5v37bpuQ
	xCsKejmDHp8NOIWfUi1n3CB+8sjYvhror8YnusfFolq1pSPB9vhfbbMJwdTKnIJXc+6oqavxQNj
	/nPZUZisenVu53RIPGvRAQ3yfP797nFauq4hSr31v94zusfUu7a+OXf5knY4wJdoVH5d3+gc5yt
	aSUP4EO5zPw5c0UV9hrRFpMd3ttQrcM9kmUC/E/yMvXP77ZRzXOKIzxCxxIDGVHJlqHxWvVoc+K
	sQ6rs62GdKZk06bcLNb693x07CqOXOyZukCnoP9xISHW4pppQN38L9Rd82jiV6+a/xzjlCRkkz6
	OHb27ms+BRGXmoF6jzAfv1PL7UTB1+njfWwpJNeqeThJD6t5gMxTbPhp4sgw4fTuCcET3f4A7F5
	/nPAiGWIZRkaacwoDNTrkK5oJ1HVgwfrU2lYyVuH8R34/LTwT1JwI1Or4+Ltz+q/Q2So/9MoJr/
	U1eeJrRe2x7saf4dsi93mD4wam66ysULuk5yXBil1Bl008D7PHaLiJoJ2iFB+nK0apl6TNhPt4U
	rSsgRcNYblYQkr6Q==
X-Received: by 2002:a05:7022:ef07:b0:188:ea93:6cf9 with SMTP id a92af1059eb24-1ac5eea1fe9mr8982380c88.43.1793450383881;
        Sat, 31 Oct 2026 05:39:43 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:43 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] tty: serial: msm: fix TX kfifo underflow on flush
Date: Sat, 31 Oct 2026 12:39:10 +0000
Message-Id: <20261031123911.3784690-5-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031123911.3784690-1-samarth.colleges@gmail.com>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
 <20261031123911.3784690-1-samarth.colleges@gmail.com>
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

uart_flush_buffer() resets the transmit kfifo under the port lock before
calling the driver's flush_buffer() hook. Since msm_serial does not
implement this hook, an outstanding TX DMA transfer may complete after
the flush and call uart_xmit_advance() using the flushed transfer's byte
count. The existing check for a stopped transfer relies on tx_sg, which
the flush does not clear, so it does not catch this case. The kfifo tail
then advances past its head, causing kfifo_len() to wrap and the driver
to transmit stale buffer contents. The same issue was fixed in 8250 by
commit 9e512eaaf8f4 ("serial: 8250: Fix fifo underflow on flush").

Since the TX buffer is mapped separately for each transfer and the flush
hook runs under the port lock, the driver cannot synchronously terminate
DMA and safely unmap the buffer from that context. Instead, leave the
outstanding transfer running and mark it as flushed, allowing the
completion callback to unmap the buffer without advancing the kfifo.
Clear the flag when preparing the next transfer. This avoids the kfifo
underflow, although the data already queued for DMA before the flush may
still be transmitted.

Fixes: 3a878c430fd6 ("tty: serial: msm: Add TX DMA support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/msm_serial.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index bfa44b01c3e9..a9eca971e9ff 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -185,6 +185,7 @@ struct msm_port {
 	bool			break_detected;
 	struct msm_dma		tx_dma;
 	struct msm_dma		rx_dma;
+	bool			tx_dma_flushed;
 };
 
 static inline struct msm_port *to_msm_port(struct uart_port *up)
@@ -428,6 +429,19 @@ static void msm_stop_tx(struct uart_port *port)
 	msm_write(port, msm_port->imr, MSM_UART_IMR);
 }
 
+static void msm_flush_buffer(struct uart_port *port)
+{
+	struct msm_port *msm_port = to_msm_port(port);
+
+	/*
+	 * The kfifo has been reset. Let the running transfer finish, so that
+	 * its buffer is unmapped only once it has stopped, but do not advance
+	 * the kfifo for it.
+	 */
+	if (sg_dma_len(&msm_port->tx_dma.tx_sg))
+		msm_port->tx_dma_flushed = true;
+}
+
 static void msm_start_tx(struct uart_port *port)
 {
 	struct msm_port *msm_port = to_msm_port(port);
@@ -479,7 +493,8 @@ static void msm_complete_tx_dma(void *args)
 	}
 
 	count = sg_dma_len(&dma->tx_sg) - state.residue;
-	uart_xmit_advance(port, count);
+	if (!msm_port->tx_dma_flushed)
+		uart_xmit_advance(port, count);
 	sg_init_table(&dma->tx_sg, 1);
 
 	/* Restore "Tx FIFO below watermark" interrupt */
@@ -503,6 +518,7 @@ static int msm_handle_tx_dma(struct msm_port *msm_port, unsigned int count)
 	int ret;
 	u32 val;
 
+	msm_port->tx_dma_flushed = false;
 	sg_init_table(&dma->tx_sg, 1);
 	kfifo_dma_out_prepare(&tport->xmit_fifo, &dma->tx_sg, 1, count);
 
@@ -1549,6 +1565,7 @@ static const struct uart_ops msm_uart_pops = {
 	.set_mctrl = msm_set_mctrl,
 	.get_mctrl = msm_get_mctrl,
 	.stop_tx = msm_stop_tx,
+	.flush_buffer = msm_flush_buffer,
 	.start_tx = msm_start_tx,
 	.stop_rx = msm_stop_rx,
 	.enable_ms = msm_enable_ms,
-- 
2.34.1

