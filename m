Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952B042377D
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889369; cv=none; b=bdDRVhDFAMjP1y5HIYjpsXd4g3me/onxnQg7WfP1+FsO2xk6bNpzgEQfrjVILypEhE0jwTibjSLExD5il//3LnFGoi2VZbcBrT9JpeotO1lpnGMbDuJqnX9Zum/LBoLJzZC4sbCO8tro2XM+BRI/qqvuyWXpNfXabGtThEPcrhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889369; c=relaxed/simple;
	bh=vyhhtZo2WdIR+FGNDgM41Ud6FlKDiGMJM2eDDf1MrJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nWihpp+8tXGgOeZ9xCh7zKN7rj8ZOAW4UgjC3w6IOKFYRUnZEvmGgNoTd2f1pMnM00MEkPS/zkExzOLgxVxXjPGg+KdrAfRloKhxdZ7CbFF23TOX44ezARMZzUfJLSmJS93JUt0W6bK3R2cR2FYx8srCDvHBHQ3lC8m56Up+bGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fKtvT5Yz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDhZ/1kc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKtvT5Yz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDhZ/1kc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADxu93032522
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jqEI+F/1SIBbj6LdgTjUTc+Y69JPX3b2PxQd4sqwy7I=; b=fKtvT5YzyjkVJW0f
	sGgMI3kkwGtP7hzyiBnE30SLJ0RpWFdGj6fI91spwbbQN3cGaN0wCJWdvciI7a3o
	ZQJFoKU0i/xnR+xhhshIFy+2x3UeKpX7cS3M0MKHzztd3FSveW6t6HFlZBDJ033X
	WJPQE37MuIr5pxStxOBI4OSVXialdCcD18kawiM1ueRim5+Fm3GdDJf4Wm3whG2w
	rFU2H7SXDyoJ9FN+zgwBDfe+PxdR9rXBvIF7AHZLjbrmInw1bH6UsM4hV3mLZ37V
	Gls2ilvGUMoldZW51dbXPmMbunCQG4HDr9HdxwCYWW+RBbdb9ftGVGUfU/EqGaBy
	LleecQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0bbc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:36:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811279d51aso422721a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889366; x=1785494166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqEI+F/1SIBbj6LdgTjUTc+Y69JPX3b2PxQd4sqwy7I=;
        b=iDhZ/1kcfNBFQhkqhZW2m6A/HQEJL6XKgybOSLcg0Wl18AzBzf2xbXBrQxgIQuuTK+
         V3FCY3GSPVhoHHfqFseOHLT4swYUKhqJkJOGILzT+q3S86R1Pn34Ovqh81GwHdK1T5zS
         TO2QhfMw7StCgkSjR+swvfR0HSmnHjn1gv3lu/DN2ZRpOx1sfxzdnWpg/UgJ2WCivWNQ
         lUblw+X1wTcBtjfmgxHEfFsb5+xv+UEtWWc0lwGddLn1/HuscPr+cv7WxMJQwPfkXg3c
         tdAZzuU4OIyueIrAhN/sK0ZkmEACxfbi+z2sJqZjSnyH+vNLVakFd64CB0ww4QqIMH3X
         pmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889366; x=1785494166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqEI+F/1SIBbj6LdgTjUTc+Y69JPX3b2PxQd4sqwy7I=;
        b=lRtjFBz7KECW7w3BSbPed9UQWTjPGMPlXulk11V/idoiNnWDWLNTI+3hoxxlqWCmF+
         UqWpXnSHjGiZgBxHO4XE+W9N1UUl05O0TUXTHZ0vysJrxanRM7JkjWctbPjGtwfaDj86
         5UoIUqjNgVk4rvS/8mcRdrg8lfdx+seO1TkefhyZh9Y/JkMSk4Qgb8AgEMLcfs+ht0vA
         dR6YZ/nqlt1lr3LGOMKuJGpAhDuuSc5/jOFTG36MLvHdfQFmiH7kYDIKajPdkjiNtGNr
         mF+Nvu1+dUrnsYYdZeKIbTFTG5szT4EduBPmaGEMQMl3Cg0ikMdxVS5Br0kf4i5vGk89
         5uUw==
X-Forwarded-Encrypted: i=1; AHgh+RrDffAt1kiDuaC/89yfa7CxIcpeP2jNXjrAyO+k14tlZNq0m2uvDIUQVFRkqWvM1SIrwJhYfZkopljgsYFy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt8+z5vI2y2q7TWDYQdMtrPEnss3eGe8/k29WzXXi8V3FaQ4sS
	zLgKvuAhCzVv6LXhhna3+Y+Y0PCb+W6k5vy1lHROf6EL4U2RWmfrkPK6n09AptIu6qeo+GquTzP
	wVCfc0p+OE7NE4s81fG2wzObavrZPlQDxLEd91071LDZM6vnWz5zpS748VLIMyUGpYDLW
X-Gm-Gg: AR+sD10VETgdsc9amwEHlk9oKoBfuq5KDnIgCTtPl5C9SjnFHjEBn6JUy1PYxkADh+O
	xk/+sSUhmqCcesf5CjF278D0bttgeCnDV3eS8GfkydvF/eii89EltdC4/3p7QCOEBXInX1e1eZr
	WAlKJmdxIAoyv3ihW7Hb2OU1HIrahGL87qC948JJmkrSvwdeSGkiFxjV9WbG0Jjss0cbn1Q4TGQ
	umMvM1zpf4GWMPTPVHTY2mPSFLmPHInA/aB/SLrAPrpRyJmHRoeN6t7DzipYSYGFU+J2lsFTS2e
	gQjhTtOlIkw17OXa3eUc7mUy7mwCBZVU1p3jH3h4jJ0DqvRykfx8e6a58gWwPUp91ubUNi4eCkF
	u5+zBBwJphaidKR6NGdCD1v+hqN56Qxk=
X-Received: by 2002:a17:90b:2b44:b0:38e:2f21:3bb5 with SMTP id 98e67ed59e1d1-38ec66594e6mr7039770a91.21.1784889365965;
        Fri, 24 Jul 2026 03:36:05 -0700 (PDT)
X-Received: by 2002:a17:90b:2b44:b0:38e:2f21:3bb5 with SMTP id 98e67ed59e1d1-38ec66594e6mr7039751a91.21.1784889365635;
        Fri, 24 Jul 2026 03:36:05 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0e976sm1228657a91.5.2026.07.24.03.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:36:05 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:05:51 +0530
Subject: [PATCH v6 2/3] media: iris: force stage 1 work mode for CBR RC on
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-iris_multi_slice-v6-2-a99d160cb42a@oss.qualcomm.com>
References: <20260724-iris_multi_slice-v6-0-a99d160cb42a@oss.qualcomm.com>
In-Reply-To: <20260724-iris_multi_slice-v6-0-a99d160cb42a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784889352; l=1399;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=vyhhtZo2WdIR+FGNDgM41Ud6FlKDiGMJM2eDDf1MrJg=;
 b=a+jfX+gHztN/XVjFY2OVsYTMHJNU4SfNw5F/lLT5W6oI8fhZIo686bkoOrhvRVYGmsD45O6Q4
 OZPjRcVsqGXC6aXttqtFVUBWp3x1h/KAigzaXLEGLTFiwEoHGvSPbJH
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-ORIG-GUID: 4v3mgvgKWJK9tBywwXJTWCaNXMeY7ExX
X-Proofpoint-GUID: 4v3mgvgKWJK9tBywwXJTWCaNXMeY7ExX
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a634016 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LMK2Ni0dcLaqO0rVonUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX3/KNrhwfWBfU
 8d4tVwYXwodO81JkIuS84f0Uu0VTYODeGmFyCWmMuKq3PXGgaKfI8Zd9HYxb1cwdUY+YIycRcoV
 ORFc6I07nDUpjXyAp4Di9ZDtwScTOIFEBmRhiOh+1kC1f+fL2nk0hweihctMpXvgYVH9uR0fy0s
 OW4DW5xlwry0siw/vNGZqpJgRJZeWY2BaMzNWzOdjiN3ASDK4v/3GpZuVW/RG5ikaomjK+7UKIE
 3JN/UG+Eau/CwjY1H65m76GFwmS2BndmRKYuBFCZFjQMWX4CbaadTdFO99XmZ7Lh3XbS0vKOwoJ
 qQhtyP6ls7Lysv6zcFr7Mm1egOCDt1ly+otf5JQT3rX90C14pCTE4f+3IOg4bKUXYLZOEwR0PpT
 WvPOH+NP7VuO5h/T5r9ffbeDxwPbsuyNlLaLpVTH/2VIPlLGcSPD29rDSv3srW8B9mxDHyYu7ly
 d3sqijZAHLYBw106ycQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX4077P8FQu6Wq
 dD5Dcv/0M/Tvl/qBF0RJmGow9tAmV45SMTn5iuutC3ImiBH49RzkwYpiR1HncMts0MTFLwlc4CR
 V3/vXbrAQKJSADhyPWLP8iS8QODHwO4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240096

iris_set_stage() currently always picks STAGE_2 for encoder sessions.
CBR rate control requires stage 1 operation, so force STAGE_1 when
BITRATE_MODE is set to CBR.

The BITRATE_MODE fw_cap value is used instead of inst->hfi_rc_type
since STAGE precedes BITRATE_MODE in enum platform_inst_fw_cap_type,
so iris_set_properties() would still see the previous hfi_rc_type
when iris_set_stage() runs during initial config

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 58d195d2ab87..d7cbf6c3614a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -519,6 +519,9 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 	if (inst->domain == DECODER) {
 		if (iris_res_is_less_than(width, height, 1280, 720))
 			work_mode = STAGE_1;
+	} else if (inst->domain == ENCODER) {
+		if (inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+			work_mode = STAGE_1;
 	}
 
 	inst->fw_caps[cap_id].value = work_mode;

-- 
2.34.1

