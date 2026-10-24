Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802169;
	b=D9T1rns6/9bFmIBTpN+g0CuyfCZv3NV4ab8QxHNh0sVbGM0ZQl/Qk2lcpSGNEYS8qwEQ
	 9gZuHhlXjfs/v6imPYlwsMPfJzFAHvehmqnJ2YQNMDrQuyRsMTmkjYFnr56jeYQUfpIi/
	 kpLR+/c12wodW4BcSowb7ZkiIVuGCHAE3JXoUKMjBnTKxTN9KZesgTMShNM3wGfCGIIf5
	 fV/UOEckB00gnNvWEdEg9IMx4i7+MDfOSZsOakmlWkOr7OgnuiXuIfGefcAkCiuqvGPWR
	 yYWBb7+GJbbUi98PapuUNkWOHLWhM1dHXx7bpUyLyrRUN0T7nLY0LkGOl0lcC122Jyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802169;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
	b=qpP0iUA+OPUhmKPT1M9BhWU7bRwyOKvDsp7cvS/vZgTpZyvdtCl+x1M6n+lDeHqChxBa
	 O/e/SSPqQvM4qjvVFAnx0VCNZtf1j4INYgcE0FVEQdlaCCpPuwJDFUDgdEssLPzrCp06O
	 w/cUs4AN2hWQ0axIKvhKhpmLQB4S0GYItNZWRt5dICY5DZasJtNirVPuxNYNXsedeI5K9
	 JstJiWT06N0EXVtUTaQR9fD4y2OEnCS8xQ1O06I8kM8w1Pas66G6yRB0IEKbkBH5ETVBH
	 5nqpC2zAwR7KYJMM+P8UKD4Vd5ZCNQOSEsm/cZz524WbA7jscpmnIiS2zOarSh33dug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J+YPz7wc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UoEyCQZs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF48A606A31F
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF48A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J+YPz7wc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UoEyCQZs
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLv2rA3116732
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=; b=J+YPz7wc/wXRkN2O
	/qWs+ZbaVilBwmcQTJyrbtXOAeMqeThtKiRXpi4A/NpM8tAXAc1U6YA24zFappTG
	bKsKyvIkjuaE1Gq6B/vMTXO/NEk0pHqrpsBKxIYGEyYk9RVRD4HIy6p0CWdtHCK6
	H2STkgeyyPB0upr3Si9ydSXMkI/dXDeh4B3IUEWh5bCCMJ58fNxx7BhZ10zn3WN1
	K1Gvsm21yU02e4FWnNrxnU0rQWO/05YbtIAhZqAwLCGHCJXdzi6c9yl+eXZJJlNE
	tr54sLbbaRhNODu2ut6tn/EVi7L4FyqYVs3/TqK8bHUMqkMVeqzgTTGMoAcTdbLf
	c7youA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrt91a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:36:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so325365785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802167; x=1793406967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
        b=UoEyCQZsHBaummCV+kDFvcehYTur10QM+MSEJfQeBky2bQ5nvL8fulcpJ8zLap4Ema
         P91vBlkwSRy8CyGyiktgdHB86C4d51k3r/HavJk2aH8W9QkL50FbAwqqU+HC3QcrcuOI
         fqrqtE+Hk5KkQPTRjyLCfKZ07SdXkA3/e7ay3k9L8h+wTowpCeOuVEMu7QOhHahxW8PN
         rrWfHlChf+Fhtq9UQTuBNuU3c3Qvi2pw+y7tP/Ka0EMOKEEZo6TeccejcGIxkNqQTF8K
         v+eC0ehnwiiF+B9N5L9PWga4sj+4v0+Wa4ABDbgyWKFlEO3HbPgkTX0ampuYXHMInPs9
         ASjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802167; x=1793406967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
        b=HxDs7Ik3ucU1/i9arQt+uGfyxZJmmoJY1jUjwVjAId0NX/qyDwTcKq0FzMFVYWN30e
         eD4z0NsteAGqZAS5FQK/KpnEOw9Aa3+t8vbFl63+oSTksBJzAQF5zJHGcdLSSkDz+cCJ
         lnFuL5pEA8qoC4SYIDy8N+fQlCn9pphGrPMTSu41z4c0bJKOCroJExoEVDxXVt19x9z7
         jzFFRBgojQcWuvbKIeSVMs8h+uYaqeoQMTPJTylVbzEl1yPYvVE0HvwMiWioKivqZhI9
         +vfpYp1QfnM9SPG9mzUW1HALie1bFDP24Vqd6LC61xg9PkF8+MPHqeLyyXsRFAPAiy3s
         qEDw==
X-Forwarded-Encrypted: i=1; AKwUvBwnwVRvgtg8LhN7mWgEPkATWd3KPV+p9WKriSnaCUIc8OKO7q3VD3ru+8PEMUQ6dL79wm1q/IfUSJEe51Vi@vger.kernel.org
X-Gm-Message-State: AFq9FYIr9jgy+1+sAkYCx2gSKL34HWQbcmpB/gDn5vtSzZpuZHG0Y2h1
	9ZNRqHGEnCHaZWJcVERTMzjrBoTzvjZwCQQ1zJFT0cHt7smscCwQ1DiMBbAujBYYptawZfffuMo
	5gn9G+DGq0EklLOc58Nk6CybXKrd9YG6tCeXrI39HC7Vi0gK/8t/NA5OaLxHRDhRZs0EA
X-Gm-Gg: AYBFou0fnkM5Cu6tHmiEWrs2Hg5CrdObUahTe+2ZqZAKQn8rW7GaYkxx/wR5tIeU6kb
	66egtpqxFVXAJov1+4daTPlEMfIe1qDJ4A/fuEZQwuqKjglCBq7XPkTyOC8LgRZXPUPeY72JI2G
	vT9DU0vWqJZvKh6O0lBJ+qMsKhJOIrwwb/cAFemP7l9qEjE4C58iN+ErFXMymK2xaD+RFGp1jEa
	a0i8lkS473U95aN+SE70r9vHwfMhHrEHLFPKzIAVFd2fXgKH1J/pb1XlDduVNj86Y5TQoCPNvu7
	+TSDyouUXhzHLihFgyXCwvwAU9jn5n675B94KiTqnONnEKaE/kX/709YBgyywUG1C2oe4sLpHOW
	otFv8Xq9raORn2JbCpl6CKArzi82S27gbBdnYFGupP3lGPvOppxDZO3wQvYha9gWvxOLJhtL5gz
	nrQy8BwbZBvb5b
X-Received: by 2002:a05:620a:4408:b0:93f:5843:1055 with SMTP id af79cd13be357-940ef8fcd84mr106706985a.13.1792802166967;
        Fri, 23 Oct 2026 17:36:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:93f:5843:1055 with SMTP id af79cd13be357-940ef8fcd84mr106702085a.13.1792802166482;
        Fri, 23 Oct 2026 17:36:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:36:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:23 +0300
Subject: [PATCH v8 7/9] drm/msm/dp: handle the IRQ_HPD events reported by
 USB-C
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
Message-Id: <20261024-hpd-irq-events-v8-7-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VD1bcqfARXRbU99XE94wZup/nUa58ME0mMv2ZOe59d4=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGrb/VOgyI5r3WOrGPADO8HFThBlFhdMoyLUc5IOFOCCd8lmb
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJq2/1TAAoJEIs8ij4CKSjVSokIAImr
 d3EvdLukc5qeDThRl7OAYBd5sCyOGRgGJL6gPmPsMCQlaqA93SbRaQdlHe/asMr+X2+Ui1YaSsV
 p8LZ23dmV2u2mnN+losDIcIObjYElFx1HQ6t5jidjTnjJ/unIFs9t1Le2OpxFbVvMMQnLGwcIhF
 jjwaHFiOj0BjokPIcjsvIS6tvO4oQVhK5OVnfj6nydXw/yPBrEPzUPmIYjC6CFMhj/XTSPvuKxP
 6JMXu/3eauaK8fpauY4Zh6nm1kkX0hdR1EAo/6ma3QdCG+B7ADcQbuwzaK25hzzFs8wb/qCqrLQ
 VUYUwhy9q+KulXT735Z2FSv+NPcOe77FBV+4mBY=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX9pldrDJ9PCWA
 qHbrTpVcr4ncfokOXyLx+mJaedpc5boE4GpX2dWDUpl3aawMDC5b18HTnuhGm5OsjVc/6oI57DA
 hqIsWpusGj8cPDZE0VnsdeBAsJgBk2Y=
X-Proofpoint-ORIG-GUID: 1bjwwefh4Jivj2kpRxbsbXaU0gQqZPZg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX/nzuMOH2azQv
 KPFn75Uzh+87RYyaHNvt7DTWZwbeUsrV67J0MY0+XtihkXejC4qTttvIw+5H0BORGbi4iOsgbGU
 LEHnGNpKrDyWx4DYO/DNVHnmmOkmQIVbECa6vfgUqkcaecRKlbWw8Y0dUIoIQpGw97wK2gVQAF0
 2csMBCIDsRuTwjj1xKFfJpjiZGWvz4TP1dqdKwFEkFwHMxifwhP6yFlaS5EPgZS0gsmVT1Fcl22
 4y/ZFnuPwv2oMvNxG9N0B9DNFdUhy7ZwOiSoLqa1AO07fAn2Qm99PSsQ140bbLgbrdHRGNiGUEd
 cLnSHl+dUy85/0lmxpymwIHvJZ6i+2SumAtH8+XEafdzOWP4uK4DB6l9Fy3yS7LJPmH0E0l44YB
 /7Oyy5CCu3tZkOeooiVHqgOls6Pm2Up+LBBWNuumEtFvxC60n9h2fxtjXYBg0HyjGdjnYOZ2hnR
 IcgVBgG9boQgkHH/fTg==
X-Authority-Analysis: v=2.4 cv=E7lYNqdl c=1 sm=1 tr=0 ts=6adbfd77 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ecQ_yDMs5xLrPBt5tDUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 1bjwwefh4Jivj2kpRxbsbXaU0gQqZPZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240001

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ce919a26fba2..771c8b0744ae 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1566,11 +1566,13 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
-		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}
+
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    event == DRM_CONNECTOR_DP_IRQ_HPD)
+			msm_dp_irq_hpd_handle(dp);
 	} else {
 		msm_dp_hpd_unplug_handle(dp);
 	}

-- 
2.47.3

