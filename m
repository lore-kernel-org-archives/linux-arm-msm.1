Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D42844683D
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455457; cv=none; b=iJPE7UJqhSpZ8IJofKLVOnhC2lCJWHQiejVjOWG1pCEzYE14/ZGBHRb5fJ3TeC8p/j8/M3rAfdTVTNlIKMUadDQ/kTrz12QiDLEP9P8PEE4l92qtSA4HS5j1OmSfcY4gMqLNSJMGIR1s9mF+iZNtxXec8Gbx5Xq+BmtyCDoGrqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455457; c=relaxed/simple;
	bh=265Vl+KGGKJlE7e4ia8GTvvieO9JWlqLF0WeOn45tbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eM32lBCjPyoTiwnubeD31cI4sM/cMusm38fgFt/9m+t9PTXkoFRe0d1BEqqhff5gL6R+ungdhWM28NSuRBl1NFY5ziH1stmTfDKF9uoHUslNm8zWW5V9X/OzaXYQjhbjQHW7NVt7HVaJalquITTxx79q11FxWi/dYMnFOwd4nPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SoK02wEB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f75+G3FK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SoK02wEB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f75+G3FK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWljj410137
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FgXs96hhW9Ki7SDANwXO5TQ2I7iFcKSC+Ga62QuGtLo=; b=SoK02wEB9yOl4Uvc
	PUfHj2hxwTjwcBMizOpLdDnD3ySXVEyvEXAGvRM1wpx70/oc2IJju7hbGdCG9wwF
	LbKuUpfppX5yHuHsbNTCH6LfdVXxWBS8s15eM00ddqZx4zOXwBfItBodVU9TeoHJ
	jXJU4vzphURwxfc5/UkA3aRrh+QZGQeFiy99j21MF5aW6YhUJR3P4dXgK+/sl7M7
	oP3Vi6qxoUYhKp1B5FS3RbzAQvSTUPw62fZg7C5IeScOOP6XkgblC+MImJ4sYPNq
	gqjxqKl1EvJslhb5sSibeu1Jef3MgHu2/s4X+knaS2tYC9vVJz22wZpcHBWQoOeP
	y+xJIw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyvcra24p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:37:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so66314755ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 06:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455439; x=1787060239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgXs96hhW9Ki7SDANwXO5TQ2I7iFcKSC+Ga62QuGtLo=;
        b=f75+G3FKp/M+xdnklKiwv/crjcVC1Ifnaa2ZFf4NBgeoRcr2/APeBP1EK8x/kYJzKZ
         AiARPR1KHbYN4B8TahBQDJAhVNW7x4B5om1hkWTY3Bk53Nm/NR7MnnsOcUs0ATsJLlct
         qlEakjhcCdQU3Z5cQjhj9+sz16TU0hqCDGf6se+ptDQ72OSItfjU0TkuPLKs0XS1bm1Y
         P71cL3dd+xWmEl5GeNYeyANo8eM12PsKnBXifPkUPVL90aimmTUz7VZtL+b8m8hTyP+i
         qKRJAlIMKes49A2reIoh45Z3ckpZdiO7PPSyuiByB54omZqPSFrjxcDgUzi8x3YlSkaB
         1c7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455439; x=1787060239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FgXs96hhW9Ki7SDANwXO5TQ2I7iFcKSC+Ga62QuGtLo=;
        b=OcVB1t+qnDQfoVCNMotfMrHhZ8KUqRixbMh1I4/VsOJIEk7+hl8TwS+URedLy6jECq
         DC7nao9IdpkvlyyZrUp/OnfhRxLqsWQkZ6yJwR16pe47njrHXFESM0SOnrv5+HcuZDaq
         fIHBR3w2nFLaUksWHfi3U7FsmsWSi9uX790p4b7OvLwDABzJGflweIvkmFKFaC4hafbP
         pJAW7W7Vi35IdR+f5P6ZOTuFTBExFNEj1YiGlm5EFtcHutTXUbaxoD8Bvbns/nAVgMbF
         cMi9TVCHixb9CJcnBnqo4aKRvOW7F92DUlOwlCp3Kqf1pKqBNuVbAGeGyR8kUKB/PZUz
         sahA==
X-Gm-Message-State: AOJu0YzgW93mfrB9xkknzIefG+OXNyzYtN58e/1rv+w1mu4HT1XVa/dm
	6SiuIelYTWpL9E9XJCOYRNtbq0sk47xDZReRbcy6ZiweP7yE0XJV0QNvcW99zLZsgbjGTIb7Ik0
	KZvFM3rZBfO3pHMKE/JqeRs5Gmj/nIUeJX9jFCnZeURh54KHExj/eSnL7HAOJvsLcOzlAjfo2JP
	Gm
X-Gm-Gg: AR+sD132Q6SggEQvIfSmlt3qIrPgNMxf5FeJ/Xhco1tFf8EvZolsNtWIqzRWyy1eRfJ
	9LLUJaFLiePO9lPjcC4rO0cUPsl1QE8kb9LMoh1zvD7SjFVzTVIscYqQn4eRG/FeOREOnJehyi+
	jGMN9OaJIq4W6bMiYYnI63Y3U+ACbzhZfMj5ZomEkDyJbQ4xvb6gjuckAwnP3vvpivGtxgTcHIK
	PGPpaYJEbql61mRLvB4eMWt+rXitR6/e2WVr176ei6kS5TSx6683WTHuWN0vMV//2YOp+wQjw93
	O0auhnppvDAmM9lyoiNBZOw/ACSSVoMTykF7XDOp0sLCO50BKiJfmG5juHohm7OBFX0y1I198ez
	5epu6+BOFHD88hQOghy0AOoJ/YufTjOXEUPsAmL3Bl2cATdUbpYJE2qlt
X-Received: by 2002:a17:902:e746:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d317760990mr38736875ad.4.1786455439097;
        Tue, 11 Aug 2026 06:37:19 -0700 (PDT)
X-Received: by 2002:a17:902:e746:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d317760990mr38735925ad.4.1786455438579;
        Tue, 11 Aug 2026 06:37:18 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:18 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:39 +0800
Subject: [PATCH RFC 10/15] arm_mpam: Fix update_msc_accessibility() return
 type to void
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-10-ea6397bead59@oss.qualcomm.com>
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455326; l=2343;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=265Vl+KGGKJlE7e4ia8GTvvieO9JWlqLF0WeOn45tbc=;
 b=djr9aNve5wpKqWWshU5FALHWaFXPyeUA2cp7+NxrGv2Cg1uOxFVJpeb42e/p6hf0sLykNWP/H
 SkK7iTfzlKiCYQyIyqto4bOcBPKWGLZQy5QZEZH4A01P2XCbmeyACG8
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX9lyhDLxC97OU
 aevJu8bQehrH4oq2fVOSeLgptqNjtWT2BLEdj98TPcWvZu0tJktMLKN7aoun9vIV8d8IXIMej97
 dPT3aUIGCFXAiwIHVNeFjCVnopogxphIl8Xgk9mz9GvD91ThZ9dMg0HvUTh5cW8Qrrke6v7bfsm
 uPxCOHeDTUhBBOB8ik20Nm5KHyf7JkhnUj8CHKdw83pOiWh9YzMQ9sOOE2rOEnhpvZaRg7hpN9C
 cK0D0Taz5M4jA8FJ3AlvO2zYFAUdzVnrViI7iNLKl14TKbLQLGccRwRdV4HaUofz9vNyW6HBjg/
 5RxehFRQjbhpcNsMVt8vaWcERlKvQ9jGPzDaZAiGRc3FDcEfjkWfJJ2peOlqf66tOdnVnnwLkCt
 7O2DxRd+/By5/gAtZ3zSgPVLTTY2LloS04Y1QC/1u4Yah2mNOVcUceJGZW0H7uGDX+Hyf3otd8t
 i7TaUq7phFSNPkbMvtA==
X-Authority-Analysis: v=2.4 cv=e/A2j6p/ c=1 sm=1 tr=0 ts=6a7b258f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WfV1sUHbO1VEJ8_JC0EA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: L6SKxBypCOXRLFxrXAIJiddy5xzwf6uf
X-Proofpoint-ORIG-GUID: L6SKxBypCOXRLFxrXAIJiddy5xzwf6uf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXy5EOI9P31S2k
 O8RIYlDQEsEZfvAIvatPJf3FORcdSuTDah4WCkyMrr5LowXN9GO9qYbRPG1caMXhheuq6j9iu1A
 cI9O7O43e49YauhosFkI1dCArifRFag=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110114

The function update_msc_accessibility() was changed to return int in
the DT support patch to propagate errors from the DT accessibility
derivation path. However, the function silently ignores errors from
get_cpumask_from_cache() and does not propagate them to the caller.

Revert the return type to void and remove the unused error variable,
keeping the dev_err_once() diagnostic for unrecognised parent nodes.
The caller checks cpumask_empty() after the call to detect failure.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 5d1854d97371..b0e67c8349c7 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2158,7 +2158,7 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
  * corresponding cache may also be powered off. By making accesses from
  * one of those CPUs, we ensure we don't access a cache that's powered off.
  */
-static int update_msc_accessibility(struct mpam_msc *msc)
+static void update_msc_accessibility(struct mpam_msc *msc)
 {
 	struct device *dev = &msc->pdev->dev;
 	struct device_node *parent;
@@ -2174,29 +2174,22 @@ static int update_msc_accessibility(struct mpam_msc *msc)
 			acpi_pptt_get_cpus_from_container(affinity_id,
 							  &msc->accessibility);
 
-		return 0;
+		return;
 	}
 
 	/* Where an MSC can be accessed from depends on the path to of_node. */
 	parent = of_get_parent(msc->pdev->dev.of_node);
 	if (parent == of_root) {
 		cpumask_copy(&msc->accessibility, cpu_possible_mask);
-		err = 0;
 	} else {
-		if (of_device_is_compatible(parent, "cache")) {
-			err = get_cpumask_from_cache(parent,
-						     &msc->accessibility);
-		} else if (of_device_is_compatible(parent, "memory")) {
+		if (of_device_is_compatible(parent, "cache"))
+			get_cpumask_from_cache(parent, &msc->accessibility);
+		else if (of_device_is_compatible(parent, "memory"))
 			cpumask_copy(&msc->accessibility, cpu_possible_mask);
-			err = 0;
-		} else {
-			err = -EINVAL;
+		else
 			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
-		}
 	}
 	of_node_put(parent);
-
-	return err;
 }
 
 /*

-- 
2.34.1

