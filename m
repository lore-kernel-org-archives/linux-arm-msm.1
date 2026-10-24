Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802150;
	b=U7HfsbVHfIIq+D/m1qcBjhWQa6Rxw+D6m6bjgBE2RLJmCA/cYQA7A8VC5460eV+tXfaD
	 kcaiQFmWPmcs/YD5ET1UWkg6Oq0v8ESRxBQWSIHUEuEme5Y9R46ymgnlnMsjjOvww/XRD
	 NDFkGIloa+BJXArU8rpHgahrgxzZ50GAta9KZXXfQ/syCRfsmKCmDe62Zpu/XfWfv4TBl
	 5spHrVM40j4LmTJvWVw/+O54EWCUV2hQgKBQLBvQBHdOaXOUTKj1dLk8cT5QdJvw0753A
	 zUK+4vD1LhIR8jiQeDt8JqqyyLluXYvikL3ox9fUafq3NM4s3pFAibCr8Nyswlp6wWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802150;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
	b=UFif2LvVjfwchclkioRyuk7t2Y+hwcF0HJo/M3nSPtUPRAOjTMiQvldaS0W4fPUMdtZX
	 YPxqXKdtIcK77dl3BKUpe+sa+Zjt25hZPoGRrZvAPRlu8UBacpe7o+4JJY88zOPeg/yN7
	 VO7Nmp6OdqIzUkiDBEK7Njc4IQ+54z1Y7fSIhrG7Of9qmROUeRwjJYG3paet+/MOQO52P
	 vfvIQK9m6A/Nc35hNWtCjmFL7gXO/AIWwfyR/Wtq8MH+Py9YEOSII7h+240xL0pIUidLN
	 lsT1MQ2csf/7iFC2Ub+mOmX8alEn3skBhOoSyOBFup5gwXOfOy9h1gZg2Tt72GvxEoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ReuGjFdv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a9Tgj0TE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AF2606A31E
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87AF2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ReuGjFdv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a9Tgj0TE
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvCXI3983329
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=; b=ReuGjFdv0Hrpztut
	yxC1lHP6EzBYxoEDj8WxTxhKWi+GZQjDs06NSw7K8JyweibefUBuDm/kbdLLeMOM
	/Qi5I0jb3oFjHjtwpk9gme+XP17dfzNDGFJQ/dzY733W513O0iszC8wtJ0ihy53X
	MeOyOsbjtRTzEfnIERh/1WFU9ytPZ8dwrc88Bw85XCFj/yYqpxVL8rytc/oqHIFr
	M61gUjpgss2No/7pmZxU7qp0U+EP27TXYeJiVvwur3c9+IErKX0L3IiIntbSA/R0
	qjGK/Yvaa4zMTK44b/hc+iie1TUHquIk9MYBZwy7MjLwFnaa1LoWCLp0s33yuuWb
	pAkUmw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgart1jey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:35:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so275336785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802148; x=1793406948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
        b=a9Tgj0TEvDJmx06jqiAiAsFkrrNPM0Y0206Cddo/ew8Ngtzs6HwKi7JI5DxcMRZ3fg
         hbirWlAY/OMGLxqws9mgJb+kyMkTxBrIWp/VWbxlTkOdBr2FeEU0byM99tKdHqlE6PnW
         4gxouyK4sRhomxaKUEoxf2kHQFyxx5dMCKP0otr/zIisX2guX9b3cxv/xGLeF+iGgJgr
         0LqgnSVpCOUJk+VkKnqhhWOh3CsgadgWx6NVhHZJY8fl1dSYZpvBmR5ZnGxxbynl4Qg/
         vFvLu+lcSX3yuuS2wSvR7Q1GKlHOrofg+cLFtBjo8BaEex15c2tverfCaGQ4sBZj58Yr
         RypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802148; x=1793406948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
        b=b2aVDUMVhIyj5XxxXodFik+pCYbN+F/u8u7svg5oHFGB7O5uQIkgDWEba3LVnU/Qhn
         /eidri2DOWAc8PjEJOIsB1gosnTbny1bv8onIwccX3yKFeCGTjQTs0O1g/VHDFByllc4
         QQhJtBhgcN9xDpaPJccMBFrDKVqCD+l1u6MnOUQJY/keCseLzMJ+7JAE/GxURzDA6JkI
         i1Y8fDF61pft8X4q2K+fqHtZUmE5aqdSwEFOgGcb4KKuo1GynjCDXIEijkjBsU0vs8fi
         l+9x64TMaTOL3/nEeIK7Jc7SUtht1DQKuuzCn2glrC98cvgR3qg71allrYgQmmPyDamu
         mjTA==
X-Forwarded-Encrypted: i=1; AKwUvByKHf+eyDj6UxVBoa9k+eWl/hybYP/f8DXpaWWpNgXn6cqYgNVrRCD2zdG8Y7vHeVvh/foqL+NV9fnDZzm4@vger.kernel.org
X-Gm-Message-State: AFq9FYLpA58IWBeq+nt/icC/FZCp4Az6WthmEi/vmC6U1BWqd1jpStaa
	utxJq2LmtXYk8gCApeQoh7u63hVhl4Ubn34UFLOnyhlXXjHK9/ESeVaQGIiSSHo8XL8saZt9kqq
	9LTs4JQ1nl49o2ghnCFbRezBNUA66e7F8Ajr9aSfE30hY6zAY2h1chRkXeGx8JxX9A83U
X-Gm-Gg: AYBFou0vPscDozTwdTFlFZR8TWquugOHdG4efMc6b0hfNKqq9WvluqUAwK+ogcMLmuS
	Cf9cF75PjysqqykcqwXj9r140EN+fxO6i3malANWAwt8ejHoRsrMcWMzqkF4egWwBBirjdSmnZG
	1lfIz9VMMF5O+Y+QBWvOh9WQV6lG7leM6zf0gUDRpJFIYUCgCvtdN1hnEUzBon5QF865eWN4Yoi
	Zxwgok5SmzEI+J6EsD9+Z3/dCUaqNvSjPQhOVg7z5C9VpNEj+NvQwHVGkm0Ub1Den0u/tGQPP4b
	YcEHJIzNm/1JbGQOvqE+EDjFXwiN4HsSHZjQFG1a6C8ROBGcsg1EOYg6QdkLKBq2MyKHBSX6tmb
	fvYw+QHjxAT1zLhqOhwhJQT7jhRmuoh1fzvsqaI6bJkKKsGfGs+m2NxuyMUoPPKZSvd8a289/sv
	zdXBiw9ao0sDZY
X-Received: by 2002:a05:620a:370b:b0:93f:19fe:e6ca with SMTP id af79cd13be357-940ef939794mr102380485a.43.1792802147650;
        Fri, 23 Oct 2026 17:35:47 -0700 (PDT)
X-Received: by 2002:a05:620a:370b:b0:93f:19fe:e6ca with SMTP id af79cd13be357-940ef939794mr102375885a.43.1792802147137;
        Fri, 23 Oct 2026 17:35:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:35:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:18 +0300
Subject: [PATCH v8 2/9] drm/connector: pass down IRQ_HPD to the drivers
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
Message-Id: <20261024-hpd-irq-events-v8-2-6ee949e7a384@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5315;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EorsOQHW0H0nqzv28S1rGKOICW2UJpSufyghXnThB60=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1PEfQawOxcIPeQkTw3Ahbduv3n8MRID0UAN
 lY/P0w9/IGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9TwAKCRCLPIo+Aiko
 1YUHB/9tSxiaO49rIuYE1/it1nSy3oti+R7AeMvMDMfZiv9ikIhv8pNAkhXiSvwEmMMJW5yoa6e
 87vDylIusweUO7ajtlFct5rMYJSrD3u0Vnh6AuDNX3x4tGsdS2HThrv3QyLQtusxuYuxB2WjThM
 oYb4kRN6dAtPuCKl5vWij7/JN/dtpvYS3/ZBySxOrpLeiCKvS+cyMuR2OUSmpCpTEhobFS93XEx
 AWo/gjkuBAX0MzwDP/2sVdtWgioQaJpOTdngvcc7eva2QQuFTa9mdXj/LwgN0/GLBjbR/odeImX
 ZxMNtOaYpIkKbt/F6UWjooDUjgSW9nsHStYerCxrW8LV5yIj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfXy31QQgtxlEMR
 P/xuBIXB0QYX94M4l8zygJRl7f2SC45uyKCW1BI0gXqBewPwSFAraYSpvf5v9FiDGESl1BNBgAx
 lqZaK3dostfN1UukZrf6Yxi7asTnFE687Vd9wZnUA651KSY+0HynmT3YXmhUkkzqq59dxPja8n1
 9fg79a52VcS1vOum6aqqOkcwd+OTdBwAX0r0O3JpwoQj/XQJj1493xV9ngnaMamBdIrqg19pzUb
 1E8rCIZsxs/i2c2jp53TSoYVHCKexRpGrw6bS6RsxHNN2QP2Dv818HGZ142jWsjUunWA9NmQNoY
 FDT3cP23sMSGnf9jOoxohc/OKOj/GXQZvR4fADijG1Ojh//lNxYYDtdgeNRf+qUTZngyMUa1u2X
 7SUDdIMQHriv3l5xamw9/PTaxQ6sE2TbyiBnRYH9hQguLdaMSZgOOmYzbAsQBsHO5Ouev116ME1
 /UJDX9Zn4b7zooRhLvQ==
X-Authority-Analysis: v=2.4 cv=JI+uIMKb c=1 sm=1 tr=0 ts=6adbfd64 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=DclysrjFOTLD0Guyi30A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX2FtVGORl2aNp
 Sk0YcIe6ixndurV/Pp7qN+YQBfRZ15yj+64XLpbuVE6EdtsCzLXhV+YD+2kIhxniLjU3ntFOmym
 C63t3ZRxRWmKUOq1OZQ7y+/PaNKdxiU=
X-Proofpoint-ORIG-GUID: VYRH52C5hhU2WhOziCUeUtJGFqoSLeLe
X-Proofpoint-GUID: VYRH52C5hhU2WhOziCUeUtJGFqoSLeLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Extend drm_connector_funcs::oob_hotplug_event() to pass the
notifications about the IRQ_HPD events down to the individual drivers,
letting them handle those as required. Bridge core is converted in the
next step.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 include/drm/drm_connector.h                    |  3 ++-
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 81f3e26f6fdf..898273f60cf6 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -142,7 +142,8 @@ struct drm_bridge_connector {
  */
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -155,7 +156,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -164,7 +166,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status);
+	drm_bridge_connector_hpd_notify(connector, status, event);
 
 	drm_kms_helper_connector_hotplug_event(connector);
 }
@@ -172,16 +174,17 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 static void drm_bridge_connector_hpd_cb(void *cb_data,
 					enum drm_connector_status status)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status);
+	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
-						   enum drm_connector_status status)
+						   enum drm_connector_status status,
+						   enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
-	drm_bridge_connector_handle_hpd(bridge_connector, status);
+	drm_bridge_connector_handle_hpd(bridge_connector, status, event);
 }
 
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
@@ -301,7 +304,7 @@ static int drm_bridge_connector_detect_ctx(struct drm_connector *connector,
 				return ret;
 		}
 
-		drm_bridge_connector_hpd_notify(connector, status);
+		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index e3c8181df6bd..90e27d0b165c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3847,7 +3847,7 @@ void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector, status);
+		connector->funcs->oob_hotplug_event(connector, status, event);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0cd5e6b5034c..911c3b269279 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6760,7 +6760,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
 }
 
 static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
-				       enum drm_connector_status hpd_state)
+				       enum drm_connector_status hpd_state,
+				       enum drm_connector_dp_event event)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_display *display = to_intel_display(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 4f65c97a89ae..39814f10fcd4 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1974,7 +1974,8 @@ struct drm_connector_funcs {
 	 * has been received from a source outside the display driver / device.
 	 */
 	void (*oob_hotplug_event)(struct drm_connector *connector,
-				  enum drm_connector_status status);
+				  enum drm_connector_status status,
+				  enum drm_connector_dp_event event);
 
 	/**
 	 * @debugfs_init:

-- 
2.47.3

