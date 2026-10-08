Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399753C8C7D
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 06:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442071; cv=none; b=r7kx/6AnXmmfJZ41zOc1sFygtIpJtaeW2Pssh1k9U5Ufm1wR1Mey18++dHPqAsUny2WudEQ/Xj7aD6/3hHWB6qZwj3brJ1IKBUYBmgh7hLy+j3O+rHwi/kXV1cQGHUdilEQHSAwcKoLVXcpQDt5nRqbt01JEQX+9ULGexbB1S3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442071; c=relaxed/simple;
	bh=80u2pAh3kUz7aM3k22MQUDFGQu6/eDakd11zKkQnXlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e0jSxoPx3yAqUTEQDTz/GHnvp50u5n40pLGDv2vJHQ4tqqNnNStFWX9gv0b2sSd7YwEW/Gx6rVJFV4NreD1FQq3xe75O5hVgtS1oGsFGGK0292HeT36nJ7x+ISbotCJCmLNt4Th7aWMmudAWHxTWugj8w1awm4DoNWAzUG5iUKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nllrtFmY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BnIDQrgm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nllrtFmY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BnIDQrgm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BZac313853
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 06:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1/7KZsbA/bBQI4vWmdVz2CaKKWJjD6gB5SHU1QsuvkI=; b=nllrtFmYxX0K4LxO
	opRde25RZOXQpTiWhKsra0U1rovwhlB2fBW0igQUgaWB2cxV3pVEH3pNKFhi8S5S
	8MlqNg+QqKVnoHbCRIP1ad7PJ+5B1lvgHCDhF3etz9STYjSaxLxJZ8UgUYTFf23w
	2lvpb8SICblKu2ZddsrCFFR6MGqq12ZD7uYMkAWXmccComSBfomwbTGjq6lPdGme
	MTDkRSMQJKu3h+ECr8GF0mntrKkZqOQ42s4r3ASZgsa615ZoEoxzCOdxneX+fIAn
	oP8Gs/et04veczNvi9y42zVjBfymkj7/IGr53XuoLqRz1N+dMWedeqMHDJDtP+8G
	UFMScA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe31g1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 06:47:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so5208846a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 23:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442069; x=1792046869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/7KZsbA/bBQI4vWmdVz2CaKKWJjD6gB5SHU1QsuvkI=;
        b=BnIDQrgm1+p6+8YA1nP7f1GNrIURzYDe03ENLlzJ6xvdLPfQLqGDeWRtSD0aM0bDb4
         MwoqsCrNQubOTJf8OBflgXuFCm2FhPnbkWlpqpb1HZ4+/iwB+NY0yNJxtQyrxbTqDi9P
         Czjkne4ztQvqq/XWGCkIRPVRnWsqDDBEmdLURGV56VGTcW43dki3+moHpCmc42CNCFqV
         0mBr9W66Rc1vjLCBG3nLyCnd+JDWdxASetgnE/DM0Is3qybCojbaz3wD4pAzGYW1P+tQ
         1HKpCnlJdNa0c2/JLjD9lID6au1mlC3pHIxqdbhSw0++gdxu0GoK89gf+xDi5da1EM4z
         +hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442069; x=1792046869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/7KZsbA/bBQI4vWmdVz2CaKKWJjD6gB5SHU1QsuvkI=;
        b=Ngo9xq+WZLKv1NU/CuedHGKerXoXZ4rFQBXTdf4k+Ovti+cgIos8mTKoLW4o+m6y+s
         /XO/E9AZ6nC3BqE822OQ11ja9M+LQ21k/sct36uw2aJV66RkujMnge/w6iX0Z2HZQHbm
         RztxJoO1PJcOIlKTH0/a6zIw0bz+ASSsXK3JzV1uuF/M7XrFOPAVw7tX6UIizLcGfIxP
         DeCz4Wk9/6CD8fVIkCHdZI+7GN6Y6G9jauCj/768VycRyT/fyCHWJvFjUOmc8PZ20SlE
         3RInftT3E/ScP5U14GU9k+pAhO/y1yea9H3Khf+p0fZcm/snpU20dp5xfNrNCMPORj2a
         fjtw==
X-Forwarded-Encrypted: i=1; AKwUvBzq0tHSFey+TyPTeG3DsYGZ4FFQXODjj6W2f1yGAUXsb9j2cYjr+Ck5UHMkjBRFUvdGAagkovAC3Al0WTI0@vger.kernel.org
X-Gm-Message-State: AFq9FYLBhJFzHjHkjSKMpRp2Ly65Gkv/bSDtvYF6pJL1TaGkMXNjcK8e
	Zr6OsSWXDRFhYmcAhMJLwcY+Qd0pRnhNBXn1DKN/pTjzNmJ0X2UVet4ti5ssZRMMOLN9FigSD0+
	CN3C5+QSsHWcIEdrn5EuBEOs+iN2FKbO7bVpHDd41Wp4p2drzU+Ug+SbwKnK3dlFcxyFW
X-Gm-Gg: AYBFou07zeqECD8xeZRx8mSu1+7noUbkHuvOpo4iMpLbN9kEP8awf/rFzrUqw8GlbQZ
	6QJMANGKtRP/4wdw/JEVyGYpAuwGoN3/8KBhfX0nZFB0vpqpicGscWqUiuLQLqYJ6jQ9hA3VwWb
	mjWegskznEPNcBgodgxuQkHt5cwcrCcbLk3Slt53+YlruoWRQjGK+kG10IjycgmlEYAD4t/AGQ0
	JhHxpEpU4oH84Njfu2NZ1iCyvT7BTiGjv3ObH63I/b02O4sW/p3vty1yM1TVQDs075tBBFBYDcZ
	gH36iS2eH23w//cAg/HyEmv4CUjMPNBas3wYkLhPkub+10vwAnmJPOJBrc+MANLpJBoqs8v7hQI
	QyQ+ElfqXK680hUaBKrrywnyfNkU7TYTYoHZwBvxdaXASuk3f7BgJDj4=
X-Received: by 2002:a17:90b:1a8a:b0:3a8:21e4:9584 with SMTP id 98e67ed59e1d1-3a8a15314eemr3245385a91.60.1791442068729;
        Wed, 07 Oct 2026 23:47:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8a:b0:3a8:21e4:9584 with SMTP id 98e67ed59e1d1-3a8a15314eemr3245366a91.60.1791442068213;
        Wed, 07 Oct 2026 23:47:48 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:47:47 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:13 +0800
Subject: [PATCH v3 4/8] cacheinfo: Expose the code to generate a cache-id
 from a device_node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-4-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442023; l=2378;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=treBZjfgVIBmtiVlLTsGxNxSnTktJbBCCAsYZ43ZZlE=;
 b=3SxhVsOuGeNgSvPZ92pETLYV0aGE3Lrja1mLwS8TGb1jJE+U8AFQP9fekEsXMRiNzDPorHWcu
 NsTLPixLPkKAmXzZ9LTTdmipd90gcTa2KYFnIBj5anxhOUkg4ybZpuZ
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX7g5iVakmt6s1
 CeBeqxSzEremDWXANdVHcAlUbrp+ruLlxtXbXGMwrKHiD49kfZmkr2/4W/NUYd8dnfDZmoMptSq
 yP69VXAFZXQNr+J8+OGGEf5R3GbFvrSKE33X7hPykVpoNUs1i5l3Za9ZoJkuWuUb0gy76uge8pT
 hqDdYD7ZPxv06E3us2Z+LxcL0MWuH44apYq1T8ljpME4DwIBSh/TFQUPnF5OLyjTXg4dTxcTinD
 jLAUQeCzWtpoTMJfw8PHQNuFLCg0gC239sxYnS21tMhKmjeHNTJzjHNbgb8SndrRFF+CFRmEZ3M
 PnqmJrYrpZOuT4tZvVsPMYbdVtqqTpVyEgFJENOxCsSMg6ovaNWnUAyPZ4jLPZqZKkQrwiccHcD
 jHqsF/g0R/bEAXNd7GhbYZKtAFMkRwPQETl0OvLZEB42tGk45+9IkLoBMbOWBe/IVPf1quhGw6S
 6Tf7qA6doemHFADdEtA==
X-Proofpoint-ORIG-GUID: KUG15Hgu6XThjzirvB7kvvLGrGZ0KmPe
X-Proofpoint-GUID: KUG15Hgu6XThjzirvB7kvvLGrGZ0KmPe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX4qKpM4ukGhgB
 0FgOw/GG+PqatcEwPi3SBL92rMZ4MRBVx7tOQZZWTWsVmMxBcbLcYiGWuJuMuphRcThawmzEiLP
 VcP6+o3EHWQ3ibh5IyuzEVWQ0b8w98Q=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac73c95 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=2UMQdz91M6SPgPM9X00A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

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
index c4394baa7e53..5187535c8338 100644
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

