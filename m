Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334A14503EC
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515200; cv=none; b=sfgs/xR41UjkOGVYtw28PRx2FSFOe8J4/GdapmhDfTn9joQJxCDaDXViOTzFtrENPoWMbPQuE4of3Grss/DFkUd4rQMNoy8PrCfQ5Us6AVtWRkl5U4/nphORovPRIBrRedKofDRLnsFl8E+fxygqcoY2zA9J7rHs26G/M7++0bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515200; c=relaxed/simple;
	bh=ztWjHXYGQafW0eAjXikRdD2g9p7GDqI3ozXvSSMtAUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uSi+xkZ4BlEJxG4/JQ4IkPf9ShqfQNomgZO0XHswor3mAC0d7F3hMASNrVU3jHK5zb82CXAPNHrRJ1IinJde9WPaETz2jwYt5NtPpJH42V5+Wuobzc6AwpPuHk/nKFhanMKW/XD/e6EYT/i324koBKwuxPlAwgSK9s8JnEl2c+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DagttHIW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zm6GLZLq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DagttHIW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zm6GLZLq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFO8vE3879392
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+kaJqRzjTip
	e+rj1+H4jUvUMfDcTIy0qQD12ClIWvpg=; b=DagttHIWZkFxTuBW8rPdIZQIwxN
	pTfMkN8ua/aezvvk+gKCXHUqkw14y9zg27xtBALd3RspY80Szn4M/1YDgJ3kfkQs
	95eP1C2XJE1scC5VjCz9AXGMlwAHWIRFphbTssGOFnW+onerOxzeBgu2zEM78665
	GxkwNDTWbhusn24cHjxNNgNOdRsIljrz4nvHBJ/7r9Y/VX0LhkS3QbAkPUsIC3WX
	tUTnaGuq+k2KFrlWu+sZeUfbgaJNIzTOFkwSzvW82Wu1FbvgBmo8l2GDPSUcQhE0
	8GhLPhvej+WfvYpF4TaSvAP+WFUr1ZLiwY246XfAXl2nWK4aowsvd2KetXQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru0y175g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:26:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f45dde7595so13943866d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 09:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785515196; x=1786119996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+kaJqRzjTipe+rj1+H4jUvUMfDcTIy0qQD12ClIWvpg=;
        b=Zm6GLZLqt4RF7nU5YMWck+Wg9PKDwEIp9rUZUTzuJiq1loSqxfVOwZiwXxVwMX+vhu
         N9zuCId4hwar8cC+2eKYFtK0+0/ZYu7FWEq1/QYR9Wg7W27ErbrRROOKC+uUyaiXwXCe
         QKzrQ0GSpKfK18NxASMbn9tkNxj8Jhk59xxTkmUMkTYi3J7EiZtubipBB5agcInxeCM5
         P7X4anN8Cw0gM6wjOePSZVi5a2aPEpgC6x4Y0esAqAtUonDmEoE2jGp1mUN6Q6IPyfyd
         moISzmTebE2BhzLlECmF5bzVoIgsBZPAG42J370sXS9Xv0FeKTY1qHyqcXYZ0FpTgaHw
         Ynpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515196; x=1786119996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+kaJqRzjTipe+rj1+H4jUvUMfDcTIy0qQD12ClIWvpg=;
        b=D2Y92pR6ycZ1/GIKD92oJ84OeNof0n3hrLTFP0XRG523I50JK7TSemvfYzYk32cb4F
         XXla8ZSsn0+dr/Ysd5S1YVFwig2B689miiZ0jtSl0XZms9pk9RtsHzmrtcijCDU43pDS
         uaprtsBdlM9PlP/PwKMsFdzpn1fhXjgB2XlNUr8zUp4rMcL/nu8Arn66gru+zRSZCa8h
         +BimnUJDds/USNhfbXP0DPVRflMqOZKO3H2lCXVJGm+qgAcT0JnSjT9GmaefXn3m4p2H
         /yqv51OT8jrJp/5Vzv1cNn6m9e5K4wdS4e61hzaW1qsI1Vdky+RYta209P9FCknFCGzh
         30eQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRrcc3+fgOQiNzOq9HD5c4D+j1Z6v0okgxcoSg9hXFPkrf4WvkDBUmvLMaWNCByMf/Z25fbFhd6W19ycde@vger.kernel.org
X-Gm-Message-State: AOJu0YxJGSx/k+RvzXSR1x3CVVUAtYJq4/lBpuEJgSpcQL++MPTp/d2M
	3hVJ+6dTtcFNP5vZh2bCkmhmOHVt75X3ivbOpza8gzmD2ROvJ6YM1Q1dgKnvsUJR7zpzbqZ2YDG
	XISCasUCbDwxjxM5chHWsBK1S3eZBcDmYF+dCf1gCHL2Oz1N/JIr/tJO0T3t5TzpkOVLW
X-Gm-Gg: AR+sD10kcaFF+ay1aIeIk/SInHfkJZVHjNj21lum+vjdmh4KYxioP7XugK242VScBuk
	H7UJYb0Krz6wJccffkH7CVlcfQ4djFjMv3YzC46y4fzBN94TuTtymed5jjPjQb3vNpA3/bTtNT0
	dzMCXkrWpCVV5AHJ7AXiuHU+V3xjShwv1hjWOTls6cmmXwlhafKOhcAqY7OM2HIWq+kQu91+6C5
	RbzFGw0z4oGNAvHAay5jHPRuw7ybi8XW9V/QUCPDiGeN03Pd6h+ffAX3ajTJm2pY0iQrS5rfEG9
	T8SThkI+f5XVGom2RN/eLxh8yBR6RAVTWZgTMndP+JhXPUsmlDii40XcH0jA33LBaedZw3JrjB+
	DmWZCEDlXMiL8jA==
X-Received: by 2002:ac8:6f16:0:b0:528:3b9b:4f53 with SMTP id d75a77b69052e-52b566afa65mr18723821cf.16.1785515195080;
        Fri, 31 Jul 2026 09:26:35 -0700 (PDT)
X-Received: by 2002:ac8:6f16:0:b0:528:3b9b:4f53 with SMTP id d75a77b69052e-52b566afa65mr18723301cf.16.1785515194588;
        Fri, 31 Jul 2026 09:26:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm7084050f8f.7.2026.07.31.09.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:26:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hongyang.zhao@thundersoft.com, neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] ASoC: qcom: qdsp6: q6prm: add the missing MCLK clock IDs
Date: Fri, 31 Jul 2026 17:26:24 +0100
Message-ID: <20260731162626.1588561-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731162626.1588561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260731162626.1588561-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfX4iEOkzLz0UN7
 CZWU/s9WTuqgJ0oWHPNlRsInUgLAvgOTUvBt4elWMk7anUiKE+hIncpzmqs9eMoymI4M0GPKEZE
 UIc5xwVGsLUcpDc4f2Jb1KwPjPrRr9w=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a6cccbc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=FqzlPtS7hxmnnDEetaUA:9 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfXx+OPZyVmG9AN
 rlteomX8N5RGA4uUztZRUxpqGfeS/9JETej3bpRyo6y7L7hEvh1Pp2Arupa6RZV4Ty8SUBJ6tcR
 wVIVp5bEKWp9OsFNeRZmpYUgu+CEplsXQyWL3uVqKGLLNrS3vxArFyHsDNfVT5mvUG/H5jKSydT
 Ez2aHVdnIjnk4FGEf/76Igk6iZ2OixzNBCd5OBELiFndlxwYCIlAnt03hebx3lejNfXe/s4RUrG
 /jXf2hrYz/7KU4lfxjyJYBKg8UBGnF1l/flNUQKdx8vEeTWUuBU3uWq4lIzYYZlNQvyfwglwNju
 f6TP/3/UicqCcpUCyycEk8IM9hWRaaySKjxN54UrVANrQ1F4VuQQMF5hZnY1IzMnjhHPORjkl/t
 2AyQebcQwZ8gRlWPy9PdtV1u7g/XJ3h7OCqIFXcWy1Otz3Gk0IoAF+AgNWHw4Yn0qu+LTHIVAVy
 5HSAaOYkFouzieZIieQ==
X-Proofpoint-ORIG-GUID: YEjJYGXAKXD4Kc4evLMYnaKD3xZLIYa-
X-Proofpoint-GUID: YEjJYGXAKXD4Kc4evLMYnaKD3xZLIYa-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310125

From: Neil Armstrong <neil.armstrong@linaro.org>

Add the missing MCLK ids for the q6prm DSP interface.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6prm-clocks.c |  5 +++++
 sound/soc/qcom/qdsp6/q6prm.h        | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
index 4c574b48ab00..51b131fa9531 100644
--- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
@@ -42,6 +42,11 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
 	Q6PRM_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
 	Q6PRM_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
 	Q6PRM_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_1),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_2),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_3),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_4),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_5),
 	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index bc5b9fa13283..1800b997722f 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -55,6 +55,17 @@
 /* Clock ID for QUINARY MI2S OSR CLK  */
 #define Q6PRM_LPASS_CLK_ID_QUI_MI2S_OSR                         0x116
 
+/* Clock ID for MCLK1 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_1                                 0x300
+/* Clock ID for MCLK2 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_2                                 0x301
+/* Clock ID for MCLK3 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_3                                 0x302
+/* Clock ID for MCLK4 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_4                                 0x303
+/* Clock ID for MCLK5 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_5                                 0x304
+
 #define Q6PRM_LPASS_CLK_ID_WSA_CORE_MCLK			0x305
 #define Q6PRM_LPASS_CLK_ID_WSA_CORE_NPL_MCLK			0x306
 
-- 
2.53.0

