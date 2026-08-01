Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A696B42AF8A
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 05:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785563322; cv=none; b=u+IDdGl6yeZxxFnKF9EEpNSzPJgeXHEYULWcbqgX3Uft1mexQhhshKyQTcB/Fp8ufLkJv1VG02ryd6kihnKz6cy0eMVjWFzPLX0mRW5Uxk+7UHQe0yKqVGRsP/yqUK0b9VFP0BcJ//RnxZP+/2H+AGpRlbfbr4w0YVl91Pp5HXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785563322; c=relaxed/simple;
	bh=s/SpZVFR71r8SdtWW9hrvSUzEPlBLFRIa8WCs8dVUO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kx9ntnL1NGvHvw34ofXiST2a1pW9C56msZNo+JET3XB4oC4XQRXOeuLz4JYFXQXFLi7A9dzVey73m5Z7LoWcok5IJ/E13JOr+RyVT/iX+7Q4CLwmzvJQmbVid+MQkbyPCySZPPx38mTFngtcOf1KzpZXdqFVBGolBh0Ctu3909U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzqWKM1h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOeQT8DA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzqWKM1h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOeQT8DA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713PaT21918935
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 05:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vz/GnDP1sDXC+PDBe27vaFvPUtMnYs1VOZ2X6B7ojT4=; b=BzqWKM1hPimp2fAO
	STyB9hkvCtzvIF/e4ZKeXdjo4wZAmWVT7dPf0kif/w0Q801kZ4KnY7uksaOKL0NW
	xs2Vj//S1s8ig9n1gDxFnXWBHqSm1n1NEtDwjo4108/rFRaowJoBJ8X5wH+DkjbE
	M6MRhTobd2UVh29ODuNQe2Y7PsFkoF+H9dY1O9951Ck8MArXzwDjZ3eHr5UNC6gX
	8Snp3yuw/mShmV2uYmfAIOviH/xJLb4o1lOh8tqCE13g3ZqQB94WSbUyktla8pmn
	6lfStYfqNg8EPVEDEaXtuwjtWD0ggzPiicdx9BuaEaStwD+wlUFjaYSEpfbTy23K
	4k1mew==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8vt89bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 05:48:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so31108945ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 22:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785563318; x=1786168118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vz/GnDP1sDXC+PDBe27vaFvPUtMnYs1VOZ2X6B7ojT4=;
        b=bOeQT8DAKL6LDtCwhSBkBlxXQLaXKIZumtHJ/Pu5mIopQpMOeNgJoXKmBfnRGLUOqh
         E+Qq7L8Y9SBROB15swFzZYtWjdMLfdw2AXKYqis6JC4TuT61dDPFps/gVEtcaJRxfIv6
         eTWRQJrlBJlGzIipMRkMVcljt4jGSoUVy/JZwhkLP+7pzfOXQCLz2fv1+W9Ge8vBbJQ0
         jZQhp4fe1L3dFlPNgMNlfrCrvO9FEd/Eh8i5iKDJ1JisylZZtjOD/8//0cwnWE55clHj
         rbZ6dM4GAtrtzji5Kr8MdtLwQlNCTydwYY5d5ccZciIAWDdRPrHTnoLQEu7teQ6Jq/TF
         YQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785563318; x=1786168118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vz/GnDP1sDXC+PDBe27vaFvPUtMnYs1VOZ2X6B7ojT4=;
        b=auiq1NpnTbcs5u5lP5T3bo1VfxrwVIcT/jX6TtE3nk+vvye5BgePQK2TsJrHshXFh9
         cQdjCEUPUwo34GOLlgEOE+TqP8xphmDHPNvEwmXqVzXLW2nsJ0G8zpAfs9j1/vVJBk7W
         eiLn82kuV/pJmFFgPK4jLHwicLQDPXgje893SPEbIrV89CGUZTeQTOlTj5iMLUwJIb40
         C3f8assDQhXxvvIXoIpO39KS0Z/JPZ1tr28TLCanNkVo42wnVzMBMAbxNy8Ld3xthHnM
         4ogcdAkGc1fjJKAOQkP3EjeGN8wpHM+5LAS6fFVUb/hVCmYcqYwONAAEpSdBLpwN/o67
         1N+g==
X-Gm-Message-State: AOJu0Yxx3uYYkWpd3clv9g925gKAYsMQdlHgBVoBplmt+jtdOBRvUkbi
	hTFTQUrhc6lmt3obmI3fIPlJhZTdCbPBqqyAhIKi5+O/5R/QuP4HhOBjMxI545RraRR/LkBMsQX
	THYjpUoLFYnyZKkZByoPaIiLqqOvuieoMcRJ4J3VCZ361q46eRiqRUEFvBwYsVsC/4+lv
X-Gm-Gg: AR+sD12Rld7GsYpIHhnNv74uhDKUbCBdbASQi5dfH+2nyy1QRMECbd45LTicr+AC8/D
	nNiPVeOt1WTQ8Ko4UbIgXv83yTtkjuPnSCEkG1Ju8vF44gQQfbykMrunhpZGXeTRxhSrk1wHWy5
	s1V6DkdAU9KdcBWj3jjKkS2WtIHiqQSv+JknyF8poTCRXEwzoEImkpLhoxFBNNxk90rDQjRUir5
	SlE+FadByxd7+E0K/PY7kloH3/0Pxybm7CwNHjr/5ZhuuUR4edBGqqxW4KKDiR9QoUbNCMtGdF0
	LyYpmFqKgwjjU61F3BH3oR0sQqTCaczxxN+19JF+KVE4SbL/y51bcPjW2a7J9zYe61dRm/GEHPI
	6ps6Ynk+b7Ru2NhCL6kt08NYaLv4ZUephFA==
X-Received: by 2002:a17:903:41c9:b0:2cb:14b3:4cfe with SMTP id d9443c01a7336-2d0524cd9famr23685145ad.45.1785563318533;
        Fri, 31 Jul 2026 22:48:38 -0700 (PDT)
X-Received: by 2002:a17:903:41c9:b0:2cb:14b3:4cfe with SMTP id d9443c01a7336-2d0524cd9famr23684845ad.45.1785563317944;
        Fri, 31 Jul 2026 22:48:37 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e666sm18305211eec.4.2026.07.31.22.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 22:48:37 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 11:18:17 +0530
Subject: [PATCH v2 3/3] serial: qcom-geni: Use geni_se_set_perf_level() for
 baud rate perf level
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-reuse_common_geni_framework_helpers-v2-3-13753256ef71@oss.qualcomm.com>
References: <20260801-reuse_common_geni_framework_helpers-v2-0-13753256ef71@oss.qualcomm.com>
In-Reply-To: <20260801-reuse_common_geni_framework_helpers-v2-0-13753256ef71@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, konrad.dybcio@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, chandana.chiluveru@oss.qualcomm.com,
        mukesh.savaliya@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785563302; l=4995;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=s/SpZVFR71r8SdtWW9hrvSUzEPlBLFRIa8WCs8dVUO0=;
 b=L2NOFZcYhKKwZJdiq2lU6giAl26lNImCJ/fUM2bLBKfMWVhZmBqiYj2KKoRRsxg5sL9+KCWW+
 3eOpzgAmwMjCFf+sWF/PnAPxbD6L5FgnN1w3FUryDixlslb3ibfrsqg
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAzNyBTYWx0ZWRfX77YqcEcP873H
 f+bOO78vXZTTcEQSmhwqQnsIHeoYU4cJI+Y7NCEOi//Oy3BPHfCNKLZP8wcG/VSi+TZtLFTK8CQ
 YwsMZRZHE3s+D2EAZMAEy81y0/BICL0=
X-Proofpoint-ORIG-GUID: 9uK3N-1dBuorsm_FP5oJHJAWA1RalmW1
X-Proofpoint-GUID: 9uK3N-1dBuorsm_FP5oJHJAWA1RalmW1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAzNyBTYWx0ZWRfX9kFTvRGqARX+
 Z8AZ6pF6+5rKZ2OlnDKaeLNuJc/psJzSz0L/5mrWQiWONxGksKA6CTP6rVlrK7GOH+qinzSfFIN
 ls5FqEFcWMsh7lyG1Q9eluqyw7kMeN/dr2/0LgXgXt67uUXQfyB3e5li3yxFh6tOmy9sseY4nIg
 +hcyNlBu6ON5ZCamyOYRA+nwuNbN5Iu0CwvHpdGUkXqhx2QMLKPm9AemoM2kb9ZGCqYpmYoC3yU
 gYaBnLVpUnWR5xhK0uwqcO8IlumcXDGkohak4RsI/+VMEDIM2uVGVV9HChQYqmXQMh3NXplI59I
 6VtINU4Ul+yIFHPE/Vb9KgjCxTT10dl/vJbHoMV3+lpYXkF4bbL9TxyeJsgMH+uB/CTicZWWekY
 KpfvJY3+vRr52QZfdfeHFFJoS0ruQmXFiCHa576Yo25OcRPlwLglbJEA8EZtwQUJ0VTnqGpQqtA
 IP3TPYL2NwoK/ErcjLA==
X-Authority-Analysis: v=2.4 cv=fKMJG5ae c=1 sm=1 tr=0 ts=6a6d88b7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iFx-AcfrQKbmC_lMXXIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010037

The driver implements its own helper to select the performance level
corresponding to a requested baud rate. The helper duplicates
functionality already provided by geni_se_set_perf_level() in the GENI
core.

Replace the local implementation with the common helper and remove the
associated duplicate definitions and code. This consolidates
performance-level management in the GENI framework and reduces driver
specific code.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 53 ++++++-----------------------------
 1 file changed, 8 insertions(+), 45 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 83ba0f5433ef..c268ebba2ee2 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -109,14 +109,12 @@
 #define DMA_RX_BUF_SIZE		2048
 
 static DEFINE_IDA(port_ida);
-#define DOMAIN_IDX_POWER	0
-#define DOMAIN_IDX_PERF		1
 
 struct qcom_geni_device_data {
 	bool console;
 	enum geni_se_xfer_mode mode;
 	int (*resources_init)(struct geni_se *se);
-	int (*set_rate)(struct uart_port *uport, unsigned int baud);
+	int (*set_rate)(struct geni_se *se, unsigned long baud);
 	int (*power_on)(struct geni_se *se);
 	int (*power_off)(struct geni_se *se);
 };
@@ -1440,9 +1438,10 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
 	return 0;
 }
 
-static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
+static int geni_serial_set_rate(struct geni_se *se, unsigned long baud)
 {
-	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	struct qcom_geni_serial_port *port = dev_get_drvdata(se->dev);
+	struct uart_port *uport = &port->uport;
 	unsigned long clk_rate;
 	unsigned int avg_bw_core, clk_idx;
 	unsigned int clk_div;
@@ -1458,7 +1457,7 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
 
 	ret = geni_se_clk_freq_match(&port->se, baud * sampling_rate, &clk_idx, &clk_rate, false);
 	if (ret) {
-		dev_err(port->se.dev, "Failed to find src clk for baud rate: %d ret: %d\n",
+		dev_err(port->se.dev, "Failed to find src clk for baud rate: %lu ret: %d\n",
 			baud, ret);
 		return ret;
 	}
@@ -1496,42 +1495,6 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
 	return 0;
 }
 
-static int geni_serial_set_level(struct uart_port *uport, unsigned int baud)
-{
-	struct qcom_geni_serial_port *port = to_dev_port(uport);
-	struct device *perf_dev = port->se.pd_list->pd_devs[DOMAIN_IDX_PERF];
-
-	/*
-	 * The performance protocol sets UART communication
-	 * speeds by selecting different performance levels
-	 * through the OPP framework.
-	 *
-	 * Supported perf levels for baudrates in firmware are below
-	 * +---------------------+--------------------+
-	 * |  Perf level value   |  Baudrate values   |
-	 * +---------------------+--------------------+
-	 * |      300            |      300           |
-	 * |      1200           |      1200          |
-	 * |      2400           |      2400          |
-	 * |      4800           |      4800          |
-	 * |      9600           |      9600          |
-	 * |      19200          |      19200         |
-	 * |      38400          |      38400         |
-	 * |      57600          |      57600         |
-	 * |      115200         |      115200        |
-	 * |      230400         |      230400        |
-	 * |      460800         |      460800        |
-	 * |      921600         |      921600        |
-	 * |      2000000        |      2000000       |
-	 * |      3000000        |      3000000       |
-	 * |      3200000        |      3200000       |
-	 * |      4000000        |      4000000       |
-	 * +---------------------+--------------------+
-	 */
-
-	return dev_pm_opp_set_level(perf_dev, baud);
-}
-
 static void qcom_geni_serial_set_termios(struct uart_port *uport,
 					 struct ktermios *termios,
 					 const struct ktermios *old)
@@ -1550,7 +1513,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	/* baud rate */
 	baud = uart_get_baud_rate(uport, termios, old, 300, 8000000);
 
-	ret = port->dev_data->set_rate(uport, baud);
+	ret = port->dev_data->set_rate(&port->se, baud);
 	if (ret)
 		return;
 
@@ -2161,7 +2124,7 @@ static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_serial_set_level,
+	.set_rate = geni_se_set_perf_level,
 };
 #endif
 
@@ -2178,7 +2141,7 @@ static const struct qcom_geni_device_data sa8255p_qcom_geni_uart_data = {
 	.console = false,
 	.mode = GENI_SE_DMA,
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_serial_set_level,
+	.set_rate = geni_se_set_perf_level,
 };
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {

-- 
2.34.1

