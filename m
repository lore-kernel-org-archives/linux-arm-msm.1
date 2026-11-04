Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778429;
	b=xRsOAG+9RcrKsAhUWKMa2ecIUtru/KzY2G8DOgM2XaWNRtUDkODCr5uSjfBwGVKJEe9l
	 tEaf6W5apt+SMI6qmnD+PB9DZ9eFIbExbyH6p0vKpysQaWImf0dNwl7toeI/ahG9ggDf0
	 Z3faBt2Y+6lz1YI4xFLBvCUm9WSEnuVhBdata1N7tF/AHrL3vyUtNeX1itqmzIbenfoHW
	 Y9Pw7hkQu50uFreDlIU2PDzEIE9Qd6HIs+c3X74F0wUet7Kfd0P/MP4EBT7c+tvSzkc9J
	 KbzLPNlgq+e+IBzSPNtcC9VwmFvHGrNvmtCSqh9RRK42m6oQVlzuOHFbOwy4r2ZN7RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=J6yu/WA+9/TduvIgw8i/6/eU7fXdqXxpE3Xb+fSN5P8=;
	b=2+0k0rI/BbO8khuRlscgIvATp+shDPeChQt9fgNpYH7Xi7XY3f3Iwn1ZkEtPGRTg60cX
	 NsufXkKz7aSdqVmYFafT4JuA/q1VR5k+mZfw17Q5HIOV34PFXnMvJc0UUOczxO6Rb7K4y
	 4vytpT9Vt623tVVQYQAJ17cCsdKcx0FMvReUm5Jr1ZXQ9blJeKvbrcM/Ji41/l3iJ6ix7
	 VYyqfa1dnpLyU3bNRgbWmmhp8Htm4Y9rFDPPkMtARkFabusTocNCc9f2BIkOD9CWCqFTf
	 YOhRaY+WRwuyHArg38vRWAsml+T0sC6AdV52jaoa4I+Ug4pvQUpRPAqBaxCoBw7eaHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl8t+O+K;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73BE606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 07:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A73BE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl8t+O+K
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35b2c599f43so801191eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 23:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778428; x=1794383228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6yu/WA+9/TduvIgw8i/6/eU7fXdqXxpE3Xb+fSN5P8=;
        b=sl8t+O+KsQyQ5DSrejOdiSjykamgCVW3ly1JTuZRkT2dhUs4GoP9/ThyCQGBq/XCCp
         U98webc/Ysmoh7c9MJY3B5oI0yPCgntB/GcL9AXhTlIWSK5dygUBPvtaa++R2IgqaOwc
         zncsdYfkB9nhgfUkuqV4dxLndUwnHg2X9ZS7Nm3H8HIkAU5e6QZUSZrWfK/IGGrwpORd
         vlEbLyuIsO+aHaGtUKKT0QXkAnEyY83eAafBQ/gK7LcQOXlhYuE1e/IaBdGbUobFbizJ
         gKELP86j/916+BNlfrgufWSt7aL+7ggPX5PPBcSFgpyaQEhlHk4mx2oV67aPqyfjc7sm
         /gYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778428; x=1794383228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6yu/WA+9/TduvIgw8i/6/eU7fXdqXxpE3Xb+fSN5P8=;
        b=peeNVSpaLXWSy4PJVasj4KcWKLP1PRWcD8H+tiHwq4H6F76Ze9CvyQflZnaNnJKXna
         7zdLGVYCG8od4oDUzS5gCK8inJBazkb5S5duE6YM8trMMKoDT9wyZQx4DGBIDlmf5MeT
         nYGU5qCLe8ggzZU995Mx5u567xJ7Sa5BEqTMvWxazLaeePye+QYA+xX2BH1Ua28ZbkCX
         xpVXpGGWW0GZ9J5TRd6PP5arl3JdhKNS+kPuK8oA3kh5ZIuCWsWwx9m26pyx+O7tEhPI
         jD0z+FaxfeCE66xOPZz1SL/DRJECOEU88+ZxViyPkMJBDVaZoBMeIrQnkWyNB+gQCLw8
         EZzw==
X-Gm-Message-State: APuU4Z/ZKdpsoxyeQTu7xNV6yo40ydYmkwDcVNsBEjHyc+BTImskYtlZ
	jmDpD4Qy4XhsXevq9K+g3X1TkpHvl0TwlHC1JKipGeUh/MXTKj2e9k+p
X-Gm-Gg: AYBFou0LQNXkhKAmXwQ+MZ8plqpqRSFKys63xKSV5yWUYa5tKsKkVO/0GidavvTvbsR
	vMiTKeo05dsIBvrofkwyGMVC8hz1/eHQ7jXOA2ytbIE10rfAjeysHNFmm79HM0Awe6L4xj94VY/
	59sZdGgZ60owTJsCcM2Jx6xhPq5ZSdHwtQquLoAhcjpGNc1xkj6ZFU54DGoKO70ghFKFsOdxH7e
	4czDDKc7+TR7Eky39XO1OghiNgo9i4eiqz86UEiam7Nd/Wk9NCz6PN9O6fJ2oluy0a7pqhFU+bk
	5APwHWEPJoP4BzVr+dwl/KnDY0AoLftBqYFIYHpIfV8vR37rR182QVByaEdXVge+seCiI2k3SnY
	Y2Ud29LUIjovKVFpXr1PZbmEa7ppmchj5gcedzRxlmas8Ik624O2z/Ogl8+uqr6U1NYBsQgHy0h
	kzOPFyiHcRVk/g90SnmGIS/2BHoRc46ymOGDk5I9Cp67IsA4M7h0ZWmozcRmhG4EKdvAvyl7Rpa
	yOocQnnVFmSxTML+pKXhco5KtOsmfYyPr8A028coWCFpfSmgdlBgf+8tkaS3/wWky/S5jgGz8+M
	fONFSdvQsf6THpcJlWpjJCAg3Nwijc+eAxx0tV3AIhCyzwUdcNwuI0R9f0YMnBhafe3X1a0VhIw
	EP7eevw==
X-Received: by 2002:a05:693c:6316:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-36a7bb74690mr7403733eec.34.1793778427751;
        Tue, 03 Nov 2026 23:47:07 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.204.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm4566016eec.8.2026.11.03.23.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:47:07 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 07:46:08 +0000
Subject: [PATCH v12 5/6] dt-bindings: thermal: lmh: Document SM7250 LMh
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-master-v12-5-57fbe9eef978@gmail.com>
References: <20261104-master-v12-0-57fbe9eef978@gmail.com>
In-Reply-To: <20261104-master-v12-0-57fbe9eef978@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793778372; l=839;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=I+Xei2sZyAD45OKuTBmy2G1nFWggAI0hWE7RAd9U7rk=;
 b=GV9sBUWE0iEAWwIlPa/SGOrrN0lri3O7hQcwiFcVGn9liKszfRaOKsyvnpyVcbDKLNf1fDcL8
 39Nm0QD11IADHiNAZse6CTtX0O+2atStZ6s5c7Npz6bntVLNBEkGcjo
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..b8da39f8a 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -26,7 +26,9 @@ properties:
           - const: qcom,sdm670-lmh
           - const: qcom,sdm845-lmh
       - items:
-          - const: qcom,qcm2290-lmh
+          - enum:
+              - qcom,qcm2290-lmh
+              - qcom,sm7250-lmh
           - const: qcom,sm8150-lmh
 
   reg:

-- 
2.43.0

