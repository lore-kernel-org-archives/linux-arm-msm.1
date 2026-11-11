Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418315;
	b=Q4JowtMMa977De9uFoSvcf/2l/ZiIyuG7eFKJYjgIPtx88KEtZRIovo4HWYkHtJXFlPo
	 xZnCrOao13Qy8+WdKodrpL9+PnZe5Ce6tilFxzJR7zUG8H3hU8pKCcMTeyfKMqjcm3wWZ
	 3leZ+minNN4V7pS03FRQ6klwjm4fLhIevYvVhvZXoBi5uyW4uuQQ3kCirctLlEikkSI8S
	 rO9FCvNN0RkicUnTR/OA8Mk02Dd8g/q2RnOOmXudypy8KHvdzcIAo0FKrr6TrriW2482H
	 xpKeBrdZ0J+ZoI00WS3Jn4q557qWQqkzkuAWo10dB0nzOFXhrCt5gi+oZE96j7SXs1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418315;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=otvmRpR2mK9xATk3zKc89PSH5qkhX1CxundPT37cRfY=;
	b=IwPMFh4IRnBvw+9+ikToXb7yuQoSt2pzHrvo4gIcB15bRXrJubyTCwJXI731myucRtkN
	 rJWqWkNnpGGwy3/Fzkj2SmafV4tWUV6CF6pb/OvzgQkL13rT/+99B1KbD7PvGhiMzUFNL
	 xl11dO0g3YeBuVDzz8mLrSCFDvFF6EV/m+xmVBQx41aDcD4naWe8UlMiNlbn619a5SbVq
	 /T3G9zKZGW3SbbRGch1dGFQOPLOk6fzLihC3zxD0RwHN+sPBwor9ZSWwEQYMEeSQfP+pE
	 dGL+YkSbB4LWYcdRuMeECZdugdBnAYZQujWweljRXDF2g8uS0hHVnApQET8/mLhixXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BkVMxjvy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iSHwcQhE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA9F606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA9F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BkVMxjvy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iSHwcQhE
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0I672651078
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	otvmRpR2mK9xATk3zKc89PSH5qkhX1CxundPT37cRfY=; b=BkVMxjvyHZZaGmpJ
	UILkB8hwOEjHL8wkNRNqodvVze2CZkaZqngmCeeg/nES7D0hVxx5ex5XBThvtUAj
	lchHR5RHtI+dquTcAvY3SDbB7kO3G3L280SzNU3SZzmyuRmkjj2tucwc3HwXcSxn
	p38RHfxFbSsd/v525qhhri4dgNtH/5ZLjyuDuVDL7ZW+Jn9O82nXFbzX0BDa7qi2
	ezm3y1MliNRajb00qh2vhTS/WBm8QMhY3MvRp4XxV2v+gUCdCzdsTR/tinsYHQ9L
	ovRGb5Lq/AACbymkxO02zGKsrgnr2+ZZqrdnYM32uKHvm1bn02pfrXeZck8WOvQq
	wdk2hw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmbwxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:31:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so2808943a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794418312; x=1795023112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=otvmRpR2mK9xATk3zKc89PSH5qkhX1CxundPT37cRfY=;
        b=iSHwcQhEcQt5Y8gamVCHQGAwvFJXUpTbtIlbcFdS7ycMGuld5ObCXGDg22lW6UpW/L
         iwdO1T0LMoOTuYyRNsjpUQ101UsUQ5zU3J0q4DfORISdKpi7DaqIAHlYkfacAys+VCRo
         6LB/CX/LqiOByOdx5mkB8qMK+l9maReuWPKFzg5CCYjqalSVqQlAWR8RNy/0Ow6WOlny
         HC0Mhq8DMebIKU0Grui2KTKR+OdPx+UxohTYBZOs35clh85tzcOKUSMbbLJ+c+sPHzmF
         F/8g4AjM+vERJjq1KglEZWQPzMlirR9jpblmZDCTxbtUf3JMSO2nZiPCb2g48vW9bc/h
         KLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418312; x=1795023112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=otvmRpR2mK9xATk3zKc89PSH5qkhX1CxundPT37cRfY=;
        b=fXFL8BbAHPvad69ag69vWlJrPbJ2rW3legUKSfPb6YnevHK903pKy38jjJEu1epdEC
         ia/NHxxd8l3X+e3n6WPzKx5c14VFwxVXH9nrKqZV37z7tiByTjWtTU4GtVhH1PiVBLqA
         q2M8tkNPUFloBGnz8DDyuY7A5Q7ciP0e/HFUYbdV7c5hvvAUKlfb5qnddJ8PviHkkUyk
         a9IxIJjaXz+0RTqkOX8gJXPjVKrKULp6p1cIRi3IXew8WD3lccyhjZ6chUzD4Y8bB7kH
         UfauLhwDFSrbuK1cBVpYSrk6NKDKfm5NoRDoCBkerYYAC4NWK9nWk1iVfIaHWwqxtg2X
         aG8g==
X-Gm-Message-State: APuU4Z9kQmMl8TtFdbDVNXujUQqqBa4FfwlYRkTE8XmbXIG8PK9SYbXX
	BRXafFvxtNvaG9h4EhlwGmnJG85xJdXgmm3t8jZAEik8zG58Ahs0fqCWCM7/HBJab1FONNIyCe2
	nh3hoDdLLG4s2N19KNo47dEnFhT94mUBbFiJ8rLMDRyHjvKK2Jr/uevKkXLHhSly38K+aDeCbSc
	c5
X-Gm-Gg: AYBFou2oBJP88KkacRVQYkvHkspXFoIc3RqXglVR3PLk6VBxSP8brnjmWtDoBgfhUlC
	C+MpY8YGljHj5hgglTcVI5Y+DpAUKSjEFuE1rke5zVYNJwfts45v5in45+SFzpFbFVfgqsVXttz
	xoJUVi1UrRuz2kKlrV3Cke8bLhUEQJO6YebdqRWynMKzaXqq0oMyXqhhyVHwOh+K8CIqClx5JsR
	SM2Xl6JlGPDE+XEH6RNA0jp0RxX/KXGGifI/Dgf3L5xuqrZ3rzcgQYJ+8+C9Id2eiDGXb/BMYV/
	ybF7z6HxY1ndZ4UlDsCxzCrYPSyQ7JVUqeSFhDD+efVx4vD8d+NU8JAlaqR616j1AspxZub1fEE
	0BtHIv2ekEBXiTviVrbtPG4brb+LNxVxxqIDvuFf0KOGdVovHclBM8F0C5tVKvxqijS0qSmWWhP
	6mpbIjNkXsaSnQJP5VQyIa7s6srxg15ym4eQLji+K2Fg==
X-Received: by 2002:a17:90b:164a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b182f5a30cmr2942303a91.40.1794418312146;
        Wed, 11 Nov 2026 09:31:52 -0800 (PST)
X-Received: by 2002:a17:90b:164a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b182f5a30cmr2942283a91.40.1794418311566;
        Wed, 11 Nov 2026 09:31:51 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c42c11sm237305a91.2.2026.11.11.09.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:31:51 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 23:01:27 +0530
Subject: [PATCH 2/2] phy: qcom: qusb2: Add charger detection support
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-shikra-qusb2-charger-det-v1-2-5a9d919c66b5@oss.qualcomm.com>
References: <20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com>
In-Reply-To: <20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794418296; l=22926;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=+5o2fRk4SGOPPm/ZSNnqD6Ah36z+fkN8a8M9tLB/1WQ=;
 b=v/iTr/gd8B4+PdioG5ny9IyN6k80+xItf9RqxTfJrre32oUjlNw2AYGYU6f5+htAr03WYHP1v
 W+YcRKy9AX3BpdwyszWe2M/bh+j7o6QrEK+TBCnULhSE46Y4SaWA8f5
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: p2fsQnCfHA6UmEfYnJ04UA_YWDFtjLbQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfX9uRn/OOD19Nm
 vhW9j96NCBpmEY8RqJcj4LuduL3S0AhqTcZ/KoQW/XAUYJn5eG+iyQB3IgZpi3JMYL8Y7uUebRN
 /klduRjRhHGg4iimoG6gBkWkWQ0dBQo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfX5qv7x9pszhq/
 1+7MO5exIwD4vQlGsoOdhHkIPzprkTeZbMQqM4gdyKJR7DMIucZJjz0dQ6696tvsWzrcl2rncZK
 QCS5Kkn/19cw+d11kpruVmXY1VQHrPUBEklgG244USyeN/kcI112lWz+Um06dtLMM4dG14Z2MF5
 wUypj7xoiVZvnwGqKN3WPVl5jq6fGqeAIl9I2f459tn1aYqbdZT8gyw+FRoUkX/JuDsuMI3VmAk
 aIa62yOzpFfBPZOHQXQpMYFCMa/AfXOdaSOHWT4xx/cugRJLCNkYCxK80xYb4r5msy0w1Q+QZNB
 5IV9jyi9+E1JAFVvgCszrljcyfFOXlyqDtvXsnFOGg2gpzJGfsNZ0hOcNZSTPYOMNitBrCIprvf
 SkGyCT4ltFUHM4joa/WGhR6ITqCIN6gYrYvfxZTAYSmgQuQ7hNAC/IFxmOvis+vlI7nLfCIm4zr
 qfg+P9RNIquo7wVV54w==
X-Proofpoint-GUID: p2fsQnCfHA6UmEfYnJ04UA_YWDFtjLbQ
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af4a689 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=C7_gml_Do48l-12NHYUA:9 a=eh4htEx1MinpzGgb:21
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110069

QUSB2 Phy is capable of performing BC.1.2 Charger detection by controlling
the dp/dm lines. On platforms where the PMIC isn't capable of performing
charger detection, the responsibility is delegated to the phy.

On Shikra CQM/CQS platforms, the PM4125 relies on QUSB2 Phy to perform
charger detection. As part of this, the following changes are being done:

a) Refactor phy enable/disable calls to control regulators and clocks.

b) Let the usb-role information coming from PM4125 to pass through the phy
so that when a vbus active signal is detected, the phy can check if its
SDP/CDP/DCP and pass on the role to controller only when the charger is
SDP/CDP. In case of host mode, the role is forwarded without any charger
detection.

c) Since the controller probe relies on phy probe to be completed first,
during phy probe, it won't be possible to get role-switch handle of the
controller. Hence check for controller role switch whenever a role info
is obtained from the connector node.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 606 ++++++++++++++++++++++++++++++++--
 1 file changed, 574 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 2e5fdb620cb2..549dc8d1378a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -18,9 +18,31 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/power_supply.h>
+#include <linux/usb/role.h>
 
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 
+#define QUSB2PHY_PORT_QC1	0x70
+#define VDM_SRC_EN		BIT(4)
+#define VDP_SRC_EN		BIT(2)
+
+#define QUSB2PHY_PORT_UTMI_CTRL1	0xC0
+#define SUSPEND_N			BIT(5)
+#define TERM_SELECT			BIT(4)
+#define XCVR_SELECT_FS			BIT(2)
+#define OP_MODE_NON_DRIVE		BIT(0)
+
+#define QUSB2PHY_PORT_UTMI_CTRL2	0xC4
+#define UTMI_ULPI_SEL			BIT(7)
+#define UTMI_TEST_MUX_SEL		BIT(6)
+
+#define QUSB2PHY_PORT_QC2	0x74
+#define RDM_UP_EN		BIT(1)
+#define RDP_UP_EN		BIT(3)
+#define RPUM_LOW_EN		BIT(4)
+#define RPUP_LOW_EN		BIT(5)
+
 #define QUSB2PHY_PLL			0x0
 #define QUSB2PHY_PLL_TEST		0x04
 #define CLK_REF_SEL			BIT(7)
@@ -30,10 +52,19 @@
 #define QUSB2PHY_PLL_USER_CTL2		0x10
 #define QUSB2PHY_PLL_AUTOPGM_CTL1	0x1c
 #define QUSB2PHY_PLL_PWR_CTRL		0x18
+#define PLL_RESET_N_CNT_5		0x5
+#define PLL_RESET_N			BIT(4)
+#define PLL_AUTOPGM_EN			BIT(7)
 
 /* QUSB2PHY_PLL_STATUS register bits */
 #define PLL_LOCKED			BIT(5)
 
+/* QUSB2PHY_PLL_PWR_CTRL register bits */
+#define REF_BUF_EN			BIT(6)
+#define REXT_EN				BIT(4)
+#define PLL_BYPASSNL			BIT(1)
+#define REXT_TRIM_0			BIT(0)
+
 /* QUSB2PHY_PLL_COMMON_STATUS_ONE register bits */
 #define CORE_READY_STATUS		BIT(0)
 
@@ -57,6 +88,10 @@
 #define DMSE_INTR_EN				BIT(1)
 #define DPSE_INTR_EN				BIT(0)
 
+#define QUSB2PHY_PORT_INTR_STATUS	0xF0
+#define DMSE_INTR_HIGH			BIT(2)
+#define DPSE_INTR_HIGH			BIT(0)
+
 /* QUSB2PHY_PLL_CORE_INPUT_OVERRIDE register bits */
 #define CORE_PLL_EN_FROM_RESET			BIT(4)
 #define CORE_RESET				BIT(5)
@@ -97,6 +132,29 @@
 #define QUSB2PHY_IMP_CTRL2			0x224
 #define QUSB2PHY_CHG_CTRL2			0x23c
 
+#define CHG_DCD_TIMEOUT_MSEC			750
+#define CHG_DCD_POLL_TIME_MSEC			50
+#define CHG_PRIMARY_DET_TIME_MSEC		100
+#define CHG_SECONDARY_DET_TIME_MSEC		100
+#define DP_PULSE_WIDTH_MSEC			200
+
+enum port_state {
+	PORT_UNKNOWN,
+	PORT_DISCONNECTED,
+	PORT_DCD_IN_PROGRESS,
+	PORT_PRIMARY_IN_PROGRESS,
+	PORT_SECONDARY_IN_PROGRESS,
+	PORT_CHG_DET_DONE,
+	PORT_HOST_MODE,
+};
+
+enum chg_det_state {
+	STATE_UNKNOWN,
+	STATE_DCD,
+	STATE_PRIMARY,
+	STATE_SECONDARY,
+};
+
 struct qusb2_phy_init_tbl {
 	unsigned int offset;
 	unsigned int val;
@@ -478,9 +536,425 @@ struct qusb2_phy {
 	const struct qusb2_phy_cfg *cfg;
 	bool has_se_clk_scheme;
 	bool phy_initialized;
+	bool is_phy_enabled;
 	enum phy_mode mode;
+	int vbus_active;
+	int id_state;
+	struct power_supply	*usb_psy;
+	struct delayed_work	port_det_w;
+	enum port_state		port_state;
+	unsigned int		dcd_timeout;
+	bool			dcp_charger;
+
+	struct usb_role_switch	*connector_role_sw;
+	struct usb_role_switch	*controller_role_sw;
+	enum usb_role		current_role;
+	struct mutex		role_lock;
 };
 
+static int qusb_phy_notify_charger(struct qusb2_phy *qphy,
+					enum power_supply_usb_type charger_type)
+{
+	union power_supply_propval pval = {0};
+
+	if (!qphy->usb_psy) {
+		qphy->usb_psy = power_supply_get_by_name("pm4125-charger");
+		if (!qphy->usb_psy) {
+			dev_err(&qphy->phy->dev, "could not get usb power supply\n");
+			return -ENODEV;
+		}
+	}
+
+	dev_dbg(&qphy->phy->dev, "notifying charger type: %d\n", charger_type);
+
+	pval.intval = charger_type;
+	power_supply_set_property(qphy->usb_psy, POWER_SUPPLY_PROP_USB_TYPE,
+									&pval);
+	return 0;
+}
+
+static bool qusb_phy_chg_det_status(struct qusb2_phy *qphy,
+						enum chg_det_state state)
+{
+	u32 reg, status;
+
+	reg = readl_relaxed(qphy->base + QUSB2PHY_PORT_INTR_STATUS);
+	dev_dbg(&qphy->phy->dev, "chg_det_status: state=%d intr_status=0x%02x\n",
+		state, reg);
+
+	status = reg & 0xff;
+
+	switch (state) {
+	case STATE_DCD:
+		return (status != DPSE_INTR_HIGH);
+	case STATE_PRIMARY:
+		return (status && (status != DPSE_INTR_HIGH));
+	case STATE_SECONDARY:
+		return status;
+	case STATE_UNKNOWN:
+	default:
+		break;
+	}
+
+	return false;
+}
+
+/*
+ * Different circuit blocks are enabled on DP and DM lines as part
+ * of different phases of charger detection. Then the state of
+ * DP and DM lines are monitored to identify different type of
+ * chargers.
+ * These circuit blocks can be enabled with the configuration of
+ * the QUICKCHARGE1 and QUICKCHARGE2 registers and the DP/DM lines
+ * can be monitored with the status of the INTR_STATUS register.
+ */
+static void qusb_phy_chg_det_enable_seq(struct qusb2_phy *qphy, int state)
+{
+	dev_dbg(&qphy->phy->dev, "chg_det_enable_seq: state=%d base: %pK\n", state, qphy->base);
+
+	writel_relaxed(0x23, qphy->base + qphy->cfg->regs[QUSB2PHY_PORT_POWERDOWN]);
+	writel_relaxed(0x35, qphy->base + QUSB2PHY_PORT_UTMI_CTRL1);
+	writel_relaxed(0xC0, qphy->base + QUSB2PHY_PORT_UTMI_CTRL2);
+	writel_relaxed(0x05, qphy->base + QUSB2PHY_PLL_AUTOPGM_CTL1);
+	writel_relaxed(0x22, qphy->base + qphy->cfg->regs[QUSB2PHY_PORT_POWERDOWN]);
+	writel_relaxed(0x17, qphy->base + QUSB2PHY_PLL_PWR_CTRL);
+
+	usleep_range(5, 10);
+
+	writel_relaxed(0x15, qphy->base + QUSB2PHY_PLL_AUTOPGM_CTL1);
+	writel_relaxed(0x00, qphy->base + QUSB2PHY_PORT_QC1);
+	writel_relaxed(0x00, qphy->base + QUSB2PHY_PORT_QC2);
+
+	usleep_range(50, 60);
+
+	switch (state) {
+	case STATE_DCD:
+		writel_relaxed(0x08, qphy->base + QUSB2PHY_PORT_QC1);
+		writel_relaxed(0x01, qphy->base + QUSB2PHY_PORT_QC2);
+		writel_relaxed(0x1F, qphy->base + qphy->cfg->regs[QUSB2PHY_INTR_CTRL]);
+		break;
+	case STATE_PRIMARY:
+		writel_relaxed(0x25, qphy->base + QUSB2PHY_PORT_QC1);
+		writel_relaxed(0x00, qphy->base + QUSB2PHY_PORT_QC2);
+		writel_relaxed(0x1F, qphy->base + qphy->cfg->regs[QUSB2PHY_INTR_CTRL]);
+		break;
+	case STATE_SECONDARY:
+		writel_relaxed(0x72, qphy->base + QUSB2PHY_PORT_QC1);
+		writel_relaxed(0x00, qphy->base + QUSB2PHY_PORT_QC2);
+		writel_relaxed(0x1F, qphy->base + qphy->cfg->regs[QUSB2PHY_INTR_CTRL]);
+		break;
+	case STATE_UNKNOWN:
+	default:
+		break;
+	};
+}
+
+/*
+ * qusb2_phy_enable_phy - power up regulators and enable clocks for the PHY.
+ *
+ * Used by the charger-detection path to bring the PHY up before programming
+ * the QC1/QC2 detection registers, and by qusb2_phy_init().
+ * No-op if the PHY is already enabled (is_phy_enabled is true).
+ */
+static int qusb2_phy_enable_phy(struct qusb2_phy *qphy)
+{
+	struct device *dev = &qphy->phy->dev;
+	int ret;
+
+	if (qphy->is_phy_enabled) {
+		dev_dbg(dev, "PHY already enabled, skipping\n");
+		return 0;
+	}
+
+	dev_vdbg(dev, "enabling PHY clocks and regulators\n");
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
+	if (ret) {
+		dev_err(dev, "failed to enable regulators, %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(qphy->iface_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable iface_clk, %d\n", ret);
+		goto disable_regs;
+	}
+
+	ret = clk_prepare_enable(qphy->cfg_ahb_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable cfg_ahb_clk, %d\n", ret);
+		goto disable_iface_clk;
+	}
+
+	if (!qphy->has_se_clk_scheme) {
+		ret = clk_prepare_enable(qphy->ref_clk);
+		if (ret) {
+			dev_err(dev, "failed to enable ref_clk, %d\n", ret);
+			goto disable_ahb_clk;
+		}
+	}
+
+	qphy->is_phy_enabled = true;
+
+	return 0;
+
+disable_ahb_clk:
+	clk_disable_unprepare(qphy->cfg_ahb_clk);
+disable_iface_clk:
+	clk_disable_unprepare(qphy->iface_clk);
+disable_regs:
+	regulator_bulk_disable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
+	return ret;
+}
+
+/*
+ * qusb2_phy_disable_phy - disable clocks and power down regulators for the PHY.
+ */
+static void qusb2_phy_disable_phy(struct qusb2_phy *qphy)
+{
+	if (!qphy->is_phy_enabled) {
+		dev_dbg(&qphy->phy->dev, "PHY already disabled, skipping\n");
+		return;
+	}
+
+	dev_vdbg(&qphy->phy->dev, "disabling PHY clocks and regulators\n");
+
+	if (!qphy->has_se_clk_scheme)
+		clk_disable_unprepare(qphy->ref_clk);
+
+	clk_disable_unprepare(qphy->cfg_ahb_clk);
+	clk_disable_unprepare(qphy->iface_clk);
+	regulator_bulk_disable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
+	qphy->is_phy_enabled = false;
+}
+
+/*
+ * qusb2_phy_forward_role - forward a USB role to the controller.
+ *
+ * Only called after charger detection confirms the port is SDP or CDP, so
+ * the controller knows it should operate in device mode.
+ */
+static void qusb2_phy_forward_role(struct qusb2_phy *qphy, enum usb_role role)
+{
+	if (!qphy->controller_role_sw)
+		return;
+
+	dev_dbg(&qphy->phy->dev, "forwarding role %s to controller\n",
+		usb_role_string(role));
+
+	usb_role_switch_set_role(qphy->controller_role_sw, role);
+}
+
+static int qusb_phy_drive_dp_pulse(struct qusb2_phy *qphy)
+{
+	int ret;
+
+	dev_dbg(&qphy->phy->dev, "connected to a CDP, drive DP up\n");
+
+	ret = qusb2_phy_enable_phy(qphy);
+	if (ret)
+		return ret;
+
+	ret = reset_control_assert(qphy->phy_reset);
+	if (ret)
+		dev_err(&qphy->phy->dev, "phy assert failed\n");
+	usleep_range(100, 150);
+	ret = reset_control_deassert(qphy->phy_reset);
+	if (ret)
+		dev_err(&qphy->phy->dev, "phy deassert failed\n");
+
+	writel_relaxed(CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
+			qphy->base + qphy->cfg->regs[QUSB2PHY_PORT_POWERDOWN]);
+	writel_relaxed(TERM_SELECT | XCVR_SELECT_FS | OP_MODE_NON_DRIVE |
+			SUSPEND_N, qphy->base + QUSB2PHY_PORT_UTMI_CTRL1);
+	writel_relaxed(UTMI_ULPI_SEL | UTMI_TEST_MUX_SEL,
+			qphy->base + QUSB2PHY_PORT_UTMI_CTRL2);
+	writel_relaxed(PLL_RESET_N_CNT_5,
+			qphy->base + QUSB2PHY_PLL_AUTOPGM_CTL1);
+	writel_relaxed(CLAMP_N_EN | FREEZIO_N,
+			qphy->base + qphy->cfg->regs[QUSB2PHY_PORT_POWERDOWN]);
+	writel_relaxed(REF_BUF_EN | REXT_EN | PLL_BYPASSNL | REXT_TRIM_0,
+			qphy->base + QUSB2PHY_PLL_PWR_CTRL);
+
+	usleep_range(5, 10);
+
+	writel_relaxed(0x15, qphy->base + QUSB2PHY_PLL_AUTOPGM_CTL1);
+	writel_relaxed(PLL_RESET_N | PLL_RESET_N_CNT_5,
+			qphy->base + QUSB2PHY_PLL_AUTOPGM_CTL1);
+	writel_relaxed(0x00, qphy->base + QUSB2PHY_PORT_QC1);
+	writel_relaxed(0x00, qphy->base + QUSB2PHY_PORT_QC2);
+
+	usleep_range(50, 60);
+
+	writel_relaxed(RDP_UP_EN, qphy->base + QUSB2PHY_PORT_QC2);
+
+	msleep(DP_PULSE_WIDTH_MSEC);
+
+	writel_relaxed(CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
+			qphy->base + qphy->cfg->regs[QUSB2PHY_PORT_POWERDOWN]);
+	writel_relaxed(PLL_AUTOPGM_EN | PLL_RESET_N | PLL_RESET_N_CNT_5,
+			qphy->base + QUSB2PHY_PLL_AUTOPGM_CTL1);
+	writel_relaxed(UTMI_ULPI_SEL, qphy->base + QUSB2PHY_PORT_UTMI_CTRL2);
+	writel_relaxed(TERM_SELECT, qphy->base + QUSB2PHY_PORT_UTMI_CTRL1);
+
+	qusb2_phy_disable_phy(qphy);
+
+	return 0;
+}
+
+static void qusb_phy_port_state_work(struct work_struct *w)
+{
+	struct qusb2_phy *qphy = container_of(w, struct qusb2_phy,
+							port_det_w.work);
+	unsigned long delay = 0;
+	int status, ret = 0;
+
+	dev_dbg(&qphy->phy->dev, "port_state_work: state=%d vbus_active=%d id_state=%d\n",
+		qphy->port_state, qphy->vbus_active, qphy->id_state);
+
+	switch (qphy->port_state) {
+	case PORT_UNKNOWN:
+		if (!qphy->id_state) {
+			dev_dbg(&qphy->phy->dev, "ID grounded, entering host mode\n");
+			qphy->port_state = PORT_HOST_MODE;
+			qusb2_phy_forward_role(qphy, USB_ROLE_HOST);
+			return;
+		}
+
+		if (qphy->vbus_active) {
+			dev_dbg(&qphy->phy->dev, "VBUS active, starting DCD\n");
+
+			/* Enable DCD sequence */
+			ret = qusb2_phy_enable_phy(qphy);
+			if (ret)
+				return;
+
+			qusb_phy_chg_det_enable_seq(qphy, STATE_DCD);
+			qphy->port_state = PORT_DCD_IN_PROGRESS;
+			qphy->dcd_timeout = 0;
+			delay = CHG_DCD_POLL_TIME_MSEC;
+			break;
+		}
+		return;
+	case PORT_DISCONNECTED:
+		dev_dbg(&qphy->phy->dev, "port disconnected, resetting state\n");
+		qusb2_phy_disable_phy(qphy);
+		qphy->port_state = PORT_UNKNOWN;
+		qphy->dcp_charger = false;
+		break;
+	case PORT_DCD_IN_PROGRESS:
+		if (!qphy->vbus_active) {
+			dev_dbg(&qphy->phy->dev, "VBUS lost during DCD, aborting\n");
+
+			/* Disable PHY sequence */
+			qusb2_phy_disable_phy(qphy);
+			qphy->port_state = PORT_DISCONNECTED;
+			break;
+		}
+
+		status = qusb_phy_chg_det_status(qphy, STATE_DCD);
+		if (!status && qphy->dcd_timeout < CHG_DCD_TIMEOUT_MSEC) {
+			dev_dbg(&qphy->phy->dev, "DCD polling: timeout=%u ms\n",
+				qphy->dcd_timeout);
+			delay = CHG_DCD_POLL_TIME_MSEC;
+			qphy->dcd_timeout += delay;
+		} else if (status) {
+			dev_dbg(&qphy->phy->dev, "DCD complete, starting primary detection\n");
+			qusb_phy_chg_det_enable_seq(qphy, STATE_PRIMARY);
+			qphy->port_state = PORT_PRIMARY_IN_PROGRESS;
+			delay = CHG_PRIMARY_DET_TIME_MSEC;
+		} else if (qphy->dcd_timeout >= CHG_DCD_TIMEOUT_MSEC) {
+			dev_dbg(&qphy->phy->dev,
+				 "charger detected: DCP (DCD timeout after %u ms)\n",
+				 qphy->dcd_timeout);
+			qusb_phy_notify_charger(qphy,
+						POWER_SUPPLY_USB_TYPE_DCP);
+			qusb2_phy_disable_phy(qphy);
+			qphy->port_state = PORT_CHG_DET_DONE;
+		}
+		break;
+	case PORT_PRIMARY_IN_PROGRESS:
+		if (!qphy->vbus_active) {
+			dev_dbg(&qphy->phy->dev, "VBUS lost during primary detection, aborting\n");
+			qusb2_phy_disable_phy(qphy);
+			qphy->port_state = PORT_DISCONNECTED;
+			break;
+		}
+
+		status = qusb_phy_chg_det_status(qphy, STATE_PRIMARY);
+		if (status) {
+			dev_dbg(&qphy->phy->dev,
+				"primary detection positive, starting secondary detection\n");
+			qusb_phy_chg_det_enable_seq(qphy, STATE_SECONDARY);
+			qphy->port_state = PORT_SECONDARY_IN_PROGRESS;
+			delay = CHG_SECONDARY_DET_TIME_MSEC;
+
+		} else {
+			dev_dbg(&qphy->phy->dev, "charger detected: SDP (standard USB host)\n");
+			qusb2_phy_disable_phy(qphy);
+			qusb_phy_notify_charger(qphy, POWER_SUPPLY_USB_TYPE_SDP);
+			qusb2_phy_forward_role(qphy, USB_ROLE_DEVICE);
+			qphy->port_state = PORT_CHG_DET_DONE;
+		}
+		break;
+	case PORT_SECONDARY_IN_PROGRESS:
+		if (!qphy->vbus_active) {
+			dev_dbg(&qphy->phy->dev, "VBUS lost during secondary detection, aborting\n");
+			qusb2_phy_disable_phy(qphy);
+			qphy->port_state = PORT_DISCONNECTED;
+			break;
+		}
+
+		status = qusb_phy_chg_det_status(qphy, STATE_SECONDARY);
+		if (status) {
+			dev_dbg(&qphy->phy->dev, "charger detected: DCP (dedicated charging port)\n");
+			qusb_phy_notify_charger(qphy,
+						POWER_SUPPLY_USB_TYPE_DCP);
+			qphy->dcp_charger = true;
+		} else {
+			dev_dbg(&qphy->phy->dev, "charger detected: CDP (charging downstream port)\n");
+			qusb_phy_notify_charger(qphy,
+						POWER_SUPPLY_USB_TYPE_CDP);
+			qusb_phy_drive_dp_pulse(qphy);
+			qusb2_phy_disable_phy(qphy);
+			qusb2_phy_forward_role(qphy, USB_ROLE_DEVICE);
+		}
+
+		qphy->port_state = PORT_CHG_DET_DONE;
+		break;
+	case PORT_CHG_DET_DONE:
+		if (!qphy->vbus_active) {
+			dev_dbg(&qphy->phy->dev, "VBUS removed, resetting from CHG_DET_DONE\n");
+
+			if (qphy->dcp_charger) {
+				qphy->dcp_charger = false;
+				qusb2_phy_disable_phy(qphy);
+			} else {
+				qusb2_phy_forward_role(qphy, USB_ROLE_NONE);
+			}
+			qphy->port_state = PORT_UNKNOWN;
+		}
+
+		return;
+	case PORT_HOST_MODE:
+		if (qphy->id_state) {
+			dev_dbg(&qphy->phy->dev, "ID released, leaving host mode\n");
+			qphy->port_state = PORT_UNKNOWN;
+			qusb2_phy_forward_role(qphy, USB_ROLE_NONE);
+		}
+
+		if (!qphy->vbus_active)
+			return;
+
+		break;
+	default:
+		return;
+	}
+
+	queue_delayed_work(system_freezable_wq,
+			&qphy->port_det_w, msecs_to_jiffies(delay));
+}
+
 static inline void qusb2_write_mask(void __iomem *base, u32 offset,
 				    u32 val, u32 mask)
 {
@@ -767,29 +1241,16 @@ static int qusb2_phy_init(struct phy *phy)
 
 	dev_vdbg(&phy->dev, "%s(): Initializing QUSB2 phy\n", __func__);
 
-	/* turn on regulator supplies */
-	ret = regulator_bulk_enable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
+	/* Power up regulators and enable clocks (including ref_clk if needed). */
+	ret = qusb2_phy_enable_phy(qphy);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(qphy->iface_clk);
-	if (ret) {
-		dev_err(&phy->dev, "failed to enable iface_clk, %d\n", ret);
-		goto poweroff_phy;
-	}
-
-	/* enable ahb interface clock to program phy */
-	ret = clk_prepare_enable(qphy->cfg_ahb_clk);
-	if (ret) {
-		dev_err(&phy->dev, "failed to enable cfg ahb clock, %d\n", ret);
-		goto disable_iface_clk;
-	}
-
 	/* Perform phy reset */
 	ret = reset_control_assert(qphy->phy_reset);
 	if (ret) {
 		dev_err(&phy->dev, "failed to assert phy_reset, %d\n", ret);
-		goto disable_ahb_clk;
+		return ret;
 	}
 
 	/* 100 us delay to keep PHY in reset mode */
@@ -798,7 +1259,7 @@ static int qusb2_phy_init(struct phy *phy)
 	ret = reset_control_deassert(qphy->phy_reset);
 	if (ret) {
 		dev_err(&phy->dev, "failed to de-assert phy_reset, %d\n", ret);
-		goto disable_ahb_clk;
+		goto assert_phy_reset;
 	}
 
 	/* Disable the PHY */
@@ -887,23 +1348,15 @@ static int qusb2_phy_init(struct phy *phy)
 		dev_err(&phy->dev,
 			"QUSB2PHY pll lock failed: status reg = %x\n", val);
 		ret = -EBUSY;
-		goto disable_ref_clk;
+		goto assert_phy_reset;
 	}
 	qphy->phy_initialized = true;
 
 	return 0;
 
-disable_ref_clk:
-	if (!qphy->has_se_clk_scheme)
-		clk_disable_unprepare(qphy->ref_clk);
 assert_phy_reset:
 	reset_control_assert(qphy->phy_reset);
-disable_ahb_clk:
-	clk_disable_unprepare(qphy->cfg_ahb_clk);
-disable_iface_clk:
-	clk_disable_unprepare(qphy->iface_clk);
-poweroff_phy:
-	regulator_bulk_disable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
+	qusb2_phy_disable_phy(qphy);
 
 	return ret;
 }
@@ -921,16 +1374,83 @@ static int qusb2_phy_exit(struct phy *phy)
 
 	reset_control_assert(qphy->phy_reset);
 
-	clk_disable_unprepare(qphy->cfg_ahb_clk);
-	clk_disable_unprepare(qphy->iface_clk);
-
-	regulator_bulk_disable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
+	qusb2_phy_disable_phy(qphy);
 
 	qphy->phy_initialized = false;
 
 	return 0;
 }
 
+/*
+ * qusb2_role_switch_set - USB role switch callback.
+ *
+ * Invoked by the role-switch framework when an upstream user (e.g. a Type-C
+ * port manager) requests a role change.  For USB_ROLE_DEVICE we kick off
+ * charger detection; the state machine will forward the role to the
+ * controller switch only after confirming SDP or CDP.  For USB_ROLE_HOST
+ * and USB_ROLE_NONE we forward immediately.
+ */
+static int qusb2_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
+{
+	struct qusb2_phy *qphy = usb_role_switch_get_drvdata(sw);
+
+	dev_dbg(&qphy->phy->dev, "role switch set: %s\n", usb_role_string(role));
+
+	mutex_lock(&qphy->role_lock);
+	qphy->current_role = role;
+
+	/*
+	 * If the controller role switch was not available at probe time (e.g.
+	 * the USB controller driver registered its role switch after us), try
+	 * to look it up now.  A return of NULL or -ENODEV simply means there
+	 * is no controller switch to forward to, which is fine.
+	 */
+	if (!qphy->controller_role_sw) {
+		struct usb_role_switch *dsw = usb_role_switch_get(&qphy->phy->dev);
+
+		if (IS_ERR_OR_NULL(dsw)) {
+			if (!IS_ERR(dsw) || PTR_ERR(dsw) == -ENODEV)
+				dev_dbg(&qphy->phy->dev,
+					"no controller role switch available\n");
+			else
+				dev_err(&qphy->phy->dev,
+					"failed to get controller role switch: %ld\n",
+					PTR_ERR(dsw));
+		} else {
+			qphy->controller_role_sw = dsw;
+		}
+	}
+
+	switch (role) {
+	case USB_ROLE_DEVICE:
+		/*
+		 * VBUS is active; start charger detection.  The state machine
+		 * will forward USB_ROLE_DEVICE controller only for SDP/CDP.
+		 */
+		qphy->vbus_active = 1;
+		qphy->id_state = 1;
+		qphy->port_state = PORT_UNKNOWN;
+		queue_delayed_work(system_freezable_wq, &qphy->port_det_w, 0);
+		break;
+	case USB_ROLE_HOST:
+		qphy->id_state = 0;
+		qphy->vbus_active = 0;
+		qphy->port_state = PORT_UNKNOWN;
+		queue_delayed_work(system_freezable_wq, &qphy->port_det_w, 0);
+		break;
+	case USB_ROLE_NONE:
+	default:
+		qphy->vbus_active = 0;
+		qphy->id_state = 1;
+		cancel_delayed_work(&qphy->port_det_w);
+		qusb2_phy_forward_role(qphy, USB_ROLE_NONE);
+		break;
+	}
+	mutex_unlock(&qphy->role_lock);
+
+	return 0;
+}
+
 static const struct phy_ops qusb2_phy_gen_ops = {
 	.init		= qusb2_phy_init,
 	.exit		= qusb2_phy_exit,
@@ -1131,7 +1651,29 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
-	return PTR_ERR_OR_ZERO(phy_provider);
+	if (IS_ERR(phy_provider))
+		return PTR_ERR(phy_provider);
+
+	mutex_init(&qphy->role_lock);
+	INIT_DELAYED_WORK(&qphy->port_det_w, qusb_phy_port_state_work);
+
+	if (device_property_read_bool(dev, "usb-role-switch")) {
+		struct usb_role_switch_desc role_sw_desc = {};
+
+		role_sw_desc.fwnode = dev->fwnode;
+		role_sw_desc.set = qusb2_role_switch_set;
+		role_sw_desc.driver_data = qphy;
+
+		qphy->connector_role_sw = usb_role_switch_register(dev, &role_sw_desc);
+		if (IS_ERR(qphy->connector_role_sw)) {
+			ret = PTR_ERR(qphy->connector_role_sw);
+			dev_err(dev, "failed to register role switch, %d\n", ret);
+			return ret;
+		}
+	}
+	qphy->controller_role_sw = NULL;
+
+	return 0;
 }
 
 static struct platform_driver qusb2_phy_driver = {

-- 
2.34.1

