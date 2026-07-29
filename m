Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A873F86EE
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785361510; cv=none; b=LEgyl0PZw1g/oAZKLcnd4wc4qBlDKGO5jpsTKdnPQnF/iJ8Itm2hB9bTU+XVEBDqNIyxMk+9zcF8x51+b6/MILsa4LETZtBni7g5OK9M70IONRs/IKEgwp3k9SuPQQp7XiqiJSYxBpySYfu/u22yMq43oce0yjCYAiDpZ6X691Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785361510; c=relaxed/simple;
	bh=kv44ZEjy3ZP0s2Nas8Qmh3qPDOgWebewvW9u3N8+MwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qGMZEW6R4vMHOTeQ838gmqj76+ESLO4c6/MdUrGJCNvKnu6CDHsLB5UKAn2J6HM62G6b3MMZ6IbEAN5xpouu6Ne8YXnHAVhkHM7Mp3g36O+3ph5acPmfH2stU7j0Lqjf04HVnu82XaXevP+wBDa6LNG8/xpo8rh9LKgAkG+UpHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSwoEnF0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/2R1+QM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSwoEnF0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/2R1+QM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TL71QH2882535
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xs/Sr2R5B0Dpl7w5nFhbkCkIwCfAP0xajmyappd8ITg=; b=kSwoEnF0WvoYR0nr
	diaMl+UZLqYohscEiaOWg2mRC+DMQG4Vb6aSvy00bXVd42yPCx1fdMXO+rT8vqi7
	INqFDxw6ZlECmHjCYIjRvqjdVEa88dy+ogf5bPDDy21QGgAKn6iE294tMBkCwATz
	WbfQs+VFFt6l7EvctpRPD7IXMCZjXCgPP9l0MyBeNws5Qsu6ApEdyB3OzMXPWngG
	rgp/N01VJJ+mVOR9w+6Cm4MDRCeiMlwmcIaUtTA5W4cR+a8KnBeVgkfuTSSfWFbU
	qXNvqT1KJI0EGdx6C7qax0bPraSPEidzYRVYWH0GZctKPaZfzK3GoYwZGLwmQzza
	Kn5aPQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqs4t83v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:45:00 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45134682038so648259fac.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 14:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785361499; x=1785966299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xs/Sr2R5B0Dpl7w5nFhbkCkIwCfAP0xajmyappd8ITg=;
        b=J/2R1+QMb2HHM7pjvicJ5BloPn5T1jkV1IWAhaiBenKSlTTsbP1xGjggpAD0JtOVLJ
         1jp+g42kDydcFOC1SkhCu6TRUSqCpAz6MqSUIX+MwbIdlOvXKQVlI40rLStHrDtnD9zy
         IryYInaBKsy+5rqr7tcQZkKMi/jjOiRaUo7gAWPWnpT6CM/27vvNn1VsOSit/0Al5Thi
         Afv6yXhsVihWdMCDVvVDTtPQVKnZeJkbZky/iw6Uhl4kdQDlmPW8qA9BTaP+TPfklrAM
         8f4OxclcuhrtJruAgJt9FsbUnZEnYtxR1zrIACtwJlCk2VYLJzwy2py/92wpynRHJezj
         D6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785361499; x=1785966299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xs/Sr2R5B0Dpl7w5nFhbkCkIwCfAP0xajmyappd8ITg=;
        b=Zovm+F22/nxXKKlCHKYMDAmGdpPQxhkqIoL3dTW8i0jJhCY706Hdio3Qd/CeWKuiAy
         c5JvbD25pGyec4/5aHrGElbc3KtIZ4HV64mX6/EQpNk6EEhZ0rgZ43nlz88DJWkcO9Nc
         tnjEfIngPYY5FN+stAx2FpX2dRBe3TDFIEQ0QrgvdSbdrYr1FU6sZxCHcMq0qHJCgNo6
         qI+IuyL84Ih/4czrG6j9DTMvbqB1UCiapbA2k0geO2qRpQVkatuvk8ht0GutxcrDqsdS
         hfXeUi8BPE61tR/sT4SzKQ54mQ20YGou7QDlvsM/Gsmxu1PDN6gSXckJJGjnY+Z5V7U6
         nnVw==
X-Gm-Message-State: AOJu0YwXDF5rCqN5YQJVit5tw60/5vKd8aSo/cys+aS8e/Ypy+KidRaU
	vYzwXKIPyBnOqPhl07GZBEOzO9DIOyWydcfExaxYk7U4wh8pPqV0F1VszvJL9Cs5E6kIuFG2L+t
	niScyn6jJcIENh3x21xy7UwCJNxKMbytN8BkimITzNe+6IoBxc4T/mHrGmCm2MtvLoUpu
X-Gm-Gg: AR+sD10gK1ax5rJqw2gUrHOUJTOqWi2igPBEmlK6V27d6vsxcYMAkeVRv1JuwWEieeN
	RB4BjC0HvVyjlgEVfnqfMNuXTWEAepVKgxQj3hf+ZxbI1dowJRwUjqwpIZj4LXL2Itjbkm/d6iV
	k0llqNBhJWln8Ml6M5xq3xMw7AeFej7Z3N4x8f9UFNrWQ2CN4Gh957tdW5iYeJBAhP681UnrDtQ
	tnxoCVq/xRw9XyAIRiqxXsTHbyxniVGjG2RGzHxW/at5by9fb5S+KgAc8yjtl/0txSjaMFfcPtM
	b6SW2oWNWWD3hP3CCy+fegTIHkey9bMbZOkUvJAETTrjMa0SJSAyBrRHH2kgppxFrR4xfHOCYSj
	pHyTNO8zGrF2JoRh5ii0=
X-Received: by 2002:a05:6870:2891:b0:456:9c4a:2684 with SMTP id 586e51a60fabf-458c1b7f584mr45080fac.31.1785361499413;
        Wed, 29 Jul 2026 14:44:59 -0700 (PDT)
X-Received: by 2002:a05:6870:2891:b0:456:9c4a:2684 with SMTP id 586e51a60fabf-458c1b7f584mr45061fac.31.1785361498913;
        Wed, 29 Jul 2026 14:44:58 -0700 (PDT)
Received: from [172.17.0.3] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458c0df60fasm90790fac.13.2026.07.29.14.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:44:58 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 21:44:56 +0000
Subject: [PATCH 2/2] serial: qcom-geni: Keep FIFO RX active during console
 TX
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-qcom-geni-nbcon-v1-2-3053b96465ed@oss.qualcomm.com>
References: <20260729-qcom-geni-nbcon-v1-0-3053b96465ed@oss.qualcomm.com>
In-Reply-To: <20260729-qcom-geni-nbcon-v1-0-3053b96465ed@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9990;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=kv44ZEjy3ZP0s2Nas8Qmh3qPDOgWebewvW9u3N8+MwE=;
 b=owEBfAKD/ZANAwAKAQsfOT8Nma3FAcsmYgBqanRYFWDd+KUn7EDCeivDIGdWU79W9ZeFX2h9t
 AG8d5HtHd2JAkIEAAEKACwWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCamp0WA4cYmpvcm5Aa3J5
 by5zZQAKCRALHzk/DZmtxaiQD/93WrJ96ablUKf5U/4lNztQU96tCqiBL/NSiSnp1wmuepZ9HzG
 om/5d9iimWYYlF0cD6WIShLBNEcxPmM80IcgorFbtVDNaAxtqALOikAofB29bxwQxWrc3caEJsJ
 sXWJPGFCH1gzH6IqNDs6t4rqpYETt6t8P2y6yJAgAfLFLDTqCn/V0xe28h2p9xz3nTlThiqD+8a
 idB2gYH+5fU137JUuwqlbB8Euy4ag8MHJfdoSQeYQ2NAMe/2Da+ujSaQxdcMrCsZAtLxiTNk2SX
 Qmpu7KIS4+hC/GTFWnba20lEwhRTgT846PtHLn5Z6So0b7tgISWa9xS0JaIWcKJsetLLVoFvpwA
 dOFsiRJNqQoM8gWeSo5nj2AHiQfhiau9odn3jnhtSPr7rvxGr4XHO7YPY9o1Xg6yTt3dTCyeGkR
 IIaQkhMPeK9QqqXvdHuHUQNokUIlvb96SoV4qKveSjEo1b6zq5IogvV/1OCaDU9eBI3knTuPOZS
 +p5zWfebqLnBUa0WRXZQyzfrPdSJ1Gcjo1CH9PiT67/qa9ewgfsTqkgZN9x50amuUSLRCkNSsi5
 eDggg/1xEDdpZUoU6Pd8o5P8dWFCaPw+OhnVsQ1m2uOga8YLG5tZ5tWs8f7XGS16tpC5hmmVqMz
 A+QtWCzlGhtJ/sDoIamOkdJof6v/3h2E9Nw==
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: ypI3YFtwLhB8HOZ-SYYmV1rqVpd1f5Mq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE2NCBTYWx0ZWRfX7hbXOKbMvUtA
 DhTa7veK/GaM6TBLT9A1sRBup2kH2x/df/ivE5U3HNxG4EY6r5aBCXkVDyqLbhp1iPyNQ4BUPvd
 ZMsVpKJM3Bn0ocqO6zO8x/AjDk1XrUU=
X-Proofpoint-ORIG-GUID: ypI3YFtwLhB8HOZ-SYYmV1rqVpd1f5Mq
X-Authority-Analysis: v=2.4 cv=WZQ8rUhX c=1 sm=1 tr=0 ts=6a6a745c cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BH2kQmxFGeWdPTRWxwgA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE2NCBTYWx0ZWRfX5BnuZcHs5/gN
 +bXd6CkkFmNFDgN/PFwDpMVBeALgWTSVOwf+Ih6Z1kwu+bEisrsSZojAJRKWXgopxnCOCS5q/PE
 GT9BAhYg9ldzbKflJ3RcxzNL+5R7KbAz2DJzJuz3IGouXwPzZLpt/AThfmtPQpwKUR2T6mRzt+1
 AskBZH1raBV5pzcOJ7FeQm206v5gwFDUyc2x4DriQfY9LE69/GlpICVCyUHI8+kQKUDRfi3BI77
 ipvFJrxd0NoIXt4bgTO3/XUdWQ24TsFxto0ghXjDW10FF7skD3CeNNGQIsW81RR/N5h/seKn6tj
 Tfp4xHmIJ9Pirkbg9ckRsx2zH2rCYWP8emm2jFpsPGtWnD+hlcphTisu7gurQiL0uZNYPodPP2p
 u/C9RVgsuvV9LSNAotPzL0iDUYtNQIlndW4HUc0MjmelFovvCkRsZyMlB8nC2sp2UQndO+CDW/g
 EveV6MHMQgaA056DodQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290164

The GENI main sequencer handles console TX while the secondary sequencer
handles FIFO RX. Before nbcon, the legacy console writer disabled both
interrupt domains while it performed a long polled M-side transfer. This
left the small S-side FIFO unserviced, allowing console input to overrun
and be lost.

The nbcon conversion replaces IRQ masking with the UART port lock, but a
threaded console write still prevents the RX handler from draining the
FIFO. Keep S-side RX enabled independently of M-side TX and drain it
while refilling each bounded console command. This preserves interactive
input during console output.

Atomic output masks only M-side TX state, leaving FIFO RX handling
independent. The threaded writer can also detect a SysRq character while
it drains RX, so defer delivery until device_unlock() drops the UART port
lock, as the existing IRQ path does with uart_unlock_and_check_sysrq().

Assisted-by: OpenCode:GPT-5.5
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 112 +++++++++++++++++++++++-----------
 1 file changed, 75 insertions(+), 37 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 08427390c173..a473d5521067 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -173,6 +173,7 @@ static void qcom_geni_serial_cancel_tx_cmd(struct uart_port *uport);
 static int qcom_geni_serial_port_setup(struct uart_port *uport);
 static void qcom_geni_serial_start_tx_fifo(struct uart_port *uport);
 static void qcom_geni_serial_resume_tx(struct uart_port *uport);
+static void qcom_geni_serial_poll_rx_fifo_locked(struct uart_port *uport);
 
 static inline struct qcom_geni_serial_port *to_dev_port(struct uart_port *uport)
 {
@@ -493,7 +494,7 @@ static void qcom_geni_serial_wr_char(struct uart_port *uport, unsigned char ch)
 
 static void
 __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
-				 unsigned int count)
+				 unsigned int count, bool poll_rx)
 {
 	struct qcom_geni_private_data *private_data = uport->private_data;
 
@@ -525,6 +526,8 @@ __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
 		if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
 						M_TX_FIFO_WATERMARK_EN, true))
 			break;
+		if (poll_rx)
+			qcom_geni_serial_poll_rx_fifo_locked(uport);
 		chars_to_write = min_t(size_t, count - i, avail / 2);
 		uart_console_write(uport, s + i, chars_to_write,
 						qcom_geni_serial_wr_char);
@@ -593,7 +596,7 @@ static void qcom_geni_serial_console_write_thread(struct console *co,
 			return;
 
 		__qcom_geni_serial_console_write(uport, wctxt->outbuf + offset,
-						 count);
+						 count, true);
 		offset += count;
 
 		if (!nbcon_exit_unsafe(wctxt))
@@ -612,7 +615,7 @@ static void qcom_geni_serial_console_write_atomic(struct console *co,
 {
 	struct qcom_geni_serial_port *port;
 	struct uart_port *uport;
-	u32 m_irq_en, s_irq_en;
+	u32 m_irq_en;
 
 	port = get_port_from_line(co->index, true, NULL);
 	if (IS_ERR(port))
@@ -623,15 +626,14 @@ static void qcom_geni_serial_console_write_atomic(struct console *co,
 		return;
 
 	m_irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
-	s_irq_en = readl(uport->membase + SE_GENI_S_IRQ_EN);
-	writel(0, uport->membase + SE_GENI_M_IRQ_EN);
-	writel(0, uport->membase + SE_GENI_S_IRQ_EN);
+	writel(m_irq_en & ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN),
+		uport->membase + SE_GENI_M_IRQ_EN);
 
+	/* Atomic console output takes priority over an active normal TX command. */
 	qcom_geni_serial_console_takeover(uport, false);
-	__qcom_geni_serial_console_write(uport, wctxt->outbuf, wctxt->len);
+	__qcom_geni_serial_console_write(uport, wctxt->outbuf, wctxt->len, false);
 
 	writel(m_irq_en, uport->membase + SE_GENI_M_IRQ_EN);
-	writel(s_irq_en, uport->membase + SE_GENI_S_IRQ_EN);
 	nbcon_exit_unsafe(wctxt);
 
 	/* Restart TTY data left queued when atomic output canceled M TX. */
@@ -655,12 +657,25 @@ static void qcom_geni_serial_console_device_unlock(struct console *co,
 						    unsigned long flags)
 {
 	struct qcom_geni_serial_port *port;
+#ifdef CONFIG_MAGIC_SYSRQ_SERIAL
+	u8 sysrq_ch;
+#endif
 
 	port = get_port_from_line(co->index, true, NULL);
 	if (IS_ERR(port))
 		return;
 
+#ifdef CONFIG_MAGIC_SYSRQ_SERIAL
+	/* The threaded console writer can receive a SysRq character. */
+	sysrq_ch = port->uport.sysrq_ch;
+	port->uport.sysrq_ch = 0;
+#endif
 	__uart_port_unlock_irqrestore(&port->uport, flags);
+
+#ifdef CONFIG_MAGIC_SYSRQ_SERIAL
+	if (sysrq_ch)
+		handle_sysrq(sysrq_ch);
+#endif
 }
 
 static void handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
@@ -902,6 +917,34 @@ static void qcom_geni_serial_handle_rx_fifo(struct uart_port *uport, bool drop)
 	handle_rx_console(uport, total_bytes, drop);
 }
 
+/* Caller holds the UART port lock. */
+static void qcom_geni_serial_poll_rx_fifo_locked(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	struct tty_port *tport = &uport->state->port;
+	u32 s_irq_status;
+	bool drop_rx = false;
+
+	s_irq_status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
+	writel(s_irq_status, uport->membase + SE_GENI_S_IRQ_CLEAR);
+
+	if (s_irq_status & S_RX_FIFO_WR_ERR_EN) {
+		uport->icount.overrun++;
+		tty_insert_flip_char(tport, 0, TTY_OVERRUN);
+	}
+
+	if (s_irq_status & (S_GP_IRQ_0_EN | S_GP_IRQ_1_EN)) {
+		if (s_irq_status & S_GP_IRQ_0_EN)
+			uport->icount.parity++;
+		drop_rx = true;
+	} else if (s_irq_status & (S_GP_IRQ_2_EN | S_GP_IRQ_3_EN)) {
+		uport->icount.brk++;
+		port->brk = true;
+	}
+
+	qcom_geni_serial_handle_rx_fifo(uport, drop_rx);
+}
+
 static void qcom_geni_serial_stop_rx_fifo(struct uart_port *uport)
 {
 	u32 irq_en;
@@ -912,10 +955,6 @@ static void qcom_geni_serial_stop_rx_fifo(struct uart_port *uport)
 	irq_en &= ~(S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN);
 	writel(irq_en, uport->membase + SE_GENI_S_IRQ_EN);
 
-	irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
-	irq_en &= ~(M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
-	writel(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
-
 	if (!qcom_geni_serial_secondary_active(uport))
 		return;
 
@@ -949,10 +988,6 @@ static void qcom_geni_serial_start_rx_fifo(struct uart_port *uport)
 	irq_en = readl(uport->membase + SE_GENI_S_IRQ_EN);
 	irq_en |= S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN;
 	writel(irq_en, uport->membase + SE_GENI_S_IRQ_EN);
-
-	irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
-	irq_en |= M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN;
-	writel(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
 }
 
 static void qcom_geni_serial_stop_rx_dma(struct uart_port *uport)
@@ -1182,25 +1217,11 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 
 	uart_port_lock(uport);
 
-	m_irq_status = readl(uport->membase + SE_GENI_M_IRQ_STATUS);
 	s_irq_status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
-	dma_tx_status = readl(uport->membase + SE_DMA_TX_IRQ_STAT);
 	dma_rx_status = readl(uport->membase + SE_DMA_RX_IRQ_STAT);
-	geni_status = readl(uport->membase + SE_GENI_STATUS);
-	dma = readl(uport->membase + SE_GENI_DMA_MODE_EN);
-	m_irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
-
-	trace_geni_serial_irq(uport->dev, m_irq_status, s_irq_status,
-			      dma_tx_status, dma_rx_status);
-
-	writel(m_irq_status, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	writel(s_irq_status, uport->membase + SE_GENI_S_IRQ_CLEAR);
-	writel(dma_tx_status, uport->membase + SE_DMA_TX_IRQ_CLR);
 	writel(dma_rx_status, uport->membase + SE_DMA_RX_IRQ_CLR);
 
-	if (WARN_ON(m_irq_status & M_ILLEGAL_CMD_EN))
-		goto out_unlock;
-
 	if (s_irq_status & S_RX_FIFO_WR_ERR_EN) {
 		uport->icount.overrun++;
 		tty_insert_flip_char(tport, 0, TTY_OVERRUN);
@@ -1215,12 +1236,35 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 		port->brk = true;
 	}
 
+	m_irq_status = readl(uport->membase + SE_GENI_M_IRQ_STATUS);
+	dma_tx_status = readl(uport->membase + SE_DMA_TX_IRQ_STAT);
+	geni_status = readl(uport->membase + SE_GENI_STATUS);
+	dma = readl(uport->membase + SE_GENI_DMA_MODE_EN);
+	m_irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
+
+	trace_geni_serial_irq(uport->dev, m_irq_status, s_irq_status,
+			      dma_tx_status, dma_rx_status);
+
+	writel(m_irq_status, uport->membase + SE_GENI_M_IRQ_CLEAR);
+	writel(dma_tx_status, uport->membase + SE_DMA_TX_IRQ_CLR);
+
+	if (WARN_ON(m_irq_status & M_ILLEGAL_CMD_EN))
+		goto handle_rx;
+
 	if (dma) {
 		if (dma_tx_status & TX_DMA_DONE) {
 			qcom_geni_serial_handle_tx_dma(uport);
 			qcom_geni_set_rs485_mode(uport, SER_RS485_RTS_AFTER_SEND);
+		}
+	} else if (m_irq_status & m_irq_en &
+		   (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN)) {
+		qcom_geni_serial_handle_tx_fifo(uport,
+				m_irq_status & M_CMD_DONE_EN,
+				geni_status & M_GENI_CMD_ACTIVE);
 	}
 
+handle_rx:
+	if (dma) {
 		if (dma_rx_status) {
 			if (dma_rx_status & RX_RESET_DONE)
 				goto out_unlock;
@@ -1237,12 +1281,6 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 				qcom_geni_serial_handle_rx_dma(uport, drop_rx);
 		}
 	} else {
-		if (m_irq_status & m_irq_en &
-		    (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN))
-			qcom_geni_serial_handle_tx_fifo(uport,
-					m_irq_status & M_CMD_DONE_EN,
-					geni_status & M_GENI_CMD_ACTIVE);
-
 		if (s_irq_status & (S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN))
 			qcom_geni_serial_handle_rx_fifo(uport, drop_rx);
 	}
@@ -1632,7 +1670,7 @@ static void qcom_geni_serial_earlycon_write(struct console *con,
 {
 	struct earlycon_device *dev = con->data;
 
-	__qcom_geni_serial_console_write(&dev->port, s, n);
+	__qcom_geni_serial_console_write(&dev->port, s, n, false);
 }
 
 #ifdef CONFIG_CONSOLE_POLL

-- 
2.53.0

