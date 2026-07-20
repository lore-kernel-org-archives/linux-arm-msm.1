Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9373AF665
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527898; cv=none; b=FL8b7zGdHRlOEcWxw9idDGAVyW2MsywYVlYinoxrPxod2/dH9jQ1XJhf8DuLKkcT5wWYSO1vT2O9P3nnGLzjQoAQFFENWRCgVCnCjfqZ712c3AGFmXkTZ2Sw8d2gZgMh7K+onP7g09nPSioG12k3Umqc8YagJ6Jx5KOxNEStkRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527898; c=relaxed/simple;
	bh=dgaSeilKnCq5wSn3TAsuBpoL85ew+5L7uAl+smsCX/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gHlGuRMjDICf35MxnsCwMkOun5aXVSoBRKLGFY7ZeKc+69INCUqmj+E48DneJcaIivpYzVlw08d0s5L0D9k8nC7JXQMHQFDeE8UFKji6YTtqMLUarIAJ8UM8lL9tyLpJA4feFyA9nEL2r9x1ZdM35sgiF0/H3cACFI1ny3NP5G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LnPAuyED; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jFg+SiEx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LnPAuyED";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jFg+SiEx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsKkc1019500
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D03QOeyPxDyyec5WvQKHewnRJ0KQmMoPVroW949BZ9s=; b=LnPAuyEDWbfk7F9v
	T5cExMuJBFo97QkVaqCbmyT9TDHVTFsJjR9xCkY2n9SYe5gTOMZaJ6uc7/Eaa1rn
	+sB7Dx6b0xUbcitaRL8HnnmhMNAlm+JBWNBnxVX6wFa6SXEdGqpd2GpsBWDt5YUm
	+lKYMbkczN7fhEPqbFPJDSO4+nnhuFWXI5il380wKg+fPVBDoSiCi/jG3qc0W3IT
	wuaJRBYH5x5zyZAaKFpHBOrztiRubIYIX1cJiu3naItBOf+Mn5nHYrPJXCaO3SSf
	av+KMB0IY70X6AVKUthyt1HTtiMXRJ8qATdQvVKNvNKFq1ztqjvSvSadix6v3aH3
	MRyDbQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2d94mtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef8249f73fso77850986d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 23:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784527890; x=1785132690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D03QOeyPxDyyec5WvQKHewnRJ0KQmMoPVroW949BZ9s=;
        b=jFg+SiExuDnrYoTzqnqmO7hWDcxmnfSEzkNX6nDG/AHQI1jjeYEuJR+DNiwPF2b3vm
         LGEMi5qDRDrcJX531ySXtDBfBmcouqVIsL4fbLrjYDlrRemDBJCBICoC044fWBSYErQV
         zQRoas5fWxDZfKl+6zvzj3qT9DrYp1k4QAwoxF/+BwQTQm58KmjiLbsbBYF3AdD5XSBR
         QpMdmMvCZglqbIylQX863XADgrKYQpr5g7KJ5nTQRoD1cTsJduALK0y+xyaWXuvtiiok
         Vywp1dz59u4k8PAtWpkRUML0ltaHBVcEs2/lNmZYrWOEd9PgVMi6VVA1T3oCbvbHZMLb
         XOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784527890; x=1785132690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D03QOeyPxDyyec5WvQKHewnRJ0KQmMoPVroW949BZ9s=;
        b=dcSMKPCGLTZcOGHcWzIo7A3PZLKmITDsQ3kFHAyEoUI24fVVXnpUmt+7bOB7V1S2SV
         hrINDSwAveosQe5gHZm6EVnw08bzKY1nQl7Qr75heXdw0v0xhAVus9KpkIcrS11NhYyr
         XgtAgnmQtjGLsMGew2L36Q1sx3XocXbzwmBScxSbQKS/Tf14C2bzC4icT2yGqhCpsjT0
         0YjBDin4WqhKIuvv/b7oFa0k8+AnW4KyPNKh1Gp3JT4Mr9bo88agmkIM5NzNOHTQcY87
         lbLm68Gb629Iq/UQRkuuTbEC0+VfwWVPrsp75xVCcuiUMFOthpgFD+ruB8QIBseqcnrV
         MWZw==
X-Gm-Message-State: AOJu0YxYH+CZzusJpvo/CyIM8eLhokjFmXQcOE+fe3CodWf1se/F7KO1
	Hxs+ZlwihofZJ8gAVd6+x/YiTxeINy5ko8yDqRHmLtT46fJVZ+a0EFaSjuvS5YZ+mAlTWQpE2j2
	N52QDGzRqOFnFYwg+/jDsZjRFLDaftfJMA8JU1kBDmK6p4VxvjsAFoyulmMYQUHB1GYqF
X-Gm-Gg: AfdE7cmg2BBipZwunFpNusKnlZqGk0fGD0bYeLLagnys/xtUVVwGoaUPVvg00ExoUxU
	vpk7tvbnexYWXdgbhxb39u4BGQoieSY+0x25ZTudEAMD8dA5ZnQL1tYJ6Wt7hb8RBCBZ9fmTDs2
	tTV+ZjJpXHC6qikxSfJZwQasbOby/OG3sHrwFBpPJzm56+PPtatoMfNhFh2rSttaoKVd9AcyHAF
	fESmEz+CpQ4WBO/BPBsWCcHjeyNOwBtcyc4g+BH2901lb9GNV0ovXu6nEPlfkXlE5nTsbjJsULK
	3Nw1O2Hh3a8incRUeOXXtSDAv6Gx8lPHKixtpqvQLY6UJhjjuLts8kqeBz8FlSPjmQcoK0C0wnn
	XyldbMPlTbYwoqcshjOwI/I4j2+81AwbIhvAsLMV0wSR0cTfiVImsDO2elsiTdG8=
X-Received: by 2002:a05:6214:2303:b0:907:5b47:b875 with SMTP id 6a1803df08f44-907783a06aemr125648946d6.35.1784527889807;
        Sun, 19 Jul 2026 23:11:29 -0700 (PDT)
X-Received: by 2002:a05:6214:2303:b0:907:5b47:b875 with SMTP id 6a1803df08f44-907783a06aemr125648726d6.35.1784527889386;
        Sun, 19 Jul 2026 23:11:29 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778588a39sm84793216d6.20.2026.07.19.23.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:11:29 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:08:16 +0800
Subject: [PATCH v8 09/15] drm/msm/dp: re-arrange dp_display_disable() into
 functional parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-dp_mstclean-v8-9-bea261bf4e7d@oss.qualcomm.com>
References: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
In-Reply-To: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784527840; l=3890;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=cC8v2WuisuVaw0cBf4g3L0Y6jW9Y1zprJ/LBzfDlZvU=;
 b=V7hE7hyNsEQYHZHCC9TbZojrbarQgINs6s//Ii+LSbpYzSERG6objSv6/4GknaWiRB/rHJzY6
 n/PX53bDddVCpzuM4Bsm1bBYLwoi1r9Gy8jm99LQjtkp2frQIG/2e+0
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=HpxG3UTS c=1 sm=1 tr=0 ts=6a5dbc12 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=3ttbkIfPOWFMAE6HwJMA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zqVZLNMJHP3cdgDL5XxkUDJaXM5v8i40
X-Proofpoint-ORIG-GUID: zqVZLNMJHP3cdgDL5XxkUDJaXM5v8i40
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfXyM8VCk7hubaU
 Eu8qQpCcX/xa/OsItcm4hGHDTS9eVyI/WYyokiaSOdkzD9O5XcgYciYAFRCdWTuaF4ln8NSdDv6
 F24BjPt4OQuENdfUNjTLdmlEjERfihuKc6vJhMCxtMEuTliGxab80P+E2sIzN3XsSfDl4mcSef/
 dM/+6aRphxaW4Etq4GRxS1WKsGqjz5C+N9je4hdWQT4h1BOP8tb8AmSuM/o6NY0BXo9BmI0OmFX
 M7EGuUbJ0yVnkHIHO+NJZ1gJzcPRxS57c+yTKJUBtdHGiO8JcIGPBJj8B9alv1kQsyWKO5rTh6H
 GQmisUwBsHzrCZeOBjkaPvaxyntrG5t38hlbkzzKwt2KmtSAlBzQeycftVBfNvBBiPMDcXersga
 T/N8mED30+6r3LmFPXEGtMlNli2ZVMEmyhOJ63vRmpiUELQpFH1sY5f14r6lsOW8vXQjsPda65y
 7s1H+zARNdotmkaSx3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfX4t8nn0ZAky/c
 KSzAYfY89jIIn3R4XdV+ZTPQl87GzCRyguEumL0A4IywXZyVPfqtcW/xQ1OuqUUHPz8nI8GMdWI
 3rUaEy/H2E50nAvyafrPkcQ2GnzSdmM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200067

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_display_disable() handles special case of when monitor is
disconnected from the dongle while the dongle stays connected
thereby needing a separate function dp_ctrl_off_link_stream()
for this. However with a slight rework this can still be handled
by keeping common paths same for regular and special case.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 +------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++++++-
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 32607eb678a0..ae79cbec26d1 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2601,7 +2601,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	return ret;
 }
 
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2609,23 +2609,6 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
-
-	/* set dongle to D3 (power off) mode */
-	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
-
-	msm_dp_ctrl_mainlink_disable(ctrl);
-
-	if (ctrl->stream_clks_on) {
-		clk_disable_unprepare(ctrl->pixel_clk);
-		ctrl->stream_clks_on = false;
-	}
-
-	dev_pm_opp_set_rate(ctrl->dev, 0);
-	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
-
-	phy_power_off(phy);
-
 	/* aux channel down, reinit phy */
 	phy_exit(phy);
 	phy_init(phy);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 1497f1a8fc2f..5d615f50d13b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,7 +19,6 @@ struct phy;
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
@@ -46,4 +45,5 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ced299cad831..9df094340f0b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -716,12 +716,20 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	if (!msm_dp_display->power_on)
 		return 0;
 
+	msm_dp_panel_disable_vsc_sdp(dp->panel);
+
+	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0) {
 		/*
 		 * irq_hpd with sink_count = 0
 		 * hdmi unplugged out of dongle
 		 */
-		msm_dp_ctrl_off_link_stream(dp->ctrl);
+
+		/* set dongle to D3 (power off) mode */
+		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+		msm_dp_ctrl_off(dp->ctrl);
+		/* re-init the PHY so that we can listen to Dongle disconnect */
+		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
 		/*
 		 * unplugged interrupt

-- 
2.43.0

