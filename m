Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED2813C9C4
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786887179; cv=none; b=qmDNjfLeU4kclsGa+Qah1I/OiXjE+j++B7C7WpK19Hg144fK/DOocobFP04diniAJT0FGeZw9/XRZLnMDTAwKLjIpbLCYmNnQU2WuiKbKPcGkpkoeLza4V+c3SZv0bAzTRMQyvg+Y6AhctmZWrSEWDkk16yWcI+iHMC8zDjhvcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786887179; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z1TtbIkbdcjnv0lUMVsFwe9WLcoUQyrr4joA6apa6wrk7KYeuh7DZZy98DLQDB/Yerzj53+I0mAXtp5rmJYag4FoBmDjk0X7tSa24GFjQlYH+5kQ2T+lwJK/tkDfPeic9HldcaeHhtxMDshZsvJtUEoNd5+jhMc4l+tH7oqdTd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwHyiApL; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwHyiApL"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbf0dc8c871so1524215a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 06:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786887177; x=1787491977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=cwHyiApL86sfBhzc1W1MMTBWUe5DncvXyUpCWWhEE/ikaM8rNWNnc81jeSIVmZPtOB
         FeYIjYeiZ4XXzr53n0u67Fz82exFlH+3yt5gtvG99d3BA/3OynUhyzzwmsZgt36s80XU
         +94JcbTMRuYhj4Vdg4OB43niy4XVZgPCMgFTFj7JtzwlnqSxoyC4vFObCpLCkWTgdLZC
         yc11QOjH64hF1tFjRrqU+C2RUE3uxrMz0OaopierBn5nwxE7l9UIwhc8x8350rUNLqSL
         hSqYFt3y2l1uwAvIySxmUiffwy7zIST3ZqtCL35JXNcv+5S8HFxdepZrFHW/1h07iy2H
         zmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786887177; x=1787491977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=Rp1QI8XaV2n8ret+vkQavpR34ZstcX2w9DVn8mbWgLfx2iGwIuYRCx9Xcs7+6//qeM
         NCfQPV2PPPW6cZdOQJtc51S+HssZCkvXjpd+tJ8lixWqiAt0U7p/ObtUMQB6GaMEAiLe
         UbCFOOdd2nAMI1okYDVmEOittcsTPPQSWM/J0h+o+bzm7rczTeWR8PULLos5YZ1HNOiN
         b7sZVi+2FIhno5F8jmptDj9Rb4scI5H8ETcJpZp/qTV9PKGSX+mbVOKKWWWltM9456er
         S2iaQVoUertDmKhJfR56lWwo/qtF3ckPncJ7b/9DlMCGJVNDsCh79aH03Un0ZNS77pRd
         EwGw==
X-Forwarded-Encrypted: i=1; AHgh+RrNWkJ0IqJgW9oKc2tdKUKflZNZa9g/Ko61ERxMDq3FY/eu7OdKYGPIBAdFEg//dySEtZ5qUWH4NqG/Q460@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq4nYzqM2vPI3ub9V6qr3EVfyzY9HUgnqbaQmv+AUidURCjX1y
	pjLoOimjVJo603s9h/3NiBqz2FQ4JfnBWlolp4fB5L8lWL5PEERBZPIs
X-Gm-Gg: AR+sD11SqzXSsHRRcSfZoEJWY4a9Y6y/DrrNtihvilfUmOXrQGSwUOPpCkGOIZffFhs
	fVMD5NJgcF9BQ10HpG519jrJ9ZXITlLDNYVLRDZn0gxVZQUWNVZtgurDihBv2QHNqljJZeTE2DK
	D5FcdmQqTOb+IaWZIPiNap2xwTaeFLcJaMNLjayWpR/fPCYvs3lLEK9ZaCn53V4tNpJaWfRvdfe
	1y5HqDgpYUCw8BSoqXwclcO36gfTfTwyJzavc5jCQkK2wjy6QWDt3dIu1t4k+EK/3pZGu2XeTSi
	QoVv4YLqp/2cAUnFyY7YVX92vCoO0oEJPcg7e6m9XpHC1b6FusqstNSZpPp8JJqxSBNKZF8UP9Z
	GSmrtfPZRbaEEi2WlzOuR8Fjt+cez7srkD3rX9Q5cr4TvPx+revf18ANwKJ0ttO40vOkvdd6kuN
	ke8QkjdVnummYR1HBcabHZ19r3ybMEpHEipqtiCeyXZ2+tBArH87AO4T6p+vKVrDCoV41plvqMA
	p0jWXXZJayI
X-Received: by 2002:a05:6a21:4cca:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3cc71a256bfmr20716588637.13.1786887177481;
        Sun, 16 Aug 2026 06:32:57 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm23599064eec.26.2026.08.16.06.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:32:57 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: lpieralisi@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 2/5] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Sun, 16 Aug 2026 13:32:28 +0000
Message-ID: <20260816133231.10875-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816133231.10875-1-sreeshankar0910@gmail.com>
References: <20260816133231.10875-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Kryo 475 CPUs found in Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584..2a90af67c 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -212,6 +212,7 @@ properties:
           - qcom,kryo465
           - qcom,kryo468
           - qcom,kryo470
+          - qcom,kryo475
           - qcom,kryo485
           - qcom,kryo560
           - qcom,kryo570
-- 
2.43.0

