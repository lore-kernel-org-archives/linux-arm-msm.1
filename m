Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B190D429CE3
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 05:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785563314; cv=none; b=Eut1H8A5CQdeUyitjDFC0kas4GqIvwgFNPfaGpu+kNNUxe6nMzYdqV6pCb2RDtzZNSb38f1n/RgYsOQ0W8iU/gtY4x6BNknLPvOJdwUl48Mj0VCRpK6ymN2099+s/b8hIlHOv6AKKKpwBO1pqzhZ+E2qUvV258Sb/2OqbK5V+48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785563314; c=relaxed/simple;
	bh=MgKtl/MZBgsFKwakhQrsDRziDrdSWAQ759cFA3oxkBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DAW7LuSTRu4BJ1l7dde6Wmslj/P+L2BZh/Y9UBAkzCVHRYHGmZ11HHbIz37KllZdyTSAmZtAdB2GJAzM+BWfZwE74CNZ9BdGI0TkhuLkZD7KJBqvTuK8fObKJvn9MasUSoDnClXNWkakLA4cusqU1Oec95a7I/jZqbtLu8IkZy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pmxp6feg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ddMzD/S2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pmxp6feg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ddMzD/S2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713FtMw1759694
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 05:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+kmzGi8WLW3q9cUIfuI3hkdmHctpvMeJjHJVyiabAW4=; b=Pmxp6fegGKUiwUYX
	yZ0So+b3UDQh+kWQidotB+YfYxmSPQxm+NOdHiSuT2VWDsyrU2/5jUfUls/GB2BQ
	xDcxfassdJNryqMAKLzbe4kUF31du/PYwGKNIp7hBDLAtuwAa5djvFh/BtsqbDEH
	4Wq4h1wmRWxjLso4f+oZhS9bRuWjBIneXF+iDbL5r4LahzlRiovyLzIIamWYxg+f
	PRMlRzT9757VE4/QJ4oR+tFs8wcQxolXzvia4kzoM1w50lxX9COJnEJQY3MLAQrD
	5+7V3jtKkUT25FQiQLKW7hF9b2HPnKCNZ1ABtDQcUNFVs+fc36lcsJYFfDPdGjvk
	mrSaSQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6g9tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 05:48:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cccfa32670so19642765ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 22:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785563310; x=1786168110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+kmzGi8WLW3q9cUIfuI3hkdmHctpvMeJjHJVyiabAW4=;
        b=ddMzD/S2PsFlIoBpQBA4/TKh6GufikevBnTn7+AU9ulNwVmIv24Ib9LsqVPW3KVlaC
         VF+7rN/3LrAaOpKcbJF9fkeEfhJASlnkhucsTvwMgDJP/dPY1g27LBbGu70Qwee6dAxH
         jO45oQfDP9wI9m8mXT1O973tvTgQLH/kCRUsClSySrHbb4at9ohLlNyyDzh9Fm2pYeTl
         AAdbzgBtK7s+viHZoYccxNWjMAKN//+WoDULfqP4HTJIgiXSHDxMKxj+Lsqe7PZ5NKqe
         dL31USF1HMHSO1zVej7tt01GkOHL/lljYQ4usjKh4dxYQNEEbCewkspAnViAOlbXqLyV
         VkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785563310; x=1786168110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kmzGi8WLW3q9cUIfuI3hkdmHctpvMeJjHJVyiabAW4=;
        b=D3P3xWhw1XLZxbirF2FJRQeNe9ZJB4kATFTdP8xK1vK35pfEzcI8iURQGZaOL91gdh
         nzvp69DR3GFzBEGxkEdimKEMSMsSy/97WYF9I57QUipMAI+mGEBPuJ+/UWuzW/tbR5O3
         6xeXRz0hTulIHYU80tHDywXve/BzH3/5ZOj4NAlLlOydRyVAkPTkxhZqmxkr1MboEEHD
         JoP+e7jeLBej60xr3vqPYck3z9XLrmspcN4Gv8vq0bNNeUTbMKLa57ueint/hhWQSiD5
         zyHG3kagujHVHLt/qNopiVMkyOHdvDpr+7cg80RsOvyZuPmNNqCoOKK9zYKqK3leMQc2
         2/+w==
X-Gm-Message-State: AOJu0YwQD2Pl5BARBYuFrHCHo5pEo3DdEcE9/vt4+NZVyZDIC4eiRA52
	1UkyR8UrPwR68Bot4MDRoiaaePm3byZL+3GPBJhLvLwEeRf8i6ZcDuvqGjz0J2sxHvqU1pamyhh
	eS2JTMbZltFwuUGn65eNjm0lqYkMDTVNtsVe5rbeMFnBAR2Lnb/ln6BF+X+/rrQu6golB
X-Gm-Gg: AR+sD13zZMbOtZ5wQk7AvMeRbp+qT8WKsA4tiMRznXemx+PSANGy3kCDNQNASlA/dnY
	KhArpEKyqXcbPoqIm5cy0zy837VptEWw1xw3hTMPJE7v1wlkp9akIAy2y5WxAVWXFgo9ACAMih8
	QbU5ASy8jlIAQzIFgpXpGyL651zRd2JQ+r5rBYIBrSNYVSrFGHvwATIf/MW6f5ivBncrHXLvjEd
	zYmE3TfFIivPas6fMpPs3eoxginiwJMtR8aJtfQZBG/R/Nt2+cnwWeQo/OtGUWjoeNw+5PELEfL
	05YJJXICvT8obwJmAJe27uVjkrrKF5jkITjQHCh+P+Jxncb3Z2xDfVvJ64X9XCwOrqTvEvbsNl/
	X9o9K/jokM0Fig2JqjUwYdCDJR22+pT44IQ==
X-Received: by 2002:a17:902:f78e:b0:2ca:c68:c554 with SMTP id d9443c01a7336-2d05241f274mr23182135ad.38.1785563310480;
        Fri, 31 Jul 2026 22:48:30 -0700 (PDT)
X-Received: by 2002:a17:902:f78e:b0:2ca:c68:c554 with SMTP id d9443c01a7336-2d05241f274mr23181905ad.38.1785563309957;
        Fri, 31 Jul 2026 22:48:29 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e666sm18305211eec.4.2026.07.31.22.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 22:48:29 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 11:18:15 +0530
Subject: [PATCH v2 1/3] serial: qcom-geni: Use common GENI resource
 initialisation helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-reuse_common_geni_framework_helpers-v2-1-13753256ef71@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785563302; l=6186;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=MgKtl/MZBgsFKwakhQrsDRziDrdSWAQ759cFA3oxkBI=;
 b=YB81WKLpf2lneMGAuZ33Vaec8Tnf/AEQkHovKF2pKFp6dHnpiSvvTeq2eK91fVg/71UwK7MfC
 feTUrzVXgIuCkd0EHU74XbjahIvnNKcwZB5eFOK/Wg7f1ytX4hQQh2s
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAzNyBTYWx0ZWRfXxPH7QzjCFKzO
 W9VeUPx6ffSzJ2TC4T3sGNB0112+Gsa7WQK+w5jV9wKmrlshESCoU5IgY8uKdZnJV9SX5yvQ7U0
 ltZceGLcg4aghSYAa+hBFQIfKMUJMEY=
X-Proofpoint-GUID: Hm7EZIhDzODOUqu7NgqF6vWVZEVkSip9
X-Proofpoint-ORIG-GUID: Hm7EZIhDzODOUqu7NgqF6vWVZEVkSip9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAzNyBTYWx0ZWRfX/U+ZGntSEmHu
 KQJ6NgtySKHHMCSEGO06JbAYM9wrdk+koNkQSIFnI+gIuA6qUjlKPTWHxVkmbLKMNSj7YW8diAi
 5jL1BF8RsdXgrNc0tN+l97yqj1Hj+GhZAOwE/BPMOqN8LX11buHf/3cbCkEWqVPtZbgUwBR5jhv
 4h42tTrtquCGFNTk8t3DJ4lJH9rIeVDiaf5uHwKVKvVj9iUDdgqOqGKQsQKB5d59jDiCtR+5VYo
 oHVvB9cQ0RoUE4thBcP8282WS+jClaL6N1Ksi7ZuBCHD2Hts3ofq8ULJho5i+bgmF3JbUsFUmgC
 49MRF+eUQVk4Z4aNb49jdhlALas3fEDlbHOgdotmQrSGLGkQnxu+vtdtH/R+qTZinVvxQSBxeFV
 Lvp+yEVcC7pCOrvuGOCuFk2xRLiBHJ0KZzPXAM6Gy2rBlmmUoRAhQ0IFtLtKxDkaSrLcrB2ixer
 u1Hika9cLJDulEl5QNg==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6d88af cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=R6AoGHhCE4Cl6DLjkzUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010037

The UART driver maintains local helpers for resource and power-domain
initialisation that duplicate functionality already provided by the common
GENI framework.

Replace the driver-specific implementations with geni_se_resources_init()
and geni_se_domain_attach(), and use the power-domain list stored in
struct geni_se. This reduces code duplication and centralises GENI resource
management without functional changes.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 81 ++++-------------------------------
 1 file changed, 9 insertions(+), 72 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index fa4adb543562..c8c4f01d3143 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -115,8 +115,7 @@ static DEFINE_IDA(port_ida);
 struct qcom_geni_device_data {
 	bool console;
 	enum geni_se_xfer_mode mode;
-	struct dev_pm_domain_attach_data pd_data;
-	int (*resources_init)(struct uart_port *uport);
+	int (*resources_init)(struct geni_se *se);
 	int (*set_rate)(struct uart_port *uport, unsigned int baud);
 	int (*power_state)(struct uart_port *uport, bool state);
 };
@@ -159,7 +158,6 @@ struct qcom_geni_serial_port {
 	struct irq_work tx_kick;
 	struct qcom_geni_private_data private_data;
 	const struct qcom_geni_device_data *dev_data;
-	struct dev_pm_domain_list *pd_list;
 	struct notifier_block panic_nb;
 };
 
@@ -1500,7 +1498,7 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
 static int geni_serial_set_level(struct uart_port *uport, unsigned int baud)
 {
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
-	struct device *perf_dev = port->pd_list->pd_devs[DOMAIN_IDX_PERF];
+	struct device *perf_dev = port->se.pd_list->pd_devs[DOMAIN_IDX_PERF];
 
 	/*
 	 * The performance protocol sets UART communication
@@ -1860,57 +1858,6 @@ static int geni_serial_resource_state(struct uart_port *uport, bool power_on)
 	return power_on ? geni_serial_resources_on(uport) : geni_serial_resources_off(uport);
 }
 
-static int geni_serial_pwr_init(struct uart_port *uport)
-{
-	struct qcom_geni_serial_port *port = to_dev_port(uport);
-	int ret;
-
-	ret = dev_pm_domain_attach_list(port->se.dev,
-					&port->dev_data->pd_data, &port->pd_list);
-	if (ret <= 0)
-		return -EINVAL;
-
-	return 0;
-}
-
-static int geni_serial_resource_init(struct uart_port *uport)
-{
-	struct qcom_geni_serial_port *port = to_dev_port(uport);
-	int ret;
-
-	port->se.clk = devm_clk_get(port->se.dev, "se");
-	if (IS_ERR(port->se.clk)) {
-		ret = PTR_ERR(port->se.clk);
-		dev_err(port->se.dev, "Err getting SE Core clk %d\n", ret);
-		return ret;
-	}
-
-	ret = geni_icc_get(&port->se, NULL);
-	if (ret)
-		return ret;
-
-	port->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
-	port->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
-
-	/* Set BW for register access */
-	ret = geni_icc_set_bw(&port->se);
-	if (ret)
-		return ret;
-
-	ret = devm_pm_opp_set_clkname(port->se.dev, "se");
-	if (ret)
-		return ret;
-
-	/* OPP table is optional */
-	ret = devm_pm_opp_of_add_table(port->se.dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(port->se.dev, "invalid OPP table in device tree\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 /**
  * qcom_geni_rs485_config - Configure RS485 settings for the UART port
  * @uport: Pointer to the UART port structure
@@ -2024,7 +1971,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	port->se.dev = &pdev->dev;
 	port->se.wrapper = dev_get_drvdata(pdev->dev.parent);
 
-	ret = port->dev_data->resources_init(uport);
+	ret = port->dev_data->resources_init(&port->se);
 	if (ret)
 		return ret;
 
@@ -2137,7 +2084,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 				 DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
 		port->rx_dma_addr = 0;
 	}
-	dev_pm_domain_detach_list(port->pd_list);
+	dev_pm_domain_detach_list(port->se.pd_list);
 	return ret;
 }
 
@@ -2162,7 +2109,7 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 		port->rx_dma_addr = 0;
 	}
 
-	dev_pm_domain_detach_list(port->pd_list);
+	dev_pm_domain_detach_list(port->se.pd_list);
 }
 
 static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
@@ -2242,7 +2189,7 @@ static int qcom_geni_serial_resume(struct device *dev)
 static const struct qcom_geni_device_data qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
-	.resources_init = geni_serial_resource_init,
+	.resources_init = geni_se_resources_init,
 	.set_rate = geni_serial_set_rate,
 	.power_state = geni_serial_resource_state,
 };
@@ -2250,12 +2197,7 @@ static const struct qcom_geni_device_data qcom_geni_console_data = {
 static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
-	.pd_data = {
-		.pd_flags = PD_FLAG_DEV_LINK_ON,
-		.pd_names = (const char*[]) { "power", "perf" },
-		.num_pd_names = 2,
-	},
-	.resources_init = geni_serial_pwr_init,
+	.resources_init = geni_se_domain_attach,
 	.set_rate = geni_serial_set_level,
 };
 #endif
@@ -2263,7 +2205,7 @@ static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
 static const struct qcom_geni_device_data qcom_geni_uart_data = {
 	.console = false,
 	.mode = GENI_SE_DMA,
-	.resources_init = geni_serial_resource_init,
+	.resources_init = geni_se_resources_init,
 	.set_rate = geni_serial_set_rate,
 	.power_state = geni_serial_resource_state,
 };
@@ -2271,12 +2213,7 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
 static const struct qcom_geni_device_data sa8255p_qcom_geni_uart_data = {
 	.console = false,
 	.mode = GENI_SE_DMA,
-	.pd_data = {
-		.pd_flags = PD_FLAG_DEV_LINK_ON,
-		.pd_names = (const char*[]) { "power", "perf" },
-		.num_pd_names = 2,
-	},
-	.resources_init = geni_serial_pwr_init,
+	.resources_init = geni_se_domain_attach,
 	.set_rate = geni_serial_set_level,
 };
 

-- 
2.34.1

