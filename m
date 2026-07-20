Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C48B392C34
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527883; cv=none; b=bhWALspRn6bR7zJPPvl2/efHae5ULRBViZCJQtrTMeQRqg9PmO5VC4tFN3hVw9vwt+Po0sFfdHjeahWtq0lSZ4NKrDMHR2QAfpXGLhxLtgFhhbveWwY8h/+q4zIt89Q3/dzl5xtv0ZzObUJUqBJXdrylR9139zj2GWuNuQtRF/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527883; c=relaxed/simple;
	bh=m7a3fzYm8nfwxq2seY3v0u+Fo5r/mlnnqjBe8DmQUGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b3jsdsruFVkWneWFwyhj50haNiynejd4VYSmjekT/ahlHj+cHD853dh2ITOS49sLlJ7UNAVvE8Bbfr12Q1hBi6ksQACt4u9sm2zbcqGhxdwAesvUqPn/So+Km513PLasY0tBzTL1SG/3O3eibT6PYL2Npez//ndIru1s7eyfwoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxzOkCCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdVPn9wt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxzOkCCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdVPn9wt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNuKP5942425
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AeQrXGNfB+XoNNbsXI6SD4zb0QBkoDAOP9R0ui3Y6iw=; b=hxzOkCCvUH8nJgan
	mDLIODhEqR4RNCAFqHPk0Ldo0jDF2fJ16AcLVAb6MwN4kLXZTR538QfS0w87RNK9
	oQjrh4MYPtJqGPnpi2naYpQyzQl1+ejj9LPbJZBTmhT2/cJISXHRDzew6RWQf1kx
	h1xt6BUvZKrXAiiLfF4ki5L9VFNqh9s9ZN+MQEr4vbn6UxrGnLFKn/yIHmBlUyV3
	Mut5sRajfqQJWAKxw6lklIcx/XixJ+UcO4KZ4RCc5Tk5L0RNAYq59oTTA8Pg37uC
	ycoHvczWGcu4V4DkpztqP25ObDuJrh9hRQXtbsXj/x1+J3kjFbWteD3dXN8I44Vg
	XsEv9A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2c6cn8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0c46bfb6dso249780016d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 23:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784527875; x=1785132675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AeQrXGNfB+XoNNbsXI6SD4zb0QBkoDAOP9R0ui3Y6iw=;
        b=BdVPn9wt4Umin3OkAdq7TaUn6D+ldMCPM+7RiRzNvi7/EDl8yD9fUPV1dAoqQb5jwu
         zxL/7Sq0cd0M6p7++JMs88oaDU44Qq3B/d7JrELAfRhzRO3aAgwP4TL/oRR0FcXSxHLK
         V6MHBTcxDFkmHkmkVm02IsBkm082AeiyYnw6HxEOrpm4yTPxKgfscZgs5bMPJneYNbdT
         T/QnX349x7Qn5ZZystdy+tDbUJq52xsDmVBeSwx4GiNt3ZVr99UJTRzuqBh5Y1t4e1sa
         lQdV7MbUAYkpq0F2MEvjqmwDwa1TXxDQ2kCrnll3QzV5pOtddlJ8pa+6Qolb9v/czRUK
         XHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784527875; x=1785132675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AeQrXGNfB+XoNNbsXI6SD4zb0QBkoDAOP9R0ui3Y6iw=;
        b=J46JvrPymmU4a5JQZoFgKR/HRbrsr8yeYtrBUX54kG7QyOkU2k1XcBedJMo13caf1/
         8cpKJRYQkQ/zTPgqixMxvknvnRXLxCeanuyz/ubTdFSVBF5AaBEydRmWGsw3ZOlO5wy3
         qIojlRjwh5XqhXY6We3+qjk66zCvNHF2DRrm5p8WltVZM6e328r263dSXoWUZ71pGue3
         e/cR/j28sOvqpfQ0sKtalNnUBofmTVgdx/tKoznfiScxUNIkq5P2VNJBHQkSK9vclaWd
         NsIN1d+n16WJxvF0Kb/gt8jHwlWTJsh0hzFUdtt6Hu4fF9l2FhfQD+HGk7Dwg9uUuThB
         0rkw==
X-Gm-Message-State: AOJu0YwNwdGIhTRMBaoQ7CpDlZ0hsy5OA6+EcOs+XOWfJ7QeQuWhZ8OI
	NbR/zMbDP1C664Tnlr9HgOWvNtt4rzeukByLh/lZP5eZFfnFE0PR5h4jBmnfwNSLx37Y6qVZxHi
	CrIldKyBe84QV0scK+yPQfyvtYCY6ilogmgwU85bWSuReW2O0IWcz7xwe7DdsTRyfpgZ1
X-Gm-Gg: AfdE7ckX/PeMngpouGGz7gh6mkw7/Mi1trmXxe8gKuGL5zG7wI3HyZau72f+bpe9FZv
	yAqdzKNP4sDpPovBVKPxB8v2siaLzOShcJyeU+nXG5Bj3/92395OexqXR4wK6vBtQjPLcNpAjeD
	jTn4hyYPawzrFIA8hTwF2j3LIw3tAcWI0q2wHKEoLup1vnKaUvaa7aN8tF/w0BwTUKn4eg5XckR
	Yn08HindzT0U4/gZvnzHIZJp1f+Jysphs/3zohnhMnew9aS4lhrLQFicHObJVhzyAyys6E4ndYP
	CBuXBpj8cageJXtt3f01uZK+q6UO63ZdpEurMH3CovDdG8ohR3WYvlMPQSerIAlhWkNMXXU1ReY
	MFlW7jAYaWLoYeUGKhKTHIUatS2EB3HD/cRqt1Ki1FGUbAqJwzDR+rQcTUSSpoFA=
X-Received: by 2002:a05:6214:500f:b0:8fd:6e32:2bff with SMTP id 6a1803df08f44-90778509f1dmr133304586d6.64.1784527874711;
        Sun, 19 Jul 2026 23:11:14 -0700 (PDT)
X-Received: by 2002:a05:6214:500f:b0:8fd:6e32:2bff with SMTP id 6a1803df08f44-90778509f1dmr133304326d6.64.1784527874341;
        Sun, 19 Jul 2026 23:11:14 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778588a39sm84793216d6.20.2026.07.19.23.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:11:14 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:08:13 +0800
Subject: [PATCH v8 06/15] drm/msm/dp: split link setup from source params
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-dp_mstclean-v8-6-bea261bf4e7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784527840; l=1402;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=m7a3fzYm8nfwxq2seY3v0u+Fo5r/mlnnqjBe8DmQUGM=;
 b=chonLmhqOwTIGtD1JV5pLq0RH7vxKrwc6AaLVvZN9VAm0hBQzkHmET72yQfwCT/8o1QrgVGOW
 KA495hrb99MDlXUktgehooV/JA99dRBLpSk0Yl8rCaSBTzna5tPBaQc
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: WakVknAm-WOrcqdy-RrsmqJ6n3hJh12S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfX1IgjEMwCKo1P
 mKS8iIslCUun78dReO0w5jlmdq0bT/cf3DLdfzH67ihJ6v4aZ9pF2sOBuifOWPS6+nU+3r3fyTL
 1ZIuWUs5p7atfGlFZyxO0OFov0j5u9qRcd6lPGV0yk+3VBmCWtB8VQdlIJ+lRKgLaF35gWh7cCu
 fJ9e+K7FHFWnr7uq1ogWL1pq9uzKZJ2Y+xquDc2aQ/KGxI405ETuMShOddtIhSUwSkNqJp1U+P+
 5nf3SRUac+I1Cb4HAJ51kOcXUKATGeyY2vSePxCRQAXsKl/E3mSn8GlJNFWhLU+/njLAobku0sy
 7c6DoclYt/110ut0Qyo2XJe03+iN1c/LSq2J6ksNsW/Rl6DYzjQ2eXdEUVMVbG9/2dQtmL8o7eP
 aj/kYiZe5WhDBDRr1TRQOQxSn72kSXLd873aNUHsraVqTRrCdU3DZtAsXUCKaMz7HTl7oOD6VC/
 Gw3m3Zox2umIGExYhjA==
X-Proofpoint-ORIG-GUID: WakVknAm-WOrcqdy-RrsmqJ6n3hJh12S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfX9oRmFaf4ortL
 0ITig0wYNI2D4Q1b9uIkNmF7EOgF/FDTZ68uM0C1C6UzXb5finq092G33Xh5V21hxVGAF7xRXdl
 098Vi9po138w8jalgPLtfbSoLsvYJ+k=
X-Authority-Analysis: v=2.4 cv=CJQamxrD c=1 sm=1 tr=0 ts=6a5dbc03 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=saXSvH3Ee-fMY4W8qR0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200067

msm_dp_ctrl_configure_source_params() should only handle stream-related
configuration. Move the link setup out of it so MST can program link and
stream settings separately.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index ac24c958852b..711579de899d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -482,10 +482,6 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 
 static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
 {
-	msm_dp_ctrl_lane_mapping(ctrl);
-	msm_dp_setup_peripheral_flush(ctrl);
-
-	msm_dp_ctrl_config_ctrl_link(ctrl);
 	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
 
 	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
@@ -2552,6 +2548,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 	 */
 	reinit_completion(&ctrl->video_comp);
 
+	msm_dp_ctrl_lane_mapping(ctrl);
+	msm_dp_setup_peripheral_flush(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+
 	msm_dp_ctrl_configure_source_params(ctrl);
 
 	msm_dp_ctrl_config_msa(ctrl,

-- 
2.43.0

