Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007367;
	b=lzeuFIxS9UdQm9gQbgTe+IDAOmz9Q7cJNl48OwYil9bcaBKTAwyuHTB/GZZHkN3gP/Ez
	 IRCR/do7/y+XnlVeM6jXhDRrNWqnhwTHowt+8FB+BLAfkZMA9A+pfI1hmryMjrVuExOav
	 vMVCnWuvkFj3ETk7Coqk5YPkcHeVhuBHvrHqpb9LEab3FTysp0OfyiKKdHeF+gIW3OmPm
	 4uw/5slB2qbpJCrl2ocf26H3rf5/tLPZiFx6kxClaOO6QYt+xzQsjB3nPSP5/eUlX4uqh
	 Z1h7aFgYqH3qG6xC5EwQlvxsGcgnAORc1Hz/X0PXDs5TKyDDArlIVpRckne/yMjRozA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007367;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PPgnV+/icpoFhI/kUPr3+TxF1BiCW4u9d+dKLSBISVI=;
	b=VIM0ajStdAG1Hh90Mph00jQBpan53eMrAl16JWyXJB19n+a+rC7XOyOBetvP1PT31PAL
	 wVt7Moqa8+7sp2k9r2Mlm+ne/O/U/r4h8nyULW4gwat4ZhzUVadnYO5g8n4IgAXBsR79Z
	 qxw/KUtsqHt4jPtodP4Dt6UNcp/6hWb86n5HInKzf7CL7/IFaaklhSZbOizQmZr7V90vB
	 B4jqZJHgpTom8eyWqY8GnSG/LUaOrqiwFC8vIbCZQrnYiz9Hkd++6TJ0FPPK+LzhHOZPp
	 XRjeqZLQUJYonyDX64LFGFq2YZROzz1AcSzLm+UibcpaOzBavHlQ6Vv5MRUHnamcuLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I6LOmRIZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AP5uw+QB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D163B606A334
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 23:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D163B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I6LOmRIZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AP5uw+QB
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MoRtC1105098
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 23:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PPgnV+/icpo
	FhI/kUPr3+TxF1BiCW4u9d+dKLSBISVI=; b=I6LOmRIZ58oRfznzvkRzyRiyMaZ
	WxMslWBgqRZMqsoHFQG0zoNErjGiDoXCKEgNCwuO+GY4JvhYPUOTw2ApqYbHPG2P
	M0KCSnyiFFIEhDw7ENkD2smjVCvj50Js0IQt1F2XOxHxdGn3UliX73SWnCU7+IuK
	/XQeBMtw0FuaDaQMZSS6itc2NoIJsFt4KdQiaT/IZsWq5f0leb2TrfMRYZvVo8en
	OnmusS7OaqnLeko2i9yfF5jfE7IDAAUl4O+PNWrcG79LSXsGDuPTPyDx14zljnrU
	BFAIuc4jYCj2/ygGD7W6H1lxKYqwgGyV8/adGkJIc49sYCS0Myjf66/Ew0Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsk3wh7g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 23:22:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so1127150a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007365; x=1794612165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPgnV+/icpoFhI/kUPr3+TxF1BiCW4u9d+dKLSBISVI=;
        b=AP5uw+QBeE4qCaVFu2hcf6dpUEpUCVUcXra1ZB+iktyAa8xA6DsD6B2rMNnPn5vxFL
         68SoQL0eeqXX9Yv9CuVXi621j0EBSAFNQsNb/Mb7x3k0I+Cye/KO/GoPgDJgbSMnpKI5
         xjasxSrKwCBJfNHrMLtgZDmBv1GNIPMtny0wrTsXt6cHpUkx0vYNelG46xRWOEwxCojH
         zUBsh1xiGsMMdeFPtGDmZvFBq6XTqrd93EqQaj5bJtaHKbc+87WJJQIaUysYMdMH1lD4
         C390z+n4INeirTvuSE6mRAMcnzRiKMWD8xmzqVSJp01qNTFsvm62R5wM0JbJzBP3Hgo9
         Wkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007365; x=1794612165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PPgnV+/icpoFhI/kUPr3+TxF1BiCW4u9d+dKLSBISVI=;
        b=H55WlAZ+QbhX6hE6kngHdgKfDAXHQzrNcFbT0fwHAajV6jOoQEPFgsXTvPas1Wyzlb
         Ffn4KsLVeEhbJAkG80u6eWM7oBrdKI7XDbiVG/0GinxXFOk6/6n7NuwVTxerwNutja8I
         N32Z3XRj8C3TxGBqBMsaM/39rbaKAVbhl73hstUIK5YQ81C/tIqLhGl4uXopCwIuoV6e
         vC4mtXOsmNFdMaxETl8mdz6YR9SovyqA0qs+IyyljaMJ72xazQmQTceuhFaaaOeWlEya
         50ZlyCDLtNR8D/q3+NcsYihTwZzhbHXig5RMO/NguoaXd03s7BCWJRCiyVcZJ7J//dev
         ZEbQ==
X-Gm-Message-State: APuU4Z9iFUnPyj7obb0NVk8Hll7lJBT29Qk6zyyvdT3mci4/ta/FBz2g
	NMPEvHKeUyh3DaJVeAVq7wuaw8U+3XcMgqk571qjh3HnjaL9RV3s2Rm1rmhJdPlLihoLezEvg3+
	t0+179GFRNVBIOYDNMRIKB1/gLISZle9t8+GEJhba2xkO1OReBNq9EAwmIXNNiCDl72ml
X-Gm-Gg: AYBFou3wFUi9pqqERidFX5muxxCcR4KN5RG9Sy8dFyGUkt/tSpe3BHHLiyjR+nPah9u
	mUdTeF//x6owKYCfKQxEor8q/cVgG89F2z4u1TUqi8WxlgH2QoyBlWek7LeQKF2XaDMM2jKKdL3
	zoaVayzdoqTYYkf0ZFlTphqn/vTv2jsURE570J4zCLpn1hvcu0AvQHgOIFv0XUyZ3eoy+Ww65CA
	wy2hiiGbnacZ/yTaX+UqG6DbUrTVMfWfAjmAmai94fVRBgyarb27R1fShynuhdz2geWZhIklzIw
	jxeQFxTrJNO5PIpzMvgrVZzWDUgWg6L5chTI4OW1hxU6IMOGf50wUN6J/KsrYnuvxBKqhhvtK5f
	dBl5sW/aYhXRca8lQos6gj35ieg/NFaaMGlXSAyn3zbSEFNKorlkor9xPZoi5jKJrnuEPqG/TWD
	bW45MyPR/n/sJlTtsL+105hhru+qVwI51fL/Dx78KH1UE/+5ajDO0SbT04QdpWxg==
X-Received: by 2002:a17:90b:510f:b0:3a5:c08:4c41 with SMTP id 98e67ed59e1d1-3b0db724f88mr3658906a91.50.1794007364751;
        Fri, 06 Nov 2026 15:22:44 -0800 (PST)
X-Received: by 2002:a17:90b:510f:b0:3a5:c08:4c41 with SMTP id 98e67ed59e1d1-3b0db724f88mr3658892a91.50.1794007364325;
        Fri, 06 Nov 2026 15:22:44 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10584b66bsm650571a91.14.2026.11.06.15.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:43 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 05/15] drm/msm/a8xx: Add missing a850 ifpc reglist entries
Date: Fri,  6 Nov 2026 15:20:57 -0800
Message-ID: <20261106232220.47602-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
References: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1G54eXB8_sOiDebUHS6d6Z39HGCugrNT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX8493K+w7mBiA
 No8S4G5wKliEy12+kX/HbjjHGJFUC8BfvSyHvnxsOG2Bntevp3A0TtLEQfAVMdd0AJaqqC+pQk4
 r0Nj5CdtnHWIs+gcGj7lssSIli60qER3RR94oxxQFZHSf8GYUPuCydJOH5+fc32fLMTJJVAZ62F
 7aolZ9bY/iHa/TgDG1Mzar0X4lpJS2u8jJEvgthjmVLP7+M0aD92hCzrdaWWyIrbPmXri7ZTfZn
 iSh0OeM6zHzKePRAb6KD0kficHpFedArBQg2z4xH0JpCuLdjUzAx1PcDxp55NmRO4fCjkbTeiPe
 Im5Y3GK3HnNRdR+iZmk1/j1LVpwcgd6Tmprz5HGajHljYw0e1kuuwqz2VvSj+04K7oSXrAqH6cF
 Fjt1TMGATknGz9JvraOwAGRzbRBvWrCXJg7g9kYGh1iYOjCVjRExhUK+8U6xUAIv7FI2H+5hhMh
 uIyT2bFTEe63xac7gEg==
X-Authority-Analysis: v=2.4 cv=a6OlZkSF c=1 sm=1 tr=0 ts=6aee6145 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=vdKEjRuvQ9rlgTdWijoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfXyqpBxMo8XDCZ
 4yPRg41+/vTZtmroPWDtfbe+/Ur4L9gXpTxHFgjhGi0CylaTYsx2+1CD7f25w40Ir5F2YY70F0I
 LaTW+2pxdV6p1GGDnypbsway9LswfZs=
X-Proofpoint-GUID: 1G54eXB8_sOiDebUHS6d6Z39HGCugrNT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060093

We want to save/restore all of the CP_PROTECT regs across IFPC.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index a3eab0307529..dd1a5ca91812 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -1393,6 +1393,13 @@ static const u32 a850_ifpc_reglist_regs[] = {
 	REG_A8XX_CP_PROTECT_GLOBAL(53),
 	REG_A8XX_CP_PROTECT_GLOBAL(54),
 	REG_A8XX_CP_PROTECT_GLOBAL(55),
+	REG_A8XX_CP_PROTECT_GLOBAL(56),
+	REG_A8XX_CP_PROTECT_GLOBAL(57),
+	REG_A8XX_CP_PROTECT_GLOBAL(58),
+	REG_A8XX_CP_PROTECT_GLOBAL(59),
+	REG_A8XX_CP_PROTECT_GLOBAL(60),
+	REG_A8XX_CP_PROTECT_GLOBAL(61),
+	REG_A8XX_CP_PROTECT_GLOBAL(62),
 	REG_A8XX_CP_PROTECT_GLOBAL(63),
 };
 DECLARE_ADRENO_REGLIST_LIST(a850_ifpc_reglist);
-- 
2.56.0

