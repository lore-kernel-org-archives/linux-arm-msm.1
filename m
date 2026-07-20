Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38063939A2
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527884; cv=none; b=cXXKIdFaRH9eSdz4gnPaQuy47X6LDGOJzJ/1HbKSBNDMsDdH8ZR9CZnbD5pc9jg1boaP+tNX7CyP9yn6pK+KlM2BypuZorlBxA2Mtvos39EoPV4mmW2e3mWVqkQSqVlpSM2/2lTuby9BEpIQDJZyvJL5Anv53PBdGftq90Mxjd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527884; c=relaxed/simple;
	bh=R/GB05yyZIVJSF623F+XRMd/F5oMOH1NofUwHQWiW7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MxxrGrbhwAHsI942xs6FKgSlhoutVDFxtC9qSVeMifmjRsOKjE35w8Iju+4ohbGabCJBZ+dAzGyeIr5uOiWe2EpMJoaM7li6PQjsD/SUSuhFuelRCRlv429s8o3mP2LW9KRqDZY+oUgTago+s5jCz3hUwijGS8cbDhhAoMP5+mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AD43UzGj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDJJ663r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AD43UzGj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDJJ663r"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsduS408432
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3OofKccDOfFyW3ueerbx6UEZtUXR33ycNT1Iao2glmA=; b=AD43UzGj69Gs39pH
	Q/4R1a3CFwZV1I4Q7l1wrTZVgGGLUGrca3C3rCH3z/RLrFm5gQMrs90Q8L6ocVYH
	XenjEjbeoSHgacL+UR9pUN7G6/uOWSFr+MqKX7yZMQtOEnull7KeqPE/9bSLbo4/
	zBqi5QoM8TQuEUht66yKt6C0W2Y81oUhFVirvut7eapUvYUn9iYIJ1HkdnSYJVnj
	P1qyeMRdi04q1mDm0+JYxRmElW4/1s92U9AuAAsUKkLvo8O5gyvVpy7if1N0H4LS
	5bgl+fhXCB4aSHRM4Yl3V1y1B57/BTyP8WcUIyACWKRuFVdhoG7JoHpSEF6oycx4
	cO36mA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhmmu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0c46bfb6dso249778316d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 23:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784527870; x=1785132670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3OofKccDOfFyW3ueerbx6UEZtUXR33ycNT1Iao2glmA=;
        b=gDJJ663rBsM/GBcnuWUU1Jcjsdn9a1AhDG2SAZXzZSVr5mfjtY/DNuMkndJ8tDyT10
         eXJdQh+L/D7voqySxOvuUZcwn2Nxe2J0dc6og4H19XJ5b50Gw7phub1zeWt1L0PyKfsK
         BwpRRUb6reBMPjyq5L9m+CDNdP1Jy3TwJWvUcm11bp32lOyjiTn1y9T1l3IXYaatyDOm
         ru7gm6SIkVlvz4LjQPY4HCRQQTEp/QkZQPMPKJ2ReWQRa0+ymg1rO+C2NbBmESUyIJcy
         miyE2TbFglvVeIblw6DaRWWymScrhPbxPvigTCsp8CPTzjrmPkd0UdxqWjK9iwh2uOip
         CMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784527870; x=1785132670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3OofKccDOfFyW3ueerbx6UEZtUXR33ycNT1Iao2glmA=;
        b=OhIASU0kxzQclj2jff74rQyMafwOkNK3Sl/6Kxwawr/Uxv70aAYf0n+vUEbpZOmb6u
         vdXDMYLskR7uLgobTCyBQucHq2Cwa1FMSeduTAoEKJ+SN/i47KVt2UsLTJZ+OzF4dBQ4
         cJwsjADatFp/NfqYh5WYbqaz7+/hHStBJM/aAXHSCw4pdR8TwYFsdZg+3NdUteGZcE/Z
         hulWZ/i465sBK9c1zlFmLEUIGyftyDud0tGQlEBuck+pY8LpICTV1cp4Y/QgRAcVTsZJ
         L0je4ikFaEN2rFmphgG5Q31DOwB0yELUWMG9ltsKNhjfqw+TJiH5hcrlHhl358lgmkZM
         oAnw==
X-Gm-Message-State: AOJu0YxK0hfnlJqJFb2JUjDnA3XVvd6492VWB8dXfCMMFnaimq05ufeu
	3qNGjDB/dlwfR+Lzj26ZxXgmhiwr+rEDBXkRrPDWslifi+3Ju2wpBOxUa2hKuMPsIVQi1p7S7CG
	Cblc0yNJH/nKFwXqeEvvjizih311i3Of2RiE939WiayIRInUCDMzzH0RkFu6PWMKienv9
X-Gm-Gg: AfdE7cmc6S+xkxjTa0leKTx8NcUPc8zGF3I0qSAItRVsynApOKxK70JJ81md4+E5ifO
	nW27Il7HnC4JID9a/aw0Udleiv785ORmMR3rawI8Qwy2TXMySc8p6LhvlEwThEmKspEFmvYb5dS
	yIWUJTiERG2zmEvT/NPefcARe/po2dyJj7TgpfdggJtclxZ0P5RgH1N8YJsBTOPN6aKPQtPFC+J
	WK7nHmJHVjH8y5I8EIF+K1VlPGeQiOFSFwewawG2ouay9DG6O3xIklz+17kryVF9HK6G7Rz+9CF
	i62B/K7+BRs75S58qAF25ZJrqmQQm/MUbUROxtjj5XVNuTDEMXvj7tmykH1aL1OCnNa0VKSfr1S
	BITx3fqu7A50pIwBV++9cQ6CVXrmYWPQ0EGNw17XiAlepYnaVolYCOx6RzAReOCE=
X-Received: by 2002:a05:6214:3187:b0:8f2:940e:2406 with SMTP id 6a1803df08f44-907783158c5mr138345696d6.2.1784527870030;
        Sun, 19 Jul 2026 23:11:10 -0700 (PDT)
X-Received: by 2002:a05:6214:3187:b0:8f2:940e:2406 with SMTP id 6a1803df08f44-907783158c5mr138345466d6.2.1784527869582;
        Sun, 19 Jul 2026 23:11:09 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778588a39sm84793216d6.20.2026.07.19.23.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:11:09 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:08:12 +0800
Subject: [PATCH v8 05/15] drm/msm/dp: extract MISC1_MISC0 configuration
 into a separate function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-dp_mstclean-v8-5-bea261bf4e7d@oss.qualcomm.com>
References: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
In-Reply-To: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784527840; l=2097;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=R/GB05yyZIVJSF623F+XRMd/F5oMOH1NofUwHQWiW7Y=;
 b=5REHOKLxPl4zuFV38phXa38fjt5YIzJk25ngOao5sGx791Ok9TUfnUaf/Qpx2KufujiAnvucT
 sExTXxSTfbiBxt4Z2Am6vbPRXSIg48KuzXhoGEs2jkWR3qvzS3x0rxl
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5dbbff cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TC1OlXllJ9dbkp4NpB8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: tZwWyjgo540SVGulalKx8yFHFHT9t9dD
X-Proofpoint-ORIG-GUID: tZwWyjgo540SVGulalKx8yFHFHT9t9dD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA2NiBTYWx0ZWRfX4F4ED9hhn205
 I0faBtNulTXir7oeF+JUOG6MvAZivMTLjvPeGggC7wpFgGfp61K/BB7ha2Lb5OhwYc5fMbs0AsN
 kCCd8OJKwfmFhNtO77PiMc5Cfucfk/FLOMj64vkQs8YF2VFDQmL7tItrOXlu7nVL7C29HXr2Cuk
 BMMFZNiQAW2ofrsEHev5JPxGTzdAqCuupUk72l1lBaQ1nHIEPzbzeXzEIUHkDk2JBLU3GnYWwRE
 3gc6mcdpjqKxrU3kdaEweWQEsQR2n4UcX0p6Hwgaq7tjyW61lLxDrYagZPVVQDrKpFh7EauYN0l
 ThPZT5sYHp11Io0Dfvp5LUlg6jQtVOvnO+9g0e6DMWZJebwl38ApSFN1YSONAEZ9OhxsQkuX7J3
 KIOYgTxJhLSk8oNAeoSV1gk6uw7l8/mBa5lhnzHX9UWc7GsyIgvlJPHkTsl6IBJd57SGIuL14RC
 r2gjOOYIHatSj4aFAVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA2NiBTYWx0ZWRfXwe/Y3rMWUgEj
 QTdUURtcx17HP7WdOX4AgANt/1BhcCGnOro9C+50e0/teAeSkQFDggd35+mgw1Tdve7xyhUy1Gh
 sVlCG1WUx2ilmK6dEis8qhAdUsanfGs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200066

Refactor the MISC1_MISC0 register configuration into a standalone helper
function to support MST.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 4c62b0e137c3..ac24c958852b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -458,17 +458,13 @@ static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
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
@@ -482,6 +478,17 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 
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

