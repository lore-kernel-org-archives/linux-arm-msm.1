Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17713DDDB0
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789341884; cv=none; b=MX3v4HMDWnBZiQvpyktEjXcVWqivo+BGM9YplXGHwqR+MgNzGJGZQdgapu16+FmHW+6Eqc6PswF9ycxZi0Ytd9gXMA6NpP9hvHc3E36ldX6L+5TQCu+BuTqBpshWDdQXO8yC7EsPNsaSqrNMXekQjd4HQ6TDZg2Qfs3sIwv0lfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789341884; c=relaxed/simple;
	bh=EZeVNggLDFp49i+zFbHcRV8kVa7+aob18truUbB8RGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Bx1TZ2nluaRDxs5Pztb1NK1TKTQIaJrieXGAvVOsNGbsjDtFDOQUphRS9Db2BaiLvZZhGTlqi5dVIEbTIy+yBd7dNGvlwEPG9MlAxki/zq1wotplp1zZJBVj9Wk0yzsdKHMxiZJ95OczhxD64D+rhYGwXRIQ4HqL33cXCpHadEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rptv7zTd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJ/pRecZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rptv7zTd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJ/pRecZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DK03mQ1986783
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pqoDxiAWKMV6OWyFAmtNvQ
	kBFPSx0EJAqZSSmJxGHNY=; b=Rptv7zTdTM+CZXQo3fIFW0bzhbJwJX5HjtcDA1
	Msdu//DY0G8APlLv2cOn0cz75TAoJBk5fKnOFPhs/nuSk/xtGHuX3KzL75zk93XK
	EdIQR1w737K+2hrwhrOi8A2LOBWsqvp7ete19ayuSim9aOicc/y5fEnKJ4HdYu6h
	lQh90la7zaoR0xi3nNVx2daYrBg5hQztZ1LAo2HQ4EPdPGMfsc787Q/zkSc23c8q
	2QB15adTfTFnPFyAnxL3lyZ4rGR/RT+kdCa+c3fZTYKt3x6A6D9zpyC+AZ9eRqKk
	nT6ZJpFsQefeXfx9SAZtw1uG9PjD62HIGU1nCYCZAD2vR6Pg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cca6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:24:40 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c93c294214so556649e0c.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 16:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789341880; x=1789946680; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pqoDxiAWKMV6OWyFAmtNvQkBFPSx0EJAqZSSmJxGHNY=;
        b=gJ/pRecZntALroOc5yx0/ZMXrta3ShluzR8e0t/PyqN1XHmq1whC58jy8+etGCXb61
         R5xCsXF3I2Z8iXq/YXGEL6uQM/atLiTEWaAWdxZEggmQn/jkcb+yhMnfvvE5AVLq7WKm
         aJ0xTTs6csXCVgAlFNwHPeIn4nODYwVLIGy01EPUomhJZmUd0dCXWvIAGNCppwGYO4vD
         +LQ0pflIEyNRxz+IaDI3XpssvrljWGEe1Pr3TSoxx1EqByrN9Rw+a0qV6RGYCujwoA6s
         bw0kMDzJ0a1F2lbjdeMcpJRc8emzCqj8tgPZ5fo+7Qk0a+NXeaoN1ZEpjZ2KZjYLQdm/
         dq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789341880; x=1789946680;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pqoDxiAWKMV6OWyFAmtNvQkBFPSx0EJAqZSSmJxGHNY=;
        b=tOdyMiLA3ztDKtuMHOFIRwJlCqgQgQ+LFOszB0ZrmkEFX0nOYQarWRMg2uSBP8ACHm
         v2F/FaJlHJ7UzAyHoh89kEetjIP67u50opORUe6uRPyvYFln/YXwEXFKA5T7+udWrtn5
         LWRba0KEKqX8Y9RlLsOY8FguLZvfBeMtwIPJPdw0vHwspfLz4Xi9dJS6h8yHq6QGEG+U
         mmUdMe21V1IHbfJ+MV8hHCRgXzKYomJg1nwyDaXEdTexOa5MhH1IIWTAvzx5uNexGSp0
         cNbNAPn5efBwjPgnSK4ppDkGMo1q+t3qaSMrtN6rWAvE+vcc2gafgwAjSkfemnNIVWtc
         q9jg==
X-Gm-Message-State: AFuF++k60KZBJ/L249bBtwOcherOaDauTNaXOfFi2Wwb/XG7s8rZ038P
	fCPFvUW4e9o7gCsVft6LXLv9UDf82xK6vlLFWZhP1Xi2cGq4Jp8apFVIHEvrW3lS8B9WVxbiX/L
	ZDpbijkfpmzS8r43HejJwsgmDvjeZG+o0Ag97s2Fz/cy39Giie/TkUJgqkerTh0YOriNS
X-Gm-Gg: AYBFou0wlm2kF/qIKFL3NmUBAVwNtisS2rHv51mTlxy1xChLVnOJ8NKZVLmBp2rtqqE
	BtGuRLrb+Lsc/ysZxzopy1wvXZoLe3DkwunKaioj8RxxmRO0b6GLWOU0JJVMlRHs191KRjIgU8S
	CPEszG2z+mVZqmumeeEtRkRw8CYCI1i2FOGzFien8m7/7hobeG2SdIdD2GD3oH0hEINErFsZtf1
	yPV568bV9v/krgAD94lsNsdlc7zPdsQ7UxBVhFYBm7pvk0/SsWGqedNBnp6gZfcWnVjxql1LTwP
	MZh7QvnS2nFPQzI12ubkU2t0mKLCNDxN8FjSbilb519jMZDe7NC2i1zhjL8TQgY5LvrBirqrq/e
	926y9l4l5M/GR6nGesgOXASwXc8V7q+55nBR5UEsD95fIp2FuFZev8AkKSEvcuofR7OC/NClAVI
	9qkhxaEw3vf/hh
X-Received: by 2002:a05:6102:6045:b0:785:e069:6c5 with SMTP id ada2fe7eead31-792ab142074mr13116116137.8.1789341879625;
        Sun, 13 Sep 2026 16:24:39 -0700 (PDT)
X-Received: by 2002:a05:6102:6045:b0:785:e069:6c5 with SMTP id ada2fe7eead31-792ab142074mr13116106137.8.1789341879102;
        Sun, 13 Sep 2026 16:24:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33263c7sm21394251fa.21.2026.09.13.16.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:24:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 02:24:24 +0300
Subject: [PATCH] drm/msm/mdp5: drop cursor pipe for msm8x76
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mdp5-fix-cursor-v1-1-9fba3ace6cb9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKgwp2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MT3dyUAlPdtMwK3eTSouL8It0kC4NkE2Mjg1QTi0QloK6ColSgLNj
 E6FgIv7g0KSs1uQRkjFJtLQAlru6+cwAAAA==
X-Change-ID: 20260914-mdp5-fix-cursor-b80c4320e48a
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EZeVNggLDFp49i+zFbHcRV8kVa7+aob18truUbB8RGU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqpzCygNfJ9UNU9zLgqJpF9/2PjHAJzuKsAhPZG
 3LxNqonhfqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqcwsgAKCRCLPIo+Aiko
 1RntCACEchaO2I6uPRA7XMlyzZfX0Ov464yDKvDo7gS8KPUInfvd2AlsLqtrsD3BxCFwb5cgUCj
 fCx14rf0WEhxch3k2/3mU/Cvo9Eq4fhkjqAOSzpKlRM4TVLMGcio6//C6bwx76ehJcE03D8IU03
 wTR7vWrMl9mx0llpwAlSQBcubP6vjhXVa+1lNEVI0WyxtuuEIUAXAiUoi2/qRDrXzn2D5URkwjP
 VzPUI13/wjnHj1Uv2IhF/s5vR8wLobpGZpaVwiqOZ1AMFQJz9m2aPiL1niapIAHVXwYUroo+EGe
 fn9ys61fvLlBJ2YGC2EZvMFXahi9FWxrfrKwcAgp78+CMxSn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: z1Q2V_JDPcg_EZBfGfz2VWYw7h4MxcA2
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa730b8 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=uEdjA6kzdaZioO8ovbUA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMzNiBTYWx0ZWRfX8lQHrcHrGg/+
 EeMH87IpoX5GqASaxL7g14zeEKi2Lyqbe4M0B5evP7BBr0BSniIZUG15zRQKJQfGRVgePguusEW
 XBm2JxoTqdBk8j2sn85lUMKH4qNmJ5I=
X-Proofpoint-ORIG-GUID: z1Q2V_JDPcg_EZBfGfz2VWYw7h4MxcA2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMzNiBTYWx0ZWRfX6yg5JYca3HEX
 5KZp2Y8yKMRk3AULVQoO8kv6RRz2cqOOwYgnFG9cqi2hlYAaJDWQyd7jvxjaViyuyjJZ1dCDgRI
 IlX/OBHIXFLoHcnHbHcMJRrsC6ZChtfVvjjJz3vnBhNlmJGT20JLZG2/IHINRr69epCofwaSwnt
 ceAxOeRLAIQytGIS4WiN+riEpcJOq3zic0E7qCfInlkadlmct+SyAaF6XJdJ687YtZOuw3wU8Ds
 ZqQVuaYb2ClNmm+jOwtAoreA8KqXQ0htuHOh4T95dLCc4C30q5J45nY69YrQHpomQLd3cbVzW6/
 Yusa5Otdt0LYZSED3mn4KkCeoKkzCBIOL+spCqp8inyirteXtwKvIKajQ4d5Wd5lWmckiVB/ETO
 M5vLHAYMa9bPW+HxUf7di7Oujtof6iQ1T630DL9ZT+hGZN1xdwQqhBGQdkm9RqR694P10dtsibc
 uhSGhf3LGzhFDjDpw0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130336

The MSM8976/56 family of platforms doe't have a separate cursor plane.
Instead the cursor is a part of the LM block. Drop the erroneously added
pipe configuration, letting LM to provide a legacy cursor instead.

Fixes: 1860f2a8b8b1 ("drm/msm/mdp5: Add configuration for msm8x76")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 7c91fc1915f3..389d74ff7516 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -698,15 +698,6 @@ static const struct mdp5_cfg_hw msm8x76_config = {
 			MDP_PIPE_CAP_SW_PIX_EXT	|
 			0,
 	},
-	.pipe_cursor = {
-		.count = 1,
-		.base = { 0x440DC },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			MDP_PIPE_CAP_CURSOR	|
-			0,
-	},
 	.lm = {
 		.count = 2,
 		.base = { 0x44000, 0x45000 },

---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260914-mdp5-fix-cursor-b80c4320e48a

Best regards,
--  
With best wishes
Dmitry

