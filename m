Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD9C41B8D7
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800364; cv=none; b=sK38X3ZyKyJcbx/pkOfxZcqD7c1sk4fWy6y5P5q5aqn+Wsdvs0+lYAJG1N7jTIQuVB/9CfosPt6rrxDol/ssivPVL9s7Z+QMTmtTeQsIc8CQo4YFWdNt29Db0cvTNJEF0ljjSTnT6tSnmHNU32SE7e5ncoquu1QUpjIJjQBdAGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800364; c=relaxed/simple;
	bh=1lUVDSkQiiZnlEzObAHR/NuLrBUqSDylFKV22u8kIZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ACZYU2GiTcNHAT5q6niPsSCi0b87P5uzKZqykiHfBF9Lee67uJMQbbjCHaXMD9MNuyS8SR5m8/NtUS6u5TZr9qWUnKgvac1pHjjzeHGUkb5WAWjm9UJjoCbAPrVpIZcHfI2Y+ugDTLNCusmYrRe0+Xiyc2u4u2s035qKUBQGWyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PN5e+Wkd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dUKRKNBU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PN5e+Wkd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dUKRKNBU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDMMOV219272
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0FsAkefoWCa
	qjOsHcPE3Yfj3+ChUaoS1Dxd6hBcUqzA=; b=PN5e+WkdzhvqYcJRL6yYPBtIOYf
	zdjwjBkT7WuObv+/gc9GjQ45zf2KvlVg8tjIjd+MgPFZQ5XE2eAlSG5k0Jk9hfXh
	0hub9O1pIxaI9Qi+50zh99TR0PxeakW5dfLDh/MSaDTPunRJB3hV0cnYHBdZeT1O
	RJjf2vvwzgU3q5vAdRi/xBRoW0hvApBYsZK8TEPdt9EkRFCeY3IonUqwQg1lT7zb
	drM28PaBJydvkzW4AXo+XfvDiIAfH5MVsXcMfsaFxErxOS+4VaK7JlULquNu5yt7
	wPpiJXSmtDHwrj3TaQq6d/HnNdjBKVCnyZGl8qbzv6OlcfoIDsEHjQiqqlw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7rvr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:26:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso1810691a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 06:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800362; x=1787405162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0FsAkefoWCaqjOsHcPE3Yfj3+ChUaoS1Dxd6hBcUqzA=;
        b=dUKRKNBUMe91yGwKyZyWhU/hMclJpJYC5ARzY1dlTnZI1IublCzOAnV62cjLAstXae
         S6TGx7nOatWOcPPvmpTw8mnkJW+YMi29aDtC+CqteisdbnzjmFUOB0qAe2n90CafVaFh
         sTiM5ppHyK7+GsgolGkR7fQyYgX/f2s/ouRRm3jrDl0jRQXOXUL9Sgs7+LARVIxhZoe7
         MsCvdjbEn96ICld2RBRyDtOYExeYbw8zMj67pY7pRbKKgUkaD6WoWb/BHUV+mvvjATKu
         /Se9xMC0aR6JICxqCm9uo1Wili/AWhyj3YTazm//bxHWcaunK2fEpvT9of/AG9wBSD2N
         mWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800362; x=1787405162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0FsAkefoWCaqjOsHcPE3Yfj3+ChUaoS1Dxd6hBcUqzA=;
        b=ZThdAouvza53gK/tkqrHk/TgiZYboMEhn6wBuI1N7qpoiInmq6MU39e1S+I7yyvnQn
         4fTHYHNCdDCSOe3fkYWvNbajisM6zqpQwuTMy0p+5HzuOds2EzYadZxSaep/JYjIl9SV
         dVkEhi2kyyWe6QULtQK+S3xI1bMYL3u4yNztSSlfFFGM4AF9z4oUYo18/LIei1QXeztZ
         ADawHqLe/9bgRD7lbeapEqeDOuN9Lm5g5e0lwl8MDG7helHlO7kbPBpDWodjbYah9gnb
         7b7EQU9lbg9dcL0PRFq3KN8jXAP6kkkC7VNeK/ysr2ekFREHHSEJqMLd7NVuMyCNK9u8
         CoCQ==
X-Forwarded-Encrypted: i=1; AHgh+RosFnbnYU57eNV01t/02KOBQerGB2QRvqNpLxZQWZ5veUDXjvqxAL7iWVtWywiJdr1/plt2UimiN6VeEsJR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy70VFfcriei19I7d5wJQQL1TGaLcWtKOdEj7h9udJkGlKYhOQc
	VDq2idQKUDFRMTPNx84nW6YlyZq4lpPwWencaHm6qrSfVEO7kIwBBUsjR3RQas1PrikTiNtwD+2
	Gu3R8DRbQnMW12wav8epj7dpUjZh73vL3SpfLmUtl+3E2Zz5Pp//uMqa+Ot06gLfyJ33P
X-Gm-Gg: AR+sD10K6v9nF3tYwUGDAyUrW0IQfICXzecJ/sOqQcUhvpgR86FFvsyM/IveWNoMklE
	t8ws0Zd7UlcmonMyHwwhxTKdjR7Or67TuN6s33LXUhRoC7yhu6YbLaT74IXNzdwLCDEPj+RlQiM
	lm8xOwHw/8gIQvHzswSnMC30tRj//bC12Oowdv3Bf3WsbKs2CpQGQn+VVPTZZxD2nRE/bXSw2O3
	LYOSXpIEfAu0PUjbBZmyf7/SkPQiiIVGZVihYB/cu67Xse1Tv52j5E83LHYqZERuNsVL6EclZIU
	juBCZo+Rr6romqt6kitB3CscWaS6LdAkkDM98VbDlJsyXzJX5voSfXOaaQ7vBpz+e0/rOmAiaZs
	q0bXOsrs0SdE3F4xFbkBlMmlejjcDZ0hc5kuc8ALfdeY+ybLA/edSFJTiP5Cr
X-Received: by 2002:a17:90b:5450:b0:38d:c74d:29c5 with SMTP id 98e67ed59e1d1-3933ed23db1mr14066762a91.19.1786800361940;
        Sat, 15 Aug 2026 06:26:01 -0700 (PDT)
X-Received: by 2002:a17:90b:5450:b0:38d:c74d:29c5 with SMTP id 98e67ed59e1d1-3933ed23db1mr14066725a91.19.1786800361504;
        Sat, 15 Aug 2026 06:26:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:01 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/8] remoteproc: qcom: sysmon: Suppress notify between cluster siblings
Date: Sat, 15 Aug 2026 21:25:36 +0800
Message-ID: <20260815132541.1575121-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX1W7HU7dLhxsu
 h8SMDe8R3OgGAT6l4a3zuaQq/x2fT5O2nQID7cfxAZoQZBfKzTpBJSQ1dlN1nhbD+B1vpMvtL7Z
 77T533qqsxJiLkybVFWyodSr68aywM7jjNWiGNMfiNWh3Qp1/9WBkeprf8y/FMRkiCmAUVbGVgb
 Aqpv3nX0nLnl2X0Sh6ARt4Ecfjrt9qR2ncdcnHfZS1JEOeiB3AaiHpKx02jzkMKp2evUz6vkEDX
 kNPeiUu+5dTL7fGoG3lqbCvzyddlNy4D0wGgCx3OB7Axjx/x1drhvDWemZGMdAYmficU9vta3X4
 HR2mO2Wc3Ne6glXxDMV5+aGCyJ0pHy6j/dKzCdy97pc2o7d41wxRpkkX3OArLXkA1ZtM0IECRCd
 Qyu8s01TtmnwUic9Y2Fh8HGOUwN6+dIcV8PjPJqN/HJDvmzuEL9L0qz8VkpYlB/nHYjns38WzWH
 p/QRbLd3fZNuQJRK4Tg==
X-Proofpoint-GUID: Ax4bc11Zd6drZB8eQuLgUN5zOTa0gg90
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a8068ea cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=S0uwIJVnaEaoYlcdocAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Ax4bc11Zd6drZB8eQuLgUN5zOTa0gg90
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX8l3YR0P/O6YK
 TeX1aUIYDsfPWJzDPrBm4YNk+h4wzQ+yA3RpYYp3OyCP5ccyxIBD0eSO8BcBilAKf2OKLMwk5K1
 odieAdAc8xeRXFNAvL0MHUr6+nMNCu4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150096

Firmware on clustered remote processors (e.g. Nord's HPASS ADSP0/1/2)
cannot handle the SSCTL peer-shutdown notification sysmon sends
whenever a sibling in the same cluster starts or stops, and the QMI
request instead times out.

Skip sysmon_notify() when the notifying and the notified instance share
the cluster identifier their owning rproc driver put in rproc->cluster.
The suppression is done on the receiving side, so that a cluster member
keeps notifying, and being notified by, remote processors outside its
cluster. Instances whose rproc has no cluster set are completely
unaffected.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_sysmon.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 61e1038328e8..5d4443ef3bc1 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -67,6 +67,7 @@ static const char * const sysmon_state_string[] = {
 struct sysmon_event {
 	const char *subsys_name;
 	u32 ssr_event;
+	void *cluster;
 };
 
 static DEFINE_MUTEX(sysmon_lock);
@@ -473,7 +474,8 @@ static int sysmon_prepare(struct rproc_subdev *subdev)
 						  subdev);
 	struct sysmon_event event = {
 		.subsys_name = sysmon->name,
-		.ssr_event = SSCTL_SSR_EVENT_BEFORE_POWERUP
+		.ssr_event = SSCTL_SSR_EVENT_BEFORE_POWERUP,
+		.cluster = sysmon->rproc->cluster,
 	};
 
 	mutex_lock(&sysmon->state_lock);
@@ -500,7 +502,8 @@ static int sysmon_start(struct rproc_subdev *subdev)
 	struct qcom_sysmon *target;
 	struct sysmon_event event = {
 		.subsys_name = sysmon->name,
-		.ssr_event = SSCTL_SSR_EVENT_AFTER_POWERUP
+		.ssr_event = SSCTL_SSR_EVENT_AFTER_POWERUP,
+		.cluster = sysmon->rproc->cluster,
 	};
 
 	reinit_completion(&sysmon->ssctl_comp);
@@ -536,7 +539,8 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon, subdev);
 	struct sysmon_event event = {
 		.subsys_name = sysmon->name,
-		.ssr_event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN
+		.ssr_event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN,
+		.cluster = sysmon->rproc->cluster,
 	};
 
 	sysmon->shutdown_acked = false;
@@ -567,7 +571,8 @@ static void sysmon_unprepare(struct rproc_subdev *subdev)
 						  subdev);
 	struct sysmon_event event = {
 		.subsys_name = sysmon->name,
-		.ssr_event = SSCTL_SSR_EVENT_AFTER_SHUTDOWN
+		.ssr_event = SSCTL_SSR_EVENT_AFTER_SHUTDOWN,
+		.cluster = sysmon->rproc->cluster,
 	};
 
 	mutex_lock(&sysmon->state_lock);
@@ -588,6 +593,11 @@ static int sysmon_notify(struct notifier_block *nb, unsigned long event,
 	struct qcom_sysmon *sysmon = container_of(nb, struct qcom_sysmon, nb);
 	struct sysmon_event *sysmon_event = data;
 
+	/* Cluster siblings' firmware can't handle peer SSR notify; skip it */
+	if (sysmon->rproc->cluster &&
+	    sysmon->rproc->cluster == sysmon_event->cluster)
+		return NOTIFY_DONE;
+
 	/* Skip non-running rprocs and the originating instance */
 	if (sysmon->state != SSCTL_SSR_EVENT_AFTER_POWERUP ||
 	    !strcmp(sysmon_event->subsys_name, sysmon->name)) {
-- 
2.43.0

