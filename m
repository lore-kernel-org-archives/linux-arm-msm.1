Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08F425C804
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987459; cv=none; b=IwwWz9VZs4r0Tz6D+byxQg+Je5XpNlpOjtvWvXsJTIT1Zp78lWK11Dmnleq8vM+rtak64KvG0nLBSiWrz7U80u7VkAhJDl9buIyuvN80OsgYs2STcgad7wrRh6o9W0ffaWyXMfi70SDf14SWkVxdBO5+BTS78aeQMsUUO1ooj3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987459; c=relaxed/simple;
	bh=b0Cqqqr5RXysOo/IlbQaAaOsD61faw7dj63ogkvFqxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fgEwbniX96ZbLwZATJH2PxlXPHD8xGg51msGC+t6RBhs1sVvrUrnApFUBL+b9YmOvHRuHf07z/NTs6snTL7ogivayliDuT0MfZBRfqYl37OHGlbp4GbzxVsnxZsypNx14bQZXKIbumjHg7yv2W2kThnFclQ0Ph03DlkyfqA2hIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HeR+XBB2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nmtu5z3K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HeR+XBB2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nmtu5z3K"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NetB13338722
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	csdoT9oCeHS//8bD/6QO58rYEQChTDH1xyFYL1OZaT0=; b=HeR+XBB2BmtkTBMj
	kgKUfe+C2kJgo6tREiNDkLKkx/IsXZcvDaPPSwb7J2IQJrIqDbR7ALHjVFB6wL2h
	5ZgSI4/g2iqNancJaT2vAUujFJQrFhOphvsuT7leUBJ5/mAzqbtvBUvHFj9IRcgz
	eJa5gXqQsFFpSgTAMSMr8vZ6UAt+pTnYDzOPp/ToHuYO+55IrQf5JnZYvXydLy9d
	RK2R5DFZu+89L0jVBHGs74gwDuXMTaFiVmy1qtudZZabF+rE+73krJJsINlwljJb
	VQPTyOAdlcvRNNMoWi1ucj44yoNVqqvTOgHq+V1ze6VOLvqYLMuMkHUsEGP/gO0Q
	ZMA+Ug==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2aj033cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:30:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91792488228so7858336d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987454; x=1791592254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csdoT9oCeHS//8bD/6QO58rYEQChTDH1xyFYL1OZaT0=;
        b=Nmtu5z3KqkkVm+4Ur0lmclcWwMVrWxAgseGGDReO/4fC8Dvcwx239We8qc0kXPko2w
         054trjQ1zeF4n/xJgwFOK+Sq4SDFnlpUwe+XQK8xXVwtR64f8e2/pPAZbf0A9Xma/sP5
         /g0jg2/3vlC6hpGs7wNCqL/WX8YGyNnNwSmxpvYUdGIg3TKXmaVd5fzrhJMeikJYPmSe
         tDV3ilegWsi9+T8EydzFfPB0EmxQdGrlrf9XLzUY2+2hBQi4qqICGQVwGoLe9A6QmHmE
         XIvcv5MZaoX/jmV3yev+YpHd+vQdMqlySobW8BjnezIxfEOv6LFzlJeTcvq3h4o1yWNj
         AHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987454; x=1791592254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csdoT9oCeHS//8bD/6QO58rYEQChTDH1xyFYL1OZaT0=;
        b=NCvy9kuPNJDKOdyy0tR6AEdgQkA4AcMpVWY4ib9xZEVt50Fm1IAAdkyzZ9qS0gXdNj
         RirpkwCc6JBCHZ/h3pVQ4z+NqHCWK2FLJE/L2d20dyfleBQZ0MP/QxBev5o2JNrRX0R8
         INdKweLw/Oje0zMllO7E2bY83e9LunaqG/YkT1FXUnFYfYLaj7wWRQ+hD+gQe23QOoCC
         n7sEbV9mPKM+9AEKjM2DpMPoB6kdyKqKM4/zdh60e6JB2FoQYawluyvUZJXO0Q0znfJR
         wGX0uu/af83/WiVKx4xSw1JlyeJ0bKDZMsgz3nMB37YwG9vZoXvI14Zjqb3OMIBats1D
         kC/g==
X-Gm-Message-State: AFuF++ns2xs9+E7JsrtGL+2xs5ePCc/dP4MBbUr39ZAbwcH/YQTmaXFS
	TNMvsVYyP9WjflBO9Xoh8Ej6YrlvsxRaKV/1MKyc05RA8zRz5kzcTCiLbxEeQyoXJpQIk5jJbU7
	JRXeaoDtm/HpYuZWSXb70Ps1GPJEWzlMHZyrYmZWBBj0pzzeFhf2M3IBVJoVd+YpyfO+m0zO7YA
	eJ
X-Gm-Gg: AYBFou0yk/RGpb+tgpPWOTvRjM7krpFZVLJ6n8JXoKeippazP7MYcZ9GNGSlxDbdOtZ
	GszPl7UR678pXUbdIfDOrYfwI1GfdakA5UtlNKGpRqKCFpZFdr0coqyU74tj0jJdtt6MzJTKo/W
	YCc2Gijr7XYFq+XCXYMHcbO/yt9RTV0rh2Sy/haeoyoQWEOcBW1U2/22NBQhb/EQHxFi0U/hdPO
	O4J4nZ4vM3UljalNPi5qLfqvrssFnKCCpTqnK7XQBXgLPZ7JB/hfdd/1OAMGcjMSB5rFWP/ZHBK
	Gcj5Tjm4N60Ilim6kg+PqiXPic2oIicR5l+spGlpEEwFSFTAgPxR9lG7q15caWu+n7FgpVsk6i6
	R1EFq93RsBHDqoAHQ4HrlrHRi6haFvqYYkVBibDpCBE2VXHYMCs42a+94Er6LkGdNNsejKxHrT9
	9/xKws8mBqcxKP
X-Received: by 2002:a05:620a:c4d:b0:93b:d79a:c463 with SMTP id af79cd13be357-93cf19eaaf4mr853842285a.59.1790987454093;
        Fri, 02 Oct 2026 17:30:54 -0700 (PDT)
X-Received: by 2002:a05:620a:c4d:b0:93b:d79a:c463 with SMTP id af79cd13be357-93cf19eaaf4mr853836585a.59.1790987453473;
        Fri, 02 Oct 2026 17:30:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7957d0sm1133979e87.31.2026.10.02.17.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:30:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:30:25 +0300
Subject: [PATCH v4 10/10] drm/ci: mark pixel-format tests as passing on
 SC7180
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-fd-kms-fix-smmu-v4-10-2a44d4d8ac77@oss.qualcomm.com>
References: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
In-Reply-To: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=b0Cqqqr5RXysOo/IlbQaAaOsD61faw7dj63ogkvFqxI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEyeHIY6JzEfoBXelvMyLt0GhJs6WBbfmyToW
 58gCXsj33OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBMngAKCRCLPIo+Aiko
 1ewRB/9QMiXQ2RF5FMkCqo9388QolNpWArGRtwxcQNexXbptnrnXbm00so3tPbGHp9Xe3sjFZSM
 fgu9EO31fYY8UGT0wvdu3RULeDPfBKUhDpRwd/nf4N46VTFoAQrO9JsU/vBhssPtNfqOFIKVJ5E
 xiOpFshhoTtTaPOYEAsGALFlAAt5lts6iPFP7nQAMs9BhlPm6H3EC+s4uAIodIUa1JDOgsMtX80
 SmkXeyHpmwJAUq1X7hlr5BfAQS7Y+XBSHIptqwVdLKug5Gv48nZiB/2NyebBfKt1fT+9E7nl/Jg
 FFoOJx3Korh/Xzktb4+AWvorIaHh1HTaJnBVwBI/4beSwuia
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX/BjOJXWXpf0T
 3MLiK4YjCHe/FPlEO8uXN4W5KXxaAdhSozaWqpkCSp3fYFZ4HmstGx/lmBc1fKm7PpHXcqKUeBN
 wHGrNszVJWUcNAqqX8H/JXjyUsHewiA=
X-Proofpoint-GUID: qX-PU16SLzGsgWt_Yod-sG3gDj_L9Mh9
X-Authority-Analysis: v=2.4 cv=UJZIjyfy c=1 sm=1 tr=0 ts=6ac04cbe cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=_1_hEmUK9n4M9CbZuSUA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX+Y4A/KFDeAxq
 yDYH/6trDyjf/K0e8FKNuqlWDU6TJtVy6ooy6KLiJdvfW9TIx11GCKA9b+h0mTun7O/3/Tu7R/+
 TihnDu+knhBWCKQX8JMFEyzg06TERQOHexR06TO7ihY+sbbRjzmbTCir1OP4IaqXGOSjLmAV7Df
 tfZHSwSVqnD8m4OVrwdMs+d3bIr7i86N+GzOSDsUzl4zvTTUtax/h7Huqa+uLLD/0OlKLwhCUk5
 WgwcPbkYHKizsxe7QzFHLU3oKUuNfV6dkSVPzKfTxlHQKAoaswRK2KELCd7Jwj/xdln+13PQqe4
 JA4hyeiSyrSAKkTfkvpSKrOioaBGltomtHq++VFXYPv/HL3OcQATb6oALujBP2ptuk3EqTc5BR3
 aeFBr35+3kBa+OHbrMzfpkM9qIwDVBRy1REcndg/T7bEKzFKHftH+1c4aWW0H+4QD9xElwt2k1p
 a+aREAJCCCGYHw0REGg==
X-Proofpoint-ORIG-GUID: qX-PU16SLzGsgWt_Yod-sG3gDj_L9Mh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

kms_plane@pixel-format and kms_plane@pixel-format-source-clamping timed out
waiting for the first CRC once the test had set a legacy gamma LUT.  They
pass since "drm/msm/dpu: only reassign resources when the encoder is
reprogrammed", so drop them from the expected failures.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt     | 2 --
 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index 2daf4ab879a9..ea3013faa37c 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -18,5 +18,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-kms_plane@pixel-format,Fail
-kms_plane@pixel-format-source-clamping,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
index 2daf4ab879a9..ea3013faa37c 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
@@ -18,5 +18,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-kms_plane@pixel-format,Fail
-kms_plane@pixel-format-source-clamping,Fail

-- 
2.47.3

