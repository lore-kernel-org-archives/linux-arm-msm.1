Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7509C34678E
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 01:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002921; cv=none; b=L1pvAKXO36SnVR7er1vJvkXx1HteXUP8hbnZJXRvze/yGcjwySh+aExvZAj2RSfXiP92pzVu5u9s9D+/x/LO2occRypsgpq2cZaiP7uNYQru9yP7eUW3UGSPDwfDMO7PdS4RRz3646uEVLdU/DiKYXt9PGB+2AD1enwelWqIYpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002921; c=relaxed/simple;
	bh=SDq3/nEQKBMZ1T3IskkmMPRXQQna8pvfKHYVrixlIKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fKYhf/MoJnQhkXMDJOJNTkgAAGpMAZjuKc/AtKgMBTqz5b341htGq1Ga3V0DIhqhHJY1elouYtMLuou7NzCYKhYY9P/NJRbq+7hRAOASxMHQTq30KzwJtOWpqXv1e/eKF8rlss6s3e3Sj0+opUm7gZsxGz8RP1I8SIDYigz4U3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=plEDX3iA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zxdv7Gkv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="plEDX3iA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zxdv7Gkv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689M9rfX3789349
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 01:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TcyNSAMZC//xVH9qquYthMcknQJKP5aSIvO
	Zl1B3/Ps=; b=plEDX3iAFsnzhJmWyJ++S8JZUnR4XWzeaRxjgXtdik05k1g8xwr
	Br2ybuzcldZFGvla8dby0kAM+7HjhtSghqYjOmA1MY4FT8mIeu/9AnOeh4e5Umai
	67RLkS5PFsjLyny0fb10BV4uTgHolZQcM+4Yf4olkkZ933dwmWGRIGKxrDnw8VSw
	srhvjcAOO4plsscsOT22V6SyyfeqMhzuOYNO48JM2wnf3jDQ/JmIuJ7XJrc6jsSe
	mHRWjsbKjvQ4Q+tca/5quQPWjkIWMGdvdBGhEo7cOLAi+qgKaRzuYgc97GZrKGqJ
	qmm2jfxWtcKj07TurP9InBdtfvw3C+zTmGw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyghdgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 01:15:14 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1abf73d1fso3625064eaf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 18:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789002913; x=1789607713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TcyNSAMZC//xVH9qquYthMcknQJKP5aSIvOZl1B3/Ps=;
        b=Zxdv7GkvoEajGVShxLZdvm7qCd+JYLPHxAvOA58UPidrXB8cgMR1SSgzpmPqQtioU4
         CPztk20QtQbAp4rnJdFHT5ZQ4qEDNPHKikqaFhhnkP2w1P97ba2FaoCAigqcUpLwra6D
         Iex0HuzgrA1abfIut9sOUVE7dOUOLjrO3CANUeGXWdEP9N90P0DW0UrU73id0SNi2LAz
         8Uu9x2usKoMbTet5l1FGNnmvtmhjKBPayerjinQoGsijlvI0+2LkRaUmknsiomRqu+pF
         Jop/rWjSA7ux9CacfZZi61nN4BEk0GsA9hT9A0tVJT9rbkxk7BLvQVWBgwND1MfPIlID
         MkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789002913; x=1789607713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TcyNSAMZC//xVH9qquYthMcknQJKP5aSIvOZl1B3/Ps=;
        b=da5g4uGs0+E7af83SWn7ar5pFCnciPRtwewIQkPvBotdgXhE1uNgGCw65RUw5GmTRn
         EY+8PZvw2qwZFveYwCMDNg5dsDXWeQw1fQyQUNtYFLeKoGv69JESWaLVOHrUKXAn7AB7
         wH2jYEZSqFvhVjSlqcbtMlxzopbwF2/VoUsnW4sbfRZYzS32unBEJHMo09JF9slQ/3o+
         oYOA/wH8i6ugdG/Xm5VavxZw2a8GaxyhgMpPDFyfTbAi1lO3EZYUbc4crLjuyjqJpLiy
         QHVoF5hcjdGbvVWi7ndRq9cnCBAGLpcx/OQ99l61lB4x4gKgX62PjIlcv6CjzdiBNxs/
         Fxww==
X-Forwarded-Encrypted: i=1; AKwUvBw3M0WccNblHACW7TzAF/B+qZr/n5ie3Fv+bZAR+52hYUAUBjDauo58lh2hmTKfOGZ3BN7wSKfM8AoFANpz@vger.kernel.org
X-Gm-Message-State: AFuF++kO1tFDz24VctnPMTRE1tqAd1qYZg0ffGFClGzX6aRG3w7/cTsw
	nX58I6aR4/BsC+Pd8ARMJE+oWCck02pkwm95sVA73H+QdNZjXRCpsbpLe+zDRcgRym3i7riinl9
	VOBdAe+kODqKXLcN+Tz3LcZScRAHHXLTFhL+EbsD87y2oSkESLrGssjCwwoKPZwpy9qfh
X-Gm-Gg: AYBFou1JobUWgy91Ws8M20/rtILoAu7NXBWGPzpT4Egt/LfaeTHrmlGYa2A5yzm3OkT
	kO7W7PfD041HN5oF/q/yzzrnAkbmRQ/n/bimRnVCIFuCQ171JvdfU+7ka4FORE8oTk98B+tYWSU
	u81Tg0RGQfYpRw8QMapuyjWQkUzANIZlONfgqULPQJpRMfTUTls8cbwSLOEmJm4oehoFDgyqFd1
	TQAJfjtbDNAZHoovazg6w0WqMx77QrbJx0sMcAoizvYJKXJjBa/p7uriQEJzmSKzwlQ2d+p0bmr
	nzWzyeFHh13hHScWFIK0jFDqkLixBrtHE3yguVTLSb9aVF9JUvKmzsK+hxHIaxZTs2dTxZRCoqA
	u6czZTN7xeagX1skCquUg8vB0T3x7rhwRfBwV2fUP9w7w5FN+nv/pyQ2o9HhI
X-Received: by 2002:a05:6820:f02c:b0:6b7:8396:f3ca with SMTP id 006d021491bc7-6b78396f950mr20792489eaf.44.1789002913613;
        Wed, 09 Sep 2026 18:15:13 -0700 (PDT)
X-Received: by 2002:a05:6820:f02c:b0:6b7:8396:f3ca with SMTP id 006d021491bc7-6b78396f950mr20792462eaf.44.1789002913243;
        Wed, 09 Sep 2026 18:15:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434c745a09sm15284220c88.7.2026.09.09.18.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:15:12 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] phy: qcom: qmp: Fix alignment in pcs-v8_50 register header
Date: Thu, 10 Sep 2026 09:15:00 +0800
Message-ID: <20260910011500.659353-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxMSBTYWx0ZWRfX//ot7ij61UmY
 7IqlY0C6eaN5sxc7x/t7gqDADJbFV0rcxLUjiEXeB+/a6NfW0ksowbZzI/URx3ysXXF5YXVXcF/
 nrSLd2XJU8UoOwkfkQcqg41RL80j5mM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxMSBTYWx0ZWRfX+ru31hrWcKVC
 wxECx8EUPo/FXbV4XL77eEWBgdlgsYRzkxKeZzsSZVvS//ZYDTk1p3hoEBSN+41p9BsM4BefmQm
 2hfVwueLGNDUD3O9+fE2Wom3Q0D+2IzgETxcm+EUT9pvreMsLodSbLD32SdUpKjDXN8jWpni7x8
 cF1/QL5YadAC67ZtamqOa3BqG6V8PsNKogpSg4l4FaNENnT0lERBcHjCcTWJ8shcY5pYgY6shK1
 JMN3KUQ0dfw38WMPP7ZK0aELnaCT/yq2nB6TUvDbkh7pVpqwRHv/VDkT+jERzqr/+QgAuVzUpRN
 dJN7NPCdg2VEmQ4oiGCqSrfydr7eadUuQV2XlHLgi1iMJp/XRf+cg87OKWiQPQq5MoicsBDTSMZ
 VsVBZPgtsfrEfY/zJAsbanCmz4sec3wO/iY1DjrY61vpOoSw4ZaZL+J8Ia8wmvyHh7XBiq5FWXw
 cq5wS6QIN/piiOvytAw==
X-Proofpoint-ORIG-GUID: QyPyuDKPP6CWQJjQfKjYYUHQXaQ7UWeT
X-Proofpoint-GUID: QyPyuDKPP6CWQJjQfKjYYUHQXaQ7UWeT
X-Authority-Analysis: v=2.4 cv=Z/F5j3RA c=1 sm=1 tr=0 ts=6aa204a2 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=dxXbasm6c_75TwCK60EA:9 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100011

Fix up the whitespace so all offsets align. No functional change.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h
index 325c127e8eb7..f094517ae3c1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h
@@ -7,7 +7,7 @@
 #define QCOM_PHY_QMP_PCS_V8_50_H_
 
 #define QPHY_V8_50_PCS_STATUS1			0x010
-#define QPHY_V8_50_PCS_START_CONTROL			0x05c
-#define QPHY_V8_50_PCS_POWER_DOWN_CONTROL			0x64
+#define QPHY_V8_50_PCS_START_CONTROL		0x05c
+#define QPHY_V8_50_PCS_POWER_DOWN_CONTROL	0x64
 
 #endif
-- 
2.43.0

