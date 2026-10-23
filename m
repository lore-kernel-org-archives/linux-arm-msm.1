Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762847;
	b=BmuXONRGDnre0/eHaGLMhHa8Vf7I7uqrQjoPHjZEnj4ARzthNPNvbxt4tnV4QGMuJiiQ
	 BkNlkdbe2kz/NIyLJmz8L+ohM8NKrZv+5mbSijz3FHgaj+rT/au/kGS1BFa5FCXNxVza+
	 8DCwRcmjmbwAR9R3iJGvpsEuc9iJtRgcIpfWrP3l2imTYju5kzgY3TyzIOnn184e9A33t
	 Udw4dc2wniPfYx4RZgqyBaM5VnaWSvlhhkNrqvblKrCIgrUxH8w+BXNPJ4NubsQw/8kSU
	 kFakYXcr9aM+cFSA0EEu4R6Z3DS79k+tLFxO2dd/e0jg/173tV1YieNCBwE8nmHl+Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
	b=n/dvJDwPv1D9uJ0KHvBqO6ylXSpON3Wv/kfS7+0moIv5GvedrspBnHwwXvqjzYQK52aO
	 uf1CeHxG9lGDfdYJd8FuQserjPj1GC4+uC07Vrjnr/bojnBrXlDK6SKV7PMDBza7PLUNR
	 vZ/+Ww9slleeFUHfhzZVavjF83M6oX+wmtubm5p5reo4hqkWcXOL6eaVyhBr+ch5F2cFn
	 sVseIIR3VHOtSP9O42+uc679FD781ye6b0rXE8BnPucr/rlhYB+mt8EBKrSiaYaw5TkbB
	 cJUgi9rh1WqrqZpFDKxWwa1vhoXUusqP/Id/bdtdfARwDgV/Np3cmhTUKHa8N9XoHWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZDQmjEo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="T/0MoPdM";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7522C60A6F41
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7522C60A6F41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZDQmjEo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T/0MoPdM
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAARPJ2463056
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=NZDQmjEo3XEu43PU
	qrUt2Yrt5RNEiHBrhrMODLvo7dCNn7vAd+G9DrNpFcK3+vA1y4YExqlfev88biMw
	79PH/yAhbyjzkThwN7o1j9kuIJTRhI7K6EgmIxIjQ0rz33bMhHn5SSkf7hE4QgF9
	SGU8BlGv05gCsCjyKIC6KPwhiWTld2YdDRiuS1YvFppdx2MjXwouWB/MvwUhLfPo
	SdBhQ2zFD4QBatW9pJBcfxdzCt4pG3JQl82VixJB6m3wW0jxV04pueNbdyBUrYjG
	GvGHl0357Xvcf3xrKjxOK0WkSX0WYqe581JBMznG33H9raDKY37gxnLM2VWK1e6E
	0Z8UQw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw4cqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so182648985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762834; x=1793367634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=T/0MoPdMFHqM8/bLHW36BtLWaYU2JHkJtDwSFT2BfVt/FVMcZDifIhRABRZsQSXtPD
         yn2Fz6hVbJQPHdWipyq+IsiEBm50/Nn5KCleGBgwmNUJeZpApztNNcfocRpKecmyhvm9
         hBOjsl6ec57X0/D7oE4A5w9B0JR9xcA1vrSjF+HDpfKiEgv2+G7Na7q+1jQu74pmj41a
         Pn90xA4XG/iOKagTKyVP+FRe37MuCkRTcU2YSvpqkIYZfrAjWCDTYd65ytoGP+Dpzzh2
         NzIWKfQcEX+aep0SL2RZGFo+yVPicn34zWU7Ka1+KpxWzPoixcZeeWJbKB7vbqHn3UPH
         +1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762834; x=1793367634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=pCXxuP4WZ5stL2vLqpgSqRFdRjrrFxK7JYncSNkQPniE9VH+xMAI3QucAqnZJhVcPF
         M+IIzD0rq3EGhZUFXNWs89C8MEhldMld8rJXgY6u7Zn+uGsHnxx8nMtrIeIS5hook8ZN
         KT/IBBBTwfV3yH5KECbEE2Yj17TUg8gygMOHsufZ1rY5G3iZlZ2PwHJIlGMY6gOiRDJe
         aXR1xBZnVdzAB22XuFF610qQSNy5cuX3z8x+rlySP3xG8vR84zqXdb+26HhimPXVA1Qy
         wdOat/6tDdYSQMKTFsQ48n9ws02UOXVPDWc0JA5maQizh5f8gigGPcI3LPRjRhj+5T4J
         ULAg==
X-Forwarded-Encrypted: i=1; AKwUvBxIteOipvGmdTQo8GVZ+AW1pF/yjRG1tQKH5OUGpbBfmOmDQJ/C7dPtLD6MbBFuRG0Xs6OPA0CCSx4A5Qqz@vger.kernel.org
X-Gm-Message-State: AFq9FYIaShs/i6F7Z8LaIC9vNhB6g0/L8Y919GLkjf50UTKwIc0zcF2z
	EGmMyRwQIMfQ3BrsFYBsY/5gD5RBQAuWhFFuW6/ZWe+tVY3xpYDK3H/EQV1DDLuabVI0XE51D+l
	n2it9f8KG6bZjD6YDLMPorDKpwfA5FBBYwtGxORz6jXBnCniNxe3BOWOPPdBreURn0dIA
X-Gm-Gg: AYBFou32G3N9/o2ERsqbvVBsb2BgDaEGteBVrJKswAd5AAohuhKrNkajQKubEvdPS7z
	GC3KbBV84u+qW7Zc/73zOmOhZjkB/isBTcx5uaxQavHPt/VU8pwY9+n8xTVIgkKzZHFAGR9X2vf
	Y2tg+QeUrIeO3ca1Nq+YujlmWqjoD1jomyuK6H+8GNRYjf1Qwc3ftXoTmxmlXFw1HtsSawATQG/
	XUV36nSalUnWlW2uie++djhAfxhNZhhmTMxHXcmWoEE+gUrnA/5gXoCLNZzZjUGbXUzNAGq6E9m
	ilofP5dhJ9i3dcDrOhO+JA3bmSBj+94EHCG14V29heStx2dFfiGjf/463VOzAeLITe/zvmbrZZZ
	HIZAwkTZMuaLj11KH578SpyUxB8vdgE52wSjK/CpzUl9hVnGuRGxkWZPzpsmPsLeHx2f9O/L3JI
	uRWrxIW6qyqdFA
X-Received: by 2002:a05:620a:4727:b0:93c:65e3:df81 with SMTP id af79cd13be357-93f626db2e2mr856690785a.13.1792762834341;
        Fri, 23 Oct 2026 06:40:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4727:b0:93c:65e3:df81 with SMTP id af79cd13be357-93f626db2e2mr856686185a.13.1792762833809;
        Fri, 23 Oct 2026 06:40:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:49 +0300
Subject: [PATCH v7 9/9] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
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
Message-Id: <20261023-hpd-irq-events-v7-9-57a3aea3f09e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OtA5kQaJAzu3uDsBpPRilZ5f2hkyP8+qPHe
 NeTG5AI00KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjrQAKCRCLPIo+Aiko
 1RI2CACg5pQDUEeajZzHEEghd4rfxKwDm4JgwgS9OSplIDBiAHrg2w/55A4G94IWULDp5wDxMxc
 jlgkqR47eCTeNzA2l6yZUkkMMvkCVWKhBM8U09/ys0hiHXYUW036cBiTAsb0Dj58VFU9dRl/R8+
 abZrn9cWVIKIHzllDpGW+CiM838Koz2EgVRrFKk76B1j/Rwx3fzwTPICryRsDzdbAzliuRvqaXV
 O8Vvtzbw/1Z+5I7/WE9Ic24Yk8xBHdCBSoATwKaz16mXwtSI8XwYvM0MQqwwSSiJ98d9mY7UwAo
 LfRTAJ62c1+UgsjyAEfClwnjIwik4AOmFfFZQCmJ4l6CZhuc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: l_qKTtqXz2b7CJKzZCY1SMS-yrD8ldda
X-Proofpoint-ORIG-GUID: l_qKTtqXz2b7CJKzZCY1SMS-yrD8ldda
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb63d3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXxCBpB8oZAo4J
 tsQWFxyqp+d5ahUjYjTDR54UL5f4m7DeUQaW9hYNPZG90bFNXjqwpJ+lT9lqPCfPG8TP6eFN14+
 jsZVTLWjS/w+kiex7dryKcFnHn0xQHk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX8s6x9poWbugK
 +IWqdqHAyQXcmYx+IxEbOWmF1yC2JKnH5O01r89HRp2WUD1SirTsGfTgZI4Csm7TnzSPKWt8C8u
 yC+04G7ccINTMmMw3bd70fb5dNNVf4hIvy4RKpP1cdg5039UdFYwCeVj/aDDmY/xVidl0pz/ALQ
 n8FkP7RuCSddVh0XH02XsW1+vz15/6sHjHOdQ1Vd7Q+F1jGFYkpAWKg/2G9DfniEe1wUP4Qt2vG
 3muuQ7wzRkMzRqem9kh6rpxZSA3s2BtAxMSWc4kKalXjfdrTd20LF6LrOU4scMPqz1BNhPQrcla
 K3b7KGWtAKWPe344oHQjIbEkiHK+kiGwNH0CTlyDAD2/K4RCwJ0gcv3ubyYq2kpq7ibnibOecjt
 TDtSVZq7tYtLQJm4RMpJ7Vf9XnQwQcZqDAmLJfsWMBkfTWkNdnafrVukPR6D8YK5lRf0Ih4BUHm
 CoT57/zRQanb7a6JZNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the EC to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 57b37fca150c..cb0312e2b8dc 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -316,10 +316,13 @@ static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge && port->svid == USB_TYPEC_DP_SID)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_extra(&port->bridge->dev,
+						port->hpd_state ?
+						connector_status_connected :
+						connector_status_disconnected,
+						port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3

