Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F57141A571
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040567; cv=none; b=MesJOJ5y4Iku4sywjGAC/7y/CtkUK4EUmwbe0bGbBC4sj4JlNWZ/faT48CuAoBU2i/Xm1SVy7tRgRDHmDWNLAfsTDHis9n72ImxJ+oRQoOCwYpe4C8jjSswGtX9Oe7KvlO1i/jfg3CpRDjOIf2/kwpsGDxK8ZzTOlayzJB/zWwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040567; c=relaxed/simple;
	bh=WQnQ6/awaqesyO4FuxnwtkQQVd/qID9Itar1frdoCTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEAuXSJFQq3oD2+VFSBMXJ9sxfmGScjx+qYM5+FNjUgtZup6wTMl5PY9fO7UzJS7TsumhX1EtOb0vGjT++oKaSqGpl/yOlrn1ScV/03WGlFM3Q6e+1DnF+qYYUZrB8LnsqsRP+lkdzY3UvpTjfexGK+MjBbFSfMyAEcfR/HoVUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9wSldjb; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9wSldjb"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso3069524a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 01:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040565; x=1787645365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iuOxCh9qY6VsPX+/asBmCdWifj8i9okEwYPqtY8odhc=;
        b=s9wSldjbks3MfCo+8vm1hxSmEmAAB/txoB4gFiYiRNrHVnJM1HIY1YEg5L5BxOkXUV
         ZrT1lLOH+CQxSqnDy/6vj7gIHDBwjqatAamXFVgb3N6sxHcW3Zz61TNPWBPbCsffDr5T
         Vp8W3zizV0EzMRwh6kaoMJH/Bkhs6trLuBsjEsDGdZcqMXtoctDuwiSPTyw+u/a0qMwX
         m+dvdxpfjoG5OaJ4pRkTYSJGk3fwExd5pLgGiDC/u4DPcbeqjdu+cVDYXHEZfIOBUCr4
         MfqZjfiK2m1Qfq3Fmsi0bMe1opD39BvudrRi0KZSESysYlu/JirR76VWHw7c1bKEaHeN
         sQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040565; x=1787645365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iuOxCh9qY6VsPX+/asBmCdWifj8i9okEwYPqtY8odhc=;
        b=Fikc+yegwdHAobeRhH/whbb6Gk+CSvmGCwdbXLBTd7zqYSSpBYoPcZeVg8+zLh3P1u
         ygVWNdW8TkI8aXW5mBpa711q6GzETdkGrIN8gfpI4lWrhF3Jal7fet54tV0KcEZ2uZa7
         LLpteJwepX8j0Q/CyGRyGpS50i6swOpwCrOw1/HTxUczgQz2qE6mshJuM6FihC9jh1Qm
         Eo+Aqc4dSy5jCDZjrTrQa2LhndRbkOJxdjvvfGsN88LTX0dJLqGkwWJmnM4CRnOw+ug6
         cKPKSrBWqQVm8Me4QYaJZPdU6Vzp2FKmphMlZDN4QJ+pwAeHr6W+3sL6umdrur4sbY/N
         AfBw==
X-Forwarded-Encrypted: i=1; AHgh+RpskpTxJpRtRyd6QkpXAs1bS+XM3F0oqrhuSll5Fs9GA0RERCcV9QvNSCNi3f/fExNL5cuPZMU2rFWSLo3m@vger.kernel.org
X-Gm-Message-State: AOJu0Yzymkhg2GvFTiLNB6Sjy7gNMrR5t6s3bayzprPVX7Lu3fY8lRlG
	QuRbIg8HjsBojqXBcGoIHDzaGWlUyedrql6m247gGvqFM4yMVwDEDLHk
X-Gm-Gg: AR+sD12IDynWbr11yZ7efsmKfEZHyOxHl7Zj8Q25OwRRAWpyiupABzfvxIMVPxHA+Q+
	owsvHnzKEQYItCBT/QO910Dpv4V1raGto62lgSEc/MQwLWvMwmijYXWVNI7uxL9is92p9nhs3H6
	vKOOGfa+SqvXNBIS4iTES4zdkHkfwCN+QiezMSSOOTkvdfgPZgAXAiMnwgFf1lSPO8S7A2mNGji
	G4HKEyzqYpk0Aj6i1whzjkjoeDPXymK/2t97B2S2vlTIvoRGqAiNqxJS51ZTj1yD++7Qn1KdvnH
	/y5eMcO3kQVvAec5gulKb85FqQ2/P1WYE+lxcM1GxVjmGNQo20XE/wS9IgYu1+512FKN0k7a2xT
	K2T5lw410EMmyJ2u/0aoXruFbh7kn2+EP+uRuKl6S8I8fCZmX/VdCsC9+bNpK2QiRVbI+05xcT7
	Dhx8xnKo53uOWoH4KDrAbJOoAK2PQ8ufIGPbMlu+dzl8bsyHmmAyWZS6FwUGQqK0Q5ezBhrzRfv
	WFNlZxQGss=
X-Received: by 2002:a05:6a21:7d0c:b0:3c3:a3fd:db0a with SMTP id adf61e73a8af0-3ccdaa0da04mr9243528637.16.1787040565566;
        Tue, 18 Aug 2026 01:09:25 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:24 -0700 (PDT)
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
Subject: [PATCH 07/12] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Tue, 18 Aug 2026 08:07:49 +0000
Message-ID: <20260818080754.4362-8-sreeshankar0910@gmail.com>
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

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0744a867c..427953913 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0

