Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450391;
	b=MrL4DsR6Fb8R5+Y7v7+qH+i6gJUup3J/mB6anOJvVD1QwOcAycKkNHGFu/e7pcQmpMG6
	 EisbqkZvv24kxSx3vgpdGFmPG0okeCbYko3emyqKT3d+YokiTc7Z1NW4fY6iu5NW6PvwB
	 hRFHJs5VLOF3AdThhqdE5cBmdn7v/4qwWjnUoI4T+W6UPTcrTPctSpG/SNGDHuYWIj+SI
	 n47dul7pzu6Yjz/TRTxKDBuqTkT0bDPXGWwwHrP7dFho3md3g7xQbDUOeT4UA5oXRmH48
	 ROJYiOPLIjARRuBZhJ0/n2p9DRFS50VqzT9MrTJXL5aqL/FE6QwQ9RP6W89e1zNNr9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XmGfQWvcvFmnjKr+xP8taKEHDJYND7b+j1Gc4pD7Vlg=;
	b=Y+A0/3Wqi/r2xZrRnp1q0riVygD3K7saLF7W+NpjHGnQpnSxHLHNi0rnq7q14mSPW7sF
	 E5X/j4faWFEhgM2MXutPsGx+0tGKuvQQWwmiEH/Jfmf7Kt4kqKb6NCF9DrPBdZoj08yJw
	 4xsGTWnL8EhC/JmE5i0wImEi2uufRJws3AmsrBgFSgfQ1Jj/9kOc9CPUUwjwjoSRPgLR0
	 oCiB12nd3twxgFbbpOcxTWyEkHufNQFwiaZ9B/pLwN9T17RuUsHhYU4vvLux3S5Za4S4O
	 /WMOkzrYBRTIa1sTxPkCP1Sq6t+VJiFX2PQjO7CZKO4bwN0pzC+yNI9aDH06bJ4nR2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nTVaLVj4;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1D8606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 12:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC1D8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nTVaLVj4
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15dd124bbe7so1050697c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 05:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450390; x=1794055190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmGfQWvcvFmnjKr+xP8taKEHDJYND7b+j1Gc4pD7Vlg=;
        b=nTVaLVj44Ub7z74cDC1wz876qdD4BKmWpGUd3aathGvyrzUmTNX/U3B41UPTFFFqjN
         x70xLLXEJR0xkZSG2Hv65YNG7+qMPGDvnGGH1Y6MJSXnCL/rRVHa8/tVJW9LJIoYlEA9
         6dXLZ30iqlNeaVxJlOXtpdzaym+La7NnDByhobhHux8WMrYR54d3/v/kt7kyefLtQDqx
         7q8SH8uUvxxsRgNDzao73J8zRBih/KHAA83YUuTGm+5mpJ+STug39hfBE/4SVHn+J1Sg
         qqxqi+l2Ygzq1WqLILBFDDg1fsnLdB/XIFsKTiXNxR9GrGrVJ5brPoJwKKqkfi/pVEPN
         p8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450390; x=1794055190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XmGfQWvcvFmnjKr+xP8taKEHDJYND7b+j1Gc4pD7Vlg=;
        b=O2rYyI/jBp+AMeDfvbnQ1Jd9KEbeQXl3F3bqBAccro6BGppwr2MnMX/Mrbn+W+pzG0
         0J2/UVwMjHOF+MWhKnKWqK+mYKX2B7z5Qm0tn6sRbMlQEhioXntkFpCmmSUBrReVjARP
         NjpTB4yWWlk0CAWzQjxMszZMA7MHj3/LsmT/5CS9722ibRQXOL9EIZuWW4xA9dD7Z62m
         6N511+jPORTwr8w9KhfH2QV7RzHw0rJ+eaC/i40rTvdp+WFGx4rJaDY6r5QNa2fVLqdF
         I0+ejceDOMvg1ebHdL+ADr33T83e9psAfyJwr+MEqTsKr8s98sjKr+0+B3ADVEkPSUOX
         hkuA==
X-Forwarded-Encrypted: i=1; AKwUvBzJa0SviSG5neJFYozlJeXJtgEczDQyZmNvqKh9uSXNFOXHauq5pWxgHUi0BzgkDaSGEMd10nWFDm1/SkSd@vger.kernel.org
X-Gm-Message-State: AFq9FYKFbdIYhwZRLKGcMlDR9hSYHPVswApxRsUj76xmwsBcr3Obmz4O
	TtzrW7mG+PsrNy42ttPw3ARpvb9RPdKMFatvN3IN2KlRldtdflQSjyn5
X-Gm-Gg: AYBFou0y+uo68Z0m4B4KQOMEEjj/YQoZgB2soqvoAH8n1+QPjo6BoOUmp7SfpC0fKzf
	dD6PGyMHsdbCE27fOf+MaXLLOtQGK9VCRS8raTis+iK47KXMJf9lPEguLerbIdp5qFws0WoriK9
	laCdEWJ5w6616z9sytR9b2q/56bNZwcapEiwjGDI/MrKHBG5fBNAzC/98coNH5vNDmCMhlFLQW/
	W1cYWj485DQ0CWD4OEWt0r8Wq298xIS6CLGw6/k6SUOZk30+UY3Fs6tiXivVFRLkkz0iwJKmkV7
	iPBXwwYce9YtivhWa8LVSc5XHaZkoG7SDL9QullCF+4qQPIhRIOJcMjjXw8vZRZCO6BXOqGr4Cl
	IEhvE4xUna7AaKX+4rrrF+iavljar70op8sNDkirGVpyImJRgYZlr7H6oq+6nbx7ccu5w6bgu8Y
	P/gcT2OXcUhkX2hnhFiYA9t4lyTcS2QnJk40/iw9CK2reHgB/iC0Rq+yD2A4BW4UX/FD00u7sBD
	pch4RMk7Ya0wbKt634kvOkeOahg55KA0r8Yv7SMoxiOHoDxnopJmBasA6OsYmgyMknVQ1RZxVSz
	PAI8kXicHFSRDKJIvvty2fX9BpfFwClPj5IbE9OIuMPAPrS4MgNwrFvhR0PqkZvo3ZjFtQ6ByBi
	FcQOBmija0ED1JEJGX6i2BeJOaUuR6nCzx5IHmSsiO8x7P1Rexsk51NW8Q91dUiKmKf+kzHqLbt
	+mbL9JuHMXvj4erZU=
X-Received: by 2002:a05:7022:5f0b:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1ac5cb18717mr6418421c88.40.1793450389793;
        Sat, 31 Oct 2026 05:39:49 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:49 -0700 (PDT)
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
Subject: [PATCH 5/5] serial: pch_uart: fix TX kfifo underflow on flush
Date: Sat, 31 Oct 2026 12:39:11 +0000
Message-Id: <20261031123911.3784690-6-samarth.colleges@gmail.com>
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
calling the driver's flush_buffer() hook. Since pch_uart does not
implement this hook, an outstanding TX DMA transfer may complete after
the flush and call uart_xmit_advance() for each entry of the flushed
transfer's scatterlist. This can advance the kfifo tail past its head,
causing kfifo_len() to wrap and the driver to transmit stale buffer
contents. The completion callback also updates the kfifo without holding
the port lock, allowing it to race with the flush itself. The same issue
was fixed in 8250 by commit 9e512eaaf8f4 ("serial: 8250: Fix fifo
underflow on flush").

Since the TX buffer is mapped separately for each transfer and the flush
hook runs under the port lock, the driver cannot synchronously terminate
DMA and safely unmap the buffer from that context. Instead, leave the
outstanding transfer running and mark it as flushed, allowing the
completion callback to unmap the buffer without advancing the kfifo.
Take the port lock in the completion callback to synchronize access to
the flush flag and kfifo state. This prevents the underflow, although
the data already queued for DMA before the flush may still be
transmitted.

Fixes: 3c6a483275f4 ("Serial: EG20T: add PCH_UART driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/pch_uart.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/pch_uart.c b/drivers/tty/serial/pch_uart.c
index 9505d255f09c..122025c4a0a6 100644
--- a/drivers/tty/serial/pch_uart.c
+++ b/drivers/tty/serial/pch_uart.c
@@ -230,6 +230,7 @@ struct eg20t_port {
 	struct scatterlist		*sg_tx_p;
 	int				nent;
 	int				orig_nent;
+	bool				tx_dma_flushed;
 	struct scatterlist		sg_rx;
 	int				tx_dma_use;
 	void				*rx_buf_virt;
@@ -750,18 +751,23 @@ static void pch_dma_tx_complete(void *arg)
 	struct eg20t_port *priv = arg;
 	struct uart_port *port = &priv->port;
 	struct scatterlist *sg = priv->sg_tx_p;
+	unsigned long flags;
 	int i;
 
-	for (i = 0; i < priv->nent; i++, sg++)
-		uart_xmit_advance(port, sg_dma_len(sg));
+	uart_port_lock_irqsave(port, &flags);
+	if (!priv->tx_dma_flushed)
+		for (i = 0; i < priv->nent; i++, sg++)
+			uart_xmit_advance(port, sg_dma_len(sg));
 
 	async_tx_ack(priv->desc_tx);
 	dma_unmap_sg(port->dev, priv->sg_tx_p, priv->orig_nent, DMA_TO_DEVICE);
 	priv->tx_dma_use = 0;
+	priv->tx_dma_flushed = false;
 	priv->nent = 0;
 	priv->orig_nent = 0;
 	kfree(priv->sg_tx_p);
 	pch_uart_hal_enable_interrupt(priv, PCH_UART_HAL_TX_INT);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 static int handle_rx_to(struct eg20t_port *priv)
@@ -947,6 +953,7 @@ static unsigned int dma_handle_tx(struct eg20t_port *priv)
 	}
 	priv->orig_nent = num;
 	priv->nent = nent;
+	priv->tx_dma_flushed = false;
 
 	for (i = 0; i < nent; i++, sg++) {
 		sg->offset = tail + fifo_size * i;
@@ -1150,6 +1157,21 @@ static void pch_uart_stop_tx(struct uart_port *port)
 	priv->tx_dma_use = 0;
 }
 
+static void pch_uart_flush_buffer(struct uart_port *port)
+{
+	struct eg20t_port *priv;
+
+	priv = container_of(port, struct eg20t_port, port);
+
+	/*
+	 * The kfifo has been reset. Let the running transfer finish, so that
+	 * its buffer is unmapped only once it has stopped, but do not advance
+	 * the kfifo for it.
+	 */
+	if (priv->nent)
+		priv->tx_dma_flushed = true;
+}
+
 static void pch_uart_start_tx(struct uart_port *port)
 {
 	struct eg20t_port *priv;
@@ -1520,6 +1542,7 @@ static const struct uart_ops pch_uart_ops = {
 	.set_mctrl = pch_uart_set_mctrl,
 	.get_mctrl = pch_uart_get_mctrl,
 	.stop_tx = pch_uart_stop_tx,
+	.flush_buffer = pch_uart_flush_buffer,
 	.start_tx = pch_uart_start_tx,
 	.stop_rx = pch_uart_stop_rx,
 	.enable_ms = pch_uart_enable_ms,
-- 
2.34.1

