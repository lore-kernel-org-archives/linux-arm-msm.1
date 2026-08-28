Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B5A46EF87
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925935; cv=none; b=i4VPXTVpRnRZHT9kDqRGJTHwYXjSllYCxKq3nm7PPNU4jdly/njNz4C8JaP8e7Fb/1YkGQctvxAN4gTG5G5Yx+AMKHB47OaVYvYnWHzmusYNAF53qi/3oYgT7C7kK1jG2w5gJBkBKtocbJjdazKGo9kN9oXdZFwQHVXpwJhTKNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925935; c=relaxed/simple;
	bh=Xtl694D0DgWPJxP23Arvi4tkW3Ki0aks6uVKllA5u8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSBptxvnKh4ynCMKqG47v+3ZWA775m7T+F4/5cG97yyQpQG5wzeNOz5FKRYjIl7VE2X09PPhNJ21/WmwAozt187HTJU7O2XyYrW9bXz3xQWg8mNdTAGuT9sAP/lNfS0Mwq1uv1mz3wfjeX11IFh3J45Upnwkhy9HtP/fUdy8OpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgfnRBLO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZKnCiEJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgfnRBLO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZKnCiEJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkiGd2631434
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SijLPEyLEnAofFIXZf7zUa2hkI9h99tMoUcsgWGJx4U=; b=mgfnRBLO7+xtH49F
	uQrk2QC6D0rt/5dVeKPRy/DmH+pa88OO8C9ikkle5PujDNSOWr+ncp/TaZfxF0MW
	kAILn0v2fT77VqEkeNlxTQKzOnQ1Er+3tbblX3dh294Vlas3HUGqCiXxRpjuz83y
	jGnebV9LW5jQyJngOtI+sFo47kJpO6RowGCs6nXQxTR1MaFj8yve8B9hmyq9XJt1
	mKdBVDtYW8fIJXh7N9PsDyBrXuxgOHhADfrpJakoDHy2qbY5MHooOPaYPhHTzMPY
	z0dsFrGbRlh+UrF9jXSjbydb8O+nC8aYNTOjOc13JmCPDwVMCJUInYG5leUmSTaB
	pl11FQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42ra1g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52f9f6b85cbso10355171cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 07:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925932; x=1788530732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SijLPEyLEnAofFIXZf7zUa2hkI9h99tMoUcsgWGJx4U=;
        b=PZKnCiEJleuSkWqne9aHa7BrKmzcJjtRd3HNin5DImnC+k85Fu8xZdDDaZkIvcZZnS
         R2XhXYOn4mFzyJ4Q7R/0XoKTi/fs8gOf3q3odqZ6aVTMRuemuEnbbOXxo8RqQtvFEaRL
         w6NXTMF6jIhE1SrpN7tNdjiL8kFprs/1n0sKKwkxgDGUe9QPmu2oR30JS9YFMNuquWGP
         zTWy7KEQvhvY7KRwf62Y1WmXsb+kqvQfzoHENO6wvJCc3jV1Ra40RgysbjbiAqhVMOCa
         lEMcZChEOHtZ6xVh5kSOB+sacMwY4SfgH0zEestY0U03wqoMYlD6SEkH4RdIjqvcAle/
         5NQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925932; x=1788530732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SijLPEyLEnAofFIXZf7zUa2hkI9h99tMoUcsgWGJx4U=;
        b=niAEjoZlypxq8ikxLKN3BeDDFoeFVOxlpSOkxxZnDP+OVz79JiAxTjSnALniMlX7Mc
         7L2M5pL7sappU/SZgoqKzN4+LPISKU00ASIz7XoWzzW2j+JP1YX3Q0+W0X9UiHg5M43J
         WxVJRpqS8Apct5mm4sHv2ww170wU/AlJZfqyNIWKOZzN8AN9wiV0j6zOmkf54q/Uet9l
         coV/sZlGsHMRO0BQvG4ays8fx0MCZOKzICrCHA1pdz6VSKcfCmuvlb3ZMZgGNGoadSXx
         a9Ylb8bSknikOKBz7WqTp5JigxAY8br2n69HrmFkvtsCKxJsb1NXehUXHMApksUDcPUI
         MkrA==
X-Gm-Message-State: AFuF++n4vAvcly6iknFs4jJlzT3No54kC2kOCdxxPMADoOM8f/MRC9rI
	TmNCcGANgrKlXfCSreZLlgiOLHae0X6AeXBmYA/UWlYQxQJPWeJzpc6axBDTM6Z5uZc2BtUZ7p3
	elejYc2rmMwu40AwKzTqyP7BU9ZzqYdk5NhN2oFb2l/rH1TjHOMKAyRoMDp3URtIyAtMy
X-Gm-Gg: AR+sD13e46aaJRQ6gSjLTCZPDoMS3zg1wi8Pr6aUAOmk/0AWnTZcfi/ycSyGVN2kYqx
	b4Yc77DTP5W0s/t3oqgXp8cWx199qOA+gDa7biS/SOvfe4r0l50Pjd3g/xJampjG3EkG5qvyu7h
	m5Tdmy2vpPzYy0rsTYOLwMxH41HjqoLfGpJdI+J28Z/zIkiMywGmfCF/MhgRl9FgbIRcWbxDses
	u5Fq8Z2IIavEBpYWBV0cov3J45QaDWDrDVisv3Zcx6XyObvdabBn5XZwYJ8CYWnoyBoFFsKv/qL
	e6AreDlGa7RHD6Chpu4J4fucsmUdqLH9repp7YVNKsK2VLySoHNJCz2qF+la/jWBALoNtKxSQN1
	DQpujgtJhWYvPuuJ+hONeDz0=
X-Received: by 2002:ac8:7f11:0:b0:52d:3ccc:968b with SMTP id d75a77b69052e-52fb94aef37mr78759661cf.9.1787925932344;
        Fri, 28 Aug 2026 07:05:32 -0700 (PDT)
X-Received: by 2002:ac8:7f11:0:b0:52d:3ccc:968b with SMTP id d75a77b69052e-52fb94aef37mr78758401cf.9.1787925931811;
        Fri, 28 Aug 2026 07:05:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:05:00 +0200
Subject: [PATCH RFC/DO NOT MERGE 02/12] drm/msm: Properly handle
 msm_ioremap() without name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-2-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Xtl694D0DgWPJxP23Arvi4tkW3Ki0aks6uVKllA5u8c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWZqLsb4jv2eWG6WOsapWn81xKcReH32cGg8
 b8f2ZeSuxWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVmQAKCRDBN2bmhouD
 1y+CD/9MFWW20kWIW0usKkurL+trqzNP9TIAiBL1sxgQCfzfMzVh6USS1UWvFJjQD2Lpb2cRPUY
 zueE7v2zYP9txYiJg6btT/ijXKexAVRb0dCTAkaBwQmnXACWpieJurgtwp9Os5drwTu0LE21x/Q
 jSMaIZmvxzwL0m1YI/bAP0yj5CzRps2vOR8q2lQ7Nhx82fEKoaGcpVyXejgpg6oV1ZERZmEOQ/8
 /yo8+D2RfcgytxDu3qYnVmhvrb+n0YFMWbqpC0QEsjdT4zeu57rEs9NOLaaKvdO3S/VMbx8nMfK
 AmezuU6D8jMVsXDtfQGmSLvnj3b4Dwn/NQcmYoZl01swFhxSW3vXlA//RanOjXhSRJLvfajPkTd
 COeNEq3ncHYWh1z2iJrhl+5sZupEuVllbtl71ZUDS/gkrwAgVeV9kvSNsO0CcKYs536hEf1i3GV
 S9rAxzF0bBxTPg9TBEMHA6tz9ydenWhocPGKJLbEU8lPrsWmJZuymriUSHLRlfEK6g6hgqCCXCn
 M+Qs90q6T+9NnNhwnmPBDuNxtijSfOHwwgARf2IAjw2VhDgs1gqKejOqzzpkGq28CEmk6w3o6VG
 1EWfI3eQStM5WvJCcRbQCZudG83EAADcQkruZ1PcZM4CdJ28ANeG8o3/S8rzUiS8/+2ERJgd+aE
 ZSEHRDQ786rt4vg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: KPax0jTyX7C7I4zUStUXOGJcnGOQJkn1
X-Proofpoint-ORIG-GUID: KPax0jTyX7C7I4zUStUXOGJcnGOQJkn1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX3cM2+8WF0cko
 myE28w0nSnDALbfFzF1df+KCALqrsrjldD3j0oy8qlt5e/ZAaNu3jQjhK+BmsnWMZ9J1cK4CMbt
 H+/Po/oFNKjWpYyxy/49I33/wsEuCNyMV1nKZIf5sFePiC1C6OnuXSV0Jp7H9r8kzuE9vmiFhlq
 ADOox94xeEc11yv6NrfOGAH/9+z2yrp1rFEAsDbTfvdrvJ9SrnDWbfYADDFHXRxD1R3N/Kvf4Hf
 Y7+Is95nOAlh8rtDxCqpGHTpwFYH6WexOWTLxq8Sq7wsNMSLG3swTJDYCQ9TsQj4S5keVASFTkk
 Jcqh6KaD6z6ebJ5vuN0ZuTLavd4f7b5crKGyUu9YVXgfPj5uY2KHU4wqkdYBgPH04wxGY6aQasH
 8dV6l6Kghwryhr8mhjOZqEbz2lkkDVaQ4bZx83oFdxch+NIrg6Ly5j9CA7WPNNH5k62qLdilKFJ
 XQUO54nMLpNnOQl9ojg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX/lDzzqXMhSxa
 HKvbKVhKMAsaRqgX/HXAcVcMXeKyOC+2YpcSXM1NY4DmWrvOFarQE+KorhuZfESIJnO3O+9OH6T
 mpSud6w+rVI+O19Vm0cd6MdaN7M6NaQ=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a9195ad cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=or9nyMeYumr6D7LEzWYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280122

msm_ioremap() accepts being called without name of the region to map and
in such case maps by index 0.  However error paths still use the name in
error message.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_io_utils.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index a6efe1eac271..93b94e330cb8 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -77,7 +77,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 
 	if (!res) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n",
+				      (name ? name : "#0"));
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -86,7 +87,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 	ptr = devm_ioremap(&pdev->dev, res->start, size);
 	if (!ptr) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n",
+				      (name ? name : "#0"));
 		return ERR_PTR(-ENOMEM);
 	}
 

-- 
2.53.0

