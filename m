Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762841;
	b=Tqx2VhfEMAk9LuQ/Z5qdruv+mbumaYx+thu88JzdYEuskuyXmQ4PmTFIwuWTP1ZH/+4Q
	 3Fadffp2JQZpc/a5s6yMp4XDKZvOULu+SLSNk/Rj8fh/OVLtIZFR547GsS8VQ4TMbRoSM
	 DRRZwPMPYYwxAog+CSkMhRrWMbeOYYb4S2PdirxK40h8x24dFxGVLESPoa2a4dDkaAcIw
	 e4VWHUkyazKR8TN/jfI6ar3g/ZX+8wtJ2WU8zYujt62hicuwvUJf2au0WKyl1OM+mK+N+
	 +ViztOwm8OeR3IpeGa9gcISNTxUMRyciSus/CMLSx+X6IJl+EuRG/TFiYFH4jT2bHsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762841;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
	b=SF7Ytbe/P7N5Jk3ZW8R9faz/24Efl7Uj3qz85FfxDDIcxqxRPI4AKam2BjiX2cUaaZeb
	 9VEdktx0QFKEIuSDx/75fYrFJY+0Se+gb1qZZ/X5Q09C9i3NY87EIiJ8i+xietSJq50WZ
	 sHxFKVeV06PRq8unK1vbHH8Od+qaskt7QYXcLzsyHbNAW194xIWYN/Z+F7Xs82mmtiqeH
	 +CW90XrqOaFGDubdDzy32xsEVFPgNrJx4Qs55hrBDGTIISOqaCNlbtsQDRZlqDbit8vV/
	 3fufLQve+fNF2OfenF2QUbBkmWZv5F4B74bUjjjKthCG3eTiCAM8K3CxeLI9xM59fkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LsNOjnzh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2iOw+XY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873E260A3833
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 873E260A3833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LsNOjnzh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2iOw+XY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAE0q1597323
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=; b=LsNOjnzhHmpI0HxE
	nmFuUTzkJLu/98q00u4qb23HjKq+tKafv2HeEDd1K0DYwl5bhWcLfJ5XLnDt+l69
	g36ow5iMAVN6JSCM3ois7y3ThM7GeLbEYuGtLrZzDokC3OeTTRmoeM9CnZVtFV5E
	x/NvEawygVOAv1Hn/4V5VS6TZsopR6z037hKPZ8mk0EWE+1KHScNTEe4JZNeX4Za
	1kE7cmnzFYzTWlYJ967gGvwK73SxrNCmIKAG2EJDmdXVlB/DyW60RPwhvglM+ehd
	/FKzjh01J+Hekscbspq3FMPyhJhEvQczy3xHyDfAiLfEc1bVCkKOpPTl6OBEGyQt
	Z9NXbg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms3vnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so195176885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762830; x=1793367630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
        b=U2iOw+XYFqeB3QoM+5ORIh3i9rJ9v4h37oiU6vDOfKoj27CRxd117YHvpc6YJDPSPS
         gkIGOpxX0q9M/LTfhEqOfvWDWkTgS3Np51PaDYCgkDTI7c3n9IRxpuEXEJQrEepN55zz
         QT8LfGw23CDCoxpfNAyeDurzz0GRElU1Cer53C1yH56J2L8jOfruakAgyIvvI6mfWeiM
         a6GQP/3ReHWTplS3JpQn7ON6oLPGoRZxIPbg5AYTZNDdkm/w/eO+gRBISmyhCT5kpP2C
         AI5psITeXiwM1RfY6qi8cqrIuUFCxc28U3r2+K6hGDLX8bFvIBHfRCGk/Sp560t9W5A6
         Z7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762830; x=1793367630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
        b=Z/va7cYN0aIJ73as/KyMaeS20FIIGg6gOQsekwOCtktAMCgGL9I3MQ9pr/pGI75LW9
         eJKGrVCqPFP83sDG989gU78uA18zZi799LPxJhwx7cJscksWynN27XI/kI23e2Q2HI6U
         gToH9ucr6n8L1oIXKtjwzoaUsZwtfNVSyrLbJMrzHe5hJlYpvr+yAEJcUVFxOD+3G9us
         yspqIMIpEiHzTjMSFzFfUCIZ79dUlNv2O45GdVftoEy+wOA9bfFamgqnXsnLyRazB7XA
         fsxetrujVW2u0eea/x/rgVGc761OWI8NjGIuLp1Nsoi5ws0R0i6nufH0S9eAs/BOPomO
         rO2g==
X-Forwarded-Encrypted: i=1; AKwUvByDEJvD76Ih9pd6AlK/xRPWZzvTReUNHPR9RG83a82BB82TCCLuBBNCO2aBbh6lBJPjHseBVj/5VXjh6hEK@vger.kernel.org
X-Gm-Message-State: AFq9FYI0TXnQgxHSvAIc6mEbD6GXedLwjnAnQtMfHXfU102AoeCyO9cF
	XNDrM5Xko2aI4UAKFySmnUifENYsTjln9E3gnx+HJdn5FXFFa1v0la7Kcsn0qh00+wGWn8DIzuz
	oJlWYE/wnAFmOtLQzZZM52DnpJxCcRgLpeZolQh6LYguvrnkVZTXwAN30Qeo9IdE1nKeN
X-Gm-Gg: AYBFou1H00brw7UeRYYjeA06RMoXvHovguV7UXEEaKhCunMsQL3igwsAE3jPqOmL1qu
	NZKoUOedaA4U72A1TQ52eNYIy06vjsNE0mPyxP76CNiIpFQTY/jK42WnawCKdlu07e9P9PSQ7eG
	xY12IKvnlyTPvEi7upxIcjJG8pxuY4pIDWfbkxpLa+KzpVsG79zolOeOA13nRUGnN5tBVde3X/B
	/yjWYX4nwqMeJoL/iYZ/uQfnKhEhvM75XMhDcBHrJCipzJueL5gypQbLt6e2AKdeTRzZhjMh0X0
	uvABwJCOSDX9lxDg1RKLNpC6ddmAXw0KFCS67jxAB6/fbk0k87xD6sElCsAUdRs2fYYiPnQOoKa
	TtprImpymudvORb/fY8hKrHALQsQbq75NnKJ0Q/b9Wnn46upj+aG5Dba6e+oys9cRALVKJ45+w5
	4Zbc/iajXhvg8S
X-Received: by 2002:a05:620a:261b:b0:93f:3e39:efa1 with SMTP id af79cd13be357-93f6f79bcbfmr421694485a.23.1792762829579;
        Fri, 23 Oct 2026 06:40:29 -0700 (PDT)
X-Received: by 2002:a05:620a:261b:b0:93f:3e39:efa1 with SMTP id af79cd13be357-93f6f79bcbfmr421689885a.23.1792762829034;
        Fri, 23 Oct 2026 06:40:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:47 +0300
Subject: [PATCH v7 7/9] drm/msm/dp: handle the IRQ_HPD events reported by
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
Message-Id: <20261023-hpd-irq-events-v7-7-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
In-Reply-To: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OrDd0EyJ1jWpTktyh/YviRqeZnCe3IPoq/M
 O+YMt54/c6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjqwAKCRCLPIo+Aiko
 1WJYB/40Z6evC5Ipq89yGzct7EekA+0duvkUZtm+g1ylN/ggbSzRNf3+1Vp1XjESsa7DpGJXjuQ
 1TE1gkvjp/LWB7CdZVfNXQ4VJwKQO7S3AMHr4xZ2n2jz26QfE1hWqucZwG/W/hmjd9ONC3cAxNf
 RGqMtZxdKdoG3Wgh5qr2rwYcetHNF3gAlKltgufERllw2nCIHO4M8ozozvoAR3wUHvqxyrk7r9D
 L+d/94J20rCRatmubWZkT85Lvjcn3o/DjkXGgBtxEaK+0RGRy0vSEaPZtJ9iJ6PLKtwHzDQy1mt
 2uo3JmQCl+lhoF7eF4BhjoxoqqIqJ8kLhgE/1jN4110PGmDH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX7AFSDwVa0cHq
 hvX6F0Ba6cjoLIWmMpz7Mn7raXMrN/YSPMkKow08oM7tCgHrxpGZ+TR3f2miI49cyCkr4qz7kB+
 a9/n8Aw0OgEdpWF/fRm/DnbModQxLQ/fVgv+QeCRXXcizzD/MujPHqwLql+KzeAG8ymWBHPFp+X
 ny/MbX0ionllgBAEyp4kyuMFN0MJkPha+jWshl0LrVjzkQNIJagNzLKI2bOSoOC0BquIzRKVT63
 GVNgFusT3MASdVuU833koEjCam4jWIsflXbO4oKycjUyqnZ8vn/0RQgAzY0LZ2XAJy1LvFRoqe+
 O6DHrsD66gjeLGsV0ZwgYnVfmZH9nX+XGjnVzUvdxVxVfu28mlXyxGq6e2GadZG7vNJpHK7yOtS
 yW2hKiEKLOlIcDew+09MnBuxPag7ETccDcybgiddFQF02mFavycMV2zuEQNsoHEUpug1QMrPjGA
 JlDtjplxZysfuFjTZrg==
X-Proofpoint-GUID: Es895vKQINodoxZMpHqWW_XUmJTfhFKB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXyGQwbghwgH+5
 TDESlwFN6mGfJT8N4ITySK+QcW03MLQYZi3Y+bRWsHJjAN+iDkfEH+GnKGaREuyu2RzyGakUOrh
 xca6JSi9O5doWNclpHnL/QS739DGQHY=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb63ce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ecQ_yDMs5xLrPBt5tDUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Es895vKQINodoxZMpHqWW_XUmJTfhFKB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230053

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

