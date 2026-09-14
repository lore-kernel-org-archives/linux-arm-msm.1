Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743F32E7165
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398008; cv=none; b=IcfDHyGdYU++Jl0Ap8trl6CdwfJwwzlfCW4K/sF4dy7mZM0+cW3zHXMc1b36jZGgrSrZLmJZW/lLiQFnL5iXCdjwWsiuTOtshTrCA5VtZs5N3xlk1CB6tGE+k9DB2jHC47KmX4oiuCHykLtG1mitzwE6S8dOpwL+NGW7Gj6Ec2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398008; c=relaxed/simple;
	bh=FOu15IfVscVgR29NkFHFBNDuZD58sPfHqAtlXoQpgqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OgjKBLoLFx1BcEsb1YbR/gZcErFhTeJpPrXVVpRt4DncTFerhiEaxTN3NrRr+0gH65v0ZNJCa5bXbhACotwXIy5pwxJFHwS2g/T2RE0N78cf6/G0P57dr2ja85CvXJk6WxnL7WOGhC4qattXV1uP+RRRPI5Gca3qRkXPela0/6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blqUaSU/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/ois5zR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blqUaSU/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/ois5zR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0gtr135519
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EzX6Y8Q0nJrzC5BWWNN7/NXu0LvfGsQ9qXt/GZGOImI=; b=blqUaSU/AByAjmRF
	3/KxVrVmmy2+UIwo9MJkrozlcxMh8I/dRjVhjcqOc+hwWPo9Dpo0szw9L+F9CiIw
	Rde8hKoMf7sN/7c/w80bl7DYgFYY2avc/obz4t1WyDD1fUm6QeSu1Xv1nzMEBJCx
	WW09M6pqd1ddBksaBovxdrvWkK7Dcdvsgqg5tFCHInQuTMfN6r2QIkcPFkdmR+qi
	GTB02Y6jTgvYp9wquYeMOnDycwBq9WzkHZ2MkipalMfAy8azPQ3HocQnEhWczN0J
	2NPfkZNUi3dyPKuph2wCUGkobdBg+RamG9iPlg6TdDFDcisnZics85ryx35ER40M
	5SOThQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq95er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:00:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd753a52bbso2249165ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398004; x=1790002804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EzX6Y8Q0nJrzC5BWWNN7/NXu0LvfGsQ9qXt/GZGOImI=;
        b=b/ois5zR/EafgBhf3eJBYuEKdrGrMUcBh3JWpxD3xUqXaGhHFXlZXUQi/4NIuxXBCS
         BZEr5axgnzjXjiK1322+KbgScnW75RS2y8S0ouY4B9LiXn/Sp3CviD6x3mxh5gau1WL6
         obAjEgmf72r3j4n/GhUhv4vTCnTTpOj7JO4YRY63v6iK+lyCfOU4CLBkE31UUgc/+xJf
         S1NkhhwsiC6GeJxEfJENBtsFpSLG2g5F6M9djc5StMGzenQLvUrBO4D7yQgxxa6FjWdu
         1p8PDXtBl+89e+ghbTo3xpFSGdAIEBLna/jiMDfMWUG+Ek/sviSjAqhCOcak7Z7BYm8m
         fBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398004; x=1790002804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EzX6Y8Q0nJrzC5BWWNN7/NXu0LvfGsQ9qXt/GZGOImI=;
        b=L7GYFFaZPRKRCI0apbhbGgxG4ZwxRO5QT2XU1xUTce3gwjGfQ5xo+T02irzeJdZtQv
         df6y30Q7QhTreHqJEl81jBsfo+NSWoyOXXu6KArrSSuZSW+VxLw1YeLjQQsuenhE3sp0
         iZIB3MX/PeSFis5kom0PYCFF1B6kTRn5jGw6CkDNFMm5pJxSlYsIvXJHj3IT0i3MZgVO
         mAe58/LP7A/h9qBD6hn+Ihmamx2QTxygkab+nczjkg77SFCdTkeVru91Q682WV4bLNCp
         N4pGGrfal1c33RiyhQ6SvTTEcisbbNYs8DBOyn7PBODoclAz6aNjoj+BWERyPqBoA2BA
         qnfA==
X-Forwarded-Encrypted: i=1; AKwUvBwKNp12pQF6CD8vwB5v626zXzcqO6I9o02EzXrTkqNz4056CREGf9YCvTjxsmhX30L2an1/U/BHztQpvA0l@vger.kernel.org
X-Gm-Message-State: AFuF++k04KwSsZFROOk6d1p9zs7kkYgV71t1OM/eIjR4V5EMSSwhXiZV
	x3TaAKRQW6D2zeny/ylGbRFJXYphCyspKSVwKxfOoznSv0OyD/n7kP2ExrlfzeF5eNxNm15SIJx
	jJAyhuLu4fsKLKu2F0HPsg/1No9B3XR5EWwHjIdQvW2FLpiDko+GPLWLBtHNVDenlM5+e
X-Gm-Gg: AYBFou2v90Xt/ds+LeD+wggVTmxT8Q05cgbu09GbQKO9BQf/c3puyA5j5rj28v+RIjl
	f05vBFgFVfkOtIVQT8ZqS6BZ9vohOwNNKNi1riTQ3E+okpql+eJHSvGcqxl7n9/BbWe6T5E5Mib
	7i1/Q1El4DRcbj9VzClaCzt6WyDjTwOAiBiXLjbN0RIBFjPpeu8dJE6K9NDmmF9c2P+vMfeQoj6
	wQ8OpDVrA6FYhMUIMpnjTjtqpfy9YCzokxj08bAIg2H7Q8t8shXdbEJsaFHGwZBFPQt0l7D0lpx
	r0LErcmctCYlyBzVdYke881Sj5tWAIXwESHMiR8QQa1AniHs3pKzhm94athioR1fmo8OOzlZBWu
	TRLhuFIUkWljZxkM0Z+Wamt7zRiGHJ4pRHmMx
X-Received: by 2002:a17:903:f87:b0:2d6:fee6:65ae with SMTP id d9443c01a7336-2dd6c5b16famr61615305ad.4.1789398003399;
        Mon, 14 Sep 2026 08:00:03 -0700 (PDT)
X-Received: by 2002:a17:903:f87:b0:2d6:fee6:65ae with SMTP id d9443c01a7336-2dd6c5b16famr61613975ad.4.1789398002807;
        Mon, 14 Sep 2026 08:00:02 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.07.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:00:02 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:08 +0530
Subject: [PATCH v25 04/10] firmware: psci: Add support for PSCI auxiliary
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-4-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=6657;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=FOu15IfVscVgR29NkFHFBNDuZD58sPfHqAtlXoQpgqw=;
 b=K6Xup1/+JMH4iBlOks405xptv03xSmRxdRpOFG8uwredQE2Y6VwEQ0H5O5UdKrsn7FCn47XNr
 +fU2rVjd4lHAx1eJNJQoD6tG8t2Xqsg9Fftyx5RyenNhZsPc+k8Sy60
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX8zMH0KpF1uGG
 D+JGSyTKVnOCgaiUIChFtbdfjLvudGuFm7CpBJvpo1YC+IoNVx9Y5qaL5wxByr9lZ6i/HsZbi+u
 8rvQxT3vY7ESjYk2gy1giM+lEZSbd0VgDNElxMt+/4S78K9/vVKpI/HaY3qxqVB2UXNtawhXU0M
 3HpC9EZngFU4qtIHv9saOPSNdgL/M1iJFYwvTuR9zec3iV6W/DK3T2pp2aVfgBvV0DcfUeJaASx
 QaqsS3bAx5GXsjEZrVO7w2O1afN7oWGRJEx1NSwNfqZp2MM3CDA+2W3pPYNtc2Z1s7OxQjvT5XC
 TLmFjyENaty89hq/0yJCRFoTKP2o+jA6Eg9M+kNok+TaGl5eGHTHZhmtY74Yxc8MzNmz6M7o5E6
 AHl2Es2JZNLbRFz8MAbgx2B1oJBO1ICvF+AJCG/xc0S2aLvOgVIu47KxxSwB9AajAgGHckVcUl1
 s2KaDBWeGybdtDKkaQw==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa80bf4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=eg3YruLvm9Mffrp2VfYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: GBIlLgg_cLaE4fePHMX6z_qOOHaQbZfv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX8KYM9ys69I9w
 lO+sUh3cLBqmw1ry9Ih2WXwM9zJmvDzCg++OfINhuNwovdNWbxnxGYV54P6xN+zmJsGzkgaDtjb
 g/3o2jfda8/ZNnh4DUiqVIMOAF7NnSE=
X-Proofpoint-GUID: GBIlLgg_cLaE4fePHMX6z_qOOHaQbZfv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140215

PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
Currently, both the PSCI core driver and cpuidle-psci-domain bind
directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
introduced, would also need to bind in the same way, leading to multiple
drivers attached to a single device node.

Introduce a PSCI auxiliary-device provider that binds to "arm,psci-1.0"
and registers PSCI child devices on the auxiliary bus. As the first
user, register cpuidle-psci-domain as an auxiliary device.

Update cpuidle-psci-domain to probe as an auxiliary driver and use
the PSCI device node for power-domain traversal.

Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Suggested-by: Lee Jones <lee@kernel.org>
Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                           |  1 +
 drivers/cpuidle/Kconfig.arm           |  1 +
 drivers/cpuidle/cpuidle-psci-domain.c | 31 +++++++++++++++-----------
 drivers/firmware/psci/Kconfig         | 14 ++++++++++++
 drivers/firmware/psci/Makefile        |  1 +
 drivers/firmware/psci/psci-devices.c  | 41 +++++++++++++++++++++++++++++++++++
 6 files changed, 76 insertions(+), 13 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 207a6e2db70c..9c0334ee2ed2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21932,6 +21932,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
+F:	drivers/firmware/psci/psci-devices.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index b88b01aa5829..f22e18b05053 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
 	bool "PSCI CPU idle Domain"
 	depends on ARM_PSCI_CPUIDLE
 	depends on PM_GENERIC_DOMAINS_OF
+	depends on ARM_PSCI_DEVICES
 	select DT_IDLE_GENPD
 	default y
 	help
diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b9e4ad7d43a3..0ce6a83f6588 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -9,10 +9,11 @@
 
 #define pr_fmt(fmt) "CPUidle PSCI: " fmt
 
+#include <linux/auxiliary_bus.h>
 #include <linux/cpu.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
-#include <linux/platform_device.h>
+#include <linux/module.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/psci.h>
@@ -122,14 +123,10 @@ static void psci_pd_remove(void)
 	}
 }
 
-static const struct of_device_id psci_of_match[] = {
-	{ .compatible = "arm,psci-1.0" },
-	{}
-};
-
-static int psci_cpuidle_domain_probe(struct platform_device *pdev)
+static int psci_cpuidle_domain_probe(struct auxiliary_device *auxdev,
+				     const struct auxiliary_device_id *id)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = auxdev->dev.of_node;
 	bool use_osi = psci_has_osi_support();
 	int ret = 0, pd_count = 0;
 
@@ -177,16 +174,24 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static struct platform_driver psci_cpuidle_domain_driver = {
-	.probe  = psci_cpuidle_domain_probe,
+static const struct auxiliary_device_id psci_cpuidle_domain_id_table[] = {
+	{ .name = "arm-psci.psci-cpuidle-domain" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, psci_cpuidle_domain_id_table);
+
+static struct auxiliary_driver psci_cpuidle_domain_driver = {
+	.probe = psci_cpuidle_domain_probe,
 	.driver = {
-		.name = "psci-cpuidle-domain",
-		.of_match_table = psci_of_match,
+		.suppress_bind_attrs = true,
 	},
+	.id_table = psci_cpuidle_domain_id_table,
 };
 
 static int __init psci_idle_init_domains(void)
 {
-	return platform_driver_register(&psci_cpuidle_domain_driver);
+	return __auxiliary_driver_register(&psci_cpuidle_domain_driver,
+					   THIS_MODULE,
+					   "psci-cpuidle-domain");
 }
 core_initcall(psci_idle_init_domains);
diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
index 97944168b5e6..68e381f1a618 100644
--- a/drivers/firmware/psci/Kconfig
+++ b/drivers/firmware/psci/Kconfig
@@ -2,6 +2,20 @@
 config ARM_PSCI_FW
 	bool
 
+config ARM_PSCI_DEVICES
+	bool "PSCI auxiliary device support"
+	depends on ARM_PSCI_FW
+	depends on OF
+	select AUXILIARY_BUS
+	default y
+	help
+	  Say Y here to enable auxiliary device support for PSCI.
+
+	  This creates auxiliary devices for PSCI functionality implemented
+	  outside the core PSCI firmware driver. These devices allow PSCI
+	  child drivers to bind through the auxiliary bus while sharing the
+	  PSCI firmware device as their parent.
+
 config ARM_PSCI_CHECKER
 	bool "ARM PSCI checker"
 	depends on ARM_PSCI_FW && HOTPLUG_CPU && CPU_IDLE && !TORTURE_TEST
diff --git a/drivers/firmware/psci/Makefile b/drivers/firmware/psci/Makefile
index 1956b882470f..8e75a0ed6f74 100644
--- a/drivers/firmware/psci/Makefile
+++ b/drivers/firmware/psci/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 obj-$(CONFIG_ARM_PSCI_FW)	+= psci.o
+obj-$(CONFIG_ARM_PSCI_DEVICES)	+= psci-devices.o
 obj-$(CONFIG_ARM_PSCI_CHECKER)	+= psci_checker.o
diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci/psci-devices.c
new file mode 100644
index 000000000000..f1eca61e3269
--- /dev/null
+++ b/drivers/firmware/psci/psci-devices.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+static int arm_psci_probe(struct platform_device *pdev)
+{
+	struct auxiliary_device *auxdev;
+
+	auxdev = __devm_auxiliary_device_create(&pdev->dev, "arm-psci",
+						"psci-cpuidle-domain", NULL, 0);
+	if (!auxdev)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static const struct of_device_id arm_psci_of_match[] = {
+	{ .compatible = "arm,psci-1.0" },
+	{ }
+};
+
+static struct platform_driver arm_psci_driver = {
+	.probe = arm_psci_probe,
+	.driver = {
+		.name = "arm-psci",
+		.of_match_table = arm_psci_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init arm_psci_init(void)
+{
+	return platform_driver_register(&arm_psci_driver);
+}
+core_initcall(arm_psci_init);

-- 
2.34.1

