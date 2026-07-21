Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CB92D8DD6
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637991; cv=none; b=boNR9v76l0xfyfrq/aqd9iOC83INWeNt2YghORIv7cqu9Ni31CsxTRYgIipeWzxiRnG9Ft/7jLrKff1F2tbVcSIG/aeQxNm2xqgEugCy2bLuX5NlNS4ZHEbpwU5uxY/nTzg2i2AmZHD1ym+hPjULYSQEOP6vmaEFwSjH7tTkN0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637991; c=relaxed/simple;
	bh=AjoDmpHbcN76XduEyve2UBPFfadSqhwyHYraDBdMIsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ij93L8zJvpbUXWaiUJHVxsdDxk/2idXRuYSlnwgQDbS7E20gZk6xtOiVkRQdCEmPLd4urwIwX76H8AuJLV0qYpzwlQT2oWkRZp2cc3sMWVKG6hgSAxERM1D5xG1s7gMFpbhMqJ2Yxs3ZILSEGUR4vK2XYwqycWZunmWb7+3kT6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h59l5VL7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aT2dBGQo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h59l5VL7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aT2dBGQo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARPbg1229989
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oxjDyX5v+4qOsl4cGEDUpeITUFz//t1/dWE1Bf/g6m8=; b=h59l5VL72ElO7pyp
	CvYt+TQ9M0OkPxzJ23AzBRGXqLj8zTViJdwDqTAGFbA/6r0Qk/w9ZLflm1oa07W9
	W/YuMhjMdyIEYvxNjHffpw3n+wEIhuggl92lLpeKdaf+sS6wCF2CCtngJSSN+Pyd
	zTCXTGGauNWNFpMMPJ9b1FB1vRE/ICWNcPhaXUIzzV+3GUllYWAqTxasXFhKFp9L
	xNl0JGKZ84rJ7eDXAzfmHb3N+T4tXZWgwXKpkHB8vuH3cTsIoiFXVuWZXMyc9JZ/
	N87QxpUxIjphpM2vJIpd5vwYfmZQgctVEMLvFbmiHq1bleBlwbd8rr7IoNnMKvfc
	WZNeVw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj01aar36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce870a060so196363585ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 05:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784637986; x=1785242786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxjDyX5v+4qOsl4cGEDUpeITUFz//t1/dWE1Bf/g6m8=;
        b=aT2dBGQov/FZnlga5u6kZOrnawK8nHHWhPsP3nsglv04U/dXu+pSttnL3leD10BJP/
         U10qvgnz87zwtZ58XWRFwqB1gA9ogAwkVDNfh/mfR4TWOY9dE9CC7xu69P/0o3RsqTfP
         UOTjvglykG/8++7IfM38Qj5C0XN+TsgNjMLXviOXGycEBlM5IEWTdT7x/OC6WGMCRX71
         nT7hcRRYtgk0T30tUJlctmoraHhELzJJY6rpkAiKTt2GHkrnyuvG42rUfb3TCT8FupEl
         XU41z+mrY4KP6JSj8KFwjrX6Ko4dUrRXqjJHsl9PmnP9xWTYEGD7MFK4vFhKkA4bM7x5
         uO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784637986; x=1785242786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxjDyX5v+4qOsl4cGEDUpeITUFz//t1/dWE1Bf/g6m8=;
        b=dOSH+ijmQhKWzmq3D1FH2jWGYWT211DvgxTt78wzH7+FBV49t0TgEuoBv7ZNu7SUwz
         llYFpr6ESMxk2GvN7ahx7/sBqSbnO1hpRU7OPzDLAuOcJTgLr1ZquCc/MOg84AwRCLFQ
         BisFkob4eItkkn58lD1U9cqRBbJoMyiERKNUg8GwUSNMh/FmFI77VWBP+0TSs8WinP1b
         aOwFRPfygj6N8ZojO8sp+9tUSVYrO2mMEjpGyVTLv1djmVqVkzr8U8rKooWz0rstVzh6
         XvvjZe/kKFUovTHzknNUBAEja0fAYKU5vinpb2PwlcpE8qnhZnlQqz+dhqHM/sRlj2EN
         2r/g==
X-Forwarded-Encrypted: i=1; AHgh+RoZ8xnilfK5fjvLVTtjoCGdkSpGYHVoOUAV+4VajD7beDkO4+CQRdkHZSE/QM6Kd9JrtW/Rg31zGRrTPGtu@vger.kernel.org
X-Gm-Message-State: AOJu0YwDf2lV8Sek0bg/UQug/P8C1IhP7CPMySqm8WSPNHv0vUVZAdpu
	/K7s/K8pMxIhiwc89aeH+ttafR30Q98OargGy/r+kMYEaoz5/jU666pU0naKTzdQovjBq41h/+A
	IVobkgMEa6tyLYuamyB7fw/ticSpRXNhriGvgtPOjSMjt7CD3V6dMkl+ZCc9fTzYz/6Mr
X-Gm-Gg: AR+sD10EW3bTOGcy0Le/mWpRLbkvgYkMAcoMbkUQ10RLXiojfb+XBfTYuX8cxez4dq5
	oaon2y+JGDBh6herXE0Ow5/NrZWHg2V2Ywa8/1x5ezFBg6XfOpL9gX2dklqsDl6FI65oXc6V+u/
	ymjWZ+NmIvqJp4Gb7EeK7opNd+66ZuNbPY4+9d3xqr9Dbwm26UZ4RgRqK7OeEx9HzpqjZ7mI8Dh
	0bN5dxOxBYYQjLOqxmKtBxYLTfS9+u3+CAeaXMMuPLCMYtcnXR3mLRk0MMrLGTfM+P2F00F13xi
	iYf/szFqhWalYGPYml2nr2+uTNCgLTcLFRbBjJ8S0pYDYnBkYZZJNWs0uoDmB4m/kkzitsIfFAL
	tSrOXuqLDHg4zkA+8NVepysJXxZb+smFLD+mwPviSzt7jvSZuXxhy4i8=
X-Received: by 2002:a17:902:c409:b0:2c9:97a7:71ae with SMTP id d9443c01a7336-2cf349ccf01mr210057225ad.41.1784637985891;
        Tue, 21 Jul 2026 05:46:25 -0700 (PDT)
X-Received: by 2002:a17:902:c409:b0:2c9:97a7:71ae with SMTP id d9443c01a7336-2cf349ccf01mr210056745ad.41.1784637985433;
        Tue, 21 Jul 2026 05:46:25 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bb62sm45258359eec.2.2026.07.21.05.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 05:46:24 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 05:46:05 -0700
Subject: [PATCH v6 6/7] media: qcom: camss: vfe: Add support for VFE 980
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-add-support-for-camss-on-sm8750-v6-6-a5f841061d18@oss.qualcomm.com>
References: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
In-Reply-To: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <quic_vtumati@quicinc.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=BL6DalQG c=1 sm=1 tr=0 ts=6a5f6a22 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pE2PZHVjcnHk_FJroQIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzNSBTYWx0ZWRfX35FYr7/u39On
 gWV4Fs2OcjTvtEy5JTp2PVHONrODHlw172osez7bt5GxdCL4k9eFJnKLQksieD1Qh/wqwoDD5c+
 TVCRaZd292ODvE4WO5XsoIEGwWPy82WtQvwW/EgYcoBJE7e+AwyO6jgKxJeP2i+Z1w49H4nipgi
 erD/zG1CUtjYTBT6HCIjqFr3Yz2uNHc7/kQX3RY7lMJTfTk2JnJZjzt/qPL1wqYPFo/5a58AMlR
 wEclvu48/amtP13NQ9hR//3SKEiH/b+DAS/YVIkSFmWTx1guKQG7UwvNaByjf6XTVIVyQij7Sw5
 BZzibbqzW84jUNPI8/D5l+3XbLEx9FCUD7ey4e3mrM7NJnYCIgktfTY3R54oUdCxfLzP79dC1sj
 c7H6sBlfCjv0zvvGsuuA+e+rofDgFpbJJoGTYQTHK4nXZ8fT4zXViVwEpKtg7mCETydc7sTKtM3
 fEKRqhjB40OGzKiqW1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzNSBTYWx0ZWRfX0Su71Tq8TRfy
 ZS5nP0YOQ9o7u1v9/4b4JD1B0x8VQzCatMZW1mPuIQ/LUVA4QQUHUWBlVGQ2bXLLaMAaxOxAr+p
 hw0vXyxzsGkY1QCPN3MPvW4hWgLhDHI=
X-Proofpoint-ORIG-GUID: pryqvuyFniDCJ6_w8DvA6LKGfoOwvv7k
X-Proofpoint-GUID: pryqvuyFniDCJ6_w8DvA6LKGfoOwvv7k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210135

Add support for Video Front End (VFE) that is on the SM8750 SoCs. VFE
gen4 has support for VFE 980. This change limits SM8750 VFE output lines
to 3 for now as constrained by the CAMSS driver framework.

The cpas_ahb and cpas_fast_ahb clocks are enabled here rather than in the
CSIPHY resources since they belong to the CPAS/VFE power path, matching
the Kaanapali layout.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c | 10 +++++++---
 drivers/media/platform/qcom/camss/camss-vfe.c      |  2 ++
 drivers/media/platform/qcom/camss/camss.c          |  2 ++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
index d73d70898710..46d8e61b9bac 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
@@ -13,8 +13,12 @@
 #include "camss.h"
 #include "camss-vfe.h"
 
-/* VFE-gen4 Bus Register Base Addresses */
-#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+#define IS_VFE_980(vfe)		((vfe)->camss->res->version == CAMSS_8750)
+
+#define BUS_REG_BASE_980	(vfe_is_lite(vfe) ? 0x200 : 0x800)
+#define BUS_REG_BASE_1080	(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+#define BUS_REG_BASE \
+	    (IS_VFE_980(vfe) ? BUS_REG_BASE_980 : BUS_REG_BASE_1080)
 
 #define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x08)
 #define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
@@ -55,7 +59,7 @@
  * DISPLAY_DS2_C		6
  * FD_Y				7
  * FD_C				8
- * PIXEL_RAW			9
+ * RAW_OUT(1080)/IR_OUT(980)	9
  * STATS_AEC_BG			10
  * STATS_AEC_BHIST		11
  * STATS_TINTLESS_BG		12
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 826ab85a44a1..ffa61ce021b4 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -352,6 +352,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
@@ -2016,6 +2017,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e0b181ff33aa..011ece0a7692 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -6160,9 +6160,11 @@ static const struct camss_resources sm8750_resources = {
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_kaanapali,
 	.csid_res = csid_res_sm8750,
+	.vfe_res = vfe_res_kaanapali,
 	.icc_res = icc_res_sm8750,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 	.csid_num = ARRAY_SIZE(csid_res_sm8750),
+	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 };
 

-- 
2.34.1

