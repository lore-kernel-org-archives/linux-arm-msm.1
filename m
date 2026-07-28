Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1353242255C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234127; cv=none; b=cJRbD9VNiWjr72dJWM9iY039kpwnoYeMeoZ2gdgLkSfBYYoSMF63kQa1Uk7DWU4OJ/zyMoT+KFTE0+S1/THFvT/M/im8jR32eRElotw1W2xy8ZGZcj3Ra3MmAjZ0Orxk9f+rn14gTla7WhABOH5DcOT3FZME3RjhRV/po7gHmwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234127; c=relaxed/simple;
	bh=WPiichk/g/c4Wd3ZWxdK0RvBoQIuZsodOORMITxa0PM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gF3nCLIQvoJbghhuPK9g5ibdxAFCw+YNhS6Qr6u8Ke+zCB7knnI1rdwwcxS00F43IyNUNxCzAe11+PzBiF53P93yhUIdhFMy9aMXvR1SsspIdtLRhQY/jjkiNM7WddmbawC8Cj5jxHZpuQ24DXacrZcAFSIKEqi54R0LUrhi+j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hY3Nuz7D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EiOHikPe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hY3Nuz7D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EiOHikPe"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82Sd42027070
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7uzgE+rC267u8jTFEY8TUSnxJvWKuyiy7mmko8m7xjM=; b=hY3Nuz7DRXx/DQee
	FwOP8TU9mXi5X5rejLbNEb67CNxwYGEMSb2swVafPRpsXmoMNsl+OguvotUnffR1
	OZVWetz8pskjytw7KXsAdJr5AAWR74ljcE8hUmcsLu45RIsaDuoAcRA3DZWrDsVf
	lntPjwYrLAJp4kaDuV5Do1uoC+vWll+LfQmZ0yag2ruYAGveZOX9MXbNljqrSwHz
	gWZcwwbwT/vfnYNicMNpy0olHIQ+NV5uxIDr/HMnrEfsH/voWy34EjUolURXlzaK
	S8FrqNy7rpQGfMIFtJHopf4tiSxeDMmT2l0db3fVTnbYojCPjcdpPhgmWqzjLoJY
	TG28bA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpq9hgwqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-907e49dbae8so29471486d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234124; x=1785838924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7uzgE+rC267u8jTFEY8TUSnxJvWKuyiy7mmko8m7xjM=;
        b=EiOHikPeqYIJ1Y0gVN/loC/qDM9zJH1M/WGDXU2B/B35ODLQpMGPF4aDn8S153TWWb
         IT6Q9o1YsUTHislgngYgqsDjpj1EoO2dImgEgMe3SJkPbPFrX8myksFWdAyC+HhWu/Zd
         +GuptQlNRIeDwc/Dlb5zVJP8HgH5TSgaB6ZxB+OErfB6r8tLaW4AeLom28t4Gh/vRXpr
         4JJ5StFTJ5oHALiymLFBkE8+Syhvr3nsB8xD48BpDzk01iqqCSwF71j70wfEDDZwAbEK
         6X0epvflrorYCJlTGs/Ew08H5F/J0G0IXWdg+dzWrTRe9kazEQvq2lhdn2Mc/5cJUmuk
         8nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234124; x=1785838924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7uzgE+rC267u8jTFEY8TUSnxJvWKuyiy7mmko8m7xjM=;
        b=BFGMJZUjcHMuwZpODGGKIDRMlb65QQ6/3CJdnLQ+QR+lZf/UlkW2KLa3PG/GobFdHW
         h1xsodiASMWJMow5OtlOMYlOLIoD40SQEMvxCpXo+RDbjqXKJbdAvdrT3+uz69AMEiPf
         d10ZqO0fjLRrVfEKrKIqDrUKqlt9/PIhG14aZxieniF98E4Y938/RsE4DwrS+l+7AoNG
         aEjL0e8NOa8W4IQqWcTqbresdj8TnAuYZfdR6QhVUqddY0p2GcUuNpiOuSN82L2QuONw
         aYEH3ub/SdOB1HisZYoexAivbWt31FuFI63ksrHEGkgfKl99YmIIfG/xr5kXbsggCOtV
         Xn8w==
X-Gm-Message-State: AOJu0YzUf6HUOtKZTILZm/xNm+1+mQAhdqVjPTgPfT+HPAoet/YeObSP
	3nXoNqE0f8MUcfHQtC3ByMaZ880OY1JRtMsKF4xLpg2KuH6LiQ6gQuw3kx8k+NAVkTVKEOSxa/p
	VxClFZv2VJD4zggdrWq6jKtLeoVL6igo9l2v3H5tzHL7bHKCF5dUdT4nlCVOITWNghkCH
X-Gm-Gg: AR+sD10M33DiUZGAPEe/D0UoXDjUogjT4rN7KCAiyPggOdfQZBcMrx5K2sz8mvwgH6T
	heO/x6GFSxAWDEC3xw17D2KsxjvCxDw4g7hlR+vzM7nm5W4YTrv1ULLba3VyF8rPX81nQpf2+BD
	20gqwP76U2GD/OZCrqsQtf1l6GXLv598QDw6wpaWY2wiU2bLGsrxtAQm0EAbokK1smvngClMQcC
	QBAvzNls3wpSIeZZU9zmdtISsBizmcWP+FuHt3vku4qFyc2AM7MQoIQWOCgHVrhkYlR+Ak5EfUK
	qQXgYignzRicjAkjhGO4tjBdU5j5bGSJHnLehNf+c4Y8UKgLjyUTyERbPD3svgyHcDAEKTVYGBL
	kwJ7r4PQUZ3AyXXx3Ejcbg8h47EfejzNzb2i362EC3NgckCGweD3QG/sah3N4Zks=
X-Received: by 2002:a05:6214:3bc5:b0:8f0:47b2:5734 with SMTP id 6a1803df08f44-90816f63bdemr16685486d6.7.1785234124224;
        Tue, 28 Jul 2026 03:22:04 -0700 (PDT)
X-Received: by 2002:a05:6214:3bc5:b0:8f0:47b2:5734 with SMTP id 6a1803df08f44-90816f63bdemr16685216d6.7.1785234123742;
        Tue, 28 Jul 2026 03:22:03 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e869ba73sm84791396d6.25.2026.07.28.03.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:22:03 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:21:34 +0800
Subject: [PATCH v9 05/14] drm/msm/dp: extract MISC1_MISC0 configuration
 into a separate function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dp_mstclean-v9-5-f7779fce10f4@oss.qualcomm.com>
References: <20260728-dp_mstclean-v9-0-f7779fce10f4@oss.qualcomm.com>
In-Reply-To: <20260728-dp_mstclean-v9-0-f7779fce10f4@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785234095; l=2097;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=WPiichk/g/c4Wd3ZWxdK0RvBoQIuZsodOORMITxa0PM=;
 b=NUYtIo561adU4Crsh9D8P1fdJiHYO4kA7cyxobyq6fL61DDl8pAZo8k34UCNHVYQUXVlTZFEF
 Lv4KxKimNNCAM7KNx1RszRos5xW2NGeZVyVN3XdcE+G3HxxHAkIJwYL
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfXze9tlAlQzHb0
 jVEcBhpb5/q2D2XxTYt8RdffrUe7v6powQoT1fkV1VTl5ENKw5O0GW1DVv7ez83gAqmVRfpHPlR
 3XCJxDHd3H7q8xIruzOeZJdaxzqLyH4=
X-Proofpoint-GUID: ZNNRqf-imkHO640uBuU-bLO80WmvW_B1
X-Proofpoint-ORIG-GUID: ZNNRqf-imkHO640uBuU-bLO80WmvW_B1
X-Authority-Analysis: v=2.4 cv=Aa6B2XXG c=1 sm=1 tr=0 ts=6a6882cc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8CyK55zjPCZzEff5TxcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX3dc8cDPmKNXv
 LC5LQZZA2HnQ6iStz5PGxPNzopw+0wSDu1ivhHR76IO6nAtsQBLQSriVxQJQ1K0EwMVAaGKrc6I
 kgIYW0vCH09fo3XMexdOLLmqpkgtSjQBI1Nb5BszT9M5FNl80L0sC492227ATl/wpL5R5k0Te37
 2LlYj3tnmzmhIEF93KV9Qx3ZF4j6Ybn863DcFx1nKp/BKtjG5keCzox5wtsT1IDHcpJkqutWtId
 Aj6R/7h1Nlcqy0ngGwzGoBkatKaSbdVgMuGO3jrAyaMULD8knbBXn3ACA9zhq5KOxWE4GpADxFx
 rbVsV1XGDFi0QqyTbpjnC5J0FUPhICcfq/Nam9c5r7N6xy+Z3q5AU5CNZOtwlHuGFEyp7lm+/ek
 9hf/CImDnVGNi8XuiesJAIVwl0cjCEqTVj9V2iB6frmCx8W3vD3Div2d/2BvusUZm96ZGdDQSLY
 +sSbvBoFF+AylgVoZ6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280091

Refactor the MISC1_MISC0 register configuration into a standalone helper
function to support MST.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 7c0649d5318f..c557e0f01dc6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -462,17 +462,13 @@ static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
 			ln_mapping);
 }
 
-static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
+					   struct msm_dp_panel *msm_dp_panel)
 {
 	u32 colorimetry_cfg, test_bits_depth, misc_val;
 
-	msm_dp_ctrl_lane_mapping(ctrl);
-	msm_dp_setup_peripheral_flush(ctrl);
-
-	msm_dp_ctrl_config_ctrl_link(ctrl);
-	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
-
-	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
+	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link,
+							  msm_dp_panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
 
 	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
@@ -486,6 +482,17 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 
 	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
 	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
+}
+
+static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+{
+	msm_dp_ctrl_lane_mapping(ctrl);
+	msm_dp_setup_peripheral_flush(ctrl);
+
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
+
+	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
 
 	msm_dp_panel_timing_cfg(ctrl->panel, ctrl->msm_dp_ctrl.wide_bus_en);
 }

-- 
2.43.0

