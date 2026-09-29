Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678C53F23BD
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656113; cv=none; b=sOfsdcMmX2y/gYzexP/q+1hMzQxw5SIh/O1EJNy2aunyvBTF3k4HBZYhRPMcLxK7teHCxxnFpMLCg1/9LL5mTSadVlkcoVNiZl+NyX2kzclEsHceqaXo+5r1d/PWtAs07g34CtlpH1UAqfxMPcIGZytmIpeVrsPOcKaaL+fBWF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656113; c=relaxed/simple;
	bh=QDRjR0asQ+YszALPwhIKnWinzSmuIA+ky2juuKuHgt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MBf2hOSaMuDlVKzjvGOTainkVgy1uJcOvRJaZ1x+f/Io1Hz5b8UvhA8IM8Y3WrOjGQu6w/eU60ks4bZ1H2Gd17mO63R+URUR5QpJyDrexWMsJx/gQ+D5E7wUeI9VWJhbKHnvAhbXqfmLZzgsZiaIMh8XHZtLV9kQ3SUlcuym4B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pu4yzoOI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WwY/gsKm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pu4yzoOI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WwY/gsKm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47KTW3241646
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0dzBLWpivrUI4Nat3yuVRNItbUI8yEZDWAO6tGswt/E=; b=Pu4yzoOIH3/Ae7rt
	YaO7pkWAeS2mRSTUkhjGLRtrRjPSa6EsuRzj45nkv3BeIxp+ZQxj3C8tHX/KoxfW
	6upNeE1TDCEqkT88r6Wh1cphTT0EqTZhbzTlhO4H5IOTZvoEThueAejd1lIspe+5
	UjnxpjRp/gLwKah3aDzUqSA46Vz1g3ui9ntSCN+jo7GNXd4AdPJvG/8SZg9Diqks
	xTqLF9fu38xbj3qB+4PMDAgPbO/KjoaFYrFuh/Hy8YeB0ahji5W2FmOMapibxQ0G
	WZUzadqR+XJCtfDerQDhFRjmvbW0H06TUk9IrNgeXbVf4Mv1JLuLJBv0y0DVSE2e
	worTyw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144s1nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:28:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91430af782dso85341876d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656110; x=1791260910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0dzBLWpivrUI4Nat3yuVRNItbUI8yEZDWAO6tGswt/E=;
        b=WwY/gsKmh4STCS3X696VVioYCf+z60YilSrftrCyEZt7oQUggq5seCH3fZ61pTvE1S
         HNQdaDBsBk4xZ9u2RQRSOOYomkOy/pFoeSUXqbTdvVdZJiSJ46Lt3zGrvOpB9MhtcqCb
         K39kiKJOZBb12QF8lcYfk0aeo77U23fNuG2o26abInrANG0ZHLEPL8+t3EL3eFoopxP9
         eFwav9xb+IK5YSB0nj6h8Yz/UP1VfK7xZa0v8AbuWN8HJ4b4iZPP9YCH+vc7bro+eNDc
         L/BYxqb1AzJVuJeoRO9ds7rfec1UjLRqEP+JwoQGUlApqmY9rNDvyWcFIc5365sxokCU
         VSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656110; x=1791260910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dzBLWpivrUI4Nat3yuVRNItbUI8yEZDWAO6tGswt/E=;
        b=WH6ai75ZUdcTjMgFqUwPwgW9pRlobDLXJFnZKo72Xe+75/ushKnfh3iRnTHqV26Zo/
         IxFeJXthA1Ovo1AiPMWvE6FUU8zf9eM4494rZw5TYgZFzdGy4vKrpA7rgmTZjTh+v8OY
         0FFRT45gjfe/Z3jpVatl0tACGvWZEDFHLVAFV2hbGlVykiZImwoe0fqHhb3ZTQZgDsmq
         4weop5R+4l3Eechjy3nptz51o7fFGY/HmAmG1QNswF2v/B1W4j0GH/4jF1J8mpgQLg1a
         FftNKVR3JXN68NMh15YZAECwBFK7u+/CWQtRIxoMYDpvpXURJKubhZU6B4QCN5r1xDJY
         k2dg==
X-Gm-Message-State: AFuF++lDNQNbesThrshw+mFMS5QrLx4ObwJ6y0XwY8IvNwu4YZ0Ae3I1
	WUvo60DQTjug3B0HFyTjUUdc8H4qEGOw3E0vS19OzxZZX1gIjqhdpcJY4yJ5AJqauvQKO1aBo/4
	XLAbjNnXRWKZEOUvK1h8s/QOibaKEReCtAtKLKRBrjFCffIeEbJ5AzZ66iStSAODVOLYj
X-Gm-Gg: AYBFou2N4Y2Pli7OZe+xAEB0LHUDPcYaPFS0whxztXeXgnkd844mMLDDrTW8xoQzvDr
	w6LchujPLS87LNysBWau3fIowgnpBAfjr7RQjCAxVjzsprDDZSjmRzPwgRwN1ROXushnoVTguV8
	sOUDwv+G1xzjy1TSmuwlm9GKF/hLX7z0Ah8wBvUuRudBEm5goXlSKZJH1JEy/11cA/1wZsqPVEG
	wbjMX6QHGC4uns0pHmDGGco7uDT06wDu7JLWM6/WXMTrP2sVREDbniBaGBga/1v2m+ewnw8U3F1
	iSngs5xniy1TyRT2hN0hHUIKZYJCAPR4zwBvbQ4qVXe/m73wjQCXJ8LbIZJeDZ+y9GVIKb12DZS
	rafPcgtwTH4Zz9iT8LL9Vh6NwWYzPNydy423KCjVrT4nl8/UVFp8SYemFshIAMME=
X-Received: by 2002:a05:6214:320e:b0:912:428a:8bb2 with SMTP id 6a1803df08f44-9142f6d304emr237398056d6.19.1790656109751;
        Mon, 28 Sep 2026 21:28:29 -0700 (PDT)
X-Received: by 2002:a05:6214:320e:b0:912:428a:8bb2 with SMTP id 6a1803df08f44-9142f6d304emr237397736d6.19.1790656109291;
        Mon, 28 Sep 2026 21:28:29 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:29 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:50 +0800
Subject: [PATCH v7 26/35] drm/bridge_connector: avoid detect-based HPD
 notifications for DisplayPort
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-26-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=1983;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=QDRjR0asQ+YszALPwhIKnWinzSmuIA+ky2juuKuHgt0=;
 b=5qG1cU4igksDXTaXfGOMIAkfLQ1z4WDvVMcOfTgjJbAKEvekS5EmNUyA8aXUh5jFckSUlLJTl
 1MrVKLGbXJMA+HHiKoaJXNLPCRDJqlNjNc6RQvwZRxcIq+NYe/fxcZV
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX9f3W0fCEGPOc
 UGpATYItDE6YBNtVc5hPyt6sAjyeniYNzq5HkslD5K8G6bjFTKKB5rykHUoaLHHQH1NaE2zbxvf
 /4BOGbBOf4qgbj6hKMZ3svK+gsfauyq5SxFouSiuCf2M+2cF7HSgXxh14PH7IScRQAP3A4uLdY7
 mCtihG9hpJFayKbJ5GPvhLwSSqa/M3+ICy9iDb6mot97qpAddzhTc7IinV+h1TJIKePS4ewAyfv
 Z70SJCD1CisEXF6VgIhirWJBeNjvPR3jXa3Eoxa7J0OQQYRwJ9JwgJQ/juJyP7DujBrWOR36BYQ
 D134eoy0OTKBjzATMbLXd2unuSaMoGMEICqESW4sWO2p2GDOb+oDY2ItKigIDJOJm2DPLFRrvQW
 uqe85d/0/Rqcxm/uEmx14KRbw9gJ/V0lRkSXr2I30fjrAsQEVe2KWRmYkyMuqGrJqvxBJHtjJ8p
 FBCgIpP1tPQJmQciD+w==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb3e6e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=c5AeteMbgwRpADRefSEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: N1U2UbmOo0I8lg4kupz-WwwO8gMg4-ou
X-Proofpoint-GUID: N1U2UbmOo0I8lg4kupz-WwwO8gMg4-ou
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX1KBdiyTB+UzT
 j313FHgBehur+lRriehWNKjHXykCGiY0Bqmqh1DxBqY7T1P3Ijd4wxpX0HepnpICZ6x9r/fdGzn
 G8Zke/7/ctjqFEoUAjp5QYNUsmRZTCc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

When MST is active, the SST connector reports disconnected even though
the physical DP link is still connected. drm_bridge_connector_detect()
forwards this result to the bridge chain as an HPD notification.

On MSM DP, this notification invokes unplug handling and tears down the
active link and MST topology while the cable is still plugged in.

For DisplayPort connectors with an HPD source, stop notifying the bridge
chain from the detect path. Plug, unplug and IRQ_HPD notifications remain
handled through the existing HPD event path.

Preserve detect-based notifications for other connector types and for
DisplayPort connectors without an HPD source.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index d27ce59ca32b..8221a32d00f2 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -240,7 +240,16 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 		if (hdmi)
 			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+		/*
+		 * A DP SST connector can report disconnected while MST is active.
+		 * Use the HPD event path to notify its bridges, rather than turning
+		 * that detect result into an unplug event. Preserve detect-based
+		 * notifications for other connector types and DP without HPD.
+		 */
+		if (connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort ||
+		    !bridge_connector->bridge_hpd)
+			drm_bridge_connector_hpd_notify(connector, status,
+							DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:

-- 
2.43.0

