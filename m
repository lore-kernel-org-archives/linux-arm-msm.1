Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D2D2E7397
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326876; cv=none; b=OoL7YCXSkII+tSJSpuxgHXdwlRk3jAlqNbxO4uxrMxqh0SdKWkXbOBi86lkQzW45G4N5sAfq7qeU/U0I16n4xwcfMEia/cJ5gaHJwY4Rg5w1+fyjW7d982/IeuRIB4gpFMK2jgpZhgfCiOnO/IsSORBxjs81hW4X+Ri/7AlMJCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326876; c=relaxed/simple;
	bh=HpzD8eE93G0QF+A2LkG7W4+8iO6y5XPc4Rl8E5Fjv8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j5FFCBYxrEAk6Ll9/pAJnhTr2/Y9Aho3RwjN9hbiTiGmfTz5eG2xU758TDy5+HwXM8YV9AIvbA+VvA2TmQyLuH0vVky4/mbd54SW7V/KOf82NxWkZ6dlorMlbfGtoRBxF4tcIu9uy2DN10hQH2mf8azXJOXwq8jPrKrMxooDAUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5wmzQ6H; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5wmzQ6H"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so1581833a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326874; x=1787931674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=B5wmzQ6H3qCVvb/kiwpVCc3GorS+NW2Zul14/aoQqZsgbRooEgmliA7t83ZK9QdaP3
         azNf1qIoB3/1Iuw1dHVJHqeb6mj5Trn9aYLwdHTAyxetxXR9euD6uQEvotKStzp1DBzN
         y66mMCumE1+NIiCyhQb2J8QDiPQYAC7DU3TvL9mT6JdYDrdqf/aa58lGYfzPWq7Okc/k
         pLRyGUo1bb12DoePiz7kOjyB1UCPcGRXEur+U1qwHsG7NhwV1d0NerBfHYOZ+AFToVAb
         ouJGEp+JddRzLWXtWNTSaGFDOgfz0rhDx1kswGF5bqTBK0sv61HQcM63wnCqzp+DGfdD
         GsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326874; x=1787931674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=ssiKGGgDMdFig68E+cQNqBtRVzIpjaxkEIMhDPmDc0xuCM+WQyfPhiidBNrsxgWtMX
         UkPo6FWY63+V2fNvWU7NZnkeJhRrSkRNThYddLtiJT2GDSewiXZOBid5yThxaSdn+3Pv
         B9B/Q1SLFxgkYLL8fhkQrOgZrUz5MuOD7fhF7SBwq8ccC+e8c96mTptheb5tpdl6XJb2
         mF8U5H6ejuhRTzrTVTJSiPKDu4c93ImdvatiHQfUxVo0Le+6D8KSBITqBalkrSmlsxq3
         SUcJifCW2IBkX1yNuXY1lJYr8vFVCKgUW3DFdLbrLKq8MFx/oNSpJGF6nz3qDiZ1B4i0
         EaHA==
X-Forwarded-Encrypted: i=1; AHgh+RogIFFgITAX6EjOb1eT+GwLOQI4SDqdrs2Kbvkt5Jtqol5MNjFz2Z5y0AmYWVWq7peoA+b+sqt7mHRTiuOM@vger.kernel.org
X-Gm-Message-State: AFuF++naa41FG+8rV/2kYx9BIFRUJj19g+owF0xL4+S7vgJHRfSzp6IF
	wBuMlHmI3z88FAMNB7HjQ7nvfBR5Ekn3D/N52to08dObZU3H1wSi0CDR
X-Gm-Gg: AR+sD10QeM+N+N/D9hU6q5TMXYgopyL9yfu/9cw/V6tFa5f1Xns8I7SCnBx/5Iuy7E8
	62iuKNt5586RQg0IwuBu0nEArNmMqxTSh+FAguJkSkztFp4OcjyDSKIrgB9V0n9lRppU9qWJX7z
	fig3j6EDhqrMP13bSa/ufDv7TyCKlStvmeZHm6DmBxv2YWxCAlDJ2CE/2HXY7BJ3o1N18/LKjPy
	EX72/zKhKivL5gr00mfSG4WWFbcWKXcop3lZW5iljKYiD360auZdaJBd2z85psstbpwqnAtcQ65
	8Q480Qjl/g295bK0eyHgAcady/MlLxMU+O8JtyOQxAVAubRl3BKTr+vUeheO4jd0uOPTv1w/93X
	9wsAcxKnmIgUdkmjM1qAEvtsez+t++G/SeS6Sab8jepjyzkLEmGwMk+W/Y/z6hORoOAiGX5072l
	x8Fph+pq9iT/2Zvt5FKrvsmOACrevmWvI7P0skQEC4cN6lsvgbKQ479b+0ykyFU+SFIYEj+HYbh
	GjZm/9gvq4j
X-Received: by 2002:a17:90b:388d:b0:387:d9cc:7dc3 with SMTP id 98e67ed59e1d1-395a074a348mr20056250a91.21.1787326873816;
        Fri, 21 Aug 2026 08:41:13 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:41:13 -0700 (PDT)
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
Subject: [PATCH v4 02/13] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Fri, 21 Aug 2026 15:40:19 +0000
Message-ID: <20260821154030.2514-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821154030.2514-1-sreeshankar0910@gmail.com>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
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

