Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953658;
	b=BtxeMnE0ujLXZpPaaWBrmcfcdlD7c6BOZKEGb61MaGK8iR3v/rZNMEfN6+WM4NO8yWq5
	 lwFtdgQRrCsUAlB5Hikq9VmoJ8esIYqnmQpR0MCruGTQv+Ea2Dk6iaGV2dkRk8eA78H2N
	 RC6ckJd2RIAzjtgF/BXgEXbXR/fo2cu5RTzUGYiFsh72LBOY2q3UEVKZrRTBL144s0tAo
	 tO5ulwJsa/1qjTTsstggjtXsW/eNcKc4wAyCT3r6WMKlQLFW/spyxLUg5ci8lpUCrzbt3
	 NzmGMUqKQOLp/zsyGVeXQADCwwFpakwhDV5QROkJiu55OAeo3wFwDP5JOqyRhAhqxKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953658;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+iPJJtX6fNcECKsITdpcGnaCSiS9lo75HMfwgu0RABE=;
	b=A7lpkCEWi3NdtXetjAJseDh68CgSxqBk55j/4EZXBrAujMDa5s4WKApo8JpCWC5ep7k1
	 RUYp6mlzkL4mTHEuKh4N3NuopxmcCADOvhq9q/XTfYBjByu7MOscI+ERd24b7y0IK4xpW
	 f2zOn44IrCip88S5/DJIQztUfEstbcfe4hyR+aRgu+XUY/OMJWsEPvz2VYzyNdPfCk6ub
	 7uxhhLu2cEuY+AJYx7lQh6bAAnyChEPuycMot+aCHCwPOpXez2z+nNDJj+m7auVrspn8T
	 VdvAwbo5+PwNB+J6F9gdQQNplZ8WDoVKvZFhHjo5mxP+/WbRMIkjA0IKb6I3BPjPBxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WbFvdF2O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j6iwS2yP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB988606D81E
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 08:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB988606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WbFvdF2O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j6iwS2yP
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R2hV128918
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 08:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+iPJJtX6fNc
	ECKsITdpcGnaCSiS9lo75HMfwgu0RABE=; b=WbFvdF2OrV4s4IBYVZvxRp2CRPp
	44UUtyT1kI2qNNKRp4gqzMR2ovG46Ooj4zjs7jQjt346JhZRt9pYZ8P0S3VPymNG
	sCZIy/zhhL86N3kvTK3fxKlMKuc6Mmew0WzY7hOvzJq1YkmqQ8Dl8EPYYnTTnnq7
	lPQ0i3+TM14tb6oJvG34DS8ettscvIvbKvXMP1qS5eFRQMaZLHHBRwTAuZgB6hJg
	hEqRM0BMD4iaR0n49e9K5S9EPdKTVeJxCCJ+Cs/+UGd7apwG2AQh54MfsOqLVgSk
	I/IzqaeK1iv81Mq6Ppc5ZA8oId9rv/NBa52D5gL3FSrzLctAMExgzfiSWWA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9svfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 08:27:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b09b223c70so330986a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 00:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953656; x=1794558456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+iPJJtX6fNcECKsITdpcGnaCSiS9lo75HMfwgu0RABE=;
        b=j6iwS2yPkNgyMaApR1c1VAaIIug9DyBN0rkfVGnzzdBlI1c7wA7zFexngXQnL/F71o
         qFl3wLHZKIYfaT1tPrPZF/ELwk/u3O1t9EUjGMY8mRslNGr4Vztl5oFMbvIqe+QCOzDV
         jurjM2C+Kgfj2vAoLY07gsJU3Inv3s6U9jxRuFpRFiDR+v7N8I4r2QrWW4H8Z9KWGw1n
         3geXdobb/pGS/vNPWG9uQ7qV74Sf3qfL9lzf1Ndj/edXI/OetZdSPVRWkufr4gsxNLSf
         M1gDGZXMp12CjU1Xrp3GcnUubWRT96uouFo6943WMLDOw9EGvGYW97iwez1AboX+umF7
         r03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953656; x=1794558456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+iPJJtX6fNcECKsITdpcGnaCSiS9lo75HMfwgu0RABE=;
        b=tdKddi5YuSZaNbWSujV1Y6Cnb+PvEIqpu2LBjW8sSWdvWf1n7R+WbpVWTFR6vBzUfZ
         uSKkg0D51CQ75HX/O+SuBQcj1Ka5pJkR3DiK28q1Tr/TrtpWibHDMVgSnJJ84Znsm4Lk
         oWd4LhlsQflLSiFtn9ATQX+pAaXTMWUIx3JlcQHXBtZQ9at8nclWzSiyHlXxGf9QbdFU
         IKkZklQkhhClQEiZRXGDdNGqbfB6MQQj8/8KJh/yPCJVgoDjyilSi/I/mDuVvcFAz6AX
         UTaiSFjLTmj5w8zVJnB3MhMXEjVvSFptbLra39PHZFY9UiWcaVOGUtzQL7Ym/oT2u5b/
         T9sw==
X-Forwarded-Encrypted: i=1; AL+hErE4oi6uiGSVzehfiMI/BXJsU113O6BrtNoRFD0hlnIzQa0xbxj5A0QE8Cbg16ag6TNXkXd26TfdHiX+tMh8@vger.kernel.org
X-Gm-Message-State: APuU4Z/iOrnJ0bKCDnd8A1KjQ1Vic3us3cp77FYREYkgHRDg13N/40dq
	wq+Xgx1TkXMUFSIO7PmoQtiiWkAhs44WpiaKiWeMN8u5wCNkS+8S/D5LHxgx4a+1jNcq6auBPWs
	4QP1vbNGb3u+X/HYG263CJ83n1Apsa0VvgJYq/narvkbO3BpBwVmN04dfgLELYT2fpm6B
X-Gm-Gg: AYBFou3+TLN6PtQmO1dX7+OV2YqXz2nqQtLznWdKVT3hL4hf/aodglw0mCV9uhlJuph
	JffUeG02UYa5iEhaSSB5P55tGaCcKivoV+VqqJYoucDun47yvn9lUcAiZ/O0Is9neGhgL3Tcg/r
	SXMniw3ItfAl6KTNHatpR1GY5f57QGH8rU8jX8fZJe3hrGbMYc4EEsCBvJoKV5jgCnJshyWnTkG
	XievB7I3ZE2eLiqYEjev34cnB3b2yWGpEQOxylvVdGTyv0hTr8C+uIG5ng+yYBQQ4woXDvDmOMR
	czvrXGeq4fS5HFwqy4i0lXPP4/USx8wCjLHQvIyFX6Y2/u1svV/AOU8T6Kn1q4hFD7B205Tn1Lk
	/N/LfJzvRB4rDXW0CwAhQJzevtVvl29kZaZrun9cjA8iCFCscubGnJqg/e/EyMICVi3uf3v3gT3
	DUFg==
X-Received: by 2002:a17:90a:e703:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3b0db6d7122mr1639745a91.46.1793953656287;
        Fri, 06 Nov 2026 00:27:36 -0800 (PST)
X-Received: by 2002:a17:90a:e703:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3b0db6d7122mr1639726a91.46.1793953655847;
        Fri, 06 Nov 2026 00:27:35 -0800 (PST)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c42a72sm2433951a91.3.2026.11.06.00.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:27:35 -0800 (PST)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Esteban Urrutia <esteuwu@proton.me>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        prashanth.k@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tapas Rana <tapas.rana@oss.qualcomm.com>
Subject: [PATCH 2/3] phy: qcom: qmp-combo: Select LFPS detect only when SS link is confirmed present
Date: Fri,  6 Nov 2026 13:57:15 +0530
Message-ID: <20261106082716.128968-3-tapas.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
References: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX9k1IzhPPYDAC
 tAfnir1BqDhbE1ZqJQs9ovSG1lQaug7ERohoj5CZYYBOpehxdUD/UrlInztGZrgHmU7oNQOfEg6
 gapdpRz80K9fKlnB6lfYhCZ86aTAH0E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX5MhnFiKCjVwu
 OzInv3M84UzBsSt0Spz1IZSnRVB7LqD0zO3oOBi/9QajCdLDeVGTsuFpQPrXaGfAoYcSdwX7dbr
 zxIdnbEO0zZfowgMjhwfqiTnEgexND57lp0UBTBn4SOOo6Hq0c9nGFjvtZeSCq+La5FrlZz0wNK
 0CBmPqeZA6ZpKjBNaHOKt4A9jFygwBi5UJowIAf4tF3sTMvCaQSQAGpYM/L4+sQRzppDD9v50tA
 3/k8dKbj6HeRX4JQlrh1RYxOjo+/sqjA4lzBhLrEoTPf6w4k7E3HX1DezYMe3PrX0TeYjLWOtM+
 bQ3I2bSVt2FsZdcaUAEl5PqpvVHEFxICTtyJMtd/SJ37v6NYQfB7CRvhI6k16ChND3tPpvjAtBr
 tU8mb5qnE/QvHbWwkmQo4ybpUGDV3c5rEY+e63qXeKyvMbuocWHZOfRsqxZnMcX1xaCQgifI+GC
 lA9yBtS9SxcG6mxljgQ==
X-Proofpoint-ORIG-GUID: Rv1nNHigmgpSZp6XDhUXiKuNCOSFTiOt
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed8f79 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=0xIZqrDvkaguXChZBM0A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Rv1nNHigmgpSZp6XDhUXiKuNCOSFTiOt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

qmp_combo_enable_autonomous_mode() selects the autonomous-mode wake
interrupt mask by comparing qmp->phy_mode against
PHY_MODE_USB_HOST_SS/PHY_MODE_USB_DEVICE_SS. However, this driver's
set_mode() only ever stores PHY_MODE_USB_HOST or PHY_MODE_USB_DEVICE,
since dwc3 core and dwc3-qcom never pass the _SS variants. As a
result, the comparison is always false and the PHY always falls back
to the ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL mask instead of also
enabling ALFPS_DTCT_EN, regardless of whether a SuperSpeed device is
attached.

Store the qcom_usb_ss_state submode (added in the previous patch)
alongside phy_mode in qmp_combo_usb_set_mode(), and switch
qmp_combo_enable_autonomous_mode() on it instead of on phy_mode, so
LFPS detection is selected only when a SuperSpeed link is confirmed
present.

Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 27 ++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index aa9dc9716574..813a0955c591 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -27,6 +27,7 @@
 #include <drm/bridge/aux-bridge.h>
 
 #include <dt-bindings/phy/phy-qcom-qmp.h>
+#include <linux/phy/phy-qcom-qmp-usb-ss.h>
 
 #include "phy-qcom-qmp-common.h"
 
@@ -2630,6 +2631,7 @@ struct qmp_combo {
 
 	struct phy *usb_phy;
 	enum phy_mode phy_mode;
+	enum qcom_usb_ss_state  ss_state;
 	unsigned int usb_init_count;
 
 	struct phy *dp_phy;
@@ -4518,6 +4520,16 @@ static int qmp_combo_usb_set_mode(struct phy *phy, enum phy_mode mode, int submo
 
 	qmp->phy_mode = mode;
 
+	switch (submode) {
+	case QCOM_USB_SS_PRESENT:
+	case QCOM_USB_SS_ABSENT:
+		qmp->ss_state = submode;
+		break;
+	default:
+		qmp->ss_state = QCOM_USB_SS_UNKNOWN;
+		break;
+	}
+
 	return 0;
 }
 
@@ -4672,11 +4684,20 @@ static void qmp_combo_enable_autonomous_mode(struct qmp_combo *qmp)
 	void __iomem *pcs_aon = qmp->pcs_aon;
 	u32 intr_mask;
 
-	if (qmp->phy_mode == PHY_MODE_USB_HOST_SS ||
-	    qmp->phy_mode == PHY_MODE_USB_DEVICE_SS)
+	/*
+	 * Use LFPS detection only when a SuperSpeed device is known to be
+	 * present. For absent or unknown state, use receiver detection.
+	 */
+	switch (qmp->ss_state) {
+	case QCOM_USB_SS_PRESENT:
 		intr_mask = ARCVR_DTCT_EN | ALFPS_DTCT_EN;
-	else
+		break;
+	case QCOM_USB_SS_ABSENT:
+	case QCOM_USB_SS_UNKNOWN:
+	default:
 		intr_mask = ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL;
+		break;
+	}
 
 	/* Clear any pending interrupts status */
 	qphy_setbits(pcs_usb, cfg->regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
-- 
2.43.0

