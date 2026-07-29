Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68311431E5E
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785361508; cv=none; b=HW0Drwu7Iu2ju7RPef0qQm2b7XWD8qoyi7FK/fMj4YR0O7NY+0P4aPk2UDNxN3UZSLyA4vqYxJSEOWHTD9Wlg//RCJKm3PC4bi9H8HLJx4pKgwaCNw+1FbGVLxyPAhiVD1ewS/3aRWvUCj+OIONJiSvAmcWdJVgmDAXxSeykx2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785361508; c=relaxed/simple;
	bh=5MozMqaHVwUsG8YUDbkKbzwlMXhM9qaF/0dB3kJ1YJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0Bi3PgQ8Z7Dq7WLjYmWpfvaalQ/UkThiwM7PlVTphdbbmJB/a9IVSAAP8ikQLHJsyP8ayhrJ78zaKEOPnE9MCUOSKCDIqb547QHHf3uRmS/w1MsLnw8idewupNf/YtrLJR6RbCnLA4Ckiz6I/EHanTiJ7NQ+IAgoGvFZyIPrtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oog+XPOF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kAfG+LT1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oog+XPOF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kAfG+LT1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TL6shh2882025
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2fRfFb4BU78fdqWvQqw+0Qg2swZ0c0DiUV7sBynd1KU=; b=oog+XPOFYMpmoFJD
	vbIDglad9S7zR9HO7Xcmt3iWDjQYwIU66ie4vMDcZaIYeizv4kaw9B66m4wBAf1a
	zje8zT8Ygeqx9fBy48WXcKfEKrWNlFQSwTYGeyJGIL/CEKcNfcIALW+uh8arRYth
	LyeUPdL7ZAhxmlUH3RE4tys+1HrzQPaYtzzqLL+iNaW5XNC7yrgn0xPVXj026sHZ
	aDFN0tTnnEjUw9iMvatuHQxpSbF/uEhguWPfu5NVo04YxBSGaYiIY9KW4GjqTTgD
	e1nYoaFFqNssDCZ+0Nw+mOzmDI2WxEaTv7bdOS7Fo58KyXi9o3Ptb93B74NbDul3
	X91mtg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqs4t83v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:44:59 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-43cce86b0c4so1743370fac.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 14:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785361498; x=1785966298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2fRfFb4BU78fdqWvQqw+0Qg2swZ0c0DiUV7sBynd1KU=;
        b=kAfG+LT1tzgv1FbjyaqOpFhkuNtkg3DTwuIG5viFvq7hkhVCmdAVbuwPeJw/9pbng4
         KlkMJ9FcOVN7JbKx/to3yw02zDoQlfzGN00VLNV8wsIsk5KQ7uhqvbKH+KEMPsQoOtxh
         4bStYd0wadb4SvxVCQChIOK18uyHmFJNZfTTR2Tg7cGtLWdUscOpZeM9kW2hVIuRJkwv
         2cB42dwWk69Y5Nst9boMP9pjtn8Cc5/EGNqUaEzdL4Mpw5hH5tVCNGJiIeUPtXXrztO5
         3zsokFyJwnQtbW7NGp0t7W+miB97KluOy/zoVHJ6OBml4cPOiRev41gHamCN60VSgeK0
         bQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785361498; x=1785966298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fRfFb4BU78fdqWvQqw+0Qg2swZ0c0DiUV7sBynd1KU=;
        b=qtFbu0fcFt+YtqRp4sFCZNjjacH0XvaqO/GzIg0sqmVMAQXXBJj9kcQr9xkwhXdfN8
         FvKp3fo9fb0fEMxauuRzXVUi0yuPMmtQPQxExZMQCV6/riHK1ZRYxhRzAJbtMJnFsC5N
         imG6mejsuqY5iSKoeDegfQzgso51jl42wndQFRzx9LuFjXPnGPxv3blx6KfpvcAoZJ2Z
         vEmMq+HdDsXxv3YjwZ2fCvlip0P2ssEbq+bcl5ciFaYVoYqzuJSngNOuV5raRg0IeFeS
         wRH1f2ofVozDXOvupt65iXWYV5VC03A8tCi71PXyFlZi0V01xXwdmPqqiOhwufWKPVlj
         c6mw==
X-Gm-Message-State: AOJu0YwL0ENPOBWSfAVIqrUFcmUcVQfTLie9JnhJDHx6AIf4kUBsdz1n
	u11K0ha1pODc9OZWP7WfRIyOEIzhdRsY8/gQA4dCU44L8B6ANmGUri2pcvKzfnvdAaG55zaY6HJ
	BhOQeQrWRty3W7mSapDVkWG0m06icFwy1KEx6NHMliotajnfcRa701gZsMKuodHSflGDu
X-Gm-Gg: AR+sD12rMPtik5BIuZbLDI0xuUW7yNhRfGmU3cKt+ANgO+tN+CV/qpkMgdWwWk2Gaw3
	3dnouX9ggb/1AYE2uwrpMBNir+/vhjBmGSlkwbftmR0qrdg7JD8R7yzog6Dtr8sbHaeJXb9mQqQ
	20Ovv3R3eLn/z8sh24b/nUjrxxW0ZhsmXkCKMyrQzEL2VmK4ovbC9qm+hdGO5Y2mi2+uIMx2dRg
	7ZnJgG9qXDk1gN8sfyvqLge2218pMTZvDRKY3t95lvp1aFolVl/oecdhnTy8xF/wnhgr2H5TWiA
	orDlR9ul/L538S+qEjD8sm91LJ1jUilxoNLKxOyYSacgWelOBqZy5jjhCN7+pjbZNfIGDc+JomK
	uyULz2XOyvxVVIBQXpCk=
X-Received: by 2002:a05:6870:d411:b0:447:1ceb:52d3 with SMTP id 586e51a60fabf-458c13f4aefmr53524fac.31.1785361498523;
        Wed, 29 Jul 2026 14:44:58 -0700 (PDT)
X-Received: by 2002:a05:6870:d411:b0:447:1ceb:52d3 with SMTP id 586e51a60fabf-458c13f4aefmr53513fac.31.1785361498094;
        Wed, 29 Jul 2026 14:44:58 -0700 (PDT)
Received: from [172.17.0.3] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458c0df60fasm90790fac.13.2026.07.29.14.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:44:57 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 21:44:55 +0000
Subject: [PATCH 1/2] serial: qcom-geni: Convert console to nbcon
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-qcom-geni-nbcon-v1-1-3053b96465ed@oss.qualcomm.com>
References: <20260729-qcom-geni-nbcon-v1-0-3053b96465ed@oss.qualcomm.com>
In-Reply-To: <20260729-qcom-geni-nbcon-v1-0-3053b96465ed@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9647;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=5MozMqaHVwUsG8YUDbkKbzwlMXhM9qaF/0dB3kJ1YJg=;
 b=owEBfAKD/ZANAwAKAQsfOT8Nma3FAcsmYgBqanRYTXl2GfBoXfhEEAyu9udhVKmcw68VCRsPP
 n0z0ttJMbqJAkIEAAEKACwWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCamp0WA4cYmpvcm5Aa3J5
 by5zZQAKCRALHzk/DZmtxVHiEACzPxvhvdEKQMG4A66iBfAohBFUUgmxzffsdMFE3vFU/7L7WoC
 7axqtRAp/4iR7yQ5OMHiHsf5okN9zBpkC1L7UW+3OSrvcyGI+EPbwXN/XPcjc0+oMaFZwJPfow/
 VzRY/+Oo2CvVKrkMrd8bZJ6v+Ht0xzzIzLOU+A/p4+pGIePhPQiHULD/TUSMRsa7+2xZ30v/5ib
 j8ppJ6xdYuDranln/D2wK/EqwAVApk0Mh4BwQBRuiLdbyUfyiogI2mmElmOaiDDGyb/EiekcHEz
 e2Iv24oEmZBXUZFC+urCBtT76I1W/qN6WXuWNxjhXrxzQXGNbLfnGtnJV8zP3v5hMMUAO/+5d3x
 /RN8P3JOFqO8Vj90/u0rwpw6j+2w+eJz4RPO6P0KExtotl9Le4S0usqlpAOwiJVIJ+mb1pEfSRE
 LIp9bd2hT8Soq6o4/soguRSKQGP7QVNyUyzt64MQlEuslYMik4Ny7h8hoa9DXGwjV/1m2i3Y8yS
 Ad3bFDvs3VQCqtMO53obRWIg9EzMQwHc9mLzrIlGV3BupkMlxhmNLgbazfEGqJZ1t9930kcipXQ
 U4RyYE4v1R+ZhqD5DCs42xpJxleVk95GpLMXSlRax2Q/JjKL7c3GFCv93v/qo94mB+49MVnd1G9
 WtFAT+5gq2bYNcPSlviD2xG0TlUVXPwhSnA==
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: pl1hN2OrPgCMahggYCzYhB8UCPR3S8gF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE2NCBTYWx0ZWRfX8MxxAx49UY4B
 jKZkj61BMtWC6kB/e6dKbelnrRqL+nVRQR1B74vGtsgi9P2YNuLqCf6TL5HG7dm1v9B35/yTuDL
 U05Og8UDHnFwPl9c/ebQ9ZwDUmzkEp0=
X-Proofpoint-ORIG-GUID: pl1hN2OrPgCMahggYCzYhB8UCPR3S8gF
X-Authority-Analysis: v=2.4 cv=WZQ8rUhX c=1 sm=1 tr=0 ts=6a6a745b cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IAdBKCrz7ruhCMxJt2gA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE2NCBTYWx0ZWRfX3HLaAiE55wjm
 ud+EI9l0Lqev/1zHNT6DW4CBlcc++L1ngcPMCxiSSL0cSuWdGVkTwUq2Cn3rG0WxHgAUL8dgp44
 /9uDQIrna/rsrGyC3G5zvrUgbFDWGpUZSFi5hl8ozc2yVqMjCSpwhY6XwZJJ39RqSLNmo0nDUOE
 cKpE+1o0YjtEhRbwelTALO0cp5ec8cLjNvuxBNZgwQZcuGLRVyBQWX5rZ+ufshS/s9PwzacaBH0
 go0qEtloF8NfFpcpUF51I97WB7cBe9c2tQqtYgU3G+9POhxCLjerMY1boKVkhc4htQk1kDAvnQE
 HUKAfLgDKmK97KRZB2eTe4qXwQ9rMW/Gpgo4dLuXbxeBecmn8T82ZFl9x1Zev7RLb61iXyg2shE
 VK9ebrhLFkR2BAAA8rVuDDrIe4YjAwSg56TryEiNtmn9B+WS9MlyN6F9b4dKlxp+WslooXBurO0
 0MSEojdeHdbRazpZ2NQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290164

The legacy GENI console writer serializes every message around a
synchronous polled M-side transfer. It blocks printk callers for UART
wire time and cannot provide atomic output while normal console output is
active.

Convert the console to nbcon threaded and atomic writers. Use the UART
port lock as the device lock and bound threaded M-side commands so
urgent diagnostics can take over atomic output. The threaded writer is
batching the output in 32-source-byte commands, a value chosen to
balance the command setup overhead with atomic-handoff latency.

Atomic output can cancel an active normal TX command. Use irq_work to
resume queued TTY output afterward, honor flow control, and prevent the
deferred restart from accessing the port during shutdown or removal.

Assisted-by: OpenCode:GPT-5.5
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 166 ++++++++++++++++++++++++++++------
 1 file changed, 140 insertions(+), 26 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 67b14fda4ff9..08427390c173 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -16,6 +16,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
+#include <linux/irq_work.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/panic_notifier.h>
@@ -89,6 +90,7 @@
 #define DEF_TX_WM			2
 #define DEF_FIFO_WIDTH_BITS		32
 #define UART_RX_WM			2
+#define CONSOLE_TX_CHUNK_SIZE		32
 
 /* SE_UART_LOOPBACK_CFG */
 #define RX_TX_SORTED			BIT(0)
@@ -153,7 +155,8 @@ struct qcom_geni_serial_port {
 	bool rx_tx_swap;
 	bool cts_rts_swap;
 	bool manual_flow;
-
+	bool tx_kick_enabled;
+	struct irq_work tx_kick;
 	struct qcom_geni_private_data private_data;
 	const struct qcom_geni_device_data *dev_data;
 	struct dev_pm_domain_list *pd_list;
@@ -168,6 +171,8 @@ static struct uart_driver qcom_geni_uart_driver;
 static void __qcom_geni_serial_cancel_tx_cmd(struct uart_port *uport);
 static void qcom_geni_serial_cancel_tx_cmd(struct uart_port *uport);
 static int qcom_geni_serial_port_setup(struct uart_port *uport);
+static void qcom_geni_serial_start_tx_fifo(struct uart_port *uport);
+static void qcom_geni_serial_resume_tx(struct uart_port *uport);
 
 static inline struct qcom_geni_serial_port *to_dev_port(struct uart_port *uport)
 {
@@ -539,49 +544,123 @@ __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
 	qcom_geni_serial_poll_tx_done(uport);
 }
 
-static void qcom_geni_serial_console_write(struct console *co, const char *s,
-			      unsigned int count)
+static void qcom_geni_serial_console_takeover(struct uart_port *uport,
+					       bool preserve_tx)
+{
+	if (qcom_geni_serial_main_active(uport)) {
+		struct qcom_geni_serial_port *port = to_dev_port(uport);
+
+		if (preserve_tx) {
+			if (port->tx_remaining == 0)
+				qcom_geni_serial_poll_tx_done(uport);
+			else
+				qcom_geni_serial_drain_fifo(uport);
+		}
+
+		qcom_geni_serial_cancel_tx_cmd(uport);
+	}
+}
+
+static void qcom_geni_serial_console_write_thread(struct console *co,
+						  struct nbcon_write_context *wctxt)
 {
+	struct qcom_geni_serial_port *port;
 	struct uart_port *uport;
+	unsigned int offset = 0;
+
+	port = get_port_from_line(co->index, true, NULL);
+	if (IS_ERR(port))
+		return;
+
+	uport = &port->uport;
+	if (!nbcon_enter_unsafe(wctxt))
+		return;
+
+	qcom_geni_serial_console_takeover(uport, true);
+	if (!nbcon_exit_unsafe(wctxt))
+		return;
+
+	while (offset < wctxt->len) {
+		/*
+		 * Printk records can be much larger than the FIFO. Limit one
+		 * M-side command to 32 source bytes so atomic console output can
+		 * take over between commands instead of waiting for the record.
+		 */
+		unsigned int count = min_t(unsigned int, wctxt->len - offset,
+						   CONSOLE_TX_CHUNK_SIZE);
+
+		if (!nbcon_enter_unsafe(wctxt))
+			return;
+
+		__qcom_geni_serial_console_write(uport, wctxt->outbuf + offset,
+						 count);
+		offset += count;
+
+		if (!nbcon_exit_unsafe(wctxt))
+			return;
+	}
+
+	if (!nbcon_enter_unsafe(wctxt))
+		return;
+
+	qcom_geni_serial_resume_tx(uport);
+	nbcon_exit_unsafe(wctxt);
+}
+
+static void qcom_geni_serial_console_write_atomic(struct console *co,
+						  struct nbcon_write_context *wctxt)
+{
 	struct qcom_geni_serial_port *port;
+	struct uart_port *uport;
 	u32 m_irq_en, s_irq_en;
-	bool locked = true;
-	unsigned long flags;
-
-	WARN_ON(co->index < 0 || co->index >= GENI_UART_CONS_PORTS);
 
 	port = get_port_from_line(co->index, true, NULL);
 	if (IS_ERR(port))
 		return;
 
 	uport = &port->uport;
-	if (oops_in_progress)
-		locked = uart_port_trylock_irqsave(uport, &flags);
-	else
-		uart_port_lock_irqsave(uport, &flags);
+	if (!nbcon_enter_unsafe(wctxt))
+		return;
 
 	m_irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
 	s_irq_en = readl(uport->membase + SE_GENI_S_IRQ_EN);
 	writel(0, uport->membase + SE_GENI_M_IRQ_EN);
 	writel(0, uport->membase + SE_GENI_S_IRQ_EN);
 
-	if (qcom_geni_serial_main_active(uport)) {
-		/* Wait for completion or drain FIFO */
-		if (!locked || port->tx_remaining == 0)
-			qcom_geni_serial_poll_tx_done(uport);
-		else
-			qcom_geni_serial_drain_fifo(uport);
-
-		qcom_geni_serial_cancel_tx_cmd(uport);
-	}
-
-	__qcom_geni_serial_console_write(uport, s, count);
+	qcom_geni_serial_console_takeover(uport, false);
+	__qcom_geni_serial_console_write(uport, wctxt->outbuf, wctxt->len);
 
 	writel(m_irq_en, uport->membase + SE_GENI_M_IRQ_EN);
 	writel(s_irq_en, uport->membase + SE_GENI_S_IRQ_EN);
+	nbcon_exit_unsafe(wctxt);
 
-	if (locked)
-		uart_port_unlock_irqrestore(uport, flags);
+	/* Restart TTY data left queued when atomic output canceled M TX. */
+	if (READ_ONCE(port->tx_kick_enabled))
+		irq_work_queue(&port->tx_kick);
+}
+
+static void qcom_geni_serial_console_device_lock(struct console *co,
+						  unsigned long *flags)
+{
+	struct qcom_geni_serial_port *port;
+
+	port = get_port_from_line(co->index, true, NULL);
+	if (IS_ERR(port))
+		return;
+
+	__uart_port_lock_irqsave(&port->uport, flags);
+}
+
+static void qcom_geni_serial_console_device_unlock(struct console *co,
+						    unsigned long flags)
+{
+	struct qcom_geni_serial_port *port;
+
+	port = get_port_from_line(co->index, true, NULL);
+	if (IS_ERR(port))
+		return;
+
+	__uart_port_unlock_irqrestore(&port->uport, flags);
 }
 
 static void handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
@@ -738,6 +817,29 @@ static void qcom_geni_serial_start_tx_fifo(struct uart_port *uport)
 	writel(irq_en, uport->membase +	SE_GENI_M_IRQ_EN);
 }
 
+/* Caller holds the UART port lock. */
+static void qcom_geni_serial_resume_tx(struct uart_port *uport)
+{
+	if (!uart_tx_stopped(uport) &&
+	    !kfifo_is_empty(&uport->state->port.xmit_fifo))
+		qcom_geni_serial_start_tx_fifo(uport);
+}
+
+static void qcom_geni_serial_restart_tx(struct irq_work *work)
+{
+	struct qcom_geni_serial_port *port = container_of(work,
+						      struct qcom_geni_serial_port, tx_kick);
+	struct uart_port *uport = &port->uport;
+
+	if (!READ_ONCE(port->tx_kick_enabled) || !uport->state || uport->suspended)
+		return;
+
+	uart_port_lock(uport);
+	if (READ_ONCE(port->tx_kick_enabled) && uport->state && !uport->suspended)
+		qcom_geni_serial_resume_tx(uport);
+	uart_port_unlock(uport);
+}
+
 static void qcom_geni_serial_stop_tx_fifo(struct uart_port *uport)
 {
 	u32 irq_en;
@@ -1182,6 +1284,11 @@ static int setup_fifos(struct qcom_geni_serial_port *port)
 
 static void qcom_geni_serial_shutdown(struct uart_port *uport)
 {
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+
+	/* Atomic console output queues tx_kick without taking the port lock. */
+	WRITE_ONCE(port->tx_kick_enabled, false);
+	irq_work_sync(&port->tx_kick);
 	disable_irq(uport->irq);
 
 	uart_port_lock_irq(uport);
@@ -1281,6 +1388,7 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
 	uart_port_unlock_irq(uport);
 
 	enable_irq(uport->irq);
+	WRITE_ONCE(port->tx_kick_enabled, true);
 
 	return 0;
 }
@@ -1627,10 +1735,13 @@ static void console_unregister(struct uart_driver *drv)
 
 static struct console cons_ops = {
 	.name = "ttyMSM",
-	.write = qcom_geni_serial_console_write,
+	.write_atomic = qcom_geni_serial_console_write_atomic,
+	.write_thread = qcom_geni_serial_console_write_thread,
+	.device_lock = qcom_geni_serial_console_device_lock,
+	.device_unlock = qcom_geni_serial_console_device_unlock,
 	.device = uart_console_device,
 	.setup = qcom_geni_console_setup,
-	.flags = CON_PRINTBUFFER,
+	.flags = CON_PRINTBUFFER | CON_NBCON,
 	.index = -1,
 	.data = &qcom_geni_console_driver,
 };
@@ -1946,6 +2057,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 
 	port->private_data.drv = drv;
 	uport->private_data = &port->private_data;
+	init_irq_work(&port->tx_kick, qcom_geni_serial_restart_tx);
 	platform_set_drvdata(pdev, port);
 
 	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
@@ -2000,6 +2112,8 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 
 	atomic_notifier_chain_unregister(&panic_notifier_list, &port->panic_nb);
 
+	WRITE_ONCE(port->tx_kick_enabled, false);
+	irq_work_sync(&port->tx_kick);
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
 	ida_free(&port_ida, uport->line);

-- 
2.53.0

