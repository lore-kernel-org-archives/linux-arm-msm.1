Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353BA41E6C5
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576798; cv=none; b=FtbrVmaFlhAkD80L3O43RPaEiH4vCWH4lmWa9DnRh9V45GWlhO5WYo854hhv0Q0SSL8Lap0ajVCeD+NPSHMavNhhzRnP22k0Puao0vUoxBDZqAEpey7SXVMjwz/+ccDayXGX1BkEzlIAd3hNpPWBM+SNKgYfW6jOPjDjMsl1u2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576798; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j73ShCkglIUdotw0SJL5lwmW9xRfkfaZZWAmQh1zDLAmwGO9zjCVC8I5ZqFXMR+giXKSdFja12VWmcJN0EBUQruRc093qDiLZac9yRfL/BtcKVrXSqyJIA2k8d4yV9EyiYN4xvl3gA4a3Y0R8s9Ns0rL/uA7Swkbwcyp8XQZUSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOn8zvgx; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOn8zvgx"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2913490a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576795; x=1788181595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=BOn8zvgx8OR00F/IRRPkOS6UfJx55Fwk5teZsIj/GZyVjxbqpjlwH9f1bUTGpVhTPM
         PistBs8F0beWFzNyfvjNIFCRbVuPBF2VL6FvCq+OkTatN/VW0j0g3TMzyjGGVPRMKDSi
         QBR9V910IwdUQxze+YHHzgvooFmNWU0IKMrl2DQBY//EGA9fr4KBpSER8C0krBkHKBbz
         5r853GF41gRmBQG6mzSkO8+I7NQerUYB3kqaIl7b94TrCP25hWt+H24jEuCMy5mDSFPP
         wjZYgSCnELUXOZTUKQ/jAV/PeWsBEdqC+IgofyVCDBI35ziTx93Xmg8La5FXrI+Omhhj
         uyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576795; x=1788181595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=Pf4dFvq9CRDilQdCfLLRZNH8gZMpgfwVcL3yvepgJVPKUqquTJSpLPr06q+ovHeXqT
         RYR/tJ2ImCvTon2RP2A+reAdErd2sTIWS0sssxQDOmgqt83DXdoFEjvutfpXGJK7AtTg
         qvG14S0ndZr80Vd7ymI93lKuTzO5YATPRKXIe2S1p9RMotqXLYhJdWmPCgUw987YzHM4
         Skd5T9T0nK7x3hxSYpRUD1h/RRQENpbTVBJ8FMZkZ1L2kmf7fcqhuel1k2YbTYoq9Xxg
         ROgiDk2lkqJRN5rlmiOvCwusYFgb2BJVpw0nDDUUOVWPsp+/OdP07BBkazwz+f+QK/IH
         rxFA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0H6w7Yt6ZErioZzYbcU6QJc2Yllmme8cL2hKP0loCmiSmtWkH62KqvW3xBa2I320T//9ByjqI0J6PEZJT@vger.kernel.org
X-Gm-Message-State: AFuF++kXn1o3LiDPETEXnLMAg/6WITeYXCazhGIHHr2CFpFCbo6PBc+w
	V5JXgFQ4mhaPYOCh9vNiLSymE6nXCE1epKZH4D117Vpmp1C3rFhE6IMc
X-Gm-Gg: AR+sD10Cr6GyBjy6oeXgnUphlwKefGBmN3HDrHxSoZYEclgXgml4wj3G1U60Eu9u3D4
	gRGdKRdAoM8r1btLooSqeskfPo4H6woXaKTB/JdYsZoBSP0EvD/m0Jaw8x8mOhi1SaZfPusYXmU
	wpCx9gjvLK9EDltPSf83Z2r6PP8ccjVP3y59suno8/mrvU/VOv3dbeFxyCj9CV5hKtzstXtkyUr
	n6TuPsikgRdnoH2dFSTSH7p8LwsNrdTSRjRvDz/sBphv9T9xnmBVe/Q4E0ZBloYLNjFc+6E6WPQ
	N/xFZSR7+5dOvNBganni75ELCGaZLKl4DB3Fp9qBnfIh4ZkuzNpCAFzM5Kb/hwGXsX4BK33k/sK
	l2b8cgpaNEVFw/XVXrMDNTnAYyYzos5QfBYqxV+nCXI8tfsm4FYXw5t78mmNitnjj5PwTwFFT42
	MwThSIM6DuawaiPhPmmWsuMGNjQ4wRPC6XpYG9nwX2Pb1E5nQ6H7ttb68hY3pUzeQWA0Gh1Udg1
	ro0d88E51l2
X-Received: by 2002:a17:90b:3902:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-395a04ea8f7mr37077108a91.8.1787576795390;
        Mon, 24 Aug 2026 06:06:35 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:06:34 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v5 09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Mon, 24 Aug 2026 13:04:33 +0000
Message-ID: <20260824130437.2771-10-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824130437.2771-1-sreeshankar0910@gmail.com>
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Kryo 475 CPUs found in Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584..2a90af67c 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -212,6 +212,7 @@ properties:
           - qcom,kryo465
           - qcom,kryo468
           - qcom,kryo470
+          - qcom,kryo475
           - qcom,kryo485
           - qcom,kryo560
           - qcom,kryo570
-- 
2.43.0

