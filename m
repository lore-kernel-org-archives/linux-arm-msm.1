Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1FB3438B7
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 15:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326967; cv=none; b=lfoaRzEDK2Pw1h8jij1WzZDwik0qXQnfDi02RGPoSCIvNMJaRVtRiZtZnWO75ity0wqrlXUVb21RoLy0zKP2ynHZ1970cdsmtYOy988OnwUoVm4h3Ew/uonl7i3v9ubC07AAUWwhngZlsSowVLaOtiR+cp1dMpvkCEvSUdfQtYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326967; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oN7yNyYoURnjhHQKyM3hrjC3heOkAEMty8gaoPdj6pX0cmy7fvvJxgAQZi3+06LmSd18tmfmVt58aRGnur7S885ekA7tMcRsBSqyEH13c6R4hgpbqd/l+Cja0CmVOCZ096jkLFuRD7dyGiJgdZACJGeB0mlGcdkMZepL0v3oqSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNs/3m3U; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNs/3m3U"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbedf6a6fe8so852787a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 08:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326965; x=1787931765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=kNs/3m3U/hh6FK5lKOcRQHOU4uM7XhgCXIyqGeiW7LzdvC8da2/DKA26+u75/2DzI6
         Q+pKPKLbL71j/6+rkBdW73+fnRDfOFhVQeCGlWoNbHH4MwRfdRgmtFtOra3RzCJylGvy
         qT5rAkZ8KX0gde/8TLbAM0r3rKX+j/Q2eZ7row7pNOp1MlVMQIJM6L+OcP/Kixwu8Z16
         bZfYBUEsUWmQR2ZrhnI1eyCsuYwCw8XM0h2lbKq8/McZ7j36X4gDHcGNgm9A6utEAzbr
         horcuxjMwlNwr7QgifdDp6gTNNbuJdlenpoEc+73Z44aJTeC9Mlfwx1N2S99y8S9C3ze
         6wAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326965; x=1787931765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=APaeo7f6cORyluTTBPaGEKOTPLA9kDr21DtZLjY9U2bHqjjAapsCl6f9SCJgw8Pqhk
         GJhUakon31rnRCDVMkFtPvE+vyyl2oPMGrC41fbgQ+HvBZvW6opDrPrbTo+bs1l6E1eH
         Z7iIEb4YBK4sLu2EAc15BTvJoRoiL2SGIemm3jl0cGYCab9uJiyzBp2tAPgmHLoiG9K+
         30/l7O7Cft0VwV6xlOBjXfBLxcd3xSXMVIdprLobVjexJYzOS4lyNxXyeduFMTisxLpT
         9BiIRSmgiBk77AEHZlss1i5GQk87OlaI7Kuvt8f8B8eB1Pvj8/dNI2hCHg2gcZPZNvYL
         46XQ==
X-Forwarded-Encrypted: i=1; AHgh+Rov68j3iMiwTBPnu86tuH799hZhp0rh3XEIK0XpFwXyKS9TS7AEYz4kHpjg3qBMexvXoxAMkUAh+9zt+jhR@vger.kernel.org
X-Gm-Message-State: AFuF++k7zLDw/k94wAaVjqIhFH+fXuQUCkDoQBRBY2KfbML5DcAQ+TTa
	CuplhZqaOA2f5pwXwAX7R0lolhX6SlGWOB48CRRmtmG49nBX3u4nX/OJ
X-Gm-Gg: AR+sD11O8ZyUKTQ1KW716f5tcdaZQ+hgzM86Lozx8xsjPzSUBMcpLQDvitZzE5df3FO
	+z8/aYo9KUi5cn5IncUGwZCtt+SJxff8olfFwloCKkLFm4b9Nfwfd1Uu3sdyN55UJCOEjSRs3rv
	8GRmO1K5EeYXE4d0oeK+HCt4y4YjxXVaSddS8azKQoH7a+0BgMEcGH9V+OklskiLRqOiAfPV2cA
	SGiPRfWHg2fo3nML5qgQDS8Hew4A7jhWYA3yBJgxV5tYVzu5tlwBzqSRfAUO0Q56QhfrWW1M4Av
	uS1aqnGC4kAHf/s4WCuZCiDE06SfMeWs0OrsN0PDheEiHZ2+5efABAxJjcI+fXArCO2p16NNmpA
	vWHGshIvTZlUVL643Ki/oUudhlLOj3dUorkT5VCKNyiOwMTlJoO7dODaEE5WuuLFAQDJtHMBfhn
	2tNxohs/q2lxKsNTIckncpw85QNEdQbnQb7hTRk4efdrxbEpe1jDXg/cZ8G3gg5rnAlxvnaLW69
	LZQXTgUZG456RCJ5yUYWZs=
X-Received: by 2002:a05:6a21:4514:b0:3cc:9162:6bfe with SMTP id adf61e73a8af0-3cd302e127fmr14339879637.0.1787326964897;
        Fri, 21 Aug 2026 08:42:44 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:42:44 -0700 (PDT)
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
Subject: [PATCH v4 11/13] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Fri, 21 Aug 2026 15:40:28 +0000
Message-ID: <20260821154030.2514-12-sreeshankar0910@gmail.com>
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

