Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAF839DBCF
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 22:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326436; cv=none; b=uVUn2GvSsCfaf5xv5waGGQzwa6BNo7mLJuIq2tx4jED7AHq3ocxwdxAmyaELBEkuHdnmQfEEg3E53wzewfVQ/VCmH8zIVUmvHvPV0jsGyp0Yl1apD3WLw+f9nVPh0kwpF6VX9G8WTh9NVMCKyIE1ZUNKRsnZrLajtmogzjaTCMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326436; c=relaxed/simple;
	bh=o+pArcNbJmp2jNe5MdLimuBeqxq5vqZqEf7oThdS1No=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SalztkrxztFwqdvxCElogVbOGOComdZoEiHCosM68S/i3XmFZ3It4sV8ZucFo0I39KodW1jKtzMzupc4yc2EygciacTG8BRuEoUH1Bp7a0OnJMdc9gOnco04i+OL+UuVwrfqqoHzrDj36DfS4WqX1lpIL9344jOi4ibIHMCcoig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lO3Ga/vC reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lO3Ga/vC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeWJP1676116
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 22:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F0S3PID9SQK
	AbweaMyZ6e41wAcDSBT7h+cjSF8ADoV4=; b=lO3Ga/vCQOvPl4lOiWmolG206QZ
	LpBXrfJTW1Cwb4SHy15CVGqBnmXt0bedrW6cu7VXhPBe3gMc0dJKf3aNDCBj+Cu8
	DYZKjxTUVke/IxTA3z2TP4bYfizpxYNzv4RjxsJrcnTyG9vsrK7uIhw47vLrJoMT
	+qdW6BDDzBxMw/YXT3YkmoDknj12Qb5I/qtSFn5SkqmqQA+8SKDTTRphQPU6loGf
	pYa0AQ4J8lf/QJKncpr74UTxioJDZbfL7M9YRYnB34oPJJIZtOmLTZwMcZ6rmeC0
	OubHJvgjQ6S1xFKvPqFFPV2purN1lG1NbQbL9thCsuAI5+kLuZdO1+gf9Aw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xdub0xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 22:40:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dea1b6c89so555058385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 15:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326425; x=1791931225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0S3PID9SQKAbweaMyZ6e41wAcDSBT7h+cjSF8ADoV4=;
        b=STyt60hhtGsIP9CP4bvQtNxIRCsuw//X5lhuTCCNzoqiVQ9Vdh29CmQlsz9pQ99glz
         FJydOBP7kAgxe/twyyQVvmh1rhtiCKfAubIZrAqZCZ0RhZ5keOJggSv8nkH7euKeSZHS
         sF4kutsSwfIrxinMX3DTwU6hG9mP0Qpwuk6scAr/bBKYPbrRYBJAsklchR6FRKSM+EOW
         BRyPUkXWRz8gWGKEoptdyMnCezBTPwQfosGu7OBg/203yMs/WhmcMqYQay1dDzLE4GCX
         FSQ6b/1pxiPCe6q7stBX0NHk5LhX9ZLC2i30jrKo95DHN5uwGGG7pnmRKHaK4ngJPR2l
         /yBA==
X-Forwarded-Encrypted: i=1; AKwUvBxeOgLVQrkVsaYprt2fd+6aQ67mKW4fnQEqaYDVnSqaI3TEt2HqjFP2RWrKuvPYYlQ2+wWT8IZbzQ+oG5rZ@vger.kernel.org
X-Gm-Message-State: AFuF++lbLV4aGkZepxPcCzjv01+/xPnO//TO0lPq2Weygm1GT+GP/plX
	MIktUk4Gr8LeWpgq8uGYVhBhRqck956E4nQ4vZ1CLOiZPIIzqOxvTNEgjZekPoDFrAcQbGCM6GW
	ErUQf4uNOKzQxHR7A86i5QFGJWzZXCNA7xl6tu1N5powsXFmOBszkcjBpsl+GoUDM0vH3
X-Gm-Gg: AYBFou034tlEkEL9c69owXBVezD0GNWVemFEnRc4g5CFhAS6ZRPzeF398X4VytyHepv
	qsS4K2f/Ud+GsmoiNllwkulZY7bwcQ/NaxjKVI0s/emkPj8+z0KU7SZrmFQ7rSJLOir6rpLgcU8
	mf8c0QJK1xuRPj7df2lkxu2+7iP2UhvxRejfWzkwNIZ7blLk0cX/XV9Zs79e09PCSyiAV2+G2C5
	kgUggdjGkTs7bBdieuhEsOvqavSQQVRfs7+rYp0syG75zGQSZHg74N+hkiH8+WYb5z8EAFipINH
	4KW4zsA/V83ltjCZwdl8mRLwyXCbfBewIREu5csMc2kclNcm9XuQPnDNxCs=
X-Received: by 2002:a05:620a:4488:b0:93e:9809:3367 with SMTP id af79cd13be357-93e9b83a81amr80368085a.72.1791326424860;
        Tue, 06 Oct 2026 15:40:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4488:b0:93e:9809:3367 with SMTP id af79cd13be357-93e9b83a81amr80363685a.72.1791326424280;
        Tue, 06 Oct 2026 15:40:24 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:23 -0700 (PDT)
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
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 05/45] media: qcom: camss: keep CSIPHY lanes active while streaming
Date: Wed,  7 Oct 2026 01:39:13 +0300
Message-Id: <20261006223953.3382273-6-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXyhQtsu9PMOEc
 RP8T3XsZHt2KOyUOwfaQErCKxSMsOLGec4QjE9K3NBFbsH0jptMLlQcRKvK8SZj4Co+IaT50vqn
 Fwf+6hF/iboJ2ixnieaburRANPtXAIw=
X-Authority-Analysis: v=2.4 cv=NshE4MdJ c=1 sm=1 tr=0 ts=6ac578d9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=0Z5QZsCCh4IwRXeKKPkA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: R6VR2HJicV267ugp1STCXGy6YTH3ly-n
X-Proofpoint-ORIG-GUID: R6VR2HJicV267ugp1STCXGy6YTH3ly-n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX9ZSTdrCK0eLX
 V//pxTQlgsYbckVtkhM85W1SOCODw+4mc+0urhUIX6l6ryfUa/U58MWXZx/95O3NLRCVwLUAsOq
 jSAWUKmitd9tIVVkLEuc9avqK5thbsNcfjRG1W5Qkwyz9j/qNs9BLvUzLlQlVElsfDNTH9xdo8M
 KR8CEERSfYjRQ9cVVTc6Zaho/HRMbHZSvqQP3PO7dxfgrahKy4FHqgkNYq8oJ5Vwwv8IVCJFyec
 6xEKJUynm8YEwGH1jlHepQURzjy/BBRpLisax7EXjFC3NK+nkjpDlzyDUlrQMl9rvp71snlwKN0
 uV0r4o5hnKMGBTDGhmo+93Iya+xKVGB/qJ2EIjHdxdBD8IQHduvz+qCZ/azU0yE9kWOMuNxd64e
 0CQM5H38LAQDKGYWDaKJSM3Sc3yBNltXCGDwKpZUe6zUTi5Bq2dwXJIkkYxzjVfuXwYaJ4xNzps
 Q+xYyQPPPvZU3OPoFiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add a stream_count reference counter to csiphy_device. The CSIPHY
lanes are enabled on the first stream start and disabled only when
the last stream stops, preventing a shared CSI PHY from being torn
down while another output is still active.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 12 ++++++++++--
 drivers/media/platform/qcom/camss/camss-csiphy.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 9e95d04b7235..4938e56f481d 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -324,10 +324,18 @@ static int csiphy_set_stream(struct v4l2_subdev *sd, int enable)
 	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	if (enable)
+	if (enable) {
+		if (csiphy->stream_count) {
+			csiphy->stream_count++;
+			return 0;
+		}
+
 		ret = csiphy_stream_on(csiphy);
-	else
+		if (!ret)
+			csiphy->stream_count++;
+	} else if (csiphy->stream_count && !--csiphy->stream_count) {
 		csiphy_stream_off(csiphy);
+	}
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index e55c098dbe67..8c1eb83de751 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -115,6 +115,7 @@ struct csiphy_device {
 	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
 	const struct csiphy_subdev_resources *res;
 	struct csiphy_device_regs *regs;
+	unsigned int stream_count;
 	u64 enabled_streams[MSM_CSIPHY_PADS_NUM];
 };
 
-- 
2.34.1

