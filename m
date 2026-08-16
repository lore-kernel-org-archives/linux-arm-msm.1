Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4732D8391
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 16:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786897135; cv=none; b=e8jft+3yMnwaRGxXPYkLD5CwrLq3DHRuNGNhHmw3t838QngZulW4kDPYY+Js93h2bmOb2CCk+lhywljUU7wpf2NStcR4d78K19tINQgFwuc+CACx0bQ4ZVBhN4KijZPBHXXFrFkUooHs3q8XGYaiN15EWHtjrMOGTbtfX57b1fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786897135; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0tI3aUo5fvcDvkJjyM3d095R43nDgAnKOZy0G0eIqycpg8gHKkt29elPYAm1Ux8goZQSGWo7KC4nmkCCqMnohmW9bdNJkOJG/3prgncgY3dKWp4yUijbzcO1hgbWRJwltyA1kMSCA9Ai+BsAspbQiDgYjruJm6IWRy3JfB+6Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImuhsS/M; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImuhsS/M"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so2476976a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 09:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786897133; x=1787501933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=ImuhsS/Mwk/Yz1rLEMcy0Cp6IBxKn9BWUjFvjfUPrRYCrystTH9RguigxB/8Z5GYHi
         vRg8ao5g2okxXtNK7Fi3hpcHJ5mpT/0nBW9JRdBQALxG+Cx0mNbIzDUIB4U033gOJJj1
         PyDDerYtutuPTx0J3v/I8z6tyK8EsvGcU1/I/gdbr29M7v0u5OPbRmzH34+xAjY5NguW
         zH8CLbRMpsvl6rQ2xfoUK5c32HZ2R0EE7VNqDcurvbRaUtgvNDAq/RjJExk80Vh8lOKM
         4hX5moN4cM8ycu2z9525wVOe2NhCpm+V8PQjXyfTqR1xjAt0ws/oG+BQRXyu005yn6xR
         cXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786897133; x=1787501933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=e9DRaU29AULzh7fQZbyg5YodtiPAU6OhxtyPUIjthiosd3MQB2qI3ppI5fUPqRSMpH
         cnR3fXaRfqsRYBdP7qhBUPT++1AQ6ZLbduV3/umJxxalhE+a20YbEc2CXGka1mlUX6Q+
         LKH3dBA3kQpnpu+vkeIOnh8AjBa6qEc7r/pQupOC4qb4en4NlkaffpPrZGm9oiBHnoMF
         nrHtGt6aaqS+o+6icJv5HvvKFa2l4LS+af8W2CoF0x+J3XcyARW3E/xjaPJzOFwjN351
         4i3KbjaUd5hXq/sJ4/D3QQaqio5IyK6epZI6PAirWczprgH1abxQH/86ExGkdJhvj+Ze
         Tgbg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8Lf269jHlceEJL5byx2U4xkBjcDeAq2xidhQNdfLY6g3dsUXTiIse38/7+g33lmS5vwbL9Spv59o59/UY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4nx6lBVzCG/DOOMhAQCmcX2PW9wgDGeX5L7326NS5G1lE2KzP
	PWkwoQOVjU3O/k25Lvx+goPndqr5oSm7Mf+GoLBOKrvvd8KCYrUF890z
X-Gm-Gg: AR+sD10nKTdBCaiBAENsI7wmVTlVhVg0ZQc1iw1lL1QiJo5GNZGUoTZs1iMTgpFi/Ru
	AaXVe9aqk2s80XyU/umy9qWAF6jAY3RYDLjHeZYvyzyjmXWPTXc1KYjKJYcCPJbtReOZXxof2CP
	zuFhYCWLLPaKwYy0sWty6LJRZTs1Sf72Z7FslWLrxHZW3amf2RhjfFm8zN1Ui7XYbvX/VjKmDPJ
	32yX0/dBx3snQyg1pMKWF67Oc/dl6EyF6xElOWfPV4mO9kkv1Zc5nU6ZI5+ducFH9eH8+fT9xwI
	raIEZvqeL23BxwqZdvsU+YZ9507k7AOHCveL5bNYJBtgaxLe4qMNcLgyF3vE6CVKuD7GZPjuwIa
	3CaRbi2AZ8V241WcXMTU9CytGWIDQulX79UbW73LMulgWVbIsGEApokmvXTVsk/rb3/pX35q/C5
	qhYezGAtWOJUZXaSvMpogo8ZsX3B8osCcsRSqamCHEpkC3fgVDdMBKpQ+8etYwwt2qfuHTmBk0D
	+vKkrI6zxkONQ+VtEz42Wk=
X-Received: by 2002:a05:6a20:d52f:b0:3c3:859b:9178 with SMTP id adf61e73a8af0-3cc71d82711mr24321365637.34.1786897133174;
        Sun, 16 Aug 2026 09:18:53 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9679sm28969988eec.3.2026.08.16.09.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 09:18:52 -0700 (PDT)
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
Subject: [PATCH v2 5/5] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Sun, 16 Aug 2026 16:18:08 +0000
Message-ID: <20260816161808.12419-6-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816161808.12419-1-sreeshankar0910@gmail.com>
References: <20260816161808.12419-1-sreeshankar0910@gmail.com>
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

