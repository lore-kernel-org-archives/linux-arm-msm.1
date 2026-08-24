Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C26336B908
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 15:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583863; cv=none; b=sWn1utRNQBaRqgqWyV+RzhkQIctUklkDe+cjJPKI4yLt5erVm+9wuO275BR+7beTKLiJjqPwBFX9/DB/OezGluDRphpJM5iDE8bMGdkKDWW3rtu3vQ3BJySyN3YypgvSK0OcyfLIkgQfG7pmwiWX76RwoTdUpovyrb/aYBOBoqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583863; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYIdb/YlMGsst4YMhEnN7Q3wacBrzcnyFgjk7pX0h4QwSLPIveVzENcJ+KKGd61dfzZne+VHA4Jcciabn7jTC4O/ZsWaREyFdKB6w+IV3B/8UdKFM93KnW8pERvweAwEqTUAa7U0/7C1XxJ39/p1RvmXd5ycNnzt7ySi1KQdbGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YaTw5697; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YaTw5697"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-45e6d266921so2300044fac.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583861; x=1788188661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=YaTw5697FD1kqvVQXPTNS/kRliBDyW/xsDtkgLaaTJFhU8ZElkqLujkpGFmMvu7XQP
         9ehfpXgmX1gvXGVkfSZRqjI4ePY6LARgs7jWW9Xd6qp33Msji51+ms+DiMkxMh7h3h0R
         2HM1QQDWPdgUWQ8bdFjysXrTILBdItQ+nY8NBD4u90TtpOFLtk3b9gcNwEVu7WVemtpT
         aXo7JGtzzsYr+TLUsbjQrnxtVlUgyhVpflil8DlSUpq5VVZV70nMiSZ76X/7IyYk+yHq
         89Aghdfu67rssaVIH0E4wtSYqE5c6DzqUHXAhjWula2gakdJk1M5jsCtWvWf90F5n2gO
         Vxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583861; x=1788188661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=hxPftEx86gnqdQ1PyH5LK/SQOn87xeKjhffNl7IMzpkGanuJL3uLjKcE3m0V0aIHb8
         yPl9j4I+LzFCA7ghOPOL+OUsu/tACgJYTUkPaYuyu3sj8aiXWYArEqNXgf36+FY+OnH3
         51i/2UrzumzLfyZWNyVIEKVO2jbaDsUvzFwmr91PAGn5pmob7cpLYngdC3XGUtfo0YHc
         l3xORcLnXIwZQZNueAG6dWe//+gUeDQ0w+cUr2EIwfQLdl6GNMzpxHPUGOPY+86lC/h1
         s+FkDY470x7eKJY9EchqBMiVCk/iJX/xnLbH+a9YfyklLNevJYcPDzLAPl0lqXXhgUIV
         H9Ew==
X-Forwarded-Encrypted: i=1; AHgh+RqNL4YbhC0B8LBo7OfEx4dXUncdZ2QdotaDHbzZDoS6pHrs29v7a4im5GlfEfgNDwYeaIeafkXcTqn8pX57@vger.kernel.org
X-Gm-Message-State: AFuF++mzJE00NRlrfPe5dmeoKuHEFWpz17Jv0Mvcn4fl1JxLviBfXTYI
	QY/BiYAT0W5K8vwaGUXItVDy/POoBoylX8cyM21tgQ8cRQrotha2b35r
X-Gm-Gg: AR+sD10v7QYgGhmcn1HoVmgtDqwJzHA7q5djxa1R9R6Qy+gzX5r6i38lEQwNj1vBfor
	wMmiQsnPJ1H1or4hNPipZG69BZ/3NEUD+m5hglTtga+LJHMRTKbmpfQp9N0DSzbUyLpCrM/A5Ev
	Kz9KvVs9Zp8xAbHCoHPjn+Zg9O1t7iURuuML05rEinNOpNEAbUBu+jrlEL4P+T5FdG446WiIqs6
	2yw2036DTeS+uPhIuC/4yYAipFyRUNPEWbhN3Aqx54yxwocWH6Jp1y8D1PfrgFPa+Y9HywcDWF1
	FNjh54NoA+YbW3UQY2i6y1Po/gpVeziODu6SQXwKTkQAYOtAoC9njNXCH2mBxc5li+clOczf/Co
	spL9qc9VgargiABCJ2VnGfhaW1y/Y0VX7uC52z0xTQieZaLdJXSNwfuhOFdw8uRenEkhekP2WFQ
	DMeoBsP+8cP7kknjFVWuBqHNjKaMsSUKAdk9PFIvj0hA==
X-Received: by 2002:a05:6820:2089:b0:6ae:4ff6:8d99 with SMTP id 006d021491bc7-6b15941e0femr25985466eaf.26.1787583860088;
        Mon, 24 Aug 2026 08:04:20 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:04:19 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v6 11/13] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Mon, 24 Aug 2026 15:01:54 +0000
Message-ID: <20260824150156.1310-12-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824150156.1310-1-sreeshankar0910@gmail.com>
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
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

