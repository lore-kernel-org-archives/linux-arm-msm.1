Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8038138B133
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427256; cv=none; b=aWQNRjd1Tu7zL1kGki9uTKNEyVVKY8aXMvrVKI0vY5sDPH6e0IgDjpzaOqdDJS+OEbV7aea7I4+7jWJlUVIUdAwBe9xK5Ms2wrg27RTpFtCIlMEUx6RxKusYVQvjPT5ooB+aPcY/BSBK5nmVpYYHeQgveod+36mixlajb7DPxwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427256; c=relaxed/simple;
	bh=NYZrwdZQ8Unx+4+MfgqEtix1DA4oaM8IOP1pJXmdN5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bv+YjP8mlcqO+xaEIACLmrosOc7ofy85LbxFj80bPilU5eI9Q8aM4mCfIRuQuuBF74fSAnS3ZKxKlMxt01cALEN0y7VGMjd03Z8hQHThFKeExuzm3QrwwUW2sO2Mu8nasBqSuhOv+VFCPLxKjv5r8b1A8nZt22tCOa82TsPwN78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/jRX1Tp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/pJ9Zsr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/jRX1Tp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/pJ9Zsr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQpVg1087253
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLlLllLuzegCOZuXn5+dUp09HoQyVIGVgRcx14v62PM=; b=M/jRX1TpvMeqUO/P
	PVSImvtbdOfYbcOhO0VXezo+gXswQjqaHNvsJ3Mbp0b8x8Kyeye2BSJbUG+/C4Rt
	9KdEnjt9DqMob4WOB+dpqLM+JfKHUAxy5gSjY/BtUJQncrKHUO3/rZv5R7u03tOr
	AXHcTNZy+Q2+koiThYECm5Vu07/NgdJWrdfhJ3F7qhjr9L6LeZ5c50O+NZVOiuce
	JCPyjNPfpScmNOyxtR2uei4gtyrYng/bz0zpFaKDRapZKZNBpGa0ocmPhQ/ESFPY
	ubUJ+4lOJYsrXa2QlWRB0oI7usRTN7gqiJfSihZeCr9DbkBPMJ1bF3tPXJbYuewE
	5jcxEQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n38cuu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:00:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0199faafso24483381cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427252; x=1786032052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLlLllLuzegCOZuXn5+dUp09HoQyVIGVgRcx14v62PM=;
        b=a/pJ9ZsrhOmMRU9FoPQR6x8VhHL2NXztqxJbHBClWmZCsGaifmSkgoT26DIye6jg8H
         1HPYGoBCT6ENWwfnbuKOxxvVxYLxm5ec3Lcqe7rzh8HW2Exooboc6aVKe0UKar5nvvGh
         tX52XPrCFlHlvghGPcBQknnrFJxItyqS3ezHWPePiIShcTxFYvfeHLqbfCcDehZclCuq
         +cyFkfTexoD9XRmMxD0k99NbgmBbAn38AGfYbkfnG7xBVRUN1uDXogOdYoqH7MLZOZb5
         rqbNMvcptI+grRALRNyBfLHG76sWlqbnmYyNLaAE4G7lQRNfVxy80rH2VIecGLHX98ku
         xRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427252; x=1786032052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLlLllLuzegCOZuXn5+dUp09HoQyVIGVgRcx14v62PM=;
        b=iJf4CECqoZ6a6omdMX1wFyLpcJEBaqiaRpgBNR3/UxDcmD88bAdRV7yZAtaWCSH2uC
         fh/ky7Z0OIFfOFFVyiPlFTijy11bxMClixx2EOrXJ4YDg/khNAwuzlbhJlZvd8PKmmc5
         P+o97Cb+T9NuErQw5XrngLAFqHbcj/C5DL3RdfukTcBSa7+YjgJ3A40g3/GnkykDWeic
         zfVZPx+eWeNJooRcWtNYOEA4sup7QpmuYzhfCBZKs3OKpQkoDe0jNzecu/3mNYQPbIGN
         eed3tF+4TfamurBksPh+p+uzuRCoCO+DhfgMP5RUXY0u+GcwXcQPt7VpHih7qTyFGyaD
         jQgw==
X-Forwarded-Encrypted: i=1; AHgh+RpU4xGD/51BTalKElRfL4RHmnAGVKXnFZieImwt2TQ8PBGVJqOCkYaC7XHCoA1wPbXNVu9M5OuO3OHhvwPD@vger.kernel.org
X-Gm-Message-State: AOJu0YwbdGN198adv8/bEIcGF5d6GdeDxvgcR+PIu3MGw5s8gA7ap2pb
	b8Ghk6qpuqoStYIlQ/wugBg5yxytysOJ8pnzd/1zW9udK1VRYvIrz9bvz2nTR3U2JgJram4/qQO
	LrIdVlvF1BLAugEsq7CFnpGSJvhMTkH4W4lHVNUeH+BSBCxu4qBjWaNMD3tg0yIkmtygt
X-Gm-Gg: AR+sD12dYYSdo4l3lOE4bDP5CHWtD6s4TMxeYUvtydw0dxEdj69hG5YO+8isXWXa5Bj
	jN53ThKDOC6O1csm11KyFg0lIGHxCLNPgY5GucfobijDADaGIl0842sS/X/Ysekq8+Sj5ZAjihM
	W/3hPUdVx1NAfAYJh3GNoqiPC27Bj311yrLMW/MTNu/lCezZJ2MJRPRvAmIFphYRkSy3k9+VILa
	V38LO57uMuA6EYBlwp8hq5e4LCtZJX2PVzs5wayNNJhAEw6RmJcRbbhBdryG0XYfHhYb7SpzET5
	YYhbMhFUMdsW+eDDATCyWfT/tCiFWGbWdGPFw3S9G2TpxYEvK6gDqE7JPBaf9fRw5Ka75e0WKQg
	W0M+6P2N0WiTkngqSO9YCOZwxJquUi03RWWliLcJmHjF10hrpiDgSRn7GCUxe4FvQGu/aLNwdi1
	MRbyvnXAhv2uKtB9uhjXnoL8lPjdC/6qsZxg5K3FaOBMYwfxxRyucr
X-Received: by 2002:a05:622a:4d8a:b0:527:73a7:ee21 with SMTP id d75a77b69052e-52b3871bcddmr35046891cf.86.1785427252131;
        Thu, 30 Jul 2026 09:00:52 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8a:b0:527:73a7:ee21 with SMTP id d75a77b69052e-52b3871bcddmr35046061cf.86.1785427251550;
        Thu, 30 Jul 2026 09:00:51 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:00:50 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:34 +0200
Subject: [PATCH v9 04/10] nvmem: layouts: Support fixed-layout as the nvmem
 device node itself
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-block-as-nvmem-v9-4-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
In-Reply-To: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Ar/eGu9P c=1 sm=1 tr=0 ts=6a6b7535 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=4SYEPDBQci7QR0ImIkAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 6JWk2OOiPg130nyiYZgTTB4NUDQ7Di1Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfXwBO0+ZcKyKbV
 OX46w/neV6qkUYJspP1cSNjQZN/GS3jsho/JxwNYvY8nckCIfo4KqYDaPV2eyMHFskqO84njHCB
 8io1EdF2qSyu8PbMCJeBFL3MZoQJVkRvXBArqdljSTcdeJPJ1oEJBAq8zXTD5wWvirDeS/RmW/5
 DfSHqRRTpoCPy1sJWf+2h4HPMkFjUQa4FhKZF1cAYbQotQt7Qd5eW5AdZ2aFPALaFefXX7OkD1a
 ageczhuBAB/g6xxYOWx745e9iHaJgZCz7saFVzu7sEGt4SqcuYVUltbHfDuihZeQqHtLxDPkodq
 lKZ25li+jgN2n4J7t4cZVHhWfztZ30bxv8XSWaRLPZwpRlSe9ImcxLRrnmt6AAnZNKyAIpRE77u
 NugjgSW92/eN/8JoBcZ4+lZs/NdKRZZfbBnPW6OaYhtfaKwCRyo/6IHRfpRd9WQ9WHdabE/b1pB
 l+uCnDj71KJfadh1KkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX0J38LWKoTTVl
 LFNO+bRnB+GfaguNqfyx5ZF4iHPVc6/hG5kReuK3rnXrFnCckw3fm+QL8QrOB79gMzIC6Zynhbq
 bPwbdo4+Iwuhfoszh/AfeV4JqkEocug=
X-Proofpoint-ORIG-GUID: 6JWk2OOiPg130nyiYZgTTB4NUDQ7Di1Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120

of_nvmem_layout_get_container() only looks for a child node named
"nvmem-layout" to locate the cell definitions. This does not cover
providers whose device tree node is itself the fixed-layout container,
such as an eMMC boot partition block device whose fwnode points directly
at a "fixed-layout" compatible partitions node.

When no "nvmem-layout" child is present, fall back to returning the nvmem
device node itself if it is compatible with "fixed-layout", so that its
cells are parsed by nvmem_add_cells_from_fixed_layout().

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/nvmem/layouts.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/layouts.c b/drivers/nvmem/layouts.c
index b90584e1b99eab4217cbe7ec48373e18a7caf0dc..efa631ce7283bdd6c8ecda75915911b5e3a33c99 100644
--- a/drivers/nvmem/layouts.c
+++ b/drivers/nvmem/layouts.c
@@ -167,7 +167,18 @@ static int nvmem_layout_bus_populate(struct nvmem_device *nvmem,
 
 struct device_node *of_nvmem_layout_get_container(struct nvmem_device *nvmem)
 {
-	return of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
+	struct device_node *np;
+
+	/* Search for nvmem-layout child */
+	np = of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
+	if (np)
+		return np;
+
+	/* The nvmem of_node is itself a fixed-layout node */
+	if (of_device_is_compatible(nvmem->dev.of_node, "fixed-layout"))
+		return of_node_get(nvmem->dev.of_node);
+
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(of_nvmem_layout_get_container);
 

-- 
2.34.1

