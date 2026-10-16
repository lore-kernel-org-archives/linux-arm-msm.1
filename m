Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9A1377558
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 06:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132135; cv=none; b=tdvREwDLjbrtf5rW5X8WQSfw0D85zHlIUCiEmb+v058IlS83hMSNnKknABxLktvboE3aVh4NU3A3WhDqZzaJbStHcAQatOaD4SBVyzLmlX9m332/1Axir9KgopTOJIQ3IkBn34nqWKIeZAaeMND0AzX1ytIzBl5/LE8mOz3xCt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132135; c=relaxed/simple;
	bh=I5REzZ/WFiqd/PwWnEJ8yf3X+m91kZhkF2ZuNWQosgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pSGcFmVTrjMU/PmM0rTW+mfFYadj0tnDQqpFzRWNkTDsydlTl+c7goEAx/GwS3bRRvtuyyoo1NyaHMDIsJXRuFHSeFPItzSOiT9arbMhrNmEhjeBpzdTB805Qu70c4A4uawtNVNc2PLilFsUl65MhwFHCNqCSqWraFMVmTJfce4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PyjG8TfG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTyQIOuZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PyjG8TfG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTyQIOuZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNfxrE1635310
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 06:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YXJ6nT4HdJEIzEtGoCtJaU
	VRrkJ7BX5U4CPOy6uCn+w=; b=PyjG8TfGJute18KCdlaaJtqAtvBZ+ojqO8qdKv
	TIEe29vopDrnvucua1QxaUVkfpTMT8yBme8+SPGdobEAzLRe6x4ywq0uvZe+DV/m
	21wzqGJmUkzJ2/QgdcOIh0Ip2wj5D0F9GT1RiKX8cEwmsnX1EBKiX1ltc5Yw9C6l
	fMwA6fdrH1ql+H4j1IREuBLSX0GdkMIrUaSUGO/B8l4+Fn0KKhQJPAtDEEDcKKnz
	9hS9V0FKcmOvIwi4cC4v00U72DXj1IhPL7F3faS2wPo4CFZH6mEGznsCVBKwhWmz
	AeXHpShNaOOydOEDtJrrpIAPujOJceRpuGha4sPaTquthTYQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r1170c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 06:28:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab341816f6so6058137a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 23:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792132132; x=1792736932; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YXJ6nT4HdJEIzEtGoCtJaUVRrkJ7BX5U4CPOy6uCn+w=;
        b=OTyQIOuZQ9jf8J2nDmLdFVLXR8Y6HJhpzgOY9D0vL1CssdMzqg4a3EN9nR9wi7hqJn
         CkU4H+viB5fiwRvpSv/tO579jpRRJsO8nBqvL5iSLzpJK5kzXxGdJxKYsM4KyZovzT4F
         rokBS2Kzu0nYqG+DrRM1ZFcb/CEe3MCISokf7poy/KTQGB5cXS5LYG5WztA2RxYigzHB
         kSaMQyV/di+y2zG9Jd9D9ifbnYjg8b5ppZhHyPRbOugHn9QNQep77UhicylBSpxdbK8a
         rOicI42NhLPEcjhsV9rZ7qmpC/15geBvGXhLApEA/36uxW8pP1Oy5P0dSeL1ZG7HKipR
         YheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132132; x=1792736932;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YXJ6nT4HdJEIzEtGoCtJaUVRrkJ7BX5U4CPOy6uCn+w=;
        b=0C+6rISxx3pK2P2S8r0Ojq1weHxYTJEUffltzmFexixvhCwIpmScWqH065PPdeLFnw
         z7ofCsBlur070Zo8xx+XfePR5dsDYfPKG+C86SKMMrae+C6995KP5icxd+T6F9oua0Sj
         DYL3JRY0MiJJokA3qaUDXbqS8IFueW8WkdihIHarjV8ZQpEBOVbW/z8gIG1FY5W3ykt/
         X74P2aFX5+QiVeqKKY3khOUUZ8WHaKOAXb4dlexBxPYPbFnELEA1kLJFSS2COLGBdj/J
         TWLVpygFP72zZFtUToDNfH7iSS8UZBey/5RdGTfuWDqO8gUXuFXI7ZYJ3oYP07D1G1ih
         HFmw==
X-Forwarded-Encrypted: i=1; AKwUvBwqOmzokArP7yJBrrSZsGj/hzlvXHyj9HVxqUhno3TUpwDu5WX2ieYPJZvNu30dJh3xFpQ2vGmgcWLkIk9E@vger.kernel.org
X-Gm-Message-State: AFq9FYJrygKv//aLO9rnyJ/6o15tISHeAPO6OMO+NaFrc8nmgs6q2Inh
	9iak7B1c5HW1rifUsyx03mMrrwroh2iPkR3l/UHblB4ttxBqeKz1RUU9txXa4mZqVTf2ZjFcihL
	S8BP4Vjb4FTULsRO+30cw7762QOY9ry6l1V3+MJVXlfdAZ3GYlKaOL8oaHERqmclviH2S
X-Gm-Gg: AYBFou1Nko5YAaerzKWTqLA5+MRcY0AZDUEt6LXl89HvEP8AUvWL9Z60ny6Zlov8Gkf
	U31J1lv4DRmbMllvGSjhtcnSI3OytmmJN29V8ifO1rEv5EqgMDfpVuIr1c6g8K8j8zwh56TiMJm
	RhuwTDHfP++Yas8EQ/70KzJfgAkf8k2nf6dej+q1qfTplTy2Jps2vfT2cfAi7mTn68B87G8XUyb
	/Ly9IbWZs4UVk0NTBeefKsDESxiOlKVH93X0UCvwVb0p6qgnUXHwfIffxpl9f4AX935/XPyRnNL
	+Cmj5izQaNI8GI3rx/SS8aLvANlHOt/uHJ1yFowBA+qvD0OPeRBKG8X3eyMwhcqJWfs7gVsAZ7/
	jahBxnmvf+hRkF1zj0oLukgfJyJeFU2o=
X-Received: by 2002:a17:90b:4fc4:b0:3ac:c90a:10bf with SMTP id 98e67ed59e1d1-3acc90a1ce0mr1238596a91.17.1792132131589;
        Thu, 15 Oct 2026 23:28:51 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc4:b0:3ac:c90a:10bf with SMTP id 98e67ed59e1d1-3acc90a1ce0mr1238578a91.17.1792132130958;
        Thu, 15 Oct 2026 23:28:50 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947dfa00sm7654274a91.17.2026.10.15.23.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:28:50 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:58:44 +0530
Subject: [PATCH] clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB
 GDSCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABvE0WoC/x3MTQ5AMBBA4avIrE3SCg2uIhZ+Rk1CyRQhjbtrL
 L/FewE8CZOHOgkgdLHnzUXoNIFh7pwl5DEaMpUZrbRBuzzrKXj6HoUO3BxqUmWh+srkxQSx24U
 mvv9n077vBwh9Bk1jAAAA
X-Change-ID: 20261016-glymur-usb-ret-on-1e0850b9645f
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: POF1ezmBq8HtD_klplOt6rmLMHMTz90a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyNSBTYWx0ZWRfXxQT1woWNLoGE
 SoCzWtOe2XoDyM5smdwm9g8LRhd0PnNysqNsjVE8+D1igZHiPFXCloMdTNnjaJ9J/YqlSzCaY3Z
 rYb/qjwGpSmsuevwOTV9TQ95jQF8yBI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyNSBTYWx0ZWRfX/m4Qedw3ohNg
 aa0nqWS3BOVNws/7EKzNSBqfmucs908Xr4swvoskFrnhA8bOi2kwuhWOEQCRgVgF1emZLjMU0On
 2AunPy1oa0vJTIwjT2WKI501I29q7K8LOKgfIIkTQYOJpssmJ1v1p2DfmNUKHfZ1l+uJjb9S2kB
 Cfik3yuo4hhJ6YGu42IlJRlweH4WTk1yEePSFmKMwn+V+idD4zGVhVnTMHkUEW6DgA8OdIemban
 5QY31W7ldwq8dnNzisLFZBYE99jHash0fOJwBWUTirCehN+7XDit97TOTia5XSYKu+/3WpP9JNc
 qOyMoLRwobqqcwDO3cT8+hq1nqUG6UzH09xXMyUMHgwradC+Mi1vYOlI5Hdp9vbFhjCu+5MYNaq
 6ij5QrSoV44cbghmZXGOpdaumZLtNTUK4hWEi2bo//lL6iIxBdqQhH26beA7D9/g+DS6MhcsB8y
 AqDSbYorw5F0w0IZikA==
X-Proofpoint-GUID: POF1ezmBq8HtD_klplOt6rmLMHMTz90a
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1c424 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=SxwTXxdCfPWGaMH8rwEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160025

The USB GDSCs on Glymur are currently configured with PWRSTS_OFF_ON,
which allows the GDSC framework to fully collapse these power domains
during gdsc_disable(). When these GDSCs collapse, the corresponding USB
configurations are not retained in USB host mode use-cases and this breaks
the resume of USB controller from suspend.

To avoid this, configure the USB GDSC power states to PWRSTS_RET_ON. This
prevents the GDSC from powering off during gdsc_disable(), and allows
hardware to retain the USB configurations across USB host mode use-cases.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index be18a555fe314a41e5335ce8cc100ae8ed226ccb..857596210f719b8d9b177ba30edf80264973b6e8 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -7752,7 +7752,7 @@ static struct gdsc gcc_usb20_prim_gdsc = {
 	.pd = {
 		.name = "gcc_usb20_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7764,7 +7764,7 @@ static struct gdsc gcc_usb30_mp_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_mp_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7776,7 +7776,7 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7788,7 +7788,7 @@ static struct gdsc gcc_usb30_sec_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_sec_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7800,7 +7800,7 @@ static struct gdsc gcc_usb30_tert_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_tert_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7812,7 +7812,7 @@ static struct gdsc gcc_usb3_mp_ss0_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb3_mp_ss0_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7824,7 +7824,7 @@ static struct gdsc gcc_usb3_mp_ss1_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb3_mp_ss1_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7872,7 +7872,7 @@ static struct gdsc gcc_usb_0_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb_0_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7884,7 +7884,7 @@ static struct gdsc gcc_usb_1_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb_1_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7896,7 +7896,7 @@ static struct gdsc gcc_usb_2_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb_2_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 

---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20261016-glymur-usb-ret-on-1e0850b9645f

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

