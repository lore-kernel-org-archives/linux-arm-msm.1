Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CA4480960
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153297; cv=none; b=PPvnc0CYpZm5ovp7qudE4G/wqfTaMt/Nh11Z2zGUVcSLkXn80LI1IaR4j5u08B6TZitC2C84CCBeoYT2GZN70eKXrE07aqGQis+mxFnnJxgUMgUn8uFeverq2pTZTWzPWVD2nqcE09uhjKMNEIPmWNzCMJbZ5QhrlyoB+qLigkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153297; c=relaxed/simple;
	bh=u2Yu4YBYm2njILlYS8QED4Q5XuAaD+AtoFT/SlvHqq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxgbp670oGyJaBDh12HF+R4qBYgku0aof+ERnCb06GpQGMUiSv37AdSiQ14p023KHcyQRVVsk7nz7w2/ZbcbeOJcQJFf7KB77uFb6srmySTyWghvLWmZs4Yk01PVIXmiddWsn7kCAbnHOn3iBaL1agCf527Hyz1Oh9ZOzymFMfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f87GJ0F9; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f87GJ0F9"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so8676a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153295; x=1787758095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEFzlhBjAhuEe8xovPGxxPJuQ8Ojqn67sRBJbsAP39c=;
        b=f87GJ0F9CgoxS/V3fp0BO2vgvBXL4YUzhJqblmGRG/tFQrfZq6UuqdRPjAvE8LjnfL
         VmjYP+RKg28MJf+GTTls79ge2iPw6PJc++/RdyAb0LP3RZTPTXQVUYaD/PLNzJMVSzta
         UOwV08k4VtLwCi6kdAYRgWCPz1mzaHesFGtgHgeIV60IEC0lwX+Ojph2youlTf76kD4c
         aGlXAUWGmkeXECo85hcyohfDMWOjk6lIxhXs68L8Xbi4/LyaydoOJ7e0goIbMlFRGKoS
         NYsqyHeU4BNS7Q6iQXeCsoo/LtfTccg0KaH33zq6z6t7GLM2lnX506nXSSxVqMa5+t7M
         XHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153295; x=1787758095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEFzlhBjAhuEe8xovPGxxPJuQ8Ojqn67sRBJbsAP39c=;
        b=qarpVmQwvDHK5MOfHTpiC+/J8M+dwzc0OKluAecGdpgdcvVi5fnZ4bA/BBClX6mSIY
         8HHzgST0qnhmlTVXznzwub+HJnVvYamQRgFlLDEfimEoAMBtF7I0LWCCarBTXjC2MRPR
         sbYlqGPABC3NHpEa4uLsJRDVFENRZyXoTk1vLensYyXGsSQgxChaZ6ShQF1V+8Y+UFfq
         tDpo0xCZx007EWo9yhj5Xuk5fskFaqJRfM8X6jlH5OyhsZsh0f/V71tcncpf9xJDeeTb
         goJtg4zO80H+56O0TlKYaZsZ/XFXHinYg+aW496bQN2vKgYdxIN4HhW99ZykRZiIZxyc
         28Jg==
X-Forwarded-Encrypted: i=1; AHgh+RomJGeKs89ZzSYxSu3GmKSiXnf7H20dpOViOwCTzbqkCYyfSoHEGaDl7mWhvpMfogDrItXIzHjMAit5j8l7@vger.kernel.org
X-Gm-Message-State: AFuF++l4/01nehiaE1kFbrQqV2vW+566m8lpE5TDzZN/pQwYjGv5iCt+
	fBpsoMXSQaS1wIfgq94qiVJUxhA3HE6cPMsHd/4hwMUQyU7Wd0LxWB9d
X-Gm-Gg: AR+sD11VSCy0TtLrrX+Wv2fr2QNVx5HUaM5JjaZYnVwJPn31yGbHPt0gzl3K7zSVusq
	h2MqAtMqHVhwOwxk1Lh8WzL1JzM1wVtuY+0Kw8Q9ITJm9uJv+tQ42ZSAxZUblKJMYowVIGPtqD6
	o8WAZvV5bdrAFp+dp3HACcmTMsv+VX2KftLdpalXq3ppcGfxkmAm4EX2juGOshLiez+O+hw3PhX
	dgiYzQ3JUnRCLlh4frRpVeJVaoMRvzrnG98RDoJqnJHOE776GDtryp7lPY3VRXH6dfDzFcq+apX
	qTBNQlQ8KAR4F0G8gdIxRzN/p9vlZqgNSEnVq60J1EVgqfrX5lB4t7LEhByZbJYbt/C/sRHEiPE
	KacMdXCtwcn2oJUMkJLzDaufA86clJmXJ5fturvYsDq1R/JEBUvLX3Wv2leaCH2IKVK2DHXAFxy
	6HQr+plgs6RN3gc/cIIdC+Lp/aSJe+drjI549lboiq1oB54+TcboQyXK72y+KNaEDqw5t2CZUya
	CM9m0y+CIA=
X-Received: by 2002:a17:90b:4a83:b0:380:ce69:2669 with SMTP id 98e67ed59e1d1-3957f8f49c0mr6838442a91.9.1787153294591;
        Wed, 19 Aug 2026 08:28:14 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:28:14 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Wed, 19 Aug 2026 15:25:41 +0000
Message-ID: <20260819152545.3934-13-sreeshankar0910@gmail.com>
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

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..2dc2c265c 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
-- 
2.43.0

