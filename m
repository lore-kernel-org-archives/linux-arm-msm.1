Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A8141166E
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 15:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376545; cv=none; b=a34UpGY2rl6Sb7O5Pcak+4i5MpBUWlgeRB9wI8KSjB0X09HbGiTzxCwMUzJ6ro3A0jEoYe2I1U/rwgCCc6D50r0uV3UqgVWiaI41tmXUWgIZSVVEd+l1CrvaywXH1ZwwfGtpJ1Xb4w1hbZRsGFckydZjkvJbbaK5BA+D79Rh2pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376545; c=relaxed/simple;
	bh=TkrMMSM5qDrBbFDzv/+VaChi5RjS9zkmjtBE4vr35Do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZ1WVnlcVbOgkRK8cHuhipP/V9peTWrhMW/ulQAiO+5tAPbtJoACXZSOW1KmqGksvjiuiDJ/waaugVRZRpyqelDyLnr/2hg/c0/brDQHa3as3Q00gS6iWLXa/lkowlSgvhBYhZLX7iMteU9kN+qJ+VntupjkflPQyEomPjYvFCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AeS01/Ct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OIpjQuXD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AeS01/Ct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OIpjQuXD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWJMt2090749
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 15:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Ol8WpcEjj06q3ha1b2ZdRY+l9xpEFrE+uyJaWfhLJI=; b=AeS01/Ct5gaVVxuL
	BGhfFfceoK4d/rRNfiK6ZSBPbIpCmCzbID+VKl8ITCe0wUSneI9auDdnRDDCCxnL
	qWwlYHDL5E9bwviIOlH0k/YWs17jIxRilWjf7FFiABa5ps70gB3DNSl6kqjyICT0
	42xgyUXtCx19u+YkHhjfC/+SiHf6UQJmCQ2yGgwUuCsrQ2ACF1pxLEna9abtBIMC
	fWV/IyyDRRiI5M0aZgOb0HaYD/J7lIK2aha2Dik8zf3jWDjf27XBW0bmDFH3mMmP
	r4la1VhTPJ53QWl8P6mgI+hRNBfeM02sX5PPWpygAtInFV94rLSqqAgBHRHhryZ/
	UaF/PQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fybh59qc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 15:42:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52cd0374265so39782491cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376541; x=1786981341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Ol8WpcEjj06q3ha1b2ZdRY+l9xpEFrE+uyJaWfhLJI=;
        b=OIpjQuXD2oVjibNDNjZb5aFeg7LEYm5UJY3rdPzMLNIBDQoHv51y4up3cQkw3q3NDF
         fhbciJ6c8jV9HzU79dHaVu1Bw1dTEvEEGTR5guvkCGNaI4bsvhrGd8qF93NNHkWbImzj
         uMFHpOwncS10JOSCHywRct5zAhNL/PZpQpa6WEKcDdWjOcuo9bLfO6wc0yxnFjqfqUVP
         ODrVgzl5pxrNkPFireImN8JgArLlUviIHGTIjYH5tR9WBvDOh4AV2ihrjvvAX5aYV1oP
         vPGctcfbkQe5CcoE0gqUbyRKMayq2QE93tZtCnZmRUBEfLOYPAKGD6iPwchyu2mnbAXw
         l7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376541; x=1786981341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Ol8WpcEjj06q3ha1b2ZdRY+l9xpEFrE+uyJaWfhLJI=;
        b=Q9cWnRk/+0jP26huUKJj3hBhBA4Wicxbg6ID61yl7/Glwqlt9fAoj5eUPIrREB+VIR
         f+6geehEOmiAeGrRjGXxwRFGZwqHbNGl0YNdWr5uYdloqAhDfGwgcH3vg7nffBhpb5Yp
         m7LHhe0NnuuwbgYuDGbT8f6/GzCyiAepuxhvnSFevX5w+uEa4LSgxs+71lLhy1Qx9G4o
         6FdaaETAN9N7MVvv9qsYC6CaPSjGvtGKOMZDiP4AlOMJQKy0SH77U3lZPYSow3siLwoE
         DgE40j9qAgoQltJFGMUhycbIt6kmRHbVjNBuesIThyhKHJuCuCwQ5D6yloUkOrF5wgYB
         oHwQ==
X-Forwarded-Encrypted: i=1; AHgh+RrrGORsqsRj99zVIR0gX8vM0kWQjw1kBGz0aPB+vyUhyz/nYoA5KAFzby9MRSZTSMMoSTRRmjX1ojGS0KVl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0gXzy+N3+98AJf538StdE6fjhtUWKxSqUhhrwPTiHz+vEcaUt
	mVogcSxS6HVsktL2g/jlHc1q//bG5Yc6cuFpG0fEFbKfBYiEIbprJIFTxVaK6/AOzkcVszZ4TEA
	Kie5Qn5WhHgU9CG31Ewy1sL321lyxzJhBRjkTcMZKfRWBOqJewL+Eg2oJ8LqQFatXiY+a
X-Gm-Gg: AR+sD11klXo2oFAdQGpS1lxfDmdqpCdywwFHElfGgjSONENRlnuBrGqE1MbH+fuLZG9
	gAtD3e2B61PQAomL6zpZ+ndXTd/qTJq/LW+5H3eBhy2SRddd5oal0SgcutccAv2NL+aB8PYHoKN
	UGD4yLfVvr2vEqUKw+6Fbd2bm64tvCV1jPdYdVNzf7qpY4okON/12eshuqcrxG3iHEVYYpDxZRn
	w2OMlBTeHbIQoHVdVSBEk1N1U2viynBziGPmJfUl20rJeDaCpCy6+dHtqbh8mi4vWoR2VFuMKgG
	Uaxr7R2RQN3vRbk/3oWhVx7/F5nyE2nemXsn5F1RFPSTNsDlG0TnnGfSjHC1cWVBwRxmowuozIp
	EiAJGlqsoBljube+tkWc4AbJNwVj7AdnQ3NFL7UYevZmDJc6zWeCD4WrNGIxspONQny3OCVxziA
	rT10BRZHzJ2tU9sA==
X-Received: by 2002:a05:622a:1f1a:b0:528:3142:d466 with SMTP id d75a77b69052e-52d20a920d3mr252033961cf.41.1786376540996;
        Mon, 10 Aug 2026 08:42:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1f1a:b0:528:3142:d466 with SMTP id d75a77b69052e-52d20a920d3mr252032531cf.41.1786376540166;
        Mon, 10 Aug 2026 08:42:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:08 +0300
Subject: [PATCH 04/10] phy: qcom-usb-hsic: engage HSIC mode from
 phy_calibrate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-4-e5f93ea76ffa@oss.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2853;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TkrMMSM5qDrBbFDzv/+VaChi5RjS9zkmjtBE4vr35Do=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFQhLz1oU44aOjR1xi5aFB9HrDQMTdOWypAd
 O9oOzFRa32JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxUAAKCRCLPIo+Aiko
 1WzIB/wPUZAdSQaPXXJvH1bFmntgi2oxFK1T9jsaAfhtC18IWwtDkzXwfNlhfk3AR0XZmGY5UiP
 jjQmoXwuwt/VtjrilmmUZx+u6hDAXj0Zr9EXcb9Fo3CzLGNTgRNxoXu6V3Z+7f95saFMXWBPRS1
 iFeT+5aDaRKCydJtyiI83UIVsC5DaW4p12w/1A8f3yxDD3KZayrQ57H5az4GkXml707CRQxLm4W
 pJ2Wp+9PXIMGEA9EuoqvAdtxrvhMdgmAz7JqCU2sd/YbFJO0ls1bXVkQOmqcuno1MxGNGc6qfXa
 nyCZ/v/i0ylhMp2Z/RBbFkaPoFNGFX930//CM7CRhxNKITVX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a79f15e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=0xrA-bSJ-g1zX4FYa4YA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: G2FpesdKmOARtpVmwwD33oWumZT8yUms
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfXxTGb9GCZ5XYt
 PlU+rJXjKRtgmMorKCa2t7wQjLAmO3gPW0LR9HG+y2TJCupuU0Mrd/Zbbm85NMQDW2Ke6YDly/1
 iOpU90hg6ZL2MMSl9ZPMvP9tAOaIwWg=
X-Proofpoint-GUID: G2FpesdKmOARtpVmwwD33oWumZT8yUms
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX0dMppyCC9jIZ
 33yanlrBTgHGtCpfl7oRR8OBFMfkolPcgldAIE/tkJsuve87tSz4VB7XUwKbPDh5kpqfQsjUM5G
 96bAgLXM6hjqFP2sjM9UKC7GqINfoIwph3bj7FUWFjKs5R7VTnKXu3K8WdlrKeJC7eI0TG9LLVc
 P5u6IVhvZVFBpKASoyYZPCu3k9RuSn33WGOFRvBhKBaI3o6a/IfWcA7YjgG/FP+UiVyOnoYBbsT
 711WsiiyARDjwHeAQkukmdcIiSmWYWToqTkwMAZkH3ZQfJ4KytepDEeUg3vzsG64lZf6e9nikp8
 7cGcfMAUuehVtiLf26CIXPw7G/zUHAh3Z+CkpV4cp9MH6eyO/F0iIzKloVxRR56VmOVan7e8U/x
 3UvEgPqv6JoT157k/khWBV9uq5RAEiQblN/3yF6a8DcT5z9mU1LYQ2j8jOHGRwGwYKZUEAHeoFs
 sFOP3nZ7kB6DYGseY7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100135

The PHY power-on sequence ends by engaging HSIC mode. With chipidea,
power-on runs before the host is started, and the HSIC connect of an
already-present device is latched at the moment HSIC mode is engaged:
performed before the host runs (and before an onboard hub is taken out
of reset), the connect is lost and the device is never seen. This is
why the APQ8074 dragonboard USB4604 hub never enumerated on mainline
while the vendor kernel - which performs the whole PHY sequence after
usb_add_hcd() - sees it on every boot.

Keep the calibration setup and the pad mux in power-on, and move the
HSIC mode enable (and the auto-resume disable) into the calibrate op,
which the chipidea host now invokes after the host is up and the
onboard device reset has been released.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-usb-hsic.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hsic.c b/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
index b670ec364a2d..e0637522eb82 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
@@ -63,17 +63,6 @@ static int qcom_usb_hsic_phy_power_on(struct phy *phy)
 	}
 
 	ret = pinctrl_select_state(uphy->pctl, pins_default);
-	if (ret)
-		goto err_ulpi;
-
-	 /* Enable HSIC mode in HSIC_CFG register */
-	ret = ulpi_write(ulpi, ULPI_SET(ULPI_HSIC_CFG), 0x01);
-	if (ret)
-		goto err_ulpi;
-
-	/* Disable auto-resume */
-	ret = ulpi_write(ulpi, ULPI_CLR(ULPI_IFC_CTRL),
-			 ULPI_IFC_CTRL_AUTORESUME);
 	if (ret)
 		goto err_ulpi;
 
@@ -85,6 +74,26 @@ static int qcom_usb_hsic_phy_power_on(struct phy *phy)
 	return ret;
 }
 
+static int qcom_usb_hsic_phy_calibrate(struct phy *phy)
+{
+	struct qcom_usb_hsic_phy *uphy = phy_get_drvdata(phy);
+	struct ulpi *ulpi = uphy->ulpi;
+	int ret;
+
+	/*
+	 * Engage HSIC mode only now, with the host running and the
+	 * downstream device out of reset: the connect is latched at this
+	 * point, and a hub that has already booted asserts it right away.
+	 */
+	ret = ulpi_write(ulpi, ULPI_SET(ULPI_HSIC_CFG), 0x01);
+	if (ret)
+		return ret;
+
+	/* Disable auto-resume */
+	return ulpi_write(ulpi, ULPI_CLR(ULPI_IFC_CTRL),
+			  ULPI_IFC_CTRL_AUTORESUME);
+}
+
 static int qcom_usb_hsic_phy_power_off(struct phy *phy)
 {
 	struct qcom_usb_hsic_phy *uphy = phy_get_drvdata(phy);
@@ -97,6 +106,7 @@ static int qcom_usb_hsic_phy_power_off(struct phy *phy)
 
 static const struct phy_ops qcom_usb_hsic_phy_ops = {
 	.power_on = qcom_usb_hsic_phy_power_on,
+	.calibrate = qcom_usb_hsic_phy_calibrate,
 	.power_off = qcom_usb_hsic_phy_power_off,
 	.owner = THIS_MODULE,
 };

-- 
2.47.3

