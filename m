Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581893DD52F
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 09:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280241; cv=none; b=Yh3ZXyV7AZk57XLv6alnA191vzA1SmF8sgxclbUJOMp69mjhlw1IhZLRPMagQA1I0xCUjEHdoqYx/BE9ws1s3yFRl4ZSMBY5K6UVUHo3RSFaMF7HfAYl0G8lFzg78AfDmvXOvBP+mL5rRet3AGV2jNBefJsfAh1NIwineKonyaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280241; c=relaxed/simple;
	bh=cKCbUJL3peZodopZrkU4az4Vc5EiL7DexQZLckubZeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CENdD+urI6wvslpTuG20pB+aBP6CiQ0l1ZpwnXma4+J6ZOM3BhmCTTtm6+4m4I2mAHLIFFK9IkwZeNc8Fdizr1tha1paO34ZU8vPkx1As/2CMEPaCY32JtPvFCRAy+Mq0mh4/qJXsV56QnHlaHjjHu+LUCBokd9Gqh+DwiwxIcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QoxI3MXo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QcmSyfs6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QoxI3MXo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QcmSyfs6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966e45k095547
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 09:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bLRe/KiPWxzXT/tAnFIYoNKsNapLNEr3heqbzCvIFlU=; b=QoxI3MXoX8I+o0uv
	nV7K3HZHkNuNV2VSvXnDVB0/NF/VJWnX/tQ8DUQda5J8acAvHuC9KDuMrcM+14EI
	+sh3mRsqnF3hHAKp01QWd6lyyVh18r6qWZEKsfYfFsOZyi9zoswpkGw4oeCfp1NJ
	U3hTJjU5kuj2pKk4Z8y/Ebv/KjkCzh6GQr4PrZsD08BlOg22dyihju/Iv+e6vfbD
	17mhRGHXWWUKAjmSXb4PUgB1FAPiVIUs9Npk/yW9+O0snZs4u9vF0kJgnt5ABdXb
	Ma1wuXS4Fxr7j4xr9Kx/8H8QqwMWKxzlgBtpLdIThfPzK9ZI9iuEb4md16KuVyWi
	+bVr6g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr3k14s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 09:50:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088202so1991750a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 02:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791280239; x=1791885039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLRe/KiPWxzXT/tAnFIYoNKsNapLNEr3heqbzCvIFlU=;
        b=QcmSyfs6y1fk6DyL2aTtBlTETRs9xr1zemTb5WA/M+cjAkwyozgUgQHnSJRIpc6XPr
         QIU4r8lpt+ykLopO2wy5cmfT1CGvEIV2hTjkxmK/cIiPIWHb2R5vb3OEaY0bUSYcAX12
         gOKTHakeR6qP2upTyL75TDcmVgb3tHepDPIbrooMZE35uRdWpnD7BNh4G05i4iQj551x
         uiWMwTWSKiLSV6oCqc2nZazD98CXRMtLs2Y0QnUVl5aVASOvibDhGl2CgehZJmeqkvF6
         0qkb56B5Fvcxy3YH1KAXuLYfMMxJXVw4sITTY1iGhyOcZuPMwZQn8sBeqnxGgSkObHKL
         huig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280239; x=1791885039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLRe/KiPWxzXT/tAnFIYoNKsNapLNEr3heqbzCvIFlU=;
        b=v3iec01C6ZeOejIv531ptJqYuv3MOlhpj3UWRiqL88fNx2wxkFH5nGGylCDUFfTo8l
         idVnupUnCcPk6Q7DciIIItJ8Tm7Je09oDEMIuQu/w8VQcQYdUKdsIWsjJXx/GDeWQAZU
         /N5G0T97x7Mf6olHAlRfmskBj4002cA9AusfP836Phz4C3XHC1GfUuoT5OShqC0ZnZ3Y
         j5kDWxQYfHUd3j7lmSFYvNbUPJT4JiTj0ISv9z9xrUW1/OTcBYrKVE19t1YZiemLccnm
         QVZ9m8TyKnaWKGzfD+g7O3dJcpsNqYjeT7mTyBdIvFwEE9a3nFQnsomrgzczaLNn2gpu
         0eCw==
X-Forwarded-Encrypted: i=1; AKwUvBzDrNIJrLcqkZfIR/URVp31mo9T1qzf5K6liPvRw9n9qiTPfq8VfqSGSIqZRgL9DxKCYN42vKDMKoWYmTk3@vger.kernel.org
X-Gm-Message-State: AFuF++lnk+5mBIE/wfsWEQRu+22lpUia195z7t7Xe/1pyhXWil4DmSrs
	sp47iKmKqfRs4PcyPQV96yqqIDzWNWnU/OvA3vPaJr7XiLGkuOfroCwhtgVrjhJ21mPrsmbjSiY
	4bndwq5EVOCuQYf8oasjLDLgbbbfFV7sc709avyXPJ9NgfrC2i9fE2AMEQgynY8rTOsWm
X-Gm-Gg: AYBFou1Ofhpnjra279uycqWhY78p3nkaj7TdUFRj6m9o3mBdjObozzVveqpJzbpkTRu
	98hijYGzD8+BPNQVxMXVkBk7qDtmIdG9jPP8RyYW5L8jg+40ZQsc2fVFUyPItn3GCjJAQqiTedP
	HLpC7S4Yn0ynnMdESiwfyy4x++YOB34ZKegVzmlVdWV6nvmFMyZxzz0qwDNsB07aHZnWU75HL/3
	WStvg3i4qbp9nXetrbHIQPtHP2QmolVy13O1QJ5JM1beNRKJLdKQ7CRCVxqdyryTbSum1X6gJ2s
	8PExy3wZTGUWbAJsS5CBkME5KAd1cpUo60L5Z8JpgELZgH3pPSgJSRFBMEA2ZgNu7ovy0XjMfMR
	Knl5zoz9tTlJKtpd4+nBDNOIgVsQoESdZiL6yVvpsPn9mc8QHaEL+4bFC1N0Qa01b
X-Received: by 2002:a05:6a00:2e99:b0:88d:8074:1a7f with SMTP id d2e1a72fcca58-890ddb0c9f8mr759193b3a.12.1791280238641;
        Tue, 06 Oct 2026 02:50:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e99:b0:88d:8074:1a7f with SMTP id d2e1a72fcca58-890ddb0c9f8mr759158b3a.12.1791280238135;
        Tue, 06 Oct 2026 02:50:38 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-890acde961asm535523b3a.61.2026.10.06.02.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:50:37 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 02:50:29 -0700
Subject: [PATCH 3/5] platform/surface: aggregator_registry: Add Surface
 Laptop 8th Edition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-mahua-surface-laptop-v1-3-406fc042162a@oss.qualcomm.com>
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
In-Reply-To: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791280230; l=1170;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=cKCbUJL3peZodopZrkU4az4Vc5EiL7DexQZLckubZeg=;
 b=6tDSpCSmekiNK5dcRRYH8U2GJbxjtEyfcL4E8yOW/PBvh8w5QxuuX3bhjmPX6A5+uyIJxIoJB
 fF9A24FLXLkCCnoEaFFxWdSjV0YJceYOj7OCM58f6hUXaZosor/ib8s
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: tstJbRPnzL9NgcciJfunmJ32y3ANFWqT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfXyTrQ+w2mdZ6u
 1ZIDZwiUnf48Fj/nYHxodyHj9Ora3LPood6SvdxqzHv6t/x86EBSx2BzYFEXD3qixvAeOc8WnvB
 kXewZXEwYLxZxHF3JYWkrF8YSySFIIg=
X-Authority-Analysis: v=2.4 cv=PNWaavqC c=1 sm=1 tr=0 ts=6ac4c46f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KHsj_NB48akNOyL9wRcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX3TO5JaAemVjr
 STnaqcjBmKOC9Q3OyVoZUOZAVwVCwUXA4oiwYqWKQfd44RvSjfm2WhSRQ/Zy1Wd8NwIX/2yvpnU
 brdq1IsSExoq6VDGR+ZH2VmdkhwF5egawKeVBxrlQ/KEBsdzgonK4d7CzWgq58qfPNlZX8mM6KX
 nNS5++xuTOyxYHjzB11y51U1Y4J+renXhpWoStqIBZBqndlJfk8dRQP4xhyJOEHRjd9RIN9Gc9q
 7cnEG5TfOGVvTud9aALz98OqzdNSmvtXa710C6Zy96eVryQut8V4LkJhI76DQvDVjEYc6xJWO8W
 /tzytkyc1en2UnIK78+u44dEmF1ARlEdte501LCbMBQ2RXjYJjJGNMpOupGRwMYNYmvzAM4uIKH
 eDggakcnx5jhqgejF5yG0TcD1BR3+oDLeVOW0OBYyxdsFG5+H3noeKzBhSXtEm6HMZZyw/89rUU
 MQnBAGvuiHEHpnnZWUA==
X-Proofpoint-GUID: tstJbRPnzL9NgcciJfunmJ32y3ANFWqT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060039

The Mahua-based Surface Laptop 13.8" 8th Edition exposes the same SAM
client devices as the Surface Laptop 7: keyboard, fan and platform
profile. Battery and AC status come from pmic-glink here as well, so
the Surface Laptop 7 node group can be reused as is.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/platform/surface/surface_aggregator_registry.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 061d4a567a06..cf3ae252b1c4 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -517,6 +517,8 @@ static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
 	/* Surface Laptop 7 */
 	{ .compatible = "microsoft,romulus13", (void *)ssam_node_group_sl7 },
 	{ .compatible = "microsoft,romulus15", (void *)ssam_node_group_sl7 },
+	/* Surface Laptop 8th Edition (13.8") */
+	{ .compatible = "microsoft,surface-laptop-8-13in", (void *)ssam_node_group_sl7 },
 	{ },
 };
 

-- 
2.34.1

