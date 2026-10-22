Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675711;
	b=VMqf6AZjFZ98EqXsyeZGgvs5X70vIhCynZkSViT21CQ7Ab1aRxiZykgGiFr7CwvV4veN
	 mqbwKIsmdGfPkhMFlJHIXstR1h70SVaPkUt/m/YlB2Zu74lgNaOaz5ArF25bHLGN+ArJ7
	 XemI/E9QifT5cxnLPTtb8LlN5lMKxQYnbCEToYv4OSjluIBjftskwg1cIKo2fp5iOZ5/W
	 tcPG4SLlkqp6HMJ6mnkM6Vu8VbOn5/KaHPCazL0ZCdZOAq5oNvk3Xx8SLdwTNL/fLxScc
	 7GPGezgIs67vYmrGMFtl+kMoRQbSEb5uM4XpVg1dctL8PKYwVY4kA2+MxFWOhyTwA/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
	b=VIMrZbyLh+PN/GfGtyz5MYRAxkf06vFBKN6rGDHdb57VHy7cEjAEjV/ik13H+M8Vikx2
	 65EbzTTnVOEVygJ//+tUEbtDMnmfkVHpXgD2fEH3gBx/5gH4eAxtio0cbk+P9dXP8JV6p
	 TfXEoTTh5wIgb1RXpnrr35dXF1hcJPsE4DKdAU25BwEAsIHbszSjIPF2Y/fnbNCFp7HEa
	 JGBN49+FBBH8Kg6e2IaG6XZJzmFHas4RLgF70IqaQxHp7hGmU0kgLgHfr7um6JMRGV3Ot
	 GedyP7N0CU9kfG7jX4C2qNx+kDlV4nJ4j+qyy16HlidJoopZZPG++vXkLhU9a5dDyuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZY5crMLc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hyQQZbun;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA02A60A3807
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA02A60A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZY5crMLc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hyQQZbun
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA07f73115681
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=ZY5crMLc0RdN6Ac0
	w70ny/ZHfSFENHrnhAnoLhyPJXR8HSTKXy/3IX56AZAfRAf+MJDejryHc5gI1Nsi
	Wqhm66LCtcz5o8JIZ2Dr8xC8yXQtWPSxkAWsk55N5saZoHQFWjlo7XXebJCY69Qp
	qFBUjnulQkMYcSYfU8KUOOS+f0Oa8R0ppgQ1Zyj5WXuhVyLYITU6VRWUdXXwkV+U
	tnzMsSf/Uvz2cuLGArchUxG8nvr4nyfRIrRNAKGy0Z77syXsYFaFD5irD/JsMKts
	69unpf9U+b+3dzSEO4oAB4/jMlutYtjGcYkRNu3fW37GG6fRcGple8NqNdspo+Bh
	4qOFuQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bus5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:28:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3969a2a7so305336985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675709; x=1793280509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=hyQQZbunKDJB/osh+77vMppNfSsOOcnHxWiWWM1Ibkqbj06i1xkkXgxKzySldfkMPy
         5ShH51rl6wFs1T5MrLVF/N5cnt7b+yd4H4V7SidPYo/RkeOYXaEZQhEy9HQ9TQH7x4LM
         gbP/ED46kUWIG/Nfu7RAwFt0ozJBj5wewTJRHBZss7NHHswl4MyP+LhUWWqWlFKjqhTH
         LtDWR+SYCCz5WKdksSAkfrOVTaX3Y6tG+eddxCZ8Nhyk7/0G5z3KqOSGk1OOJFGxZySM
         b6J8doLqjuYCHXTNHaqyJeRZSmqFl3w45epqe9wGswRGLLZcK7jH3EYHMiQa077uPe0d
         A6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675709; x=1793280509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=MySiI+QE7feK7EHxQpmoq90XX/blKq7JfrRebIRZ2UVEABDDRhcQich6Zqe1WjnIMp
         1EZB118dpxTaz7+fZwq8mOF9uQw1bb+3kEMZA88eTUUEK7x8bK+jfjChHztWKnTH2jTO
         5LCGibF2o2gYGrBGfX/j/H4wVsu3CcNaGa5tyQ+kHz73D5j3NfRA4UkBKhqPb3GRBKJW
         gSchSUoo4CENWvZ6VGDifXhTTNXwgxC8KTehTEkImts2sRvUiBFaeNNPXXbiAAPJOIY3
         btCHKQW3ee192p76L/B6iKgNgnoIBEzjLRjpyZkHwiriS6cuoWrls4dZF385aAnv+Qal
         H6sg==
X-Forwarded-Encrypted: i=1; AKwUvBwc4L4wvNzCK2CYESRYd3Clj7kdnQnXWb7yW4vW6kuExXjzVw6Nfbicu1RPSuhp64ij5Zf/2OO4/iM2W5u3@vger.kernel.org
X-Gm-Message-State: AFq9FYLgJgF0cfZDDWLeZvgrt7nuABrjJwXmlY2zak3Yv1FJhVz3CRO7
	5iyni89aGid3bvmnk2igj70QBPu3SvD/yWAB3L81O+lVkn6NsYbUvBmZlpG998VEZ7FEEPnfFhS
	DdEI8zoJ/wL3gupzLLH/MbCHTcj2EcAU4gmzwwn0id3TpuyHFmXhX7X6kwBjd1nkj3bp+4Dxuq9
	ix
X-Gm-Gg: AYBFou3o/6L+WnIr6581Fd39QEgPSVYQKbXfm4nt1mrtbqHTR1DQIJpZ7kX7f2pYlYC
	On2gn9uXVXIX4MzF6W/y9GBx0cMxSAIWT0MM7xit5HCCn9cnR1ATUdAqXQlnRlNjS5RawrFPenq
	bR4ArAa1410+1HncBEE/6Wrw1XszheG6DrHhN8hmDzExhbDBLGQuLHtByQhma7+iOvlmwxEU6mo
	v3+yEKg/0Z4HD0XzCzK2EJflX5TbiX3AFWJUYAAuKLfCnOSLRJnkllirHVtd04dogT73cnKD7Nq
	9dSxQmPdb64yIa2G2GtB0U58/ZqIZWwejJvU1TxPoldWVJvMcRQcG/oCP/khav55HNvuS1dGJaW
	ZQUsBvdiWUfb8pOiSLDDWF2T6CHCORl0RYjZ3fnQu/PhM+iKwxnFB8Kv+MeGdvsl5s/T9SXgQcI
	ueC7lkYSip1mYP
X-Received: by 2002:a05:620a:4504:b0:939:fde0:a71b with SMTP id af79cd13be357-93f57d6fe0amr961376185a.0.1792675709030;
        Thu, 22 Oct 2026 06:28:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4504:b0:939:fde0:a71b with SMTP id af79cd13be357-93f57d6fe0amr961370785a.0.1792675708354;
        Thu, 22 Oct 2026 06:28:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:01 +0300
Subject: [PATCH v6 6/9] drm/msm/dp: don't take extra references on multiple
 plug events
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
Message-Id: <20261022-hpd-irq-events-v6-6-337ea3ddaa62@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y6Q7UwG8h2RY53M7Uj/FBYAupAUz6hR7YBAr9z2d9v0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9mYaSuX40bR5awBoUJ+yVcQNZ86P8rY1ul9
 gx36R5zT7KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZgAKCRCLPIo+Aiko
 1b7VCACwuu0XJB0SDYYnJaMPkQQJp4epfFvL2A8BbhoeeUkJxhpxOVsnuymLALMdK9C5Zp+RGrT
 Q8yGJuTHbZI7/BlNrAHb4m9mYAyiPXPNVpLyMCrH4EMXs7axplxd3M7EKjQ6JFaodn/DBje5zAj
 z0TKPh/LAVBSLdkEHMBKS7r3xFwn8q5l9ktLyhrJW6u6JOEmW3xtka45Bs7qCgBHHkPqG/wGYEX
 BFb9KR4xW9M3ZEhiTatIIZofZV1DhBQqEa19haQvTXcaw0CRJrzm9fgsRGVTMdLYX0l9pAUBE3W
 jxJ3xlzvjy4cBPeL90Q4VfJZSVXoYFh+Ph2xeoq5YptpjfjC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXw6xss9CdLJo5
 mk+Oy1u/19lZ8QMMvt3t9ql1HQSNFmy9ZqK1I2Ceig8Gx8C4LnxNIXE3GLo46/I2+lh+GJgoXwu
 k+UJhqkbPM8/saBCQWcubZEQi8hk9CI=
X-Proofpoint-GUID: 21eJ0ImAddIRM_c8BFhsViaoVPNf4cNN
X-Proofpoint-ORIG-GUID: 21eJ0ImAddIRM_c8BFhsViaoVPNf4cNN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX0v3e6Knv5fEe
 4mdWf1o6c0T2NHFWmmpravAG1LNHRhiFA+1O2Q/gpecXOVAM5vLixOODVtKeRBeGezORiMrI0OW
 WHgSsKEFtmghjGW7Gzoi1JOFj4CGFPPSC8TsNIueJ7Ty3G0x1jyTjFOSbVTf/8KhoXZjLPhXc4g
 bWMq0IJDsYtYKsM5IC80U6WlNWMUpbzSSmIwv4/6Lo0BYemlqWtioEQL/c85CFoIdBt4skHV2Xe
 GXbcBa8qDkwU5cjQzbeFm4/oa0+f8K8J8i9kp8BaamxPdM4b26o3fX1YIIFJQc+OIf7bhLh+Ixq
 gD0KLmt2vpgx5tXNjp5vMAaehCiMk6xBL2iMYcKAaUSOo9Znm/ECo7etNrzQjB4M+dJP3qsO9PI
 7Z/QbMJ3/CuRfsd7OXt+M3ZE9SLbPg==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ada0f7d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2dNI1gAXBh0p5IwnqgcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053

The upper layers might signal multiple sequential HPD plug events. Don't
take extra references and skip all further HPD plug events until we
receive the unplug event.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fa8942922b53..ce919a26fba2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -412,6 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
+	if (dp->plugged)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.47.3

