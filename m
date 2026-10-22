Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662111;
	b=si171equ4pwc5NrCK3OUmGNArwCUgT2foO05QkF03izwOVqn0Wt0vOZf2klnHf0qvFui
	 lnUPGYCg1ivWnR6Drhxjx0lkZxtPk4c5dXnqrrSHheFJTWoNdfwN2EYOkwQViM4VLck4v
	 LUjK/oQNES+/wj0ofC98zB0JHbrW9/Zm20H9N2jHoa/bDu1TXZ8F+tNve87gkcBsVZFOA
	 jBLW0gZJcVswzlW4+zVoyXs9gy3YYFqlv81iwxd5IDMuM8R3gGYlvr+or2Ew9HhEdH2Yc
	 XcjL1Tht+YS9X/IerBrUQCsdwJqF0MrAQwwizEG/tuoNWARak9az1iDH9KIBQI+mafw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YzJYBLOEFNhZEUyVt/ZR8mdxY6kWFw5Zp9fV2xapAVo=;
	b=XCOGo6igsAxjuifNGUcuGA/prO4Jk1rKkS8Ljiq6tJk6+i0jIlGJg6scDovJAhxGVBYX
	 15QXXrauTq2+DYZLyWozQq+musOiCXTIHY3CFfP81fDhBFCZ9+ZJOa5S8V4JeWRcmihrP
	 8bsWl43ouv5m79N4iuaUKL10VPh3oFKB8FOVkQHyU7cKaLtZlC7lvCVopJTmn3VV7fmNB
	 GXAAhC6cJnDJ/R59B7qFv2zm/wvqY1uvvPxkpaoJEEubf80HCJBPij6MfNwK0FnLcTN94
	 k0UVMJdY/SOhPsiIUBF2Cq4jIuFbIEZVtRi8KtaCm3yNA7ZMg/rwpmvi38WZYR80g7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=flCHyNcv;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E61606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27E61606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=flCHyNcv
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9d1114320so12458995ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662110; x=1793266910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzJYBLOEFNhZEUyVt/ZR8mdxY6kWFw5Zp9fV2xapAVo=;
        b=flCHyNcvGJEetWmU9Fiv7hcFWMZoXVM96GmwYbc/esmM7l6NyCJ6g6yfq2Xo8ADIBm
         WR8A1EGGX3x65G2pGZykeolg+tZa3bK+YX3TyyQ1mmiZkpI4t5U5PSwce2vOe97r4Kta
         gKv6S9DKcCOuvdhB/8c9PnIsoVM+6RqrRiyL1++GTusOu5MoqmeVn3wLL5bmTt88XYO4
         Y0bBe5ExlE1YXjThiDtpKE6OlKb5w1jSlSDrg0FWuA7hQE4hIxefOfadY1mZJ2zikQtt
         GOK55gc4j5V6xsPAMZ0lldPFxAy3gPcU+a+2DS/QdZOlP0jc9Y5bfuGkES3kLpfgr29l
         YjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662110; x=1793266910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzJYBLOEFNhZEUyVt/ZR8mdxY6kWFw5Zp9fV2xapAVo=;
        b=JUwZgSIgkuDxoG1hsKnQ/ARxGh+0RxEZgzpqDe6N2RjIrsmdtgWv1mdnNjRKHKKVez
         rVMZuuCUj3y1kmRj9rhnas6q1MjlV1y1R0xQYwAlbw5YxgsHeaiUWTFT6pX54yb49Ibl
         SAcUC4KJZp2IqN1fD9GHlKOLLNCYFWE6A3Qw3EIwezDwdTifBTr8ugG9q82tNcQzRdrw
         TMqJVcs5W65UdYJEXtm/6wBwCDU/PxnJ8aBUqF1n04gR/AroNuIhCiotfzGM2d0+DPAn
         H6dZoITGRs6VvhZc6A2NqkTOycHQM8yhNX/7fY7/QbBlVaH0yadJUY8gpl0Up4bIMZLw
         e2cw==
X-Forwarded-Encrypted: i=1; AKwUvBwrQMa2ESPdlfip7bJH34Y2fR2JXyDCla9m5J4wbrZ7C37xOnceK8HRKENMDD/lI+fj92t7+xlJX/jYqyHE@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5Gc+4pyjHvHbANp+Y9ahKl6HDiscGPpZeu0zhVDIwsGvdbF3X
	U2YCTDAJcyeyf0R0D+a4UYLo2nP+yLNrXlLvTeK732ytRmU7U0bDHgAZ
X-Gm-Gg: AYBFou3j5HuOHdmaI8VAkDMm1sAu7JKl3mBbvgYcfN5n6Xr7k0s4joiWkZDt1sRAnB4
	x+uvZns+s9xp6X2W0z/9DWElSc79hTbZQvZlACJzV+Y5j3cm6WXVhSdQh3ASGazREvajCMfzC0J
	89N/VqedeuxDXwYEbOet8HinQ5y5cRomAogUd804syLfCFhUKe6eJ/Bqa7/Aky7R6hlmAEgybyx
	Z3+eBg29Jte81TZcGVAQC6ZxV5cDLI4L/wc/7+8RU0JoRUQPaC6GSU3MQRRstIJ3wWJuytb52zu
	Y760DJOH5w9HPTtfl2UuqhJs555R8iIR0Ws1j5HQ7nndMGW3+uG+GvwFeni083WugnmBHil5Ofa
	1PKecJdS5xRGvQI3+ktQ/LusuVmSQCvAGRq60qQc/0AXairSnBka6a7leLDy27y0tmcLAZxULXI
	8M2XC2bbWamXi1e0N3qGZQ2OZqSxaeKp2J++dUE7t02W2tz5pveHaiokP/tTrtwfuyWLFGVq1Vb
	8qeRCzYFXd+uWic+lIPQ+D12f27bK3SeRraT1yfswcw0tq/
X-Received: by 2002:a17:902:da8e:b0:2e9:6788:9369 with SMTP id d9443c01a7336-2ea43e17bb3mr40452615ad.34.1792662110457;
        Thu, 22 Oct 2026 02:41:50 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:41:50 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Thu, 22 Oct 2026 09:41:11 +0000
Subject: [PATCH v3 2/4] cpuidle: psci: Allow skipping the suspend mode
 switch
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
Message-Id: <20261022-psci-fix-v3-2-9ce2133c5659@gmail.com>
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

From: Alejandro Tafalla <atafalla@dnyon.com>

On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI reports that OSI
mode is supported but rejects any PSCI_SET_SUSPEND_MODE call with
NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and the
probe is aborted:

  psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
  with error -95

Add support for the "skip-suspend-mode-switch" property. When present,
do not call psci_set_osi_mode() and continue with the topology that was
already built.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
[Reza Kurniawan: split out the patch, added log message for skip case, renamed
 the property, added property check at PSCI initialization]
Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 16 ++++++++++------
 drivers/firmware/psci/psci.c          |  6 ++++--
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index 5722365b94..cc9f14769b 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -159,13 +159,17 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_pd;
 
-	/* let's try to enable OSI. */
-	ret = psci_set_osi_mode(use_osi);
-	if (ret)
-		goto remove_pd;
+	if (of_property_read_bool(np, "skip-suspend-mode-switch")) {
+		pr_info("Initialized CPU PM domain topology, keeping firmware-set mode\n");
+	} else {
+		ret = psci_set_osi_mode(use_osi);
+		if (ret)
+			goto remove_pd;
+
+		pr_info("Initialized CPU PM domain topology using %s mode\n",
+			use_osi ? "OSI" : "PC");
+	}
 
-	pr_info("Initialized CPU PM domain topology using %s mode\n",
-		use_osi ? "OSI" : "PC");
 	return 0;
 
 remove_pd:
diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb2..3226af6d89 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -791,8 +791,10 @@ static int __init psci_1_0_init(const struct device_node *np)
 	if (psci_has_osi_support()) {
 		pr_info("OSI mode supported.\n");
 
-		/* Default to PC mode. */
-		psci_set_osi_mode(false);
+		if (!of_property_read_bool(np, "skip-suspend-mode-switch")) {
+			/* Default to PC mode. */
+			psci_set_osi_mode(false);
+		}
 	}
 
 	return 0;

-- 
2.56.0

