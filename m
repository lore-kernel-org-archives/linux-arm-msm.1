Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021868;
	b=2D2aWKUlEFs+1/ZFHEsFrvooheYGF3Lsdq/tubqfi1/RS8c6dkFZxtqIxHLblBeA3D9u
	 aD44beJo0EAyoZwd8HNRdF4PtiXAoicREWEFLmUqMEf2tc6qrdleU3maHFNjm4Awzp0tq
	 8VVOm0NEd9g3Ugvsiy6sZBN6yJssV97VhSF+CyBhRCw39IkI9szdvLEEqwZKPfuZ1xQ5/
	 7Nc/RugcnDQMUTyBZ2dTHUqAsEm43/liamJMgiLr20RuADKwdtlwoq2CPGwuDp0M6DIDR
	 VkTIrzaZP4PdaagarLl3exxztyB3MGWQhuq/ZSehhDNQE3wMY9UwhJmv5d5SC6f0WAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RuRFymShgsilHwdTJCHghvu8/w7kYi6eDSMaIMLmBKI=;
	b=2gzX+2UvyZTolETWcRTm3sQdEJCHHy0E8I7gUj83CKFNoutMkKWBF/d40RINq/OJF2JY
	 gBV4GLqEmNlIgVVmoFDUqLVqOaZQurne605sVJ06i9ShD2UUGQ9+Aur3Tn4yZY0CGijDO
	 oRGKHNurMrFf6g+huxjjENwrJGOMo2BdAJTq4YT9hxFszLK7kKKmT5OVGg3VaeVYcmzYK
	 CWKrhjvCIe1En/uHcdk8qOqH5aCzo+MKTNeWsjHOOXID865r49F4iz7+JEnckC+xsOPAV
	 daDnaXPaq42EoBzTzRpGO7CSMnlypZHpdbVgM09WXytRrNN9PDoMRJTN4If0ib/4q8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cBb+Js1J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uq5BcEw2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34AB6072CD5
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A34AB6072CD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cBb+Js1J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uq5BcEw2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt0WI2168793
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RuRFymShgsi
	lHwdTJCHghvu8/w7kYi6eDSMaIMLmBKI=; b=cBb+Js1Jgge4rwa4NlyBBYDN+I8
	3hfWHZe3O2TgATdMd/pJfZLA1UmEPDgdjAz3slyXXnK0jMu9SM9lNpnN1xDC1oOm
	rUoCKjBykCiOF5T2RnX16yQWjQ4jk4TG/mZtpozeHt+o7zqxUyY6t6Ig0MbUCqKM
	4qmmc9c88rCWcjSGYdbn4VgkTjpzxLmyNpUS+8W8g5JnbHWs/KdGehkR+MgYEWdB
	WI9tdK32Uw9VQq1hl2w2+zTDv4n8WNQy153L46qO47bVpHARDzscPFrWn2c5NIzQ
	I+idRdcPp5A5Fkx1gp5ief3FV40bNoGCNB0YIaOLL+xP5LejWq0T/jIgT5g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u610ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:37:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5337f26ee19so54434281cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793021861; x=1793626661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RuRFymShgsilHwdTJCHghvu8/w7kYi6eDSMaIMLmBKI=;
        b=Uq5BcEw2rdrYvjKRHHdBvR7cj7rPh9PM1HQgSGGX2Qk9anwQ2mmabb4W1QrbkFwwaV
         No3e5+dI5ysq0L2ylk9/BXFypaK3D9R7p8sO49wuGV2RMfuC9W1tRJTf7kBn5UUavug8
         6aWNKnggoP5y8Vih4tG+803u90mV8Gghg/LwdX8XTgIiihx19pquB0kwQb+liIi1nUCN
         c/hlt8IJKsom7dNb/F1UgrET+p4tUh58KwJzZ+izVeFDUvM4ZufSigB3tamlJfdZhG6c
         tbSOpuAHCYAfvzjJpvCLYUf/8/26+8vxGMHuCZ2RbGpbZ7AB3AfFMOaYcKa3Uuet7MyC
         gYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021861; x=1793626661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RuRFymShgsilHwdTJCHghvu8/w7kYi6eDSMaIMLmBKI=;
        b=sHonDo9Lz81N3tnqrZCvWSmmrpHglsvXfWyvgckHdI+V/kbAOzccriSCwp71Nl1Pf3
         tbdrrtt5bT4140gtc2t16AtPxu+PI2S7f0iFjRVnzTNlwrjJS9Rz7dGGoCtSxRsmMFRx
         7ZHGCdnOs3lMLzOGpjZi2uG0xFJnctU0n/vjIic3bz3Pm//ZUy+CJ5IoUjuXyObaJGjB
         Nxs8c+lhjfwjxv4SJnV14dklHVPAOrORhYAj/u5YvpzjRRJ1X9OyLxsj8+8HWtOjEWCN
         ug3PRg3Yo2NLIGVcgWUWWR3kIDOOVlwnnn3TJ7B97yRUPALxGc0kuyyhQjWsuEvDLYaV
         +PRA==
X-Forwarded-Encrypted: i=1; AKwUvBzIgN04YW8YTpf0m/ZW47Znf8tAGLo0JYPSs2YpyzXJlui2WE+36lpV+U5wEY/gk78/QYVpaZpLsfRdorrD@vger.kernel.org
X-Gm-Message-State: AFq9FYLp88Nv/+SGiKj7vEcs6635diEGepNx6dxaNIG8aSFiIdi+cGPw
	m2JSZG+AiuldVsyb0NFjNH5t07TO6limNiBvGYv6+Rq2Hce1hj+BjDlfBpKUYvroGvlXI4lz3bH
	81mkneiyh1d7tyluhMP+wx7A1AATzMJuOAUpPERW+P3x0hxC64vuf2JODBlJZAURwTgo3
X-Gm-Gg: AYBFou3owZ9NMocEY2KIZK55i3nkMnGNJKVtJ1KYLROmwh7AIdzZGrtXI8agp2JEDDb
	3xlbz/Q1iMcgCD8Eiq3zj6pS1uKKrQ53vp6zQgagGkTCKC3RjcQunNZXmF61pBrG7Hvdv8LbUZ9
	WB5P9biDRljiUkDYRI09V7qGAiR6/1FTRLPa8Y9pzrW7HjcG6SXOZG6xgLUjWAhdfrkI10JNlAq
	vnQNnZdCI5m2VPyDSWiZrVuWpz7HO4KWXkKUONsKGpCR2IwRonDoqLL2XTGV2B1T5/5QJc76bFs
	4JzQtcRg8LnBVPYns7e7Q3wnmwcsWtgS7X7hkNzwg6GlVYAymDUpRpo3wektFQuBo5/QsQMoAHt
	7wPhrOlvC0zNVtrbDcVCD3H81
X-Received: by 2002:a05:620a:46a4:b0:93f:2f48:c9e5 with SMTP id af79cd13be357-940ef8c944cmr1071685785a.34.1793021860667;
        Mon, 26 Oct 2026 06:37:40 -0700 (PDT)
X-Received: by 2002:a05:620a:46a4:b0:93f:2f48:c9e5 with SMTP id af79cd13be357-940ef8c944cmr1071681385a.34.1793021860265;
        Mon, 26 Oct 2026 06:37:40 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm15376512f8f.3.2026.10.26.06.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:39 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
Date: Mon, 26 Oct 2026 15:37:25 +0200
Message-Id: <20261026133726.3249235-6-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kwRUAhsCN-Q6YToyBQBMq71oFOqAN48E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX/MzwaZ2rqQMV
 vJdUQkGr0JafxQBqTPRlhDmiRrGCld3ym0oLNkyQWhzIBubqIQKTJTZsxwUfZIWaISfc5poFThv
 5FjYh7Z3RlwAs+NjALp0kWNN0BhBhCV4mYcwoHjj8f/JhR767EcHKTN7IP5xp8Sqws9wu5VcC3K
 0tPetN6Tc/ztKEpjhnelDZCxb8zvzewPbRiSK/+y96iV5X6sTMRAsUUVs7iD8lWmIrb4IGAeoj/
 e5aCTOBeDRKs+edJAEkmj/r5r7KorWaiIR1Fjm69Sv+VKM+JxT6EvEeBm/jhWw1TAL+7aTWKgxB
 DZ1jsMqaaq8H8d/e9X6LmVtzccP1dmx7SHTubUSiBbEIZDC3KBBkOz0ULklzCz4EBPiYmK+8k3N
 b2Ol73GxLb61bH6IpTFiYb+5exlSxlaP/Y+MABmGjT4DR4WS+Bl4qvPEPq/wJL3xunSN5gWSuE3
 2sjwkDraL4kDkdYxtZA==
X-Proofpoint-ORIG-GUID: kwRUAhsCN-Q6YToyBQBMq71oFOqAN48E
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf57a5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=QxXRlGHHTI4QcL78iLwA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX1MiOHZ6O7Syd
 jerSmJw2yj/8m9SZ1/tb2SfIcgsvNUGVPrVq9HPm9J2lg9J86YkC2TVpzxo2/uCyveHTuKU6D22
 43f66lG5OF0DQNJybYP+h7DlARboiJ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260054

The SM8250 VFE AREG clock lists four rates, 100, 200, 300 and 400 MHz,
in both the VFE and the CSID resources. The VFE only enables it, as
vfe_match_clock_names() does not match the AREG clock name, so its rate
is set by the CSID, which always selects the lowest one.

Match the VFE AREG clock in vfe_match_clock_names(), list a single
400 MHz rate for it and drop its levels from the CSID resources. The
AREG clocks of VFE0 and VFE1 are separate clocks on the fast AHB
source, so a fixed rate keeps one VFE from lowering it under the other.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 +++
 drivers/media/platform/qcom/camss/camss.c     | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 30504e614e4b..d38491a845d8 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -907,12 +907,15 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
 {
 	char vfe_name[7]; /* vfeXXX\0 */
 	char vfe_lite_name[12]; /* vfe_liteXXX\0 */
+	char vfe_areg_name[12]; /* vfeXXX_areg\0 */
 
 	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
 	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);
+	snprintf(vfe_areg_name, sizeof(vfe_areg_name), "vfe%d_areg", vfe->id);
 
 	return (!strcmp(clock->name, vfe_name) ||
 		!strcmp(clock->name, vfe_lite_name) ||
+		!strcmp(clock->name, vfe_areg_name) ||
 		!strcmp(clock->name, "vfe_lite") ||
 		!strcmp(clock->name, "camnoc_axi") ||
 		!strcmp(clock->name, "camnoc_rt_axi"));
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 80eab898611d..911ceb7202ab 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2053,7 +2053,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
@@ -2070,7 +2070,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
@@ -2128,7 +2128,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 19200000 },
 				{ 0 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
 				{ 0 },
 				{ 0 } },
@@ -2154,7 +2154,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 19200000 },
 				{ 0 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
 				{ 0 },
 				{ 0 } },
-- 
2.34.1

