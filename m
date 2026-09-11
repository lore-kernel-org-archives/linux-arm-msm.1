Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327E8446847
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141074; cv=none; b=IhiQxZzoCERMJugEWf0w9BvNMh0iw/OZOX+pVAsx2B31ySCuchy9dKCPQzQfOXJ/jg+JMk2ydUMdUDCwqgXjIqKvZAIfkmJdJE5raMJCWnJB3Ip/8n8/xkuDpE4hJSOEfsAAJAs958S1DSPeYE8OPmJz7msnDBm2Ehii7tdtJ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141074; c=relaxed/simple;
	bh=VJu6MRwBVHsoAfluthDJbEmZwi5CrZjFQXXrpc/s6FM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s4Odje/oZ3fCfq37QcJgwvQNuoQEp1TRYiWkmX5q6nmkRVjn8ajJaGPxEsGWKDqBhjKOIaIVS9FfIYmkj3mZhQSMO3sQ//UEPrrXsPu2ezTWYvfrV/MmyR8Ir3XumDn7VTe7crShbCZxZlrZSHqiQx6RjwTLOnrjcA9uyG+8GKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQFT4JWx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFoJwIwK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQFT4JWx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFoJwIwK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BF8jnW170575
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYhdb2mrR8nU9aigfyRID84GWgE0PGCAeGyhWEowOUM=; b=NQFT4JWxD+1csMZw
	ESk1TX6Fhzc3vBHA16zM/ySR1/pGO9JtHUtWv5Yi0YuuBHPcd5QO726I4J/D7yPH
	5gz11IHQNNI958H5RP6ItWVF+ua12yg9fDDD7WBIa8nZtFPa96o0pzLjOTOSpwKE
	3azZWpz6ZRBCIl2Y/4udZ1p3+4XD5f7amVejkCQo/fTY8iV76XJLqZopreRtxD77
	9XRuF4BxM/9sBT5nO+XZLlCaB4C/IqbhxawfKYuKKvhMbaZjb1LXd1FoOqaWts4W
	4r1+2wDNG+GhbKBZA4Pmr53Sx3YFT845zFabXet0Uy2RE8T49awBPLHZfLNxKAzf
	axps6Q==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm1e846u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:37:50 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c18e7d53b9so555093eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141070; x=1789745870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYhdb2mrR8nU9aigfyRID84GWgE0PGCAeGyhWEowOUM=;
        b=KFoJwIwKDtvb+v5dX+9tUehvbWCn4jk+yk/N97LW+zD7v0StEcOmeSRZ7Jp+pByyhF
         pS1QtTg1CcM9cn4J9C0K+MPHOXSAopgL0ngXbMOUy2HUl1Z/kXnowDdPa/CJj9Cw89fG
         w3a9/b1rkLyfBPWx8cKTAjVuKfXadaJMoVKKKmTgIGDCjrjL9l6myZoqatJ8pxME1q0n
         YkMdjvZgowLarZYJ4UMWRaLpwpjrNRBiigLqN0QevjIr1slOHGkloM1y0fFifkEIga4T
         Orjnri36aKMrXw1CEN6WhSMDZNkNpjDzi8b5Uaz+saX4d1djpzofYy3duaUpFZVznwXI
         HChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141070; x=1789745870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYhdb2mrR8nU9aigfyRID84GWgE0PGCAeGyhWEowOUM=;
        b=KKnCrkbd/ODieAOKi/hMyxMJVcXY7yS8t9qXyE4J9HCdOUE1kQY6UK4uj+FcTF6wp/
         EItoAQJosnRUOkf7NWf6IJBjyomXNXaN8w/UeEu2fdoDTKsvT6ekCjm/DHpg3KeiG9OV
         99AValMFp2uuSf4Rr8K2omR9/pt12XBLmODRUvivSBwwB0ocLGnKxBxE1FDsERPXmNb/
         NKbhRXlUfpugfRsEAj/5/GYfZvlEXrKEQZCSSw+cvDIT8/zfrGJcMWVOdKDncl5oOfww
         46tfUS5bHpneA4VVnu2GBAekB+v3C6LcyBuEBzCfCSe3YvaAVMe+qagdT0BxYv9TtX5U
         xtFg==
X-Gm-Message-State: AFuF++kn5/myaJG89p/NaCuCROboVT9cvL84TggjAiYPXQVloaXToic3
	0P3J4ncWc9Y0seUk/NlWg7egAXTTUaxvO8R+edZ/bKafzaHUgs/0mPrU5D4pK0Gm7MMby7wjtw0
	EzfzKACoN/YsoKW9m0iXP8yr3rRnseJAvptiBRQqomHlflopULU9+MqUIgqTZMBL6+BU/
X-Gm-Gg: AYBFou1stXYExMN7j8Em4O30YxuElSOJk9c1BtBluprY8uzh1wR+5F3rgd/0FJKE7IJ
	Gibkqh6QHHl++ZaGrZcpaBvhwU8iBv+eHtOibzN5G/DgT1WLylfwo8CwIOnczF/QVc+fXkmgBf4
	5KcyxIR9gzc6TEtttGT65GXq69hiRSJCnyx6Quba72R5UR1X+r85TLNHmEEgkyFCEkcoX7POqGR
	hmgy/CwJVB2e57hNDbu0Jgn3AKBMd/9gHDgr4E/tnwB4ye1fCRXT6oYDVU5Uwg+FY1uFSfzmO5W
	3z1gd4Tn5fwg3g2kaZ71A2BS9Rp4+HchK620whv82XoQGqEXKEBdK/ObwJlMOspB7kOTSCrXncK
	9UcUtIKtsbNmmb00hlneJNuaiRE4=
X-Received: by 2002:a05:6820:f005:b0:6be:7d9:b05 with SMTP id 006d021491bc7-6bf43d77bf7mr4867246eaf.9.1789141070055;
        Fri, 11 Sep 2026 08:37:50 -0700 (PDT)
X-Received: by 2002:a05:6820:f005:b0:6be:7d9:b05 with SMTP id 006d021491bc7-6bf43d77bf7mr4867217eaf.9.1789141069612;
        Fri, 11 Sep 2026 08:37:49 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:37:49 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:36 +0530
Subject: [PATCH 05/17] drm/msm: mdss: Add support for MDSS on Nord
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-5-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=1053;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=WJisw/+zpwludqPzeBDoVioQTucO9qU4qbNXUeHxKlM=;
 b=hHol8Y26136yGC56A15G8+99pmm0imVUMZrkON09gKnyKhZyWkvuSsE1wnklhdgr/TgMl5aFo
 LUoP58xTe3yDUgCeCcV0N8aIyNtvHvGVIvyQl7IeHl1K38J5/hl1Xk0
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX7627hoQghv2k
 Oo1KIuG495UzV4z7QIIkru0lJINP23NnDbI2pd2l/ncrfQ1jNvTZseJ5OBIv4ypjAUC6Mw5Pbew
 MUrS1AjdahjXDBvPGCgRgNuyBdc5zmym7ofYEK2q/JQkWtOHF3lSdBLKPpZV6kJXmoyPzXrTxsX
 9tPUljH7RTqcUaEyxS+veZhi/gbfYSMTSP0Wfu03MOBiVwuOayMdU9TZ7NpAx0vv9uo2mKDU9EZ
 NWu1foDXxwC1D10EkOVRnJCo+cfHHVTavOEnO248IBbVixFaD5fe6wEbpfDhtGp0PnQd1zG2ke9
 4SlEAtgxiujzwP3loZ+/ZNaNniny6Yg2VX+e0+Nkxfac8XtaVFlBXSYGaFELDxfjAEC0Qg/lFiG
 20MY/u4/DsEFJPdDbem8FQ6yFQ75yv9biDKPgnTgXTmgl1Z7HFkF2pZLK+F5dthcPK+dNNZQy7/
 2Jh+1DLYjMZXgZHak9w==
X-Proofpoint-ORIG-GUID: NDFeTR4XA4_rn_ZO-dvGBjzM0xglGTuL
X-Proofpoint-GUID: NDFeTR4XA4_rn_ZO-dvGBjzM0xglGTuL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX65c6RjFUHCKF
 eZyR8TMWtJqyDTUMZ0Em9pVWnh1ce33/J/MinC+mYoFxUCw5wFj0IHQxsCTxbwr9WjD+jT7mC9Q
 TAgy0BQ/JdxKxJu/H35G1FlTu4SU6Sk=
X-Authority-Analysis: v=2.4 cv=LrwHWXdc c=1 sm=1 tr=0 ts=6aa4204e cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=p9I9VcFEeIzhw9_517AA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110218

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add the MDSS compatible for the Qualcomm Nord SoC, reusing the 57 MBps
register bus bandwidth setting shared with the other recent platforms.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290db..90bcc8c28dc2 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -531,6 +531,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,milos-mdss", .data = &data_14k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,nord-mdss", .data = &data_57k },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },

-- 
2.34.1

