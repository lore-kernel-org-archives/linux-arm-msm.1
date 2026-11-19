Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076740;
	b=zCi7GnI/BK9QORU1PcpIRjWwJwq1WF+ETfW4A+7fJN4RkORZ5Cjw/8lPDS/Hy/aUynd/
	 J6Utxj9irEAVW00Ji3veM0zS1RHdyX6Uw77pwJSKRHDbeIiJDfRYH6FQdh+AhZ4P36tlj
	 GESkD0O4lHg0HqYYz46hiIxRoXPWDfZ5FZrbjKoRra+UZQtDok6mckS0uetXrSPktEZiV
	 U7B6v89aB0ZtJUPPFL7i7RSTXGPXV6w3cLwv/cWRVmY3uMjme7WCjeCT5qZTWvAkDZw5E
	 +rjUJBanDz1dBv16vuR2vA5do1QTRUBGROl+vr/StCTeR7WrQUNlO4C65n95nA1qD0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jXjmyZcm84bx7GLv3ncH/xGNIzEG7bes+15keoRFI+0=;
	b=vKTMQCgAF7LpexDBRKn0BDxn/SDhwt1byFYh86CaNs+6G4/6D8xbya290AMeja8SHO3p
	 yptM1Ftf6oOLE2Se5ylbJFKG83nTxpUlxBTn6Y1q0PcUODzdPhVzYz1Ra5ZmIGv+zaEUd
	 ko4lB3nYxQtfQa05OvEwOq8LEp5iTT90xyIf/Nvrol3NjerzyFNB7pzEMJEhSCSHLBIAD
	 93g2DoVaogYtNkISzjmjtN2kW4OUqWkDxQDKFaEnvpc2d6NqI+XmdA/3SAewopQF4xYpT
	 r7yUwm5GLLif63rRGC6dtgXRRBUqdVFwxqfzky1r5QFfCbarnmBLRww68xrcGoNKvlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UQ2s3Qou;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z9LJOgl0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B1A606A325
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77B1A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UQ2s3Qou;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z9LJOgl0
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vO4i052983
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jXjmyZcm84bx7GLv3ncH/xGNIzEG7bes+15keoRFI+0=; b=UQ2s3QouN4pqwK+0
	RtqwL9zz/LeAg0qtTN/HR3YxBKF5ScikC+JuUglIkqm8eVqdcPuqZRK8j1ejjyO4
	CSDk2jJ7LO3hxYyy8CsU1tw6V4xsy0GDmVnzWKg7Whz1o/cpmAPEOcdjSiuj34WZ
	IhNVYuusXtJy5nZlrhjccU50JdJcXq/3oCeRq0QM/sINOqNFCgFm2oOc0I0E8Hqz
	kYQ49VUHQwGICN74H9odT0YEgKveXMZPsyzyt6bIfSKY00wJrCYmZcklfKLm0atS
	yfRE4O/P18Nz6PSLxKions+R45IRNJqy+Scokey1/047xJH9mwfKa9FhApsw3eBO
	1xRLbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3bbgkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94961ed97d6so144573385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076738; x=1795681538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXjmyZcm84bx7GLv3ncH/xGNIzEG7bes+15keoRFI+0=;
        b=Z9LJOgl0CkOXqUqC0Fgd2GdjSMngSBnQo6sA6yn9LdzVSp7ZdDIhlB8k8nk3wkeglI
         Ct+0Di+NaN7OE0K94Yjs5zIvIkyqrOls8u4fslJpVnswHUJZGSVs6usoCLd9mAIOLnlm
         Z9EP8y7VAKV0NlZL3QA2vlvuPggHTxTPnuIPKuvXNOgRYWWlo23rKO92MqdUJ/AZrdO8
         tR4mwtiLuUxn+U5mewzCvY7AlKVooqllr8R76uGOAZuvkomoHBzah6QLkNEMNUWJgTrr
         mPaDitOVtOpI0IZfblTHz94eC57Ef2ywpJRWNG5viaeDrxfLVdLE1hHgdasP58K4zUo8
         dUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076738; x=1795681538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXjmyZcm84bx7GLv3ncH/xGNIzEG7bes+15keoRFI+0=;
        b=at+/h/5WIC1VpyynhcanteTPamnws6nR0fR6u7SkhRaLDDFKZ5/L32aY/Ql2JZG/5L
         IZw1sdI17IDAt2E+ySxthFPT3leT84ikkNkxziaCwAsxNJ2tdAB4y/PZoa4Y0AeGmBCp
         ZmIG0mFDgCzi+1zDq9EGjtXvGTunlR3idTh8aRURCsn6uofgjzMjXzHhXn/8lDHu7srI
         ccJOKRaQIpch3RPEjYvA6O7rAiSAB0FnEynbGlPUUwa/0OLhoH5RDwQt3KkOr5UwMybQ
         neTv3ukplPR82OjQdE60q7VQSplTDfKBt1BmXzhkg/SyhpG2eaSqNlv4YAg7d77GJOzX
         EQew==
X-Gm-Message-State: APuU4Z8WiFkknChhWId44GTJSCSMwzxMBL1s0aRUlOf3d2EXXTAjm97F
	PR1NzpYyvG6ifLjEi1f6abxTMIPH/n9VbUhbpmZNbvOB79OdQ1fvCPupF3yAl/A4ISTO8VEoqqv
	Y8XF1EmVQ4VirZxTak77dxyLBN9tJeXTRgY1i/94Aea6IMB2ARyNSbEVAOtqSFHeT84Qr
X-Gm-Gg: AYBFou2x0Pm37BMB2DuFoQLWIeIdGRNontnVVR+0zAtlwAbICbU7BiBc68yLDuhZlhW
	J7nCfBlNhNIG/h5d1mZ6Z1vVqDplwkRhzZQjt2QEQA7Tjt1RUnTvp7pBHu7BS4t34oQ/7X5NgFY
	rm4PVI/0zkzxycGa8YFbhbPI3sZxrrd6MsdRp6LzBE6F357aHisM+ezyJ5JI2J/F3fDfuawrwLQ
	8r90A/3xU/rSTIMhO15imgr1AmfhHXcx6Ow/dIdqX3GUUhAifs672GB0hVdeG79VM33BQ/ZLO57
	KNm2pHwpgcSIUo+Iq/wp0GrrHT5uiGMNEy2NGdj2udm1JkitQMpUU9vPX4qplmVU4d7b/uG8TXG
	58r3ohhYGwGH7a/rbXOc1omFodruUPZVDrK4SWjnDjef5U7Y5pyQF08eFoTWw30ZnkvJswB2ukp
	tKnTmGpFFSUkPiQYDKF0yhFASpWjpUlokrPrYL
X-Received: by 2002:a05:620a:130d:b0:93e:7156:f814 with SMTP id af79cd13be357-949b340aaeemr57655985a.11.1795076737615;
        Thu, 19 Nov 2026 00:25:37 -0800 (PST)
X-Received: by 2002:a05:620a:130d:b0:93e:7156:f814 with SMTP id af79cd13be357-949b340aaeemr57653085a.11.1795076737110;
        Thu, 19 Nov 2026 00:25:37 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:25:36 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:15 +0800
Subject: [PATCH v9 13/29] drm/msm/dp: add MST connector creation and
 topology callbacks
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
Message-Id: <20261119-msm-dp-mst-v9-13-ca61be4edfc3@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=9238;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=RagWELnNOcsg5yVGhJwCjO68hxskqfF9xg+etUHxKNA=;
 b=19mX1mXArlGQOMEf3NkSUYzv+LxYny9IMRQawZ0+nWzv/6obmqasSLrbhdytbvqcCFc+cvNoo
 g8CgZMqJWkxA+fT72cA5yyP6l61IwwnYq1ys+pD+fKs5V9NHQDNmM9S
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: ojo9Vn8-oVSc7Yt--qQkjWpJ36cnOFEP
X-Proofpoint-GUID: ojo9Vn8-oVSc7Yt--qQkjWpJ36cnOFEP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX0LW+YDfqJNyT
 R9jOSu15Ru1NiRe0R0pz5W8U4xueLL8cX813H+ne5My6ub/rRAVGOa0Biiql1GZDEDXRxkcN3G/
 TrucO1r9djWu5db2CTaezAqwO6vYBPk=
X-Authority-Analysis: v=2.4 cv=dZQVTnXe c=1 sm=1 tr=0 ts=6afeb282 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=n5AsotsA7IsgDgQ4TjYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX5QzDx1d7bGh2
 dOT9Aq3k6htFYyUq/sKjJwHY/WVUjt7w9+4K2evEyAMM5TM2s1Qb4d6+W2x7lLZCg9JNMqfgaJl
 Tc5efeULc+38otpQKpNufZTSimPB93bXhNkhjK8rhZAM1voBYFboU6/GC3I5g/mnlI+dCMm5fKS
 53mj2aPgBXPlzTgXzn078h3nPONPrFJBdsq5a0+w/iIY04nM/utMV5EXVblBui2cs5KjoIZOfDb
 KRqrk+vx+ANFnIt9LM0vV+btnas+vp86wFC5z144uj9NHvvRKRYWmIydWcYJt2WVv7UgO06h0gd
 +gg8eo0pAMAk1tDWBAeS7AHANqjnbmLEZNHqk8EWOhiJnivZ/Qo0h7m2WhfnbJSx1GqE4AGZm6J
 0fnxQ5VNwf0Ci6tu4yac8O8lnRvz/B/bz5vOqtgQNQk92HIEi+E0LBvViCuFzzWvSLtZXvqtGSN
 I/dnkQHLGWbPTFPb3jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

Register the add_connector topology callback with the DRM MST manager
to create DRM connectors dynamically for MST ports as they appear.

Each MST port is represented by a DRM connector. The connectors are
attached to all available MST stream encoders, allowing encoder
assignment to be determined dynamically rather than being permanently
associated with a specific stream.

This enables MST sink ports to be exposed as DRM connectors.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 242 ++++++++++++++++++++++++++++++++++++
 1 file changed, 242 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 5d22aa34c521..a2900ff3b0ab 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -7,10 +7,20 @@
 #include <drm/drm_fixed.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
+#include <linux/pm_runtime.h>
 
 #include "dp_mst_drm.h"
 #include "dp_panel.h"
 
+#define to_dp_mst_connector(x) \
+		container_of((x), struct msm_dp_mst_connector, connector)
+
+struct msm_dp_mst_connector {
+	struct drm_connector connector;
+	struct drm_dp_mst_port *mst_port;
+	struct msm_dp_mst *dp_mst;
+};
+
 struct msm_dp_mst_encoder {
 	struct drm_encoder *enc;
 	int stream_id;
@@ -25,6 +35,237 @@ struct msm_dp_mst {
 	u32 max_streams;
 };
 
+static void dp_mst_connector_destroy(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+
+	drm_connector_cleanup(connector);
+	drm_dp_mst_put_port_malloc(mst_conn->mst_port);
+	kfree(mst_conn);
+}
+
+static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.destroy = dp_mst_connector_destroy,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+/* DP MST Connector OPs */
+static int
+msm_dp_mst_connector_detect(struct drm_connector *connector,
+			    struct drm_modeset_acquire_ctx *ctx,
+			    bool force)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct msm_dp *dp_display = mst->msm_dp;
+	struct device *dev = &dp_display->pdev->dev;
+	enum drm_connector_status status = connector_status_disconnected;
+	int ret;
+
+	if (!dp_display->mst_active)
+		return status;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return status;
+
+	status = drm_dp_mst_detect_port(connector, ctx, &mst->mst_mgr,
+					mst_conn->mst_port);
+
+	pm_runtime_put_autosuspend(dev);
+
+	return status;
+}
+
+static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	const struct drm_edid *drm_edid;
+	int rc;
+
+	drm_edid = drm_dp_mst_edid_read(connector, &mst->mst_mgr, mst_conn->mst_port);
+	drm_edid_connector_update(connector, drm_edid);
+
+	rc = drm_edid_connector_add_modes(connector);
+
+	drm_edid_free(drm_edid);
+
+	return rc;
+}
+
+static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
+							    const struct drm_display_mode *mode)
+{
+	struct msm_dp_mst_connector *mst_conn;
+	struct drm_dp_mst_port *mst_port;
+	struct msm_dp *dp_display;
+	int required_pbn;
+
+	if (drm_connector_is_unregistered(connector))
+		return 0;
+
+	mst_conn = to_dp_mst_connector(connector);
+	mst_port = mst_conn->mst_port;
+	dp_display = mst_conn->dp_mst->msm_dp;
+
+	/* Use minimum possible bpp (6bpc RGB, 8b10b) to avoid rejecting modes
+	 * that would be feasible at the actual link bpp. mode_valid must not
+	 * depend on negotiated parameters.
+	 */
+	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (6 * 3) << 4);
+
+	if (required_pbn > mst_port->full_pbn) {
+		drm_dbg_dp(dp_display->drm_dev, "mode:%s not supported.\n", mode->name);
+		return MODE_CLOCK_HIGH;
+	}
+
+	return msm_dp_display_mode_valid(dp_display, &connector->display_info, mode);
+}
+
+static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
+					     struct drm_atomic_commit *state)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+
+	return drm_dp_atomic_release_time_slots(state, &mst->mst_mgr, mst_conn->mst_port);
+}
+
+static int msm_dp_mst_encoder_stream_id(struct msm_dp_mst *mst,
+					struct drm_encoder *enc)
+{
+	int i;
+
+	for (i = 0; i < mst->max_streams; i++) {
+		if (mst->mst_encoders[i].enc == enc)
+			return mst->mst_encoders[i].stream_id;
+	}
+	return -1;
+}
+
+static struct drm_encoder *
+msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_commit *state)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *iter;
+	struct drm_connector_list_iter conn_iter;
+	u32 stream_mask = 0;
+	u32 i;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!conn_state)
+		return NULL;
+
+	if (conn_state->best_encoder)
+		return conn_state->best_encoder;
+
+	drm_connector_list_iter_begin(connector->dev, &conn_iter);
+	drm_for_each_connector_iter(iter, &conn_iter) {
+		struct drm_connector_state *peer_state;
+		int stream_id;
+
+		if (iter == connector ||
+		    iter->funcs != &msm_dp_drm_mst_connector_funcs ||
+		    to_dp_mst_connector(iter)->dp_mst != mst)
+			continue;
+
+		peer_state = drm_atomic_get_new_connector_state(state, iter) ?: iter->state;
+		if (!peer_state || !peer_state->crtc || !peer_state->best_encoder)
+			continue;
+
+		stream_id = msm_dp_mst_encoder_stream_id(mst, peer_state->best_encoder);
+		if (stream_id >= 0 && stream_id < mst->max_streams)
+			stream_mask |= BIT(stream_id);
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	for (i = 0; i < mst->max_streams; i++) {
+		if (!(stream_mask & BIT(i))) {
+			conn_state->best_encoder = mst->mst_encoders[i].enc;
+			return mst->mst_encoders[i].enc;
+		}
+	}
+
+	return NULL;
+}
+
+/* DRM MST callbacks */
+static const struct drm_connector_helper_funcs msm_dp_drm_mst_connector_helper_funcs = {
+	.get_modes =    msm_dp_mst_connector_get_modes,
+	.detect_ctx =   msm_dp_mst_connector_detect,
+	.mode_valid =   msm_dp_mst_connector_mode_valid,
+	.atomic_best_encoder = msm_dp_mst_atomic_best_encoder,
+	.atomic_check = msm_dp_mst_connector_atomic_check,
+};
+
+static struct drm_connector *
+msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
+			 struct drm_dp_mst_port *port, const char *pathprop)
+{
+	struct msm_dp_mst *mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
+	struct drm_device *dev = mst->msm_dp->drm_dev;
+	struct msm_dp_mst_connector *mst_conn;
+	struct drm_connector *connector;
+	int rc, i;
+
+	mst_conn = kzalloc_obj(*mst_conn);
+	if (!mst_conn)
+		return NULL;
+
+	connector = &mst_conn->connector;
+	rc = drm_connector_dynamic_init(dev, connector,
+					&msm_dp_drm_mst_connector_funcs,
+					DRM_MODE_CONNECTOR_DisplayPort, NULL);
+	if (rc)
+		goto err_free;
+
+	mst_conn->dp_mst = mst;
+
+	drm_connector_helper_add(connector, &msm_dp_drm_mst_connector_helper_funcs);
+	connector->funcs->reset(connector);
+
+	/* add all encoders as possible encoders */
+	for (i = 0; i < mst->max_streams; i++) {
+		rc = drm_connector_attach_encoder(connector, mst->mst_encoders[i].enc);
+		if (rc) {
+			drm_err(dev, "[MST] failed to attach encoder:%u to conn:%d rc:%d\n",
+				mst->mst_encoders[i].enc->base.id,
+				connector->base.id, rc);
+			goto err_connector;
+		}
+	}
+
+	mst_conn->mst_port = port;
+	drm_dp_mst_get_port_malloc(port);
+
+	drm_object_attach_property(&connector->base,
+				   dev->mode_config.path_property, 0);
+	drm_object_attach_property(&connector->base,
+				   dev->mode_config.tile_property, 0);
+	drm_connector_set_path_property(connector, pathprop);
+
+	drm_dbg_kms(dev, "[MST] add_connector done conn:%d max_streams:%u\n",
+		    connector->base.id, mst->max_streams);
+
+	return connector;
+
+err_connector:
+	drm_connector_cleanup(connector);
+err_free:
+	kfree(mst_conn);
+	return NULL;
+}
+
+static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
+	.add_connector = msm_dp_mst_add_connector,
+};
+
 int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
 {
 	struct drm_device *dev = dp_display->drm_dev;
@@ -35,6 +276,7 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_d
 	if (!mst)
 		return -ENOMEM;
 
+	mst->mst_mgr.cbs = &msm_dp_mst_drm_cbs;
 	mst->msm_dp = dp_display;
 	mst->max_streams = max_streams;
 	mst->dp_aux = drm_aux;

-- 
2.43.0

