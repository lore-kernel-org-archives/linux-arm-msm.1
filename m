Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BA23546DC
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727927; cv=none; b=WWZODOhLU51l8z3J+jh7wMEsF9p1w0rWaZArLlcEoBsDPrUKDRLyAapgK9DBN0pt8QZo3YgDMiro7WXWa+g3t8wf7z7JoizYElJ+XysPVxdEIHKivv5Wyib8SWp73yb7sEG8CYh/SwpRaxeMv0sQ6IOVN51Kb+mj9A9y9qwNOEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727927; c=relaxed/simple;
	bh=1uCSE9pS0uK8c8rmwdqjcZn44CXrmRxmSQbFF1quomQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i9nkxrVHx7DAJTjQNitLgQHefCvCuvoTNwRmyNspt7Qk48gLSZDYrPjZziiV9xxsmC3t7Oj5+9X5mJZEX0aMgbtksToT3YJ1x5Jo7I4fMgJZNb3ZQx5HZvqfHFpgtW1+clh5kINhQ2jm1zG87oKKrTEi1EI+NeqVpXQtDRgEccs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQ51VTgX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jr7gIXcN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQ51VTgX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jr7gIXcN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWSxs445318
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w1VnrF5mL82CPISYHMNOBYhwf3W9zInAag1/ZxJRFrs=; b=OQ51VTgXuSQPXKau
	wWydlVa06skJeeKKMInKfpUGjlYAjCIDIP66RiJLVqPjk7FhzB+O0QRois1bveTd
	eqXwHYml3jrn8BjIGs7nNiUPXD6s+aSSJqB4JTCYzzgopc0VfiHPWpRKs2E8UaI/
	UcQ7vmqjNHerdj7JvqOCjGbD5WRFQrOBDJMWANPjN/yhNAdZR1z7Dewl2yj1A5r7
	IGuGaY/CNaxAGw9JDTx3qUcwcRsVkWFexKIOFUFcJ78WhfqCK6o4jGLRqxu1hrna
	jZ/bY1SPst2a03qJfQazrlFJWV2tNf4rthFi4cMPTX01Sy3uNWCStnBZachXXxtD
	d+5/qQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxmgg3dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bff5c7035so155383741cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727925; x=1785332725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1VnrF5mL82CPISYHMNOBYhwf3W9zInAag1/ZxJRFrs=;
        b=Jr7gIXcNlqu/IVrqieM9jgDZW8vJrS+Pd9aCvHwyBfx4Ye6aeFT6oNJ/xNbHRdW05G
         aRhGmK9O/28UyHmMldd9x6klYvOYZPIXf7lEk3Aez/+TToExY4SFkXgwOH87RyXR+HB9
         l7LToAq8k7byHpctg4sPFHNXb2t7MzvA6ng+oyM/oBSRL6mxovveCANFtvN3XgSfFhEk
         9gcQuvj2eO0AbLa0kxEt4KvXpboWjWwLjmz11x362vPSwMYrl/D5lJKd6DKVPC0UHjll
         jKDw6RUehlQb9wz1j4jvmvgJ33N+xv+UtdzEWMK5wgNlVeeB/DrfkJKulhrR1MGnkyLs
         Q+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727925; x=1785332725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1VnrF5mL82CPISYHMNOBYhwf3W9zInAag1/ZxJRFrs=;
        b=hu7VqcXvVHjM7/EXJvhzguQ3M1/YqFCIfZaqYT/dfcj9BRR2i2TXTqjWT4+QJoeOPP
         PJVuGr/gYbn1fHlCNrKfVTb4mBIyBLjn9ITxcnE9C0RNoxoGtTo+nHAB2ef0vthIuGa9
         Ypx4K+2erWsd1pGQM9JEsdx0scyObjnod65Ei5HjhWtX9r5nTJZOC2Bits76hwBF+mTt
         On5J8UFxpLRPGLZER0kDPi1jwlIgDZnbXgn/csO52IJlg9n8zifr/XMINcffAv1s1Ab/
         rVWZhDTNS5MiPjyycJmOrfXJj0IijnIUq3lzQFBtpWoHRubEjN70uxHwcfiXdVWQXCAa
         GrOA==
X-Gm-Message-State: AOJu0Yz3jRhdW4c6/3dbCYSz3S7EqFnmc+F3RzhRXEdbqLXmNTEXAVlb
	Oq7hs50KaU69Ef0giFJ/tXJjmXrVx30O3AQigx5a43aHRYtxfyU43v6XCbX8QKFMwBl5jUktkVf
	WllnIgywQSrVI//LO6r9q5Qom3xSNFeam9uMFdzJvWEzn+qoKNUm/jrF+zy5UdHdOCPtQ
X-Gm-Gg: AR+sD1341IVl2OF3k5A8prZC6HrxpUT8e3QdI6jSkFhFI6+ZAJLrQQCnFSoljLOFCYo
	gt3GTApsdIU9sLY/BG2O8oTDU0pZtp8Lyp+W++L2SCiFy9FGez0idwTckDimh+E03EfEOAjtTcv
	oz2m9FmY+ScQjroP5oz1cEPeknlZwPKDpnzXREitBG3v4vsn38lGRs41S5gnFrSsAUlVwD1b6aI
	vqOw6NeLDIF/eWDuC8xoOEnHNIIJrOCQD2dOtib1dfBHsnnQNQLqZTz4Bd48UW+qH6YTQKNl03u
	l9lWINGkC3KOqb1bYAcqqDQ4GYp5tpFoYJDdbw7NAbdblw0LRTx1TqXvgwyXuyhNEIDBrUvfc04
	Zn5lWFXvDx/jop2Y6Wgk3z2sP97l0M9rQku73JiQgmmp4XMGlsvCPkRqdr6AB/ZbO4BV1+B4mkp
	AHL/883Nx0e+2STVGdGsD2Mb3tKJptjwBHu81W2txRwTUBeSJzkw==
X-Received: by 2002:a05:622a:8405:20b0:521:8ef0:b4e0 with SMTP id d75a77b69052e-5218ef0b690mr129440051cf.17.1784727924639;
        Wed, 22 Jul 2026 06:45:24 -0700 (PDT)
X-Received: by 2002:a05:622a:8405:20b0:521:8ef0:b4e0 with SMTP id d75a77b69052e-5218ef0b690mr129438601cf.17.1784727922476;
        Wed, 22 Jul 2026 06:45:22 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac8c3esm111874366b.23.2026.07.22.06.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:45:21 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 15:45:16 +0200
Subject: [PATCH v6 3/7] phy: qcom: qmp-usb-legacy: Fix possible NULL-deref
 on early runtime suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-usb-phy-fix-null-v6-3-534f7e61b9a6@oss.qualcomm.com>
References: <20260722-qcom-usb-phy-fix-null-v6-0-534f7e61b9a6@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-usb-phy-fix-null-v6-0-534f7e61b9a6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=D+V37PRj c=1 sm=1 tr=0 ts=6a60c975 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=QCvEx_dtP_Vb2dzgXhUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ystkoi2Ny4lbaPCLIncWJtJq--Nk0uhe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfXz9lUzrAISafR
 PrPITUmzQNrJaMde8zqOhSCmFAfBR8wlzJ0MYEZtyn60V5i4AJCfLOPmcNcF79UWkAGIcmTCbgH
 ulxXM/iQ3npUP0fLcHgAw0uIeR8mpos=
X-Proofpoint-ORIG-GUID: ystkoi2Ny4lbaPCLIncWJtJq--Nk0uhe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX/n9JtYWwSEK3
 OcQOP61EOKaEBhYUeTjeN99n04Agh4yW6w2tigRWZkH8++XRgzN4OxtdGLBdepnhc70p8rvQujf
 OBn78yx/ofdUxpbjd/NAh3KyI6tLnlEY8aGTz77q1YZYtzgUJRT6Y9YgVR1D+MxaXK8+rdpd8UQ
 rc1A0/Gl3WYjGrMwzBem8q5EAeVJogll5vYK5Pgy8kiqPllnZB/fCCVZrNvPjijVwLC0Nn2tyUF
 aXXqPBXMAPwJM/3L3pPfpHkXdZqi0rmY//cX2eAYjc9RMuEOAWCup/yihDOerrNPFpQmyWywDS9
 Njey/UoaRqid7ImPrv+8EAzgVqduWFkU1V8NNEo6mqJEu2vSd+BHenAU5lDrWEUUNFLV2tqryJ2
 pwr6FN2efMEjSZAzUcS9GYZpWH6yeJdpRUEj1dgrGrBzx6SB98dCaDZ0erjTYJkCihLr2iQSpTJ
 QE/CzUeE/Bgnv4g/96A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220134

There is a small window where the runtime suspend callback may run
after pm_runtime_enable() and before pm_runtime_forbid(). In this
case, a crash occurs because runtime suspend/resume dereferences
qmp->phy pointer, which is not yet initialized:
        `if (!qmp->phy->init_count) {`

This can also happen if user re-enables runtime-pm via the sysfs
attribute before qmp phy is initialized.

Similarly to other qcom phy drivers, introduce a qmp->phy_initialized
variable that can be used to avoid relying on the possibly uninitialized
phy pointer.

Fixes: e464a3180a43 ("phy: qcom-qmp-usb: split off the legacy USB+dp_com support")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index 8bf951b0490cfd811635df8940de1b789e21b46c..fc490589c8e4888770807a60170905a1c7610421 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -542,6 +542,8 @@ struct qmp_usb {
 
 	enum phy_mode mode;
 
+	bool phy_initialized;
+
 	struct phy *phy;
 
 	struct clk_fixed_rate pipe_clk_fixed;
@@ -895,6 +897,7 @@ static int qmp_usb_legacy_power_off(struct phy *phy)
 
 static int qmp_usb_legacy_enable(struct phy *phy)
 {
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
 	int ret;
 
 	ret = qmp_usb_legacy_init(phy);
@@ -904,14 +907,19 @@ static int qmp_usb_legacy_enable(struct phy *phy)
 	ret = qmp_usb_legacy_power_on(phy);
 	if (ret)
 		qmp_usb_legacy_exit(phy);
+	else
+		qmp->phy_initialized = true;
 
 	return ret;
 }
 
 static int qmp_usb_legacy_disable(struct phy *phy)
 {
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
 	int ret;
 
+	qmp->phy_initialized = false;
+
 	ret = qmp_usb_legacy_power_off(phy);
 	if (ret)
 		return ret;
@@ -988,7 +996,7 @@ static int __maybe_unused qmp_usb_legacy_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy_initialized) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -1009,7 +1017,7 @@ static int __maybe_unused qmp_usb_legacy_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy_initialized) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}

-- 
2.34.1

