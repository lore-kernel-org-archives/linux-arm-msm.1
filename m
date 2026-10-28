Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188095;
	b=d7T/SNNwoNIeXP0uJTYHR8rEl/kQ5ZrM+RXE1lToCup3ozihhUNLlYRWjTFkNefwqGWt
	 9/xYJj4TZ2kLKdu3Yn50rag6N3Rn0RV2cxNWuzcVNPPPoTWuK92gVzEDYEO6Rzea6JpgN
	 gLoa96B+JTPBBASW4bo4cKH+EFa7/vNriNtqvi5ARosTPFSpi8mghmB4XL6LGB0ohRHj+
	 mIzg2l0i2N/bNH2XdRxP98WNfvpJm4BdQSIUTgR6mtYmJa0TmFYwVZVumVkUeKbzcOPcW
	 /crcg1EiPs2qSweKhBR49+vnwCDJzwDkR7wiYxpkr5Yisgz5uQvt5eXfUzOU0g1rejg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188095;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
	b=NWhriEzy6JsKrrSupX3OT9pcEBoHI/VCk9oZAfOnVswoGss0DSlNtR/ChrvK8+aDIiFU
	 SdKMMQBAMtclt3OdwwclkZeArSQ+hrKfHrWWWl4ej4D2m1tfja6JkSbIA+5oNselsNyyc
	 8xjEVZrLAu5GPPEKtPFFxOMGCyzzkPNJvbpqUv1HaW68v5tQcTaK22trGthuueiH7SnO/
	 x/FSPthOjBhmTcVw2EVdRiH+g4f/75wb5Ajxd6moh9/HLFC3HzkThixPEQKFp0FoZI31B
	 eof3A6mEV8rpbYOdWE/pdK4nKNiCUvtfRo1ZBT+AShgPI2hdC5kTCrYLrSw0yZ1APTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aXsC2ItG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiV3V4g5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A210606A331
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A210606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aXsC2ItG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiV3V4g5
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdstV1011759
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=; b=aXsC2ItG8FlL+JE9
	KAC2z5roNxozGt8CsUW+hq6elaEKAV/ncRmKYtMZPRCnPkDPs2TTuZ2OiGK+giQA
	b52xmXp2aIVv1zqXg4QlS5N3m5ab8Y8YdUaeRtgIg/hIVu9zpzJL0qUskj1AXMo9
	y6I3KADqPUEsGzxWv8wKderFC9PTw5zhGFUC1NJkuCQU/tMjHzuszpo3wlsS5nb+
	jYfWcgqvGgoLTHX+85QB5NOCAVt5SjguJ4+WRNOgeoHQS3+u9uzXjXTVjNjTShlO
	OlWla+SI/vc4PNEPHSSDOJ0oVZyi4lfe1Rw+rw8nogqigfJ+0lbfgzKs00x2aObz
	a8GDQQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehg85p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:48:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9821ca96fso13086185ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 04:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188092; x=1793792892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=JiV3V4g5Oio2/IJHLh8nJpM+HoCchbN4wAewaN9moG4IUm39d4Z1nWZSPBKiH2cCrb
         8IwpG2rxhLEzl9sttRZECR/6SUPBCiASC3fxKMz/Y+6vKu7p1KAOBeICSzlWqNx+AIsy
         mjTOt8vo3v50EhS/oyy4riTgJdrC0y6KGOUmRMjT07GCm76eotbLMe9ULe4sJIjUXfjI
         JYNjmkRY+feTFyfwol3ZPFGgciiUHheMrQTYZtZBeRgLkK+lDw0xMEfndDTJd4t2LWGJ
         YXVRyLi+/pjrgENl/v6gp7Tgzlld3EoZhDUQIiIVnKr0xBGKZtlZ+vlQf2uYmOKELtA4
         VoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188092; x=1793792892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=NOqMVaxj/dOlOe8ty2X1Fgmsb1WOcva37DSrrQekLf4WjIInWmnf5WUrcrS7fjSigN
         mUzu55KuRAwQYSmOqsY8hwds+LfLJNiLos0yWSaUmmsv9OijMLsUv5CoXVAWnxrcbY5b
         +Nn6zWPexquIKJe9ddnhynV8+5tqE8BHLU94OiFQuWTaUKfPWJaTNZmFivt0ylu24tto
         n0nvpH6SnF5rHdXTD/iQlFviNgcj2AK1bqsh/kEz8V4dTcwwCJd6drVPMsPkcPI8QKR/
         Ngt3hdhTe3PsFw0eCfux/jKaFUK/CKboYOkKV7AIOojGDXLTBkVw3oIR9rPissXG9Gxo
         U/mg==
X-Forwarded-Encrypted: i=1; AKwUvBx3Hq3LbvxWoMgEnUfr4IwTLkEGZmCfD1m2QMb3TfxzYM/ocMdXQC1A2jxqjvY1w3dkICyWElVoDz/XOxnu@vger.kernel.org
X-Gm-Message-State: AFq9FYLoNGldLSjczU9lIt42EztLH5hw1zKaj6amTXJS6cUBpKX1oH5t
	eKYqqZ8PvWqbdDGAHGhF+v+Qt2kMCE4GY7/FQydIO6gcI325D3HmZPZeQnuI8bzZA8bouwzzrSy
	ux85nqExZbjnaV+D6jRNU6LyoKk4PKV9DuILR/T/nkuk9SJa+R+ur12tSdQvf6RYvmKF4
X-Gm-Gg: AYBFou0FMlJcFZDp0VKFl7iyabfqpSjMBcR1uRPgUW/Tte4m2Q0v8TT58GoGKun5Nw9
	DvU2+KjQGn177V4KpgsjDwkyHvk/2saNcGawbAZ/2l/CcAOk73o0qKCRbwd8XWNbddC8t4A55Uu
	6e9zi6oM364//WHU0kA9VMGhtXBfOktu1wMAsxBSzq9ACjNw3gLow41pv7b6ZKF839ocnZxMnJS
	sx+0VK+XxR2s/szgzUhSStO06EwGhQfKvGQvyQte47vast8MnEmy9npveS64PRUpT1iYpHlV/Jm
	xgs3bHLAlVXOelOsGb8aptDx2NMoE5TdlnM59s9nHbq1OCt4RAkXt7uY0Caa8k2B3ak5yVHvPPi
	2mZ5z/9jwKEcCkoWSAYBML92zuFkVvzKVx+MN54sDOl1gUM/AXY+oS1NPBBc41cZrwDhcquZNAO
	hpGOK2Tkyo0pRDEUWVixt67Dn4F+z+
X-Received: by 2002:a17:903:2c06:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2eb003ffe11mr18527405ad.10.1793188091901;
        Wed, 28 Oct 2026 04:48:11 -0700 (PDT)
X-Received: by 2002:a17:903:2c06:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2eb003ffe11mr18527115ad.10.1793188091411;
        Wed, 28 Oct 2026 04:48:11 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:48:10 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:44 +0800
Subject: [PATCH v4 4/6] cacheinfo: Expose the code to generate a cache-id
 from a device_node
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
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-4-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188047; l=2378;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=cuphFizeBCUAPOmTA5mjgloZDLbPkPyZqyfKN0YBZdI=;
 b=n/XKEt2Df/QRRSl8LRoUZx320ZarsgT1ChUAkMLf5iPokWhJmxBSvVq8VNfkWiupCG8INUGKV
 UphnCzwL5k6Cf+mbzj5Cf+NoXIJ7fNZzyfax3mT22Nr/pOTnN1hhPEm
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX4yHPjq4bDOa8
 suobZKYIpFrWRlQzL2ogaNHtpV0xffBe5cmQ/llXqsA2aZu3ushRYn9u9Ryga3xpoH7oH0CaXBd
 l+D2eJOYscVkB/5JZGM39kLTygsdF3o6rZyfh06YC+0n7eZZ7IWIKI51ijDLWQHbJUPULtGu/Le
 qCYc7INQdwF7C17UKjUoPkmOieHdYfPqwO/6TXmKtxXrqXOBLWb/RQ4CsdIMuk44OhPkhPHbU4O
 BUXN1OaY7uSkLIiuoy2GPaMxKicR4LM0AC7SzYGzoly4JG2FRDrWjotjLNZfypgV1xV4GFBdXgb
 TiWIspHjUnJTmtRw3LxX67t3LuIiQWRvgUdIDioueHfcLFmH/UIbpKpBTJ0Or+evOGzHCfLUmvy
 Bj9gTSVfsQA4apnzLbqOFOOiBWsdxV1kYdJeT+3X5qD8fTnbnVjPVDSxco5tJUdv6EGrVe1DqHk
 TLwNXE0Pev+WP7vthTA==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae1e0fd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=2UMQdz91M6SPgPM9X00A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: lm100G9I0OsyJV8g9tScwZGULJvnRwkO
X-Proofpoint-GUID: lm100G9I0OsyJV8g9tScwZGULJvnRwkO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX6kx0/eSzhWn+
 Oajf/H7NkhxBcROFT+fMFymMD3Wzgcc9438DDiT8mY/7FYf7/B+el3StNOy3trk/+ig61FVbrDK
 wOssI/g3LhIdDwuuduxECssRkY13QKo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046

From: James Morse <james.morse@arm.com>

The MPAM driver identifies caches by id for use with resctrl. It
needs to know the cache-id when probe-ing, but the value isn't set
in cacheinfo until device_initcall(). Even after device_initcall(),
the cache-id is only available if at least one CPU associated with
the cache is online.

Instead of making the driver wait, expose the code that generates the
cache-id. The parts of the MPAM driver that run early can use this to
set up the resctrl structures before cacheinfo is ready in
device_initcall().

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/base/cacheinfo.c  | 17 ++++++++++++-----
 include/linux/cacheinfo.h |  1 +
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index eb8a907f6d50..a4b10f3a9007 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -243,8 +243,7 @@ static bool match_cache_node(struct device_node *cpu,
 #define arch_compact_of_hwid(_x)	(_x)
 #endif
 
-static void cache_of_set_id(struct cacheinfo *this_leaf,
-			    struct device_node *cache_node)
+u32 cache_of_calculate_id(struct device_node *cache_node)
 {
 	struct device_node *cpu;
 	u32 min_id = ~0;
@@ -255,15 +254,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
 		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
-			return;
+			return ~0;
 		}
 
 		if (match_cache_node(cpu, cache_node))
 			min_id = min(min_id, id);
 	}
 
-	if (min_id != ~0) {
-		this_leaf->id = min_id;
+	return min_id;
+}
+
+static void cache_of_set_id(struct cacheinfo *this_leaf,
+			    struct device_node *cache_node)
+{
+	u32 id = cache_of_calculate_id(cache_node);
+
+	if (id != ~0) {
+		this_leaf->id = id;
 		this_leaf->attributes |= CACHE_ID;
 	}
 }
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 56fa646df0d1..469d490968ac 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -114,6 +114,7 @@ int acpi_get_cache_info(unsigned int cpu,
 #endif
 
 const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
+u32 cache_of_calculate_id(struct device_node *np);
 
 /*
  * Get the cacheinfo structure for the cache associated with @cpu at

-- 
2.34.1

