Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C27547D931
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153195; cv=none; b=s78c+yL/JahB53n1rc+TPc6MaTW7N9j++DTFsxxKWbQ+trvlF5ZVrv42EIWGwTBWO86gzc4fEftf3I4pex8Sn9E0OuuKCKO6RD5bJ3yicMirvPGoZ1OeZUZPk1HegHl9OE9TOOtzmSsVxeUCWmvW/KjR9sE4qKquM2pNPdQvcA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153195; c=relaxed/simple;
	bh=N+36xrUjkOa1sFBgSJgN+WTh7PZ3GhdlZultGg/uzmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMpCwwFY2PzgrzpAgsncjK9y/bfPsHOUIgunE7/4nUs6YNLN4SWXxj9sFaOyiUSMnxo5ylwypv86BrYYfT7fVm7vfKZ3IHK4nMBNt5m3wfBgcqudkSYQYw0te+JhjasMAqzbkMuWGHOj8KsamBC71Gg3YQ3Q4mnG5KIFBOniwW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbvHjkvn; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbvHjkvn"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1250876a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153193; x=1787757993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5FGrDocbe45FnzHVdI0AJ39xfusQIB2gkHqvovUs3S0=;
        b=IbvHjkvn7Jes6Hy8Y30bWuJBvBh+Ic0voURZ8J9Ptrq+o7Fo7ZPOiD+ERrnkeSpJ5C
         imNpKB7+1yiiWLHN1q8XG+kWOPmvISVwMVJWTAfKf9wcZHIie5DibOwpDERTz54xOhJt
         onDQRDOxDRtXYEkoXXzuKy8CFc/GX1uNftG4/Lq/z12PwFSGu7Wux82gFxK1Za7mf6aS
         Kd/spScH64RkBUH0aqF0bQlSFzpHLT7ITLCf0pfqRJmK/0qjhCi/cg7jMWDDoSTmCwL4
         4EKaG3H5PaZ8fnKZSIpR9emMD7Fm0bdyI4J7rShPC7fNdynl/708YayLUSLcawqjJK+u
         g5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153193; x=1787757993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5FGrDocbe45FnzHVdI0AJ39xfusQIB2gkHqvovUs3S0=;
        b=BcnOsILsn8vYji37ULEBAvUwMNkrl8bNsS4+3RIfhs7iC71euzcRY0uPaKwt9SIPoD
         cbm9AcQEUVaa0dsi7W+mWkHPAB1MdQtW0+CxgSqLsOePC9i8Q1RnGE0PaI4baQkfEiVt
         IAe/Vq9c7cUvxIvZwBOARvmtbW6kskV4BEPS/ttl5tcXt2zlVtbC8r6NTgB4xXotAeZn
         j01S7Rp9zIW3wGg3DKDImfARdP2Tk7Mov69OYUkS2nVZIyDpTfvGqQ6UckHz2hrEcF7I
         U7Nd2YtG/MpfaLDEDYXA4qmv2L8I33iNz8z9thrv8dTXc4qdoHK6l3kVIp2+oGzvzanv
         trPA==
X-Forwarded-Encrypted: i=1; AHgh+RoHoFRKaKqb5wVwPrZ6mnDw/yuPxeOM5BBWZVfVUK4wVvJ1MfOVgVUgM9PLSD46SU0ox4x6Sk2HAEcTEpBe@vger.kernel.org
X-Gm-Message-State: AFuF++mUGPRHFY+Co7dy/T2iid4dJowQRk4g7cwJ8IIzgaIcRIYN0+hy
	Xn2qwshnY3Z2r+tUTlJHdW8WmuO9KrJ4EpW8h22afY3UpaCLWAYNLNJ/
X-Gm-Gg: AR+sD12DWxCAZHLe+NP7HgoVM1rhkrZG/BEf0LSbaiQmApy0uZ5fWtqZl5/XYvYbk4x
	WajkGZJR5GSJyu5WXUVrjhrsMimUKfKFNzd3xBLKBSviJPIIA4dqFyCmBciLFgTeyBhOhYJgsMF
	E0Bw/FshuFbExfRr7mNxC9k+hk4PnuXwdg+ybnoIxEMwV5JE2bhx2877HMNxpW+I9buMPGAk20+
	fvDg5Bex1oZ6MA/bQO2EQyT23C7Wp/26tIbB9RDLkSJbpB3vapXmsby8mAUFRLd1f8+RUe08Qs4
	LEi9qYr+ddoFjEZyvOSW1j4R05s/pRmohojG+dCZIh3c9FuNgXsLPvOmJrddsi1EDLyOybzy6ee
	Mun80WC/WvUNZ7qJ7pAKpuiSgm2Rf9K+VHOkfvN3WvJ1WU7ruF8dwIYvMuB8dRdaxYnfe+vzLHl
	aQRyOYi5TG8/YXlxY03+fmOcS56IP54n/bpgIjguG48GzhJ9KqZWVM0RzprE6IhpSyaqHR6I8hE
	43dcErEuxk=
X-Received: by 2002:a17:90b:380e:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39581212176mr9795535a91.9.1787153193270;
        Wed, 19 Aug 2026 08:26:33 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:26:32 -0700 (PDT)
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
	quic_tdas@quicinc.com,
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
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 02/13] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Wed, 19 Aug 2026 15:25:31 +0000
Message-ID: <20260819152545.3934-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152545.3934-1-sreeshankar0910@gmail.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC ID for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 1836e226a..63ee5cd56 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -450,6 +450,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0

