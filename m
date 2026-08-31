Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C86E3CF200
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164309; cv=none; b=XgKA+AAxeW5jmQoqVTRiu2GNY2VtvST+2Ov3eoz2qkBXpGIR/K3dZd/sTERoHEaBnm3+W7K17HGou+jrmtBevGqaR4MW16l51lL+IW2QEKQ/kypQqLrpdIMIxH3fZ26mTe4QvBiueLp/rFnzzLxmqqg6OQghHcL+SojwRNlC/YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164309; c=relaxed/simple;
	bh=ep+LQunqvDuFKkYJshXFJLSFrgdqylN6OzBHcFg+RUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oJ0o4FLhUzUuwHdiwfeHF820Z7qxcOVPwxVxYo7CRhKa5SHqn35ipamJsqbpzQaMXuEBugzHLWWU315UX5qFVX/LTKyyN3wjJ1pr0Uf92fqnoXroGEDAx1xLQa4JdU1DbIHYaKJps1dTrkXIHVfwthE9irH+hpn1YeXyM+hD+II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iK4jtk5v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QfFV7SnK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iK4jtk5v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QfFV7SnK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xsbV3167407
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVWiYFGWOQh6WJuSIdom7McLyivYPD7fTLAp4LYIpOU=; b=iK4jtk5v7X0+qTL4
	CCYTmROkm3EQdK6xNoZRZJ1NQTbGQDkCRJhbgbdxtfPpXw82hs2AR2n03vfN6vRF
	F2lbxfb2ephDV1+TbHp1+skoFdkRenINL/Zj4ntnXvyM9T0m9x0vpMmNxGj4pMFV
	igyqjdCcKgtbLC/cjO93Cpd+NvkqevYF4UV7LZYJopW2+gVbCYEtHpHqre/ZInaV
	AopZjgHFndtk1GRcr/kArobxZu49hJWMZIDVma4C9xup/ANq7eSFqIEv+KN0u+iN
	JtYK+fl/T6prasjQZZqzvp9UHvSOY0YAesZAvTD8XrSMnQzPwc0yghHbksG8NbyV
	fKu0SQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgyndrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:18:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93922c75037so195255285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164306; x=1788769106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVWiYFGWOQh6WJuSIdom7McLyivYPD7fTLAp4LYIpOU=;
        b=QfFV7SnKxB1He7BpMVytKF2t7WJxPPwPVulQZB0n872sayTjPo/dhMoXFRbfXMFxNQ
         OktyRmMwXY0y9cTb8O3f/N95NMrH4KR544O1S4BBdN4SeIiYgI4cRELCgP5Q2J2p8wDu
         nQF8tmrI+HRbgZpij5aaCUVcYDkaYU+TTGIsrg4dryi+QXgppx7drfxi18ajmtD49+V7
         isXsZvxgTpIGG+qg8ig22bWYw4C2oBnvdcjOZErTFG/yU9qt+neYfmuGZ0aTZ3nCmUyO
         UJl3l9tgJ5cv2xPrAXYILh/hoxAd+vL3EX5Sgutbd5AtmuIy8hE68Sy6j2okGbtbBNfU
         5FaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164306; x=1788769106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVWiYFGWOQh6WJuSIdom7McLyivYPD7fTLAp4LYIpOU=;
        b=a1V9P1dp4Tw9BUCd2lS8nlYt/SweVIM1L33FzVbnQ+mcIDjEAoUaT3eyUW8O4uDurU
         5YqHg/izExsOYZaqefjy7IJf1FPTBxrrEWXT8WOHwdQvf0DeKDQt7aXORMT/yHbBJT4V
         D40cio84oMSkunMHBjC8ePNcIq5exejWOXNrHNg3ycOay8ZgAlPrde1wgc/6suxBkF8m
         TbSzqqhyVDx10pi7a3nO5WT/2J+FCYQjpKoBcB0Wok/f8aK/7pDzMSM6q0eMymI4YqSZ
         WsKQHLC60c8AtPiDBJCeY/uIH38H+QHiC2xHrbEajdzxCIp5wO3vXBfPHYuHS5Qu4gQh
         XOZA==
X-Gm-Message-State: AFuF++mrx8T42aKv5oIq2pvSpXxWwZgMtLimUBvh9tVXoZwJLI3h+amY
	vLbKKHYrT663M0dFnCHvZphPey2P1lJEcGRDu6S06d0TUKaiOiaLd56gYNHw/E8orXbB4q9D6wL
	D9rdc5KSUi4kQkSVPypXH2BvxwRWR1ES9xZZJ0MGRUPg07dqD+fTrmhbc+xR3/WH6DGXH
X-Gm-Gg: AR+sD13fZW/0iOUU1v9/LTq7g5A9DfKfTQhUdS+dLrf+lhS6CjpHRtbW3d5N2evVFM2
	XszMIfe6YIKuwl1ug2m/ywrQBN3BNudAf3FOh0GqfCbbeY5qY22QOxods5SqMHUcFLcyaBmPR5k
	5GiW9MziV/6YdLJl9fckCezyNQ9PneWjzmM16vf8ImY3zYhjp4vlbhoAN4LWNCew0rGBRQoZ1Jn
	b7EByNsUsWdAkjyHpDMghystkI0BH9ImXvKyx81QMImCNeKsbFkltFE6MZd0xI0HUWHg8yZ2c8s
	pX6tb20kPMRBF6CMAtYizKn1WVsF6cXxX8LJbf58bGJEfD1KSyULdz9BOlsoYibf96hTkix9aBU
	QGrTKsB10Jxq+wFWRRu47vHbT1B1Bil8cBMlYJmp6Kma3SVBoI3lTY0ayqDE3Rcs=
X-Received: by 2002:a05:620a:46aa:b0:939:d06:e746 with SMTP id af79cd13be357-939138ae1e2mr2716262585a.26.1788164306547;
        Mon, 31 Aug 2026 01:18:26 -0700 (PDT)
X-Received: by 2002:a05:620a:46aa:b0:939:d06:e746 with SMTP id af79cd13be357-939138ae1e2mr2716259685a.26.1788164306126;
        Mon, 31 Aug 2026 01:18:26 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:18:25 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:27 +0800
Subject: [PATCH v6 10/29] drm/msm/dp: no need to update tu calculation for
 mst
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-10-c91d35d6fb9e@oss.qualcomm.com>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
In-Reply-To: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=1019;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=5ZzC8/kHjYiASM/nz9B0eCAoNtT2xRTSonPMA7SeVao=;
 b=RBUgxkcHswp787SMBPL5yQ6RVd5haNBgPRB9t0rJDVtETIjrkFFgqa573EgUZFXPV82HMRE08
 ToGv8xwoUtaDPwEfmbEro9BFGob4VJenOoNZF9S1krDWHYsW3N/c50d
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX5weNCEvlpgko
 kOelJcfexwTHL5d1Oa/0wYaPU7ctuumwOavbXOUny0agI+60YdgjNCNd+i0MO0bQAWWtfmi7AwX
 L/8+azo71YhP5eMWhlv+5fIA33Kjb8M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXzX35lpNZ/sU3
 UiUVvV0BzJ1dW1r8h3F7bCtokiujd3nOPfU9IY1YMQ2fBKz2g+zSF4ZPmXuWqwBE7wfF5TR2pKA
 zXiz4R2gBNIm1DG3df5Qe9bsrKCHIikaNJBKq7iBBxslylHcuS6HE7UdNFFUFBJKFUG7UeHtqCP
 dC15Y3OggWZ/77f8PIBiAj+05Hx5lYTf8FrANqR6rD33baCUndbbOAGTUTqqnJh5W2JtKI34HFF
 gu7d+yM8DL5Cn5pYNtDiH6dIXiv/8GYP87o+vPLRxWOH2wUoUXIbWmEBpBk3PN4Fmj72OAE0nZt
 VG/Pkow0KRB4TpeKV6khkuoB68LaFXIh025SCFVNpFitcIA9SbLS0IhvPaOCZueU8ZVY9vdrjwC
 9szJYJMyAyouiBSbvzHk7aDPWrCS6rTcIT1kXFGpWqkW9TX1KCFCoSVC4ibSfYYOrs8vKODX412
 cTUcSMF+4HMkk11qHfg==
X-Proofpoint-ORIG-GUID: KNjWc81KhURYEqkPa_xDIvOdDPN0hIDZ
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a9538d3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Hn_uEZNTG89lqFF_qI8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KNjWc81KhURYEqkPa_xDIvOdDPN0hIDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP stream is transmitted in transfer units only for SST
case, there is no need to calculate and program TU parameters
for MST case. Skip the TU programming for MST cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cd6ae0d5372c..77506e840883 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2703,7 +2703,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_panel_clear_dsc_dto(panel);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl, panel);
+	if (!ctrl->mst_active)
+		msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 

-- 
2.43.0

