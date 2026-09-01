Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D3E389118
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245086; cv=none; b=QOcUBprFAkkHwiPmKXQkBSH4YH0UaNnozcWZaEPmVLn7MGQYgzSyPsmgJc2K3f9bXZxPup0xHclwlhosiSPP+PMla8YRyGWXHRsaVxac4BrFKCSgppA28wMs97UhR0nM6zzNe55C8l08r1dm/YX0qKcDmbofOtQS5qsedOHzREE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245086; c=relaxed/simple;
	bh=HpzD8eE93G0QF+A2LkG7W4+8iO6y5XPc4Rl8E5Fjv8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cn3t5U1qPpTYkvV9PMWO8KYF4mglscwCRgKRJWba51yYlDmuOyipoV+pHljStvgVj140muHFBJOoCM4FL14C9I4BlvJ8nFwfeRTalATfUuW1PQRQ3TdyvazbKl2dM5zQ15kMUqcjl/zqf/84qBX+CAMwR5HMPynjGOnhyaxOA5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQYbTE4Q; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQYbTE4Q"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca80d708489so551849a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 23:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788245084; x=1788849884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=lQYbTE4QqGdE0wQwwuysJR1UqNoFXLSrRZ+BftyXSrgZAzPEI4/M2xAAxr/EgMzVrN
         GrgD0PpRQJkfl9wcpCLCbRNC9Cp4rfwTty4HQqLcdrVAlwr/Z6V2vhZioofHYsXauKFp
         TZXdlDgYSOywXqb+RfUx2kDECKp128UnKWTEiy5PlvCCChZYFli3i6Br3ucosVUyOUk2
         jm8AbEDcHN2BRE4GX+Kgk7+jluxRpZl0719cKD8RYJQuc4DYTjRbbSWJJoGpP/sLb3+u
         HPAYSCnh7NBwRS5vfrknYI6qSKILABg1k9cIvy2bLDHrR7vAuBz6vVsCd0iRH3gUKEz/
         +orQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245084; x=1788849884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=O6a6nYohHfUNOYe55caAOvx6Qk4CokGnMm8PXUMGQAp1E21ecv35hJWZpWJUsjMfvX
         wY6mZ9t3MsnyiUU7NtNlYHH7+QRmxUE0IcQgK8MmtQU2O9VDAYyKl6VQfhHiqGRg1pWA
         FO6KFe9epDtjD6/l/2PCNqNqGpaw/H6ZaaX4/8mo+IyiCm1VPft0QcHN41I0aBIXwl/c
         JkPH/rwRxe1HXIdQFwttMJjiXdDVzNvGHhxzfDMAS7hgEznffKeIInVNYTIDpUfrYhXz
         hXkgJ6HlvToPVtcJds3IzI6KUhGEQnd3u/Z0Kcl+26ROoQOxtWzejM0mGpsx8uWb7owF
         fHig==
X-Forwarded-Encrypted: i=1; AKwUvBwJBPMcCkSltIN8l0EJt+FKymRfeIdCeVGs7S50oLdYANXP2gCLJDqqX8lRyQMmVjNBhGETElsNy6QztBcy@vger.kernel.org
X-Gm-Message-State: AFuF++m9T+39qklrMGpYhiyJjrXS+R137086nVk3znSPArbLdQrq1YuF
	WW4YRNEm0vI7UzIVf5wrY/EzhCv3FME8nR8iU/J75CflbGM2QIQJHZMe
X-Gm-Gg: AYBFou1KT5e3L1bwHMathy/SQtm7fT3zdcTRwhqY1pSVDqi8nuI9YsaUirB90TD3UHO
	QYkf0llmiHwy2Sn33FavsQB+1LJlO0FsoXUFcxQ2gklS9FZRETT8auw54FEeg1k1lxlXqqJ2FMH
	GX/11HnMCHuczXhOsyrw/j5HV6Q7wtbxgIKWvgg0ojlF0AOc6l8zZMO/xWkGxfMhCBh+7wGbsm8
	ZshHdVfw0QGHgy1hjv79/60AaZqItjw5gEXxw3wws1rUhrGydoVXxxjblB/tmhZYVEzpewGR1nY
	LweUYqircNy8wEuN2PmrJIID+w+dYoWfu78cVzTnkSai8og37qkJ8flNwbPsCPHMO/OfQx9lPIN
	3v3+qouKAx+kHAA72yEWbxHJ5Xz4YthSj3LS6CDVbgsAr+BVzJT3CapvEqQ7I6bTt4itB1NXa/P
	RTPflVnrIURGKG8DfPZK9Me7ALDh9FuLyuol57tFltrEXQHk1RLxlWC7vrkDMo/JEvuC71sOTUh
	hwNqSyzghp/
X-Received: by 2002:a17:90a:10d7:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-3990f1b223cmr1809753a91.0.1788245084147;
        Mon, 31 Aug 2026 23:44:44 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm37019784eec.27.2026.08.31.23.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:44:43 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 02/12] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Tue,  1 Sep 2026 06:43:47 +0000
Message-ID: <20260901064357.20055-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901064357.20055-1-sreeshankar0910@gmail.com>
References: <20260901064357.20055-1-sreeshankar0910@gmail.com>
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
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

