Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FB83D7D88
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488082; cv=none; b=czT/P7sPXRQywe5tR3d4mrWk1XJ8SV2iwX3ONm9AQzeG9vve/8yC10hdi6gJZ4NRWeAT4v1xnzP7Hb3kpdlGG2/PgWoZeLVWmBH99EENpDVjgiX7zExvlDN7OkgZG2+6BjdirBz2J6L2n9B4Xj0ilAkUj10WvAUCBNrn7o8sSQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488082; c=relaxed/simple;
	bh=HRt0sENsNCg5TdKNkCgya6lDVoy/7AWXDcNPAdbMVAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OeVHqragyvsKcnqBb45Uauh//ftygq7vjKSXQFkJbD1FKBNtvBQxdOn2RRt8fpVI+x5rjSBJdyVOqkloQr3W9urTn7qKo2ey867AphvVX5EzPteR/cBi6jnXSvYUMVkrdMR3JDR+DnlzzJVo1pWJ+Wn5lkMN3VpLZPIS6WyEGr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mrpLLmWX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCdV+5q8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrpLLmWX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCdV+5q8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8ZDQn3292876
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GbqD5VxK+C+Q7QSDdKxrIg/DseTMU+6U8ntfH9MGA8=; b=mrpLLmWXT8NUY65b
	NtRkkC3/V43piqloPgUZjAqnkBZDu8JI3W4upCEJRgcqcmGq0s41g5ncTUDZpDFK
	bMa6cLz+vL6j5vnnrvrOkNV3AYJ0qdNyCR6JJLca1GgNhTEwYK9r4yQeBJAkOY95
	l6lfSF/qN6iIDT0DCTMo1H82mUXytuHnjjMgmKrnjftLKXEtc9xl0vnguRTwgqNR
	O2AyzzQydUdYpTfSc6mhkv5eJdIzTRK+gopYHl7Wa/0vIrjF0jF5OXPQxvgotFcs
	UqERTdxSEXU1VJHfyiupGcJMIqxPHtCpklVtLUUSHGdwnuj/ZWxmxV7uPyGcW2GC
	l1Kwlg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrayg2fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:54:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ea24a2db9so78293585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785488080; x=1786092880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GbqD5VxK+C+Q7QSDdKxrIg/DseTMU+6U8ntfH9MGA8=;
        b=SCdV+5q8J8IH2hsBGJly/8bWiVmv9Qd9imoq2wEalowId8VmaEpM892g76eK0ChRGv
         WgQ4aYgeLWIw6RmcKLFTyW7pqeoMJDMe/OhZdSviJFPhGFA6ECVq2OpzRizFwgf08kl9
         /BptCKCJA1iiX//E4R3R2e7F06n5/TL7W0w7MOkdDipTx8mMwGBU0mDq1jsExNzP2x4k
         KXHF+6u4Q5+qkzllF5WEzFrmQQyXS+rNq3DUHWZWgbniW+fJV4zOi+sEHRg8Ww0pBmCC
         KM6zPygWpON3pG5rG3YXBnAHOgK+6IgtqNDi1Qg7SmAcNiAj9rfi+8M7KT1MDEoQp39P
         eHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785488080; x=1786092880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GbqD5VxK+C+Q7QSDdKxrIg/DseTMU+6U8ntfH9MGA8=;
        b=R2jyYlEN1W29DkveaHpU5w9JVmSreWwZCr9IWGv4JhPWDXTdPzV1WqvBUVOGPjGoi4
         QEq/1wLRyFBjePLekU4lkXKmdROfLt+LzaMPoQmQccXGttrfqo0DuOrDUCkKa7UQ9som
         cewS2g7javR3QvOrFKiDNKV+ztfM1rYpwENIe5IMP+C2ySFnfU5EOWK4bF4pe2HAD24I
         jCRp3kVQb9azY6bRH1Zc53cX3cQSDeyuVw5W8KwhBGTa41RGkE0uKuS02nhXRbUmxsOI
         dnrmu0PBsOVqCftFQTKMtf9A5Vc5funymxo0KvGCVH54VYp6PruOOR5i0pNz9HPI+Sm+
         gRaA==
X-Forwarded-Encrypted: i=1; AHgh+RrmCZmMeBQjNKTwlqn0dby2wLgXqcIJC3vNQONso6mDPwQJNWOJE8TcOLE2wOvXwtYQ40DjyPY225Wd8iVs@vger.kernel.org
X-Gm-Message-State: AOJu0YyV+8kpwm67wvpXCoNm3m2/xaT1Jk69sKSwk/IQib+r05i6Uj5+
	+wVn+K056YfH+Qa3b3wQ2r+rJUyQwos2NYq0bDOLtH+Z0x8Yp+e1M4SFX5inFpFN3AdEqHfavR1
	JfyMaYOTy9Vc998uTjNJzYmoa730FhdMnbPO3FxKL2tBvwl3+VPljahhtGUf+tfBH98AJ+xDo/x
	df
X-Gm-Gg: AR+sD11prWedodY0ho0p7/FYW6nl3lMocaIG4/vVFHNOLXP/mKwC3AI3oDvkhkuYMMs
	RhOu2qWnO2JXL6NWOb6oh7lDj+c5qfI1ut9k7VpyZla1YsMYKvYNiLGfaHiG5fczfIQ0ebZcIbk
	P+YrCflqCbPAl2SSxCAN41+70sEp6xfRcrkLjNAq0Oj6BDvfTMuBmCURx3peSiciGY78CbaFXJn
	DYi4B9UoR524dg++8CZVxiPaapnWFjEAL3wuSqzYeC551igztaBrip45f3SSdaHPOO+CtgNJK12
	t2PUjrlO/A44VUj1zdB8p7eBzou35BHBvU8Ets04tA61UuJBKAtMCOyRzV3Pun/byzVIMXbUa1M
	+v5lgDs8x9oe4l5JHGf1nKzBIXCVNhnzM/OkOvSLkkeV+QgGOY4Dmgdo34T11dJYYlgkLdhPwlT
	+t+hHgB22bGmKc0dL0NsWvo3+NZMXhmynHmXGqmQhAkt4lqrk83Ov2
X-Received: by 2002:ac8:590a:0:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-52b4b04fb35mr12426251cf.42.1785488080101;
        Fri, 31 Jul 2026 01:54:40 -0700 (PDT)
X-Received: by 2002:ac8:590a:0:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-52b4b04fb35mr12425921cf.42.1785488079517;
        Fri, 31 Jul 2026 01:54:39 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44e9f0bsm61899366b.43.2026.07.31.01.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:54:38 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:54:35 +0200
Subject: [PATCH v4 2/4] media: qcom: camss: Add PM clock definitions for
 QCM2290
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-camss-version-v4-2-be8b716a8c4d@oss.qualcomm.com>
References: <20260731-camss-version-v4-0-be8b716a8c4d@oss.qualcomm.com>
In-Reply-To: <20260731-camss-version-v4-0-be8b716a8c4d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: wXug30IH__ZOSSHLdbZiznFGytTK_TF0
X-Authority-Analysis: v=2.4 cv=Y9fIdBeN c=1 sm=1 tr=0 ts=6a6c62d1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=AlTZOvFHHOWiQJBrp14A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: wXug30IH__ZOSSHLdbZiznFGytTK_TF0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2NCBTYWx0ZWRfX+nWzM02I0sqH
 uUG04v32sY+9cccwELcSSB8HeCYfYsFUetT3/vbtN0nYZ8gOdsSp+XGUTv3qMtFmw+f/jHL6aO4
 MkKcGxn2h5aSs80K68p+hzdx5hiGGtQLMbKTvQEj521JSVq5kQr1zIwXK7ZP6IKNiGE2z9LrGZC
 Z4Pfd/UJyImqi/qqdg+wm8spp+qbvV8GGf2PT6paffx87yBUVnxv9KCVtjIa+cpQPZdqOO4Dbj2
 vSSkNH/N65Lg4ekxzVt3fe7rikUV6MZKSjSYAf9LmZZrXa32z5AVpa27w958rMOf47O5r6VAIg7
 oacdZ+ESwrwd+wBsyPIg6WQzvpkg1vi/EYeGscbea50qGlyuYMQsY5Mkx0pInutI6C0Oz5rdYcv
 00LKnb3DsUiZT8e+WTpKDUytvFT/Vtxvs+eMkpKvNuZ+4Ni/N6wETsEvGrlB+cdbOvag4NV18qs
 lYYZ7uNHHk9IY86ysYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2NCBTYWx0ZWRfX2qulbIL+uYWS
 TNQyKYKccdU3KcaudHVAyPuQKRXYEuqsU7egWVnMqTFamsFsyhhnwPl9MRJ5R0lAc4TsOsv5LPu
 kr0EgeRxJsxzdIoRg/Pm3Avjln9AMbw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310064

Provide the required CAMSS PM clock descriptors for the QCM2290
platform. Register the top_ahb, ahb and axi clocks so they can be
managed automatically through the PM clock framework (they are part
of the camss-top group).

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index b541071e97fe02f38aebda1d9b096b930d1cfde5..8827613d34fc77d43d865e1bd05aa0cc14a4cfca 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5594,6 +5594,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.pm_clks = { "top_ahb", "ahb", "axi" },
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,

-- 
2.34.1

