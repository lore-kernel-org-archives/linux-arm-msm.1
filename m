Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E913D7A18
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246506; cv=none; b=sQRBkW+2kN9J5qTJ0YX35rvHfaywjsIB1EouzSb5quRKh7vYfXvQ8hXWSWVLYvKrx/HVpEoWbHc8R5062WC6S+OpsAdguq5EBbQ3UaHaTpv/mVrDXnc1PaBEjyho89/NEZ9KGdQu2JdlyNREiVO0iFfESpt9hx0n4cBtt0rlIoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246506; c=relaxed/simple;
	bh=ifqmFvQHebUZje8XaAAuBMN9RaGf9xFULb+csDNh1fU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLXBhz0t7NmVGN9G1ucVAuMPevf28bwcG7K3Cs4rIUwGOUyed5MJli957sgzGpqrcrr2SEN6/IFDM4iAAbo9je84vbd3UDfrVzbH7S2Cj2iKTZpuzEU/Y+rseYkzP+xkiLb5XtihkZtzHy+YLsnAYob/i98PSmWaaePsDrQk4Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0ViJIEW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0ViJIEW"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d956fe30a0so3926525ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 00:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246503; x=1788851303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HJ3g3vUMid02qe6Hj9lnKY1TCRNcUH2lx/tar8eb9o=;
        b=U0ViJIEWb7M2VDGUGVNM2fvVDwg3cRWWP99I8Ms/4cI0FcZncO451oAiVevtR7hKLX
         5BbNOk/iNYBPmbm/lsAC/sl+uGE2YHkhV/fzsWTnYEpc/pa4UXKdPNRfdAI+nUjTvq6X
         /WTre/0uC5zyhDCyqJ4wuRYofsZwAw1dNf9bPNynTrg6a1c1d7sr92XkxrcOuwjFizzG
         ricfPMp9tPaDFEZT5anvYfNDQxrU9uhXr1xdjLqVVJhLhhgnfh1shs8dnozi22svS92a
         bGuQyE7UDrWf2zEal4X8sZxhr2kLrU+wr8ug5Vaf9aEyfW/si6LhLhM7pAceg/vtWfzK
         V6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246503; x=1788851303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HJ3g3vUMid02qe6Hj9lnKY1TCRNcUH2lx/tar8eb9o=;
        b=CH7RJh/bAqfQSLJTrwrFWAXjDI0y3uc7ex8MQbP7e+emKP2XrobeNxqNGFjrLGy3rt
         e7FAP9kJ9eC4krRwmttqjqxI9fCDjGWEHw9DXw8KL35ckdS4k7nJ68lM5/XIueS5TXU3
         FW3e2IJr/VBYqOIU2/w0Eu3/3Dvt8h5naYcZQcOGTLED93mOA3nh5kP+7JtiGrF2EE7g
         2Li9jyYKENLoJvOCKaFUtZcMzprzFK7T5sBc7KVaqLfCM19bN0HQoji0jkLcudg6WJ+f
         KCyinU7+1Afoa+crQZZJg5YfTzuiz0gKjvy9vuSSyo+zAxH/EourkqqRj0NsfI6tswJ7
         3GRg==
X-Forwarded-Encrypted: i=1; AHgh+Rph3FQ3SdE8WJ3qGkMzDb57HuxwASIwhAbqz8I6iV7/DsohOwJRvXG20ke6qGQ1CTl/ecVQPVR2p1rOag88@vger.kernel.org
X-Gm-Message-State: AFuF++ltuKsbmrNndgVDtrSaaX2GdhawY227/tVTfCo+nfsjJ0ZXCJGV
	eGQ3n9+O+Hp94MkufFuSrw68rIeWdkma4S8HRINDRnqVXf/wM3SMFabu
X-Gm-Gg: AR+sD11mVBaJe7sDZoLJyVVhseP3+GCr8qiuFJKfQtn6T/0A8YxUUWZzIF87fnlMT03
	xJz1z5e0QlPXIHk0FWiu2+6VSkSwGI7iD4tR1nj7/5/85F5t7GNQvTu2VZoHFi0xSPpqjXBF3bw
	8K2yRAayhcHaV3wt1UviQHDRIFMJxZ7xYr4DmrLjlj9+dcTzyNhWD3rMTuwC5kHuF7xyajwkbfF
	PMGiThnC3f5nS/9i3MXaaY/k/k98ML+Eo/JzC2V3GF+cza4moo/8UkoaL33+fneevn9Gv3K1bop
	j2LqRrYfYL2kQ2pUIXHcEe0IIoIFQMKUT2JHzzsKPE2IuG9Hn1qidmzTpZsEYRJmg9pHHRfTixx
	S2vw91PzSLEU/fpaBpS98cNp+4TIF4nJCZP+1Kn/ulStGCo3zljXZRWX2cirEc2NINqS2shwr0p
	rmDB9uJ9Os8r9Fedmp8oMqCMJUaqpFDBEAJKS0xcPewRu/C1hOBYUBj6R4uiJQVbaciw2GqFtfb
	iCgE649yVQ5
X-Received: by 2002:a17:903:40c6:b0:2d6:3c22:99bf with SMTP id d9443c01a7336-2d94a76c15cmr81011965ad.9.1788246502985;
        Tue, 01 Sep 2026 00:08:22 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:08:22 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 05/12] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
Date: Tue,  1 Sep 2026 07:07:10 +0000
Message-ID: <20260901070717.20513-6-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RPMHCC compatible for clock rpmh driver on Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5..45d3cc861 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,sdx75-rpmh-clk
           - qcom,sm4450-rpmh-clk
           - qcom,sm6350-rpmh-clk
+          - qcom,sm7250-rpmh-clk
           - qcom,sm8150-rpmh-clk
           - qcom,sm8250-rpmh-clk
           - qcom,sm8350-rpmh-clk
-- 
2.43.0

