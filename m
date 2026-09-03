Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09AD4E235F
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 15:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449930; cv=none; b=GQ0WCIw0WuqsW4Td++G+6uvtaUL6IQRzjKBKYbIGXyp7LGU5DhZlIR9Bc9ndsOdELwsEFr+nPMB3zBWEfnZ3XuRRvvVLYv1a6aVmYLBJCVP2N90wzxgVzd7inwfSSGBV5f9bfHzIgcnVY3MOrHFg/kJxLdp6BnZXeiP2xBH1hvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449930; c=relaxed/simple;
	bh=4vXFe8mDn022Y/B25bfpbZTEc3rDqMffSWmcEmGusgA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=khSnMmxAnaJaeMFhrJrD1d7QM42DWbYGSxUKOae6pMst44M88HQtBbPawfFGaRhsWtpGZAvTGcTKWvt6XHHiU2a/oYzokAtr91GyK6v/omh7BLDzpmeU2Iuky0YCURBlNRfkf/Om4V5Q/3q60ca0RZ14cju0+PiQx5jsrzKvBZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sqq2ijWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pz1dUzIw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sqq2ijWc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pz1dUzIw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DALtI588276
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 15:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7DMo5aLM7KO
	0xZZuqnuCa7iNDZoWTd8Rp83SaIim8bw=; b=Sqq2ijWcT0SNyBCiTdXleYzVIjK
	+kj43fUvy9GKD0Cfu6UuuqZOgc6zoYODmiUyVymagv02D2J8F3snItulaT8ERDUk
	81ZsL8k00XTWzlD1FO0mWxxVSlFky2cOJInswXWv1DRmAwYdoKn3eAb5HaSSRHMU
	oE+r0TKnlSlhmBqWKPQgedP5R4VtdL6GgNsxyx29bZKNYn1Gp7AV23i6oiGfQzyx
	2kOgs7P1PoQ3ijou0d9c3DCndrC7WZHDw+nCEtl5jhH2rvgR2bkWsMWiScy40dAV
	1B6OR1XekvdpXtvhw7OBFWuhhCQfknLuN2V6C66I7PSpXpVbaNVHDoq6mQw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyjpmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 15:38:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e048a801dso3285204b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 08:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449927; x=1789054727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DMo5aLM7KO0xZZuqnuCa7iNDZoWTd8Rp83SaIim8bw=;
        b=Pz1dUzIwEKjwFTr9Xxfa2r4odP+m25zAMItQwkUYfWvwIhAqDu50L1WOcbKKYcWuSL
         O3FNrGL7tUJ+mD1G06cDWPh7Kux2gRluZOHJ4YPWbMOwQNp0lUWf9/EODjaMfmm9mnHd
         Xh76WdCzQWIKZA+JmMUbkwHjek6x2UF4dac4Wb0VFPPHKL4knS5UbNCfymzG/tDo2v5b
         A7Cxb2pJMSci7jVE2F4RPFOHhtGrfkGQgr3qbycB0k/8dIjWWl3iIoWQ7o9X+dSinLSV
         QjnsLhfNoy2A9Fo1m7GgEeLnhVhC+nM3Q89gxZazJcQzRVVAREZj/eFwJ+ciwo12OH78
         S0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449927; x=1789054727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7DMo5aLM7KO0xZZuqnuCa7iNDZoWTd8Rp83SaIim8bw=;
        b=XOpg18uLxvulrprpxhdpSc6q8+MbfnX67/6baqVYG5jPJuTIwKcP6lPIDIXiJYc6fp
         eCgMRkZzO3Ykfke0XraV3dpEPFy5puQYhiQmP+irwf1Sv04df7pLooZzp+wGepH75o4u
         tBFvF1cMPog2hqPPZnFmg3CjDT/2ff4KU6dVs9p7FN4kUA4TaM5HGFtcSCV+Uvip/n3K
         loeSmL2wz/hpdCit4EA0p+WO9gQk0K1BI+kvv05VwWthyMyUBkgTTgAhlQIc6GUI05cN
         MAH4GBnxM5azkmS8XybxvlnyrkxXhSo4R3bSoU6txhAE37kZ3x47rtLm4tGk30wGItrM
         2o7A==
X-Forwarded-Encrypted: i=1; AKwUvBwW6EKP1L3DrX50CcXACssQc8NwWF95jbxiOhHcXA5k1O0TgVwSFa6vHvbAXLLIsM7k1iGOKO08n2NDLI2w@vger.kernel.org
X-Gm-Message-State: AFuF++lDsaaUbtAaFe9qpX0pkkVoJlDUfrRYWVnTCNcglz55J2uii9BQ
	FLhjR8RdBKVsr0Ttolt4uInQMS8G3IzXPMY4/jQX+2IxpoxKylBBl2a1Ye/wTHRDlhi4/z4mCvh
	V+3fmpV27KM44UPpMMEvZxsGM9AaV+yyZxUUHwh/Ayk6vgspko442KF/DKdNCoS0RwUGU
X-Gm-Gg: AYBFou1KzSucl3ijt5aM2HPyWzBxCQ7ch6XbjZBfOg3YgE5J6V3p8xCpklbavdev+Ie
	T8vA0ATaffwl4fLN35Qr1wmIf9uQbO/tvPvGklcKaTpYz+p9PQjuWKBDuCPv3lW525zpn32W/Fa
	D0hz15Tm0V068ACbOXrpQnfdMYjgyhxRPIHlx7TDmUVn814v4XnMfdJTBJpusahbZ9IaYTdup0y
	3IXsrQ83EQTbPdOvONgE4tedIHVxVrWYOiqXeHZ23e3StGmtteZ0+17LPn7+g8OTgmtNr3OhBFi
	RRpRyiLuNdGFJOTCH6pplZTaZeN5Tpnik37VTddTRSTKlxy3AUqdacGIchN31osIA6ToZi6E5/e
	CKZ/Qlb7c4n2cK+VUtls3moxg9XkkCU/3
X-Received: by 2002:a05:6a00:2309:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-861630c5ce5mr1027b3a.0.1788449926225;
        Thu, 03 Sep 2026 08:38:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:2309:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-861630c5ce5mr932b3a.0.1788449925461;
        Thu, 03 Sep 2026 08:38:45 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153027951sm81069b3a.40.2026.09.03.08.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:44 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] usb: dwc3: qcom: Distinguish PM and runtime suspend/resume paths
Date: Thu,  3 Sep 2026 21:08:22 +0530
Message-Id: <20260903153827.3463313-3-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX+3asAElRRERN
 Z80JD2zvCiJDwbHCQtoCLEmmdziiVqi3lTYuvH27IlEohXoGt15srqXj2sTbI2/el5ac36iWy+Y
 guASakCZG+iECpcDTSiWJpUrp9kO6u4XZTMlgGFKuwVgPLZHXu2nXmE8+GFs/HrV2G0zrR47Y/U
 9gduS5JjZ8FWNtdPKzQRlfa2MKsbtv+S8lcbMFXFA/HpX+A56NZq8evwvcgv5gISvdXETTrQSNl
 eaFUAsPD9iFv1uZiIXD5kPLaw+OcpMCHY586EiNCeIBsG9Q1aIWMr5NJ/vEbj+xUE/JbL1jCfxl
 5B5dJOffojdyqc2WhvnaUu0Ik26+9KWeEq9LEpZbt2eE0TXbHgOjXeTHQioUZy4+rVEJFbF7EJ7
 B3JSQ4bqyFsczZp3tu46nM+45ZBmG9VKIhJDQDERJsiZ4N5T7aICKKOEyWDF//gxr8o3eb6uCda
 ZEcooXPCZErGfuRivFA==
X-Proofpoint-ORIG-GUID: MCgBaCDkmWcSlWF6rgdXXWAdsQOsaF_-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfXzL5RS7VdOPtj
 dZAusGVPm4RIwFAQgxF39Tg4qULefNZjurBhtL3/uMSkGXMB3FaBo2+yzWlaHgT4HLF5W3XyVs1
 g/UvkVXEF0s2ponme1CLjAf28omqM0Q=
X-Proofpoint-GUID: MCgBaCDkmWcSlWF6rgdXXWAdsQOsaF_-
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a999487 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=tqe-1LZTDOhu2qnNqD0A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030136

The dwc3_qcom_suspend() and dwc3_qcom_resume() functions
handle both system PM and runtime PM paths but cannot
differentiate between them, preventing distinct power
management strategies.

Refactor suspend/resume functions to accept pm_message_t
instead of boolean wakeup flags. Use PMSG_IS_AUTO()
to identify runtime PM (PMSG_AUTO_SUSPEND/RESUME) versus
system PM (PMSG_SUSPEND/RESUME) paths.

Preserve existing wakeup behavior: always enable wakeup
for runtime suspend, check device_may_wakeup() for system
suspend.

Follow dwc3/core.c pattern to enable future per-path
strategies like differentiated power states.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 49698a31b2f4..6d25f81800a7 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -335,14 +335,24 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
 }
 
-static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 {
 	u32 val;
 	int i, ret;
+	bool wakeup;
 
 	if (qcom->is_suspended)
 		return 0;
 
+	/*
+	 * For runtime suspend, always enable wakeup.
+	 * For system suspend, check device wakeup capability.
+	 */
+	if (PMSG_IS_AUTO(msg))
+		wakeup = true;
+	else
+		wakeup = device_may_wakeup(qcom->dev);
+
 	for (i = 0; i < qcom->num_ports; i++) {
 		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
 		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
@@ -369,14 +379,24 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 	return 0;
 }
 
-static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 {
 	int ret;
 	int i;
+	bool wakeup;
 
 	if (!qcom->is_suspended)
 		return 0;
 
+	/*
+	 * For runtime resume, always assume wakeup was enabled.
+	 * For system resume, check device wakeup capability.
+	 */
+	if (PMSG_IS_AUTO(msg))
+		wakeup = true;
+	else
+		wakeup = device_may_wakeup(qcom->dev);
+
 	if (dwc3_qcom_is_host(qcom) && wakeup)
 		dwc3_qcom_disable_interrupts(qcom);
 
@@ -759,14 +779,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
 	ret = dwc3_pm_suspend(&qcom->dwc);
 	if (ret)
 		return ret;
 
-	ret = dwc3_qcom_suspend(qcom, wakeup);
+	ret = dwc3_qcom_suspend(qcom, PMSG_SUSPEND);
 	if (ret)
 		return ret;
 
@@ -779,10 +798,9 @@ static int dwc3_qcom_pm_resume(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, wakeup);
+	ret = dwc3_qcom_resume(qcom, PMSG_RESUME);
 	if (ret)
 		return ret;
 
@@ -819,7 +837,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	return dwc3_qcom_suspend(qcom, true);
+	return dwc3_qcom_suspend(qcom, PMSG_AUTO_SUSPEND);
 }
 
 static int dwc3_qcom_runtime_resume(struct device *dev)
@@ -828,7 +846,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, true);
+	ret = dwc3_qcom_resume(qcom, PMSG_AUTO_RESUME);
 	if (ret)
 		return ret;
 
-- 
2.34.1

