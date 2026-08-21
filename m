Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF0642EEC9
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299937; cv=none; b=cmXAKGEVWLVrRdHokr1LCeCbRt2T81f37Pdg3j76+gG1dVxVUXHbTfo2WO1QaAlGGxSyt574aoU08m6RPFXef3SnYaek0FndtyPyiC5mRdxfm5Hmvv/XYS2sA6KCflwkJfFXOg51zSwEDRyUVOxVskCbTboqi5uUcT8Z3Cq6k5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299937; c=relaxed/simple;
	bh=N+36xrUjkOa1sFBgSJgN+WTh7PZ3GhdlZultGg/uzmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nffm8Q2ZuagXQXePHHcFKc32cCZrV3i3J7kKSKs84EGcSVGvkl09CL56oEOVJQ2J/dyEf63EQuKYOpyh5VV0MTDQ6FLETVNecQqRm0MoAsdog4muOCNzBk7WnK9wFCRhWb/fhFeCiEeaX0mcFT48JfZ+8a8nvhOPQkvKyVAbdn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1xbJ/ab; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1xbJ/ab"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d01663d816so6170305ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 01:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299934; x=1787904734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5FGrDocbe45FnzHVdI0AJ39xfusQIB2gkHqvovUs3S0=;
        b=R1xbJ/abrF5H7QpWHIa1HZ4Ka4591QP0a0LcDv5pEBcg0D/Kn/MnLfD2V9+B0K0/0c
         5u2S/1sdc3ySTxvZaRHT8zCmqzDF9e3Idt0GG1kUA8gtCgrLwBL7UldEkSfGSuXZ5RqA
         UQXmYFGGtxfromW0gZfD43V63jS/2kRVokzsLW1I9QUjWzTl65I76SGY2o35aSm9MOlL
         lZw7ZD/xDLAjrT3MbdC46oVN6uCC85E3NeKTvrDo/MxWg5PH76b9mgWA+J5vb4IN45ut
         ndUb/1XsP3520aPlOEBNoTtEHKkudj+vqKX2hhkTFMiyULkeXrr6rBjPeyH4ZTSaDk+p
         ZXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299934; x=1787904734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5FGrDocbe45FnzHVdI0AJ39xfusQIB2gkHqvovUs3S0=;
        b=L1ukdZA4fsdJXP1Uid+sS//DcS64a2RLsEAuum03mx6eSuk7y6WSy1ADk/m5Sr5U5F
         h3Vs8DRpk52iroiRiEPpdVt9jU2CbKDWSW3szUa2p559rrjszchguvgumnwmUDyy11Nq
         xfr9WRKB7kI/ZXuX8wy+puYee1O+/Q/PKITDf1qYY15z1y0nFZ6N+KK6icyHbuMoU5hF
         siJDXbx6bZRBm4GSyNFcXa4CsU//ntpqWPznLF+exdhxl7lyvJ8e1qBVS5qWSOEV1aFL
         PUdwV3ENTL7B8+QS/dRaW8UI3qqnSazlp7YIXoHxYDr6O0t3iulTn6mtDfRo+0IjWJ8A
         r51A==
X-Forwarded-Encrypted: i=1; AHgh+Rpdn3UGwdljSIOm34OFzyQRZCkLYDunncgCdSFmjcudMszR7j7voZFiEcE+RG/8JpcwkDuupgh/KlMCFXpf@vger.kernel.org
X-Gm-Message-State: AFuF++kiwDRh7NNSrnBB3d7lGgRqqTwOqeT2SHBahFk9cZwM/aUZMBSS
	hMmGZVT783+LD8t6uiNf0m5atfbccHZdNLk1Ak+7M/9mRj9zHdDoraVQ
X-Gm-Gg: AR+sD13OQafmBp8GkFncWXlZJ0oWOKhVtHxHmde9AoqMgprBpDNpiwzuX77nsNXke0m
	VFMttY7gMnOyd3FwZ0fcLajxoOWkseDss3LcbU3Vdx6WRzMcRPjh8vhOq/McsPzH26KUWkbxkGS
	Rg5UptpAcI+SZ5dSiSgiKz699SqeaK/Wdh91qhn3iwiqqol668VEAuWuAdYCZ7gMrJhxx9Bmgl9
	oupB1zDFyzNbCgpMesOvP2HQXvFmtcq/JGBYMkkg2ejlHOWeG4m1pM6macSrz9/Yf0+kAuPtiHZ
	YQ0WTKthc9GKYByAyE1ds/HGFIzBJ/dETApWbsCwaQHBf4Bvhax6tNTWxP5a8BsMiWlBgSLImVA
	O9Jg9A4Kotr96/ZR92Z9Tg4vDQNICeg0APV8wUktNyjQFwpU+aMOyJD3GiqnFMNrg6wT9YseCix
	ZyLt+0jWXEJDJXabbIfV5fQ/Vij0q+Bm9Dr72ZFqTsNV2M1UeF1QkVWzVxfDvuOp9VuBjv/M+Yf
	W4fWQvDVS42
X-Received: by 2002:a17:90b:3d8a:b0:395:4de9:b30 with SMTP id 98e67ed59e1d1-395c353e28dmr8357357a91.5.1787299934412;
        Fri, 21 Aug 2026 01:12:14 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:12:13 -0700 (PDT)
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
Subject: [PATCH v3 02/13] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Fri, 21 Aug 2026 08:11:14 +0000
Message-ID: <20260821081125.4522-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
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

