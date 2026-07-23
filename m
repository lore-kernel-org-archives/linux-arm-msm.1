Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310ED4399D5
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802099; cv=none; b=vGV765kCj00yxib7sJQT4fB1OUerCWLYH+JnozQICkY7CKuOLeqMBhypVetPu0LNbnZ1YRVWFWH3oAUX9RbMZdwHi91wJpANjKgESGSjDjJ/5dSvCSaFz95uDYqI10RBO5C6jb73dr1xX0V5aPUaPtK7+sdHL0wuP5gqjQbL2Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802099; c=relaxed/simple;
	bh=KggxMVR5Im9EKl249BhNUqFflJp2iq9ZhQsGM85dyl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xmbm5bo8BJ2XYdD48azjGg24KNerkP7A6YfE6vC5r7TAZV+VXc82Pe1orQ3rsskaAxSQ6ar40L3SHxlML0CQUAVbY9rNFn8M7kp2meHOyAi8mKHxJYS/WdzXMx/ssBsUrTD4RNPDsJropBz0dpH+tksD7IGHB8VDGna//wIFWwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWH0Jo0i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aaSo2Uws; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWH0Jo0i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aaSo2Uws"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N9Dj6p3567618
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JW75+axBmdgxfFRDWcmPMpgML/dxXnxTmjaxQD+KhFE=; b=hWH0Jo0iyICdyzDx
	shHjxOCQJPjVuNEvwADfnSmGflMdR2SJyBDe1KMaFepsWfvmpsiJGgYEnRe6osD2
	pO2thjZa9LPMnUFoj5cj24+RixbE4txEV/+P9C1ePcGUV27e19rdl9yHRE/5/YJd
	EdmhGyGOpDYcT46GlBL1X/PoCKOvRGpN5elYfwiGbmx8squKa9qN8bfZhgUpuPDo
	6BrDnD4BIjGzSCKDWxFBkOCtSTLc6aXMaylUK1prD6E5DHSrG5GuToTTsJ2GCYVF
	KfXVkjZLUF+BSHDURh9OX/MSYHCAoa85s+0S68viQSXaIaXx7Fwr5ZEVBXA21Siv
	Q7hehg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg5208ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:21:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e04598adeso489046b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784802096; x=1785406896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JW75+axBmdgxfFRDWcmPMpgML/dxXnxTmjaxQD+KhFE=;
        b=aaSo2UwsEWlIkToNXotR+9pIvSMumAd8ox8DkFd1Ho6PYMw19CeX5tIqoy12TRzZej
         JsQVUgrkVeCAuNrikxjSf3MTsJt/WV8qv5KS8D/snT3jdkzT+z+D2Wa6fl6CStfR71T7
         EYlo/wX0iwELJITQbvhCSCSm3pPiC0WIs6OT3iGMhdAtolgzTtS0/d2BUwgea98PKSuh
         kvYQX5N0Dk7VGhUUVXlKUP/zOWkb75QxaXokc47rrBrlIg7fqrUqxfvq+aNM4N0tep9T
         hFH5oZLL8ed9f2PEsXmaJbqsgYVexhhMLlrAicD/uzVuN0z9Ugl9LYWC6PeJKE04RTkU
         xkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802096; x=1785406896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JW75+axBmdgxfFRDWcmPMpgML/dxXnxTmjaxQD+KhFE=;
        b=aF6Z1FoJH3mxHKon7XhK5FBKrVk+pnjcS11e7a9XgIWzJShhSHv94Ta6OS9uSXDz39
         MRDOzCWm4zcjkSQv4l6IFd7afgrTVBVElwc7mlzzrJXyEFmjIDazrZxJj5asagwMSWKt
         eRAyWnTyzbXOupGf6/N0fUlOV3zMMTNlqLnkpYIJ+tacEmOmPwDfEBGsYOV8HWdKUMjT
         +H2eo06vPESw/FGlE0nWkRSAi9B1eOKVQsmbHrXf9MhTH8VecXu07s1ZFFH1/+N6FVZa
         sKext9ZHP83I8v0wRWFyE4o2UT9EZw9YW0c2MDriK8eLagnncaMe5W7weaoUXFQ6Ka2G
         grIw==
X-Forwarded-Encrypted: i=1; AHgh+RrK7etv+BU1/TIItiqXgokWnAVeNXnzjmnM+uHCMHeZUQIjkU4EaRJvZ9QZGfiCCJNz8apY0xJmLFIlClff@vger.kernel.org
X-Gm-Message-State: AOJu0YzmO3hJOn1Y5ag98cke1iWiQH1JIkcq7+5AuMks21KAEfG1m+uw
	DSQwvD0gf13ALboAhQ6SHM9qSzczRG0ocgUNqv4oAk0mpo6o1iJq5ldXo3TkQsxpcci/SvhPV0K
	tUR2Xtf+IEsPR9KH4l+TkOc2dj7tIrTwsCkEdSDtRH82b8rJcTWNN3konH749MrQp1pke
X-Gm-Gg: AR+sD10WwTWTf2a8bMSM+edeueHwB9vdMxX33z3BxfRr/IalSVzuXHHaloVDzX5pIRb
	m1gyfndbnPO1J3Z6mP4OS56XqhB3vo4uXOwSLQ6UWpKb90OUk2K2DHGgHbERi1JpF4iIUkujXa8
	gDd2TjZotDuY+kxE8mVvjXyG+Ku2kNO3Jd3hqTHpxVV67Q7+YfawSndgAK50GitBuNaeLh5On6S
	AaWkcIooWObLPaLCoF+q+38hXcZRXLPB+r/Ezx3QBy8OY5j0mJYCFYb9Z8sxttcZ7oFp/NJCUui
	5EAXnrbCd4Hbpcx1CyGR6HAZdi0SrY1eaxPssmwF+/nm1rAqtCkXf2/u37ObXv0EKJytNhBTOHo
	k/KaeImGwRBkGy8OW9Kaw0ru5BFwjseE=
X-Received: by 2002:a05:6a00:4b04:b0:847:7fd5:aaaa with SMTP id d2e1a72fcca58-84e2b899250mr2789010b3a.17.1784802095888;
        Thu, 23 Jul 2026 03:21:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b04:b0:847:7fd5:aaaa with SMTP id d2e1a72fcca58-84e2b899250mr2788976b3a.17.1784802095424;
        Thu, 23 Jul 2026 03:21:35 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17285662sm2781395b3a.20.2026.07.23.03.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:21:34 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:51:14 +0530
Subject: [PATCH v4 2/3] media: iris: force stage 1 work mode for CBR RC on
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-iris_multi_slice-v4-2-45f0a3fe7fce@oss.qualcomm.com>
References: <20260723-iris_multi_slice-v4-0-45f0a3fe7fce@oss.qualcomm.com>
In-Reply-To: <20260723-iris_multi_slice-v4-0-45f0a3fe7fce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784802081; l=1336;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=KggxMVR5Im9EKl249BhNUqFflJp2iq9ZhQsGM85dyl4=;
 b=auzWmmIJBU8OfdL16mWMHOMWwt3Ighy2+vaiEMg5dXMhta5uxfDVoDn/Of1P1dFQStWGo6b7x
 weZ4S9VA9u5A90CfwXhVZCrFXNlabkQPhxGdLheWFwR+3z+ZmM+0YfF
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a61eb30 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LMK2Ni0dcLaqO0rVonUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMSBTYWx0ZWRfX2L/DzGuP7ijK
 uYote5sEZfuxaNy8AljmXmd9CeG9poezyX8npSoPiEgsDfP8F2Lu5MrgYkrFcOAREQNaXOpCaF8
 oFheeJzFpl19pzHlk9Iefvf1zXUcuEg=
X-Proofpoint-GUID: FyRoXy2kAirKTDl3PLkwldvxywDLDLg9
X-Proofpoint-ORIG-GUID: FyRoXy2kAirKTDl3PLkwldvxywDLDLg9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMSBTYWx0ZWRfX1Hzxc2Tr8Qiy
 oNKCLvUJtv4tvXdYWzAsDVQijXraxR+u9n9CFuDDsUOv/XvCOJgqWI8TuM+k94d3zv6hTYi+iSK
 BcUizTpBhNiwHyS7en7aZplZVzh+tf8lbHOijiLuG4Tdl4pclY0bjtBg3rIGPgvB0wfmtjMmFxw
 VPHYeQU0HRjxp97XtG/1m7qEuOzuuWihSeGmetTpgopYL7L++fXiGCDBGZ/i+I+B2WyUc8Lfnjt
 f+SAuPDHwtkj4sQLc+kk/2AbuT9UN2vvtk/4jZt3yHRYn+yPgYAzwqUfSXyiEcaomK8WobdxpFq
 05rn3CIO1J+nfFVw+SK5/ooYGoTpbWMnPuWHrhECapQibnVcYDJE+MCCfghF6QoreYTTVusoYbC
 ncmcL9ev5AOyLto9S7Z0JQqFar+MIxZ6MVn1grkIbMEnzpA7VYwytLi3kpum9Y54fsgGJxXIGIN
 u7reKrRG/gRC+/B465g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230101

iris_set_stage() currently always picks STAGE_2 for encoder sessions.
CBR rate control requires stage 1 operation, so force STAGE_1 when
BITRATE_MODE is set to CBR.

The BITRATE_MODE fw_cap value is used instead of inst->hfi_rc_type
since STAGE precedes BITRATE_MODE in enum platform_inst_fw_cap_type,
so iris_set_properties() would still see the previous hfi_rc_type
when iris_set_stage() runs during initial config

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
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

