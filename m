Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79DE40314E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702256; cv=none; b=RLsvwaJLOGsf4wNMD5wZukYSD6z8x9qRdCzhL+5e15AnP4gfrn+Ad/Kir45WK0rAPpTBGAkz4nza11QzyOk/a+3z2XoaAhj8CdrgRgKSwV1orT2t90krCT4tdXEUtmIMbr5hwVRDnhet36zE63S6msHEX8JFCk/YK7iHU5qLKR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702256; c=relaxed/simple;
	bh=9/2o8KpXC7EG+vRWo0L9iXCJX0grbq1xFrlQ8yvb2cc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PXIPnluvl/ELCLYnfPg+CIrbAJm7TBKL9B/oPCLrpPtsdVZRVYQ+ASZMcKpGdWQYkXDFYDt/JUdmx3bZzBprnThhHmbahaE/WpuImbmO+Aoz3eL2vT4i76/g0nSe7bNwHjpLhix9Zn4y1ulqeGw5WPuSsD4+mUkFVFqBpw9fikw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXm1Yfcs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmrWeSlx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXm1Yfcs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmrWeSlx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53auj3662156
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s5GcuVSqx3TARTmxR3YrApkKUxojUC5YenbypcGMgm8=; b=GXm1YfcsRmTqE3rC
	aILbKPzSetOC6pvsAzmynIuuXw9OlyqPoIOUf9dtoEDfi+aHt9vp+3e+VFmpTHc/
	mUgiRBgCLqQIJugiJfALEhZ6P2QbzadQ8ZWU1szkp3Zxss1QM92X3PHwsJrQ3vNr
	v8zQzcdUyWvDiIDQA8WyOjM9t5YO5wUFL2WMtjqzUFXN/vjC9q+S9eHhUJU5fRO6
	XIOK0eUrEbVLj+tjA8aMqaKNLhvreclevqL50D8Azh5f0fSMCZDi2P9DUkZvyVCs
	r6/TBFMlKANjoSPuoKB3m+7Ek76CiUFXPK0TUcjMogXJAfXd7yZpdnch1X+zuj+q
	NATlhg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e2jsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1b4d961dso102808981cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702253; x=1785307053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s5GcuVSqx3TARTmxR3YrApkKUxojUC5YenbypcGMgm8=;
        b=NmrWeSlx+YgClf48aOKxHCBIs2fEuLtGkgbiKRTLWYSW5yV0QTFSe+M/J+9EyiQPb9
         rUwsdxDmDzlht5aRZM4xwcg7EWeMurQcmiRC/kEFT+g17707znnao3Ydi0+ja/VZT2IB
         LHlSwPINETw4AGkqa3OQQHlKI+grDz2iZkBuygczGRXMO+pAwgRFfPsYRxAadW0+jUrs
         wUspXCgMn+L+MOCCjXODVTPA3iwgNdS3vekIqJZ+In2cGdtj86+Wu/VvNvJ88WhwcR1Z
         D2Pw6hwoZBhMvPbQt8kFT9toj7TjSZFQJC7EUT5HcEMU681fNgMLkDV4amwHw1oaaCy4
         X8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702253; x=1785307053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5GcuVSqx3TARTmxR3YrApkKUxojUC5YenbypcGMgm8=;
        b=QTyVEQ9QNuaCQ9A6cz8nNip/h4yYNoPB6sfnwzYNTewO++3s3747xRPPj0MwAnT4RY
         qBWui/1FrDKQkuR3L/JUGc9kJz72l1dV5OmB5ZxojYmSP/wg1QIaxU9OEKeihLnLk+u5
         kQlTChVNqeaVYdqKbw+zlrjhr8Aedc4r4WrH5wOfEW+/xQBDWdvglXEqLdXguydMV4ko
         NcKsiJ9qqbwwlQPGIIk4n/hZr7LOcZGUSJ4HiRlvfo2tmPgT4O+LXQK3sCiCYZyllDv7
         oJpKGpvoW9aG33qGtEOfCgNaPT0jVpUhjsP7ATAQ3wlJz0lOY9zfWe6XRpft8UnavD6u
         XvuQ==
X-Gm-Message-State: AOJu0YzkChrNsMl8B1nG4tMwXCH/a8ipolyY5+xpPs8OdYrMD9i01AlV
	rde2TzbfrQoF4DtIcxCuNDrZVCizAfLZzOG49z4bNxXTAnmwcFn/zEWmZ4JINY5IAZQgfcd8PUq
	SdUHlOZvYG2ac4YO+IiTQxxKw6UHXKuNbFPcGop5p1RDdgsrYpMlTdeNU9buOl5WfVQre7YU16R
	i7
X-Gm-Gg: AR+sD138t3PzZTM7DvgH6wxjaOu5Oas0ams/m6TqbUjC88AaCcTTmhagE2XyK4vkpQP
	7pzUqiD6gRbmpQsj4Yt9ll4k4wKyOqWUl5wM0kU/H1gtsH4CgTyJPhYU+0BRBJSILvgm6ZoY5Hs
	xIQzerCVNR0f7MySHc/3qgX64phfy2gEpmGn7I56HWc06aE1PgvF8pZzqH9jZgm01G5tQnRjnVb
	EUC0mR4DcKeVzmA/M/J6+jdLJNL8EQR/A3q3hKC2avZxuaimTCqDwNrnuBpPzp9lMtpi07INmDF
	LK/Kew/ONiht3idaCE1hX2hiHRmrPxB7YHUlqwwJKFtlB3ExfaKIFd21eThht346NPvY+WgKKUR
	kgd4mcFFcbfaC5QsPDt/S4hcangKxnIUo0B8aDAgy75980mj2SlrwVXNZDDsB7tF/BolstO4NMe
	tC7r50aBnfKZ1ksw==
X-Received: by 2002:a05:622a:296:b0:517:c582:9161 with SMTP id d75a77b69052e-527a5c0ed5dmr28362891cf.7.1784702252772;
        Tue, 21 Jul 2026 23:37:32 -0700 (PDT)
X-Received: by 2002:a05:622a:296:b0:517:c582:9161 with SMTP id d75a77b69052e-527a5c0ed5dmr28362611cf.7.1784702252378;
        Tue, 21 Jul 2026 23:37:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:37:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:36 +0300
Subject: [PATCH 21/24] drm/msm/dp: guard subconnector setup on the
 connector type
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-21-368c10fe62fd@oss.qualcomm.com>
References: <20260722-drm-msm-display-interface-v1-0-368c10fe62fd@oss.qualcomm.com>
In-Reply-To: <20260722-drm-msm-display-interface-v1-0-368c10fe62fd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2550;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9/2o8KpXC7EG+vRWo0L9iXCJX0grbq1xFrlQ8yvb2cc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYGTpUgbAG+XcsMyqOlI37kJQzxzDNWXSDTLYv
 bxCpiezV66JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamBk6QAKCRCLPIo+Aiko
 1QGGB/4w8HILPKpUQzeABwsNjmmVWbOg15aj3qwewGrfqofbXm0E2tKb3tVKsOCsG7v+DaBSTgz
 E35dLqPkiEAHhK/4mg4X3P2vxPpAloYItnJ7ecrofE133fJzft1hvxWP+MhKnwfrHo96ByF0Sbq
 LX2vsVRgNPrxG4tNvuIS6gp3tSzucv1orqKL8aPj6tSbCi4rT7pmqpyBATpDaGIRvRaUy1OuSEW
 NbPya+Cy7ssB9EJ5/VIXExfrLYOngNVhroCV0L3WU+QVDPVBUaK8t13XbRLr/ZpEZoJ86xcAsYn
 eaWfhzSh59icozOG5smoZvcMA4NAb1WsenQvJcawclpIt8JI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: lGl68dn4iNjop78MVRP0zml5DCqMdQKC
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a60652d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=m6zLIIb-bBn14vORhpcA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: lGl68dn4iNjop78MVRP0zml5DCqMdQKC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX7VdAvy5pcyBb
 YsYn59zT878ByDqWYaCXBcwFPLJ5bYBznyqnmJwPBtZCKjLgv8vW8BjMWDvRC86Q2Y2VuLLd48v
 uN0B6yhyZA6dCYkSdLs02jfqdUvvxhwqFqswsHTiAe18nzeR0MsxRdY5kiARLEJPf26D3+1ZSPV
 cnIUZJw+Up4fsJ54fdx7jEzFZLln9MnCfgdJBA3GkzX4BfLIlHgiLEuoE02ckYPpNOlrzEwYx9B
 uVV8Yj7r6cRh+5I2tjgEymz0Yf3Tn0tWflDBO4O6GwSlB6Rb6aoj89n1n+HekmrWigZeIYu4R7x
 OrTSOGc5bbwskQ0kw0CmDlnSK88jJ5Vpl/1ArwCodK0/pnS65tH1zApICL5LSpmVSSYMMkZ1sTz
 aB9gXsb4n3XJg5Fq7Pi51YBmC5skoi0429AEQHJScCCGpe1w/u9Cu/gjPzsIDZ0s+F9hZWf8Tuy
 7+XsVWAG07PDUgrLxSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX5jkIvpeX1GXk
 gP8sG+7a45CYVItSQ360ZPC/i73wlwWMKfppasinhV89S52Sbyd+k/1JkU3HcK5+NVITZng0Oiu
 vH7jS746NWAGFYad7dqzRbnPjrrs6tc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220060

The DP subconnector property only applies to full DisplayPort outputs.
This was expressed as "!is_edp", which infers the property's
applicability indirectly from the port flavour rather than from the
connector it is attached to. Besides eDP, that is also wrong for an
HDMI output driven by the DP controller through a DP-to-HDMI bridge:
such a sink is not eDP either, so it would be handed a DP subconnector
property it should never get.

Key the DP subconnector calls off the connector type directly
(DRM_MODE_CONNECTOR_DisplayPort) instead. This ties the decision to the
object the property lives on and correctly covers both cases, skipping
eDP as well as HDMI (via a DP-to-HDMI bridge) outputs.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 drivers/gpu/drm/msm/dp/dp_drm.c     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3397a3a47ef3..4f6da636f7c6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -295,7 +295,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	msm_dp_link_process_request(dp->link);
 
-	if (!dp->msm_dp_display.is_edp)
+	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
 		drm_dp_set_subconnector_property(connector,
 						 connector_status_connected,
 						 dp->panel->dpcd,
@@ -477,7 +477,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
 	 */
-	if (!dp->msm_dp_display.is_edp)
+	if (dp->msm_dp_display.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
 		drm_dp_set_subconnector_property(dp->msm_dp_display.connector,
 						 connector_status_disconnected,
 						 dp->panel->dpcd,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 6b55753da0f7..00653b0364dc 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -323,7 +323,7 @@ struct drm_connector *msm_dp_drm_connector_init(struct msm_dp *msm_dp_display,
 	if (IS_ERR(connector))
 		return connector;
 
-	if (!msm_dp_display->is_edp)
+	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
 		drm_connector_attach_dp_subconnector_property(connector);
 
 	return connector;

-- 
2.47.3

