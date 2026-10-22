Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675714;
	b=AeELbSXy2EKuVEGfvRxQ/fNvw2fFBsgc3musaW9KzczdeE3f+mGL92kTpxmJSyHlme1D
	 nwtPnCdrpF2IksUYpCgp4TFaKX6531ow1GGqL5t8dFddGDpRlVCc5M1VFqXNYxMgLIpCh
	 L++gmsuPiy4VmEWNGPVQ3MODstk407q2H+1qgpPwJadmetkDsTbhdyY21gIM0lDiK0ZR1
	 R5KyIr4+M16toQhIV0Sqmt+cYp6pbVMqTOxb3UC4NaPTUJEIsFUDaqDcJUNfnG6U1d1es
	 boTrZuSzt47C1PifbhAdGXPsDIsBSRKlcar8owLYt8F5Y+kuPmvj1nerh4bRif5w8kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
	b=nePTRs/wfvafYd+AbAR4yToTHblFkAxD+15y6wtdvkhOAv9YML+deB9X55Zzm9G4Jl9n
	 mTNvFh84vwad8fjjFWqADijhBYNk/fQ70DmR8dUwSATwzSz8X6yK6WcnIw1gJX7yEJN02
	 c+zhCX4qMxTOuQTwTyz3syJGCnyQkNrnhhDZKncoFy/doAwq/Y8AitZ9cmZyKLX/MTN+m
	 jQhY1YlulSvgtJ+KnG7RSq4DbA3XfKBBW2qBGMciVG9vT+X4A1Urmuh809NlyhlIqBbPn
	 tgqOy5zLPfJaGOOtWqN2vAn4yNtuATU2Te8FWGooyT4INvYjZQQef/aXr1ySzRakYiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lDZZTSrs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fWRpO2XM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2DE60A383A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D2DE60A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lDZZTSrs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fWRpO2XM
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA076V3115637
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=lDZZTSrsyHzIsGBU
	PNHByJxzu03sVuEFd7YCa9N4r/dTQMKGmX5g6LTrvGZKfxSVdSkvQnawX0Enj2Zs
	nW8hDHxxVDkC7W8oK0W1IHzhDvyLhFvjbe/s/UmIPaEd4W/t1M2uOgmhipw2JXJQ
	twptPeIl5am4ilbMTLfAM41gLjjifhlKDZadM8+uw/8xXnssNP9BAb+54fS+/KC1
	oem4zKn3O3B57IvTePSecSpKhSbe07Y9FAURIXt2xn0Qu16IASAjB6qBhOACCJ6k
	xqnKWxsW6B575ZHIaEg/r/xyVHw1NaOTQSGgi+OkzIbX3aXI9wYliFoMn7FIobxh
	nKHhCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bus6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:28:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so354506285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675713; x=1793280513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=fWRpO2XMwSTFLDsn/wzLIxXKg5eSyZOwD+t0iJP6E8TCY8ZTUN7Huh3oWuktDppomz
         sRtTl3mTIqZJnmX2HTml8EUSYZGRkesQErkdlaMctoG6tZNZxR9walnVbLXgWXVPHqlI
         4zOof6s2b9tOM21vn5lZNImlA4ffZqn0y+udz+DxfeV38vnUjaRlJ/jUy22tE9TQTTjc
         UPNNs62YS55+tTCpwNH5H/ltBjE4YTvgjDzyNqcucYGyXJYyRKvcql6CjWqhhubbBJKp
         Bk1YUHYg8RNDfll5RO6bjxbLa6F4C9mUjeYm1sSC3t+yKPB8pEcr/RI+oGguIgmN9v/z
         agTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675713; x=1793280513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=tLen13MbMTR27YNzFCzk5oCCPjbyUCc0exdV2mw1G8XdBxhdDzWBzHJWWKUUxoKXZt
         r3IgMVR9f8bY6KkSER9oM2tj1hJnPNR6y3gnAiqK+4DJq7t58u85SUyC1XCRO7BEePxe
         QC2BpNGdmVdCqvPOBODveIPMocHq7E2VutKyDKEqy0CfsRYfOm5xOptQnv8EYpcyGzlt
         rHRCwctx3NK2ToJmpBXAMPaJXwBPnFeTdlQ2dm5uH18clIrntZYPm6n8iShV1k4/Qian
         AeZqG26CduerxrL+6nT8w2/hZNGnVwF6U1Wq9XofR7mLd4FoNh8AeZ7+BNUDzjafFYCm
         SyXg==
X-Forwarded-Encrypted: i=1; AKwUvBy+qUGuC6NidXF6PwI8jRPB3P24rKU1YO5Wn6yUL4mDE8rV9oJcD82FePrp7OyX4g0ZqS/s1L4stsGmX8Gu@vger.kernel.org
X-Gm-Message-State: AFq9FYJX1y3zfbVHESL+JRlltSKNM/g5K1Jyk1rQJD4f3Qu7KERRaA6U
	Ww65CwEpRk5Weorze9Fti/VddFCE/G+Ebc1bjtYcIpe+6XOV7fADCHuQyJnCFDgRSWulbdrizWg
	LXsvttqGSmysMolHSlOvvkMsK5c3VoO4gUMnWXx/t5EX3t8DdNAkoDB25Bbkdm1AL6bdq0xgxkf
	z7
X-Gm-Gg: AYBFou2nE+zP9N2LkvhnDLKuSMdDNs6lzRRhiAOdK+0M2AiIGWw7Wir98LvgSU5Clq0
	jQeZpoxHs6K5RUludIyNCa1iR2Lhin6DAsjug2zVkv0YeyjNQH5hpAYu3QT7wahomqrOe3NZSwG
	j8EPm20qvdu/rE7SjBxDuASp1a18MDyqvrhy5mnGzgbJ9sCLBHbyYGQqINKF2JmNmieC6NmIu5J
	eGYhvnMzNUr1YzuFfQYLaW4sJhT7FNseRFqJUaaO0N5e31NsSobE2FgjDX22GGOfnme4HusVVHN
	Eobmm2jfksDa7bOSuVXRYF1OiqqhiGdltwIWUt8mRD/Atwm0NN2hT9g+thtPkPLA1QShzwGx23y
	eVO32Z6gobTIdYqOL4FpLTAnqjF19NFxViXD2BCXMXrrNlzsOwM6Aw20lSRWLS/BrYIobvsNd72
	Lhb41souVfd7/x
X-Received: by 2002:a05:620a:4441:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93f57f0551dmr905866285a.25.1792675712637;
        Thu, 22 Oct 2026 06:28:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4441:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93f57f0551dmr905861085a.25.1792675712171;
        Thu, 22 Oct 2026 06:28:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:03 +0300
Subject: [PATCH v6 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
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
Message-Id: <20261022-hpd-irq-events-v6-8-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
In-Reply-To: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jYsdop2BAded35utDpfgQd5r9JZyyy8UmHQPRLGSyhM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9n9zhrOEK/rx5gX2YWvMmc8jjptMWLaOtO8
 lGcaMlPGN6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZwAKCRCLPIo+Aiko
 1edwB/9YWfc2EM5dtSwi1Jbu3T4rlHmDDCXXx/nWp1kfXy0H2CCngN1eB6ZYMcxQtWmtadH7jVn
 o1ni7leB3t6qsyNfhfjzVK9bH5DxI8ykunhBwboni1mwzg//NnCAkchdPC0bT/n15WxKQCLyNcm
 Z/qS/EDw2gQ2yLhg3dHrpwM8RPmJ9kVwIvpF7K7Y2gbF5wAGLrBYa0LvtwCVS35/K/RvlHejThf
 6VdCYsYBJHHa9HS8h99g1E0vihe8vNmkSPwrHgdocyqB1rPFA1Xs2dD22Vyh1WLnDJ4N/9m0iag
 EISm7/cQe+/sZsMYSOeTi+FTCVIt+wn8wBzeI+jPBp4Kl2KP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXxDH4jTz1iL8h
 6gxFnRzf2WWPolZSE5syPkCFC7ODrP/lNn6n1z82T4f7u5U0GRaEeZtfbd5SokzikLXvhck63CL
 CqRZtNt6yGLocnxhxaaXLOtm98o39bo=
X-Proofpoint-GUID: sl4Dk-WQ15Hq3OYNNbVyt3b23gsDrLtm
X-Proofpoint-ORIG-GUID: sl4Dk-WQ15Hq3OYNNbVyt3b23gsDrLtm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXypsY90Dw8bDF
 RUDV/vaRm33E4OIuHJEWF8hXxCBVHm5V9Xr8ZvzlLljx9lxUxRtJI8MFKdmx9zvwBTlcM4LXcoh
 B5iHuihKrwCRXKWMkChwsqgLcYFfPPpMkAcKRhJBom89xw5zHL58aeCNrXMqcXkUqbQ6uSuebCn
 Z3SZm5g91SrYRK6KjyrmhMZRyVUclrXMObyu1y+fjzljfysknnALFYcgHdb2K13hMYdEZONv14q
 034NH4LDeQtuBR2VKnlXkoSJi/PerM3NVmn2UlCCkwGipJYglyifynTce/EMJ5MT3ca5cnGjviz
 XhBdIX95uTTsGnS6hJlkj1k9mK/BxeooMk0Fn0XO0xS9ge1e9UFRVD5xSi2w6fyCCjijjZxY2hR
 WpFNEs1tLWaUFwreRrpyGZ49peRrrQ==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ada0f81 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 13c434f8d03a..c463b23c99d3 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -374,7 +374,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3

