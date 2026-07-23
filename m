Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF1B2D592C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 01:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769862; cv=none; b=OYdE2IZGguUDVi9RDJf6X9+wSIVkHxsPmYChW8elUGggQ/qrdM5789vn3rl/jltHl+tCuvugacHnw4Az055o8E5GKnxQGcTIhUtAAFWQ7hcOeNL8yTFiDKTKYXmoJVz+XK2hdZCAYN+sgGby0rMwqxd82Vlx08CBQSoLHWUzkDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769862; c=relaxed/simple;
	bh=lMUvG8FMcDQny9fNqRp3TCG6/uNRxCa0yHENbOIbwBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=APe56Qn/GGDdnfp5bRXiNlV3K+vJQmRi4C1oxeAMpsNRjW62q21YPOhrN5/uUn6wxgO1VPLw1LQqLn0T92pDb065UvbouLiJWyJAazD7jodFsa4ixhe2sgU9DJy4Qg2rJwzhWR44Cn25BX4WKY7e00BwemOWupe/+NSoVc8dnmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kh+L3AoG; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kh+L3AoG"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-664c6304683so56506d50.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 18:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769859; x=1785374659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p22cXgqkOK2Uxhc2g0dbrDiY3ACKRgSdYIBGvHqDRE0=;
        b=Kh+L3AoG4Ukl/AMbbfjZWAeOjnlNvPUbtLm7ECBy6kDEsE2pC21MUlgtDk0IWfZf+c
         oTOAdaFKIcH7RzGeWawTNwsdF4xkZtbLwnfSWyAhrFWRAbyB+UHuIXOtrBj03kUWD2/h
         3MxSRN2PKoksLYaOYEj4C83qGOzl+2iE6RxlRFhTYy3+AS5ZIHA39jjq2sHmjEl/H5eO
         LvnnH0+FAKvViOAj+fN9rBjMNPO3v7p8ldlV/k3MWHmiCU49SiAWgWLznymKI9A8D+R6
         G7v5UOoLtTh47PBUakrnX62nPyVhvnsMqLI1kgTdOOQLHoorgBJfaNnTE4TSjlaSprwO
         gsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769859; x=1785374659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p22cXgqkOK2Uxhc2g0dbrDiY3ACKRgSdYIBGvHqDRE0=;
        b=ecnop58GrQ58FTJ6EPYofmRIUIvFzujc7PJEj3UvxinEwPI6/ob1xIiTqKrfLDtjg6
         KwMS+O8sXDAkyonGPw+WWelf7nS+zHzqfhXJrB5OZtq5p3aN8R/o+tDo0hXJ/+fcChmG
         nRgcTGRIvRJIol67mQH8AAyOUTFGbu7oXW4h376ZeJpIeoYsDQmQxSfgRW+FZKKQexEa
         SkXEUndrCBqLSlDPwHPGDkzcYNtlzB2vDBbat9msnybVDJBbzXQ/mwZYpmMPqrKRCWjO
         wj1hiJew6070xOUfbop/+Q0O1JW+fptEoVnNjf1f9WGHCNkY896sO2o6E4qTHbe742UN
         DwcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0YeLKPaYGuJFh4nNFaETBM8T1LDfklgk4LevtvXlXn1DomI8ZefiKa7mmerojQ91jXId278gFpbXhtMhf@vger.kernel.org
X-Gm-Message-State: AOJu0YzrDNy7adiT66bUyhZAdpp3wV54Sje6x8cc4dXX5dCy7Oq06l8n
	8io8dJ0/H8AbSTeRJQmA1tWzjt1tRaJb/kk7hm/Q+Ozwaew3RG3hlMur
X-Gm-Gg: AR+sD13cNk16cUVs8H+HSS2pK0LWR66EyR0Z1wygQxPmndLnvaWAE7jFKOm5Pdw4FjP
	WNk6bnyQNnJ4mixIQz6Rw8KaxGk68OHokIx5QnwdxhgoLtx7zWoFDL/MyJ1Q4J7PvvSDLyLz/sf
	WXYHZSN0j3Nz3tf7r2icgq/mU5TH5QNn8/+s4L+a9auPn3N/YO3f45MjSTGT796Kxz9/qUXIq3+
	ToMhnX9tki1Xh6VYuzFXMEKwR1NX51UjjzMJDQJsui0qSvpTdYdtpMzLZxyEOLGZ+KoGg3/tAkZ
	yM9W88u9Wdb0oOgXEqQgwaxy+bvqjgOfxqhz2UcI9dG7H2zIrviZbsnT8SSAF527yXXsBxPewHJ
	mt8i7880mjYpI/LmO2UjxC/l7Rmieot22zSoLbEWVX8+nUUdVylMBVww9UhpYwAZFOehfbGMs3M
	JZK0LgvtDYvhCZ+R3YaTLOaXsgzHT/AtY2Yp1AnyM=
X-Received: by 2002:a53:b884:0:b0:668:2f2b:f246 with SMTP id 956f58d0204a3-668a5041eb4mr198296d50.100.1784769859021;
        Wed, 22 Jul 2026 18:24:19 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm2319684d50.9.2026.07.22.18.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:24:17 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH 0/2] clk: qcom: add MSM8920 RPM clock controller support
Date: Wed, 22 Jul 2026 18:24:13 -0700
Message-ID: <20260723012415.48288-1-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MSM8920 support to the SMD RPM clock controller.

MSM8920 is essentially MSM8917 with MSM8953's modem stack, which adds
an IPA block. The new rpmcc table is MSM8917's clocks plus
RPM_SMD_IPA_{,A_}CLK (same IPA IDs already used by MSM8940; no new
dt-bindings/clock/qcom,rpmcc.h entries needed).

This series is split binding-then-driver so the shared clk-smd-rpm
changes can land via linux-arm-msm independently of the MSM8920 /
perry device trees (requested in msm89x7-mainline/linux#48 review).

Based on qcom/for-next (d36de2e50966). Applies cleanly there; also
applies to torvalds/master with a trivial yaml-schema context shift
(flat items vs oneOf) if preferred.

Hardware context: needed for initial MSM8920 + Motorola Moto E4 (perry)
upstream DTS follow-up. Fork PR tracking: msm89x7-mainline/linux#48.

Catherine Frederick authored the original fork series; this re-roll
keeps her From:/SoB and adds an [aneesh:] note + SoB for the split /
rebase onto the current for-next binding schema.

Catherine Frederick (coolguy) (2):
  dt-bindings: clock: qcom,rpmcc: add MSM8920
  clk: qcom: smd-rpm: add MSM8920 support

 .../devicetree/bindings/clock/qcom,rpmcc.yaml |  2 ++
 drivers/clk/qcom/clk-smd-rpm.c                | 31 +++++++++++++++++++
 2 files changed, 33 insertions(+)


base-commit: d36de2e50966f3dd9ef3482f1faf649b3d697714
-- 
2.53.0

