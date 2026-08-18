Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EBF41D13B
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040602; cv=none; b=VKaKh2/nx44oo3NOePMPWkbpuV87Fw53rdebMEIWHeVPQeVU51eKHsYArrID0o1CJTFm3ypZpWEm/lgctKvEqhaGnbFw1QZ5b+RJ1d89LMz/6wG4VZ0kqFt0AOg/u4WL2L1FDiySaEaKN20KuAThDIithr5S7L6BB1aLM2p77ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040602; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PWdhxjeBqdampWnHCvGapP3VyIuQaARj7FrJb4z3iLZ8U5/w3ccRYHWEPx7JL+rrdAd7oCLJR5vYDuISBCEtGtzRPSdqqYTdmKxjKhqrB5g1WVQjA3C0+RgXao4yfQF0Ua8wkC1rzN+JUbj/1giMzl4vCgSfzVhsVv6Al5U012g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZutLx8fV; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZutLx8fV"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8518d5ddaabso2186769b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 01:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040601; x=1787645401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=ZutLx8fVQsNjJW+UYFKcn+/9BS700/+Jxm2OVUn1IjzYxKEVD5al5vpJsPYo/nKsB5
         4IG/C814SQn+hNonVomBldnUlMeHzEGC+fddLhup4ze34KiVZTc6l9Le1S6pVa2RMWf/
         /36P0cxuIAEg2lt/ib5v+tu1C3dvI4PWcwuGGnIvEDdL71BTmnlJSWNllsrf9C7/xY3B
         FOI7eaT4/k/P69U3LmZ4B5a9FsXe1YX/zIfR1sveeycFPUjahPt/QswvWYYaYPLlteYt
         KpnYusEmyCRsxaiB5q/NjeOK2g+k3n6bUp2Pc4amf30ry4258uWaG8daInERp/qZds7Y
         33Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040601; x=1787645401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=LtNnn5vcWamyE9qViaaqlUHT3JmjWkI7XYQ22ROYoa0y4/bQ6FasA3s4hQIsqcHALg
         x/AUXC11k3AKIrkGsyFRT2M7ut1kJ3FDCd1vHB7Pnd77PRcs4nU3gdnRfnt+7c0tL6pr
         qqFETzkSwUHC9ChHNZ3c13VAwrCBdMk5I4aeypgPjw5Jzdo4e6OTQIlTGGUzQtDyVhTs
         wjOQ/TD2MjTfFJbCk6NRnl8fBGBZhoLivBP45U3kH6AwvZlDeM8EJ0CadW+9Ge9ytuR4
         oGDpRrhKdry+OozvSOfZtZyAT903pg0WVqDRCOLUN0uyo+xfYTDVemb0xO0E4guN3jd7
         64hA==
X-Forwarded-Encrypted: i=1; AHgh+RpkEkgnacpaQUlVVGcoUh7tOnl8/vUeu7X/WF1hfioyFgJuQe/cHXCl9r4uQ27v5avIesUjTb+PLWZI0jwK@vger.kernel.org
X-Gm-Message-State: AOJu0YwMJ3iputh0E5kxgdO2JpryEudJYIjiLPiYPxhfA4jl8Kh7dGA5
	raKadQ70CcpHPJZXaFLZ4IjClaH0NbOdyUpzvo0R8gp7hxgQJrt7B6NP2pkxk1wQxpQ=
X-Gm-Gg: AR+sD10G/Jz/gIvg0r/fyQWc2/B64hbLy3HuuzAz2G8Ia/6ylULPJU+s1w+4pc/cyMj
	hg7Upjyee2nWxr6DLRQQUTyZwrP0a6wNNBT/vERRsVAW+d5ksklIJGD1L5ojVlrIMvoqmSwz6Rx
	hJpzUW1VY7EwDe1HDV0egF068silCHfb8BzC7w+C+thDCjGw8e2LptvintR/BV0n1SLo4N1Doyv
	FYTIyKseOxMEvvdSav46DMrJCrsOURGnpOaAYaE84TjUi3+O2flVHihiIfAQZh7GERViX2Zmo1O
	A/odFR+akduxmwsUSOhR5/zYOeKkT2N5/rL19PMOuKuT/hRlrT7bhXJB+Ded3SEoJzaJbRy5LLf
	BXibB/zr6Te9DsdacPfxJoOR37p5EJaMJ1MSiT0WLbWNZlFYMs843Pd/jI+VA724IotkjUZkeF/
	BlBIEl513Sjw37o2pw1hsw7dFjqvgohvCNhQlHjXd0CidXUdGWiDUT8JD3tCiLczWOErAhkh9Sq
	NHlvRoTdaY=
X-Received: by 2002:a05:6a21:3b4a:b0:3cc:b26a:7686 with SMTP id adf61e73a8af0-3ccb26a7a6bmr16133613637.6.1787040600556;
        Tue, 18 Aug 2026 01:10:00 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:59 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 11/12] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Tue, 18 Aug 2026 08:07:53 +0000
Message-ID: <20260818080754.4362-12-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

