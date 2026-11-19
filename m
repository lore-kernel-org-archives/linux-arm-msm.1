Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076774;
	b=s8bix60+UApDuPmAQjZ7gxiWJHXOZ58OdCEdwJXfxQxagE2KRPdqKPTWYJEnJrQx1fs+
	 yuVQLct8kiXRjPxTJO2Tkjpt/L1smxg909RmR63cBXa0w8OJvfvRzImFOF8xe3lWgUKvk
	 M5HJAmAThy+Bm8SZk5VfZKOx6TupCWCRK8rmvgecjwhy2XavVk8bIefjjUq8QbZ87I9QI
	 ZW9pmTGbZfwi7LdY/sSChKySJisCzj5dGST81aCvillnhtJtCKQyFIgmKdfKs/HygS8GK
	 MGICSMJ2TlTU415cURAUr+b1RwiTyUxal8+WbeED4ocitZlRlT1rfbymqcK3tP3sEwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076774;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m+p8Z+9cYwy8buXbdgXCX158UXxIYvSeJYw1+9vLHUw=;
	b=uPce/k9kKPhManpSGZS51Ef17M5o+ggAZ/TGaconvIAB5Lsssct49EcSWAucHVoBOwsF
	 KJeu0IezN+GC7Cj6J6qmGQ3w90AiY7sqKU5UoI/lH9PVOvSY8HaaXK4mlxVHffNK4xCIM
	 YIBiZS9CCDoOEucboG6LfV6nICanr+vhfhj6ZOUm3AZL6eB6b+q1szq6w4ypMJLoxo0s0
	 xBbs6V/41yF6Bs4ywnAeYrb3Cm/o4v2NqLrcvHzCc31CivvWeQcN+JzWLguI+1P02pEex
	 zbo3rK+MP1TqdkRSIo8eFzK46TwVSQ1pq6+MY1jz92FwPnMFO+iRONMTzIv75SJ4jnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHGbaHBI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V79FCYFA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B06E606A32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B06E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHGbaHBI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V79FCYFA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ7ZoDK3718167
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m+p8Z+9cYwy8buXbdgXCX158UXxIYvSeJYw1+9vLHUw=; b=CHGbaHBIokjSX0Ka
	xtz4C14FRoBGNSwLdsdqRhbovXQ6KGRSWFWBTIT/te/ybSIcli2IFMnS3QPefB8o
	ydGfRD1pk3ToVJYCbLu0ckffuKT3H5gt+fA/3Hc+yljf2k8Uvo/dVhaZyuRGNNFJ
	2o5p9mBCi/3Wa9qr0xpu6SlK2qXNJ7ba3fmreafiSrYcT6sh4r8OheN4vJdko4b6
	AEqNorsx4TvJGOrcJCeHaLg07jnbeSx2zUfhsdc7I0pFR1OxKhrcemPPr4mjKPRa
	VyWy4poSdyLsGXeQrcyHaNe8/qIW6DU1b6Lv/cKX+c6Gnu0RMkl3Q1L6EvTQFwoA
	7gsuuA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2r75c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961511b61so386409885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076772; x=1795681572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+p8Z+9cYwy8buXbdgXCX158UXxIYvSeJYw1+9vLHUw=;
        b=V79FCYFA+/GlxJxr3SSJHsOfg/r0+bxlx4HR0wPaJv9N9S8MMBbUJJa1ToJ1/sk5E3
         r393CE0uLfBfvj9Xzh4e30ZfMxnspOH1qnNX0N9IqU6fktzJm9pbPh0sM6POvqd1ZG7D
         yJcL6eQStrKCQta2h8Nx1njPAose3Sics3oW3YxXidFFEpPc1uFaVak0ERKyxQQGelJT
         KmCwnPZ+Yivy7k2sZjVAbzJ4zbuKNadV+aMOla5KdN7E3KkOYOi+yhk2608IVTvqrnjL
         5o7nQfIJRMUfRxku/mgwslG0SVujBYxfOA3KOHicmStWUtfMlmS5crAniKsd+X7Ch+Bq
         SbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076772; x=1795681572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m+p8Z+9cYwy8buXbdgXCX158UXxIYvSeJYw1+9vLHUw=;
        b=glsBUfnAiumgmI2JSqAl1Lbg0ovWQBureHJFZTrx09S83bDUifv0rlAVMqyvuFaoyv
         dotoZZPi5162kDB5RlwQqDrs/p4hZrmXLpJeA1s5c+QO4SH1reNAdnk9s+G4gcKp9XiP
         bI3E7BsINAErALmG4TNnz2LUwi/Kw2ql8di8xIiq77op+zAKmsaDBJO1qktSCmjwEUbC
         2HqjFCFo6dGWIhmGS/cMeRNpforbXO7Qf9Ir2sXEWe59ZKIns2fqkmZaOn9hda+UsS1L
         uuXz31p9VBbbYpeygwadfwmmPZw+bcMybq0lHa0EXMdYMfIk77DVVOpgdC9kHArHgzOJ
         MTug==
X-Gm-Message-State: APuU4Z84RGRPR8/KeWFgzFi8DA1AW0RS9CWtyHS87qPrHlT4YEVKjWGN
	n1mC8gx1LgojHSikZm1YFoF22YrMdh7YMqiCnNYNToXB8ielYvty9Xf/Me4QMl9rlMaTCW8LRXR
	tNU+SxmsbMFEHwg4R3gxnl9PgA+mNoYVVVrFkr8lf5ADY6gxXeHhq0HHM7qQFRtxpEa8Q
X-Gm-Gg: AYBFou31yc+oN9wE30b9tf2NOb2vpoP+OLwiSabBNUswu+G9AWE3FNlGSt/Mxa7LKt4
	U5tHN/KAHecUycdlCbu27RlfQmzFrT8HnSY72v9Rm/FX7pAcsO3GXHfrrPR/PG4ea1WAngEW9hk
	zZEr9Jj1+p4kuEEfN8aaf8CgKrIxXVttlw7uxi+05aBAS09+sPh4ixKaxfNr6likmciQ5XLIP1a
	3Lt2bwldLys2Wco6A2q4dJLPbn7ySEkbqVmG0Wl1yxysJr7iSszzyBpFNfnUdoM3s/uG/kZscz0
	xgXnTayZ0AGcLrmUwWKHEeXhPG7w9BQ7NQW7Q1QoP9PPp9dvAQFF9sYw/4TvoghUMqHdllURjl6
	g0kHHI5bcEGL44UbBdLUQpu41xvUBEL7Md2iYvLCgq5Cz/AhYpJ1C10HUgH3Tnp2xUGc5ikrTm5
	6Jetx9WKVALtYr8i+r78Q2N44aiIEjBohZ26ES
X-Received: by 2002:a05:620a:28d6:b0:949:664e:e3e8 with SMTP id af79cd13be357-949997274acmr1001221985a.34.1795076772059;
        Thu, 19 Nov 2026 00:26:12 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:949:664e:e3e8 with SMTP id af79cd13be357-949997274acmr1001219985a.34.1795076771656;
        Thu, 19 Nov 2026 00:26:11 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:11 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:22 +0800
Subject: [PATCH v9 20/29] drm/bridge_connector: avoid detect-based HPD
 notifications for DisplayPort
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-msm-dp-mst-v9-20-ca61be4edfc3@oss.qualcomm.com>
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
In-Reply-To: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=1626;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=0BzSJVy5hCHAkX2oiDIpRZW7mGbTKWmnfn6hw/d2uWg=;
 b=WT2ZHw/Exms3N6Ny5DojIlbfnJonYmXUGvFt1rEmkvbknaPOYX081PQFTO2u35tS87UdRFGVX
 /bbVhhp5pDVAaCM2xdJFrBDVfuziqWCmGSjfXTMks5Wvk7kpW4wvK+9
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: R7xPEcArHZsBG03DG5ZEkro9vaPHB4p-
X-Proofpoint-ORIG-GUID: R7xPEcArHZsBG03DG5ZEkro9vaPHB4p-
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6afeb2a4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=c5AeteMbgwRpADRefSEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX4xQrjnsSI+c5
 7+ujTiFIOH9jXPfOMsQAhHPfjg1bpQUxdhKwOrsVSHi5yH4i8ZAVYezJoNA8sSTvjJnPlj/tvD6
 bfJTr9BrhVNjNjcDNj9rDi3PYNp4jp8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX3qm/CUz65Tfe
 M8jju8FzVPtxfWrj8FHZrDsjLzHlnX6gcqQOUm+eMM0N2m1w4q53Q/DE20rjgRRUC5tIfVj8ssR
 r0gKoyjSHETAAbMSkq0fMFLjser3S6X8SmZVgZOlMBEMA8iXm04NAS2xC/nYw8Q7QSY/u4oEKAA
 h0AYnDotYbrYg0X+09mqBXX7h8kFH45qbpbJLwUfU9PaVLjklh+z58KcjQ7K7kHCO3nAoQuWPez
 8ezNbHepHr3pKnvl+WC9D/2I96yPs4UESFt5IgNubwK5b2OjsPsIhLKkZJwiDHbKstE3cE+uG95
 6No/9S6AkaNMtfYewcUo2EiolNTcfcIQ9RCgJrnntx2ThWWrN10EmANd2wvCHJd8SKKn4uTbpHi
 E89g+aRr0lQIGFoSfLZv2+EUILfj+QKWUcf0lpB01EuDM3kwXyVYUF4AK3A154i8c+Bc3RcgQrV
 7Q4vVoj3n8mkQJmWeJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190033

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
 drivers/gpu/drm/display/drm_bridge_connector.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 1d4502126bff..dbe874d26911 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -315,7 +315,10 @@ static int drm_bridge_connector_detect_ctx(struct drm_connector *connector,
 				return ret;
 		}
 
-		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+		if (connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort ||
+		    !bridge_connector->bridge_hpd)
+			drm_bridge_connector_hpd_notify(connector, status,
+							DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:

-- 
2.43.0

