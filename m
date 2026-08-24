Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5353B42124D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576817; cv=none; b=DEj3MHYXK7i2T136wgApKGrkkXZzoC+bhSttc1wAPsFGaKAy4jc5hIqyXipXmPz77oyU+shaJzDFy2vxp6Q7tCkhzyg3SjcBsB2Q2ypwJA5Z53AstXw7IOXVFJAG9CfVbVrOTrOGWQDFcBB2GV2u+bfGirUtX4iOCQbEqI/AKC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576817; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/lKh3kDyuTvaxuOhbQTXU0TIHxKD6znFjpxpKJieYrkhVl6m3JEEu60/HANdPMSxIWBZjlqGYRJwjB6eG8Z3pNio0ZxsVVyKts6DIAY0TyFTmt2gB9dTbGlmxwPragi4h/alfYJkqT4I7wRHMHct6V4J/v+eq4r0mZDH28tYPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FR4ldn4+; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FR4ldn4+"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e7109321dso2387906a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576815; x=1788181615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=FR4ldn4+0piraMrYiGpAT5yAvUsgGTNMIaDUDHRkGNjLabNaCiuNYz+yhgFO+uZ7KD
         ljgQklwBfFcEK9uisZYjF80BfeHVWFKfXJoXSt6Ef6aBfse63Dr+Q6gTeSG1lsiq8E1e
         A9FpuflxRcLf7WghoNBUAPW7OHg3kBuNn9/aFfdK16tJ7fSk0mLlCa0neGIue8pTbTMU
         RMr70B8unMIaTnTJSItezUK6+a6Z5pCivH/SSckiq7MTNphl9eMhDdRbxpX+8ebZfWTa
         BXPhobbTkcMwI59YLzliwRJ/mF6u/+197G/jYZN04v6fIDqX13LinD2N7HtSLEy/sYGj
         WEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576815; x=1788181615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=lyfXiC+wAGzbxYAgxvT1UGfPDuzn+T0tHoyBHOBFzFiUSUlL2sCQNG49D5UTKXhE/L
         F+poBD4DPHASXWA4pU44OzLcAcYh6GD7D7QGnYak+TdHfyG4o9V5qKhe1cTuNE+ImdmB
         ef8EOoLr8X7BKTyNO4rJCxFoAeu/Y40QdVrXSE6566Ap2midQ3DfCtWtHBQi4gJ3KiT6
         cEbZta+mwIbbF/FkqDKf9WNCmOuquW1HhXpvS8ZpegZqqzT6s0Lqaw5Z9usDF7vXAelf
         M0ERR0owdr7898l0P/eUh0+254cWdiiWYAQWUXkCjS7CDNOaMxLARWPehV62IdBwqd0r
         ALiw==
X-Forwarded-Encrypted: i=1; AHgh+RpZ0l9AIcfDnKG4QsfqEFfCoS6ejhT3BpQsz1yPkj5oiyIEAY9YZPFBrCOd9XkrA+TDREINQCdMJH+bQ9Ru@vger.kernel.org
X-Gm-Message-State: AFuF++mB7C8YsEFZaGBuYvoWykEM+dHwz+RngMJSJS2Al7xQbyr/rPe7
	AcJMxfebPsk5KbJeI3hz8grCv5yBQZDX+Bok/s7Ztf/XYd2p/Vr0pZPr
X-Gm-Gg: AR+sD13ZNxGliThdc1rrod0SOMaBVDh0qYdzSKTCUfwnfAMCPJb9jPdWrX/ArUS7yFz
	vfxejDLCqXyG1pPi9KsFE8rNnP0QYLW32nSMIXCV8wVKDfS9McW+dq4OKsv6uYir4635cQtzPW5
	4umqbIXQbmAgVtupYZgG04Qaw6HhtU4SQly4okzpfIEk1tHDR6voR+kN8kv5VzoTMI6J0leHOFm
	LPihAjpQh1JezDLk9zhAnOWoSgxn7dD4FeNxaeLPu6NBfX8M/SZ+FdY48Z5O5NwbTQ4+/+tLKRU
	PDEprOqHq1QVA3MuXkfV68/ftBryN2JZ3n6JSp12IgN1Q4LzPWIcbhbXl9awqKov6x6gFkqHTtq
	hvi2wFFlFt+z5b8LM1SVBdfUucwNkFxqhGU/PLY48DHqEvInO9SlKTT6J+vH1t4shI75lLM8WyZ
	g1tqcRbc9dqhaW7TYmFyoRxIwv4aTfNPqlNrXU8T5IOVW2igxlaV1bhvaCCvYVmjrYkgQiZkK2Q
	mwRW4ZcQ7mA5nVfjvSfRRR0
X-Received: by 2002:a17:90b:33c2:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-395c3597c56mr43924218a91.5.1787576815440;
        Mon, 24 Aug 2026 06:06:55 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:06:55 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v5 11/13] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Mon, 24 Aug 2026 13:04:35 +0000
Message-ID: <20260824130437.2771-12-sreeshankar0910@gmail.com>
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

