Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076769;
	b=Vvx9IZE0jpg5hkE2EPtJD16nDE9D72lurYrjBVserPR+i1pQTXm+SUYHrSYJejHjTpqW
	 alq2QbNx4j12fPP2xGTzKDqB1QvL6vQSnPlsrQDAbbWOST4JUcGrJCvVccwgBgVig7+lb
	 +JgfnmADLuhJ7cGqxohK1iD30zQwpPy0fLQNtVnhLNn/4nLs4/nByUISjH1Q+G9BHDYT3
	 xdY3ZfoYYeZvOo75R06BAxg8Cv94YcFigCVkq2oziCy5UTI/f8IW08GZ3WwEX32ldWvar
	 UeTZvWBoabyXJXJa7yrremC9VcQwsxStwQcn4gl51Kr75E79inO3MK2s7vHnZz8zvpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y4rHtjcLoEgHmTrIQMGqgohiSxebHUZsCfl7SswHqEc=;
	b=KzsVAJrnuTSWdB1okM29aIOO177UIzYOYepEnoiJYDwx+DfX90PvfZSQD4Vn9PuR6F1j
	 6Qbrmr2cRPkhItumitzUMS7IX8FNtPGw0KgJCAFyFtPN3ow4w+8vHw+dZ8bUe5TzQW/UE
	 2oQ4Nk/s6YsD+ykTtLQfyMVxZNKYXJ9RmeKrOpTwf0Z1FW/2Qb1k2XmJNXE/+gB0usBDR
	 wZUI96d8+e6ztQJmetDEiWRdWCNCDOUvG1+WTvP3t5EtVm0GbEdIFNvOZutkNTPZxZZe3
	 MhO/1ggQ5b+KkHX+zOkswmxTM8zBuHixh33eHq6Yazpp1NvIBpbOk2YJEfrG+aCPfDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j7zzZ9PD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HnpdQSaJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570E0606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 570E0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j7zzZ9PD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HnpdQSaJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6wGrA1534880
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4rHtjcLoEgHmTrIQMGqgohiSxebHUZsCfl7SswHqEc=; b=j7zzZ9PD1VQA0Ed8
	pPMQmJnYDtKptd1xQvebwue/yI8DyMX3NafLoMWsyUWLVzgy3+WAVAGa0g1C/XyN
	iDXbj28EyInn6PFCSPusH8N/M0s25nE76OWOBMa4y1PCKrgRCuDE4jq3URANolKd
	fERoI+dvMYvTirfcHMTnAh/VyLJgo2sJ/kqG8zzFIdpHx8sjmmGH0dd2rdIJ/hL5
	Wn+saNCr8rh+0BaJTwT2clDuOm6V9PEjNpV5U48ZdVo8UYzqHal2NBbh0C8l6+Gw
	kIh2GFyJl1gMDgWvNjL46f54gjOL/YuXOF/HO5KmFHPxX9Mo4Sk6bXfx4cOL8vRy
	NYW7Fw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpcc5sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so323101985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076767; x=1795681567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4rHtjcLoEgHmTrIQMGqgohiSxebHUZsCfl7SswHqEc=;
        b=HnpdQSaJ0Gb+avW8QS4yMmQFJNEAVUHKrJz60egemJdpIME7Nt8P+t1QF4tuPF9TEW
         6ZSUreXXCR/Bw/I9wU3aIKDHERSLW6q+QR0FcKVCMMU6BhPvw2XdTN+m1kIqPrLn+qwS
         qKddZuSFZsrRrjyzMglGmJPgLNNGr8o27W4K7uxoVK0ZeAqbuPaD36sVDYZMmHC5B1Ju
         a6+4HqyOklseYJYXg4IbE579N9RTBTjDTtO4uKglbw9hWGdN5BuwoLqpByggddY1DA1f
         fW28NXoZKKlmmzo6TNXyYJ7QCDHhyVcn4HV0nN8/8WNSYb9s3jYxLgLfFk7QQRHsH0U1
         +u2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076767; x=1795681567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4rHtjcLoEgHmTrIQMGqgohiSxebHUZsCfl7SswHqEc=;
        b=KZ65z9P0DdOFSfhsuSFeeynmx6nH7wivRFT3/V+6BSg88LpH7I0U16v0+QCPFBNEm4
         lWLT489xfWs1GDMxg/IvAM7V5SWNbdDjpacZYaWg1NGhK8GD+tNc3PwTQtaVnrIQjLVI
         cuaGYVTSTGBlpLkupcUKvlRIKpKRacWgVWiqP2DcE5Yd/0o7Q1O5FDQuED+Z9v8n0Zi5
         0C0m0Obh4KKK1Puzm52dMLRA2inTQEAKV2ksSzwuI2GswbVA9KiB9d4XZrwvVrP40FQZ
         /0DaxIFAH+bVuTzXo717W/o+4rpyIpEoh0U921EnlbU99D9yR5tfQxbO6uhrVIRhvhqh
         YaJQ==
X-Gm-Message-State: APuU4Z9+rOek2ZwSxQ9rkxbWFXmAkuH2l4EEGRwsgiaTU8KWSdEpCaMl
	Q29i6o8VgkEEtTEYQVPWMb9+NQqGUyBT9IpaKxrF8sjWlIw4X5Myj0WqEetp+9lPW6XLO49vLe+
	F8Ai4kwynXeCLeldh4coLBGYm8/3VCtSGMnN4kEFrc8H4wlYabG1yiRfCAekAyzNUDgAE
X-Gm-Gg: AYBFou2tbUEjW/Rfq/EtzJwr1KXzYNE1+YNaTwt0gzjbBktuFBzlBS+KMRmin+qHiQf
	cgv7ZBo1Xp8BpW1XV4aC+aZM/7W1BnQvnZkhbFrskpYJzzw9ge3SdMiDNQHUJhYblfrOqCCIiYm
	as3MDjbm/DG0K3aQusqxDr4rQDWDLAdDx5v8ODHCS1M0D0ZvpdbdgjaZejJvzbnZPUtZVZ87dJb
	luPjwa0NBqCiBWwDlGjxNb4BkivKjIvFr5WvAK9ktaYpNSI8ja7r341QHFesPzZvmzk/Xu2M2dX
	tJeiPCbrxPyFgn8Teyl+XZ0SqbE7ZocmjiWNef5K0J5+AYEzsdMt05vKSu/JfcAswpnL3RAXXDK
	u4yZEEYTHlnem7/rzxQc872H1rzjBeiV6fLgaGKt5+wE7XrPUaQw41+LpOQYqi9SjzVvQY3sVf0
	2w6KE1ruzLyH/AzwlI9ijSMOiTO+aHQ/ec0m1G
X-Received: by 2002:a05:620a:8086:b0:945:d852:1618 with SMTP id af79cd13be357-949997b027dmr874904085a.70.1795076767523;
        Thu, 19 Nov 2026 00:26:07 -0800 (PST)
X-Received: by 2002:a05:620a:8086:b0:945:d852:1618 with SMTP id af79cd13be357-949997b027dmr874901885a.70.1795076766978;
        Thu, 19 Nov 2026 00:26:06 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:06 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:21 +0800
Subject: [PATCH v9 19/29] drm/bridge_connector: suppress hotplug for
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
Message-Id: <20261119-msm-dp-mst-v9-19-ca61be4edfc3@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=2989;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=kGM6WlVxmPmHaLD/xSO0chVTuHvRgAil4JXoPE4JTA8=;
 b=QyGEOnbfqUEyh4z4URkbSIR1JBEwHjBBZvQHuAxvag3MSPjsw+ttQQZg7TVpKjLt45fiq4gWt
 hB1iMfZJtsZA5TlDwUjQdzMrZzPaSxRO9FdJL92CuzuHxLnFJZ95efS
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afeb2a0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XU51oE-CMt0mn-qX91oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX+L4dnQPdTvMV
 n7X7/fPl3SEDCHfgKxCV58km9WUs7NqprqFVfqabl40eteDKXblQiFzmR/A7SwAGHe21GzqQNB1
 oxOJuQWVFiDgDvWpwyzdulWqU2Q1w9biICm3N+VFRS9TvN1tcINzxLZEvibwxpE++9BEfD7xn+0
 zftVwVNxtmz/b5qPEUC0QRtfxJ8NmUBRJV26WEbpHkXFo17aDBKUq7XTp9sl/xfATHbHfx38Jzj
 ckH/LuX3asmSpSCZKfqPT2cq0iy/cFZh1ZbsUH645TkYcTOuFpUF6N4CibmTUa3MTruEi9nUf7N
 5QttEAIaO0Uk9oU6nr8jZLDysEAqGn3CxbrjDTntOMoe7PhZA3/Zfkj1SpvitVmnk0O0AIcRhlH
 cl8vLk8YNeWxwoflFd88q69Bz9rfilbnlQxKLZv3vW3/0TtTWcUhP81Go8LqiBBqLAf+V89iAIr
 s/T5YO4AKj+4qR/ziTg==
X-Proofpoint-ORIG-GUID: bmZvV5ixV9JYVYFF5bAZs3iFgPZr0VNe
X-Proofpoint-GUID: bmZvV5ixV9JYVYFF5bAZs3iFgPZr0VNe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX5FhvTU8qmsn9
 wZjzAsMhsyqZQX+1iohTbzFPxFoNplxq/O8/u1Kow8dATg3g/D6TCcIT5EHogsBPf4EOENqIz4r
 Cdzn3Bo0v39hKjvsYoAzT5lRSx3PU4o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190033

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

