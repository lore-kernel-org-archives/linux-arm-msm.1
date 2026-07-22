Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BEA408623
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702262; cv=none; b=by0/8bLmaCcFb/HRaxAFE1TZGvj4Kpmc7IJdypYf+JZgWN1a5OOyyvB12TIXRWhTtM4ez8bj/XxaHVYvRhFvzMTGl55kvQrTAqt1GKAae5/XLI35i4tGn9azLvqTGw4yZJnFZdaAVcNqvpF0dfTFIU9Pj/mW4dVTQ3suYmDCZc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702262; c=relaxed/simple;
	bh=oODRCXTyFFCwRZ0Sv7FS2y/hkfGA+35WKYSGZcOEml0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p4PPa+JB8uAj86qCllGyVBJ67G1EAFKd9me7bDk/NTnbXkgEXD7E48ABLySv/TFoCUsWamN8o6FQWMEq89rgd7TNP0iwLyAKFp5ytjbhys52idFZ+9Dger83ALsJs0dadyE92G3F0Jbqy1K24oxhaSi1J/ENCr6FpDFyK8cCaxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T2jdroEs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4AT3sJA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2jdroEs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4AT3sJA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53bgX4054881
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XnRrKHywGDxOUzWeTEWzWWRjTrZo78jT5PLWnVtgFyM=; b=T2jdroEsepbJfOw/
	xp6sT6YcsThvbp/BgihiRth+xsuYICbmhr63PpyVhG/9I1c1zmD6pBbP+2WqvEgL
	akfHuShxAAJ/4Tigbpg+FGqGAdW/6wVc11REJde2D5u7AivZenjssjxQqqd91W2w
	EFWSBQm7kHexNOaq9VaZW8T/gGqCKv8e7xUNbh//WACaTBXYFAxYu9kWISY+en15
	wAsPC8Kg8zqAW8rovtiLnSltuWx9Cit/oO1ueoOPvdOLocbNve35iX9VyfrVZoRP
	E4p4lcN7u4PLh0gluG8J6L5pyqsYQzsYmc47t5wjI1YvCoYJ/amLokgUxSnZSDQI
	jBA8pg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdgddn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8eec6acbe21so326132586d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702260; x=1785307060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XnRrKHywGDxOUzWeTEWzWWRjTrZo78jT5PLWnVtgFyM=;
        b=S4AT3sJAcSHs4IvlwBOoEHBh4fV4dzKrmbGfn0DV9E+mJ8WpCSZlqXLM6LK1RVEVDM
         JBzn6YHrVk8g0OEbk2LYdGTUAG2JDIDLi287shf3iKSOVsJITapukr4wVBANdJEhhygi
         FJhgfatqL6tYHj7//sNsZ6xXHjJ+MycmB13ebOhAUMQCfV5DYW1VASXCIzQUXsVWbjGF
         NffyfrbMe+LgaBA96Tt+rlTLOwUf/o2f5EhNS80SP43Cyzv+Zxn+olaSeShhc6WyvTb4
         EARXqOH8xw5YQ8ouK0SDVlksIu5y+S6DrCJY6ORBsxVrxJ2Chzvx8jQW2QbIXZasUZ7e
         QFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702260; x=1785307060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XnRrKHywGDxOUzWeTEWzWWRjTrZo78jT5PLWnVtgFyM=;
        b=koffwGlZmKfx5NYQHL9CpMfD4tg7XBtb2FF5wZ/ARMjiGIvABWsV+4OWYfkSISp5yq
         zpL8T1ci865r95i6zXaXcSveH+4gTJp0rRv0FTa4p0X0PDGv17zumiuwS05rS1m+WlL0
         UnvdaptsdeSDpmMSWyKih7Qd0n7ryX0K+IyxDGf4x1PRjo3wWT4Qm0aWZIf0Ln9H3t6O
         Mu5kG+SIxVPwEvc33ZVpYFwYg9bZJdFWbmC7o7SvXItZDriCRSTPP8dk6tIucNTSbtO+
         I5keqojNK+8hOQLo19UOsJ0C8vocgtntotXjj1NULymj+/KVMlbD3NMg0SXrkkqXbTDO
         1KQQ==
X-Gm-Message-State: AOJu0YzXnLdZm+NX7AfhYyNVXyuCeNm4GxmkajfwkdazL42clfn6Onol
	SAUHmFwntLFvPm5Cs4D1kl9Bf0pAzA1WE8ZQlbiJUXvLgBjlWoyI6cWBIfxx74776kciDKlvMTF
	1TydDJ1YX/zvXXEM50Y1mkZ5jWPEZZu04BaMvlJKpzLqs4FkJgyr57Z/B7srPoMulh/hrNSIz5X
	7F
X-Gm-Gg: AR+sD11yrV+eaOvuHiCOgL4oPDFNFfF5+79vq4yOMJSguB6uc3u9393SbJxC4mmxmYr
	nRzgN2HWHT6zcladSO+JDiI/mH5Kv983hrCJK/dr3ubdgEHX5RkkOUC+xp54W7mq2Sft9z0Aega
	CHa7catQtdlZxkZ+U9Msevcnj/r+6iulfZygHeAs+r4j3frt2omWH2x/5p+EG676WfEcHstS7D0
	WiVBY8HkIAbSFv54wp1seLorqYROKqMD4IVXdWrUSg9Tx/Qpgp0PLIiW9QX3ydr1H4NX8IW/CDB
	/nbX0/ZxEOs7gTlJIOXOQekYmABPv9518iQADrSEA9uDp10yBl7YO9Nz2GpzvOi+uLlOs5y/Dgj
	FjGku492zAwS75S2AemFu0XI1oJmkqXCrnZ3SZyVIAUs/4mf1PkqvyQs4pM++X8erNhq43q8RhQ
	/OSOPpmLdQ7TR+fQ==
X-Received: by 2002:a05:622a:4108:b0:51b:fa52:807b with SMTP id d75a77b69052e-5213e77dc72mr218367401cf.47.1784702259635;
        Tue, 21 Jul 2026 23:37:39 -0700 (PDT)
X-Received: by 2002:a05:622a:4108:b0:51b:fa52:807b with SMTP id d75a77b69052e-5213e77dc72mr218366961cf.47.1784702259068;
        Tue, 21 Jul 2026 23:37:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:37:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:39 +0300
Subject: [PATCH 24/24] drm/bridge-connector: attach the DP subconnector
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-24-368c10fe62fd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oODRCXTyFFCwRZ0Sv7FS2y/hkfGA+35WKYSGZcOEml0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYGTq0i//7pQq5pWgVJJSpoN7VfhV6Bjv6skYl
 NtppAvB7VCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamBk6gAKCRCLPIo+Aiko
 1VmsCACifTf6rchkhuEjQrSuhh1LqItb5kRl4fyZdnHEsMSloGVzlQYWwHNMev4dNiVo8g5oFjh
 IrGWNPyfQOZRFchjDhqhkJZ85oMoSnP4JPdjSFZ/5qDZkjZE00xZtUOrsG5fjJTnlSc+6mC2qH0
 9GF3NvkhY9NPZ/Dskc8WQXKdeBgdakU00j5+PvKx1yeYRGjMRKXZotxhK7LIHGUCkBQATaBgmRm
 zmAtrdw6SX7iimV2sLl15TnjwUgP3/kpt6DFTdAdZF0tvULaGjlHsRcPDZSoSjNfDxLzVzczr7P
 y8mM1KPwa7BnoCnQKkncZ228nEC0Y0Jh6QRGh4rRzGKph1aP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX1Arh+f1y1wre
 P3IVHu9Jb1FdXO50MciD60QdqnJgYcHct1VdkRLUqK2HkqGYRY6UwfdPXihUdtxPxLyrFLHRLtl
 hX8Mgzf1EYkScNm8UTUeZFhkmz7j0SXht+L4xmeeIFRMXinblYJVVpBsWHTegCOqBNOuIkiY/ns
 p5aqtFuPXjjrThzl3h2B40rcM8t+0iefsIRDoXYQujCBln7WV6aos18QkadVBWD7snvGW7Hs8Sn
 bo17sYsr/IpjwkVzFjoUW7ZqxVgqu/5mZlY6FTrtkYKDP2jK+dQkrFGxJ8GgskREgQialDC5+7G
 XQTig1+XAjzsaEYytYSRXflGKWvxRIZsTd0rtHfEuwlKRsYZlCUsN9w10mg65mZPJ8xeah2CE3r
 T2B1J5LJKUTKNx/XKUtKkaNkBVyWWjRJ1otQVX1fLZD5h+Vta2omx6lcs88BywmJqGsHgWKRZ9k
 BHNkJGMJ7qatymFjvdg==
X-Proofpoint-GUID: YH-9-gH5Etxb_h7jJBKovVyqq6OQ7IVy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfXxT1E5Z7b99C/
 pzyzHAaD7WKSPts17l0+tHp1PegCCwV7e9O5ChBXetsCdKKxan+B5IbMfoaKwPBNqlWq1OzEpNg
 SVF7LuQ1x9ZIoNiz2ls7aZd09eE9ifk=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a606534 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=3i-1COqLn-c5cVpzcnsA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: YH-9-gH5Etxb_h7jJBKovVyqq6OQ7IVy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220060

DisplayPort connectors can expose the subconnector property, describing
the attached dongle. While i915 and amdgpu drivers already provide this
property, bridge-based DisplayPort connectors don't expose it.

Attach the DP subconnector property from drm_bridge_connector_init()
whenever the resolved connector type is DisplayPort, and drop the
open-coded attachment from the msm code, pushing other DP drivers
towards adding support for the property.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 4 ++++
 drivers/gpu/drm/msm/msm_kms.c                  | 5 -----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 8b54069fa53a..f83d5f52ab14 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -1089,6 +1089,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	    IS_ENABLED(CONFIG_DRM_DISPLAY_HDCP_HELPER))
 		drm_connector_attach_content_protection_property(connector, true);
 
+	/* The DP subconnector property applies to DisplayPort only. */
+	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort)
+		drm_connector_attach_dp_subconnector_property(connector);
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 71af3780b7b1..cf602be09ff8 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -320,7 +320,6 @@ static int msm_kms_init_connectors(struct drm_device *ddev)
 
 	drm_for_each_encoder(encoder, ddev) {
 		struct drm_connector *connector;
-		int ret;
 
 		/* the virtual writeback encoder brings its own connector */
 		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
@@ -333,10 +332,6 @@ static int msm_kms_init_connectors(struct drm_device *ddev)
 				      encoder->name, PTR_ERR(connector));
 			return PTR_ERR(connector);
 		}
-
-		/* The DP subconnector property applies to DisplayPort only. */
-		if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
-			drm_connector_attach_dp_subconnector_property(connector);
 	}
 
 	return 0;

-- 
2.47.3

