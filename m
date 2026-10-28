Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183915;
	b=TyhSvfjV+Gmw5LYURCvY36pp1KLzQqQWcUcu0HtZ9CkCiGKPJEQCnsoI0NvE6V99iMjE
	 7uqW4/s8GvbxWyW1ydDPtg3XP4/YZIuqAHcdrZQk2ttzLy2ldnYXWE0vzKm1mAglWwOTP
	 fWiCco8Mam4OIIpW61lP0blVB6cvFn7LoDlNjCQRIVD/GgWokkuwboqqHt2Ec1oSFTBzy
	 ho8KrMaQGB1JqDYHTdN+jQJlaVl1wNn1wi8GUci+zNl+e28+M/AEfLU4fSWPn8TO/rXfn
	 o2493oqSrLJlxp/6hDrJU0tsFzJrOWY5YqICjfaX1fwjtaw2ZlpnJLLlxqglm19kQAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mdQogbyw565MwGyAXZSXXJs+hMpJgQr7bh3Iu18EvWs=;
	b=dIgQ29U7gK42J/C5RiiiOEI6N5iY3SN89HJkQshXb7Xi01tdjK935pgaPOM7IyDC7y1r
	 BNe95dF/IAlIKqjabxi4txTv1koRCjeIRLpbfa16L/73vv9qAymwkNMSSysnXHnZiIvlt
	 xud2FaS2Q05HjMSDurzc9i1X4Pzp437+gyw/zJmE/Tr6SmHjLVHFGvdX4lvvD3jggQiwN
	 4QVInjxVQICsMUW1NcT7+Sn9ByrMs/ZZXfrdXMwYitggTI4mUBctYCKfFiUWkaS7dvBfQ
	 5A+sdOwu/uKHFaKvcJR238AlwqWr9ZkxGOvbMPOJdvYNbdTEdSz+S6fk7peJqdxDluA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lfONDjTg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDPaMBiT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13520606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13520606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lfONDjTg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDPaMBiT
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8JxYB3892464
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mdQogbyw565MwGyAXZSXXJs+hMpJgQr7bh3Iu18EvWs=; b=lfONDjTgkToCXvMg
	BoMv2TAAzlzJp6j5zJoWnEW9+mC/jonY3K/37e1FX6s3wT3bTW0vVlVSZ2zZwPWf
	0AUp8kwEYGDNG4HJe13e/UsonKHMOlcKFVOHCa3NzasP4yWvvUmqgp4ikIZ57XcR
	9wD5EnECNP6en8OdQusbRPOjaCi+Rh8bmjTqVt1gaf4XF7OLRWPE6CmGY6GF2zB6
	cPdE9hRp15DMuBO3WZjBexXuwrkpEw10W2NTVXFCz+ip7aTJBeoScKnfSKWE85Dn
	ZMMo8I+EdBNiwvQxb8LzRn5HBGx6eL7Wd9LE2WtfNzvlmQWtZRd+tdZXRW4JIm93
	yUV7Ew==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f9203d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:38:34 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-193b5eb133eso1040068c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183914; x=1793788714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdQogbyw565MwGyAXZSXXJs+hMpJgQr7bh3Iu18EvWs=;
        b=UDPaMBiTxlmYxCBo1zK32kxegA20stJx/Iuz5SiQAq8wphZ6+6otyauG0NyW7U2qe/
         4eeJ2jaApc7rvJ2yqr2hG1+S6oHvIMCe4XSvOLP00ksVrDypzvNIsjtOzHZQrSA6rt7m
         mLt28NudYwknSe8/CpfXmhXLq6XVCCTD2W83scfuQJz8wRPsY9RtDrWAu87WLZmOBluu
         RGJnG3AXUDcj/LXpwy7VI0sUZ7R+4CBdOTCJnHJIWGFa6s0WbxQukc7TgmnWk9OHdk6e
         2Yi18FLdrXKBpxOUiNztTC9rI4Mq6xop8HhGSAxLHevGKze/K8cvWKyE0L+f7PFAVGov
         bcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183914; x=1793788714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdQogbyw565MwGyAXZSXXJs+hMpJgQr7bh3Iu18EvWs=;
        b=zPut4XPTH+i7zKORbl0teE8gclZwLKDLjF//07dABrPlGIjsXMQ37scMFIkgeb3NVL
         up1QfMR2cb0x3QVWnLBWxi5YZN9OrqTTPUGltgRxtmd5h9NOohnOrsvx+z9DuwnQ+Suw
         QHzf+kMFyhcW9yLsuTjc6CzMxVciBxWwrNjBjNrrlLcRk/3Cf9Kg14r/oTbP9vB0dJPr
         i3MZ7RZ+BeySQFQlnlYbrTcktxwb8VpeXQiow1ukiA/YpFtrf2Qf9GKse8ZG3F/hz/SY
         y4C80esnmcxEFenzVS1wt1MSllPsAWgqkBQy2KVrLE7W4BNHpnSN6B9gOgyY3go4TvRJ
         lRBg==
X-Gm-Message-State: AFq9FYKCy/d5uI/0CvXua8hTCt15Tzfr0d11cntDpdULQanV8aBRx5Hw
	bq2dA8iYhDbrK4y9cJnbW7e6nkEhzPW1T3l184IIAjVJAhwrUg0xP/4GCFxKaQ/A5oBRo/m+C/V
	IEUhIXoex++EULXv2LdBoVLluvSM0zXF/SfTd0n5SxjENED2xgjx0naAz22+SBF1TJ/OYjUyhz0
	fr
X-Gm-Gg: AYBFou2sOkyFUwYvLqk3BGBPSNy1hYC6VLCDqK+Qn5PY83IhUJhOVHX8XwEaRim4Wve
	TO9I0bb7whN92ZjtIYSE92cDnx9KWqz61YmnC7g6OoVTVGEOkNZjoIBycsGKbbjY9l+FOITncy/
	vyn0CETcWoBwUG2lpxof4gaEWK9ZnNO1e13j1sGBIO5l+eVyA7nzlAejRVhrEE+GHC6cnHW5b/j
	8B9jssKH7DE77alk+9QhnKrF07JWW8XLgCKqHAsjBkat/W7sXylHV9XQmU7xA3kbQIVW0Vskss6
	xDuLGmYb9axWcWyry4DrHVxUHyldEsmlG/aEKZSxz09zgWO7oEUAdlyjR7RXdWiI/mQpCpSqqFH
	EAX2ypX5hYU06rj8joVjVGAI2UBcmJ/OtKZOTGKo3ugjQWG8TMSZwrSOOH5W7L0Hxa7S2kXXZoX
	Y=
X-Received: by 2002:a05:7022:6727:b0:155:7721:3a4c with SMTP id a92af1059eb24-1a6d15f8182mr3743985c88.35.1793183913368;
        Wed, 28 Oct 2026 03:38:33 -0700 (PDT)
X-Received: by 2002:a05:7022:6727:b0:155:7721:3a4c with SMTP id a92af1059eb24-1a6d15f8182mr3743906c88.35.1793183912618;
        Wed, 28 Oct 2026 03:38:32 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm8340186c88.14.2026.10.28.03.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:38:32 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:07:57 +0530
Subject: [PATCH v6 01/11] phy: qualcomm: qmp-combo: Add DP COM v8 header
 and fix register layout
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
Message-Id: <20261028-glymur-phy-v3-v6-1-1f1d2e565a66@oss.qualcomm.com>
References: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
In-Reply-To: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Jeff Roach <jeff.roach0@gmail.com>, Luke Macken <luke@phorex.org>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183900; l=1983;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=+DVFqiryDONG9McNRCJ+BQaBHXz+SBZgygyspAMF7VU=;
 b=hU/MOjd0eA8eKsd1h/SVBDZgJ3/iLUcET7l3O94d1qJJYmHK3shPimYQhHn/0kjz+NDtzlbdG
 Obts0F4k5ZAAiL9+gOaLCdEPrQBfV6hfbOJFgiBSxFRm2EskIfmt5IU
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1d0aa cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mO8_gwkcAAAA:8 a=uxOsGGhB1PPybffeXOwA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX2usRWmlyy3vv
 wYo2YrtWqIf5wHug18XPGumqub/IDmYa3a6E4Y1QtAq45SawLumzIYRZelFY6Ht3SE+witBJFhy
 0T7BOTOJL49uLm16KHFFOZDVhDrSKjk=
X-Proofpoint-GUID: xwx1fPHSlcLn-G6097Y_81ehXKu4Dt8Q
X-Proofpoint-ORIG-GUID: xwx1fPHSlcLn-G6097Y_81ehXKu4Dt8Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfXyQSmvL08RKFP
 7lJb9Pa2lTrNpfiMHX0dPzE8wJJl52RpHbSLgPiu2JAhxgKPDAUVbUTxDXlsq1Ig1/4l7l0dFIX
 phTpy2WaInNdKrdSwsEUjvQKL0CGk5/2RjWGMYuSO8KJIc2pR938iyo3va/aTLz+LhnlZUmbuYC
 TcXih4/IMryauP6kdMp9dpx0V+n6Qo/j/Eri5mfGGmT5dUkmBXWazl6DIDY7yKWe90QiSfzWtoR
 +IVn3ysJaTvECz0dWO0QoSFufJes8PX3msoTY7rt51HhN1oKu16EKWw7XisFASkIpyXXJpS5Y86
 A87MNWNumZAqtW/md0RY2xYYSp2KBZNBig5AMr7b8Mlx71WwN51q1dBmUR2XsYKKuEWGyMVg5iY
 qmkSgp42BmgunK59yUdTp+tmZ3Ft9UCLWH0kW0+K206M92pEdGei8GWE3IQxMiUrAMuSwLIvF76
 pylnAeOh0t58IOP5TPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add the new DP-specific QSERDES COM v8 header file and update the
register layout to use DP-specific status register offsets for
C_READY_STATUS and CMN_STATUS registers.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Fixes: 5b289913959b ("phy: qualcomm: qmp-combo: Update QMP PHY with Glymur settings")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 187f0cd11f6c..cd14efc3c59a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -52,6 +52,7 @@
 #include "phy-qcom-qmp-dp-phy-v5.h"
 #include "phy-qcom-qmp-dp-phy-v6.h"
 #include "phy-qcom-qmp-dp-phy-v8.h"
+#include "phy-qcom-qmp-qserdes-dp-com-v8.h"
 #include "phy-qcom-qmp-dp-phy-v10.h"
 
 #include "phy-qcom-qmp-usb43-pcs-v8.h"
@@ -326,8 +327,8 @@ static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_DP_AON_TOGGLE_ENABLE]		= QPHY_V8_PCS_AON_DP_AON_TOGGLE_ENABLE,
 
 	[QPHY_COM_RESETSM_CNTRL]		= QSERDES_V8_COM_RESETSM_CNTRL,
-	[QPHY_COM_C_READY_STATUS]		= QSERDES_V8_COM_C_READY_STATUS,
-	[QPHY_COM_CMN_STATUS]			= QSERDES_V8_COM_CMN_STATUS,
+	[QPHY_COM_C_READY_STATUS]		= DP_QSERDES_V8_COM_C_READY_STATUS,
+	[QPHY_COM_CMN_STATUS]			= DP_QSERDES_V8_COM_CMN_STATUS,
 	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN,
 
 	[QPHY_DP_PHY_STATUS]			= QSERDES_V8_DP_PHY_STATUS,

-- 
2.34.1

