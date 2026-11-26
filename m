Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669165;
	b=3uySUpbF6q1B1abw+Osk4bDj+mB/d+i6E/IcShHMA3QLK0EJLuVpAIDaptRJzsdhsHTX
	 884dO/A+NE4gHmGk+MQXVA8NmexsMFsP/Opq11jeAywEU67bM2UT23hDWS/ZYMlFemjDB
	 MeoIQSvtBSDu1t9ecTkvtinwHmMzK+VVOuKGjbPsaw2wuQWw+7g1w2x1bo4TSdksAxcEl
	 5fmQTtS9oPr5hNWnPCaHFaz5kd9JSsG3/c7TQB2nGUsGsys1q8CyV2LCVEogZF6+6fciG
	 761OBjjwO6iQlCK7VozLOT4EAh9zgyfQKhEdywdd+IizTopc9OyadNKvU5Bk6sawfJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
	b=tzs1iWXb56Z2KwW2zduHc8F9KpXzyCtO5pR65REvfPqD72Xc1Ddb+rQMkhqOe6z1l8zq
	 Ka1MYU7c/MOwIZTpehrtgUxEKj7WVIG/uB0dBWVi/LK4hXz9WCq9boppKmS5uz+GQ24dr
	 KCqvHDwUU+vpeTg/uInOJB9YWFBH6e2Sm20g8OXfs8Sxt0/n0UBednoULYAMA2xWJGQ92
	 UaskYfGAhGylwRkKUUL7/THbDJCcWDVvPwIbdtb/vFGmZEE56yOdk4kdeOFnGbmF9H9YN
	 hQbyKqWnQcUlXoqoc+dr1dx6aId2u6r+DGz4d/N6efEWcPfYs2/v8Ny0ZhJaS09U4jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0EUPNu5;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBDD606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 04:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFBDD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0EUPNu5
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386ab9ab619so8535876eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 20:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669164; x=1796273964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=g0EUPNu5vCG1KDaEwv7YBLGPLoMP8KZ7WoVFgrp5ESMpyu+wnidD/QLjIVYThZWUke
         Ub1fy5iT1lyS1Qhheq8ppbHt23EmO4mUDGw1PnB/2unVy2R2bty/WC0iuhmSLyp0Vtol
         2YEieXVlMiqDv7YQ9yxEeaT7nJeW6ag0YunW+V496cdBOJMzP0NzKs+3mbwbv+GGBKav
         JUNncL7d7oCSkyDB8BzA7VhpkDJ4+jsHDI1xIbf9en0rpLFzRBJ6a8R+6il36uFagNYs
         I/bhcBDhOPC6Rr9qb5NJeYOwMjbU9ZOQlVVJIJyVDQK6v2RMFlEEdD6L7CfvPq/ECj4W
         5tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669164; x=1796273964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=OLD+FqpiIKgfvgp7OHgB64tS1j8aAMFWLkY7k57oC548D9uGu0dtR/PS7HX6P69Vbi
         4BOUUPCdvNZ/USfwovpOiFRhAjPNF2OaeTTBTbzbQ4CF5kqCBSS9S3foBowEBFRcgn4f
         XZHEkhglUB2fC6xs2SxA9RcZHHkDhOfeOOQ/a9p0cMv6Kekgp4EbbGDJdZudeqp7mdHj
         KDB79W3gMJjZVW0nkJ2WKEReydzB07sw76AYKQRIn2yM7RtviSRG47m0aEK/OEuTPPY7
         qHvLmM/MIIWxGSoa5pa4xaicUpBSsSvsFnhxjupLDs2jnfrVrCUZ7aD1Nh8CsqTEN0z/
         h4gw==
X-Gm-Message-State: APuU4Z8kPxq0b6Vi+J4wuUcE+F4pgaT0aEl9KbDQgjx/O9YDrCkuxbFc
	OVnrd0kcAZAhxptNZE2+g0lUVm7ApW2vWzbw2JnebqbouKi4WiVkQ2Iq
X-Gm-Gg: AZFdTZdFvD1iSi7UPic5hYgGoPzKw4nX3Gl0CQnKtkr6MIaPxK4xNU2+D3kqKAjRO3u
	veHf1r6F4IbO/qftn82doi3QSTObVufP3mwhuPru2w1cbyY0VOC8XjgRSjHwf3OTS00b/YevdAq
	rZPBsulc710bIyoV3D3Sc7uXioa8hKM9hXrp3Dr2tF7ALr401RTYatLz24+b6qHR9M+CbhIjK6+
	8pgRTc00rPwgeIWyKp1D7z3653ihVgsmk79+PdKGxfmpgVSrVkE8UM/BRUI91nGgAEkj31dSZWI
	8UFXAAMFslylkUTbZhwP5x/xvsQwWrp0+6iM4vDIKZ3Nam9BcBWHMLeKJImKchmG04niodrk0WF
	MhuNkhMOq1Q0p5nAfvXsxFnhE9Pxom7UBz1BYahsiKFpqsX7RVtUA5WF+KF9nxf9TC82g3g7v/M
	4MTqa4x08lZhl680PO6nNFrRuHRmIpMcSibKqd/7gmrAeKjB8Zw66ZrlXoEq+IPyhLwowKodytA
	sanTVE4WsL3k7tZAzDS5xwey5LHDyKWP0MEDZIuX07EYsiOri6fE/CyFUXjfL6lRiyNdi28tFnu
	vpP1o++/MU6IuSQH9coxujbcjKbgwRa2E0MHdBYxnNqrGWAd8dUEz1h980WhNupLpUVHZ9SY++P
	1CXngbQ5Lb47lfDJ4Q033kQmemuD5
X-Received: by 2002:a05:7300:1486:b0:383:6eb6:5730 with SMTP id 5a478bee46e88-38570e24c0fmr24177940eec.32.1795669164035;
        Wed, 25 Nov 2026 20:59:24 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:59:23 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 26 Nov 2026 04:58:11 +0000
Subject: [PATCH RESEND v15 6/8] dt-bindings: firmware: qcom,scm: Document
 SM7250 SCM
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
Message-Id: <20261126-sm7250-v15-6-492014ec0a52@gmail.com>
References: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
In-Reply-To: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=rejlxjgmjiSGoOQieemcJFRPRnZEl4/NvRv6It0RMUo=;
 b=r2mgp8vyKY7YS6WEV6WlbjzksgxAH2OHXCWlysqnGLfAg4qb8dWAEbzAtXsFTcCD/KseGgpZX
 PcFCJVXO5ABAnOZzv5+RU8kim3m9XyqAWQLCECJmV50I6nzgtR+FIy6
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54..ee02a9c20 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -76,6 +76,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350

-- 
2.43.0

