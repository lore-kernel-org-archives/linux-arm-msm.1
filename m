Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD38372685
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812014; cv=none; b=Wgt7B8eVXBocai9j6NaLED0TF+lUajO1C0dt4PvMTbCkcw5ddMq5PLjFucspPF3/J4Yqsxx+NfS2sguRp23IwDnEtzpvJXa0N8X9JcINLa6VNicPuVoIvqO1J+RXZCo9rkCm+xbjBiAyBaugaDtySouZfjnydmh7m5x0NCY4ZD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812014; c=relaxed/simple;
	bh=abtvE9SA+OSC44J14adMJZemnzeHPDaOOWMA7+pZgL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jSQSIR3NexsrBWGP0TOgKE1ZimcH6712e2YUe2dvytP9guhm1ZIOi99d0jIVfOLvycLPEiCmDrzlniKHZpgRo63RKBhmeQGarqebb7PFYtjYaRX989gMaQYneEKHPnr35/7smt/S7Et9hWcYkkNAb3B38vaXldWC0Ihit6BEzWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1g/JLZm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gbte36tV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1g/JLZm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gbte36tV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0UXt3293118
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1BgydbxL5gnFgTs/5vZY3z8HM12JSjWAliFP2DRtg+4=; b=B1g/JLZmBYih41fz
	Fo5K7Q2TMnwJFApQt6m5QvfjJVScozrcilJYbcHVCkhIisfwOi4w+di2folhzcYh
	Ov7FMiXD6g28n5tRQ4+wtlbA2e72nP83oYW0fL3r/vAx0LjspyeuIT1Uk7OkNoJd
	JoGpGZW3/BX0oVzJSFJDHBLMDiDHpZdyeaHHHjpL38JVGBOsEx7nSjuvymgqE1/2
	E6qVBbYaHYOrcqR7MB1h1Zq5yIlXt2uqcQQO1ZQKkbA3sqIs5QX1TXj0063E3sr2
	2/P/qNTUnxp83fxpyFPel/Uk523pBuI63rE2BZg7ZRr6BZ8OAKhye3CrG52pIBLH
	YE6irg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3hhpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:33:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a0c25def6so2281620eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812011; x=1792416811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BgydbxL5gnFgTs/5vZY3z8HM12JSjWAliFP2DRtg+4=;
        b=Gbte36tVzAr9dcRpoumW33i3KvsKdCTgD+Ap7KBAsKvlsM1XHii1jqsgoY+zW9BSz2
         h/K1kSMO0loz4So3h8VWVWR1tg0IO8gUV0id8xsAN4qIFJCNaet5U9yjVdGt6yeoEJCZ
         eNAx7+m7aULMxR3tCLmMuaqpxT1Mz4ZL8brOV3GJPtradYnLTSC976R0pMKzsG2Q8Gr+
         2UjgyxSSm5sJym3sCdOYumvzy0QAabhqaKk1s2FJf7xlnC2ifYaXwvMWI5KcdwNMwsr1
         3G5I+W9N4remMCueeJDAo89YXcY3aPKr0xY+bd9+AFziaS/YoEYTCxC0z+KDTQ7HtubZ
         1y1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812011; x=1792416811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BgydbxL5gnFgTs/5vZY3z8HM12JSjWAliFP2DRtg+4=;
        b=jTRrFLzIbuk9CouKEXFXWcB/hAB8AHG++IFv3Z7R6H3Y3DTl74yYVHyzwa147vJYXo
         k1dZpRnR4oD8y1NnKaPJUSmqMk10QxXR3FF9U/IqgB7w019ipKk/srpnqDWsXfFs2TZW
         6vsysvSyjD/brioq8F6P3ad5KLwBdBAaa0J2ObOujDQytRhIU+H5bhQqN3U/xcs148tf
         UiaSCXic+txsHPk1OjNx6NJqaC1ccTe7+tE9/KrY6WBg93g8638Ld4sa8642lKVY9X1Y
         MGZxeVrU0X+M+zHzM7P23hFazApt2uZEZSxlVF6xjzaczJG2zDUvv8Q3xS2ljpN5DT7E
         4RCw==
X-Gm-Message-State: AFq9FYL0Cibcon8Lz3guh770hGdlkAsmV0M8TiLFATe8KsokHrgiwjvM
	Rjtioyy30FgktlvwUb3UcZYw0Im26iiXDrNDXdv6tJNC+EWQrvJ4zjKkXLp8VJvMM1kbzsG2lYH
	Qat9j16w+Q30gDTy2uLDSvd+sFF0yMQt4FhTM8ayHNq77Vdw1cd2iGJpetBBnz4eN6fhF
X-Gm-Gg: AYBFou3vYjukSiMLaaCae1i7Mku1vKutIAu+SUg1xzIB8sNZ+2b6aYDUETrqkC1ciGb
	DJLXTSFFP8S6/SD/J2xHLpQsYfeosll+/icUm77107O/eP+9WdJnA12qWuQGZ+G1e9tQjT3LEp1
	nos+4JTWig5dzIDFz1Eyvd357g07hjIHzyl0zFVjv24/1Asvk6YBZ+0sB0OZVFhPHeDc19+RSfZ
	INKM1+CW/Hx9PySHcmWMFHrBzYF/nbHkLx2jO8TN26S0z8y+kSsvHDZFnFJQdDNql8muGpabLPi
	ZNzH2OUFKhLJ5+ayB5bOmjdOgbFjfFuMUlbLgeW/QCLPwUuXflxpQJh1ZnQ5syfawvRehiEQHBX
	LPWvUPQ4qVhR/d2SMtGqB/N73ypk=
X-Received: by 2002:a05:7300:cf8a:b0:351:1ec9:aa4a with SMTP id 5a478bee46e88-3537e063a23mr11970355eec.26.1791812011437;
        Mon, 12 Oct 2026 06:33:31 -0700 (PDT)
X-Received: by 2002:a05:7300:cf8a:b0:351:1ec9:aa4a with SMTP id 5a478bee46e88-3537e063a23mr11970325eec.26.1791812010749;
        Mon, 12 Oct 2026 06:33:30 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:33:30 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:16 +0530
Subject: [PATCH v2 06/13] drm/msm/dp: Add support for DP controllers on
 Nord
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=1767;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=66JtXzji1QajcVRTK89pE3DM5ER0MuHJ654ycwA6qSI=;
 b=kB21rf3weXGt0FrypFIMvBPneNYZUAMZ7x1MMLTq7YnZY9HA3x+wh0ohqJGZrdtL8m2dfzOT3
 pR3PyqDrrXrDffe2ucAKIJJQcpIRWRlC82ciCDP7B4PXBDbbPK1pL8K
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX0YMDQYHk2EGm
 3q7bcnceYwZh3nEFnnqOPipNzy2RKktr6qWzQhagoDDL7cgiY36P+ASz3+t2pFScxhqEojxxXJr
 9g3bCxoHXYxn4CVEmH+6iYYYrEbLsD6JHa1C3L1iMT2ZHU5jTXKzZ1gbIRyNTFVWlA69/tikK5A
 ZB1BHx13sY2D9vBfIArpN57ldkSecugC0L2iosCsjXs1Kb1BADDIwrCvZlazmWbEM0P7GH13PEJ
 1MGWfJc45LOPLcSHcH/NOvnci9uYdOr/NBozH+cS0MJzGqMlKMiiwCLZocggzKBY0WS4V5GC62L
 cXLaJSl9xylj76paK+GrQ3zS3NRtoi4D7TSEZyGFWbEsFxy1Lv2ltd6Ncfqtv3bz8lhVYLYAzLO
 zhhCh6XGNw/quRdF20g4mm4voAxKiM17qGcfXpikTI6Lk2DaM2/8dWvNR5E+++HB6HPT5z0K0zL
 B0QTaBI+S6r8j62AFMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX249pj6fddDIj
 XStIpuagZHvtoOkOouwpkrdYjm0wGMZfJfVXvaWM4/+yPkYpisbEb/H6h9PSMq1pREEI/ITOYLF
 VFc9P9chGWmhaWGa4cZHtOSqx8bQzkE=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acce1ac cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=U3LaRFsynPqcHeHyg24A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 8EBLs-OAlQO0k2jgU-s2Q22S69TReKBB
X-Proofpoint-GUID: 8EBLs-OAlQO0k2jgU-s2Q22S69TReKBB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add the Nord DP desc and compatible. Nord is supporting the
four DP cotnrollers, two per MDSS instance.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bc646d172abe..7d233da396fa 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -103,6 +103,14 @@ static const struct msm_dp_desc msm_dp_desc_glymur[] = {
 	{}
 };
 
+static const struct msm_dp_desc msm_dp_desc_nord[] = {
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x08d54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x08d5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{}
+};
+
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
@@ -161,6 +169,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 
 static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,glymur-dp", .data = &msm_dp_desc_glymur },
+	{ .compatible = "qcom,nord-dp", .data = &msm_dp_desc_nord },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1

