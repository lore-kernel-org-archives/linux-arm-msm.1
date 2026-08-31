Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DCF3D813A
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164364; cv=none; b=bJ8TkqioZChBrNnDvL0J9kkL5wawPJl4o7l3dWY/qGn6h4UppjdcyvMzNSZEilrOo+WMTe4CGUYZqDKLSq41nCpQ0lF18ahR9J7lGk2qLHtAEdqKb38OZnqmQnWOuLeBmYAJMGP/jOgj6xBoLeR5Vu/qSmg21kK1xcHi3xdjBLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164364; c=relaxed/simple;
	bh=px59kpsO7tsSyV4f/l2yftQVlV9sM3n3ZimludNAFe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VJSp2OlMguPdrViD6WQmsUov4iehVvcGEkeCNo3tEZnQPbogokyD3Y7gKbZi2jhPd2WmWU7hW1fyesJ5TfUyg4PH7d/arVpYUTA0qhE76JwoyN1nwxlHWu3ysE6GCorcI41/xxoHEUuJj99nBjxbmwfOEDXBKIFCMg3mxwCEATo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZ2y2H5+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUzkCBxa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZ2y2H5+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUzkCBxa"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V8061b3085838
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KJVlfjQhMgvTEulDN38iN/u6JlNZCg7IM4DZ+jh9T88=; b=ZZ2y2H5+RPyQXFNw
	bAfDQeoTZoPsLTbPFKHIm558eulc8wZR0KREd+giX8OwjTGNHMkXqYq4jYs5Ptr3
	sGRZjJH4fWKbZ4iKIK03XfniiVcOX6Zb0IdGLRm+2wvzYOnNiBO6QU/FwaTs1wah
	a36Ue8FG+9rCxv19UZwIzHxFvAnDj72rfr1F6T+wWpZBmhSsLDBwbErfzB0vzTkn
	2wVFM6A2RDwq6KU4Yf6ygUVOpdxKeYczjmqzPpqvZFc3Kx3DcxtqFggtvaZkbEOk
	O6P2mpwwXEkGTYd71o1aifUy0k0Ne8WVz5iPy/4XL9GhowDDqX65wzMnxdWUU7Jf
	8ZZ9BQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhwdedd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:19:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93903982af1so759342385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164361; x=1788769161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KJVlfjQhMgvTEulDN38iN/u6JlNZCg7IM4DZ+jh9T88=;
        b=fUzkCBxawdRaQ3ENnu6+SV37PJjBFa7nO1+oJWExlTD46BxJ1vHfizhY06+lBrjP3n
         48A2V/7O0GE39xMge27MQel0fxCPrmayLaBfTdHgQXIP4QHHZyBaG/vMquEsGciM36TR
         /CHVF0asDeOpuqF9tXGhy3uVMqnF7zlxApkboEGnaHYvNLZFacK721MPYPvtIOq8IlqK
         27cadb2zbO4r+ccJkdcRYdS3zKB3zUDZGAWW2ksdFCg32gtH3qNTh+CzSUjY4IppRa05
         yLO25Qu/S84ybZWOY2oK0XTdDOwBNIt5JHX4L2njLha4XEAq/5kOFD6vMmu+8hGnsOrL
         IEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164361; x=1788769161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KJVlfjQhMgvTEulDN38iN/u6JlNZCg7IM4DZ+jh9T88=;
        b=Bb/gL4XJTX8d/kvZua+E6vJtWxIIpyv+pGp7WPf4w5lzqk8dCkgvrdq53llWaLpCKg
         G6kmuLulqZthX9WceOHzkfa0km05nkk7E5RSg948J3WP+4WYTslTWBQLCgBUacGydDM5
         Ykpi39KDfyWEzUKjN6QrqSyxLgqv7el1QWAbfGqWFG4cr7hHvlFIKzZu5f9JvZDeh0UC
         eHfxCGzfHmvhqM1HoXcRy8Ev8MCPBV7QdzaEWAwP/syDvEh7PLTJNx+AvBqApsdv9B2G
         FP4etOn7TKzeNXYBu5ks5ZzqMH9efL2RcHp+09HgqkQktPWYlPLX6EiFYP6VkM55lCRy
         iuCg==
X-Gm-Message-State: AFuF++kPceWis82py/raa+p8exBWi2qzJZdCfSjZRhSPRD+DGEde6yos
	a9ksoPEZyegaKOhOqTcQenGqJb8ae71lIKDUnGdbdlqeqHblsOx+OyeeLkpPuRa3eIKKZjue8CI
	Cb6bJYFMdcdXpQTHwCBF8cQJem8aDFvCxwjqnWME8UbvK4tZeBesMFDauBxFh1EQvwqyS
X-Gm-Gg: AR+sD13objYhrLAMA5Qg7+xlGz7b+XEvDP6HOxXbtX98v57XDjtPisFs5o3lOUvjQUN
	L9OuKsAgfT6JvFiUBtSvG0bDkEq81+x3YG0xkApwg8B/WQvThoqyubSR+CEMUiBJCABTQ4bOGkT
	MWrXiYsXgE16/Eo0KNJrhzZ3+tQWxmLGOAEkmNPLfcJpxSvIL3/Km4RWT31+t4CoDx2/fgjHz4Y
	vZe0Mv2unjWn5ZnrLrXj1icNeoKF42L+yVxm58shm2pUw6cCqnYwkjZ2vW7EU0JMJesvu41zQZx
	xIYlN4yVMjHx9l2bqcA3V2GRvjFh71UeCoCCllN0QttOEuar9EjjoMEiqUNw/VHMQPUEBZQMaBQ
	+NlSFRMHywr6S/3lySdBu8EhyBR00n15M0tBUPhPaLFhUXlfjbhjD4CCDBMsZ8FU=
X-Received: by 2002:a05:620a:3c96:b0:937:690d:a37c with SMTP id af79cd13be357-939137b46a8mr1919292185a.3.1788164360838;
        Mon, 31 Aug 2026 01:19:20 -0700 (PDT)
X-Received: by 2002:a05:620a:3c96:b0:937:690d:a37c with SMTP id af79cd13be357-939137b46a8mr1919288085a.3.1788164360369;
        Mon, 31 Aug 2026 01:19:20 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:19:19 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:36 +0800
Subject: [PATCH v6 19/29] drm/msm/dp: add MST connector creation and
 topology callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-19-c91d35d6fb9e@oss.qualcomm.com>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
In-Reply-To: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=9219;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=px59kpsO7tsSyV4f/l2yftQVlV9sM3n3ZimludNAFe0=;
 b=ysv27kLKsgP/cUyOyOfHVX7CAMARqeTblZloiYCKvE+eJxr0KQtIjz7Tvar67T1dyVJ6KCwlV
 yYNZgAjzhXmCYjDyKSGwJHQolefWf4b9gALdEaVd5WUe5drur5GsrB+
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: 0FaCjq_-seYDzPBU1d7fTaHMA0ggrucs
X-Proofpoint-ORIG-GUID: 0FaCjq_-seYDzPBU1d7fTaHMA0ggrucs
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXxqYCtDbcf9Io
 50GqEJ4hnz1HQAwGJ0yeB26DgT2mHj4Ky7753RDgxsKIfgOUFfBMVO5ppEWzl0bE3bMR/VUlDaD
 IZyIb9by5n7upI1QHYXXR1j1hfJx/0k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX+j4EB4J20ymH
 yTIQxvJ+QVRPYQvlYkcMrM/fdp9ZnyK2vN1b5wfWrI3gS1myRj2dOmOYrmjvXJnh8KNOiqOPg9u
 heeVH6NQkpIei7HzzBfyJ42xPfOXSEQJV4AhYR4YQirRgQBXqWzyVKP46fk7Os+3lfVvGH95ZoG
 Dz2ucz1/ukGj0b586GnOzZZvx47FfxDOZn57SVFsa0NVEUoMYAXPXhkZdiFvWUdn/DI71MdPWGj
 c/HG3NqJ9IeG37zsm8hiMKBT0YTru1OfRGX3TpV8txXA9jmEcC8bpyEIFuxzXIiua7N7NKSvYr+
 1t6nAgsfytPcgYWvf8WsZRkSEWoYM5MjeUQiQWSzKJJJeHc5J/qqYlqjlV8Szc4SIV5ykW198Iz
 MYoyXTeiuEuu47s9fJD8AaTaNtrvcKtLDJIMrJNdyPu0axV3ez7nuw54Vjt9ABbqKBWaapcNbB7
 t/o2preqwLvBf3Na61Q==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a953909 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=n5AsotsA7IsgDgQ4TjYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

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
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 240 ++++++++++++++++++++++++++++++++++++
 1 file changed, 240 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 648d3ec72a1d..94a717ba7c82 100644
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
@@ -25,6 +35,235 @@ struct msm_dp_mst {
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
+	struct device *dev = dp_display->drm_dev->dev;
+	enum drm_connector_status status = connector_status_disconnected;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return status;
+
+	if (dp_display->mst_active)
+		status = drm_dp_mst_detect_port(connector,
+						ctx, &mst->mst_mgr, mst_conn->mst_port);
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
@@ -35,6 +274,7 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_d
 	if (!mst)
 		return -ENOMEM;
 
+	mst->mst_mgr.cbs = &msm_dp_mst_drm_cbs;
 	mst->msm_dp = dp_display;
 	mst->max_streams = max_streams;
 	mst->dp_aux = drm_aux;

-- 
2.43.0

