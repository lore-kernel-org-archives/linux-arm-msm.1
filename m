Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1E0430CCA
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 08:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300021; cv=none; b=G4Sc/exXyBjELz4AO7JOhSlHCli/OkkgtafX+ejBPvjBpghTPit1cTB2bMhIRvlNCqJh8177QXv4LkKJ3qf0mBRBeYxEeTQeuk4Xn5Y/bWkFgYa5R/SNZtCnYuzYf8rSGeedetbKC2ELyY82EFeXJNtjn+FjL4sGxTE7zB85rk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300021; c=relaxed/simple;
	bh=gKbqr+JbhugVzrK4haKucfxH1GbAmaJ/63Ra+8PimmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fUPEjci6lOM0kO02kAv8P7z6G3pNgwRSPq9icFAq8VdHwqmudCRpcgKB6PiVLhJQOwgDpK0EhjFWNSy5JYR4FETE/MdZeOwe7yxBhXLw1QBURvt8dkEoBwUx29rffBEzRY/slFR7BWFnQ5LDwP9os19n683Th0l8i5gt8mGgBwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jo6Yup2s; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jo6Yup2s"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-382ef647e20so703191a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 01:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787300019; x=1787904819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=jo6Yup2s1jWFxeAGZmELFCYNh03KUuRZJAi+kbVR8e4+Pzlgwpl6NpDG/wvsl20C2z
         Oq5T91YgMsU0EGW8oWpM1ZgUl6q9mJsMePkO+hOK33IfrX8Q+4FSGWbXCCYCJxGciIcC
         yLIrOkJl4837O6LycxrtPkS4GeRSBi/kh2Wei5pXMZYdhpez6uVGdCIu6wQHLQpqQWsU
         LdBLEcdpks2dR/dO9nv/ZJGpT/iznmYj82LNFx6gIOcDJDik8wpA/Va6BVI15qNzWH6e
         N9m/SvddwGYrVCPk102cbi/2i+Va9JrlVbWf/fBPKAJLrc/lSTfQr0BHt//aorpIdj3i
         /MuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787300019; x=1787904819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=SnwzmIU/mE4siV4vev6yBsqYcgpqkAjXf6DxJ6jC8ef51scsk1ELtEY1y41XC/UkBM
         /wafwicw4L3r8PpBZCfNb+KSXDVZUkD1+rIm8Hl7Y0z9HM9eULdVf0xpVRTrH4V0K3EV
         tJvSMbY6W5lLQupC0BoWC2l4JbVn02DvW+7OLIUb5rJOcjxVu2oNgFiy8C3oT4d89mzM
         jGZeX0qRHV+78z8f1r4wU8ggatWtdJpGifNbI85FOaEQjSmZ0WHvPiI9jPONTATGHrvB
         YHdRwz5jQ1UwEjdEFcgCyLxO1tD6e9rZpOmqezMpdIr/pQ5ZFmMUQmAVjhhbCr2KBxHL
         J8WQ==
X-Forwarded-Encrypted: i=1; AHgh+RojOiG2GtQMgJvMtr5u1M7JaWoPH1NpiRzCZalpQnzfahIN0HMJDEtBGSaCjywe5cH/ozDeu6X52DQpniag@vger.kernel.org
X-Gm-Message-State: AFuF++mBq6md8z91BbML2dWsX57GTNHFsRyhLH0H/saHf59HBPOwlAGr
	f5sar11AOz8DaPc8rm/Qb28a4lzdo70jD7wucRg1TOKuGoh434Q2XqmP
X-Gm-Gg: AR+sD103V7jDEBAakSWeRxVOJhnePtKaqz4tV5YZuZkLmqBajPibpllzRZQx6oruz8D
	MvUwTLaF+PA9XqSZGxhr1AqqweySFZbtwB0TATLcFL7iCIzaIeGHNW4/01/EtbUHXd2tTod1PPd
	alH7K88Ct/LTTjliNEfvGDjXg+zaHjL1eGz6f+lr1Yu88vT11WVvHhwJlarW2cPVG/sZ6ZodrN+
	9FKWEh2FAsNM3URIPfmoNj9YOOxZuKkjvXyB9lQ28xKJuMKlyTF4F6qdJEENPUZkCf2C0CHtiD8
	24O8d/9pVcLdxyugs8yr2tDpWLr0gpKU+L2MTQbQaleQBy/ZvmrAIkSFNZfpWHvh0pb/id66H6b
	DOXaOaf8zSiLsakLuI4keUNNcyLmHSgVR1S9UKZyF7GfVgJ4arlP/j1sG2K3VbOIl7duU5uBt1L
	GA6DZCvNFpak5+YpAIrBHHaPODsr029jn/Cr9ktQlvBGeDMvoIk7f1QK6u+bGeyMvgEhhGoBaAm
	5hszyTXYtZb
X-Received: by 2002:a17:90b:5110:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-395c35dbf5bmr9219448a91.9.1787300019475;
        Fri, 21 Aug 2026 01:13:39 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:13:38 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 10/13] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Fri, 21 Aug 2026 08:11:22 +0000
Message-ID: <20260821081125.4522-11-sreeshankar0910@gmail.com>
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

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f..0cbdb3b2f 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

