Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286569;
	b=hHwyyrUvJikVw/FgWQE0Ep8sQK+xbZyCQfDfmQQnGCl4ydg2fRdgDdqfw8vTThPW742G
	 JdTchnqiKV5GV2Ggk0xJGI1CHOtyqcupcp5zsvtHQkylNHoLcAQikiMEsn7KNK7h6NoUG
	 4rjr20RA+lK0vn6+k8elLL2A/703U/+UBZ1sbuEiEkSjakP8RSvxK/UuXTiduddorHEIC
	 s14tDGQ3EVvhKglzKKxCPfb1I3LczRQu4FadISTVASSlRZUeEqpkQy1Vg6y9qCUuSxcvk
	 Vh976syHkGQStAVUW3rsUcVeFiA10aFirN1oP9M2ThSRcGTBy5OeMKfXgzeycZI3XxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y4rHtjcLoEgHmTrIQMGqgohiSxebHUZsCfl7SswHqEc=;
	b=JPJ/MyYTaJVSZPfxMysjiNRyObnuTs6lji3UdCs8tb9mCtgBhGQ0zAM3IT3RRCynVINs
	 x/uaUmiQOukL6gIQqQBm1NqI4fDBdSM+5DgxRtjTgvz1yHUfPbufGl4aKmlxkOmhiJ43k
	 hP4lo2Ju73HVPKUyrXHa96oL5WhQ1qt2WwUicZ3lZLRD4i5aT4+Qi9+FR3avDHyaTvSZT
	 fgWeBB3IKY7c/HQFMi5qPBgrD6oVE41Er6qWylHz6vTdCZ92J+qPFIRFb5H93eXY7Uv9f
	 /blJ6X7qS0Tr6qMmMMMxB04Yhcdh50RFWQOyaErcAoczKwpeGrxAA/mRPh38QYhfkWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YHR3wYzQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZaO9UJZU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C4B606A335
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C4B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YHR3wYzQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZaO9UJZU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A8lM1207780
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4rHtjcLoEgHmTrIQMGqgohiSxebHUZsCfl7SswHqEc=; b=YHR3wYzQSEvp8hiq
	8+pZd/VLF32qWUtiQZwP76usI6A2RbG5YNx1DvUlbA3aZtXbs+pP31dwh6e8lA+Q
	Zt+c13J6GDnb5ZSwyYBYNXSRg1OnyKx0wk+s83brmvIMS1mhnpLx0NkxY23pY2ax
	LIG5cPfV4DoyGLcvia75UQGkT88JyJwFM3M5hmu/UkaGEBTOrYMNvgqAboRakjHv
	yAaP6qt9lgpVtarKOmNZC+j08TsUocIq/RH4TiWRX4BD6Wgz5nZ9j/j2BUCMVniQ
	HWcnwACveZd8vt0NynrxLdPZvOQ28obWQLihFeuEnLVjW6JungUOGZnCEoNu/loM
	r85MXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkhfa4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso315660385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286567; x=1794891367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4rHtjcLoEgHmTrIQMGqgohiSxebHUZsCfl7SswHqEc=;
        b=ZaO9UJZUeb4xIH8SBigdAsireSf4B+dk/FeMU9WekMcMJKSbQ8zYmkr3/K0UmQPNg1
         l5M8lcUvlB9Uh9L6J4BoHZ/Zjq2L+uKKKXuI5Dp73vFwYkxPMk/CZ3Sdl1yekDF4Two6
         4ihVRRmc42vaXQeFP1xg1X7VjiknrfU1ejo/4coeTmnbi3QGyELAlxNji4JQBVJT1h26
         M8XH+fQfYZYX+dzdwWnTfA80sR9rhVVCgXqSuKngR3UYuIC1sVpwDOyUZV+AipN6Zjay
         CkZITpBCqzCARyy5JIyUmhODznZTpRYzjnGIN1opMx12qTzfcKVSVyaY9OUamKDqrK7M
         +Evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286567; x=1794891367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4rHtjcLoEgHmTrIQMGqgohiSxebHUZsCfl7SswHqEc=;
        b=VD6eguwsiO07FkvPrwU15M1N4mfEwkXA8cwiP5OqR80F1jRlAViHlqHcXWyuUkBh3u
         SldZTrqvPTOSgcKVpT0nLCMFZ/gfjjGkhpCaddgVmyErr4eaV+49d+geRLj1tadOSGT1
         ty3+2CXY7L9zpN0Jzl/JpMg1pcWwKrfRMv6ueIjiEnDdySb2w+vQ0bcoPFwuMLR6xuLl
         Cgm/4tBoX6RqEOgBUlISGBeAZUyL9HjEyTn4nNTOM1UtAv4dqWMfjcVQROG+729wsY0N
         sr30ouJYSQzdGBQXUoEOPhhVNc4aGvV6wJjHl5ImXEhksxot8K8dr+qqNIgpX0zWL7LM
         gSPw==
X-Gm-Message-State: APuU4Z/2nVzyPOzizzbqH23w6m9G6rvYNNcgxbtCDirc3diY4P0LDH7i
	gHf27tj2vXsVxWPmSFzuFuUr1UGhaWHHBPJJycXH2Lb1j2D+Vz+vrhJq/JYckF5uJc+WRwVqQpd
	4lSTZXrVRo2Yhd1SseHnW1OPkmHRMLX4+tjMlXxpUImCFQfSgB/zfHwi/LD0JIRb5recl
X-Gm-Gg: AYBFou0yd0JMrMqIuIbIGsBgdWBXZUt2Y8riBMwGJV+YrQ/yr+j/kM1M2h23rUYNYM2
	ffIR0zI/Dqlia6aTDEeddZtzjlA+vKCxU0qeNDjr6hHs+mmhbQ//rIN9g1QLszYUJEIyoSHonPZ
	ZfQytTBwefDO5t/K8ZbLpYzik2ByO5ViGum/11DtQ/WOqlptU5TfaOgEe6iUcJdUkNkZ+HhpXoI
	e8ire7zKYm8v1quztzmhT3NqglaOaC2Tb2zuzzRT0EavPwKOpp9Yr2V2pscZveYCDsFvGTU1S4o
	eTzmo54+wyPhqKWoy3llqwV0MzF63agJo7hCri3Uj6rmFyzaku2BeuUAOdWDnwB9T3ta35V3pbx
	MzRJikSfpex5PFDaYhETj077f99yXbF3MQ6EEirQqWV/gvAmUY6GuT7iGVH8dWGEwdH7fYytsTL
	HVd4b1ad5b3mr3FqvGBq3ubpHMtWTst9TO81ur
X-Received: by 2002:a05:620a:46a7:b0:93e:53db:d59e with SMTP id af79cd13be357-9479f1e8436mr256099485a.23.1794286567440;
        Mon, 09 Nov 2026 20:56:07 -0800 (PST)
X-Received: by 2002:a05:620a:46a7:b0:93e:53db:d59e with SMTP id af79cd13be357-9479f1e8436mr256097185a.23.1794286566975;
        Mon, 09 Nov 2026 20:56:06 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:06 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:40 +0800
Subject: [PATCH v8 19/29] drm/bridge_connector: suppress hotplug for
 IRQ_HPD without status changes
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
Message-Id: <20261110-msm-dp-mst-v8-19-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=2989;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=kGM6WlVxmPmHaLD/xSO0chVTuHvRgAil4JXoPE4JTA8=;
 b=8bc0gtObWWBr48PlvW73gguPpwsu+5HEpzjCr6F4hIY3Wfdk49PR5EXvKzOk87iwF0MiTJ4Y+
 o9xrx+nvqv+AufuLO2jgAimhjGFQ3I+/dnJOOyhmKUo0iR1u+9PJxET
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: Lb28y3uvYQwhk4uOhHS32uz7SRpJxGdr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXxBpvUwWEqt71
 T9ZRC1wbzRuyzgfLTIQRPpZqz/UVmPx0i6JI7mlKP7SHGiWA6ZCTn5dhy9vwadZDMqz0fy96lVm
 ayjJs7PmUbnAB052dQQFaRZXVuRjwwM=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2a3e8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XU51oE-CMt0mn-qX91oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Lb28y3uvYQwhk4uOhHS32uz7SRpJxGdr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX4Fi0bnRTu4nS
 GnzAE51SKG6z3whk851AEjI+E47tunQeQn77gby2d6oInEb7oU0A3Hz4HdI6l4VtanEWunSyJCu
 Lawc4r56gK9nf21/Z75CTIHsR+ASuU0ZIM2qQCGtnp1VSTF/qfD7PjRP0azVkNqnI5n1uj4zs9S
 hq+fOr2kRi4eUn1u/FA1Edlv8lL4B8RIhRcsz/Bn6eLaP2urWvk0PljU1bUbfnuGK7ztvFOSzVQ
 cYbw520N/QQFB+UlUT7EZnIWbZhxMSR2Z+vr3iuVXrJs1Oo3VO4JPPfKMzZrkNuPAfg1zFVwLT4
 SfOIuagTlG1mNauDxivQ+PzezEUMuzhqYTT5EVDjSJZGnrXe2Kq/2AA5z7EB812oi+Yhr93mpL2
 VSsnkJZ797NdTzRjCGBFXmn0gvPCs+fsHFjzi6diP62SjI9/iK/MP5Qmpl0PnO4MwEqIXYuPyAg
 xCmD63s2pg6KyGtNx8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

DP IRQ_HPD does not necessarily indicate a display connection change.
It can also signal link status changes or pending MST messages, which
need bridge-side handling but do not necessarily require userspace to
reprobe the connector.

Currently, the HPD handler sends a hotplug event for every notification,
without distinguishing ordinary HPD from IRQ_HPD. This causes IRQ_HPD
notifications with no connection change to trigger unnecessary connector
reprobes.

However, filtering out all IRQ_HPD notifications would also discard
hotplug events for downstream display connection changes on a DP branch,
where upstream HPD can remain asserted. The decision therefore needs to
use the actual connector status after handling the notification, rather
than the raw HPD status reported by the event.

Pass the event to the bridge chain first, then call the bridge .detect()
callback to update connector->status. Fall back to the reported status
when no .detect() callback is available. For IRQ_HPD, send a hotplug event
only when the connector status changes, suppressing IRQ-only notifications
while preserving notifications for downstream connection changes.

Keep hotplug events unconditional for ordinary HPD notifications. An
earlier detect may already have updated the connection status before
subsequent plug handling reads the EDID, so a reprobe is still needed.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 4ade63306653..1d4502126bff 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -160,15 +160,25 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 					    enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
+	struct drm_bridge *detect = drm_bridge_connector->bridge_detect;
 	struct drm_device *dev = connector->dev;
+	enum drm_connector_status old_status, new_status;
+	bool level_hpd;
+	bool changed;
 
-	mutex_lock(&dev->mode_config.mutex);
-	connector->status = status;
-	mutex_unlock(&dev->mode_config.mutex);
+	level_hpd = event == DRM_CONNECTOR_NO_EXTRA_STATUS;
 
 	drm_bridge_connector_hpd_notify(connector, status, event);
 
-	drm_kms_helper_connector_hotplug_event(connector);
+	mutex_lock(&dev->mode_config.mutex);
+	old_status = connector->status;
+	new_status = detect ? detect->funcs->detect(detect, connector) : status;
+	connector->status = new_status;
+	changed = new_status != old_status;
+	mutex_unlock(&dev->mode_config.mutex);
+
+	if (changed || level_hpd)
+		drm_kms_helper_connector_hotplug_event(connector);
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,

-- 
2.43.0

