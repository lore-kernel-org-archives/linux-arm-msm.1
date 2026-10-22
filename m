Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675707;
	b=giXo6ureWPPGcE0EvtwiNif54s2/spAQWDx6SpIMJRy2LrYXyTXd3QLSd/SY6JnJmomc
	 7cIWRW3Z9at1xl9Om6qdEh6rMD+5jdE0sx4ex+sAnAEVssLWmd3H7kjcu7lD2Io4YrCNg
	 0rIJUoFaMDBxqPoqYbHZk5OyHUBFpihk9q2z52B0929LHTKV6x1u2uKnurdnT1a2SzAi8
	 kd1ulgDLZLRpWeAiSJeLRiYn9Sgm4GVifUcazC3Kj44ZPRKkCnkasoVsFcEvhvLLQFpHU
	 bjHWwlMsc0DRVkF2dASeYZ5EW7Xf6jUaOyCJYyymU1Maufxtild0p+tVqZsbX3kKhOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675707;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GMjekKslBoodemGPPh2ySDDLJdT5DA5F/zIx2IC+Abs=;
	b=DhrerA4vAT8c0YCrRYB9e/R3w0dbP7Bji08DCtRA+C/8A0uMm0YZsCIxMcroHFLxdUGe
	 PF4QzF0ArrUPMMWfPK2C+oAxOlc36ftCJFQ8AQ9w86Q3BGsa4jpQlfrkIZIsDvocgZiCy
	 L5Hyy2CKii0gvkal3tpn+Rx3pCkHar3JiPywHa6BcPDlfEMPxFZ/TH0QKYN1gqg6fd4f4
	 lN8tyQSmuaLUjjUsvcqzcln8muQoM9nHiskBHSDNjoPwQfb9ayrNp9w3gq6O0vEjNQlDb
	 v6nIgwEmj3vkPRz72Gm5VsDFpC1cH9fuDVEfpmxgRChKA2IqWNZoa/IPKHWiBOTW4Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dc+eivA+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fLa+5NhC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E02260A261B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E02260A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dc+eivA+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fLa+5NhC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0MDG2398914
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GMjekKslBoodemGPPh2ySDDLJdT5DA5F/zIx2IC+Abs=; b=Dc+eivA+pgTCnNFS
	6pVZLbl1NJnTyKBqT6sSNMddhGpD0Dc7mqO9LK94GtJFXhwm/ybn6vNC7ItTEyKM
	7yKHHE+qDLLfPGzjXOTdXST7YuSckfkZRY6i0mmnKD6HqchOer3iP0vm7x+kkeQP
	mpfMiVrSJAz4Y6s8UF4jM2C7dZ3tSMEUL4YTa+UkAvHgqNgyC7eTLODjpJ28+vWJ
	PkPJwnaTBeo8PvFpOR10A5hbLotVucaFV6/tqcqeLj01L7sfZFIRG6xGZvxgaW81
	Vx/1g70Y7Ip+4ExijYT7TyqrwO8dDUiR88XdFfL1qfHpyvfIJP25gEiiCtBNOdo1
	WSN1jA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bur24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:28:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so393024985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 06:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675705; x=1793280505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMjekKslBoodemGPPh2ySDDLJdT5DA5F/zIx2IC+Abs=;
        b=fLa+5NhCJ/E/AYata0inRRipNbxKZMa0wYIbebo8EaGnFzZjBdA95hIedygG5S4LJu
         7jP8Kv78ibGkTFe0zfS/HF9mzcgBRwTcOqtVNxKXexDsr01DkSrmh+1KAmlxWKJWEu81
         BZuKyUvh3vUGXQwD33Z8QKcRONpfJ1D7YJprAveSKDN5951PgYQSM1lqlDdpj4I3XVMf
         FLyPHl3QZmFrUaohqHCZnY67qitvm7qXbXytK77VLkywdwQfM5oVl7LEMp6HLedP76E3
         cfJD6KFt2TVJouzevopzsmyAoahPYxhjy6Fg0RAnG+qnrh2VTjK4y/gRwsLFe3kU/Z8x
         PFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675705; x=1793280505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMjekKslBoodemGPPh2ySDDLJdT5DA5F/zIx2IC+Abs=;
        b=zvPwrrqwMdnjBnNxfTtkrXTWeMq61EW4qGwSTc3063YQB5IAQhmNzDbqJHGLYS31pP
         XbfGG4+UzeEuhI0h48/bbh6+jUUm5RiAw9aqwMspKK33/SlAdDQUbaKgAGufJeLe3lV7
         Ub3uuFcthC3a4uXASG4v5EgnIhfD6t3HyAOdJnsutvA3KkOcYzLER3d8NaLisy1BqEMO
         ODvWGemG6V53+FU9gfAfqvBDo9cSba4eE0GaQ7Na/sz3DBMvn/5XoL1PrZwk3FKJUxkC
         ub/p41z29uMmsC8qxLXDZ14cVK19k0VGlbV0d7h5gSaTog+eiV6Pj525HZmmzoJ0skUd
         gRnA==
X-Forwarded-Encrypted: i=1; AKwUvBxfeulRlhkh0bsojrQ7J5aWUDAiTQLH013j645zZCY2dWgYaT1zHtSVxGds9BxDjhz1pefMRzNN57jYF2Q/@vger.kernel.org
X-Gm-Message-State: AFq9FYJNA0fQTnr0kzsngKjGM9OtJSoLE7HuhzBnLVqK7M5Cj7bSpfAR
	p2hBbc1UmHCPb+T2bWfeaJ+RTOHOtxQbbOc1RTU9UvgagwrAz0JPdUCkdUy5vrmeEpVQGGIPJAd
	BokVd75HoYIdyqgs9t1BuJpwbsCNUMwGWDwTTT48dyld63BVhWgkxv1NWBow90m5XkIUhbqrh1X
	z4
X-Gm-Gg: AYBFou3KPZjlaCOgwPpA7E4MsBRimKsDaWaCNGIjYaIIirsWJkAStJceghqKILt7Mjw
	ezT20vciv/Z+oWiZgDh3S2JPfgqBwV3FR/WZ48UnYB18a7I4yp8C1t72GhOP3zKuq6t6buTK6Fg
	WZlrsUAvTE53bSGBqRYNJF9Rd/9m0bgq5vw5eb7wlr3VBfeWCJL1ZGM39LXmu+FVlc/n+YSfHiJ
	/aC3+oOsIVev05gFVZA3R3S2qrNUHjI3vjnl2q/9AvoA0/q/2onOYu8LPEM+/I9xWFaZIvVkdCh
	/kRKWWmHOXwI1D2MgBjPT2kw9mNYQW+48CYxqEIiyxV0/btaP2s1H6jznbPXADx64QcuAENWvGO
	bvOe7j2MJ6tuj08yOU21nRBtmzvKolKWCZk0TDvoS49TvC+NBUJBZf2TYfA5hUj401OYGrEePsQ
	xt30ViWrrjdein
X-Received: by 2002:a05:620a:45a2:b0:93e:e1fd:b87f with SMTP id af79cd13be357-93f5803fa9dmr909486985a.83.1792675705454;
        Thu, 22 Oct 2026 06:28:25 -0700 (PDT)
X-Received: by 2002:a05:620a:45a2:b0:93e:e1fd:b87f with SMTP id af79cd13be357-93f5803fa9dmr909480185a.83.1792675704780;
        Thu, 22 Oct 2026 06:28:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:27:59 +0300
Subject: [PATCH v6 4/9] drm/bridge: pass extra events to the HPD callback
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
Message-Id: <20261022-hpd-irq-events-v6-4-337ea3ddaa62@oss.qualcomm.com>
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
        Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8438;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TKKw/H3SXfDs3PoOXuNmfA50Zj1t8JLh5+PJ27RzJ3o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9l4MGN3+pOxp2wWkk8jSBOcIdcisazLhG+c
 8y9sv79MiiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZQAKCRCLPIo+Aiko
 1XJ2B/4+vL/dxLSshuFXSsXPFtrDWqWXVr/EKb/pzizx0rqVug4K/foeUZ1orqKfbh4RFqYNpPU
 FLkHabaJJy0246JZUiGqd5gYPrDU/FAsmd2H2TW1mnMKnp1nFzewurWPrZohH5/2WJ9WJEcPVlw
 HM4533qMiJQhy36NLUvFvu9tUvYSJOhmyTj/Krj0f3327BCe7pE1bDBBugOQlJn12CgMAz0I7Gd
 0b11C89GUdey2f+MK/rhvU1h10xJlOi/lUtEVs0A8UAlR73xnYR9Y9S48gCtpsamr2Bg8b2Mnn/
 HhLXomeadRSNx/KpffF4B7D7NBCc2ex3V2kDBiZBw7CvNaEF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 3c2_2j6g_jBJ50fwtokoJjqIQbGsjm4z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX6Hnw9SwANUWx
 Z/HDJ2T0ze2VrEkplFyAeN7IxT1AuPZvNkkkIbPvZ2LzvykfahjfW42Jff42djAbF//Sj18J8bq
 Sg4wLEpaDMpa5hBRCCvD4uC5fFH70+Y=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ada0f7a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=m8ToADvmAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=KfJoKOGgR5IJitVib78A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: 3c2_2j6g_jBJ50fwtokoJjqIQbGsjm4z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX5h7rYIDfR7d3
 pEmTzpd32r6XydqO+Ob5vAmnu6fZeSx9rk80a+fjXKG6XnDCHLLEpyNPLfn5e5kgNFz8xZatfAb
 jg5kxaIIwE0QyX7yjoSVopO5qa5tCNxWxSMKWG4YZLfCzod4/46UY8H1YHCxwPpKCDcTGx/bGg0
 13AIcO+mLd5VgYVBHTLKbwdp2YEYeXhruRvdCkjSNhc3u4YyEWXeZvIjNWZfg1lmk5QNE/Qy3fh
 SwyQ3Y2OwAz+jzaYzEeg9UBpfQgoIJIzcjNCc6upx7Fo+yv4RuapnQTxQUh/x4EDq1oZay6ZvC8
 rVyc7JJ2/o35lsMTjhy8ObN0p0xetobgwjsZZ+9Kv6npgvyPQuUMjEEoOoIEmoO6kI1e8T5/s/b
 44nQV0+hYBT83cVVFy4M23lL2p+tSlguTutO/zbrbf44zYr1DmpOejntrx4qwk2mOfFNv9wyR/h
 4uHOfnlFRHkgFaGS6Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220053

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Bridge drivers report these events through the
drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
callback, specified during the drm_bridge_hpd_enable(), letting
underlying drivers (e.g. drm_bridge_connector) to receive these events.

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com> # lt8912b
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c |  5 +++--
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++--------
 drivers/gpu/drm/omapdrm/dss/hdmi5.c            |  3 ++-
 include/drm/drm_bridge.h                       | 28 ++++++++++++++++++++++----
 7 files changed, 47 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 4bc64b2885f7..deb5d510a616 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -258,7 +258,8 @@ static const struct drm_connector_helper_funcs ch7033_connector_helper_funcs = {
 	.best_encoder = ch7033_connector_best_encoder,
 };
 
-static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
+static void ch7033_hpd_event(void *arg, enum drm_connector_status status,
+			     enum drm_connector_dp_event event)
 {
 	struct ch7033_priv *priv = arg;
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index e347d04b7b2d..82f5232b4205 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -506,7 +506,8 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 	return 0;
 }
 
-static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
+static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	struct lt8912 *lt = data;
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 629ff7095e87..03dbb449e0a7 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -110,7 +110,8 @@ static void tfp410_hpd_work_func(struct work_struct *work)
 		drm_helper_hpd_irq_event(dvi->bridge.dev);
 }
 
-static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
+static void tfp410_hpd_callback(void *arg, enum drm_connector_status status,
+				enum drm_connector_dp_event event)
 {
 	struct tfp410 *dvi = arg;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 1b0a1a00d8eb..4ade63306653 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -172,9 +172,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+	drm_bridge_connector_handle_hpd(cb_data, status, event);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e7f9e6d58927..2bc54131e58b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1553,7 +1553,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
  */
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_HPD))
@@ -1611,25 +1612,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
 
 /**
- * drm_bridge_hpd_notify - notify hot plug detection events
+ * drm_bridge_hpd_notify_extra - notify hot plug detection and sink IRQ events
  * @bridge: bridge control structure
  * @status: output connection status
+ * @event: additional status recorded by the sink
  *
  * Bridge drivers shall call this function to report hot plug events when they
- * detect a change in the output status, when hot plug detection has been
- * enabled by drm_bridge_hpd_enable().
+ * detect a change in the output status or when the sink has reported extra HPD
+ * status events (like the IRQ_HPD in case of the DisplayPort), when hot plug
+ * detection has been enabled by drm_bridge_hpd_enable().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status)
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status);
+		bridge->hpd_cb(bridge->hpd_data, status, event);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
 
 #ifdef CONFIG_OF
 /**
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index c542ba6ce7d3..a21f9355594c 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -427,7 +427,8 @@ static void hdmi5_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi5_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    enum drm_connector_dp_event event)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 6382ef5f1ea2..c839a6993a83 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1208,7 +1208,8 @@ struct drm_bridge {
 	 * @hpd_cb: Hot plug detection callback, registered with
 	 * drm_bridge_hpd_enable().
 	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	void (*hpd_cb)(void *data, enum drm_connector_status status,
+		       enum drm_connector_dp_event event);
 	/**
 	 * @hpd_data: Private data passed to the Hot plug detection callback
 	 * @hpd_cb.
@@ -1517,11 +1518,30 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status);
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event);
+
+/**
+ * drm_bridge_hpd_notify - notify hot plug detection events
+ * @bridge: bridge control structure
+ * @status: output connection status
+ *
+ * Bridge drivers shall call this function to report hot plug events when they
+ * detect a change in the output status, when hot plug detection has been
+ * enabled by drm_bridge_hpd_enable().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+static inline void drm_bridge_hpd_notify(struct drm_bridge *bridge,
+					 enum drm_connector_status status)
+{
+	drm_bridge_hpd_notify_extra(bridge, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
 
 void drm_bridge_debugfs_params(struct dentry *root);
 void drm_bridge_debugfs_encoder_params(struct dentry *root, struct drm_encoder *encoder);

-- 
2.47.3

