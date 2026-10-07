Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E4C49502B
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363829; cv=none; b=TIOQWzBYgt4eu9Iy9MSKUYGWLLg3LOnI3P3+ji12YAplS6hzW+36sLXUvOzTxDEmfPEAKrHaRgj5w6Z28/6czQZQ8YeaBM2tq79tNYg59J4nkxcfh4mnze4pB7DUFs7fxkTCXLUTOtz4By3rshNNflDYUIA6GsVICR4B+hZLtds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363829; c=relaxed/simple;
	bh=6hQfTpXcWJCXMi9PLy+5xVUK/Z6Ol/PrhtBHuKTtcKc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HU9bha3QUxrFS7w3+4Y86AoBygxBSOV2ckedMDTqFfq9FGJZijg7Y+D3hK+kicu8AzASxDCQNvoHAFmopkXppVGuFpQzGfxRkt74wwPA3/pTY+iuS2+CpbS7tT0gINfD+IkKSO/Wsn8YWjWyS2IO2YUflgZABL5SUIpQXaU6rCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhkB/ECM reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhkB/ECM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jlJn3194181
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YS4pH/oE/I5
	Tfkm4NadULCHmtqcTm2/Hf/Nrx/my0a0=; b=hhkB/ECMM36N45R/tmGA29qRd/1
	1iC96QF2tuHR9middIprrREFjhVDK8fzK2a5f4YSbQ1PJZQkobCG73p4W/MN6wEi
	vjh7q7U9kI9OykbgLF45g5WAC93Z5Trt912B2WQkuAkNbik+L7UdTqy+FEgr+tWx
	kAqAO2NBFST9+BIdulRXpuOGmelovBF1WsaLB4NtfLqgTHEX90YdyRAfhaqLjcsS
	Xr+4h+l8CVuUi4gBc8v1cwE8njHbu256FgcG+eip6Pkoahr7zYn2W8O5pV7Q/6kZ
	vdRV+tlIIm5ImJDCna9LTIuBvZr/9f2qb1pwywzsxF96pNyfxRLEnlMNOJg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541ukh6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:03:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so701302285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363783; x=1791968583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YS4pH/oE/I5Tfkm4NadULCHmtqcTm2/Hf/Nrx/my0a0=;
        b=F8xIjXr419xj9gzO/pS2BYMFqyf3xkeFOhuU0p1OuSIFVFuNxFKEFnAd4tNlO5lfpT
         c0n1fGTZuW68WDJKNetN7SufxBmMfFiroDxZ8X9hVD22Ll6zQS9zqH/jPFB0mREHUTf6
         /CHTTkKkvbli/ETIlX8AXfxi3ANEIVc+BBLFTFptHcXTNoYRjM9SbSIZqxs3zG0ZlVkf
         fOSPgfRuGJ58KO6+spj8jBmFCDttwuAdcLVJ81XoFiX4rBotri+Dd7PoQAowc73aVYXs
         nQNawaLwcaT2k7L1raprvWcYhJiqNBJdZnMIDErdc/fwVFKfVcs6lUXTdtefnLx/qAYf
         NzXA==
X-Forwarded-Encrypted: i=1; AKwUvBwwcfergJP5rg158OgpqYu3e0Faf7rG/CMu/FGYkdsCFDu7keoZqJJq5JV2DZAq9pc8hrhds2ibTaWXFkML@vger.kernel.org
X-Gm-Message-State: AFuF++mbJWQ1+6r3TVj4BnAjBKoL9PSfAGoaFUs+RD4MZdyckiAj1sbi
	SbR1Hsdvg0OeGWWBovsNi8SKBf1ipBwaEJVHVVc+xhFw/Sd0jbY7eeAf4kqwvQyd8X7J6maeqhh
	SIKkL3cFXUVDOjaf0swOUo9fesJIxhgpi7zwefqQGWlQyTn97IbR+bQd2/Sr4wZKyYAp2
X-Gm-Gg: AYBFou11QltjWXdLbuvZup527zlFbDCUrb1XWKILOSmcGoTnaMUiU7CMT7MXJlw87Yy
	4kHeKwVZAUvbxdCgyokA+wq2k2meeWOgyWyVYXNGlqh/14w8tW/ffmoKWrsiG79LIYj52chvyNV
	Tl6XrRtXE7RBZsprG1FLEDpXfbwqAHzyh8to/tI3zk41ljG/t0mubI2r2JZ7auIgaqSTerbQIs8
	S7G3fu/F50XX05eJyXTM/r2UIL/MPHPz+ltTqjEuhT58wzw9cGwAEk3OLJSgNr1TkjFh7zMVoUN
	bu/iT2DqMALWqISGQLWymrZkUpNBvST/NloHos8vKig6qQkKs5DenGZKLxQ=
X-Received: by 2002:a05:620a:470b:b0:93b:d7a0:d9dc with SMTP id af79cd13be357-93e9b80174amr315314985a.54.1791363783076;
        Wed, 07 Oct 2026 02:03:03 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93b:d7a0:d9dc with SMTP id af79cd13be357-93e9b80174amr315310785a.54.1791363782645;
        Wed, 07 Oct 2026 02:03:02 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:03:01 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 40/45] media: qcom: camss: sa8775p: add AWB BG parameters
Date: Wed,  7 Oct 2026 12:00:36 +0300
Message-Id: <20261007090041.3732717-41-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Nu9C0shL-U07hrO8Aajwsa0z6cbUTOmN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXydHh2jhKm/hf
 mVybDXAUv6/dSLBnhVYtMDPGwVPckgIgt85+IUhoLT0ZVN9fzW5gYjqXCEd55Zt5bazP0o/Xfyl
 isuftoJRTJfuYkjRIcn67VsTxnH7tSY=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac60ac7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=aZ-3kUUx37z8FZvU82kA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX68KwUXCyVswY
 d3gNKdb8OmLgZePtbj/XLt12hHMDNxpntXYNFy2W09TPSF54ghfV1h/pRmRBuHq8qmLXCCMk3uu
 HwkksCdS/rRAk+qjzSp4t66wO2Msrm0w5IuMDuFj1D+OAwf1p8J4CsRBorn6LlkCHxeRnTn0Bh8
 sB6VM4Xu/qZrvhbSIt5bcyBF4dOjIGl4hCCS6sjzVlKRgDqUAG+q0DinWwCea2PeJz9A5bguJnZ
 fsmo77zEtAgFLpw9EMM+E1v5o1fvKNQRzv9HfIWK/0vo/md9eC90WdeeNxJdwC+u2bPN/sS6RxT
 eoRaf3kA/fD4nSHNAtb1d/fzqnmUGKxDECB83qYLuKoozJ89ZexsUbUX8HFOLEMx0HFB1OaLlTL
 bzZXaUKW3pGS3IQxeXjx4w8DHMgeGQyYyh5QTYXqD97pneFPwWbCpD/b4L4S49luE6hmz0Fa0si
 ZnmTif9DbmNS+aRtOdg==
X-Proofpoint-ORIG-GUID: Nu9C0shL-U07hrO8Aajwsa0z6cbUTOmN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Configure and control the AWB BG statistics block from IFE parameter
buffers. Derive its grid from the active pixel-path size.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-mod-v41x.c      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
index 3c53f585133c..b35a3f375026 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -678,6 +678,17 @@ static void mod_v41x_params_apply_gamma(void *priv, const union camss_ife_params
 	mod_v41x_glut_apply(ctx, &block->gamma_256, enable);
 }
 
+static void mod_v41x_params_apply_bg_stats(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	if (enable)
+		mod_v41x_awb_bg_enable(ctx);
+	else
+		mod_v41x_awb_bg_disable(ctx);
+}
+
 static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = {
 		.size = sizeof(struct camss_ife_params_color_correct),
@@ -691,6 +702,9 @@ static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[]
 	[CAMSS_IFE_PARAMS_WB_GAIN] = {
 		.size = sizeof(struct camss_ife_params_wb_gain),
 	},
+	[CAMSS_IFE_PARAMS_BG_STATS] = {
+		.size = sizeof(struct camss_ife_params_bg_stats),
+	},
 };
 
 static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
@@ -698,6 +712,7 @@ static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
 	[CAMSS_IFE_PARAMS_LSC] = mod_v41x_params_apply_lsc,
 	[CAMSS_IFE_PARAMS_GAMMA_256] = mod_v41x_params_apply_gamma,
 	[CAMSS_IFE_PARAMS_WB_GAIN] = mod_v41x_params_apply_wb,
+	[CAMSS_IFE_PARAMS_BG_STATS] = mod_v41x_params_apply_bg_stats,
 };
 
 static_assert(ARRAY_SIZE(mod_v41x_params_handlers) ==
-- 
2.34.1

