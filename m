Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789676;
	b=YCRyeTzZMI+tONp43vDScnYTL5jHCK2IZ22QXTVaLSRJbe18hAa5qQ+rS6PeOEI6oPmV
	 sLqBGTPBcKVWruRj8TEhsLeyDSd/DVNl1Z2G9dOmoYt6JAao6fZWerJuv8xSsuM6Dck+A
	 kODr0BPARrOFwhZfOnRmIZVV6XmU7FfgZI6AvQnaJ1EmahR6sgYc9agnw0ogdGrPXoCWy
	 EPrbB++9BKux6fCFXaDDXZBmuTrDmy1NPIKjyROJfUeyHZa0GGQTqxRAU++YsjMUvLLLm
	 AN3c1hxKyuszvfFfTFL/6wqXro5Y9YB560zOq+uQwvUrDqWnILjVrpKey/BWbbxiPpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yMB3mkMVYyTMZemn6AiH7rHQwd0RWs1+LgrrTn6YfZ0=;
	b=q64U9JV3Rp8tFlAGn5dhW6YZ77E9MTkrGaoHF/c50caqwmvUN/UtsOMOtIudBGUZnYON
	 HyEbbC6+1HCzRcwnUSV+ri0J7ogJyQ6j/zd8RsSrrJuC8wkkcDXvvNP4Q2tBTt4DiWWZO
	 UezlGH9eI0sagc6+YkHLWsHSIGSWeEX2rM6GcGjhI4LGMPZAyAUxvEdcDMc4AqIeTL09M
	 mNQUEzf66dOIeWqPG2OjaKH/725Rn8MNqPg2SVLAACDeIQQIeck+F/gEu1JiQKcO8IkXJ
	 W9s2gbtToZhSzIhHRZuXZygKWhHbUU9mwdh9KhlHB+0hYOCwAgwoMyXPiA4XY/yhbdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CpuxGWka;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NHxBgOXa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C806070B8A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93C806070B8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CpuxGWka;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NHxBgOXa
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1qGi466728
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMB3mkMVYyTMZemn6AiH7rHQwd0RWs1+LgrrTn6YfZ0=; b=CpuxGWkasThTOEJl
	vWjdj3K4FCHg10Vk1ZYTteQcS1zVGVMuXaDLIw4sLu41/sO19hPJS24lUEJ4CMlF
	PPN46Zbp1djyeDG5hSUfhjHzBWR2f6cxOjXKcuQy9IG09SFHiTid7+6/gSZ7JrQP
	gcYmjgUhmR2KHBxmW39Xlr+B2xFwmH9Avg06EjGSSnoZls/ErikXUllL7PIWz695
	cvkqhf6h/aJ2sZV3F2JIcBNwg0UaWKQS4eW8dyZLnDLUpmGg8X0PGnmj3aK11rWz
	z9NWLJgUt+zzU3Pio4Joq1yRRQrJp/izxifgVJFjC094v5eKSvZGfKZ2xiTY9jEb
	+jfqgg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6sttg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:27:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0651873abso59534885ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 06:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789673; x=1796394473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMB3mkMVYyTMZemn6AiH7rHQwd0RWs1+LgrrTn6YfZ0=;
        b=NHxBgOXaoR4JWKE8GydL2XIysN97GmzYmuh2X8bwqP/6m+hJ62q0Cj9mlMighW2WP+
         5KZ3B7vSWZKjhxWw4Syqj3jFtX4I5BBgWDnlRZQ1+N6UYL5in+ZG4pqA81ElGp3tspEh
         T2FFsXuUUDmUw4+cTgo5hSa6Un1WTDKm3+RQQly7IfGNmknHqmjEekmat+BxVIUnjod6
         1YlcR43P1XbybIRQi+vZEYYywhTwfTCAK1+0di6ThPj6MpQnGD+Z60Tdpxp8XevkSYkH
         QAMnMwG1yfuOLlkbpI02zlxSOQr8gQLgUJ1c7aCex12wLdCJhmXprMGdbB/g0T43uGtG
         Bxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789673; x=1796394473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMB3mkMVYyTMZemn6AiH7rHQwd0RWs1+LgrrTn6YfZ0=;
        b=C9BLr1In5hgmlJbaKkO3w1N+nG6BNz03jTcesiiKJ272Vu82Ir4MSvA0tl+7smRJ/c
         q9LicPrUO1UJQyUK1XY9lmztP6mFr/PpFxDdGsVk045fYBXHN4eP+MXriQ7qAzJtw3av
         WT/623Mvwg4ONaPwpKzj1++m/L/Jd3+Itg7nFzqsrvVh0ARaZj6NH8x9n0Bath8WmVRF
         oW64d21203pyD2vEFjZUj4LSHYWDQrdTDT+xR1TdZP0YLdysGOu/qqy4SYf9lDEZxdhE
         5/GGeVdSSlNVkCz4mKFZaWc3t++uvie7cv9x6fIHYP4POKGzgUJBw/3ygoh6k3wNZLga
         J7qg==
X-Forwarded-Encrypted: i=1; AL+hErGu+LiW9LNGudUSEI2QMhIYeMkkTF3wxxpdO1YxIxZ8Tkh3zlkg1TZ88s1+IoXdUXhbgiBPcPjS+2Y0oX7h@vger.kernel.org
X-Gm-Message-State: APuU4Z82ycxn0zbODMoMwWM7Xx1xJJDiciUUZhUwU/g7X52fitR4lYgS
	HXwJBvWeAwAE9XgXd0UqOXIjqm2/+9uLTmKqTNp4IclLIOZPT3mqP/wQ6pLAm0oeaJRiDmeryZr
	IndyOj+pBQRVmcZgE4OnzPZ2Y0kT/I/qdKnMume/sI1N+CaXH1CQhwPuuB+bAtmK22sxc
X-Gm-Gg: AZFdTZeAuocF92MGZ6mgpQZRBklUM40DLNF/ZGBx8XdkcWFcHOddwNJtF0tdMgBwIhH
	+0S8TRgQGZbbBJkyDos7OR6udqZNZvwQSpteBcltIZVQlTRqCjWL1zsGva0mQl/ilbFZXheZe3u
	zF1/DJB9e27pcw5iYm3dF+/bUuBjkW+bvPZ/cwxennQo/zFhxDTZFakKB2A9kIr4foCL0/jf1Bj
	j+xGBAKGAcQz8pH+ItQcLni7L4Fnmk7YoeYK1R1xKddi8hbdklgHnkDjCmcfb7qCf+G+X0MhNtu
	L60yByde5qWJRCi9ALoznhWVJJJUNhGDRQ2QYfWTnwE7o1FAoG7bUPO4Z2qigvCnuwll8os+aqN
	xwEM77FztwruHsDoWNmQ22k6+fTpMY0eATwka3a0gev2uzlQXUAqdrcqmiR1497QezX8YP/RPnr
	INEu5Kby1zew==
X-Received: by 2002:a17:902:ec8b:b0:2f0:3e5f:2a18 with SMTP id d9443c01a7336-2f03f21cebcmr205540195ad.39.1795789673043;
        Fri, 27 Nov 2026 06:27:53 -0800 (PST)
X-Received: by 2002:a17:902:ec8b:b0:2f0:3e5f:2a18 with SMTP id d9443c01a7336-2f03f21cebcmr205539645ad.39.1795789672505;
        Fri, 27 Nov 2026 06:27:52 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:27:52 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:56:57 +0530
Subject: [PATCH v28 04/10] firmware: arm: psci: Add support for PSCI
 auxiliary devices
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-4-da05a33b08d8@oss.qualcomm.com>
References: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
In-Reply-To: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=8413;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=6+plmcxud8+1Db2wY0PyjrfTXxkmyX+xcwc3/L5lLU4=;
 b=4xojK07eLUyXKvcM0CJ1rWgr7sJ9kRK4evE0nRq9/GcL7+l5XLu9t17mwrWRdTTJLpUV03bKw
 L3gED7f5XoKBpfufDDFpM/XWOLluno6hVqRwAStEinCGUdCg0eh5WL3
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-ORIG-GUID: 0U6J4iLIrwjzX9tfXnveoM2TaswZ4qgP
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09936a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ugXECOaDcIgpxkN7r8kA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX5kj72ovauu1S
 oMlJeJPFRYoLIxqZe98mz8SDIowbkMbnblZ4NoYRm9QUnaEtqLXVbqjA0QiR7ZQ+wP9Ns0LSkTH
 v4PAck+QDawXsMitrKKU5jKx5NEtMtg=
X-Proofpoint-GUID: 0U6J4iLIrwjzX9tfXnveoM2TaswZ4qgP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX7ksZNxh/neVO
 c85mKbjNHbr0UI4GADp918xKjhWUIqkX4IBbbYGmsFOIlkiD3KhtlyIUESokI5XQjD0N7YE3x0M
 hkP8COBn9lYgYmgUTBGKa9oz26S14+4agXe3Nv+09ospitfRBN0WQd4Tfi3VoAp5J41/NhqlXQr
 e8tRjdclbHFpCIr08qniLBbtl2Pp0RH5S5V7BiJ+I30hmDLNkBYaBsOOl29sJxmvgCjx/FOVZ1B
 uejcs0QMmdo/Zroqc8vR7KqztVk4sEuSJB4ZJ0BuBHbsAQHoZmdad+K7BWHBzvJNEoVAQRTlExs
 P+VbAerpZKOI4CQH0bJKkxRFY17v162OAihnqNHktUOl25vFRe50QAEtvWDKC1+wVBlhsHM84iF
 vl2J5bOHe7rMHYBYDH0H2AGZlIFyhx6axhoMdZjS7RFA8vhhef7OUdZWk2Rfivy6E7LfOAtl1Fz
 WBMQN+bp8Fhx7i2o/Og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
Currently, both the PSCI core driver and cpuidle-psci-domain bind
directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
introduced, would also need to bind in the same way, leading to multiple
drivers attached to a single device node.

Introduce a PSCI auxiliary-device provider that binds to "arm,psci-1.0"
and registers PSCI child devices on the auxiliary bus. As the first
user, register cpuidle-psci-domain as an auxiliary device.

Update cpuidle-psci-domain to probe as an auxiliary driver and use
the PSCI device node for power-domain traversal. Allow the probe to
succeed if at least one auxiliary device is created.

Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Suggested-by: Lee Jones <lee@kernel.org>
Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/cpuidle/Kconfig.arm              |   1 +
 drivers/cpuidle/cpuidle-psci-domain.c    |  35 ++++++----
 drivers/firmware/arm/psci/Kconfig        |  14 ++++
 drivers/firmware/arm/psci/Makefile       |   1 +
 drivers/firmware/arm/psci/psci-devices.c | 116 +++++++++++++++++++++++++++++++
 5 files changed, 152 insertions(+), 15 deletions(-)

diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index b88b01aa5829d..f22e18b05053a 100644
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
index d81be01d62e0f..03a8396992c40 100644
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
@@ -121,14 +122,10 @@ static void psci_pd_remove(void)
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
 
@@ -174,19 +171,27 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 	dt_idle_pd_remove_topology(np);
 	psci_pd_remove();
 exit:
-	return dev_err_probe(&pdev->dev, ret, "failed to create CPU PM domains\n");
+	return dev_err_probe(&auxdev->dev, ret, "failed to create CPU PM domains\n");
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
-core_initcall(psci_idle_init_domains);
+arch_initcall(psci_idle_init_domains);
diff --git a/drivers/firmware/arm/psci/Kconfig b/drivers/firmware/arm/psci/Kconfig
index 97944168b5e66..68e381f1a618a 100644
--- a/drivers/firmware/arm/psci/Kconfig
+++ b/drivers/firmware/arm/psci/Kconfig
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
diff --git a/drivers/firmware/arm/psci/Makefile b/drivers/firmware/arm/psci/Makefile
index 1956b882470f1..8e75a0ed6f740 100644
--- a/drivers/firmware/arm/psci/Makefile
+++ b/drivers/firmware/arm/psci/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 obj-$(CONFIG_ARM_PSCI_FW)	+= psci.o
+obj-$(CONFIG_ARM_PSCI_DEVICES)	+= psci-devices.o
 obj-$(CONFIG_ARM_PSCI_CHECKER)	+= psci_checker.o
diff --git a/drivers/firmware/arm/psci/psci-devices.c b/drivers/firmware/arm/psci/psci-devices.c
new file mode 100644
index 0000000000000..d23befc490ed5
--- /dev/null
+++ b/drivers/firmware/arm/psci/psci-devices.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+struct arm_psci_device_info {
+	const char *name;
+	const char *of_node_name;
+};
+
+static const struct arm_psci_device_info arm_psci_devices[] = {
+	{
+		.name = "psci-cpuidle-domain",
+	},
+};
+
+static void arm_psci_auxiliary_device_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+
+	of_node_put(dev->of_node);
+	kfree(auxdev);
+}
+
+static int arm_psci_auxiliary_device_create(struct device *dev,
+					    const struct arm_psci_device_info *info)
+{
+	struct auxiliary_device *auxdev;
+	struct device_node *np;
+	int ret;
+
+	auxdev = kzalloc_obj(*auxdev);
+	if (!auxdev)
+		return -ENOMEM;
+
+	if (info->of_node_name)
+		np = of_get_child_by_name(dev->of_node, info->of_node_name);
+	else
+		np = dev->of_node;
+
+	auxdev->id = 0;
+	auxdev->name = info->name;
+	auxdev->dev.parent = dev;
+	auxdev->dev.release = arm_psci_auxiliary_device_release;
+
+	if (np)
+		device_set_node(&auxdev->dev, of_fwnode_handle(of_node_get(np)));
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret) {
+		of_node_put(auxdev->dev.of_node);
+		kfree(auxdev);
+		goto out_put_node;
+	}
+
+	ret = __auxiliary_device_add(auxdev, "arm-psci");
+	if (ret) {
+		auxiliary_device_uninit(auxdev);
+		goto out_put_node;
+	}
+
+	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy, auxdev);
+
+out_put_node:
+	if (info->of_node_name)
+		of_node_put(np);
+
+	return ret;
+}
+
+static int arm_psci_probe(struct platform_device *pdev)
+{
+	const struct arm_psci_device_info *info;
+	int auxdev_count = 0;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(arm_psci_devices); i++) {
+		info = &arm_psci_devices[i];
+		ret = arm_psci_auxiliary_device_create(&pdev->dev, info);
+		if (ret)
+			dev_warn(&pdev->dev, "failed to create %s aux device: %d\n",
+				 info->name, ret);
+		else
+			auxdev_count++;
+	}
+
+	return auxdev_count ? 0 : -ENODEV;
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
+arch_initcall(arm_psci_init);

-- 
2.34.1

