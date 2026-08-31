Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672B03D093A
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164271; cv=none; b=Jivh5zNU+dd0i+x1tUFYfKIDww9bnRTOpBl4AxY6pcMk19824diPjhoJiQ/5mKb4CkZ+Jg39Pt5y8HhQgfksZ/XZ7Rp2BUQdJf6Bi4Yvb+zdgyd2dQkhb1GS9MaULS3mOBsZ1RUKEY6wQjyejdPxrscYqufFsqJqv1ffses9pU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164271; c=relaxed/simple;
	bh=K08RSR7jFMIU1z3Wf63hI19PHcL0gXlgR6VRva1a4mo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f09BBzolbksL01YiDU/MNLN2CtfYHK2pCabMq+FBwXaytuLtSX/7k4k8zT1L7IqoNluZKb52jdyQQZOwtWa32DMP6os7TJoMzDd95IiEjT/h+2ZeqvZdRaXzj61A8iXHs8ESUpbDd9djiEcaFdhJtZgJX6/IlSZuTloSzYFR+SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFY34tmf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gF85GPVd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFY34tmf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gF85GPVd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xH1I2460245
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GYzN3WW/T5PYDupoBOf6xq5Ubj+LwYC+2OZfV6qkjFY=; b=JFY34tmf8t/dXPYG
	8vnpRYz+ksqSqkVxTiDgIY69Qi0hiV+8CX5m//FmxtfRh9bsrqzp009BKrUXrdzJ
	wPBQFL0BXw5wCnn9VxINzGCS+AzY6rVdmwDka8oIhOjCrAzWZ0ljJA6PA7cYP+UZ
	XXnsmZtlQzEKA3UEAiiDiQ9gYxWRbkVWAM7XqqilCgVOWYpI398pPgTOUn8i15rD
	QTY18ZZEZh7R/C1CeDAmvREdY7HyAhDp1lvGd4CT24+4GkO14QpMDrTO4haykUwJ
	2AZ1REFl6Yey8AYDx9gSFTlieHmqxVvmp8sHa+KdNfbiHADpsDgzKx+fhf6KhsOy
	4hTxCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556r6x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:17:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso409503285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164269; x=1788769069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GYzN3WW/T5PYDupoBOf6xq5Ubj+LwYC+2OZfV6qkjFY=;
        b=gF85GPVdqmypvZipNtRqBT/8vEMRfghRq/c40eweD5Xl++3R+0cf8z78LKqK7z5GAT
         rdpwvq4HmeSVeBjRT0OXmd83qI9CXNxZC/JPDtPQ4PlWl6HuRm0QU4lzQQ8azeRJDyv+
         486Y3VePD3/wZ0aGEjgCqq394xP+SfWqYQh8COG5YgWDS1n5oOLJr/2doIcIo57PzhOQ
         n0WkQ/0lmuRCKhd2J9QgW0AGnTMIdFgiDmas1R4nAk0qIHu1rkGq8a/Q+a5CZ+9p0Rbh
         BIrrXWqkvMSsCA933QK+Ibb+Py+U6pqqBGqmdZ6qT+v0U5EVPqTmVq3vn2c+8R+rybXS
         kL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164269; x=1788769069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GYzN3WW/T5PYDupoBOf6xq5Ubj+LwYC+2OZfV6qkjFY=;
        b=qkTy/um1YYoGb09113MS+LvGdmO6GkiGldWIfep19Q3qlBge9sfLKOgF9W6D89rWVe
         iJLUZk5WiHb2hARDsrfEB1OhGVc9YllQ/HvCP9d2CiOLlbTV2SKSY5pynWyAUe8NvS2t
         eir6XU59cyfD7ro2bwWmeQsNLJlsKYayhJOjX19H3GnZtBnsXgbh8NG/m6V2au/jr9oa
         WAuB6wgkLHiGuP/TB39Yzhv2RmNqN5YjWAa506gBYppJLjzH4TpaHxDPv9LPnujUfJ/r
         N0riVRG3KveRofjaHhmIOX/J2cimrA+pb7oDgUVb24Z/7rUFFM6HFROr5kaNvgMQzo1u
         ibfw==
X-Gm-Message-State: AFuF++m7toadDJCVbRtwA6JbUiwjZ361/WX0uXyewe20pEnTtLDrsWeg
	0BOA78FJgm1Y89Ek3M6HUlEcBeuCmesfGS+I6uaTZoF0vV2mRLkIN9tnzcGjmuewoAEe2riMixr
	Ed6xonPxMqoMJqTIL7diRE+2bnyqK5bPOtEQpuPmAZbMwmz9n3JKO5QsMh0bAMYuYvUvP
X-Gm-Gg: AR+sD12braDiq4aKBdTPZO123JjVyajhCSwjI7QzHV19/Nro6x4Ay+sjSNW1j/d01Fg
	FD2RVUzkhQyYZcMWkT2mqlx4hkd9poFunttpVx9b3IsGFR4qkOMGTsU1naKiyTnQ6UW4r72pMgM
	arCyyYNfIVmG91zYCBT2nXDX7L4GWxMfLGSHDmE6aNaiLMNiPyUm8kiL53sNtmqdmsXePSEq747
	bG1aVSMvhoxNz0tHY0mPImSwSPnqX+8SHhmp4TrE4gAO3rjl7qsNDKFslrm9yANBama5e5sR21M
	CPEETbMUwLvVmjERjzLJe+3tsWKZiz/bq4cm6BROwlVL82hsnkpR1kSog6pL44cPxzlkmaoWVkM
	ULEVIHvs+lCqwXQYlEYGydZ7oDRAphueW9yQVKbfN/MojdrbiRL8rjeXEm4PtICc=
X-Received: by 2002:a05:620a:941:b0:936:576e:227b with SMTP id af79cd13be357-93913909dfdmr2230436485a.24.1788164268684;
        Mon, 31 Aug 2026 01:17:48 -0700 (PDT)
X-Received: by 2002:a05:620a:941:b0:936:576e:227b with SMTP id af79cd13be357-93913909dfdmr2230434185a.24.1788164268291;
        Mon, 31 Aug 2026 01:17:48 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:17:48 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:20 +0800
Subject: [PATCH v6 03/29] drm/msm/dp: drop redundant config_ctrl_link()
 from msm_dp_ctrl_on_stream()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-3-c91d35d6fb9e@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=888;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=K08RSR7jFMIU1z3Wf63hI19PHcL0gXlgR6VRva1a4mo=;
 b=JiH+b0PUcxR9TZDRGECUHDy8hG1r9PNwZcW+rV8WYP5iMs8wXbkI9XMuK9Q/ZskgO/YIEsqMt
 y+gBOKOYN6EBulj7OEfmbDAC8XvHo/R/cHC1xPsbKNjpN/NJyPvTHP+
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXy1xQQTAMpL96
 enbg1W/isYoBul2W3PI9gNJXlpLyVnTTLHf4QanDkLQ2pn9Q0wlddPHUwGltcfSA6RQFgVG6Xq+
 A2RBW+hQHPVPRMIBitwk17wQimlwh4U=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a9538ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=P3NwbF1cJ5UVZmgLWE8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: N4YQnwLcMAaUL-UfYTa3D9tFtoKjqTr5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX7IWrzNEa9Mv9
 PCFWmnobri7aTCBvsAAbRdPYY3YTZAuJt+sj/LQMEirMOTh5mZCBCXxI+b7yzlrPWqoM67+8gZ9
 JWgmHiqqcycjHZNginV9rl+/Mr5g9l/GMoOMpiaRXroWZhhjPZGx624BQZBh5Ku+QTgLEWKYuS9
 rM3oRezt/RahZEO6wyP/Vx3Vyy4GkLqBrVzeOApwQ2EZIg6xSngQ2jEKc+egxVFsmHDAJ1bSR9Y
 /MAogmK3oG2CVZxYr2xQADXVZkTS8UTN4lkCDReVlJJKIBS8+5aRJ0vSG1qAOV6+pvrMJyP3mgG
 TvaaXSUQCnd9dm5mWNQxDz/Cr1iO2Wfauhq4tDjJ+xtkVjPLWkuDwOmkOk5nI6BzVhAg4WcT97Y
 dxwKAdhj3rj5BJpi2B9SywyhJGOiH2/+ZGdW35h/cOa6FFfl2yG6P1P5xal6qRsbWkWwzWeCBSp
 sXeR6p8QkLp5ORE43Zw==
X-Proofpoint-GUID: N4YQnwLcMAaUL-UfYTa3D9tFtoKjqTr5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

REG_DP_CONFIGURATION_CTRL contains link-wide state and is already
programmed during link training.

Calling config_ctrl_link() from msm_dp_ctrl_on_stream() rewrites the
same configuration and is unnecessary. Remove the redundant call.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 1ed713b957c6..e7bb9558c0b4 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2598,7 +2598,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
-	msm_dp_ctrl_config_ctrl_link(ctrl, panel);
 
 	msm_dp_ctrl_configure_source_params(ctrl, panel);
 

-- 
2.43.0

