Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70624A206D
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 12:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560303; cv=none; b=saJepzTbgtSD6hMgXzNfkpvT15xWjv0jzZyKd0uGykf/+9mxx66OL16FM4CEs+2i2mRpnc4Qjbu0V3fYeXoQSdvFvqc7AHV/vUZFgCLiytpPTtvvuO2ti9T4OAh32PdiXX08Qhbzh0S9JmK+/u/WCBH2YGa7B6Fhvw6Zf9Yn9Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560303; c=relaxed/simple;
	bh=C0BpY42SIB0w+8iKfEOWUwTJwzkmqTce3yk+pyiwXbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tGZ67aIvtjFm1RaV0ozszNG/LVSGLJ5vZXC6NvQ6F3FGGiHiq0ZZAWF8QtWgkDxWkKi0zAEOBGKu7wc9eZg0upxC16MO+Nh1GwKd7lGZOt4BDkOQQ5tMe9APunAboCOtRCXd74zg/d3zY/BuDsG7XBP4kjsTxambq58YvMCVEUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNLfxSZ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cs50X5rG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNLfxSZ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cs50X5rG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92qDu978379
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 12:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=awk6pIqsCHA+sxQSt9Y0zl
	gxRNgYePRTmYV0bu7IlOI=; b=mNLfxSZ80U7ohFLylrXk9HgfjgP9SIFOHT2oQG
	0pvemc/t3YlZQc/RP/rVTYv+IuE0T3Bj26nRkhwW10CHMLjA00xjkYoPWTV4GVlO
	3CHvx7RkwmGfbACvlQ2SVE5EuQyxI72+lkoViA9Ov6pjgqSO7D/CzQLW2HaM3qpd
	E3lT/jkZzOL/TAS0kOjW3h2rgtjUr2U7gFy5+Wkjy50b6jC49PM0mg+I9mOmN4+7
	0zwOxskCZvt4pE/NPomFfGsFI4/nCnt8k6CVGWrGqC/bw0bYqMBUL6IuqLAwmuNb
	mMkivwBcD6jKFdw+nrNtD3StXLyDfPcbAtrM4mCzLFh6dcpg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3ruwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 12:04:49 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78350646d7eso1827026137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 05:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789560289; x=1790165089; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=awk6pIqsCHA+sxQSt9Y0zlgxRNgYePRTmYV0bu7IlOI=;
        b=cs50X5rGLtDWE7uxti22TMGGvS8VputZcvp+8cl3p36qw4Y1GN5YPFAvPbQhvuu3Y5
         ddfRB/9KOidcO0lHHJPtwFr29qicFngKM2dARX0ScMO+79fBi4Lr92XxagnxaRSqaqjY
         w5nRsRBOAmdzlkkILRGKdk62eGMB1EHz7/CwYYw6MNlHF534bQqtYE5oJ8WW3PmtGmLI
         creYLjnVLp6fBhR8suy84FHU0axw2z1eG69trlW1sPq+TZ34eiqFU7VARJm2eINFYYH9
         ochWD3HUVwl7YKGU+cEX/XPOuOT1xaAeR/Nsg2s0GsLXB3FytsygEFs1uxySrVoAlGlk
         houw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789560289; x=1790165089;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=awk6pIqsCHA+sxQSt9Y0zlgxRNgYePRTmYV0bu7IlOI=;
        b=hPHw6S1QPfVAUS5H/Ct12JMTUIwsaX9COjNeLVkF9UQrIbHMORrpHC4S7CtfHwQyI9
         KtPOWiRPAPWc0zieMHuT/fvONEZ8wMMZ2o7vKBbhk2Iu/ZsNzMxPMho3B4qo+mjbQTtm
         E+S+df/MQdU/u414CmRVWnb+ODVZyd3ISrXX3/50t+wICmCfeBCdVLbwc0q67V9Qh58n
         1RHNyb8OlblnXdtrEm68bmootB7PLC2WG0e4LRRhdadvuuStvMG7J90r5d8e4jTwI6gG
         RdecDv8JIYFrySyhnpGOQkxvDtQyuQ8H97gpbaT8ztbR1bRIrDjD2VRm86EzCueHZS9d
         mIwA==
X-Gm-Message-State: AFuF++msFVcO5Vnu2QzzwnSi1YnIWKw5Q7BJOu9sV0Qd7oXzewbOZ4Y4
	gRESs5L0QPwRh8WtdxPPGV1kCSNPWH0HnkAF5IKRXS9dvCoeikiHjGWBwdxpcK/jWHF1hiQeNSZ
	s5oIzoilTEzJ/fRuwvTct8psumpC5eABX/furQDt7ycxRbaFgqr3UtqOEhYr3OZXdBTMu
X-Gm-Gg: AYBFou2FNrcHKgQdb+oVUfPSBGHAACaOYKuPzAl50/UrG0kWDGDrBK6UIbgc0UMFWLs
	KwcKcrAfMjc5kDt8ywDSzp98iIkno7+BUnZUUOuZERMjDa3cv0lzQ198IYbjXHqr+0WsPhfbmYu
	a1bTQR+4prhSPZAeQFW2IAcmQlKDDc3KEZ8qwPUAzl3U3wnYz5gA8O7ZwzFxcbkrdbf6PTAW7tq
	3Ub6yFp6xa0L49WAnrseVR61exh0wXA7ZU/4LbuVbk4x/i8GQRXi9DHqoZ9IJ6+kGI+E6C5dj42
	YdUIrDvG+bYtX/gckdz1ikPM5TQ4pyXbVmzt2ZE10MGa54/NgAwJp9FvErDx/O8KUpnWoXLRmr3
	NCFvZr0D5
X-Received: by 2002:a05:6102:390f:b0:79d:a035:b6e6 with SMTP id ada2fe7eead31-7a050c29866mr720070137.3.1789560288537;
        Wed, 16 Sep 2026 05:04:48 -0700 (PDT)
X-Received: by 2002:a05:6102:390f:b0:79d:a035:b6e6 with SMTP id ada2fe7eead31-7a050c29866mr720003137.3.1789560287959;
        Wed, 16 Sep 2026 05:04:47 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dba8f4sm70514665e9.13.2026.09.16.05.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:04:46 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 15:04:41 +0300
Subject: [PATCH] clk: qcom: mmcc-msm8960: Configure PLL15 only on APQ8064
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-mmcc-msm8960-fix-pll15-config-v1-1-11fae0be111d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANiFqmoC/yXNQQrCMBCF4auUWTswKTU0XkVctOOkjiZpTVSE0
 rsbdfnB438rFMkqBQ7NClleWnROFWbXAF+GNAnquRpaai05Y5HDDe88R4yRGWOJvbOEXt+4hGD
 2yHPyOmFH3eh6a4kGDzW2ZKmb39Hx9Hd5jlfhx7cO2/YBFz7nXooAAAA=
X-Change-ID: 20260916-clk-qcom-mmcc-msm8960-fix-pll15-config-404b986600af
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=C0BpY42SIB0w+8iKfEOWUwTJwzkmqTce3yk+pyiwXbE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqoXdBm951inBggT/YDjL9giHFnIz/vB0497cR
 SX11cPMFzmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqqF3QAKCRAbX0TJAJUV
 VmUKD/wIqvmQ+xGGmXTDmFU/zygFgTyRpcwSMs4J+zRnI3dQSgtDVHnseDr5PRnuiAsOT5zO0OU
 SuUUgrW4BTUlltdFOwNOZld1nnOOLaON2lek7whiy6wSNyj4eZyL7O1sCiIMdZ+ZLNOZt0N6qb9
 FWIRqZuUsgFHbLfyqJydbqdv2K5jj6yrIAr0EZ8k6E4iZCiBW3T1jJQHM+y4FLTAg0jyUenPBvW
 KVN3Q/3W4/ur3lJvXAv/EPiiWIXdxzMb63E+0Dv+cE82aKQYUAI5ba10Ya6EaV4fYc/kwXKC+rB
 q3Kv/necREQVCBxFbFVxm2/Xqk3cgSRIrw6ZREaki4WqZE07pt0fs2ytHmye7MFUUgLfvAPz6SB
 a4x0o5u/z9EAns6ggPEbm7gRPRFBAp8AtTHmH3Pa3PHYg9avrXeBbSrbddF9tTUGzTRi1wBx8QI
 a4PySbhIGTKnh9px75oXgBbS2WG/ppWAsWs9t3AmZcl6YO2CzTRUF2HKls5HfQeTlYBbyPjdVNc
 vxbcPsvwgxx7IBdr+Sy5Lfat4lzGZ/QPnDUmClmQhRgcwQ1CjpS6I1+IiA/xTFH17fdLTgJtyBq
 nOPbgI2XO0ySPuZQ+hIQq4wrJGL7XzFeQqWjD6iuc7/q7RGuMM8EicR9JFEildCZPn9c3OqzcPY
 qbsai2zK27gL0XA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE2MCBTYWx0ZWRfX+j6s6XwmtOtq
 BJcxY/2+3l6C4+EkRUiUs764kxdWVdr+TfhcZ3i33OLfWRzcTlcn2c9It0sZMooRPhVgOH4UbST
 SofOo/8fhv4Vjmp1iPhG/2nV7gVHVjCt1oRxVaZ/iF30Nt/Sb+AP+3GRrDEY5T0i8LPlqBArXz3
 CWAlIc1ceQItuErMECbMulW26mE294KbM8JFl6PCd90DfGZdvtA+3Jmtvw9r69VzfzOwtrtxqFF
 QeHaCcJNikC5aWxbSNJGOv2pb1D4WX8LFv5LTzst1e0YNrf77Bw7hr9VTFoDkUB8BVhun9lrC3Q
 tl/uZOzqMgqZKz/svxjjKA+9Y/oQRbaFa1b8D4CPrBEK9pbRZE0JKxygX5wJyegrxC+ChRZXbEY
 6a9ZgY4kM283ia3g5Xf6UtU+8fyeqdk4vVcxePnnsAI0+EUYIontiahQjc3y32nUm4rUnJEKp6n
 4No6ZMFBrMk1JPct2SQ==
X-Proofpoint-GUID: T3tAlus4dJ1CDweAaceVov3jrFSQUXcR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE2MCBTYWx0ZWRfX60QOaz2XjD09
 Tne8bapzwZBm6cQiJ1Ke0lPqD6zSvYmTyC87aVgJPcEkA6uSKoPF/MRgx1RhIPYmEXdMupCla0r
 h5C818ioWHP1T7BJiJa/zCa8jRldBiQ=
X-Proofpoint-ORIG-GUID: T3tAlus4dJ1CDweAaceVov3jrFSQUXcR
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa85e1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PDnXyD1IIKguCH5BrScA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160160

PLL15 is specific to APQ8064, but the shared probe function configures
it unconditionally, including on MSM8960. Its configuration registers
at offsets 0x33c through 0x348 exceed the MSM8960 regmap maximum of
0x334, so regmap rejects these accesses. The PLL configuration helper
ignores the errors and probe continues.

Only configure PLL15 when the selected descriptor is for APQ8064,
matching the existing variant check for the GFX3D clock adjustments.

Fixes: e216ce60a9e0 ("clk: qcom: Add support for APQ8064 multimedia clocks")
Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/mmcc-msm8960.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index a23440e13b71..a67df833592a 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -3170,7 +3170,8 @@ static int mmcc_msm8960_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	clk_pll_configure_sr(&pll15, regmap, &pll15_config, false);
+	if (desc == &mmcc_apq8064_desc)
+		clk_pll_configure_sr(&pll15, regmap, &pll15_config, false);
 
 	return qcom_cc_really_probe(&pdev->dev, desc, regmap);
 }

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-clk-qcom-mmcc-msm8960-fix-pll15-config-404b986600af

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

