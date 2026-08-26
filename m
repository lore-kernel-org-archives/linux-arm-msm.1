Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F063B840F
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740068; cv=none; b=SuF6nvLgRergPrXFEYIDBRyotITMjX8gqtQT8TtJptwY2yqZLhTJf12Y7w+0ex6D25OvMMo3AYH2/DpC/Mjnfdk0kO94fI8Mmr8uhbai0vLSm7lfzR2DpdEQaJcr59s5fm+dh6aW3rvO7AH2+ObTZcZbE+nzGk2dBIe8KYwVRRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740068; c=relaxed/simple;
	bh=Lf0DV6zqTiNRbRqg0PwFD+T9VOrPKtziLfLRHxcXw+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYdH/45of5jM89Nxn/v8ELL3OjtjRrA/c1CC/u/XJbshUgAuNC7BR5Bnh9xXxL+X2lXbEp8zeJuW0UZ9MCsXRRy9Ywt6dawWKTIev3z/MhWytMfTQihkB6xD0BEGzsFvWU1kqetOTillDTGNBliHS6GZhYYlLxCeuuogNFqAAdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rc1NaWyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSpgFzwp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rc1NaWyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSpgFzwp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGUMx017281
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gbJ+FmOGmDz
	b9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=; b=Rc1NaWyIaY7ZCx9lrwqpQlqjhuG
	Jkt1Edc+sE4suC4XX8di+BV6gXRtEKcWnDl5zOghZIQ3NmzVc5WG+gu8kL7NEKyv
	3+z39tbHV+FRro5ovW9bbzlreg0MhpZj1HkgcJrOZsAEYdIjHnPrbHTwckRidgQ4
	4Sh2VDN72DFdLj9j2O9BIBS+hOTfSKamgMX5jqdYGWpMNY/hr2o8J4AvJLoeKERw
	QGYkeOxZV/7znyLfr6e+lNJBWXMMnOiQYRD8ZSLqdHsF/f42T8PWSfYt1A7G8u5e
	WgN0RBfFdrRUDWfFC3E96RoOCfk4RyeHsircR6JcCSWTtGhTSfmOxEtPfYw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn3dv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:27:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso4754521cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740061; x=1788344861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=;
        b=XSpgFzwpcN1C7C3ry25WKQGoW/ElMLwdjSffVFgMt2PBMbUM6IDEQ3Ry9mopaYh3Of
         a1hOx+2m8o5Su93e5Vr4GmXcPupqtK9oBcm2PG6RN3hZX6d+LNBFUenJ4OJRZhzz8R7W
         rfvyCf0XTjr+oM1LP5ny3qKlU3Cl5H2kz2y9Pxw1ublZqpcMqCIBJwzK4OuIe29iQ/ff
         Y4gg5i/VdiWiD9ZutBkHBPv7GdgcSpm3/qASueuIuMX+GwCmGNS4FhbM0/LWSoMJmRgx
         LG+bWgK595rS3+wsSqp1gZF48P2XA/+B2pNl4OCELEpdSgtCJmceotwJYU2U2Qyqu4+Q
         CMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740061; x=1788344861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=;
        b=AD1Va78n1YDfXx4i+FTF96Kck+DhKG/K2hKSdA1n41qJE3BdUfWolotCS1lDtE4ZkJ
         1ilB0eUmQb5WcjBUAgP69LCISWKFEoC2GLrvj2f8d2Nbu6wmx09r2U+csLv34tQXKBYW
         Jut9gvIMkTdOnoTm3v0iQIZQ3TX0rM5NeE0ej5cSaIsoGEbNXYDRGjzUGIF9Rp6AZwlZ
         FxRJUfsHDofuqhNHo0P0MDprzzGO/kMzHKG98sl5HR7Be20AOSGyNUWKaeGm34r8bsGA
         jwW9VUz/OiqcUxavvx8Z+wJJ9IR394MQYduOrnGtmVveb5w+7XYNN0ZG7F5TxaVHmX3t
         5Vsw==
X-Forwarded-Encrypted: i=1; AHgh+RqwRFxQbLEGnJj+ZYKbFXw7Pr5hi3ZM2c06GC8Gpzr/oKbXq5oZuKQMQGMUE36JQofvqAE+BaRLBYxXeagZ@vger.kernel.org
X-Gm-Message-State: AFuF++k+52t/yIPahqkefe6xLW4RHe0yr6Gj09oOhTJODw1vEVVCnvaV
	24HF19UzBRsmJl8OPqsklpkY9f3rrYmBSDov9zTJFbbtvfAk3IOMdMOyVjpo95UeI9oxRbS404+
	7dYs00m8pXCfXiTXXwLR1QaRLSpdupvSE7FgKNH4nFKaneAcI8B+2oZgcnsh9IdexW6DrjsG255
	XB
X-Gm-Gg: AR+sD10DMIDVQ9YIs5I7aiAzqpc0SQOtgFBHifG3xzNQpSUgvZ/ejjLVvUCnjZeGRgE
	Oyv/v6gzjp2UGV3PIoPYAoZ2fR5urc2peI7kmKDuRFTgGHnDILAO5CSCMLjaHgdcd3Zf7isVbCZ
	deVIBbJ95soOwUMmmGG7yMeh2hjOiiN7e8Y27Hy1KoIqDhU+MeB0cXOyO93BOivh7gFulJk9IkL
	vVFbHHFCWl//H0dJuhPWpRj/kS3ofITLK6QfFrLDgQ1FWWhEEqujsYuWr2bb6cErOpsIXOUs1lo
	DR9SIyRnPp5ViYjccsth11HLCfXFKeGrhWfbquuD6qllQv3kkg96N+yX1gYY5KLlFl7mKz5Lflp
	ovptn64Xew8tm8U0Iuof3HGnP3I+jyHO5NZ95CJ/16feeztv5qdY3QBrh64YudncBIDI8gH35o4
	SxKk4tE9Rli9ErY3I=
X-Received: by 2002:ac8:5f10:0:b0:52d:6afd:7db5 with SMTP id d75a77b69052e-52e4230c933mr43890931cf.25.1787740061230;
        Wed, 26 Aug 2026 03:27:41 -0700 (PDT)
X-Received: by 2002:ac8:5f10:0:b0:52d:6afd:7db5 with SMTP id d75a77b69052e-52e4230c933mr43890631cf.25.1787740060761;
        Wed, 26 Aug 2026 03:27:40 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68d1sm506364966b.11.2026.08.26.03.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:27:39 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] firmware: arm_scmi: Pre-register protocol, name tupples for IMX protocols
Date: Wed, 26 Aug 2026 12:27:34 +0200
Message-ID: <20260826102734.31766-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
References: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rMBKNWHj0oQKuW8ZOCsoH123kmyrqcZs
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX4WXYAE8t+POL
 UfS4Yw4lxji/Xv1nq8n5qgxAe9kEFkD5+QtRLA9j+qyKEIF0ajgfudUx9UuAgq3BO3slDfXj0FV
 ivWwOQYf6hsaDUVuM1a9BfrRyFxRNQM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX/CsxeudS9Tep
 QZ8aZWr68dq8QUoXlZ4BTP5GIJOF9L35/2dsM6jsFXGadI+bXkSj2x85y0soy2sdj2WoV67n44s
 kuCIu7uCQIJZwTkNaSUVJpgtUvVPvRRxbb+bp0E9UiUb2zy2m/ErOptT3SzSUToO8XWGa+QWxnI
 EYymSwZ26IjomvdpirekrS/d+CSt2/ZBEv5ik9pmmpmydvmfqtjuLMb5Fsr/XF36i3yTzKtGKvo
 OL1M89r00GgIcpKySz2Nk/PlzHs7CeNrgZiYCYPa6FaSRfZb9hSsAhm0e0F7Y8zLF1CFXaOeyD0
 eWGUC3aetQue4K9X4lRe1ixhWep0kbIqCLWvR+mChSSNhjnDOJ1/s7ccjfBSeEiVYaLOVKOcaK3
 KgmlpNfUAiBrAOIIigN/+W6CRgo3JL3Ru/9cZ/JKK/lmcaxVPQSB+7U2YKT9j7iZkKYZCl4s9WH
 Vm/GkT8GPcwIfIQOC9Q==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8ebf9e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=88Q6Yv8u5fullXUEwxUA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: rMBKNWHj0oQKuW8ZOCsoH123kmyrqcZs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087

There are in tree drivers for various IMX vendor protocols, also
pre-register the { protocol, name } tupples for these to make module
auto-loading work for these in tree drivers.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v3:
- New patch in v3 of this patch-set
---
 drivers/firmware/arm_scmi/bus.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 111727904a89..9f5740dc606f 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/device.h>
+#include <linux/scmi_imx_protocol.h>
 
 #include "common.h"
 
@@ -580,8 +581,8 @@ static void scmi_devices_unregister(void)
 	bus_for_each_dev(&scmi_bus_type, NULL, NULL, __scmi_devices_unregister);
 }
 
-/* Standard protocols table */
 static const struct scmi_device_id scmi_std_id_table[] = {
+	/* Standard protocols */
 	{ SCMI_PROTOCOL_POWER, "genpd" },
 	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
 	{ SCMI_PROTOCOL_PERF, "perf" },
@@ -594,6 +595,12 @@ static const struct scmi_device_id scmi_std_id_table[] = {
 	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	/* Vendor protocols with in tree drivers */
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-key" },
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-rtc" },
+	{ SCMI_PROTOCOL_IMX_CPU, "imx-cpu" },
+	{ SCMI_PROTOCOL_IMX_LMM, "imx-lmm" },
+	{ SCMI_PROTOCOL_IMX_MISC, "imx-misc-ctrl" },
 	{ },
 };
 
-- 
2.55.0

