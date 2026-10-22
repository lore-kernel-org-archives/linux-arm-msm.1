Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697855;
	b=G2KbMAhuAE0sTwaXH7fQOfga8+SGTIDpTAG5JtUnVseiS/wAJ6UP0Iv3GwqhL3jEXQtI
	 xcJW9ggRQEBG5SLBsUwriSDh4ond9LjB0XMuldz97fIkd5rO6Dy6fHS32fwyj8mkZQfeU
	 iLAwSV5hJ+3gcEQbF2sO+cBNcOXS41+xg2k4V3tpRz2mA4l32t+EQOrGztFGiWFxJzg6e
	 4asOWeod5c6b7UMrbmXEbyqwj4gp9W9GasG/AX7A9AGSYzidaAO2e8rIpRI4ptJaZ3G8e
	 ZaKb4Alnckud9J2TAbOH1zW1C6vt4+DokbraUr6BLcOA9JO47Y3eryq3kDWfzOHbgMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697855;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:Subject:To:Cc:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=zruHm+Z4bL+3axK6aqnpOgZvWXYiNs30pnk8GtDEznU=;
	b=jS/4Xy7OO1Ub/eVCEbCpdwzAXq8M4AZZhu2g4S9J2yM/7LPZskzsQcezoCEQQp97rKcm
	 b2EM9LdHLFRnkMLXUd2OfraUN5hZD2R31/SpjO2TdKSZz/Ef6hJfgV/xemmd4XWqKxGfq
	 IbluCG+3PD+cBaXRYnlPOj1Ke7kalyg7DpZdiusboA9w8V3oOblEhvCEBi75yGZZFD2kv
	 EbUXQzJo31Q9lGy3SRK4AqjxhFyTrjSfuCRWUMs5HQvyYRHLPc+eirEE3RSb6mD7sqUHQ
	 1goxVaATtduNhBRkT1HrWz/6AAMxux2s95qcz4OeUskv1i8Wz/jFnS4LoeJZPL80p9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=knzvP4VL;
	arc=none smtp.remote-ip=185.70.43.170
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF7D606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 19:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF7D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=knzvP4VL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1792697847; x=1792957047;
	bh=zruHm+Z4bL+3axK6aqnpOgZvWXYiNs30pnk8GtDEznU=;
	h=From:Subject:To:Cc:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=knzvP4VLCE90UhcdR7hbEXmAP8NeNXIA70LCHJf/OdPewE83CQMlPvtbqKHbF1woK
	 2o5JrrA5PLTBRS0/dSaq74kdwXAA+M7Fa5remjy3lrNBveD+YjstkKDSmoFgDbNw3j
	 Y5xs+YU8zVBULnU5SySVn5gzk3D7U0v6CDZEF1hjuZYlWVm8fwTyAf79HlG5Z8Rh5X
	 olpDi5hHGG0EKC50CZotUUbSVRU/y/ZhB4d1HzKNPSlLbT4yJsvp1XtM+7nn/2AqAD
	 JYA3F9K+5mLci6u1ppQ4qHAMdHkcubsum0lgKBzSDTvND8dI79A1jkeRmz0dYDjx8D
	 VX4ug37y6Y+gg==
X-Pm-Submission-Id: 4j9byY4Qypz1DDrL
From: Michael McAllister <me@michaelmcallister.org>
Subject:
 [PATCH v2] serial: qcom-geni: Set UPSTAT_AUTOCTS for hardware flow control
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 22 Oct 2026 20:36:39 +0100
Message-ID: <179269779969.81501.3877980314174207182.geni-autocts-v2@michaelmcallister.org>
In-Reply-To: <20261021202603.42888-1-me@michaelmcallister.org>
References: <20261021202603.42888-1-me@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

qcom_geni_serial_set_termios() clears UART_CTS_MASK when CRTSCTS is set,
enabling hardware CTS flow control. However, it never sets UPSTAT_AUTOCTS,
so uart_softcts_mode() also selects software-assisted CTS flow control.

If CTS is deasserted when uart_change_line_settings() samples the modem
status, serial core sets hw_stopped and stops transmission. The GENI
driver does not handle CTS-change interrupts, so asserting CTS again does
not clear hw_stopped or restart the transmitter.

On a Motorola Moto G10 with WCN3950, this can stall Bluetooth setup in
tty_wait_until_sent() while qca_setup() closes the serial port. A captured
stall had one byte left in the software transmit queue, hw_stopped set,
and CTS asserted, with the UART powered and its interrupt enabled.

Set UPSTAT_AUTOCTS under the port lock when CRTSCTS is enabled, and clear
it when CRTSCTS is disabled, to match the hardware configuration.

Fixes: 8a8a66a1a18a ("tty: serial: qcom_geni_serial: Add support for flow control")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
Changes in v2:
- Use scoped_guard(uart_port_lock_irqsave, uport), as suggested by Jiri Slaby,
  removing the flags variable and explicit lock/unlock calls.

v1: https://lore.kernel.org/linux-serial/20261021202603.42888-1-me@michaelmcallister.org/

Hardware validation used v1 with explicit lock/unlock calls in the Motorola
Moto G10 Linux 7.2.9 port. This revision preserves the same lock scope.

Before the fix, a Bluetooth power-cycle test captured qca_setup() blocked
in tty_wait_until_sent() through serdev_device_close(), with:

  software TX pending: 1 byte
  hw_stopped:          1
  UART status:        0x1 (UPSTAT_CTS_ENABLE without UPSTAT_AUTOCTS)
  SE_GENI_IOS:         0x1 (IO2_DATA_IN clear, CTS asserted)
  UART IRQ disabled:  0
  UART IRQ masked:    0

After the fix RTC suspend/resume worked, followed by Bluetooth discovery.

Built drivers/tty/serial/qcom_geni_serial.o for arm64 with W=1 and
CONFIG_SERIAL_QCOM_GENI_CONSOLE=y against the base below.

AI assistance: Codex analyzed the saved UART diagnostics and serial-core
source and ran the build and style checks.

 drivers/tty/serial/qcom_geni_serial.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index a851b8f0ef..aff26a8351 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1596,6 +1596,14 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	writel(bits_per_char, uport->membase + SE_UART_RX_WORD_LEN);
 	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
 
+	/* CTS gates TX in hardware; no CTS interrupt updates hw_stopped. */
+	scoped_guard(uart_port_lock_irqsave, uport) {
+		if (termios->c_cflag & CRTSCTS)
+			uport->status |= UPSTAT_AUTOCTS;
+		else
+			uport->status &= ~UPSTAT_AUTOCTS;
+	}
+
 	trace_geni_serial_set_termios(uport->dev, baud, bits_per_char,
 				      tx_trans_cfg, tx_parity_cfg, rx_trans_cfg,
 				      rx_parity_cfg, stop_bit_len);

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.50.1 (Apple Git-155)

