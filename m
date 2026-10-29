Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257440;
	b=HWlNdhaCKXUR3Pd6nVqA8aCZ8prP3y5SKAem2Vzwc81V+gqZ5DQ9FA1QAgnrChke4FKD
	 dqm1ell3lCIyhORU8ZtO1QvosgJgxZMT4avJW2gzOhQwRp4DaizI1PMkSg3inWjpT5jvg
	 PikDCLR1tlNReHEuwWXd6XBKp+sirBrVsxg55YFvtnXeV4YCiyG7m0j673JV4BdaFrJmm
	 UNCU1JJW12kHbDJND5gxr5g65gEfAwlpBZK7iOBjp0bWyY51Lpqq3zFaupBD1LIZ7ifww
	 TcIVI4JqhdLwqZ40JnpSEJJPbGjFXicunVD39vKD0nhmI2Sn8vVtoaD6SOUfwvTXa3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=uLXUgShYuzqF4ZAuBg6KTg6ZZ2I9Cs8fD8/hYe2JXyc=;
	b=oHN50q3vORJmTdgG55T7tZaZepHGhRiXJnn+q3s9NPn1SuyfpDUyb9Lnf9K3GZZRLG4C
	 5QGdpIUcqnEggqHevbSIe8OhlrRRS8a8kuLLgjifHEvCswif8/JmoCsf37FhaH3Oo54/m
	 DsB5wCIOTKtxYNVgaTpqPN185TVlWRiP0AUv7Zx8bJq1optEDBxC4A/llzwumdlfx/WXk
	 FB6nJIRO/SPVOaf5z+FIddsj8iTd0XhIXBc0aqPz+5U9EGxO08s/a0+ez8Z3tsp/krw/Q
	 rwpG3I3/vGDzrafONI2s8GtF+m93xvhyQ9TlUMbnJjZ1GZZFLianYk/Msr7FiRHTm9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwNoZ4Cj;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6F2606A329
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 07:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD6F2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwNoZ4Cj
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35b2c599f43so3917011eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 00:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793257439; x=1793862239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLXUgShYuzqF4ZAuBg6KTg6ZZ2I9Cs8fD8/hYe2JXyc=;
        b=RwNoZ4CjRuYkg/jasy/Mjn6HOQL5A9DiWfE94RbDJRoMBIXOa8tue5p1UA1PCBjNZg
         9pTEnZ1J8+Nap8yqIUe2E018rdqcdBP2Z2l6pgc5BghO3yb7IRMemJfa5nC1ZKO7Ags3
         QnSoYq79LIDVDMnxJgW2vBfTNhvDlc07kKp87hfd0su92VhjpCSkqJo1wAaSSF6LCT6e
         7Wo5UFuWTCyP8d082kzIEGc2gIYbeBi+Jy/kvyB5Vojav+W3TvejUZ11XSWmbTEdypki
         YgC/ofrBRKlR0nPcrpLSscwvR5e7KdPY4zccsdGIh9U4+KLaTWfC69e4L7gajvFk5Di+
         Xw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257439; x=1793862239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLXUgShYuzqF4ZAuBg6KTg6ZZ2I9Cs8fD8/hYe2JXyc=;
        b=D/czsmY0HpSJ6aYxosnz+PXwP/isX+mFTFX8eK8DdxEHwZ2l2Jpux7ppL0bfUHd2Op
         prXyaDvduqygr5cf+0uVA3UGgNy5H+KMvm1rGh5x6Oq4OnkSqDcJpymJAzr0we0VAaoB
         z/9obT6/3g9clPNRVppV7pDYEp01+lfXQfvzTeK8/0XyV1sql/6l2kLljZ508vbt6Ngq
         LUhM5F/Q6Cu1s+9ITc7uHg05M29uPC29HqqVMU38iWgppJgHHve/NpKskZBlzTkVi7qi
         NXb0VoERQn1T6rGhF8fhkKMPeaThLwvtoUw2PhUoh+ThyKHjQivu7AR3l5RDhXIgTC1L
         ze8A==
X-Gm-Message-State: AFq9FYKaM3mz0E0FiCL1wfjna04bYArFndjowI42q5ATV3LEP7p62Uf1
	XwpdxnrEtKOGrAilCQB+ElnB3689kUcIPPBEPnp3q5iJDrB7mQE1LEpa
X-Gm-Gg: AYBFou1/W5CBEDXpz8BhzVvD6BdrrHxgsCu6sbZFBHYxng9nv6pYJOZpE4iWo1OdkCd
	FzcOlIQqEbWNw/ZYk59TLkHbD1gxjXlNbjNw+h4VG9hWgePs3TG7rEw+APEFcvTDX5VYAtZBpID
	Nnvf4+ueVh2I0k6jGU3MG4GZHn274B+x0kTykj1XITWik7wv8+XFV8/KVRl+PU721llOzMEJYEk
	vVi3HaQvLWJkB4FO6AfilgAqDYmi+W5YRR1r+iVjpxIPiQ4+1NJ6MYI9t7Fn9U1RbzPpYV6anIn
	/iCOlx2DPuNIVlZJaNx2rOsrXMMgM24ppfvtL2yBVJ2uUqMX/SIjtZN+1/CwgJ5iG9Zw+4X9INK
	hCR/ur1mjewg/cy7bYO1bRTaSuEMVtAgx39LVXENv8nR+RC4h9Y2owb+6znMkXwhq3HxVLP6nMr
	rTLiyqQJYkquwjM32cNFmJndfjRpDuzAsmvA2kPeuOMVRSBMm5+oD2JgUImsIScDH7l/54TkLSt
	in73BTPT5DSOkIMo0nmUu2tU3nbb4xrtdKQzZGeYbE2Mx7eIN+loErCUNBklsU6mX6zFLJs993C
	amz0Dp9ct9qP6ZGqbdojCVStQJQlVAB+RYtNWA+kCuRWBZAW5ni39XvgogCb9iVTz+0GFGi+OvJ
	zm98IXSRecUF1dfQP4rjwy3FqeCekhg==
X-Received: by 2002:a05:7300:cb0b:b0:351:4866:255c with SMTP id 5a478bee46e88-36a204a1735mr8418969eec.32.1793257438736;
        Thu, 29 Oct 2026 00:03:58 -0700 (PDT)
Received: from Sobhana.localdomain ([152.58.200.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2398fa4csm16955443eec.24.2026.10.29.00.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:03:58 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 29 Oct 2026 07:03:01 +0000
Subject: [PATCH RESEND v11 4/5] dt-bindings: cpufreq: qcom-hw: Document
 SM7250 cpufreq hardware
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
Message-Id: <20261029-master-v11-4-2c29e382162c@gmail.com>
References: <20261029-master-v11-0-2c29e382162c@gmail.com>
In-Reply-To: <20261029-master-v11-0-2c29e382162c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Danila Tikhonov <danila@mainlining.org>, 
 David Wronek <davidwronek@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793257394; l=949;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=x7hZEQOYoMz/dmWpmgNA+PhWEJ3zQC81cV4z3jRraIo=;
 b=ufsKTZU+b0OXPb0mc4gZE8Nc3udFJHAZgWNoVr7Lb6gGfhe/dXr+syALCRixe/7+HHnMIsdz9
 7leJLrSZMDvATc+wj7zQErP26XHUzfF49khI1iWjHMj/aRS0k8/yGm4
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

