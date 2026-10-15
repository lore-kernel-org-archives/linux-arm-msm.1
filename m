Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC2F3E16A5
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041664; cv=none; b=WSjBa0OBvi+DAlAv4AyZ1t9j13liiq2ENRaVQHD04xWqm++FJKPDACxGP89/4i61olkykzFrqQ037nA/qzSfxZaFo0rmAXCc9nqvDTKwLHwWPHI7mS39zCRgKKjUQ0JXMfubPabcuESyahBJ6YawKpNhsEyxQkOPP+6GlV8ST4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041664; c=relaxed/simple;
	bh=0S9ZiRaNeD0ONuhBWck3LZ15qfVQqVd9GHb68v++sEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NBRrqJSmKjdwtbRH2WD2wDxJyP8fhEzfFuCV863ZQp7V9JxskVUJ6w81fGSeoAksPrHaHNx5iEqhvNX7IrkaoZEkIzfDeTd5XeofMd/dEnbURXv0J9xAXKJjHeWt+icsiWmqCDFljC15NHjoVnz959fGkJKd3m6ayU1uXd5CE68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOKD6Gr6; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOKD6Gr6"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35f036b17easo1585399eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 22:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792041661; x=1792646461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=rOKD6Gr6B9cKASFZKkpoO0knCcBMFoWivRGhQI7EMtT8PxvUVMicfWU8FeuERHfksr
         kV5mJ+lTv/QK8zY0G5af5Hqkk3iF4zLNQPhMszW2fzmyMohgZJUfWMPLOHlBNqBOsfV1
         4GdMjJgi4m+21sN5VZhtDSjzn2e27MQQpLaAo/eKvmWOdiVKplmiWGdrbQl4NpLAYmWO
         NAdqyUx7gk+l566C1UHDVXld6+IcdrBSYBTnBuHRqoF5Gp+2/k6mC5SDmAwEevvF0ZFm
         JEsBFUwYTm4CKD845YV8BSpMYj+9wQpxlY70v7Mi2/1hJxR6oEkeqwY5076k9N+Zjuao
         YTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041661; x=1792646461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=zJAXG/kFaSmdM01MomGY+GOkRFS1hnFjMPxrhT8WiirBLgIHKRB2EssHLSibFiusW5
         F16t2YTVYZz23PRbT4AfrCQIx1INJvhk+7JLSdBDQXGJBUN484dlJ6Y050jfx7hLqc2k
         xQhYpB3CcbLb4y8+rF7NcPzwLorrrFW1TgxKSecOnugfReJvr/O+y2rz+h+82IgbM2yR
         wVnGfnDtLjTMAC4xum+FEKZKv1vJojyIX5So199JwJ2iqAEPR7hwe7WfwAQrLNaUoSR1
         KyJzwlHuZWnZmPAj7Elcyi746oSlDZkgGbhUc5ndB2s9KAPRmbxYpzGpL0j8ICe4wX1z
         kYxQ==
X-Forwarded-Encrypted: i=1; AKwUvBz67Lz9E78mJm2tzlDw1kUL3Z0UJo059i40gzaWlS7OY+NhIoAhbovk3bABwV5AOLwmoqr8opTpYdltdDMH@vger.kernel.org
X-Gm-Message-State: AFq9FYJqM3q1XRYN+LrQrAzK+sK/+QIJbbrs4pZQzWjsc0r1IaCO2s3l
	eG8LdufI1wlykjYbtr+XJDjmPwauQkKkZiNXJ32lfEcDYaSeu5YdFhxx
X-Gm-Gg: AYBFou0FqmY6z7ODNxJLvmuWr9TkdjO3QTzyS7oLMwItGqg+WbtGj70HOm/uvSXqZh3
	Q1aMzNMATuyhEQNrOWEUKTNRdNHjbnzAelfp/UvnyBUgnhNSe2v1ArXpnIxiKjTD51FzPTLQIoO
	tkXITsR7NXyi/btN9CmUfKIxdGxaxLn93C42QbmmDMUn+X5s7k41xz831b9BVbpA1GmxscFNHnS
	o0buKExW8sf/F5cU7QJKbd7Tdl664LQQvR8iqgSAFnVypDPBs1rkoaf3NHcgB6C9eL92qgC5YYo
	suHlzSWcMShbcM6IHVUQ79b0tPhenyy4fBp88f4lOjLSa84XJ+qqRnGxwOPZY8PvzKbHuK5w3JB
	fnQjMUrnzLjK8v/jWtO97KtDfTb1S5VJmVf2nGbZx7RWLm1iYS31g5qmWwGGE/vgyuHp6K8Xf4x
	w62Dzf4VBQflknb1M0H6Y8147VwQy+e1+jocDnp7TOW46zyzwv0wwkGuPtJ/KOm6YVtkSdu9NU5
	rdMXFKDmd1CuxijQXjZPPVZlVhhNBFQg0tN2R2pdfbQc8eN/8U+OiQ=
X-Received: by 2002:a05:7300:e5c2:b0:355:cd68:6f03 with SMTP id 5a478bee46e88-355cd687760mr24635134eec.33.1792041660810;
        Wed, 14 Oct 2026 22:21:00 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm12923112eec.25.2026.10.14.22.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:21:00 -0700 (PDT)
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
	tglx@kernel.org
Cc: radu@rendec.net,
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
Subject: [PATCH v10 5/6] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Thu, 15 Oct 2026 05:19:25 +0000
Message-ID: <20261015051926.13752-6-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015051926.13752-1-sreeshankar0910@gmail.com>
References: <20261015051926.13752-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

