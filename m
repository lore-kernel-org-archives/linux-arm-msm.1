Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBB037DAD5
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812005; cv=none; b=lRT/cvcsV7sH4/SK+icbGVlRoX8m6qXiFT7nXTm5cWZY5rMXcwu7W7f/G7+SgGJDkNprXDGaYUoIbIOSz0ELVR49GIh5gB1KV6vmlMD4VlCTRCaN5uv72f5JAX63F6jgTNMyey4X+B+UAKS9Y9bs+cPylCE4OS14ke03vK6wWs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812005; c=relaxed/simple;
	bh=jDxVuYGArtsBkgbMu4AfBN0GAXZlEl6FqQBI+qZUO9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sEs+fA5AdmDAWP6Rs2rtkFT9PWbI9su/i2r/73LqKAwxIWd/PlinT9ZnLWUiSUADl7bX8bJ3NiITFutXGOmIj5tdXcE/vDL9mn2aLq43BM9eezf0xf2KAFaQids2b2h2eKfGxK5fFZLgUdK97/NYswAh+A043+38J+amZXTUOwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZvxhZ/2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kAZukulU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZvxhZ/2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kAZukulU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC08fQ1933178
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=; b=iZvxhZ/2MXPWUIP5
	MtEdc6lZPHqkI/pQ2Tj6ef3weoMZbdUF4TJiw3SA3uvS6XtgzgIhV+ToKI1TL01L
	5AIOtTnxMqVRPolIBO8oHAI9sO/vJNlNxsZoT1J4TASQ+D6ckh7qdPD2Od+rdsf6
	GrVgU2xqv38fnzahVjuN9+UvVC2i5PdvHakUQRY66oiypMFQAgOf4P5FuDrwPHC/
	XpVGDptOM+dno7M/QuvPeLWN7Xgq3/QvM5BbgNIY9bRj46sH47bx27ldJndG3tLu
	rcl9L0CqrW0ImOFy//XeM+TGHXgvcJ9Gqq4N9uFQf5IBhKgKZf80xC3FphB8nwg8
	uvEI7Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkjdge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:33:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35ac5255f1dso3349792eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812003; x=1792416803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=;
        b=kAZukulUdG3S8p+nboKn6cLv7rhcjUaxExzKByrrL6DmEUvKADLNTwP/zszOf6+Lgg
         ZRZjddRm3vfcijyduox3bEvS3mcX8dY54j6ruuhWmKaxaC9ox0e1NXDKq/qs8isZ4xJv
         IPl7QWzdP8sdsxKIAlpeNK0uwmTvq4fYUwk7asC9YiYPSMojAJ44vpd4DtfCa6IEUit+
         ztEWYegRqcpcN1ep6iMwWuU4Hk4x56moH5oHDUGcpjUrTYKL2t2K4kCSvwPGrdHbpIjY
         wOLU9V3lsqPC9rUg/qkcfI4Q7T2Ix0lNdUHJ6davQ1TPiNHTPS11oi3Tk4Vy1ZWKTP59
         0bJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812003; x=1792416803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=;
        b=zepleX2fzisCeOYF27MRiKC5dlkuUj0AKRr4dBW+4UVs98/iH5Ndlb6/C1VNFr2OgO
         dTXLqbnqy/39cshJ2xqvDwBKb/g53jBZZL7OQOdQ6OKm3yYjrJpwgvE9pW8NuCzS4ai9
         GFqv3c9moz6ZWgNEop0YM/f3G/QVtGT59yb81GhrlKLXGUpXN5ZL9frCPZYK+0rEQS5T
         56vLm2vC22HxjzKUCKjZ2JPbo3vNQi+PBvIVSMtiDVHfwU20o7SMM7WzdVzlmSJKNEOm
         m+wX9IwyJVqIvXsLmSPhyHyNa9z6AbyWYnyn/7KTJZ4fJho5IB8wGv9vGmF6xekbP29S
         Kl2A==
X-Gm-Message-State: AFq9FYI/x2wSDByn1MYEJ1gj7dOw9f9LxV+7USB2JVvIHmrT5pzbppZ/
	Kv48bVgm+AJbujpAVwyqh7+n2eMgvhlTtb2gxD7PiF3fqpSi0tJwxiO1zbByl/V7tMS+4dv8Gex
	XDHqo0OLYV7x8WhYnslsixuV78/Xzrv2fJTABhXaPcBpQxd2oCgPKn3BbIReJjARPH3ho
X-Gm-Gg: AYBFou3TmZ22a84CUnG8k7kGN2kf0SU2AWmoz4fqX+a49mC+AGTRHyx1BkYLi2Dp7Gr
	WdA3HE+3xzp5m+8mZrcMqVri8dK1JEwyVa/YXG5BtHknguxaCdkwYonfKeUv9OOMKjl1nqIGhdD
	GJryiEkHmOO456aHDLMrByMjF/BvHO5ZikL83QGHEg7rluPINZq6zl35vk6gBieiI9JkQswWxXT
	UOLvjqBpPVXsqnWihPzPIDypg0o3PCbg+VQLkNXi4eNyRdAaufEx8RSe9FBBV5B4mym5MXgbXRY
	ke4MZ1sBCQ5zBvRDR96LrtmnqL07KCQuCX1qrDp5YH2t10tMDcFj0XZmfBT2Mk1aLrX8Re5xlDR
	K1kkjh8y7qUTHHwiLbujsFskO86A=
X-Received: by 2002:a05:693c:88dc:10b0:35a:60d6:8c09 with SMTP id 5a478bee46e88-35a60d6b499mr4823874eec.1.1791812002567;
        Mon, 12 Oct 2026 06:33:22 -0700 (PDT)
X-Received: by 2002:a05:693c:88dc:10b0:35a:60d6:8c09 with SMTP id 5a478bee46e88-35a60d6b499mr4823825eec.1.1791812001787;
        Mon, 12 Oct 2026 06:33:21 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:33:21 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:15 +0530
Subject: [PATCH v2 05/13] drm/msm: mdss: Add support for MDSS on Nord
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-5-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=978;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=cUv9ygkqVGKsKi0AqbVOUesQJiSTwCdwgeTcXPt+zc0=;
 b=8YJL9G8DTZYEfNm8VXZm1uKJy9LZZzb1+TO8eXus0vwYp4yGL7I4sSgLs9/5Lathnfe2tO+16
 iROM3kvT4CIAuf4ym5oR7OWLL0iGPGYZIJ8+7zujLY74xGAU4ipu3pR
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX3qzFDHfQKF4l
 x8iJ8BzM4DzO6LdnXp5R4EFoWGFk5142Fs0cq7jQAekxSt+4WyGcL+6lsc0gfwZ0l0fZD00Vb6E
 hex4/P25NDWHM1t2TWp4oUmhoRm6D5GFBdRt3abYOwEmKl/XDk6NtdP71WbIF3iJl2rLKXcBBv9
 yfHwC99kL4XiyBxowL+IUnmIzz/vk86g/7WCFJq5jf2J/KX4Pyvvjvu49zYGyCZEiA6zBmlGbER
 ICz0dpv4W5qZyeCsXSzwf2yGTJS7P7VUeou50hJ0ha5TvBMaoq0UDoY5lzk0bhxQaPu5MEtbUK4
 HQqLdZs8gpVST8Q7i5YU/V5xlPg/QJwjzW8iOdJOQPBXfpfSv7/zfLkkSHTtLRB5gLr5LJepzFy
 wz5dd25REZnDVx5kBreiFly325XG4VXvE/OqqZtxb1ryKAumyHU6uAmPHR5NJMtk7amkk/4FMjx
 LhMX2T/s771Pnh+PJsA==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acce1a3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ikCT10dxFQO67KJDykEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX5Ug3gC+L+C29
 U5Ifa8tsdFBIfZwxll24GQuCif2d1nxom+h+F4YP/dgJUDWn31awk0WXeDz7+5gLdCvDWzUHbOR
 RAMzMJwH3p/xfOT1rEqLFHef1dTf1ZI=
X-Proofpoint-ORIG-GUID: 66dLjzeNGCAaUvN01qQuObeffpb_6Zps
X-Proofpoint-GUID: 66dLjzeNGCAaUvN01qQuObeffpb_6Zps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add Mobile Display Subsystem (MDSS) support for the Nord
platform.

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

