Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71C942049B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378837; cv=none; b=IAiyxRbkC62grqCwlKOtXClN7slbDCpWnZEpZmuWycU2+vu3ROV1YikB9uIN0M+qb8AHHtyGde0awPpWzIJgVGIEatsd5WOj6b1Qu/puvtQy4IsnZsYfyZtr1hXCbLwfoPZR6VjFNWD3vKJmyatevvLF/9nT4YYEcwNtuye6tGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378837; c=relaxed/simple;
	bh=Eup0TFC52Dvb5C0RkUrvytnZqSb5g4QWq/ztKU5w+8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/BVJahGJC0/JeNgs+ZcRs8nnpmlTx3IzuoNVmj8INPOJtjJdIVOR4BFgcddGV8c4m/UmT9Xb5dZrHDWBg+lriTTHIe9TqR+6c48i3q7w3fKoVJ2gt+b6GTlZ03aYvPw7aVwHWLqVhF6n9zcVLoPsu6Tbgq1/Ay6+P+XTSJD67A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRHBF45z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=am6KVJ+1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRHBF45z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="am6KVJ+1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ilSg3369254
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jLEBtgZPD99ESKFnRmQeGhEc0KH9pKzoTmRMAH/wIzI=; b=GRHBF45zjkMEa/aQ
	DPBEp39VwMgYCtsR+lOVJ9DVytz9ho4CvOvD5hneLrwyFgr3W3Cnem7dLCCDt6pd
	kzDnJir+5XMq5ZAsk7FiytBnp01hyY3Rwv0xpNUw3pny1PrD9h3CznEqY82yOc9x
	jTe+g4H4p+KbnaJLMcEE1H0i/6RtGRY+2tWwTwVT71Fd/72VC1CDDrlcASX79cnt
	Ijj5W58vhSGpxJYPh7zgfSXUhXteTkvyIWkB4t/Rvf2YFtMGYeBn34ukjlmXGfPc
	CMiEKWNI8zCI3a7UVUSql95BtG9MmWvsVKiTT3rw5kPP90lY0ftZl6an0rW4giS4
	ywIXxQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd602a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:40:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso3808102a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378834; x=1789983634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLEBtgZPD99ESKFnRmQeGhEc0KH9pKzoTmRMAH/wIzI=;
        b=am6KVJ+156hCJflJnhS6eZHTCM95OvK1MroOV9CmTQ3PmpnSIjqO8wy+hYgICCKzn6
         WaHTJBbF14irVS0j88vwKSkkxdKcwOBzMjfxJVMerdSIdE76fsnTZUW0obRUCOgU2bxa
         zJkkwYSLq8tdlrhC3CqV5fbbpC97leFw/5hbmr46hKWt5G8pq1f6hp9SCpdc1XXJ+RdR
         9S5CVoxsHOBhDzzL/JCrJE3dY2H6Fj4Y+mlTJjHEFP8/uvcaU8iSvkPhGtgx0+DSZvn4
         PhvPv84I+/y0zhvKZUKJ/S4ee1J3Agqgih1V5JBz4Nol8rxexhI8Z3ZxlCuKahdfrZ1Z
         X2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378834; x=1789983634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLEBtgZPD99ESKFnRmQeGhEc0KH9pKzoTmRMAH/wIzI=;
        b=qpjs2Uivy87DWCLIaqfjATkkYYyTtOBBf5LMST8mLXuqJtDloKtalss5Bm3nhsXvHj
         IcfV1qaOjcxERZxMunP+nd4SzHoLWv9Mimh3vRI6cY1ksqmHoI20uFrC1UhmpAWblhxU
         bXvMHA7bLpp2Uxa+xd1hce1tlu9M97Uts5zuoyjHBNDrZPn/UAz247VKmshXyVyDPC5Z
         m3Q69xNdI2KoJsuUY3VJlQ7NgErA8XNJx5F+sC1mlO20VPZq8YTN7Yg8+jovg+kBPTpB
         y9sY6GeKZW/Qc/CysT9EReAhUOl0N/YT1N+H2RSjw3mzeX+PB+OgP7E2CxwvCz7iZwoW
         ZoAw==
X-Forwarded-Encrypted: i=1; AKwUvBxfvNjVYiu3VyLNj6b/k0LW+Hvksu6EBK0AVKPo45ZOcbNde+sdOARgTtlQ8kVGjStKmLTIoNSJ1UJy+rJa@vger.kernel.org
X-Gm-Message-State: AFuF++mK3p5x1HQwaS/iF3jSApi0NgIWqAoZ7R9ztHI5LziTu4wBqjnW
	SbnF1q95RHhviEyCQI3rluum0VSHLrBzLZLQeb1lJCKCdUPdaU69+Bnx/NidM5tqpPbZQNceuhf
	WLHwfnUkVAzhtAJV4+W/3RJhIzuNq92Ls8pi5M9BiYs85ltaUY1TIAUPxeQ86A8eFMzCc
X-Gm-Gg: AYBFou3iLNlj5kY5CSq94weHBLXw/zKzwoEEVybB57Qp/dv+AOVekcpGD8y+msGaE8Z
	y1WGRgP+URQl3D/9yUaKcGEwIsv/o5egahuNEQ9R3rVDeYuvau3GY8you5rka0tqlI1IkQ9Nq9q
	uOjJPNC1pV+yVtZ6Uyp0uUnugfaSo+aEQhit/cYbJMAwwNcL6MkSMaPQ99qgQkyihbtMphqvoWv
	6l4TQim3Mb2lkFy5feHSyJGsi5KuYMu4gE3i30U/h6UrJiuMkiXfXzS5L6KjvNX4c7c7ZI4SuLo
	uF4dD+ZNQPY1byED1WA9UNWGLkaNAr9kfPZ3XpAZWbpcdLj0P/Y+pA08/aYhZr69kj1YHI71IBR
	CQBDAPFWcemjBd2VoinW4b/jVSmnR/cnL9mUilMRsknfZcV622wscDF6W
X-Received: by 2002:a17:90b:39cc:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39debf94eefmr4068706a91.8.1789378834163;
        Mon, 14 Sep 2026 02:40:34 -0700 (PDT)
X-Received: by 2002:a17:90b:39cc:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39debf94eefmr4068644a91.8.1789378833728;
        Mon, 14 Sep 2026 02:40:33 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:33 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:55 +0800
Subject: [PATCH RFC v2 07/10] arm_mpam: Fix mpam_dt_create_foundling_msc()
 to create MSC platform devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-7-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378765; l=1946;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Eup0TFC52Dvb5C0RkUrvytnZqSb5g4QWq/ztKU5w+8Q=;
 b=fXbWfUPGaOjktIrRdd0qWh/gG9DAXYutlr2e3ZmvjdmcsduoOF8c4KLO90VZPV33CVNCkTVC1
 Rxwgo62tnAQBpp4OtifMAO9MA/mDvKp/0V6F38k1t2gH4Muaj3j3HEI
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7c112 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rtFuv77GRgtEkpuRCi4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX2Hg57FVbsd2/
 wOQJcwjCoa/B3avB2ixREwuthnZAujxPeddpnnjfWO7aYANJBYMD3b1nqeUoQ24mWq5tWEIIu1m
 YeDgsMO9KipbxKl5SXRf7hk/NZvJ1MByroJ/cNsNVJlVfXpeFApsNmx4TgIebNgYCKFlitADkfb
 3sLIjF0/QFswIUI1jms8uV59Yec0NatTOduKdB0hCY+jo3KFjj9EujO6wRWeUcjIPHveXWzYjbv
 zJD1sgC9We4GOgnbfpy4w+IsCGwoqp0s2gNaYp7OQ6z4itWehrxH6kfa8XwmL5QolssVcxFo5tt
 QRsXRBqvTkjcqUbbiHOeOTaUFrSmj6Ke9Ud/ITjk9kIxrMyUUZx9i5gWyhZR1qUBQ99gBMr0y17
 +xk7n+CLMcL0ca7CDWqiwG0kosox0xfLut6I7TnZHVlCqrZEB9E9ulCJZv7xSUmM5lVHjqhvz/F
 ZJI0U7h6lH9/sM9EcRg==
X-Proofpoint-ORIG-GUID: JOfa8rrOG8lxXzzCJK_Su7qOxBEe-ZZG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX637L6Il39xAx
 E2Xwdw1CUQZFeq2dC/4YG9iQ854RYol2Dy4k1JhAIQAJy6yK8D8YdzmLhIh5Dpx67aRFZpLC8G7
 4OT3SzIo8Z4OQ8eg7NtQpedg9HPD/40=
X-Proofpoint-GUID: JOfa8rrOG8lxXzzCJK_Su7qOxBEe-ZZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140137

The original code created a platform device for the cache node itself
rather than for the MSC, so the MSC was never created. Instead, walk
the cache's children using for_each_child_of_node_scoped() and create
the platform device for the MSC child node, skipping cache parents
that firmware has marked disabled.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 480e38cfa86d..7ef3ed55b066 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2366,23 +2366,20 @@ static struct platform_driver mpam_msc_driver = {
  */
 static void mpam_dt_create_foundling_msc(void)
 {
-	struct platform_device *pdev;
-	struct device_node *cache;
-
-	for_each_compatible_node(cache, NULL, "cache") {
-		struct device_node *cache_device;
-
-		if (of_node_check_flag(cache, OF_POPULATED))
-			continue;
-
-		cache_device = of_find_matching_node_and_match(cache, mpam_of_match, NULL);
-		if (!cache_device)
+	for_each_compatible_node_scoped(cache, NULL, "cache") {
+		if (!of_device_is_available(cache))
 			continue;
-		of_node_put(cache_device);
 
-		pdev = of_platform_device_create(cache, "cache", NULL);
-		if (!pdev)
-			pr_err_once("Failed to create MSC devices under caches\n");
+		for_each_child_of_node_scoped(cache, child) {
+			if (!of_match_node(mpam_of_match, child))
+				continue;
+			if (!of_device_is_available(child))
+				continue;
+			if (of_node_check_flag(child, OF_POPULATED))
+				continue;
+			if (!of_platform_device_create(child, NULL, NULL))
+				pr_err("Failed to create MSC device for %pOF\n", child);
+		}
 	}
 }
 

-- 
2.34.1

