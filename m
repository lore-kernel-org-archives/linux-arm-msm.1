Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9252841F34E
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576725; cv=none; b=Tm4rb+zN3Ayu62wC0zze75ZlusCghJdOQy9VPMFlkcSx973j0LMJJ0zdYtimTiuJLEa8dVpmKwFsKjhJjzVBWMwnXVpFKW8rVH/01SmEBwZtKEFgWOVwqOSFZBEgzsRQuTYFJPwWpPVhTot53rvrtRas/deQCS2q5mjhroGYjf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576725; c=relaxed/simple;
	bh=0wB3huwwaG49ycl517NSgfQ5t7SptdZ6MYz/Al88uo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G74xY7FkeCHDPWACV0uY8CYZR5zZ1BBlhBycDCJUkut8Q79YuZKc47WWMRQbT2HCCT/CD6B5OSIb0THjCT1Fd6vP3JPcaupfYs+G7UeKs6YmotjuWntt7De+pEG+dRMjyVul3B5xG5nPiHykkhHHc0lX5aIPylKEAagZBW1h1Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQ5hszws; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQ5hszws"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-45ee4251389so2346028fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576721; x=1788181521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvJP88qTTuZPBMVLY1eZgRPCHAr9o03VzsEiEHnDVHs=;
        b=TQ5hszwsadExAZ/HgzBagiaYn1wZ2NWrPaj8sBg36pMmNwsmhWLSS5qIBL3Ls3tMsf
         wVmBlq5gGEMy+CbP3tXZTb3J7uIpRxlW3aZ/moH1cVCDCS94RTMeyCGKoJ0OjYkC4G9l
         Gsv6c0RgCKM9bafNWC3FmcRL3vN8H3yhj7n+anve+JH8meFARlwsjt/7ptiPSxjorNXW
         OwiBvruGYrU/Bo7EACrx/NTejhIHFaO4gzaprT0QIb9Tfu/FzofwxDxiNnMQ9aS0Ue9k
         i2IGMQ4tMQeSz6J0UBJFVvM2VsAcpluiTbUlm5RMqsJKkRsdy322dsRySdFkPz0EGpCZ
         sADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576721; x=1788181521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mvJP88qTTuZPBMVLY1eZgRPCHAr9o03VzsEiEHnDVHs=;
        b=Ob7YCc/2et3He+wBy9uUvpNerYagkh4JQAQk8raWHD50OT8GOmjcUfSMsq8yHrjkWt
         b0Rmvry37SIfEgWa+lw3TzIjEMp2DZEyRmtDgU2DTrWIaMCdCvxKOy1JFQ8FMt/LteJ/
         CdhXYtfdbzLcEKxuWrwzoeY+c+/jfcuH3Hm5Rg9axmCkLSdSyGUUM1mBGOEflG3qlwvg
         hSgipvg99xt968RCEh/zsyPU0J62/XmYthXC80KRG37Az6FDHckVUGuswEaTy5/7h5qt
         PUGjqtQ7SrpbbdlL9NVYH55RgAFjGd9C884WMZIKeQIpQ+ttn1CXScnc7xLMdmMFsupo
         CpCg==
X-Forwarded-Encrypted: i=1; AHgh+RrGZkf8Aeku6jukuqC8/Dp6d3S33w0GQTN5Qxz692Pcet17+Tv9ljvj0KAodrZ8qkOIhipCyKbiElwyLlHS@vger.kernel.org
X-Gm-Message-State: AFuF++mCXXGWE5QsY/qmBMIvqaIm5GEQilMsB3aaBkX5zFlD6B/zf5l9
	m2hFV7+mukLSLGraG4qsbdTGhs2k6kUp94TcXOWkFuugmkLuGYuz3VRc
X-Gm-Gg: AR+sD11y7kb6wlT8LZdAv317mM/DtM3cXi+S77imvNMbP08Ic0+vmeLCLRHrTf10BDa
	O+eYZf1PmnPySVfqy3tN5p2MBtn6neIlVW0QzOj1XJ9zFa10DK9k5+6ye6GX4DnZGkeomjuD+Ln
	2lutfFh9I6hgTvzky5WmC4RS8N2/YdLRkccocDmpqKkmo5nI/zJrqSjV/mQLTTILhDGqxQJrEkN
	EqF1tTq2vZJJ3wnrihB5pTGofMeJfvCMQ5YbwADTNuB5V+csirMaQ4M+bLZyZeA2uWqjBCE6OjT
	5A3KElKAnBENuKi0AdXE3Y/mFCBYqyH7+NOiwp48zsfJffXGHG99ewqTAAMNRYZazJlKi8T/IdY
	OEcHLgomzhzfPHOulJ/A9alWnIg4cPM6YBQBaS2zilviLXaluDD6m9Ry14lcCXx6y9IDfl2YflL
	u0ib31H2IAxlWgXjVF59ydJp8YLsEb2vh4/TZQ0VlKv4MaMqX37AaVRbKGWbgBO4AVg5Sp9ER1I
	3bS0sMb/CI9
X-Received: by 2002:a05:6820:1629:b0:6b1:7ee2:6d42 with SMTP id 006d021491bc7-6b17ee28ef3mr6476143eaf.27.1787576721331;
        Mon, 24 Aug 2026 06:05:21 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:05:20 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 02/13] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Mon, 24 Aug 2026 13:04:26 +0000
Message-ID: <20260824130437.2771-3-sreeshankar0910@gmail.com>
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

Add SoC ID for Qualcomm SM7250 SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
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

