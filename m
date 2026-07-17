Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6B342A144
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298030; cv=none; b=i0MYQylfmD6DsFZPLuxin4TVXYRn5nJMjkQXX80NQVJAC7WBY8lfJcEh5nid5/ckTQkzM9hQ7+Gjjs1KeMMAnTGla36Rnsv3YpkOboDF4S+eOU5voHqXC5WLvle+QRY5428ALnrbFMeyIZkTpmRBcb7UVrXPSn3uOgUTCka2AJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298030; c=relaxed/simple;
	bh=bFxeOuZY1WENQworymFUFHqlGRpphWDshqbt8T+PX3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JlIWijco0ZAzpQVvIisiLVG3qYCw+tjaesymaSNQO+cl4WlGRpqGH8NBkUljFkLNYYyeIOmEwRiBB80YpxGP8rFi4XtV1YCmz89MlFqL7fR1KT1IDejCshK7m/Oot3qVAHf3B4d53LsXPNGutZkRtpRPKB4HUE4mITc2hnQPMSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YdHI2Tyy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yd0Yf7wU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YdHI2Tyy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yd0Yf7wU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7cYw1809059
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YI8okjgDhD9LmAlPNFbrElCB0Y8XPnKT+xQyqggq9l4=; b=YdHI2TyyNhCkaBe+
	h0yEO/mT6Z1ZG4mnwm6M8HCqRioABwdMxBwLhB0dFeFhqSjEr3tmOscF3yT4Z8/H
	J6aNMiNhZcYC7NwSkH6bTrPBKXQlW7W/Gu6rfJPATAx7gLK1NNf+SvyWqQGGhMWj
	3WwhSWCw8ggZLUMnCo/6PNGXx3ByYrFwS2+NI/Pz4s2mxONk/UiYp1rAl2595chw
	ZyVnYPa/U2lBXWXbHUtkOnFSWGZxmY5F1LbtdUYBlpT2ZhkgHr2VJ0S/WvGGBzi5
	odwtDWURmFSV0ElOC9QBKuuI3KQ7RNm8QZGVmYl+sT61fREtKUwAhJXjZSdpsXBa
	92sQZg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8m421-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:20:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0ed4fe79aso188951106d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784298027; x=1784902827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YI8okjgDhD9LmAlPNFbrElCB0Y8XPnKT+xQyqggq9l4=;
        b=Yd0Yf7wU6kTcOEdCHJ7IlcTvfjSAnrb2cv68e4+xbFPiY3PMXRhnlJLbOJT9lwSgLQ
         oUZMw59f/lw/+kIMv1bB3Hg+2mYM/4n0Kf6ST33t4O0fosUl6cNaaQTVJHv8WLopKV2t
         qXdTAVaSk4I5WcFio6vxJpPAmkaIT2lnv0y7+pSdwNRXBgCmbm9G67vtKKMReagiJahQ
         UvOMRbHnjtZYot3Sj0QqRd4kndAe1GtZHb+kHbp3Gu3MxFq9QqTjlpoeYYe6wM9Cx2+5
         7vVpzNr+zbURGyohreyn++kDC0sb383/Hmd1BYkahkwdlKMD+63vAnmdfby/pH7om5Gx
         V6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298027; x=1784902827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YI8okjgDhD9LmAlPNFbrElCB0Y8XPnKT+xQyqggq9l4=;
        b=hD+wcmg2wi+P7msNLk6H9at4fEa3xasjSA5KYk2jdTh1z1oYvm6vRCwD3iQGBmOwTG
         ceNMufchlRJ9p8RHENcHGasK84SIxYJZorahPp9NmcDDbW4jj7W+t0gvFthd3lv8SdS+
         +dhGIvhbx/34g/CijEowwSIXvlLH/Co7u+HKzHkL714KB0a9kkbKOubvtP1D1zK6SzlU
         BgCiKExu7SEgoFUQNNDE85XRipJtjA0Xyhs9zevR3B9cAqEosxi1yM8n5UfbDBTr3UI+
         3glci3n4G2upALBmnZ2XVK7FAzq2ZcOQbV2eNOuYlpQfW5Ri/ExmmgqgOsGHBKu0e6QC
         3FQw==
X-Forwarded-Encrypted: i=1; AHgh+RrewXgMsbbc6HgTCKpXanV8gdV0HNEuA0Zo90wmuk2hHh3w7rm055Pisj//Rpr09WbP3CAOLxMQTyqGZhPK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6PyPhjpt7wxGCTc2hM5P62ICSaPRpTrZxrnoklDraia/qCeqL
	tYKLIHQpCVZzDzG5FbUthhJnvr2IgY4UT0DUOxbvYNofGMEp3VKgzJVYBJYupVDClTocZiVD5jd
	EsBaEDplzzu818wOhA47fC43R0DIR+yhh58EuG2BDkYEJh78O2PoeKFnT+MzHx7kFihp9
X-Gm-Gg: AfdE7clgw3v5iVRcuMYufla1Brqe0TDXNpUj1Uv+kXjU0cHsTiWD+jzl2GYN4zjlKe5
	UiOQhYlz6KoTZeId19gJGONR04FoRbW7YuOqCE/rhF4Lna41Zb29y/403VdtIdslXTMpN8paqQU
	xpN2pDJHzD0Tzri4V+iuCBpL5xiCRXY+oZ7RKRmmS+78HBu2MC7Ow1dl4VSr1u8RrCwQaW6ngtH
	Ft//T51fh90R2nbOvth3GWjWLMzNv5tnPDLf3FNb7k0a25krIgW7tR9af7msMEMesdDhbhYlYRv
	ovolO3XjfevPVrsqALaqurix/PIrUlR9N2jUPZH6mN18ZG+oxeuSKYIMN60qE/ZD6vSeMOzt/lM
	SeHtO32a/HxMY9etlGYZ3ohqUy8LLp5He3T+4oBr88RXc4xQ11a/q0v9gPeeArA1Drp+/tAtXwJ
	f2gv9Mp6eObLow2FOO2CVemNyQ+PItWTEYIE9Ij0yR0Do8YBVJmBM=
X-Received: by 2002:a05:622a:87:b0:51c:7b11:41a7 with SMTP id d75a77b69052e-5213f959efcmr24739691cf.84.1784298027294;
        Fri, 17 Jul 2026 07:20:27 -0700 (PDT)
X-Received: by 2002:a05:622a:87:b0:51c:7b11:41a7 with SMTP id d75a77b69052e-5213f959efcmr24739221cf.84.1784298026803;
        Fri, 17 Jul 2026 07:20:26 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf91bdsm79085966b.63.2026.07.17.07.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:20:25 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 16:20:21 +0200
Subject: [PATCH 2/4] media: qcom: camss: Add PM clock definitions for
 QCM2290
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-camss-version-v1-2-7ed71fea95e8@oss.qualcomm.com>
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
In-Reply-To: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 29FaHFzo7Cap2MH9SAa5tP4qlqQyP_aO
X-Proofpoint-ORIG-GUID: 29FaHFzo7Cap2MH9SAa5tP4qlqQyP_aO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NiBTYWx0ZWRfX6KKWx25dkVjh
 4+XI6rymJt4ORaFzUkbJbfPlVkq3FN5ubbZ8QEiXV3m1wghw5YYPmGDvHU2l/Knn58p/qxEcPP6
 cPen4puo+/nL9PW1ZtQ2BDek9OnCdGk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NiBTYWx0ZWRfX1ETtb6iLzBOV
 +RwhdQyh2N96cnHV09iub2Oj/kIPoiJcuHr3p6mNXPqqJD84zIrCpkLnYNUdySxq9laVGUelMdF
 hNYvMV1B3IzY+G7CuRuLwyvkh3laaOoO7ZwzDdxl2ftWYU4nrzp44RfE2Jo54qjV0PT7mve9qBJ
 rCk9QNpgpqJ2Xu2ScY0Txx2Kfnk0Lkhj3N2WxT+aBc68lDu65pgLzdtAAzjyGRgnnwxaIJb8YVy
 DKX/B7r/ONyjNz6U7/UELDy2lQaKXCzuaVI4S7LZvhT7C0vjWJrqejKuW2GncWuE2+N919Oql0K
 A4ocweq+fM8wJP0hvl3HdX0CABap7pPn/pIG3uMl0BIoBfArXSKOxs7Hta4PEYk9NSBPhob1yvO
 xe/z2jHG7XlQA61weVMe2izkXS4DN+QcAEjlQXNeqsLB/YNTfJMMOgszLeQZBZRUs9Qimefc/2D
 G4SuwSRikXXjW294xxQ==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a5a3a2c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=gZ4aIBoJpEVIEF-KsNAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170146

Provide the required CAMSS PM clock descriptors for the QCM2290
platform. Register the top_ahb, ahb and axi clocks so they can be
managed automatically through the PM clock framework (they are part
of the camss-top group).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 6a2bf3373e8755805c8cd0f8fe5037b788d68fa2..04b5601eb0b53110ce1b94248323dad1c08da9ca 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5589,6 +5589,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.pm_clks = { "top_ahb", "ahb", "axi" },
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,

-- 
2.34.1

