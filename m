Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D9F42587B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234131; cv=none; b=pMMRq62mce5Q9ty4UNutOyxSLNWWo7UqUKkPmBvHk1J/RC99Zhyqd8I7PcNipJHorTROtolXhb/9IeFW4yVQ+RfX+FmJ2VtbhkqI3Uv64G5MVJdtVn6tMm7KOK32JEe6oOoABrVSjip6M3pExcw39WV7GWgI85Ail9d4Cj1hXy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234131; c=relaxed/simple;
	bh=HQ9e1tJtpEldKUtU4+gyneCaZfO9vxBnWuue04uaU6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7fOqgZXYn172q9mhewa16oJm0jJxb4hQAslmNglqK4vzm3o4Df2NHQA0tedOP8pXDclZhxLlzyUTDBrGYgKYsFfd5uY196ap/HufoelBYlioCwlBshqlvonmsvgFzCIWEBm5ng/0HTJhW+qtGEgbhON2drDAHYDToMMSFO2WS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+6Jf168; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EwmGzyb7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+6Jf168";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EwmGzyb7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S829pl2026278
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MD81MiQjHMsJuaHXSjy1XEWIftZTPguoGe7ZSeE6sFE=; b=k+6Jf168t8mzceo4
	LLGLBK0ZM0YaXD0UoFc3+9XoOpeaQLS0tjY8yLGr0CG4epox8/S21MfTRFkIqxdx
	ilXbqtp8TNauTFhxJZSqEIvSgg127xgp6iNp/IlaQw8Eo5RRPmg1Bc9w3AU1Zy8b
	MMToKK6QMUeKecLkDmY5p/tvQxJMYYsHnvgbiY/tnNWc8AEC/mNI7bsYItqBBEwi
	A+iephR5E9xWNLVCm9gl47Vasj9yKdhT3t7mkPIOkKcF8elv3/+C9WHKmuYvWEtu
	goKU7wu5sA/H74yOr4tJt3dJdvXoxEiK3+o3IuvKT5sbQ+HseOJ4RhNE99V/ab5H
	ti1Xcw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpq9hgwqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bff5c7035so79260561cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234129; x=1785838929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MD81MiQjHMsJuaHXSjy1XEWIftZTPguoGe7ZSeE6sFE=;
        b=EwmGzyb7HArIbXCHJQIWtFMdqvpXG/uBpMThlGoMehpak6Kk/fXGhplPLBxhP2TYds
         4QyMCO7S35aIsqhUZ0VLa8gOmVTZlcm7JBaaR10DlLlF/WGdeQfx6M4hSH/nr5z8FKX5
         FOfx+FMEYiA9ioZ8olZKhkHzbTNrj2DaY8C2GpQAQH+8j+vFyBhfMosfc1+rgO3x6ljb
         oFM92XkiP5OJliYzR+xpDgzvPiLVsDkR9SgJy8NaYDtVhykiTSTo0uhPWrr2oZDs6dKi
         0JkdHWLtqUU65h4DfekxxwrRaypf3A2NFMcjDFV6qqXWtSIYE5gTzNoDiJNZxHgfTlAv
         VGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234129; x=1785838929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MD81MiQjHMsJuaHXSjy1XEWIftZTPguoGe7ZSeE6sFE=;
        b=SQndOLoBu/QN0eOVUypfnr2lUAIK4SSwv5DOOnxdH6r3/7tQfkwo7Auehyko9TQRTk
         jZ2vYSlxlFBDUhwP3SB337r6tVgOt8cpwXxei1S3RGsWrhyiXwOVe5G5ymtDl/7TpSn2
         s9dTL7fjxrl0BgQrms4RPXK8qeOM8PqR7BkC8cNfdP2Lrf3EWZDuZx31sFN70cpm6Goa
         Qr9HbVAGcVeb3RZQXksVQs11hQNp8v2MwRPdGC1nyG6N7PHF8dRd1Ai3ea9i8/7Wp5O0
         l7QXOx/zhHkeFCYvpXHga3XQ4wjF+KJLKGyNz3VbcFXyxIwyi5k3zp2uzs8FIKV8Hask
         5GnA==
X-Gm-Message-State: AOJu0YxzD6LjJa6f178/DCsfcUAaKCP5Z/9+E7nC8P/ei+Ya0ypUxbLI
	Xo+f9EHi/z50qMzeuSjBr9tbkS4Gg2SUc1UfPUpC0nqH9LqbIMwjmsd3WfM/faBjXClcVft1UpQ
	QcjT+G/+p3MG8esbK6tI5Wp4uRKb8Xz0CEVAVh/PFDbAvDt6VB8wRXwafpj0Q5B1g48Ds
X-Gm-Gg: AR+sD1175ZfERzOhLuDqNpDZTkm1ku3EwIESImjbaBFGgfUhPPq0CByQDfztjymkxh7
	ZT330l+jBXdZaAUWTt1J8t4dkE2sSIpbaoCJAAC9IqiVk3YLPEt8jScDXua8+g8rUWU/o3VrWMg
	kNRFoxgCmqqa05St4MNMdUhMEJov2v/gbqCF+KZ0mlbQSInaCNny3BhW0ztRRv5ZibZHkxmbQ79
	cHkgBDR1uddsD0sw8MwXcasrWoUiae1RB9cG9D97ux2WtVvLli7NEQJXoijgoiusqAfWBtsK2ic
	lUZwnLp8RojJc53UamGYN7dfdZwditstgHBmjYihzbY8yBP9FGBNX3UsdCOp9dzZUPL7kQ92MJo
	WBfLdCgjUx8/7VOLNkPxZx9kgjbWJ/Lr41IxJdnRTZhkuiS33F1HbWIQ3RU8f4xU=
X-Received: by 2002:a05:622a:6097:b0:51c:7b12:5fdc with SMTP id d75a77b69052e-529d71a5fd5mr11609831cf.88.1785234128951;
        Tue, 28 Jul 2026 03:22:08 -0700 (PDT)
X-Received: by 2002:a05:622a:6097:b0:51c:7b12:5fdc with SMTP id d75a77b69052e-529d71a5fd5mr11609571cf.88.1785234128396;
        Tue, 28 Jul 2026 03:22:08 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e869ba73sm84791396d6.25.2026.07.28.03.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:22:08 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:21:35 +0800
Subject: [PATCH v9 06/14] drm/msm/dp: split link setup from source params
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dp_mstclean-v9-6-f7779fce10f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785234095; l=1402;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=HQ9e1tJtpEldKUtU4+gyneCaZfO9vxBnWuue04uaU6g=;
 b=9ivr3sS37dYtST/5l+jqnU7RTta4ILS5W7k63E/6rrfyj4Y6Vgsunjq2Td4BvkIKBOc1nb8hs
 nGwdnj1JZrKBvZETN8d3nfr3Oc/CBS3eyz47Vx59TydNjk8JIgxUnYc
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX74yVcEiJJktR
 1uzPLfHCjp59T6D3kh/DPnipVCVjro+rc+JRjuUDWJnkBfDrL3ajWy1rzwR3VtDRKzaLeLNA4XI
 dAuSzOVQMg5bwuYhHkA85ZMT8DFL1vA=
X-Proofpoint-GUID: iqwdBoR0iAUbBoRdurxboPYmOWAe3OF7
X-Proofpoint-ORIG-GUID: iqwdBoR0iAUbBoRdurxboPYmOWAe3OF7
X-Authority-Analysis: v=2.4 cv=Aa6B2XXG c=1 sm=1 tr=0 ts=6a6882d1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=saXSvH3Ee-fMY4W8qR0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX1n4sgZsGr2I3
 T5lDHLfiDPOXFEaEmWbaE/zH3k7mW73VCbLutpG1AOFKtGxystw6x8UgkDLD91xxIXI1GnGO7SI
 3H4+gVM2aXHaH0uPNcKuYWAgRdAEuCSwJKHFUQI8tGgSOBAWn8qU09p9pq6fOGCMk9g4Hle1U1i
 kmq2kfoNUYQ813JcOiuRji7KNFWx/glnTHB2QHpanc76OiamFjXHXoQRiEmdORMjcKDTdrJQh2E
 xIKJbfO4mbNYC2dLARHkrQCkAJLtaldHYzsI1WUrYmioTCYG1BuyCrvg8m+dZE/ZXI1/5s+Zc5J
 7Edlf+y1CUPiJNzqDDQ9x9OIr8kq+uSlpFKWd2Hvk+Z/w+ajT0vtVwi0Qb115oB8iAe/Ubbuq1s
 zOAiDdS1LtKynEghXWzfB+7QtjFGeI4dHCAroeoyQGMs0AcxevJsX4RY27StSXohhuJlTzJvKDN
 WXEcNcY2cCoNe1G7lZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280091

msm_dp_ctrl_configure_source_params() should only handle stream-related
configuration. Move the link setup out of it so MST can program link and
stream settings separately.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c557e0f01dc6..f343bd6c2b81 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -486,10 +486,6 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 
 static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
 {
-	msm_dp_ctrl_lane_mapping(ctrl);
-	msm_dp_setup_peripheral_flush(ctrl);
-
-	msm_dp_ctrl_config_ctrl_link(ctrl);
 	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
 
 	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
@@ -2556,6 +2552,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
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

