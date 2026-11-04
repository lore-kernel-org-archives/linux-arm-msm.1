Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810875;
	b=ec9O+VzH/SjBGiJFZnFl9N/GF53l3j0qAEwztKgK/aWbREQpq4pniIT7WSVFJWD182lh
	 0hRxFrypjPN9+MJttLGquYnZKLt38LCMgsYlvEll8PgQJUhxhugLndipGsJtch9F6PtcP
	 3w0gVzKQjPSh01yJ9Oc+RZzVDgrYeNThGw7HBmaM7PKcnI39GAmuaKPa05HydMqOgAnBG
	 zuLy7uFJAn16upuK+5onESht92QFRU6Q3JG7DV3Pv7BVFM23RebZrqVfcCV5o6rx+ef3z
	 /5iTM3hDJQbkIk8sXRK20f2uEyEo6RD6Lvo3NkbLtNwot+OQkGLhjjLsUhL68UcxhtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
	b=OTGA05HZfPbGBLrqyI7begDE67UotC0AWcXYBd/uhzu8ZfzL+pZEah6DX9As4F8IgDJ8
	 6My6aLfA2Y0ltZZN5rLjRby+eUs5PbRdsB9c3DK+jdJXBD6Z6VBeXYikTetvc1wh9U3d8
	 0eVjWo2vhSPOL1uNzfrc9LNv8WAZZswvUKMoGaeC5NV9WO5ais5/slCJfZpXQ6Axe4tOV
	 GRrDc0HkLfqyJ5vTxiEf339FiZL7nd17NFidDIzbrK2dFbdutRhbDCOvpr8NmVDjF/1vv
	 trDb3SD+igKCjXTdEguWK1RqAqCFpd79iw2TArqM9ghW3BdA8NSwEVpOZKMwNyN7Piw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ONOs4D47;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF5B606D825
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 16:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF5B606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ONOs4D47
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1511511eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810874; x=1794415674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
        b=ONOs4D47G6dqE/Qb40F45Otu1UBvZCRCmCPEKocfpcbZqCvSNlBXHBerYhItVEIbmg
         Y7ZdBRreRAhQHcdUZammYaeLXW+7wCAsiMF5J0x3HDr8EhjSabCJsMdggUOVB8Haxe+p
         0I/cAqbuJ8N/5vS1lyvYAwDWXbQSP37AmbbAY+zjtnhCIu2M8IRYL2UdBwJlDC1junfb
         145qvg9naBCNpwwSGwnym+e9D5Q6yQltI+mH2d8EaSN/8kKa6arGcWXs9ogEmghvV/7a
         IPH6wseh/tHEGdw4uXSTm+9Qwu4t28Z+HtZ93qbIyJ7jua1SSc0KjmCL7sz4BhncdqjI
         MDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810874; x=1794415674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
        b=ULMSaR0ThxcQth3EBvXzy/3Qtx6fphdBiydIPGmILKrFugG7whGK56RB1y3pblAVyP
         VhgS6WuDPc7ILIK3gbyeDd7YF/mAvDLO1htI147WhhQCy6vANZ0olxhfKbyWKPdxDBjI
         ur4v/0SonQy6H38a3bMWGPgYxJ79daI9hAMrKKMvYLa1Q5NyVX+9Ayt4NyfXCtTMYKN1
         prfMy5dh+J78iU1gQNd4oUWoIE2JdtdagEdPZOJfdt+1x2nKMIHIzaEwlY6ueSImPHpm
         M2a7uwyK+CwDOQgOZFQWX/VmJoh7GhhWX3cS1/1tjqPwJiFjImD4DW8M+NJ9QSBfnxr7
         bYgg==
X-Gm-Message-State: APuU4Z8AQ0sp4yHReiWdtL8UmXrU0zdZHmRtHgVlbV+LNg0+7khb51FZ
	t+avrNd/Y5uocy/nGGmxR0vpSHpBZsALlXGgQr0GnsvDFr16ktHYVq4X
X-Gm-Gg: AYBFou0ASew6eqv5ClumJj8H2sMWwTvfyFzhtEOvdLtFKeLWkQ3MkOP5o86d7B7nfcp
	9aoqo1hNkXQbQa3y+02EOeE3gAkhYf18DJbhLdsKDIE9m4Z0jScMQOncGEvdN/ECzqnmR1Jpc8L
	ApgX6RdVpsGWNg+nwZSWcisu2ESOR8Uap5iLiah7Ws1+TyvV7MLe1Crl+I2Ix4j6xUH/rYyfC2k
	Fj935fvhSg6CdBD/X2/kpiwRiT/NGvePnaCA53Mg436J14YtFvHhiumjMDkL6tch3Ve7lx2KvE+
	Pbm6yc4QqiTuUzxkhvJjac9NOvdiR/CdHb0hql+XfQlMPaImX5JlUx4qpPxxPuaPAhTOU21xtB6
	C/bEwymLeE1szMf1qxhA8/cdZdD3zVZGeP8w0UzkML/AcDu7ql90Td0XAgzQ/+OoAkCC+m17dZV
	I8d1AMkGAmG+Dk8F/MGPSFOEHqTqY0wmeu2PqeCDeQMDEF44njUnbHKnWsfvF0GuaUxrJSH53s4
	o5nznRh7N17mir1yVHjNU/KbPaxu6Rd62CxMGEhzTX+DLF07Tk5ZB1P3Ao8ju4JnqjUvW7rbBi9
	l/Jt6n08AEVgZQi0zdKtSIvWjZ0UCXaF9/hqGq39eWTZrzBsgiA4QtH4gFFWwuGU64e2bRuVn1j
	CBkBVsJA=
X-Received: by 2002:a05:7022:7e0c:b0:147:a685:9125 with SMTP id a92af1059eb24-1ac574556abmr25831860c88.2.1793810873589;
        Wed, 04 Nov 2026 08:47:53 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:47:52 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 16:46:39 +0000
Subject: [PATCH v13 7/8] dt-bindings: cpufreq: qcom-hw: Document SM7250
 cpufreq hardware
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
Message-Id: <20261104-master-v13-7-355b65c6f764@gmail.com>
References: <20261104-master-v13-0-355b65c6f764@gmail.com>
In-Reply-To: <20261104-master-v13-0-355b65c6f764@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=C3ow+chGT1NNdSip5xA3Ydc5tLXGcOB+9coWbmZJeQY=;
 b=0gSOTjAaT57IzIzDs2ys8gXMuFwlQSYBUyrknvzdEMuCtxzuwu4EGZ2k7kNLvFUEfhKoPMpX7
 w7QqxqnrPSgCDIYxCy4duxqgXgLFgE4j4KOPpGEsEqWdkLXATzLOJPl
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..f8cdb652f 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
@@ -201,6 +202,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
     then:
       properties:

-- 
2.43.0

