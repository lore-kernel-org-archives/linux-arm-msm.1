Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6775C3AC0D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 23:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784330021; cv=none; b=BOEiDNvR4YuTAPfBKrSTScy6copEz96i6RHQQuCm0W8evzgPZss13yJ+Hcx73CTDdq27YnB+ZzYmKfxrJCTYvqygyEz/hkzs5WQjXu42xm3eF1qeVANkOGUIx/vT6TcmJxP4DPX1f8G7UrvggTmooKvCWjiwTkJ2jE0HmYFyPO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784330021; c=relaxed/simple;
	bh=iD1q+F7BjgRMha/yheJBvIJueqgEGCIt6wU+9bFjPqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UcspdBxxSWIMwr6AFksB98ziIsOk8kVta5M33wK0n1VFZEeBkq4Bt6F8+rwXbAd8BKLk3dlYaWEsywOxfVwCxUVYWSL+IwPAI1ao5ddP4k3T71MzhIPFcHWED7K4lmbET7jXxS6014mxrCIE1z0GSe1H8lul23dKTHbBwZgN8C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Smpws/1P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZOE8RGo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Smpws/1P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZOE8RGo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtX4m2906367
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 23:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=w2WQ9/SNZxy
	47rjQmxSoI+Od33bxAxG8ubkvwzkZDDk=; b=Smpws/1P+5o87QZi1bgva4gIlxq
	6cRJVC63WSHjitm4eYkjr7jC5GNnpwbz9LpS+tbypwlyDVEY/Cn4IWjpKJL64lgR
	bO/+sDlUpECCU6B4Pob+yp7ISFZd2tuDwXNDQiYl4bzfRME1H5FP1qloLL4X0VeJ
	5JF+rx57Bmq2NEst7t2pm2KSwSYT8ws3oiVQkrD8bIpPvSmw+86KiLk6dKKxXCCS
	dZ5vVk17SoZaWBdsIxxA/Hqf3SegHjcbSmwdBrkDehn2SPjNhiTITy4Dqtn1abiZ
	Yt2yy9zmOrslYmus7HBziZO2IXF2FIjrLK2aXbSw1k2Otrt6zRYMXMdWxqg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrsq950x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 23:13:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso779003a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 16:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784330014; x=1784934814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w2WQ9/SNZxy47rjQmxSoI+Od33bxAxG8ubkvwzkZDDk=;
        b=GZOE8RGoYTrs6e8RSjFVQqptw1iQQQuOSG8/nIS1hvMG/oWPB3cVLEJW+qU6gwb1Ni
         JKnJmBF5lSBR+ojHa/H4O60vm7aaOM27GNK+9G6kkYnHqc7wth7k743PDqNVvzubd7bJ
         O2halkWZNPlgNWk+lbcAuTfTYUnq66tO8P2ov0wr+S9n+1VRUyk/NDbig7+iF5tmmZCZ
         4V56dO/9rmeQZ2mlDCR2fGyQunl2vDZgUEFc9qdlYF8Wb2lVz8QubJSzBIGlyszzMLWN
         tW4t7b/X2DQl2F2wgBArrLG7Dfl/M4u5ww6s9xtCZgJZyDolGkgTpoXTpTRNTxqyJ/NX
         4gYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784330014; x=1784934814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w2WQ9/SNZxy47rjQmxSoI+Od33bxAxG8ubkvwzkZDDk=;
        b=n1Yp1B1jpv+DagvECD8iMtkh2r7tv8Xi2b7MVQkRj8G2A7w9s5lZkvy9Ruf3gMFSg1
         +n27DJdl2TVkicq/zPkYbDXbXRrB879Bc82zYYH9ZAw8CIIQeHZpjkPpGUHlF2qFMjBF
         Tq2hNX7v1pMzp9dDlDThN6nB5XJTiFcZ6/8gt8q3+u+1iqw5ICDyWjYPfwCBnmvqgKX/
         y1d9kCCf/ErB9oASGEkFb3SsY7CIfzYuf+phurKn6ZzKXw89PBAIOzXYEFcMSufaK/K2
         NxBVHWmc5BNM8crHOrJsvxtdzjt9HzgA3izS5qKfECG2b2DUSOSqOt1VLz8JWjtv7hQr
         sU6A==
X-Forwarded-Encrypted: i=1; AHgh+RpSqGIgZm6QUdSxf/K5blhFKt8Wvp2WJ3cj4938BMB7jIbujyNVaY9I//v+LprJsfpxZTCh7E1dVUSEVFCd@vger.kernel.org
X-Gm-Message-State: AOJu0YyWxHo35hv3CYwrNIjLhRNuy6HmVWvlMJ/40ycXSMpUDx76JWYC
	YNl+wf2Idis2/ihOdSeyQgK/i+sK8PMipOIVRvEHhU6sr5qgO8uSYkK3m9ZmcXbICYVPp8HWvLN
	T3UE/M5dtfdFWSA07iDcCwCLnkyfp3I5M9ZrrfqiZ4BBZN63qI0AvyTg7cUXGpkiL/ScE
X-Gm-Gg: AfdE7ckSVtR14ZkbUSu8tuftzVVawezwOlbqJbIEVm6eb6lQzLD1c2bWob2hHOm1gZj
	r61wDQS+30QGyL+0VPctdLxKu4y/f9unX4Ur/XZEDs8YI+zVL4r5kaZII88HR498WeSAfkhP9OG
	KNtAzCJ350fxjUtzQfIk/tUiAOSpvivUbkqv/p7eq/tumREEPW9OBodm27G6XXkvU9Sgf8PsTVZ
	odJUckLrsz0Rox+wmNJbpmEPVRpmGO70tl6qfHUNXgGDShkB1qt53Jotp1ADmcy3wLZMEdKYPuI
	ZsAoGNAlxKteDmnhUMauIfBC7ElczKHgBV+tKQGpfaJn8KbZOSTGxSkAR8fkDP+Skq6/T+USs7d
	+hsIQKyuUyw15C/f7iXp3bZX/+67NV6g+xJKTRb1jVHjF+WjJwFPmYGE=
X-Received: by 2002:a17:90b:53c7:b0:36a:c4b:76cf with SMTP id 98e67ed59e1d1-38e4b56eabfmr5187748a91.23.1784330014304;
        Fri, 17 Jul 2026 16:13:34 -0700 (PDT)
X-Received: by 2002:a17:90b:53c7:b0:36a:c4b:76cf with SMTP id 98e67ed59e1d1-38e4b56eabfmr5187717a91.23.1784330013713;
        Fri, 17 Jul 2026 16:13:33 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm8145264c88.8.2026.07.17.16.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 16:13:33 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: anusha.nandi@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jigarkumar.zala@oss.qualcomm.com, gjorgji.rosikopulos@oss.qualcomm.com
Subject: [PATCH 1/6] media: qcom: camss: Program CSIPHY common control registers
Date: Fri, 17 Jul 2026 16:13:26 -0700
Message-Id: <20260717231331.1229693-2-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
References: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIzOCBTYWx0ZWRfX1dIw5RnlXxET
 iL+P9sWl92GZ6gN9bzjM0RRhktpd4IBJ5bsoB7JeeVO2byzBpVT0tP83uGvkQUgX3YTKMNm19hF
 7bunmfxVERpxb95TdroauW/TVmpqZgo=
X-Proofpoint-ORIG-GUID: tXDIIxMzahquX-srv3GeRdVtBLRpBDgQ
X-Proofpoint-GUID: tXDIIxMzahquX-srv3GeRdVtBLRpBDgQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIzOCBTYWx0ZWRfX3rWsGg3R6ucS
 K1olsh0yIUk10ESKjES9IPBMw8oqqZ1IRZXfefEFZh592c2PcCpYzo/uCdcF3hNBBRXlgk/Bi2X
 I6JCJcfsgeeunhuyyM0K1O5XjdLl/2uXSqu+HPkzM3iS+npqS1FO8ARtUwb4QRULXyNISim2rz4
 UqzM9sagzPL/Mu4r15YwOYHOdpClHPlb/VL1v0NcRyIl7HtN9W9dtAs9WeR4dOlxxIafpJHvZwE
 cOHUG4jGGmXAccT8kqcnYpXot7lbePkgWoLcpkaQivGUjdy6m/QI+aiXvmON/IfwOL0DY1RGwuA
 izlo7xbibMYzW5EiLy8SEbUKhSYJIyQQnHYju4zTDudr8fY8rxW3oxYueNcp3RZnUukWdyaY32z
 67yw6wVuLFZ3YQAinSZwFqSpu9ffLB8sT9UgB+VUqaLZOwKqF79b6EARKiR5qfmddXPDXJvDokR
 HdpKonccu0T+ymolFCw==
X-Authority-Analysis: v=2.4 cv=OJIXGyaB c=1 sm=1 tr=0 ts=6a5ab71f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=tkrKIiBMfSoC4ikKGA4A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170238

From: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>

Program the CSIPHY common-control registers during lane enable so
SA8775P uses the required 3-phase 1.5 Gsps reset-release values for
both C-PHY and D-PHY. Keep the existing reset-release value for the
other CAMSS variants.

Co-developed-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 36 ++++++++++++++++---
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 25a3554ef201..11b7a236e607 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1031,8 +1031,6 @@ static void csiphy_reset(struct csiphy_device *csiphy)
 	writel_relaxed(0x1, csiphy->base +
 		      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
 	usleep_range(5000, 8000);
-	writel_relaxed(0x0, csiphy->base +
-		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
 }
 
 static irqreturn_t csiphy_isr(int irq, void *dev)
@@ -1343,9 +1341,37 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	writel_relaxed(val, csiphy->base +
 		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
 
-	val = 0x02;
-	writel_relaxed(val, csiphy->base +
-		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
+	switch (csiphy->camss->res->version) {
+	case CAMSS_8300:
+	case CAMSS_8775P:
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			val = 0x5A;
+			writel_relaxed(val, csiphy->base +
+				       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
+			val = 0xE;
+			writel_relaxed(val, csiphy->base +
+				       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
+		} else {
+			val = 0x02;
+			writel_relaxed(val, csiphy->base +
+				       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
+			writel_relaxed(val, csiphy->base +
+				       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
+		}
+		break;
+	case CAMSS_7280:
+	case CAMSS_8250:
+	case CAMSS_8280XP:
+	case CAMSS_845:
+	default:
+		val = 0x02;
+		writel_relaxed(val, csiphy->base +
+			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
+		val = 0x0;
+		writel_relaxed(val, csiphy->base +
+			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
+		break;
+	}
 
 	val = 0x00;
 	writel_relaxed(val, csiphy->base +
-- 
2.34.1

