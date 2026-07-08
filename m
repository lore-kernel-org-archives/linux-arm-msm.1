Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B643101D8
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 13:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516854; cv=none; b=ev/LfEEobsoRWitvv7RFcnO0Hq/V/ZczpkSkV1WcsEfAK4SYr31yjBx3uEo97LLtJNf449b2V4YtUcnAkVtaZ9g2SuHu800Hg7st0ursL6x99Kb094djVKzzbp3odZ4bvixlqyGoEeAtnzFj0aiu9xBUazBd2GX12WzZ4YYwvc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516854; c=relaxed/simple;
	bh=OdXr9buh7p6jJ6fdErV3EJUeKFck1B1EUKSJKzNY6qc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uaiBHARsAAGJd1f0nVZ43iJUleO91ghIfeNp0CgZWTDrl/ReHWuKo4M7Q7LlDiDAZq9skRsF7URueK6kq2Y/vcaC0FL7pw5ZViESVdifs5Heet+uKHelX2j/5iWCUaiLBCTwQqo0Rmvlg5cCAi8rV618Lr3lGgjw6dsG497sTQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyA7bZpC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LyA7bZpC"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c9b1edf2bdso9678815ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783516852; x=1784121652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mHfzCeJu6ryJc9c2Al2Kh80lix65mmf/MitGQxQ/Q3g=;
        b=LyA7bZpCwgW2IE2PV3r9Dd8/4xSPeu1bYN6661zfDHqj7DtNdRD4CfjGXkIWYZDkiP
         UCzjzk5udkHvqeOpQ8FqDVrFgt7+8pxyTwofhhODi8gqnT6k4nde/HeukF36AD5yBU/v
         5J9lNxcA6t3MgPiy3lUzZMAsUwftMGWAb0R9kr3vXVTG6QqUCH8AeIm+PkgcSEIV1e7W
         UsNxsTyUKcH73rphE0l21EdYG6CCpPznDSpo8v/aiahJQgUermURuNjwnoIvd3hyiU8v
         EwSaugvV3pSCxc3Zj6wNUTGKNyruU/GuiLy9r+57VMq58nBRWQmQA1s0M2fSNtxenRLN
         KE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516852; x=1784121652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHfzCeJu6ryJc9c2Al2Kh80lix65mmf/MitGQxQ/Q3g=;
        b=BMyrM0c8YVuXaeNsCwFu/aV+q1hJfsHhSOh4sZynZF9HNy1nX3aHc8LvnYHDsZRGCS
         RBsyONVhl7rUfvl1LaqmbKjT1a8GaNWRT40d/1ua3nQrxl1qPDAS26DMSAeMfAFa1xjU
         BrT2tt3PrYgadNeazPEpQMbEV96zmBWcev2nIOn8JpWnuZgvgAuxzR3C/mn98vkvb5Bk
         hxMr1Ne7e8hq4Ge5kwXXh3OFLeFOu95TwgW7mL+u9C2tnTH2FwGwfp1EzngzJs4Oa/p2
         3Mc0ctWMUCBUriT6bMQrvdgoujx3+1krFCTZXOYkX6UMtPcPLCaprQ5KhfcjqSPpe80C
         Kesg==
X-Forwarded-Encrypted: i=1; AHgh+Rq8ch7q12Ef+kJkZ0/l6p6EeV3BtKa3bxM6OLROuD02plifv6DtGNJ8ohZUVr0kc1VpYr0/1p+MhJmmdqGz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn2QKOd4/Gp8qc56b1Abh8zWvlOzZmn7gYKkCCqB0NsiVgxdZn
	VQRkLkiCW8HQov2PC2enRFGKqoab1yaK+k0vL21LcKUa1vM+zXvt4YH9
X-Gm-Gg: AfdE7cldLqYMeGuZo8Yrct6DEvKruuitg/oPSQsW1C0MiRbsnqFox2VjxrsnjtN4aKK
	raWGzKG5onSIGgOFPv1Be4oDkQUwFDNA4eeeYkDJZLdGVgNAKVcKLzQJSYjzsr50gxhgdOiOmcM
	34gU1xZvMA+Mdbbd7UfWhswhIAMbhECBrVV8t8bSauwaY8/3SC2GOF45KB9jw+nvgPuuqwoWB9r
	5K7JLwllntXciG//S6PpRtnG+pSirINiqJjsiemVR8rIMmwaRYzNujyt1ZL9GA8RC2sXJ3HJXl5
	VXTMJa/ZkUiqMEYx3Vl2xevf8Eh0ZhHDelhNk+SBG8HT3M4uF/hYHUmVDcvWTObjMj7saSiHB1d
	aq+hL0VMKyIjEIPo4/vZtYHVQALyvmA2yxtTJWDaAgKndGr8YAvsmAd6I/L3DEUIqqm5IydE=
X-Received: by 2002:a17:902:c402:b0:2cc:df15:91de with SMTP id d9443c01a7336-2ccea47c1eamr29734045ad.42.1783516852204;
        Wed, 08 Jul 2026 06:20:52 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb775sm28222045ad.2.2026.07.08.06.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:20:51 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Zong Jiang <quic_zongjian@quicinc.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] serial: qcom-geni: do not advance stale DMA completions
Date: Wed,  8 Jul 2026 21:17:26 +0800
Message-ID: <20260708131726.768692-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qcom GENI serial DMA TX completion path advances the transmit fifo by
the number of bytes recorded in port->tx_remaining.

If uart_flush_buffer() runs after the hardware has completed a DMA
transfer but before the DMA completion interrupt has been handled, the
serial core resets the transmit fifo while port->tx_remaining still
describes the old DMA transfer.

A previous fix avoided advancing an empty fifo by checking that the fifo
length is at least tx_remaining. That still does not distinguish the old
DMA payload from new bytes written after the flush. If userspace writes
new data before the stale DMA completion interrupt is handled, the fifo
can again contain at least tx_remaining bytes and the stale completion
can advance and discard those new bytes.

Mark an in-flight DMA transfer stale when the transmit fifo is flushed.
The later completion still unprepares the original DMA mapping using the
saved length, but it no longer advances the transmit fifo.

Fixes: 2aaa43c70778 ("tty: serial: qcom-geni-serial: add support for serial engine DMA")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 7ead87b4eb65..ab3dbee3e526 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -143,6 +143,7 @@ struct qcom_geni_serial_port {
 
 	unsigned int tx_remaining;
 	unsigned int tx_queued;
+	bool tx_dma_stale;
 	int wakeup_irq;
 	bool rx_tx_swap;
 	bool cts_rts_swap;
@@ -697,6 +698,7 @@ static void qcom_geni_serial_start_tx_dma(struct uart_port *uport)
 	}
 
 	port->tx_remaining = xmit_size;
+	port->tx_dma_stale = false;
 }
 
 static void qcom_geni_serial_start_tx_fifo(struct uart_port *uport)
@@ -1029,6 +1031,7 @@ static void qcom_geni_serial_handle_tx_dma(struct uart_port *uport)
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	struct tty_port *tport = &uport->state->port;
 	unsigned int fifo_len = kfifo_len(&tport->xmit_fifo);
+	bool tx_dma_stale = port->tx_dma_stale;
 
 	/*
 	 * Only advance the kfifo if it still contains the bytes that were
@@ -1039,12 +1042,13 @@ static void qcom_geni_serial_handle_tx_dma(struct uart_port *uport)
 	 * kfifo->in, making kfifo_len() wrap to UART_XMIT_SIZE - tx_remaining
 	 * and triggering a spurious large DMA transfer of stale data.
 	 */
-	if (fifo_len >= port->tx_remaining)
+	if (!tx_dma_stale && fifo_len >= port->tx_remaining)
 		uart_xmit_advance(uport, port->tx_remaining);
 
 	geni_se_tx_dma_unprep(&port->se, port->tx_dma_addr, port->tx_remaining);
 	port->tx_dma_addr = 0;
 	port->tx_remaining = 0;
+	port->tx_dma_stale = false;
 
 	if (!kfifo_is_empty(&tport->xmit_fifo))
 		qcom_geni_serial_start_tx_dma(uport);
@@ -1182,6 +1186,10 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
 
 static void qcom_geni_serial_flush_buffer(struct uart_port *uport)
 {
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+
+	if (port->tx_dma_addr)
+		port->tx_dma_stale = true;
 	qcom_geni_serial_cancel_tx_cmd(uport);
 }
 
-- 
2.43.0

