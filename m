Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675713;
	b=W5rGeFesmhE8Gs9wv2qh6enxmN8Qci+YztO+VR9qM1toe25XjgY1VC4GXfRG+D2esEq0
	 IJyajFWhSB9DMzK0dnVe80zODKlhvcXNWhaJNR69stnmahwG9cdv/Drs9BrLrMMri5K0H
	 HyXMxaQFD2hAdZDMBI5Ya/FwScnVBbkao5735Z7rxcNkV8MNeqsIUvBfZxEmnZGkErXwV
	 nPsjnZzJID+jSO0w5nqywnbLyAwtemPRyQn6x21fiUXngqvHiKyHtlu8NN0lYsPZ3Jb58
	 YxXIBBVS6n84fm1OpZAhAfkhYnWotmS+2vuF2PqN3gLbXv3/RMi9TpQeGl7BXy+CI4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=;
	b=cPH4exZsF/dMeo+v343cWwcnJJcfvc4nCkjeOHtSjNuOnZvY+IXvLHrGQNR818rYHEZA
	 5Zo5uhyattQ5eUPYOUghbl5W8eTC7n0rhkj3opT9D2yzQPH7C8IkCL0jXt6oNceTwGaMa
	 v3WpF08X1oty8rddInToAGqoENmkjAR5KvM0JAbEOBnQAZljNLr6uT97RWOQpuQdUfYll
	 sBQdn02+GnlXUkM2UTRZawEfLwrbOcS4w5I2earqrNn0rgiZ0AD62GlgYxzRlPoXZBNSC
	 qZnXVWly46PmmCYFUd2wBAicr58WXgDUrXJTAiTOKft9wvGFdPpiZ/CFFMVNQFhP5jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S8CFFZcn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TPLCFiMF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB6A60A2600
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CB6A60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S8CFFZcn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TPLCFiMF
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MCxaae260300
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=; b=S8CFFZcnxeDjyDK1
	UwXDhjtwoydfibEOA/Mn/eW1A4RO4Pr+mu0hyxuCaGmWz4FprGpi537xk7D+7lOD
	Xi5/O/Kbs2KBWw7L22+eZ6uQ3mATsNLnea0xOvHYKKwAmLWFF67iNbWUtYK/6aAE
	unOPSH0GDvKZENAdw8T++m4rQbtFquVxKc+ig/v0qVsL1dMB4RsPjizf1KrrMnD8
	kuHxe+xZH3cmkyihrBHH1MgM5x8xILMTY5vfQWoSTQ7BoFHImmIQ9SNvuCu5nYZP
	FM9L0CjPSjYfCoMOpx8j/e3ZTTP34KuZrgrIJxeBojPyGeCoGerWfIPTKMJK1GkX
	vkdzXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93cbrnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:28:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso399971585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675711; x=1793280511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=;
        b=TPLCFiMF6WZQkMZf/C2sV8GOgs2dtGZGT7IOXruAh0cZz7iuHHFqoTdqlkBkMBregU
         cKY7Vwwk+wa5XulQAPNH/wLScVROZ/HVVjVoDfCBVXjJHp5Wh0onDxxCSqkS0t8OiCQQ
         SiBKfj5EuZVAxIDHM35svGdEa+NorzjDqtQcMnw433sFS7Qqa+j9IKUQGzucnk35K96y
         EM0cHdZaj9fi86qzZhlzvsPBlHCDPMjUPHYLWlgNsVWeSt7/Clw2ovLoiVTKO+PY1b0v
         TZcrS5P3+YhJzeFZjpEuO5f12tO5t25mEInndrL7FzBakWWUH2w6ARzX83RM7E02XWFz
         974A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675711; x=1793280511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=;
        b=QGEzpJPQC1o76MsQFz+2d/I4kZXbUc1KRdT5j4CMQ47rft7QtWHVLn4jqG/AeJSZ+X
         y5HgPu0b8RbUqXjr1z9hGqpgKHbgFxOvsw4pxH1GNyAfXQadi34VDefzu4I1kGnz7yiK
         d4UF4GCbyve7G2nNL2shfohjxcgeB3/ugWI61N21GkYjFVidSoyD9y0clSH39R7w+EFU
         Xsy71eIpgkkwNw73A17NnbD8if1IyqQ5PuC2eKRf0sdKw+tYbHQVotrA8gGPbIb557WI
         gj0r6FgTgtRR+j1J6K30uwXu6tVL1Gs+M/+FcCrgdKeBG06IhCqZREUX0gAQJNBOR4HS
         GmrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQQNW3zA3EqiUcqkzYN8w0e0P3+WT0rv8P51HT4kdwJGEnKSaTKqA9zWOSI0ZbzgpXD6rduZrOAmKP+A3W@vger.kernel.org
X-Gm-Message-State: AFq9FYJebXocHG1jovcexQ3XTZeE/SU7hRXdUA3FAHp/lupgft3LJ9Gz
	xycosBzQ0ewoEghyPv2EgtTdfcWoG1kGNsS3VPaFB34f5SX4XJztrrNl/YePoVoQXcJXBe3KItj
	NotCjz6CLDZRno3Ab8xg46NF4EXNCUTf/P0/8I2TEvWksaj1k6VMA8OuGt+Nb61Cp+mcnaJ1Q2x
	ey
X-Gm-Gg: AYBFou34A00fMSN6K5gGNIfvNtVU6alOQXlHrLkd21faKJEHYu4v2M7jADsWnRCTj+W
	X+cQKI/sjZU0YvwTTgiKqm864prns9oripQKmIUM9C5w9AaJ7cAcVvWn4xTVHc8XGhd5ysDo6Lz
	CXuGx+QmqbXmoaIoaUmSv+YVC6LnOJntwYqRx5yWeifZgvO9j0z+Rx1qXaLTkUSUPW0rYpCrTSU
	eDLNorsqlBaasPgovHGUEU0xCnvEclkqJpMtEt6GuP6NylbPjiI4qcy9ruraJ1hYmzi6BBeW8Qk
	MVQCys8vjVqp5VMcEj0yOHAmTgHUkrB+k4eXKLX4ZrQggztnTUuwAFWEgVM9rP/H3AYTlAXkj62
	OfX/XJJpziKI75qjn5idUm/Hed4Y5Z/2ivFAotJeR8C8tRNO9y2z5jB8Py/m0UT2dfovIgSUoY+
	aYsv6gPW/tfcwX
X-Received: by 2002:a05:620a:1990:b0:93f:2d10:ea49 with SMTP id af79cd13be357-93f57f1d8f7mr941934185a.45.1792675710985;
        Thu, 22 Oct 2026 06:28:30 -0700 (PDT)
X-Received: by 2002:a05:620a:1990:b0:93f:2d10:ea49 with SMTP id af79cd13be357-93f57f1d8f7mr941924685a.45.1792675710367;
        Thu, 22 Oct 2026 06:28:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:02 +0300
Subject: [PATCH v6 7/9] drm/msm: dp: handle the IRQ_HPD events reported by
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
Message-Id: <20261022-hpd-irq-events-v6-7-337ea3ddaa62@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XbnsZm7/G9+6/HZ+XJTOjbptEIAHWIuqiD02f+/AGHg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Yt/vTwOk7t+tp5eoZf2Nf+emM0WXT7iVln2H3mOSzik
 TlX3Z/VyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJnGXkYFjHcl3xl82uvyJ3
 Wp9cXbxrJf/3zrq8wjf81TlV3SGbf9ad392vEaD009si5p+8ZUtBbJPTS4WU/622FvemV++LEjx
 sk3bS7/IxR89aqcQM9cmli4ourm/5eJx5v38RT4Sia+1mHV6tGYuXPt8k8GsK+1QTP+lMkSITM+
 /1Roekl+ucltlmGrnP+aN0iaXg+cdu78w3NHq9669bFx0QcnrZ+40Lt77a97OiX+qhvqUmd58hV
 25yjPmeUnaH5Wt/sX3xmq6k9XlukvCCNSpJ29pONM/SSZdd6LA+zKZM/L7zhwXnix2P5GxKO2zF
 nBgeGdORydXzLuLOpYq1z5yZLjRdlJe4airS/IH/0o8iAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX1elImTRz97gA
 S8WNyOCkhCKIVwAlFsHhllQCzZD6vnf2QpDpX1wlFGmAP+3/0SDt3dHEvHjze8ta1JU+l/PTUIa
 8ua7kHHIfrSgstvvkY0ToLnAG1iFmGg=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ada0f7f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ecQ_yDMs5xLrPBt5tDUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 7gqcqRkhwES214xwUxaPsRaE4j00L0l2
X-Proofpoint-ORIG-GUID: 7gqcqRkhwES214xwUxaPsRaE4j00L0l2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX/+QCZW4KVkXv
 VZTsxRa1cnjzC9q5Ivp9uqdjaSX+W2x6MoSYDAvHuDSoSrqdeBzTQTanvd78fKaWXispNX24mAV
 biq48hGY9aiouUio1HELqMwttWVD2j2SnL8z8av4JqwZK8/AtUawANmx/I6Gk+mXWOJvj7Upqch
 uyjjmqxNJuF8+pLmTzNZreBuC/mN6cERx0pI71yA9VofME/sPTatz9iEXlTGtW7N2P6XEWNW5X0
 lUKHsgXw1OAi4qviRLu8G4RFnHehVatEhV6pjwzNYOym0qrb/gGon9Dy/spD4k3Pt3Ihob/ion5
 SNwY+riCzyzRQRbhX/IJN6LlidOSlPSn5WK/6N0a3YGJ0sNSVmnDp4zjfHi4Db2tDDwceSRS16q
 ryYJX94E6sY9Nq/t0Pdt9upkFrYpxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053

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
index ce919a26fba2..6a8b3b8e1fe7 100644
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
+		    event == DRM_CONNECTOR_DP_IRQ_HPD) {
+			msm_dp_irq_hpd_handle(dp);
 	} else {
 		msm_dp_hpd_unplug_handle(dp);
 	}

-- 
2.47.3

