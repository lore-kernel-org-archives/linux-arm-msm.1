Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59B035203E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717764; cv=none; b=ohG4Y3yXgQ3HKvt7Y2Im+Do/eE4TwtQsXjoHbPUyKiqiHdjdpetVqyYCd4sKPc3DssE8iVa28LBD3ABNT9WfCfcPTUnBpNvwqsNonABfgU05NlN73g9+NenMIvBT/pGUh/nXJ17Va81UwBPRMO5mpRzSZv5KHdj5AwFb3Go5kx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717764; c=relaxed/simple;
	bh=jkWeTjrNI+xze3hIGsedzEI8x6ITSkIXkZnnxBafFoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iGh3U6uTWZlOD0JVKUOg1RTm7tY5WvdMCIKQtu4ty9pQkt1itdGKnhpkQwC1i24tkTiNSR/FaLLhrIQuJAV+ZVUfm1QJZiRaFKYrfZNYjp1rB1sM/3xuXo1ftIqyN4tzIiRLIM7m+quwR5BgrFb1PZQAnFc1Ku0TdcDdn2Ui9EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EEICjp4X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jB1JCgY+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EEICjp4X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jB1JCgY+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xf7i123941
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=; b=EEICjp4XkYnjgv0H
	un5NyBCLr1P12n03QIiUdaNR3mmeWUGOCh+vEtk+WOLXcOJ/v9T6s3nRZcUBIeBZ
	79fe0e3sFf6BsfD7oLtDz81ZlJsp0iad1TSV36VZ6W1ajZ4VStXXqRG9/ctp6Ar+
	rJted6bVc5iwjoiBvmCAw81cxe6bmq5+szsOdYuAE4TYXuOcceW3NFZnIzwj9q0n
	d1FPqa47i7jGOxqwo0iaUm08ixEgAAHsbWRzYKDYwM85OQzgZ88ttP/nZ44XvIth
	VBhoWBib+yVmF5+T5Y/nTMHb4FcqwVsN8exc5c/bbywzwZ4sE9EI/4tnnKRgeHaD
	T3Tciw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4sqrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:56:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso8344420a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 03:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717762; x=1785322562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=;
        b=jB1JCgY+DQDZvbtzoV4lcQQcyHw4caf5R+opREA2Bdx3qFGtSG0wLkao/CY05YisIK
         AV5c82tt9metT+/ZOSZJttQA1rgCj8vWXJk88lgz/PPNOmYbEHGr9Qf7jQtib7OEcOd3
         tNUymWrMUhgEA8CymGK6gSg4EI0kCf/0+Z0vFdLUu7117YbiGghBqNhkZm3L4dp4w0ej
         uAf9GkVQ9CSMof1Ow/1jA8Yx6bLPLxyTW8OK42v+M+hUVvT3osJdKZltRk/ebqiGg+ZW
         FDKF//2Oe4V40eoheVnm+nR5h1uyMrroYZmmwH94p0282BS71bzdTPrB/DIb35Kq8o8d
         IFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717762; x=1785322562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=;
        b=J2ojxej5lEO7EViTDJAI362GhbcCWo0MY6RvV3D41MKyZeR5hRDEvvAsecQyGhn3tf
         FWLrBU8zE3wDA8VySdgmtbnvqrM9DC0LFj8sgVrvRH71l1VG8GxtQvF/J/lIfJeBu2iY
         /qoucpK8XHqxW8B8dUISQTIlmdkax66Ag5mUZipY/bAhbFgQB0zjAU9mH/rD5bNMp6SC
         KUYMvXYJAg3nK8PnH+I4pfO7YRGj0HUEzwn95di9GyCLGi0vpvH6lK4LtvhafLzy6WTI
         YWW/ZV3lYNvl4rNpXXCx/r5XdToEXziufWdlYeyqpjEzazX2gOj9ynyztwzBDJOrjRwm
         yznA==
X-Forwarded-Encrypted: i=1; AHgh+RooHmOQmcaK+RuVmNSIVru19Pl9JFUMecb+qX09xwu5ohgfn5m7cIDZmvlzVZzHeE9IRerG/tGqfRmm0nC6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8hJdfi2hnXHjy4T3+h4/WywfewJDwdn3AUq29iziJGn2rcjws
	2/ZjE/rCYve+Q6QZuAGBqQAuvnRfDoHptC67phkfGldpua3PqkFdbb0hn8h2H5N9ENxy8xvF0g4
	VuO63zDlXVvXNrbQudDmM2XmKYWO5HTY5C0KAkZF0u530Th15rCAiMPcQtJiYOUyT1KmS
X-Gm-Gg: AR+sD12kuqrkKOdvuorzB+gerCdVMsDa697lFTeCbPF//kHVj9R5/cozEEH8ztfqjfV
	nWbMe4l6nafKzkZ+jRS5GIC+awvDEH14LlLCAmRsIZc9dScKDMTuaDjoJCzZGrJREndssIZfqCt
	hqFh1f6RQI5wf6OgNouBaTGgenQr0eYL77EOFzIQtOqH1iJoFIC8zaRlp2xQgomzrib/QwOGfFb
	4VUwMUNOZEdIXFIS3Z/tM0w7U27UyVSoKjqLcj9v4EXjF6sRS1O8Irkk7NVAHis3jIyeC2BniqX
	t0E4di5KLqVaWFUV/U7f1xNCDa6dDDCn2OoyFC0K9/6LbMgELmWQgnxpVP+atkmG8wYgoi0NYJb
	Zf7YlEnSEFEeIcC7icrnxVqmTtCBnBdRx7PPbTLHQr95nTjD2/1va/07+6XadW0C3
X-Received: by 2002:a05:6a21:3981:b0:3c3:8fc3:5373 with SMTP id adf61e73a8af0-3c3ad963e16mr24826448637.35.1784717761399;
        Wed, 22 Jul 2026 03:56:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:3981:b0:3c3:8fc3:5373 with SMTP id adf61e73a8af0-3c3ad963e16mr24826410637.35.1784717760971;
        Wed, 22 Jul 2026 03:56:00 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1302659fsm5809160c88.8.2026.07.22.03.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:56:00 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 03:55:35 -0700
Subject: [PATCH v2 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-b4-kalambo-crd-v2-4-32d4addc1ac9@oss.qualcomm.com>
References: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
In-Reply-To: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784717756; l=984;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=jkWeTjrNI+xze3hIGsedzEI8x6ITSkIXkZnnxBafFoc=;
 b=NFLWTbVTh4IHTBJoYgR12wz7y4DqfPucXMo1BJ8lU1UTevUy3Ci0Zrnzit7RmoIoXSjYpzSos
 HugaPr17I5dCkkUrk4ZMRvy1KObW4Xq+Fz+5ohUcAy+jIkFGAapQG0v
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: nssbKaJzqagS5iWrPc04nOUCC0ofvJyf
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a60a1c2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sPeBD9Pss2NjrgU8DtoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfX4nCmdzbHvZZf
 f+0b53KwIJRV439BV7Lla1At6UcQ/wnU3Kes1FoMZOYdd7vH3577+mMEyFjKsWFUbngBOIbAK2s
 ED3Ii8URbHH6pcNFQy7XOgIa7nuFJEemO95czles95vNBrwFrX7za94tlpPGM4iF1hJNnqxIC5+
 smE0+mH9bghPPuTQKGv4o+JTlJsEnKBugfuX8cm3f5FXPITbkpdcOzsYRq8PtarkPuS4gTe0VsO
 +NR6JfLGN+mHgq+fNa7Epu7ke65Eh+x6r0gloFSOm/+qVHhyr0LCSNJJPpfHxMwPvi6rAMy2Evx
 p1HWqnI0DB0t5g7QPRAoOckWuidaHdFqKtVskQ7up/bKe+mSsV/cMsvgE5B2CYozrewR0TMt5/y
 +gxONfsHBGW6lUfERTG/OHo46K98aO1r079y6SBTZ5LHagJZvUWOu2BvaTAubBhwd1Oo3yOS9Zv
 LNgL0tkdsYEChRo3KUQ==
X-Proofpoint-ORIG-GUID: nssbKaJzqagS5iWrPc04nOUCC0ofvJyf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfX9nJbSOXp1Y9G
 rb0OpaZt47zt93PzqzQjFl9Euzo1i7uq9DyUPCG9ebhwsS9yiHvvnZtLMaNWqVc4LNuMjrzFhfi
 uzVkvrKOXcRbsTAPXj4SEF6z7UbRtVQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220105

Add Kalambo CRD board to the QSEECOM allowlist for enabling access to
efivars.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f35f2ee39130..d1cc6c908daa 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2327,6 +2327,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,kalambo-crd" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },

-- 
2.34.1

