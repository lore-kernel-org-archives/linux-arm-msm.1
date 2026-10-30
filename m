Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380205;
	b=4dDeALnX4uie2/m6EF/WOk29mW9vUJKEpaujXJVYr8V8L9DXSvD9gfk7Jqh/AzpGIJt6
	 DUH/m5P9Yjaow3MhY7grKpQJO5JwOif6MD1kTlEUJx9W8lLjKMqkmsTgNwDBXFZT961iS
	 hrIocMVpAMxEyrbiBzNf7kcKH2GQgN9vPi7zF3kSFpJfK8FviaaTBgEYxZQapDtd4rhEX
	 Ft9bgKnj5rECRWqPRJp5JakrmSy0lOn7by4YP8ezbX0zzFZ2FFX8eX9qBV3OIAllXb5Nh
	 auEm/gtG5NHLl8AGQIGKGGTsjTYA8no3LflXRI/tzMqRl4eU1I1L2xe8GzvfuRie3ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380205;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EOWyfjg320LsKD74ASlFLIJyIS4lGcmnKVpPXhAJO90=;
	b=nKR9vE2hOUrSXe+McJg/lAgVyBMaaEpun/L6JyEuGTthDcJJaAPgPCX+SelP9A1GBOyo
	 jsiak3IYpPIeEupG+V52HH6f2AYEOlZC6SPoxyQAXJKAQqT4ZcFcbthDQ9KDSTA8d3Fr4
	 sJsYNVSoGgyFDywHIscj+Cqn/wPnTzdnQuqcXRHKeyhW3YL8z4DtigiaMrGtrT5G1BHaS
	 ypYd5/wSfnD28pyS9cL9GlCT6q5s5Uu9DkbHHbZPkul7M3LyHAiDkbNROojbtkUfUdR+R
	 tKSFZ2srhE5vwayoPjOrHvtBneHVellK8uhscUig3r+H5kh3+fru9FfXi9Rd3FbHP6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfLf0274;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QonYggbX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0632606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0632606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfLf0274;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QonYggbX
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERAHT4102848
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EOWyfjg320LsKD74ASlFLIJyIS4lGcmnKVpPXhAJO90=; b=JfLf0274sJkJhp0e
	MpthktA3hCXfL601o8AhP8utAJxsqLWLvT8cAbJ8UCxw49uft/r5x3p0nITHHemH
	uoYZiw6PnBzU0j9uT/yR0ktYe9/NnU4Yjmlnuy5YrzeX6txG9hfAhLskFAvWC+5+
	h8pttzgL34wtBJ0npBcG7N2f0AO63ONo0aLMo4F8zz5vZtxla49hOyk5MD01wcpU
	70D7wuGIvhKf2ov2A1iBILuBelpVqmz3yKZiB+15MRnloMxP/9uz7VjHPlMdplj1
	j/qTl4UoNgd+n7zOuZkZkJyoIZor0VBzKrAJzH4wzsRxkSTWrXgHWXFNkMqpUqoy
	mbfboQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qm5fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:10:03 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1aa0fb7f157so1452417c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380203; x=1793985003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOWyfjg320LsKD74ASlFLIJyIS4lGcmnKVpPXhAJO90=;
        b=QonYggbXIzlEfMfL2BQlubh5T/fFr6MyrVpXfEMK2xcusRgmsNC7nrv9dub0VBabl6
         wTM7oGZQR1PRgSM/gnF+qF4p1Br1Gp472918ZRFRbtmrkiKLciL8fvzpAXNuvJKsvXCc
         rNfd42jZU+q4lyoX967h035j4bPr6+mNhYQR848zP+7BytByTapdhpdv0sTCYkpqFD1H
         GOvlnOe02F3ez9ISzENXWJA1oipYl6qYuGMOR34mu1XOcxU+yBFuxetzvFQVXzKpfat2
         VxI4tdHKvri1QnSnXTCxiNsMVnLY3WYD1zepmrko36LCTVDrlxfHz8eDt3haiglo5veB
         OHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380203; x=1793985003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOWyfjg320LsKD74ASlFLIJyIS4lGcmnKVpPXhAJO90=;
        b=0/cEajBi6Cjdi0zZa+EYAbECTMBzLbstltJwiORrpCZb4QRjdNzu4GuwiF05tX+Rp+
         O7SE+j/Jyk4QiuGfcR3Hpz5RSAqI7ZZqM9IM7M3tUZTvd63vxKa7js2zby43+wAWibc0
         2mM1dU0SRHCe1uBoMLe/CSQ+CrmZC1k0WlVITBSFva+kOne2FfvXBjBxFGV9WfXHpj5n
         z2KRSliiel0rEYyRpmSf9Af+gDRF8BRPjbUEVcKbEROD78SSrTgVs2J/WyS741GmsPBW
         pNkZbMh3nuu13XW44QUYGI83gmjy7YszJnnudxpGQrKp6NmXZULT5tdgmAFOhTmHSrNG
         HOvA==
X-Gm-Message-State: AFq9FYKEPyt4HfTDD1Yl2xyIT1wVBU3PRxbHCwCRqyYU0k1N9FDWvEaI
	tg4597jVzxw94e+2fa40M7YaGDbXKOQotULd2khvlCytemQZ2APTK0slIGz6OB2rq0sLwtEHYJT
	Y9xvpbGNYZDwcmrseIRXvTJjP+vnwv5/2jChMpoDIEQi/p+6G1dFCUaupFqYR/vbGEYLB
X-Gm-Gg: AYBFou245XGZZOJozz1yMJbSn2Cib6uvR1s2S1LWAn+q1Oksu0tJjotSyC8v5DArY02
	gFLjMOs/PnF2zZgwk8t7y+/aah4+g2HUJaGLcdImkYW6Q3eplVGL6Jtp1Gdm6U2gxp6HgavkcYv
	5XBtY1jCjirhT4EmdHnkIRXMhDt7AiMf8CMDupGvPTuzWquz7BwmW86P/11r4qwA/WKhWk4L7tt
	pNpeU2wKW38Ugdu9A8rrYcSr/wGRclxQLVY6m0yjWt+CfKgXQ0eceStqCRmivLkTkvpg4cmkj6S
	cD+pb3+QfyxhDL4QbKriwxs7O0AuvcUhaoAFNYs2fsoW3aWDwp1LPvDNh26LYWig3p+Ud2THoSt
	1etdjyXJ8OIgFIaNCvgwSGvANiqmznB7ZIaOUKi6sptBvk3m2QBtrd8QP3Cbm4m7oB2mDRIr38Q
	==
X-Received: by 2002:a05:7022:3f0d:b0:18a:8164:ce4 with SMTP id a92af1059eb24-1ac4fb0c60amr4017424c88.0.1793380202683;
        Fri, 30 Oct 2026 10:10:02 -0700 (PDT)
X-Received: by 2002:a05:7022:3f0d:b0:18a:8164:ce4 with SMTP id a92af1059eb24-1ac4fb0c60amr4017380c88.0.1793380202065;
        Fri, 30 Oct 2026 10:10:02 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm9481168c88.13.2026.10.30.10.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:10:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:39:25 +0530
Subject: [PATCH v2 4/8] drm/msm/adreno: Simplify adreno_probe()
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
Message-Id: <20261030-gmu-sync-state-fix-v2-4-89d3082d97af@oss.qualcomm.com>
References: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
In-Reply-To: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akisaira <akisaira@outlook.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>,
        Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793380168; l=1922;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=4IwBjgmZtlASF3bKahjtC27XmmmLfOr5jE0Tf4p3+0I=;
 b=31I4AziRK5+9Pqar0RIswLtFl79uUaePJYhCKxMRgXVX1k0FJpRaM+TKifUzVhcEok2rF8Hgl
 uGnViKYuy9zANDEc5IhfAhhJiKWOlXyNh99TCwEKNRodCkO8rXfN/Yv
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX1+TvbhcS3wzk
 dutwL/1C3nMDnvvhe/Et0VpM1CpYvTjfUsa7HB0C3/Khs1/WHNN0YLQ8F5GDp7HgM2hy5Oby3D2
 LSizHtJnnJnVpYeCu5XUZS/URqjcr6pc0JoosJGjobNJkmtoMMIHle2OtTGoMruv9MOk+oINP+4
 FHjBvoq9/KbTPiCFgfVYJvjVWEeepsmICk/mHXeKZI9zoicwUXUZMcuKWABgreMepchq8MCD+GF
 pJyiwKzDMkge5n4r8UOQeXSN0W05N3BBI+GbOVUES+tcgT0vSS1YTnMCuR+D51kJoM3lBWvhyrv
 20iptEO+/wwd5CTu5YuP4bMvLJTnf+SSKVUzrYDXWRUH6FzbeyqaRHjWCQZwY/a+bgN/GwFxEuG
 +0xbMqkHzej4wJBuae5mEVkvVzKlqnxtBhewxWwNLMXC1ayRGU+ycBftpeDlT7Ugg7RWRi9/+eb
 4MebywqCmZSZJ6KyY4A==
X-Proofpoint-ORIG-GUID: swFSpoBVMZXB1aU0IKoYtjsVE_brX9we
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae4cf6b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7EupJXidagRHOzv49WEA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfXwnmCHifprT3q
 fBNZFEA+SUkbQVdcOXeEJmhEybzb5CKctptUjoTipdwBgyhfsUfyWLnbYJNdUeiuB4Bf6l2qwDn
 y0zjwVHmhF7He74BZU/YzAwwH2vbhqg=
X-Proofpoint-GUID: swFSpoBVMZXB1aU0IKoYtjsVE_brX9we
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300068

Now that it is possible to auto detect and create separate drm device
for a "GPU + no display" case, drop the special check for "amd,imageon"
compatible string in adreno_probe().

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 8 ++++----
 drivers/gpu/drm/msm/msm_drv.c              | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index cdf26b38b904..34718adefbfd 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -271,12 +271,12 @@ static const struct component_ops a3xx_ops = {
 
 static int adreno_probe(struct platform_device *pdev)
 {
-	struct device_node *node = pdev->dev.of_node;
-
-	if (of_device_is_compatible(node, "amd,imageon") ||
-	    (msm_separate_gpu_kms_components() && adreno_has_gpu(node)))
+	if (msm_separate_gpu_kms_components())
 		return msm_gpu_probe(pdev, &a3xx_ops);
 
+	if (!adreno_has_gpu(pdev->dev.of_node))
+		return -ENODEV;
+
 	return component_add(&pdev->dev, &a3xx_ops);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index e25ef578d2b3..e0c0f1248d1b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -115,11 +115,11 @@ static bool msm_separate_gpu_kms_auto(void)
 	int gpus = msm_count_gpus();
 	int display_subsystems = msm_count_mdss() + msm_count_mdp4();
 
-	if (gpus <= 0 || display_subsystems <= 0)
+	/* Single card if there is exactly one GPU and one display subsystem */
+	if (gpus == 1 && display_subsystems == 1)
 		return false;
 
-	/* Single card if there is exactly one GPU and one display subsystem */
-	return gpus > 1 || display_subsystems > 1;
+	return true;
 }
 
 bool msm_separate_gpu_kms_components(void)

-- 
2.55.0

