Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE20435530
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784560101; cv=none; b=uKzQyzdHCxZsaVxPzPGipj1BLxClDPRhXcFm0vWqLpDDsvXWK42Qnhsa+uojMPNWGTVzuQv6oaF6+bzOLab5vVzAuV/wI0DTL8bFvdyXSbzgIUKm2Rk0069+nyOXfp/AKempz5WvYyuBWnoEKTTcYEEJYhVYy4P/dfZDSajo0yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784560101; c=relaxed/simple;
	bh=cu6/tZOov/VlL5x0rhG1qMaLsBd1zn8WxX+O9dJpTxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gtlI+IvHNgkYhjYdR7PGaNS0vrfV2PbhFu8gmfStgHha7UbKLPItBoPVbI252fgaCtwlwHLb9bmLHECy4tVHORKr+hojNtk0iIiwKn+lKTSwZJoA/yeX3olp9UrchIOfyU9PW0MQR5fOHoAn20RHLj2p6wduTfYKblWSJW9nAzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVKbpgRF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TeOjQK9M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVKbpgRF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TeOjQK9M"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDr5wQ2878702
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2RnIgqvqhSQk5vbShGMyDEqVqFN3Wb7u01FELe38R2M=; b=QVKbpgRFQNWdBBPv
	O4sqS5EJC/f+AHITCdRNeRH4tOj3eQEHQvSk4qEGSdBah9rsGik8PyKPAcHjzEx+
	J+aI/rmOLjagGDF1QiawHHqhLFJccaeKWXufzZ9MfoGu4AJ699k+BDfC6sLlgviy
	rdm7G6O7ku6lEoBUaj+BPueQnmaafKzwLH2FQZNMn030T9UyaU6fZlH05KfBAei+
	JaUCZ3xm4Q9kwmhJpO5STzQtHxFZcQhuEBVdzM75Brgg6tjFP+Q9CW7xfgGVrl2/
	9xeb8ua7WXiRiPYZsV26gRBL4agYKUfwbH7coyUAnawynJ9NI9kDMkkBSN+gT0R9
	RatiUA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0kt2tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:08:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so175987a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784560097; x=1785164897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2RnIgqvqhSQk5vbShGMyDEqVqFN3Wb7u01FELe38R2M=;
        b=TeOjQK9MAniwiZiE42WTgQd4TmIYfM6r/SCyuNX51a+99MO+jmQKS0eLt1aoas+Wgh
         KTFb//g5A0F6KDMcbaJiXw3A/knzKcOGws2fbo3+JOb3Pvm7RlTCVS8UnF8KYMll6BRT
         oF0NpqTTwkog8R7Umj+2dfw7zqqaD0Waf1q030LoY9jIVpusgYFO8fbXsrrNtRRVA4wU
         6sBcws7BMM/TPayHrUo75mrAwRgSefCTIY0m3LwGv7v9Qy00ZMvGhKwWJPpFbAN/N07F
         fmgitlawGmY2aiLej3Tu8HH+cie7sT3a5wxEsEhNqVlWDOVc8ufLKZUoqjr3ccYpIYhV
         8meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784560097; x=1785164897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RnIgqvqhSQk5vbShGMyDEqVqFN3Wb7u01FELe38R2M=;
        b=byyPEzh4BznuPZQI9kPTjZMjdwPgQIvAy/SaMlvSe9k6IbBnk6AZi5oU398rMNzoyE
         LrJn9XU68jyOKNLIJJv2GMkPJS0pIjf/C0HXDYT+uj94jKOIcK8hLrZIqUFRHa8krzGO
         HN86+14B/JA6eovbv0HuNhuTRIe6Gu3eCwGQmmZNzPFfb0I36FrEJQGHY44j5Ndm8V17
         StPeEvnXO5RQV4+RSRzE/Ut5eQI+OoNyJsTq1T1M1Sb+eio7aW/wHfMUbMF8ez4ReDkh
         sYoRUR3iNZS8Ap10ArLjvlbrajVb86gBoQPhzcHQqBk2NcJy+CDm+DbwS4jKt9/eS6Zx
         B0PA==
X-Gm-Message-State: AOJu0Yw0+ZpZJnbZWcSqjZkYuzu2U6QVdnKVa+jEIyIPf4ZNU850sYKq
	BLpwCVkpQY+nKvGnGAhQe3p7wWRrut3d96gEF8pUeuQcGJcZMpCbF8Uz/KtFcoZEJOOpxJHG720
	8bkCSxLzOaPn/tN7yDRE1LKtrbdu6MyRhxy9XDw9Hlyq3nP909oMpc9XaDlJSHsYp85w4
X-Gm-Gg: AR+sD13Rlerh3zn/zrONlw4biEKhTe/ufCzmPm1nnGC7cyy54BxyYWW5aEbi6dZYq9S
	EDXdGz628dE0X3NfDjRuQVL779Cra26ulwgjZrAp2AyWHZTt1n9DwU7WSl1Si7iZFGmhgJJMXYW
	v7b5768hR2LYgLfnaIDy7sOErKXxV1jw3kUKCaB64E4UmXoFB0c3ZemYtPYACpYrqHKDfBNLAwj
	+zRUlyPIdowJBePuTgRSQyVwGz6qn/Ruvef/k9Su1h5MNUrK0wQfipQZoOpdhTQ6YcEJmfSy4eJ
	qJq86tGTVM9ZbWcCLRi2HxyT8PZenr2CJKQXv1SSrRkRNOcJqQz5JINneXPxQLo2NlmtobSU/pq
	/8W+qxbmOC4PO6x0ylE5Scn2DXjGkxjHXkw==
X-Received: by 2002:a17:90b:5866:b0:37e:10d1:c05b with SMTP id 98e67ed59e1d1-38e4b5166e5mr14208344a91.22.1784560097133;
        Mon, 20 Jul 2026 08:08:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5866:b0:37e:10d1:c05b with SMTP id 98e67ed59e1d1-38e4b5166e5mr14208280a91.22.1784560096563;
        Mon, 20 Jul 2026 08:08:16 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39e0531asm7856411a91.5.2026.07.20.08.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:08:16 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 20:37:51 +0530
Subject: [PATCH 3/3] serial: qcom-geni: Use geni_se_set_perf_level() for
 baud rate perf level
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-reuse_common_geni_framework_helpers-v1-3-c3330ab9b982@oss.qualcomm.com>
References: <20260720-reuse_common_geni_framework_helpers-v1-0-c3330ab9b982@oss.qualcomm.com>
In-Reply-To: <20260720-reuse_common_geni_framework_helpers-v1-0-c3330ab9b982@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, konrad.dybcio@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, chandana.chiluveru@oss.qualcomm.com,
        mukesh.savaliya@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784560081; l=4995;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=cu6/tZOov/VlL5x0rhG1qMaLsBd1zn8WxX+O9dJpTxA=;
 b=H/e5f98+wI815MrhifYNeF4YN+tUEMxKZv52ErN07waMuF8XVOKcDdWh1K+5MTGxFOfiYdC92
 DkSFRmi2Ij/A60S4wNS10Ghkl2gz5EBjID8G57W0S7wcsk3Qkik2LT4
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: kljZb_X8Wv-DFgAZ6vVn1F6ANkgNBQI1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2NyBTYWx0ZWRfXyPV05DyA/ujb
 HEK4HldStjfHV7WDnX5ZmPNEkKzmgYnEPx0pERWkHVB6N6ElvlabbWjHXhC5+LsIpBWI0nH5X2a
 3vQlnIOi5aJMKpSZ4YM/5kVX6paLmSE=
X-Authority-Analysis: v=2.4 cv=G58s1dk5 c=1 sm=1 tr=0 ts=6a5e39e2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=J9hZ59OvjYixzyTJZN0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2NyBTYWx0ZWRfX5gfZ9TgRlpm1
 f9pyyKKImuqznBxWSl7HO4hwUlATgDELftkgB7G4IVV/fl5kyOTEkipqv6mkaQ3zLDGOdnMYV9G
 2TeTJEmg7TCzaKHvDqUttQQyPu+gEGCLcWelHUhnIL6gqlMdzTWHUJdBLMe3ha09mYc+ibqLrjP
 Mp1CmHSdaYnZI6EB9nwLz1zJPkSbc2nfpBzmMv7pAFG2Mo9PCuM2m7PFdfUxjnDyH/Q0ZsnKKrC
 7dv4F2udH1Qz5370FjDGnATRYKI5A6JUjv33SOQpvGPWRuBpSOUXf9/WwWMhe8C1r90Dwlos5Tk
 I0Nyl38okjw5mw0snPbEZCyVktlevXTlYlpdKoxUaFSoG/bJ5V+VZ9kqzv6EbIFWAeo2cwRl0Av
 +M2dKWkc4FkSgSNXotuSGu0KQhOi2tXcclXY4nFeMxTkWG7Pb/vHR62pXszjfyVYG0dXdxKb30S
 6nebcJtiVBlrZpTJeoQ==
X-Proofpoint-GUID: kljZb_X8Wv-DFgAZ6vVn1F6ANkgNBQI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200167

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
index 17735c940541..fa86dd18fdee 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -107,14 +107,12 @@
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
@@ -1284,9 +1282,10 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
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
@@ -1302,7 +1301,7 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
 
 	ret = geni_se_clk_freq_match(&port->se, baud * sampling_rate, &clk_idx, &clk_rate, false);
 	if (ret) {
-		dev_err(port->se.dev, "Failed to find src clk for baud rate: %d ret: %d\n",
+		dev_err(port->se.dev, "Failed to find src clk for baud rate: %lu ret: %d\n",
 			baud, ret);
 		return ret;
 	}
@@ -1340,42 +1339,6 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
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
@@ -1394,7 +1357,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	/* baud rate */
 	baud = uart_get_baud_rate(uport, termios, old, 300, 8000000);
 
-	ret = port->dev_data->set_rate(uport, baud);
+	ret = port->dev_data->set_rate(&port->se, baud);
 	if (ret)
 		return;
 
@@ -2010,7 +1973,7 @@ static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_serial_set_level,
+	.set_rate = geni_se_set_perf_level,
 };
 #endif
 
@@ -2027,7 +1990,7 @@ static const struct qcom_geni_device_data sa8255p_qcom_geni_uart_data = {
 	.console = false,
 	.mode = GENI_SE_DMA,
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_serial_set_level,
+	.set_rate = geni_se_set_perf_level,
 };
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {

-- 
2.34.1

