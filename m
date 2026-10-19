Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BDB3F86E1
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 03:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792380761; cv=none; b=g+RByQDWNi4o1Ocq1V+izWrXHuIW1tlYGEP/3FlU/OqxaECqklsGUh9jJcvh/j+x4RNvYbuKmP0et5ZSCinkQLDHbptEdpcrVdXAkWMWJ2j8oCytcC8bM4biOOv2mLQ4cilkq+Ef81XH+G6DyHROIwTj+NG/h3Z6KuZtVBKpztE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792380761; c=relaxed/simple;
	bh=vtCPb9zV6L5uTrn3PIAIHPOGWAn1ooRRD+kV9nQCxTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EHON2LiXznNnfvrDjD35eNMf1Z1hdY65M6miVQkTq2Th30Tfpw/4oIGVMl9QmoScPOqcSo4BEYsDXDqNdHSN2H8myVE0O1feFd/+6P+Bl6f6Zcho/3bdTmt51dih5veD9Y/15aKU4l1zhJ4ZCQj5cyZKgpW1xyYCzrGYdz9vGyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4OX2zBk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Imb7yjou; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4OX2zBk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Imb7yjou"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J1FqJ13994755
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 03:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n+xQAV+h4O3H+drN3Sggr/
	lxYZZZqiuYT8sgXuwudPk=; b=f4OX2zBkOHZC4vp1PrBUX98rySIaK6GX0MnQV/
	VQQDmlT26sdRrdyFOUPQThJIzuwrVIzuS2L/Glymax1lax4KR5oVzt5874YxYi9h
	ec5OWe+xfrG1GLr9D4YapDufJl/2c037nL7CbYU1+0a4nAsvp7l44r9BOi1AuRoB
	NFbd/fqbf6o79EMoap7mprBuIEBU0cl/ohYigfPWlloxDw72B2ZvDo1ElgrhtOoz
	Zh06lA1iHu9eeY6IkN7Hma3DG3coLRZuaq67J1+iZZEUZKH3SnzcHUo57y6YhICG
	XsjK5Zm/mNzShFicwd9Rhuz2O5LQ6yD4lLVp4sg7hfqwiF1w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k4h4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 03:32:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so3478029eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 20:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792380758; x=1792985558; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n+xQAV+h4O3H+drN3Sggr/lxYZZZqiuYT8sgXuwudPk=;
        b=Imb7yjouRPTbHsLDyn2+Ud0Cc7E/vijJmnaDlDYgSw5Qc75EFt0swhTpAXTUYfOkhp
         va55SEY4IDRvEmztkxEk8AI8x1tmRw1nMFK2v3NzeRFNfE6bDWOIh/OVJSbciy6ARHUH
         QCnhq19Qc7UcCncJRZsvBr8dgX+HaSlAu28HDdQqtPt6bq8Trugq1islWNGjQNgNFEMo
         gS/x8Z9P/sUdNqEnNJSZW9+Sw8bW0BBgOxMHnmiprnUEgbm+ue4RNB1rh0EtJBaAjck4
         GbyZNIluzxW1F951VVYITzfEZzdUJu5ngc+jYGCVL659GPsd4cFZAfFW+LkaIyYSDlSJ
         aylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792380758; x=1792985558;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=n+xQAV+h4O3H+drN3Sggr/lxYZZZqiuYT8sgXuwudPk=;
        b=sHMiGQRT3lAb6RzhNC3To4xPBEU0YA+ovIQDGLOYl39Ow1rBQ3OsvG3B2SuNAQHd2j
         T3voKFJBu6Zev2M3yRCmGxkbK6jqrrTfzPocsxoF1RAbId2jQGg/Nxz13NOT62K055+u
         qm6XC6gTG1hv5ZCt32f9glUda7b5tiNPvZiYrht+zjbYvqDU8uhog5XT+a4My7X4Gime
         K1FXwtvz5TOM44IlW31NbIVt+Vzm1JQA3GbGvcMHIX0VfbzvJyAuJkCmxdVvrKLgu+68
         vUWsDW0b7PVBPH14cj1nUjOZaegl5f+LRCkriy91XGkX+3L+FMoHPu6cW5bpV0BHnStM
         5FuA==
X-Forwarded-Encrypted: i=1; AKwUvBzr6loPP7Np6rgMsn8oSQGpnEOBftJiDjViyxA2K0H1zsf7oIZUjfaWlCBXdEpA/O6X7KCL6x02mgKQM3Eu@vger.kernel.org
X-Gm-Message-State: AFq9FYIxKCTm1oq/kKexfHWdgar2WGrhz5oh2XokAv6SF2a3v7VQbiIn
	UvlIuzG0gKde2Vn8c72RTzt9q1rsgniVXAzEEtDFSCpcDBsLmdbFBZWoZ8OFsqP6MtslOcpoS65
	ZEDa/o58CSMxj5GqcBRlD82f8+PWeB1CWcubglY1IEyJUD1/GMoBzSs3HYTdBK2GgoQHV
X-Gm-Gg: AYBFou3huD2/qx2cvBFi+nfT7fePf0sMOICfDrrfoytY7eYLvE8GM5osQP/2+LVrKAS
	6BMHFGwlF27yLOPBuNri+IlbAcGimXfyPSp+qn/cYFUKruW2bgNjkzmh9cNqkdnGBbrWnzdk6K0
	lhI2Q6aRzx+pFp/ykIdSJC1ChKbJ9IWEk2YwnWrZEJQ0fz9DmM2kY8AYLhooFelHNbpxDgiTh8U
	0/YvFA5JsVwZKeYdCdwidj3ESB75/gZQP5G/Pn4aWgDNxTpmboKd2urnR0SHKwUxtzGFMel7fEF
	YEeOp1agamZr81so5p9a0QW9QfxqLidEfKQWTpxx+73dG6a7b0tAvN+HoxtRkPEeKcHIao+kOsj
	ytB/qrzYO44QMh0EaVX0eODSg/CO3xiZ1
X-Received: by 2002:a05:7301:2727:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-361a1865981mr9545976eec.9.1792380758386;
        Sun, 18 Oct 2026 20:32:38 -0700 (PDT)
X-Received: by 2002:a05:7301:2727:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-361a1865981mr9545946eec.9.1792380757689;
        Sun, 18 Oct 2026 20:32:37 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm34893765eec.20.2026.10.18.20.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 20:32:37 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 09:02:24 +0530
Subject: [PATCH] serial: qcom-geni: Add tracepoints for SE reg dump
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-add-tracepoints-for-se-reg-dump-uart-v1-1-1fb47b1605b9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEeP1WoC/yXNQQ7CIBBA0as0s3YShKYNXsW4QJjWMRHIAI1J0
 7uLunyb/3coJEwFLsMOQhsXTrHjfBrAP1xcCTl0g1Z6UlbP6ELAKs5TThxrwSUJFkKhFUN7ZWx
 OKhoVrJmMHcfZQU9loYXfv8319ndp9yf5+m3DcXwAuL+qqIgAAAA=
X-Change-ID: 20260927-add-tracepoints-for-se-reg-dump-uart-30d93639447a
To: konrad.dybcio@oss.qualcomm.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792380754; l=5010;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=vtCPb9zV6L5uTrn3PIAIHPOGWAn1ooRRD+kV9nQCxTM=;
 b=KWzX3cPm/D5hzwnetUbKi2UB/XqWCv+3NJiKclDx1Sh9RSdlWmUGPlPZt/oe3ruDAR9KNIyfc
 tj4nG5mJ5CJB2cJsh5DN2juAiHFzu61nyQ2SSWnjDrsD3rbZfNeJ7nL
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAxMyBTYWx0ZWRfX32NmeEQ7SlUG
 byuSork74tnHjq3hAcL3tqWMZ8aaSB1CRG2qBXHKRHJuG1cQLwWg1KF6v1NrAJ9GnTkZC3+QWUu
 yo03SsH1W+inhCbjJTqnmgzuP/+5tioKI1mooWvxNsvabTDelwVj6T5An1qyzU64mPVxlLr9Moy
 Uic716lZWUPwSsUTgfPyhUyVS9FUb6o6AYu7TeZaAeHh5t1U1C/r9/rRWCHEQ2Tx/zS287IindO
 jCg51egSqMSRoGHJPGV5oCDFDq+m3VewOpvcECB2RxConblVI+XS9M9BBJkWQjqMHveyALDln80
 bS4sB2hO7DEb8nO+a/6aZt28VuHL5Ieo0vKU07JQhvTfb5TqhmLd18mYMthQTl3JNHCkT/n7dhR
 kQrN6QMoBoBVsbliuddh1hEJTBY8tgr1dPsjSk1nVjV46Wr8QCGhV6ILw5Dze5IH9wH/+F4adoR
 2xpMGFpyOT04j+ZJvOw==
X-Proofpoint-GUID: qROhQhejFuKuan_Dub8KBhjU-4aRm49S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAxMyBTYWx0ZWRfX0sZIRZgg9PeJ
 VnZJZmjhzKxxBGdBqDw4y+TrU11gMIAthZzgmC5K4EEaXGDetZDLJ5oE0JTxRtr0Sbl/aOfLZRd
 01z0h8KgheNcc/HXCjMuAkOkccU7e9I=
X-Proofpoint-ORIG-GUID: qROhQhejFuKuan_Dub8KBhjU-4aRm49S
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad58f57 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-I6NzRS75OSQgGjscJcA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190013

The GENI serial driver reports various transfer failures such as
M_CMD abort/cancel timeouts, DMA TX/RX FSM reset timeouts, RX FIFO
write errors, illegal command interrupts, and DMA parity errors.
However, diagnosing the root cause of these failures is difficult as
the hardware state is not captured when the error occurs.

Add trace_geni_se_regs() calls at critical serial error handling paths
to automatically capture GENI serial engine debug registers when
failures are detected. This includes:

- M_CMD abort/cancel timeout
- DMA TX/RX FSM reset timeout
- Unexpected zero-byte RX DMA completion
- RX FIFO write error and illegal command interrupt status
- RX DMA parity error

Dumping the SE debug registers at the time of failure provides
additional hardware context and significantly improves post-mortem
analysis of serial transfer issues without affecting normal
operation.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index bfdc155c128d..34ab80e8cdbb 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -7,6 +7,8 @@
 /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
 #define __DISABLE_TRACE_MMIO__
 
+#include <trace/events/qcom_geni_se.h>
+
 #define CREATE_TRACE_POINTS
 #include <trace/events/qcom_geni_serial.h>
 
@@ -811,8 +813,10 @@ static void qcom_geni_serial_stop_tx_dma(struct uart_port *uport)
 	if (port->tx_dma_addr) {
 		writel(1, uport->membase + SE_DMA_TX_FSM_RST);
 		if (!qcom_geni_serial_poll_bit(uport, SE_DMA_TX_IRQ_STAT,
-					       TX_RESET_DONE, true))
+					       TX_RESET_DONE, true)) {
 			dev_err_ratelimited(uport->dev, "TX DMA reset failed");
+			trace_geni_se_regs(&port->se);
+		}
 		writel(TX_RESET_DONE | TX_DMA_DONE,
 		       uport->membase + SE_DMA_TX_IRQ_CLR);
 
@@ -923,8 +927,11 @@ static void __qcom_geni_serial_cancel_tx_cmd(struct uart_port *uport)
 	if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
 						M_CMD_CANCEL_EN, true)) {
 		geni_se_abort_m_cmd(&port->se);
-		qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
-						M_CMD_ABORT_EN, true);
+		if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
+					       M_CMD_ABORT_EN, true)) {
+			dev_err_ratelimited(uport->dev, "M_CMD_ABORT_EN not set");
+			trace_geni_se_regs(&port->se);
+		}
 		writel(M_CMD_ABORT_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	}
 	writel(M_CMD_CANCEL_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
@@ -1006,8 +1013,11 @@ static void qcom_geni_serial_stop_rx_dma(struct uart_port *uport)
 		qcom_geni_serial_abort_rx(uport);
 
 		writel(1, uport->membase + SE_DMA_RX_FSM_RST);
-		qcom_geni_serial_poll_bit(uport, SE_DMA_RX_IRQ_STAT,
-				RX_RESET_DONE, true);
+		if (!qcom_geni_serial_poll_bit(uport, SE_DMA_RX_IRQ_STAT,
+					       RX_RESET_DONE, true)) {
+			dev_err_ratelimited(uport->dev, "RX DMA reset failed");
+			trace_geni_se_regs(&port->se);
+		}
 		writel(RX_RESET_DONE | RX_DMA_DONE,
 				uport->membase + SE_DMA_RX_IRQ_CLR);
 	}
@@ -1048,9 +1058,10 @@ static void qcom_geni_serial_handle_rx_dma(struct uart_port *uport, bool drop)
 				DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
 
 	rx_in = readl(uport->membase + SE_DMA_RX_LEN_IN);
-	if (!rx_in)
+	if (!rx_in) {
 		dev_warn_ratelimited(uport->dev, "serial engine reports 0 RX bytes in!\n");
-	else if (!drop) {
+		trace_geni_se_regs(&port->se);
+	} else if (!drop) {
 		trace_geni_serial_rx_data(uport->dev, port->rx_buf, rx_in);
 		handle_rx_uart(uport, rx_in);
 	}
@@ -1223,6 +1234,7 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 	if (s_irq_status & S_RX_FIFO_WR_ERR_EN) {
 		uport->icount.overrun++;
 		tty_insert_flip_char(tport, 0, TTY_OVERRUN);
+		trace_geni_se_regs(&port->se);
 	}
 
 	if (s_irq_status & (S_GP_IRQ_0_EN | S_GP_IRQ_1_EN)) {
@@ -1246,8 +1258,11 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 	writel(m_irq_status, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	writel(dma_tx_status, uport->membase + SE_DMA_TX_IRQ_CLR);
 
-	if (WARN_ON(m_irq_status & M_ILLEGAL_CMD_EN))
+	if (m_irq_status & M_ILLEGAL_CMD_EN) {
+		trace_geni_se_regs(&port->se);
+		WARN_ON(1);
 		goto handle_rx;
+	}
 
 	if (dma) {
 		if (dma_tx_status & TX_DMA_DONE) {
@@ -1270,6 +1285,7 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 			if (dma_rx_status & RX_DMA_PARITY_ERR) {
 				uport->icount.parity++;
 				drop_rx = true;
+				trace_geni_se_regs(&port->se);
 			}
 
 			if (dma_rx_status & RX_DMA_BREAK)

---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20260927-add-tracepoints-for-se-reg-dump-uart-30d93639447a

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

