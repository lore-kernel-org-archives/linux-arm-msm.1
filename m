Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85284420E7C
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576808; cv=none; b=PAwJ0aTeAXi91J6mcNgwyEo7Xgnztdsp2GWAbklB38V5XgOBLKxxdCeERKz6ap3QXUM04YQzCr68e0SDnQJQ+Vm16278ZHpHwF+89sV897I1qDaMFM708PGuD2kM3Qhr9PX0aP92DPJj43lId2DR2J2rXja1nB219LVESh/sXNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576808; c=relaxed/simple;
	bh=iyIt2VTzEWJFddhlukajc/L6+s0oCbiYJdxmCZQgWaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lh/7ek9OXr9u9Kc2idPtYdXyerDcQF43yg+p6+7mAh24hH+zgzYGg3qsdcgYfavWV3Hpj9qj/8ISBomy8hisXeRe0rnOM59bf9qe0QHAgNTZrd1S+NsdADrAF2I3IIqs+WebCuohmdTSe+kDD+/2lb3AEVe3oXaBkopBNyz+MVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQ+ZNjxr; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQ+ZNjxr"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-395cf2535acso2965699a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576806; x=1788181606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CRwL2GsSIS/j4FawlFSo6ds2Awqey70m0LWn3uJFJ0Y=;
        b=qQ+ZNjxrt9TCZP7krXpKT3XtkPWwGXThNVY8pamUDRY7RpthSuS7emqbqg+Z0vz1hO
         T/Q0U2+N8XUXCkZ3wgIv5fWgEZGEbcA3AFbXDW7nMvOYu4qfO7GGJhMW/5DgtWbxvjdS
         iMft9LPMbLYnCRwts1cQizR7LXrfe4njfyq11lN67Fp/oCfeB7xj2lamC18bD1e9nphg
         QLiefDzftZahxK+tjIsf5gxT6aEeDJDNah1FuN+pJ0/1sOgRhviQ0GUh//RCSmpPlAkP
         JSYaOYnza35VWNhIiPS6eHgsdZOUJoxx3nU4VjGrdEEUV9NIc5Lo3zMhRNtohxCkXMsF
         7Svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576806; x=1788181606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CRwL2GsSIS/j4FawlFSo6ds2Awqey70m0LWn3uJFJ0Y=;
        b=JunXc2XfpUs+lV4QYSmxLsuLwPNtnsyBQ6RwiYQEGczrMUp7huoyGizfNfJxSE1ju1
         eyxZEVpxEtg7vLOfJGR2fd940lsJj+485XzRFeF9OxoHUSUUw0Zp2GYllqZ/9xbatOws
         Jc9ii4qQdhkRfagZLkhN/7EC8ujq9PWUSRPXn5Z1P0HrprX3KG9YnkprgRRv4d4gSpnX
         dUZl0NUPDiTQI+71gVzecFF51xuWlWXZC4bWzXc/SEI/Q1nSAIrWSLZp8qtRBtbEjM6H
         0188c7/MBbwyWmZZ6NQR+LzdIn/SGbMyjzQaPKUybu7fmPFRu6OCBShJXjlTFOvXoYwj
         jpjw==
X-Forwarded-Encrypted: i=1; AHgh+RolNLQWf67+Qv7vAPqkFa2m8ZJ7uYp8NRdPniufO3Aa9RRzVrlT6MjYTUr9KUlKX31jZlteoFMM6tkVGwka@vger.kernel.org
X-Gm-Message-State: AFuF++nFB80skmozXIOvimulCqng82Jqg0dr4X/EQ+KkUail3bpijA7X
	X+u6322dssi1R70BB4FplD8DEALKSu3I1KoNyQVXkUz3FbGXTS5CljnC
X-Gm-Gg: AR+sD11jV7m3FDOXCfPlVmPRNozeZLyojNMn8QcW5cKLUvnvLJHD86MkM8gL/TuckQT
	FXWIZjcd+RuN9TnRvZdwvNYxvb7u1F1K09HuyCQt7cnf17XAC9iQOllYJ+Kwqetsz3i/hYPdpC5
	m8yU91iY+f7sv3BGfs9YlApcG0oOBVfKuCbAUwuqcklgh9BH53EkIxk0/eI8yYC6vIYkeMdDkkE
	9b/va/17XzajcdxaIlGq+hegJkjy64YAEubgDj9/PImb1NLpajYAoUWggDagOQGaSQgrnWghFC8
	ywNv+5tOlEtJcQxlkn8SSr0WdJr4ItI4FHGJ6m3hm3qUAY/oo75DmZi9p/ut0jTtwN0jhhrpzE0
	NfGWwEwbzfy9Ni11wpkARyCvbhssDBad7ycTqbxlvVtPZ0EXKkMA1yJmYdlJHepIsvBehR4FhBX
	R4+/QPY0E07IjNhX2hkOGrHZ+oYqzSGGYlSvLiRd37suG7Eb85gWKWkDGLD5mYpQAfl8gkqrC0u
	mma8HktgdyS
X-Received: by 2002:a17:90b:3bcc:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-395a06bc47amr39222445a91.16.1787576805712;
        Mon, 24 Aug 2026 06:06:45 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:06:45 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 10/13] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Mon, 24 Aug 2026 13:04:34 +0000
Message-ID: <20260824130437.2771-11-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824130437.2771-1-sreeshankar0910@gmail.com>
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f..0cbdb3b2f 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

