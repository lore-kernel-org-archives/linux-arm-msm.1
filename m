Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF76472062
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 09:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254734; cv=none; b=RadAvx8CW3uYFZnPJFs5l5a2F48iRg9RNjkT96Wulm8segEEzxZFA2aXjHt54dE+dWK95gVNT3GRUmcpPUYo7DNaj21O8+YWxYiRZu2tPIxcWq+g+UZ0wqMQ1diM1gBe+jxQAuvCUNiVoB8iZLhyIvrQrmIGTaRRWQz9Hg06bPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254734; c=relaxed/simple;
	bh=HpzD8eE93G0QF+A2LkG7W4+8iO6y5XPc4Rl8E5Fjv8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G8bBkUuIRhPDTwYAHoYspijJ3+wtPTsvv7Sf9O5al2TVX9VeTNTQrvVuBjbcLtPqPDFSGQ3AVk3wwIMQ2JU5qtZT03S0F/7nNML5HbQsxf68+YeSNH38D71hMU1wGX73CGgpUX5Lsezj1/B8P3xM3qV359wnc9OPTZa/def1yPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwzNz5PP; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwzNz5PP"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1151898a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 02:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254732; x=1788859532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=IwzNz5PPwzPLXlAMypLxY1NVmk0y5G4bJvezWLOAhVsQB1MV/Bn6qqM7nKLIjYhUCN
         Ouupu8ZUsj9FSfFKYvbN7hNH8bB5TNwnCFdi/TBIfH7QPkhjDWTtYYzzGlYvGYSVIj/C
         BH2o9OfHFbax7ZbtHRsiasc8chIz8PSUJ4lHjpUI80dfLYkadf/3JM4sUjVjtgon+7OB
         nerDhWQw7NArLOGVHFn0hw/gb9uGGEggI1ppBLXFcaXTyp9zDT/0WavMy1AOKr3CczrG
         MrgWcrJ9LnKM9NXy/+lXnB7b7ZP4A8mS6jx3fuIhhOOHXjDBf2HnlspIgssjkWiAzr0W
         owww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254732; x=1788859532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=aCRp7Fwsv63K8UV97r6fSJSSdYdSK1VEUleC21tNMw8QfhyHmlt5N5ea5B585sn6Wq
         ymhxQWP0QFzE6sWpC7Lkv8If4lBILQlKE+Zi7NsIAIaXt26aMISqPcq4Yhm+1o8NnwOK
         jilX7FWmtFrOOfrmKmOnz3gPjCWJIiTcFI3gtZbaOgcxeYulQKQgngTP3WIBwgmsdlqX
         W5+TmEO++DyT5qWyZYmGHSJ683SiHwI5xjwmaBGDlbLNvb6wbsmD4Ij/RhWZzN/n51hm
         dtO0O2+XCOAAKxo8LPsP0lcEG0g8RgDFg+KLvB4E1td1QruIGIlrhS0IX9O9S7+k0UaE
         BcXw==
X-Forwarded-Encrypted: i=1; AKwUvBzhQGiyAgo80ZqNT9MTTeDZr6ltkY+UyUfuKMXXnP942cT1VS9PlPx+1TKs6M/37cld44Mr47HzBwXoxfoH@vger.kernel.org
X-Gm-Message-State: AFuF++nCRFcZNKrH42L2P8nh9NMNU5TSU6DLqZ9U1jnKa/wM/j5xIP5N
	joaK9Ew8wS7XUABHmZ+753BH/ecyY8LPX5qCtG9HVgqXoERBJ+6nbkNk
X-Gm-Gg: AYBFou3JUWNEIZsJ1Z5UZ3rFfSvOxlyUVjIne1Bli39mKo8qZ8jkL4rtCoGSjB+jigA
	ZaH+tRK6ykwOhz5cZuDGHQKNmPXDuNU+n3shKVs4Q0MUbOmZx9/SjPnB0pjSlweWmRzXYdmjzXW
	NI0ieNQWzdfVvjpe2RmChKA8v9BTZA6D5ZwBAUciacSa6UNRBhpoC6wsWt6scJ2UG/LhnURDlKn
	VAZfi5UyV0tVKnZ9KTNphmJe3fnuTRZJNmWh234ILIyUH0hAEbuHBUzsALCe2WGEzuYwdxmqIOz
	PAKb0wpsQfeuLSa245pYbCHaqlJEmD3ZHTzE7NHw5ZrtUy7ycuwQayWS+TesQvbdnQZk9wJR7VU
	mfuFK609XCDXbgZ9Omb/Heqj/KqPcTtqRJND0scWhkmMsnD8B+qgtR5xOnc2Tr5xfBintxf9Ayu
	vmEbQ1fIEpMDas1zs+hpP+CrGngJ/QDizzUmH5mR+BwwlkWHWFAthdQwnsxsqOubH/UkUq3lKCl
	jbOhNO55kQRBROryeT5tgo=
X-Received: by 2002:a17:90b:4d86:b0:38f:cab0:9aa9 with SMTP id 98e67ed59e1d1-3990f7693d9mr4117787a91.13.1788254732028;
        Tue, 01 Sep 2026 02:25:32 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:25:31 -0700 (PDT)
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
Subject: [PATCH v9 02/12] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Tue,  1 Sep 2026 09:24:37 +0000
Message-ID: <20260901092447.3028-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
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

