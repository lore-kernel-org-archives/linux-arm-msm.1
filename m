Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F89D3F326C
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107762; cv=none; b=myLnQhOdI5sxmQuM0fnF6lYU+1JIuEX6kHCC0T8OK0InEgUojk/CK1J6qFy4s2HfiC/7F/I2L50LFK1OApT5ZrUd6dIOBJH0Ggleb2td6ScuTX7Yn1ZfX9bBKxUGV5QEF44gtyTh+RBg8O1PjmzH7ZN+n2Ia152OoPObuAT32cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107762; c=relaxed/simple;
	bh=0L0JCT4m4SJmuTDQ+ialCn/oDk1pcYctuSrLfXdVlfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r4S33TX74NlPgEMoTJAQrk6NhVRmzLC4a7p1KiU1rqyV2ZEyOnRvNXRMnOnpZRwbChsrQEv1FxQltc3ImR4XomdXD9WO7yzanLBd6amrityHWUFaxskSnXMs3HS03CIAbGiq7js64Cymu8dytO2VV9db7PRp/8KjFLV/WnDvl5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGCvurTc reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGCvurTc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B5Np3Y099825
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SNjbE1OBTi0
	QsyaZe/ehtUm/QCb8UHhqjcRZksbd9v0=; b=GGCvurTcTnGquoC0xoezhw7uEM9
	mZubqQOY/NhAVKh3U+aAmaYpk3hXhjTPzVZlRgX5dHF4/dWDiphqEj4F/pc8sTEj
	P67CdKWTakIITN428ir1+Am42pSaN+eeksl4jGjWzdGkzBkisGszukqCv13hr4+P
	vB3C/qdaUlFFwcDJ1PBelex0v2yvRUWasOrANgNzu5fSaF3kIfBU7mpR7JgLaekv
	pcylbxHfHTULfGvJnbq7FfzdCJXVIaga3g6mMa/I0SI4KG4YPEf6e1zCbxSxBdNJ
	i2ZFWFm6Duw4QgdqRU8Rbm6S36QmozLGK/+sYnqyLNphu97LQGiQPkgiJaQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8g78g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:22:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f3426a7cso20005585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789107752; x=1789712552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNjbE1OBTi0QsyaZe/ehtUm/QCb8UHhqjcRZksbd9v0=;
        b=DKysofiwrR8zNfhDQvjCa/oa+FyNUAPTrectBx6U1IwM/jIdpMGeSQbkbZH8PxweNi
         TS2tZeL/4+xpTlkzp4nLOG9Z+M3mTE4fiVpz6rADv00uxEzAUVKZPakXo2kGE6uhZ9ha
         MDs2zscBkzNR2uLnPOBsUrExJlgYPfEHeD9F4BiIGfkjq7kbI5T9RB3dfodl/1wDHyx5
         UNa0oemZ8wgpJbtxftL76UR3htqOseYVK6zTcfYdpxgqkin4CCK/SnJav/5XmISzo2DE
         FMERlTvGtSc5L+RtRFFF+iRvXhhDtC+hxE/D2ndQLbBWwynjN1wzCHwIgvaKK3xcNMos
         Eodw==
X-Forwarded-Encrypted: i=1; AKwUvByu4luE2zFIucnCi5H9yxorLc6DSzPUa9yW1+v82FJK+Ra8WlPDARF2bXGdiy0dxDelfzLHCnG4FIU4jjbS@vger.kernel.org
X-Gm-Message-State: AFuF++mzoG6sFWmJ/rY6S2h0MJKt/4/JQ6UIOynYOFzWBamrqE/FV03l
	XXF/jQxPDG1AdoH5QjiWAlgvfLl1MGeihFdIhE/apRiEK8jH0wCAeZSYQ+FJBfphkrcMt3u/YVP
	VWiyU+f0pQ1IGeIC+uM3jsA0UeeOf5gvd9nKaWDQ0Qkc1vi4jvuY3d7oNCLgM8bSs4De8
X-Gm-Gg: AYBFou1gBv0H4XHNva8ZAKb7+ZF2GHl95HsJLBEAyESodHHUQtaIKiSQSIAXrqsDsgZ
	s+tEV1zSXlR0qxaQjVlakyUhL/b4pa+sK4YcXQTzH7UIVAppgezPQCAuGZQnQ+Hghf76Tg29bm4
	t0yd/V4OkeMqk8VqalANPqtM9d+jQoXJkai2SV18LrO9oH8KXQmRO/JEqgb5hgnQMbrxcZgLcSq
	AJWIi2L2I5Dh5KpG6P5PXKATqFJNJTs4jqoUYY61uZtmjAgr3keUTA2EjXPeh7xM+T5MUVf1YCo
	h66iTpdBDVxps4+yYdRdC1XeX7TA+W6y1kbjivlc3SO/ZkHF7xV8g8Yg5uI=
X-Received: by 2002:a05:620a:6f0d:b0:939:a199:45b4 with SMTP id af79cd13be357-939ea195c50mr353478885a.39.1789107752598;
        Thu, 10 Sep 2026 23:22:32 -0700 (PDT)
X-Received: by 2002:a05:620a:6f0d:b0:939:a199:45b4 with SMTP id af79cd13be357-939ea195c50mr353475685a.39.1789107752160;
        Thu, 10 Sep 2026 23:22:32 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea60sm3681969f8f.17.2026.09.10.23.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:22:31 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH 8/8] media: qcom: camss: enable streams API on SM8250
Date: Fri, 11 Sep 2026 09:22:13 +0300
Message-Id: <20260911062213.195007-9-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aDQXji4mxNUPX9EO9GPMbnZyeBrVBs08
X-Proofpoint-ORIG-GUID: aDQXji4mxNUPX9EO9GPMbnZyeBrVBs08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX4/wS4Fubf9ym
 GfVQDkgODSedzQCIhMXyrlt6/4ot6uTDodh3SVoAwX3tYl5peK/8QqRkFJeR3qyLdkQ8pKjwAv+
 FvKqpSq4NXQgmvUuRMMUKDtVXLSQHdh6cgbwIqj4lRFi9R95SUoaQZvSRIovzaN9HtAMNF3Tlg1
 jzdKbfJUkk8DSLO8m0Vsv8eYc/8jFVqZnp3H4Fl8k4GJXdAisv9N3YZnT5Hk0MKJsmKMvFuzELA
 WLLHSKw6Z5WFqHEiLx2aWK3sQ4IUKOwDQ9T2iIqnZe5a4v5BLcRJ/VNFBsoLTjsvrRbZSan5Hsg
 uy7j3kwCZzPs+rc6oN3Dmms86NkSdj/QSofLKuowuvud5GIknWNu4dPRUkb05O/fTdsZvXXtDTi
 /1w/KD5hz8ZmfQzJo3EFws+uTMUJej0AQy+GR7pJrDDLeKPqU01CqAzU2pkWEwvGCmQx0hObIBg
 S3phsNzGLB61K5fCxFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX8MJKwHWfvO3P
 uTtnrOGrDG3slRc+dLIqF7JirtZA3vsx5m1rnzqOr/hGuVO8VR8pr1Wdqgbu4MS/85g+aV/WWIR
 l2P9xvgdUwiEKXUm77cVodq2BAZWjJ0=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa39e29 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=HJ73pzCofNdhR2KX5BsA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110086

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Now that CSIPHY, CSID, and VFE support the V4L2 subdev streams API,
and CSID-to-VFE linking is fixed to the correct 1:1 pairing, switch
SM8250 over: set streams_enable on every CSIPHY, CSID, and VFE line
resource entry in csiphy_res_8250[], csid_res_8250[], and
vfe_res_8250[].

No other platform is affected; they keep using the legacy non-streams
subdev ops.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1bb22cd23c5e..9bfb0290395b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1964,6 +1964,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy0" },
 		.csiphy = {
 			.id = 0,
+			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1981,6 +1982,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy1" },
 		.csiphy = {
 			.id = 1,
+			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1998,6 +2000,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy2" },
 		.csiphy = {
 			.id = 2,
+			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2015,6 +2018,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy3" },
 		.csiphy = {
 			.id = 3,
+			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2032,6 +2036,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy4" },
 		.csiphy = {
 			.id = 4,
+			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2049,6 +2054,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy5" },
 		.csiphy = {
 			.id = 5,
+			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2068,6 +2074,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.streams_enable = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2085,6 +2092,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.streams_enable = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2102,6 +2110,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid2" },
 		.csid = {
 			.is_lite = true,
+			.streams_enable = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2119,6 +2128,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid3" },
 		.csid = {
 			.is_lite = true,
+			.streams_enable = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2148,6 +2158,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 			.line_num = 3,
 			.has_pd = true,
 			.pd_name = "ife0",
+			.streams_enable = true,
 			.hw_ops = &vfe_ops_480,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
@@ -2174,6 +2185,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 			.line_num = 3,
 			.has_pd = true,
 			.pd_name = "ife1",
+			.streams_enable = true,
 			.hw_ops = &vfe_ops_480,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
@@ -2198,6 +2210,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 		.vfe = {
 			.is_lite = true,
 			.line_num = 4,
+			.streams_enable = true,
 			.hw_ops = &vfe_ops_480,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
@@ -2222,6 +2235,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 		.vfe = {
 			.is_lite = true,
 			.line_num = 4,
+			.streams_enable = true,
 			.hw_ops = &vfe_ops_480,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
-- 
2.34.1

