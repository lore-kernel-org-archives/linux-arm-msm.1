Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1433F4DFD
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656140; cv=none; b=LUZOMjKR3jQ0QAFnbbN6XXScmJ6a59ZeNbKSjDQ3OHypzq3pEaoyUGx4siLIR8AzzfAsdSoUs7W+GJyl3gV2zL7KbN34BhSxoc+jfl9UucD7fDnC89PdR1nI4NM3CJXNenfWy7GNtxhtbYQIDeiC15lIdj8Rk5f1+p6W7zEhW3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656140; c=relaxed/simple;
	bh=5htyHKHCl9o+PbYW78BpjyfMd9ftMyBWL2GavIFT4qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iua9y7GscKCGUTxBfYxYFRSvd0NawEzfGWrVt55S9lN7+dGPTRVoky1YTyFW8hORR4d+wbOlKHiMbO5aI90Mob4qU1d5XlzdbzTrEmZMuEQiAYgrEbK/vpX8Jbo8wXjcFLqijB/2s8puqPC5zHXyIoDKmMoPgtGQxdhh5XKQO0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckeCrnZx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxVxVJPF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckeCrnZx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxVxVJPF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T48P9j2688343
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mFMehukAqEhgm8Zxo1p6NeadQI8Gqa7siR9Yx52UGMk=; b=ckeCrnZx6UmRwruS
	bmdUpUbee/0XMGzvZWpJ8DJa5pCVyI9B1n0XyHpZV9ZuF9vGpzbHkLs895l836Ek
	qLHVXtJxPDpTu+9N8lmIUcBs3S90LowZZCkPsDi9tcrpO7nXap127uA5AAfw8fga
	PckI1l7yWhKzCzRsnzI8Od2Rf3lbc6rTAvgJQHvBRiy9v8mMNNjHF6xLHmuAf7Tz
	Ipuo96GY5rChoDz/GIucSLRUSFmGHX8MHTxUQBSicprc2weB4zkbc6AZ8Hl2l6xH
	tkt2f47uGX7jT8nBlJYUJR9CkoNvpUFsgsRNDi4ZAXQZBR172ftw1VZwm21avj5a
	brqvVw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mjgr8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:28:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-914321eb48eso72124606d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656137; x=1791260937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFMehukAqEhgm8Zxo1p6NeadQI8Gqa7siR9Yx52UGMk=;
        b=bxVxVJPFV9oKKdKmHceIna1+7bKUaTWOsv3EzGSRpV0EWIMOvJ3+4PtsuZ5/0QwxqC
         s/2d+k2RCOau2hfORmNT136JnmbcxPK7BkDSV/VVhX81lMo8QXWcl2BYELLq4TnOxKYQ
         lqlGcEK2ZYjo2Mswr53SGd5s6lxGlhuTrm5mQ+K444jkSbUNtxztbXC1FT8t7iEYou0k
         V9pviVQIcZyLki7ZkvaJ7f456opdTiVQfk9nFtSl3Bc7aBouBbdeEYhTu1kmdZnkJ2Qx
         rf302bjVtuMcerlsmcyUvBDvXvsgbnpA5PTfVNLkkSTesP3v0aAsB0CE9PU8r2Db9UJV
         NYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656137; x=1791260937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFMehukAqEhgm8Zxo1p6NeadQI8Gqa7siR9Yx52UGMk=;
        b=lPZ8dybvrHKY+ao+ZnCoBqMGzM+be1tLYPRmkmdPmA2Hp+KQTzOeEEBMbIQptOesgX
         AluUHxJV5mvu8UCN+GLaDpAivDOGAslVoPL/3TQl90YQFTPBbtiISlYpUf5O9hh26OZZ
         WdcyYDcxPQu+5GdHKW+4s2vNffawblXji/n1Mjs4o20pNlKXxhvCVpqxwWHxcyX+A236
         Ai3Ej9GNNcRrwwDCLIAiQh9oenqlR+cLDqn+h4ifQ81e6EjthavGZFOAXy8Ri8joijXT
         U5/6yg9dIVpeOR7lD0DMmaDS214g8YwsiVSAinq/cDIe291EEUkwD03ryad1rC8vNO/Y
         6kLg==
X-Gm-Message-State: AFuF++mW5rIpzLtwP+qWGws2FH+KDOIYGOuKI3dPT4Pxx8/bDAgllw4+
	z6mV/ExTE74cmEe/3XO4z0GSDeB6+aGstnNhqmcBtTXXneYViQA2UuJ4rk4+tw8vKmoyBNewUKW
	JbO2FHPchrJRcoPOL0gIDeqzlP2sUPRxJTz8LNTua9+cG8aBQMv+E4880YF0Dp2xl5i1i
X-Gm-Gg: AYBFou2Bgv7Gg1tTa8UtLIeFj1NPkXew/ecRcogQeZNcVFvYvh8AOYWTjzlhURUzmcY
	GmKlmCuYQPGg911fmfuNT41zDsT13GMbuDpzkfl/GTU0XS/QcnXyjaUROTFe4Lf7uJRgDM86etI
	P57jOdzAZXdwgszJTfaWYOd3pMIELW8pCcmMwya6N+fF4+HsoVbc/1ZNz53fhkhqycfBLKiphmY
	8/pdllqU6EroW/F8zax/nHBQ0iNyM78F4etAAMvxhyqe3BjSxCJ4QkTO3mCSF/6Eze0D8EZXiN8
	+JiGsO17+KCSMLbJM5rPV+Frwv+dBj0VYFT5WClg6lgwprDAMAWlOqCF2halSb9aDOXL29waY/5
	vmip2g4ChMTV46cYrPpDt73jTgU34r49fAHjgczYKPUXtTid07SX8tH+rGY2DnnU=
X-Received: by 2002:a05:6214:493:b0:912:517b:8f5 with SMTP id 6a1803df08f44-9142f93e82bmr240773416d6.39.1790656137457;
        Mon, 28 Sep 2026 21:28:57 -0700 (PDT)
X-Received: by 2002:a05:6214:493:b0:912:517b:8f5 with SMTP id 6a1803df08f44-9142f93e82bmr240773206d6.39.1790656136925;
        Mon, 28 Sep 2026 21:28:56 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:56 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:56 +0800
Subject: [PATCH v7 32/35] drm/msm/dp: mark the SST connector disconnected
 when MST is enabled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-32-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=1197;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=5htyHKHCl9o+PbYW78BpjyfMd9ftMyBWL2GavIFT4qs=;
 b=Htcq/cd08vgiwo2WZz1Ns8qcJpcWLAGy4lEg9agUz1Lj1glaG45ntMYmEWSpK1P4kwu6DU6Y+
 i5th5qSz060DrXvDI3dIYnXi72pkGHgLrvNgR4ocWHilfZY401bSd9Y
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX8cf2gSfGJpfj
 6sMYal7YPk4ujtXY5eopx1DM6+LxlLr/QgKzrDyDpm9ACEYGjlHowQcqUVvPgepKyLv1Y97jUzy
 Nyk6cUH3WVRT9DJtLLfauGlNkZ0UoyGfV5nERmUTju1jW0ded9ofzfEO8kyvW81iQD2ozbn3zFR
 6/W1yFYjnIItN0KUW9uK588kTgdXzRqIZ2ojdmDYxGKzyG1s4aQmIrcCJz1Fjq9dINv5v2VoF1d
 jUsTDuQduPSgIE8m/QR9M5RCA9shDI4d5gaUVfUm5xy6Qot3ZyYbT2SoLBh95Pmyj4mmRdc6Kgf
 YhG7F3IvJ1qx2SH30Li2K8Lp3Vg2p3razB020ze34/yKOZI1nn1l9HhZ/LQVZkIELNueATzsjiL
 kRgD+Z5EuNijinDBE7ov5O2iG7+gPFxHqV+WGkwl2MtYHEEBcV1HWKz6/mWteFuGBw9JzJsZuce
 tEyFLFpKwbGcKQLzMWw==
X-Authority-Analysis: v=2.4 cv=OdgNnRTY c=1 sm=1 tr=0 ts=6abb3e8a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VuhzylXr5gTqft-DN9kA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX8OkWTdgLCuVR
 HEmwIyxK0YAF10K97E2fo7D2reYL/EaRUBSsoQbTR1WcsVmhNf/RQRnBHncnbZ9sxAjrI5RnZwC
 Yt+DuanWY8aEfED7/52Er7DsIK9Vlzg=
X-Proofpoint-ORIG-GUID: W9Umn0u6yVw7rYFXJ_9UZp2bQNDxGcyM
X-Proofpoint-GUID: W9Umn0u6yVw7rYFXJ_9UZp2bQNDxGcyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290017

When MST becomes active, the initial HPD plug notification updates the
SST connector state to connected.

However, the subsequent SST connector detect path reports disconnected
while MST is enabled. This connected -> disconnected transition is then
observed by the polling logic and may result in an unnecessary hotplug
event.

Set the SST connector state to disconnected immediately after MST is
initialized so that the detect path does not introduce a transient
state change.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0e8181932c27..327777f5c95e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -290,6 +290,10 @@ static void msm_dp_display_mst_enable(struct msm_dp_display_private *dp)
 	}
 
 	msm_dp->mst_active = true;
+
+	scoped_guard(mutex, &msm_dp->connector->dev->mode_config.mutex)
+		msm_dp->connector->status = connector_status_disconnected;
+
 	msm_dp_mst_display_set_mgr_state(msm_dp, true);
 }
 

-- 
2.43.0

