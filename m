Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397C8356762
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 23:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790464817; cv=none; b=a17g/4bWyt2s+tuKpBh8ybRTqlodmPtOcte4qIQrJeQ8K17Z8NeL8+DdvjadzssnDt+V7heAoAgn3luIu1IpTFfsmXLwEw4zVX0fENHGiTO3D8zy4oQhlE0jhcanh7L67c8zlCOrHy+3mgM64R/Igcbf5FSrOiGMLExL9PBLUN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790464817; c=relaxed/simple;
	bh=hjHuHiBLPXeUk5bCF3QBOyyC5Mqbbj635QxQ6KydDgE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ECBltxKIfpBo446FFpBHVy73fwloMDw/NXSYs60YtjA92Xf4coS/WNnwaVkpmdHtn+bcspjYYTB8TVTeV15CF7uhnQScl6ob/dLCNLfTw03HxyzszREj1aR8qXhbxO/iYhi0OfV8JjxPrwrNRd01x2HmbhBc0DxFszHxjXqivcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFCP+kio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvGQ5V4n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFCP+kio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvGQ5V4n"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QMiqJY783927
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 23:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1Apv0bUxILz0xu2ZX14w9Q
	0OojfUdgyE9G78ZnXEiQM=; b=LFCP+kioTfYKE9EjEwgd5wQFAtZ5DIbPw1I3dH
	SO56H5gpIqzG+IBCamhCQAM066L4K1SyyyWQ3c88ZtkDPgaIrBHWGm8bWZxa8PH0
	ufaNXS9IFLvpMfxjQ+kuwOc6vY8qtlEJhsWoTguWYD84qkN7/qIHB6lXn2aG+xT2
	EXwri8dk6vq3IzUbpu4WmOHKyEO1VKHeIYyZtdWzLjioJKDuGIWnO3ftKgBgQoiF
	Uf3YMxhGo4igPNPrYfgb5PHPCPfJ63m6tg1Goh4ZzasfawrkMeDOHNtt1+nQqd3Q
	DunIIerqHaV20eBQZFq6lYRRZmOPQ4hGbybHQ5UFGy+N+hLQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5cgj1ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 23:20:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53332bda5c6so8678471cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 16:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790464814; x=1791069614; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1Apv0bUxILz0xu2ZX14w9Q0OojfUdgyE9G78ZnXEiQM=;
        b=YvGQ5V4nMeGwFUl8aGyd9HxYEYhX8CqfkoDyJQFRa1YlKIpOLQ7FAePcfZqki5//Ra
         qykZjJRmtTQIkJvPzMmuYdg8Os9LWK9tYirpxJ4w2G3M7PSYnJi/TA3GjOF7ECDjtsen
         TQ8cnMbghATskmvBaxKnt1EFiYSxRo6vI/cVhUxrvdxyUgRKgLUewpoen26VihLfvKPh
         bqC6xnIBd9tTFoQRI0rTIeaKKoliVy7A7zX2u0QURXFAOvNG9HRcVXe30caqaTMdDlPC
         41AkmFGbEXFl6WJZryhB6JsWZsDDJyhJXnsGXGerU6IfFuXzg0pqZvkRFfPMgHivF9/W
         L/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790464814; x=1791069614;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1Apv0bUxILz0xu2ZX14w9Q0OojfUdgyE9G78ZnXEiQM=;
        b=2heUHD4q7g9te1v8zfv3Rkz4g03vlZ87rLZFbRQy0un1SJnyrT6big80eaoLrwKOss
         Om3LvrMtqWjr1XemMTRUCdcTCMLpWuELTPcOcfDL52WBE9bY5YHCQg8d8qWHXKq0+zZU
         LmL32MCSw29yy5wlAjlEJoRiDVBhHj2jzqEUjem660g5nYIJ/YnFPz/7lT4cz6YsIaPI
         6l+uF6hl1O7dxHcCHcOY1+9dPqXT3pe3VHowkSR06OEckM7lN2C/bEUikChWMlODMoLO
         RAi1vvxnCNiVpjbwZpCXMgmB/hhogZn+nQzlZautTQCBJPEiSBcmlZOTHhzBj51fzleA
         3ePQ==
X-Gm-Message-State: AFuF++l10cvsMwPmgOzptYSbegris8asV5gd+ZrfiwCGHWwuTW9XqLDG
	9qv8FpGmf9k/ip3u5VBMgEPL/bZur/QEVkhezRj5zQ5mf/XErF0wFWcDVqk4EY+Wvo6SK4Y30WL
	hVJeIm4WqXhxH8S9VrTfrISIKbenCJNbzljYr3bGH9pX/WdLkFUB/A3bqG/NcgUIWPZ36
X-Gm-Gg: AYBFou1T2gj7foPf70IPgvg83d74UvqG+smPHhvnAiyj0qVOb6dNC68HAnREaWZ31dK
	6E3ZkeXk0Kc+yIV83YnPu+GpxKJtRabsUpEvnjOHQxtCrsGd8R2XZxRA8jQIznvj/uJXjLfvdVo
	7jbICC1njGhsEgKR0U2q/ogl8jqodS6/a0BuBBdI/OHwcd5MI4fa/VmJoL8vy7CjZwrymbbgFy8
	MAcexVQURaOTHyDbFd8udHI3nf/RXyDY9SzltduvjYtGB38LjuetXTAFzf1yNwYxRXas1GhNjmh
	zfEhxAWUcguGV2OoHnLCak+KExeYphtS+f2a+JnrrdJF7WIJAiEr0BnX7YzsPwE7oJhxujVGAUz
	xSkrRzwWC1HL4GO24TAgkAnMUsqMHQHjOTWK4CVz/hIc/c14I8njo9WUoZTGeptDmN8tXcv6B13
	ksYhXNJdIp3Fo3
X-Received: by 2002:a05:622a:310:b0:532:d36c:708f with SMTP id d75a77b69052e-5330b70c4b6mr119234001cf.30.1790464814325;
        Sat, 26 Sep 2026 16:20:14 -0700 (PDT)
X-Received: by 2002:a05:622a:310:b0:532:d36c:708f with SMTP id d75a77b69052e-5330b70c4b6mr119233621cf.30.1790464813825;
        Sat, 26 Sep 2026 16:20:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64c3274fdsm17676311fa.38.2026.09.26.16.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 16:20:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/msm/adreno: implement progress handlers for a3xx
 and a5xx
Date: Sun, 27 Sep 2026 02:20:06 +0300
Message-Id: <20260927-adreno-progress-v1-0-f0bbbd6a4ac7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACZTuGoC/yXMQQ5AMBBA0avIrDWpShRXEQt0MBatzCAScXfF8
 i3+v0CQCQXq5ALGg4SCj8jSBIa58xMqctFgtCl0ZazqHKMPauUwMYqo0o6VcbrMcltArFbGkc7
 v2LS/Ze8XHLZ3A/f9AFCMinxzAAAA
X-Change-ID: 20260927-adreno-progress-87f92d081376
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=861;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hjHuHiBLPXeUk5bCF3QBOyyC5Mqbbj635QxQ6KydDgE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBquFMqjNDriOYaePmDwAq71b3O064p4ktvyxjMv
 x6PbbfqAOyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCarhTKgAKCRCLPIo+Aiko
 1TxJCACiaQuVb82DBrnCRZFAUVZzWCobCtUOEwZGV7KpF2T5FUqnNxXLC41Zf/d8CgIqiGH/Yq4
 SoZVdcbZKQc5DbR8STm+Jsvb1B6cmdiBjujoSDaev6qQpt3g21kvGo5OMDvcNwOs/5Fb17CjPid
 J3Wnwg3BUOAPVlJWMzZvznWMPjE4RjdyIZeYXJ7RTvucfUbkEn6KIbFv6L47cfFtRseLBvtXkQi
 MECQuPDKHR16FSzaWzYAAddcuDRGRen6b3HMPWoPorW14I0Ekh73ZOLFzdk3p5P00HPKSLeKhgP
 B4zuwFt2ErijU3DfMU/GhM/QaqbOzqkcJe7nbRqJIWiBY86R
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA5MyBTYWx0ZWRfX3NVf0O2Vv1Tk
 L8mpHylJy5lXGGnP+FzHcPgg7cQWe31r0imthKkXIBYoJVJSkqfIUgAGboD06Woc4ipHE2SwOgN
 ubA1YXXz21gWOlStNKYNUZpeuWSm+KdxNucM7QjYc73Cp3+TYdhb3V8+YYCqVy/rXmoyo9ZQw65
 yfvzht3LmjHJ2Q9PDT4/YH8DsKiLPG2sELs7KmR7d5z7ry/7RRQcwNFD/rZ3cRidGYOvfoiXd3z
 eQL2GJaASX60aT8jWotBmn/WC0BBBxADiTkgG7YhDJfdHdXV0KguBddFJNgLoz+Td5x9FbAq31r
 FZYdf/zF5h6iU1KNIi6gXEzlqZJNXFi3YZrBQJJxNfTuRipa6rFmiJXZm3y7boEGOp+2T5ZizQW
 Xvru1ZKHnZlSATreuIeJwcWWKLym7sI+eS4I8+TcVATfOHjOIhR76Tqu/0JSSUCCRvkjXNmP93l
 DFGB2fpfIECYitQIQsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA5MyBTYWx0ZWRfX9M3ZTEj0275b
 5L3yoWEaEUQ2aBvgqalko4691qqY7SpLuOtqH4zylS1V2SD84+taVjVjhLQePmGEXXQgFebJEsy
 kGQRMNDdwU+SPPpeAd/cL4d5m7MUsrY=
X-Proofpoint-GUID: KeJ6cpJpf1rrMqbxndK3tt409XtemGCB
X-Authority-Analysis: v=2.4 cv=QvLLTlyd c=1 sm=1 tr=0 ts=6ab8532f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=NlBUUgI1MX_TVLqZzjEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: KeJ6cpJpf1rrMqbxndK3tt409XtemGCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260093

Adreno A3xx and A5xx don't have progress callbacks, so any submit still
running when the hangcheck timer expires is declared hung, and long
compute or drawing dispatches are reset while still making progress.

Implement a3xx_progress() and a5xx_progress() callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/msm/a3xx: Add hangcheck progress detection
      drm/msm/a5xx: Add hangcheck progress detection

 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h |  2 ++
 3 files changed, 47 insertions(+)
---
base-commit: a15fac810c76397ec9f62a6fc26c4d7ab6e238a7
change-id: 20260927-adreno-progress-87f92d081376

Best regards,
--  
With best wishes
Dmitry

