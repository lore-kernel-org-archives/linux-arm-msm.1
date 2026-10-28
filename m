Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793164206;
	b=igGfoyy09R/M0NEH72PpIcmlBctGNTjLB1ORCZBjnvGE3LzHu3RTrbAEQlBYlfA8c05X
	 oTLOzvFMeAZJeAqbQiLaJj0AfD8m/6hQdl8Duk6RAvIghHTauTXnUWUPNCkmFSvad8DEN
	 GlCg+ECyeLNfkHu/FtxPMtkMCMKWDtBAEV68kxmM5ETcnjcnA3zJ+HiBHkTKva4A5lr5h
	 fOTbV1M1JO97iYC2sc3SdpGkDtRdDZwCIzAt4vpYTS/GBtlpmNBFhQVY3yCbx6+CA4zt4
	 N6P1L9sbr6kAqs+AtIswBuh86CDafJkG+0umQOkgVDzk8WA8aDcBvkL9oBg0Lt0hIlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793164206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e5W6PLruHf5ReVXisrJnJK3zbKxib4hojUPeC8YB9yg=;
	b=BRPrkD/k2U7YWuRYtpGBEkacGb38nLI61e2tdtecY0VrJ/MRu9UTkdhKyyS3lqyWx+F6
	 TLMMVW9whO9Eh17uXOJyfSQAfXhvnSuyO/Dk4Fn28nD1RLqznRCl8O2XacDAKqZB/Ya7Q
	 ORTwqufMuzVcWYPDFy+MSRYicBTfw5a/gu+ac2ESknm7Ji5PDSBL9jlYmRERq3WFCWrND
	 MUuQdjvpMFKBWq7dI27qcQo3lTfDA+0Mzdgd41QlbvAtqaf2Brhm92zy1TAqFDDRj5AVP
	 2lD9Mx9+oEKPpJ0Miondm9n1LZH15ZhORb3/iH3erLazrlRdXMyT6GP5kAWaflYRTPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T5AEDCL9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbN5iZmG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD2F606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADD2F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T5AEDCL9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbN5iZmG
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PhpL3209253
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=e5W6PLruHf5ReVXisrJnJK3zbKxib4hojUP
	eC8YB9yg=; b=T5AEDCL9mjhVY8bYsqtWdIFYc+kh1OrWEAG6OvdR6gzaZLK0BaF
	DDrAYsSYdPAaIP8D9YE97RmKoExz52lul6kbIWXsAW/56tl554kzFVpiIHR0hl6y
	+JChosL+MyI/Z0P75bnnVFPVsQsBNaCNk37r0EdmwJY0Hd2UJl8xGpZdH1rNNrZ+
	NUb6ufob3H+eOorb6RfL9CvVwYnpPX4bMJL8qJVfdCMx2TC9r4FuIhsZVDVnsRTn
	ZqIrntEUqc/Ovi1oW9mVGAiwRkXFrKBZcZT++kmtV0tcsHB+ROK7zBomfOO9fI0F
	0fDT3a4SVXcERFtzfZVCo3Fo+kQi/YzDuuw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux9bj1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:10:03 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6df538053fcso781871eaf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 22:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793164203; x=1793769003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e5W6PLruHf5ReVXisrJnJK3zbKxib4hojUPeC8YB9yg=;
        b=BbN5iZmGGxdrbSDSU8seK3dITQtJoacUIU9NFSYWZKhE7rHasupqFhcqdx58JveB8k
         1Bw07Q0FVvj9rstcnfSJm3HfCi7vcUdMKZSGBbGdsoefiXfHB9+nlzRudjUr1IXqdBQ4
         Yf3wmDhz/RaaZ5rZg49IIHOg8lrqpMNWHVJKO7zFBhrwb7rY8D0XoWk1H1YPSUVBu3AE
         OX0gnaUmi2QPvlN/BwPIH3MhplD51h5iifb+ThvoIpHIULKTiJpgK5qJcHYGS/3BYCVI
         auPyThVUeWovYReN0UgCYj8+4fHSS0rXNYQsGFshMQPEOVr0RIf9iCJwng30o0lDJ6WJ
         dYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793164203; x=1793769003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5W6PLruHf5ReVXisrJnJK3zbKxib4hojUPeC8YB9yg=;
        b=fgOcszayY9VCZXtaOh/nFRHuVnIAGW/ZWvvFmdBiUmNhCgPHJwVubWgvAyckQ1Uybc
         fSw3HgEvtEbxL08qauLv8KLTZocUlfRQL91NVoR2cY9vNY0h/t5W6uQQyzO+RfCpsH/w
         FLB5gL627VBQDG5s0twJIxqVYgLd4zAp3WxPhIFWbfdh7zToQ9k3nPG6Z1xo1Acw5H+S
         PIQ5GCCWv694sF+JRU4lbfAoMg+ltzq+NmumOni0Uk2ZyOhMUFbM7bgRAKb9kjqistkC
         tDo2t4HvhYmQ96IZkecjLpF51UQvVIsbesBIzNN23XF0xMk8IcZoMpAJZ+ubtxil2xdk
         v60w==
X-Forwarded-Encrypted: i=1; AKwUvBy9/VVpAmeQvalXoMCK8RJI+e/jIfF/VrKo8GXLT50k19eO/j1JhnDptFinUBpn+TYyp1NA7vPOc/otdVd4@vger.kernel.org
X-Gm-Message-State: AFq9FYKtR0Iyzeakg15AnmhIMyXu5iwUqRJkwZ51342x4QDOXUXQry5Y
	YsCY4fnmrd/7mfwdgoGIQJN/ZDb03+/A1qgpdouwmwsgbkbLrqB3P3ygMcTfC6UowYdB3vVBUXc
	U/ecg9bzr/P+imKoe3k0TX1A/GdNGig+1DN/0LVrOZiMJFiKCqHz2lcOy3PkfcdNo2jWC
X-Gm-Gg: AYBFou1P2CoBNXozWm+5lW7DZMfoFPI80SG6lOIDVWgeZENPYbLCF5e67RvdkCNc0Hq
	EzfBMzmSs9PC1O46Vw3DHzS2tzDf9jwDqUtzTkp1zLMhsPuxleWDB2gvRilaVppqVv4c+YWNk2D
	2KxR5szZGzvh+P4JK6VHNOTpRDiBmAmq2fXRPSK5/vkDLKmL8YufA071kyG2pPl6hIvF4SVCmmi
	NhJeqOxJ/v41CtJM196uFNdzaCWZ92TTg/Xb4XbxXVzerJlS9u0jwipTqusp051ICCnxhnZUwC1
	hxeYjeJRS7YCCBGjbL4BrUFKuf9DaUbRwi5/QW1kcwmk+KNW3g6jwhTh6lJxsAodxgWgQT41zFP
	F+Czff4pWHh1w8kkrRluKeEWX8ufoYn9u/6xhpO8TBrioGWsxRGEJkhSl7QAe9ehdvJrJJIIRm+
	hvpYGHxYbi8lVkrOTsKBHtaXPVUufE
X-Received: by 2002:a05:6820:55d7:20b0:6e0:e81:e5e8 with SMTP id 006d021491bc7-713edca6cffmr498232eaf.34.1793164203180;
        Tue, 27 Oct 2026 22:10:03 -0700 (PDT)
X-Received: by 2002:a05:6820:55d7:20b0:6e0:e81:e5e8 with SMTP id 006d021491bc7-713edca6cffmr498230eaf.34.1793164202777;
        Tue, 27 Oct 2026 22:10:02 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1f436687sm650864a34.8.2026.10.27.22.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:10:02 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: kernel@oss.qualcomm.com, Bryan O'Donoghue <bod@kernel.org>
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] phy: qcom-mipi-csi2: Add support for single power-domain SoCs
Date: Tue, 27 Oct 2026 22:10:00 -0700
Message-Id: <20261028051000.2650923-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae183ab cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=uorg23y0nfgcnAkg4s0A:9 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: R6T9Dfq3qmYGbL_iQRWFLCTVPJnIgivs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyMCBTYWx0ZWRfXxO492+4quyiS
 GkBiWrIIJ0MPfAY1sD43/I4yj30bs+bbyjKT4EfK/iEs7AtDP8c5vm2sFmRBbGRUhFKMud/5qB2
 YIbTxkIbrBiUjHiiusWwZjkJ2XnTC1ZpEgeDgTG3K4PBz/mjQFObo0uOua9dsKD/FFuUeqo3/62
 Cb8MjZ+NGE1ToXSAVC/5oZatla4WWBtU95EB8LmHuyhNGoheD1SLjznKh3jVhuUwO4QJJe72lZD
 92s2JGtzoxBJ2lLT58Frp98gsOnwk/7u7CFA3/un9XzLfaW4bL8VhopnE18bWdF1sdPtUiv/vYl
 vQNIsD1RONEFHJYL42KqUzlFvJtUkwpn30ifaZ7fYVpq9XSMqDCCM1yAaOZoGCMN3Hs0iCbYLqO
 UvZV74rVAilE8dzCPht2xP/X5IoepRB3i0dIOfBn7S7m3PmwhpIa86qfLHobYTYdALRq/8mOTKH
 VHAOvYfBbzudDXRS3uQ==
X-Proofpoint-GUID: R6T9Dfq3qmYGbL_iQRWFLCTVPJnIgivs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyMCBTYWx0ZWRfX09XzGC/SNl6L
 Y64afzfO0Rj5xZIIYGA3mMIayLh2fDhrx4SNrVfw+Kyd5Ho+D8GRtyuoW63HQ03WWJIJj9sKe/z
 1m7IsjsUfFlbD63zaCQ40AyLNylIhSM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280020

sa8775p, qcs8300 and sc7280 each list exactly one power-domain ("top")
on the CSI2 PHY node. For a device with a single power-domain phandle,
the generic platform-bus code (platform_probe() ->
dev_pm_domain_attach()) auto-attaches it via genpd_dev_pm_attach()
before the driver's own probe() runs. phy_qcom_mipi_csi2_probe() then
unconditionally calls devm_pm_domain_attach_list(), which fails with
-EEXIST because dev->pm_domain is already set, and the driver treats
that as fatal:

  qcom-mipi-csi2-phy ace6000.phy: error -EEXIST: Failed to attach
  power-domain list
  qcom-mipi-csi2-phy ace6000.phy: probe with driver qcom-mipi-csi2-phy
  failed with error -17

x1e80100 is unaffected: it lists three power-domains, so the generic
code does not auto-attach any of them (auto-attach only applies to
single-power-domain devices); the driver's explicit attach is the
only one that runs.

For the single power-domain case, call dev_pm_domain_attach() instead
of devm_pm_domain_attach_list(): it returns early when dev->pm_domain
is already set, so csi2phy->pd_list is left NULL rather than built up
by hand. The three call sites that walk pd_list for genpd
performance-state scaling now guard against a NULL pd_list, which is
harmless since scaling is unused (scaled = false) on every SoC that has
a single "top" domain.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..ac25e1e5f1c3 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -43,7 +43,7 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
 	}
 
 	pstate = 0;
-	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
 		unsigned int perf;
 
 		if (!csi2phy->soc_cfg->genpds[i].scaled)
@@ -174,7 +174,7 @@ static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
 unset_rate:
 	dev_pm_opp_set_rate(csi2phy->dev, 0);
 
-	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
 		if (!csi2phy->soc_cfg->genpds[i].scaled)
 			continue;
 
@@ -204,7 +204,7 @@ static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
 
 	dev_pm_opp_set_rate(csi2phy->dev, 0);
 
-	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
 		if (!csi2phy->soc_cfg->genpds[i].scaled)
 			continue;
 
@@ -233,6 +233,10 @@ static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2
 	const char **pd_names;
 	int i;
 
+	/* Single power-domain devices are already attached by the bus core. */
+	if (csi2phy->soc_cfg->num_genpds == 1)
+		return dev_pm_domain_attach(csi2phy->dev, 0);
+
 	pd_names = devm_kzalloc(csi2phy->dev,
 				sizeof(char *) * csi2phy->soc_cfg->num_genpds,
 				GFP_KERNEL);
@@ -369,11 +373,8 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = phy_qcom_mipi_csi2_attach_pm_domains(csi2phy);
-	if (ret < 0 || csi2phy->pd_list == NULL) {
-		if (ret == 0)
-			ret = -ENODEV;
+	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to attach power-domain list\n");
-	}
 
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0)
-- 
2.34.1

