Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117113CFF5C
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 23:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791327974; cv=none; b=mQXzxqh6giTeKFsRLeSS/0y0PaKlEG0st8tUvBYpSYglG0Fec4YbZGwSdKuZxHRxlxfIghLKwn7plb67rYQV2FRLMSuO8tbdPqYyeH5vNcOMn1osAe5ljqmDYmw5JZua0HaOoDw0zWeZiF48NvEWm4qcQrO3eZIlxy2zfBDQNas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791327974; c=relaxed/simple;
	bh=2t5J73v/MouUPPv8BeanhmSwIres2KIrufqDwmaCcNk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=buv287sUquG+zDSEVLf9s0fKZAOZTojrU4ULN7wRX3GG4ggTmlUejOiaa7v2GEHqgNpIw2pArNpkDBeD756MXlPRv7ljllAiD6aLOtPUdq5gEx7fTv22e+vWkUlAwF+TZSJufOKXo/Epne91HLLI2kOxLAe6ilHrQcAN5YwwNfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBycZyyM reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBycZyyM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696Lemch2514806
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 22:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S6xUJpnqHpK
	MXNveefo1cXTh1FFN6M8v+59Kiz3wW9c=; b=lBycZyyMOkLPvONYEB9pWIoIxmN
	kd34QhrxDt4qy8A3PRJWfUIbKd6tmM1ABSBSyrA927Kyg40Oy2a8wyAi6A+9tTbs
	tuNxkiZZYNI3PgZXtWLHrPM+OfGl1AImbp+Ap8iRqc7NUhlkjisIE97d5gqF2QVa
	hRdTSZj/n5vSTVg9NH4tZ5QUohduE5AtHbbRJvVkpoPlbDL4ehY3Nz428yfhqh+D
	y3YBP92YnAdiaMSZ23IdyHydrMG3ftN6Fd7QmMv/RPGHJdawu31eMWh5DM1kWklu
	KhFRHIFzbNHAwzQmf7n3MmyfVGcNgznwEKUNSeoE6Piw+PS/EqJ7ErLGzgg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xwwtwev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 22:41:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91785bd637bso80799806d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 15:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326509; x=1791931309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6xUJpnqHpKMXNveefo1cXTh1FFN6M8v+59Kiz3wW9c=;
        b=D56sqv+XikqJubm5WJa1qPxZ2xqzta9GMYMkj4jvlmTsuNve/Mu/UShbbkZwcTuWQc
         u+ec2LA4OHbmEAWmCTjewpMpQmi+yV+EJ2zC6xpTmhvYRWKgZ0qhkhI5Q55AuswGjfws
         +ZVtJeIqjX0p44DLziFN+BDwVurYDly9H/WZQOSjTbtnjmDZUNp0OctX0rTspsEZGwC+
         EiIox5oghImsz4CI+dRYXfcWTNta8lTuE9rypOhPIO7SGFVEQSt5qmRoqNWa+WI1cMYw
         zaOIIHjOf8RwFZJ9uJwFMhPeCUmZ/BqndLBaT2cKvtDO8rsheAQE4eAfbFexOXgKy8oY
         fWAA==
X-Forwarded-Encrypted: i=1; AKwUvBzWI5+x0seAXN/yh7xKFbzyFiSJ78qXQxtUQWWH9rugN/zkiljToQ4fJkOVtLL0x/ShBzGCzwARlbStqhGo@vger.kernel.org
X-Gm-Message-State: AFuF++ktodtfxhKBT0fOohhmGHAlKDxQ3ZVVeekP5e9hB+3i4TjKMS9I
	e6l6g7O+rlcQRW5sIjP5B0PoUTX8c0rFMXaLbAtMXDq33CAO5KHjQMtgW+dzTR4WTeFmkyuUzLv
	BvSN1Wv/jEohwBvtr6d2WaOLjwDx7/CiAGDFhakHX0htBRN3fDVSjoLFBreqSofyqx7jI
X-Gm-Gg: AYBFou0NXr+0K8mnymGXFz+GXdz7x/G6Fbvr3w0hPxvPKB1V38RrDoglckPUcI57eQn
	Dj04sAexEtJrvR+swPzyQ7OXfP6X3MxEYF61e7upwOuLjc/WhR/M1MS52kjNZYt8HPBZxQ2Mp6k
	YmLFPWGeF2A8lQqXZ8nqZnhLWa4mbhTPYjH7Xrcps/6+ZsgvLm2DmGD2iQM+piOcgCgdJF41jdS
	wX9L6aAMVgpaX/Y4UJ3ypZ77t+zSbaCac74e6nKSqnnUfIkDPmBLOCl9FPDPjPS3+KQHaXXHXW1
	xxZEDaNmVuQtQLIdcmXoZIZK8B4AhPaed1Ijr23TpUt3M2GlbKxoE2MPdH8=
X-Received: by 2002:a05:620a:6495:b0:93e:9807:9792 with SMTP id af79cd13be357-93e9b86fa54mr72257985a.83.1791326508898;
        Tue, 06 Oct 2026 15:41:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6495:b0:93e:9807:9792 with SMTP id af79cd13be357-93e9b86fa54mr72251885a.83.1791326508425;
        Tue, 06 Oct 2026 15:41:48 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:47 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH 41/45] media: qcom: camss: create TPG links for IFE
Date: Wed,  7 Oct 2026 01:39:49 +0300
Message-Id: <20261006223953.3382273-42-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXxLJDiV11asW7
 w4YFkPB9hteg0/HA9p79AVZJ7AQg0oAOKdeqbfnDBSvBvA/Qk1giSPeaZxukffY4a1tbtIRbQEn
 T/H3hQDL8ImOEYTdvDOkqrnWchQ0vzJo8I6NpLka7HfiI59U/mOY5iHIzPf1Yf62JPRN8U7aem9
 LazN5d8uDVqU1W6zybYTGyMmcBZ4300DqFm7eMn1zSIW4ubc3kGzlV8ydv68KgNfDjps72TSPPZ
 aBWrtieJbnh1EqlRCbnpXZyiq4mkN7IyLrnyQUUo6+iZtM6h2sZiRBNWBT72EyDSAJdqF67PmjQ
 TuTHbZ5EU7/sEo7Bmg8W09z9MTxClPUN5ao/eFlW/AXYf1uQiSk6JjBUlT4loYh8snfX74skVl+
 lvCOaWYC5+sUYNKTKaF0+7yXMJiUaOSkhF+6EKg3IgqHX9/Ise35+5VXQSIn4rVabc6tjPgh5MH
 gNDcjTg+XiLv5PK4Ndg==
X-Proofpoint-ORIG-GUID: cz6Jsa1BS5PMJ45Znqov0SIkMHgRIWcD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX3apr+dQ/nyEM
 N7gM9kYvapVCTFE/yGn35bTmmOCimx7mA8TO8yOcsN6PWuVPmO50XfZmNcBybbloe3Xbz3G7pjR
 zcHcaszFzMOksF6ssLgztAyW+OAxmQQ=
X-Proofpoint-GUID: cz6Jsa1BS5PMJ45Znqov0SIkMHgRIWcD
X-Authority-Analysis: v=2.4 cv=SJXXx+vH c=1 sm=1 tr=0 ts=6ac5792d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=Edoj-RGbKjCKvmuEXRoA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060090

From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

The IFE topology uses its own entity-link callback. Create TPG-to-CSID
links there so a TPG can feed the IFE pipeline.

Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-ife.c | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ife.c b/drivers/media/platform/qcom/camss/camss-ife.c
index e2049e00ea96..ab6102fd1126 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.c
+++ b/drivers/media/platform/qcom/camss/camss-ife.c
@@ -12,6 +12,7 @@
 #include "camss.h"
 #include "camss-csid.h"
 #include "camss-ife.h"
+#include "camss-tpg.h"
 
 #define CAMSS_IFE_PREFIX "ife"
 #define CAMSS_IFE_IRQ_NAME "msm_vfe"
@@ -1574,9 +1575,28 @@ int camss_ife_subdev_init(struct camss *camss, struct ife_device *ife,
 
 int camss_ife_link_entities(struct camss *camss)
 {
-	int ife_id, csid_id;
+	int csid_id;
+	int tpg_id;
+	int ife_id;
 	int rc;
 
+	for (tpg_id = 0; tpg_id < camss->res->tpg_num; tpg_id++) {
+		for (csid_id = 0; csid_id < camss->res->csid_num; csid_id++) {
+			rc = media_create_pad_link(&camss->tpg[tpg_id].subdev.entity,
+						   MSM_TPG_PAD_SRC,
+						   &camss->csid[csid_id].subdev.entity,
+						   MSM_CSID_PAD_SINK, 0);
+			if (rc) {
+				dev_err(camss->dev,
+					"Failed to link %s->%s: %d\n",
+					camss->tpg[tpg_id].subdev.entity.name,
+					camss->csid[csid_id].subdev.entity.name,
+					rc);
+				return rc;
+			}
+		}
+	}
+
 	for (ife_id = 0; ife_id < camss->res->csiphy_num; ife_id++) {
 		for (csid_id = 0; csid_id < camss->res->csid_num; csid_id++) {
 			rc = media_create_pad_link(&camss->csiphy[ife_id].subdev.entity,
-- 
2.34.1

