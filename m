Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96955419313
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 08:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299989; cv=none; b=enNUP3zB14q5zQcZfWltwn+Oad5+IAVyPmK5X0W5aBdZHGZFDm+E4yToP1jXD40OTGOBpdZmYAdDPSR9M/VvdW2Igqo2WEZgGluIqh3diuy+p4zXitYCOobGD7HN1XdnZ36tu6VWv0PS4XvEWKzGkkBodOK7HUPN/MRDGEe5SLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299989; c=relaxed/simple;
	bh=jKh+XPUoJmr7fIpNbx8/2EaPd/67MsZW4ebNDZ/8MPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nR1vWjlAliA/G63Fna5kthJIcywEKbwJOt2X20DNpcSe+hU8UI6LIhnOyFlOdDlJjgWWSFvjUGD/gsE8J8a+sVBb0bbBuS0/NW3bekUIn3Or4mbAHBfrjRDirunn4aLEFWhclGMKwv1T+lfNeBeYUaGb4pwx3VON5zGYcR/gSik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cqh1raHy; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cqh1raHy"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbedf433a99so747083a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 01:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299988; x=1787904788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=Cqh1raHyb7craUkrjznD0U1qhmV6uN8A0WmbrgecTGldLn7BUeSB1R5WjrQgNKjoGE
         0sI8tbgGxNZJ3YdyriS8frQ7bB86xgOdg9jfbOHkHshVrb4IPKY7FjfPsrF2g7b4vDL+
         4u6nIBhFe68/0qccHY48Ilc9MfnQYnIUvPDKM0w5sJTnzjxtacMk6XPWNR7J0KGXwi02
         Q1T8ZP87jnn7ljKVwdSti5Sn81NCXZGdz7oDuvH6SijiWj7VJRezJ4xpWD+Y2eh2Sb76
         V0fhUQhsj10odn2u0YHVNcodl8Zaezu/ax9AJlUewonKDQBmwsRca9nR16YFilzXa9I0
         qncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299988; x=1787904788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=moTALzQhKQJJoSX13VmkG+PGsIhUMoB5DlPeRTfSa2hBV1BIfO/hWsYe1e2XrwNAYD
         rzO4VXH1qqKAvPVgohb5nf+OR4qIiVFfNnSKXXY4vQTiFnjiL6MtZCUomnSsW4DcHNSA
         QL+CO7asCE4Q071nN4jQMeprDJJAoQfo1xoYTOttqxBEUkgCuUYKGqE438ys5AdkMmUb
         2ILpLs1LYVJ/vlDmtfPI0sbGLbTkS12kysbW3+dTA3aeUPY40FzMmG72EHw6fY7eOMmg
         3USaIhUeaihoDhyScBFyirj7x28BEzTpVHgavJNIr851Ds4JdH4pQJ4yz8d29ig21k0V
         yg6A==
X-Forwarded-Encrypted: i=1; AHgh+RqOao8QWuBc/2CcxfeeiiIiTazZp9r1D+mWvJRPEakmnB+817a147vuGCC/d53Xpz+KK5H5FGnM87aquTeT@vger.kernel.org
X-Gm-Message-State: AFuF++noETqmF/ADWnkk7WQe2QUyDlNnn3duNPspfSePNaofntKzj5JE
	ojfuC+Thv9zuOBxLuJjkGUOt3MwvF1/52FXtg26j4mMe+F8NLj4Nbxxj
X-Gm-Gg: AR+sD11DohHlq7IN/OZNls4PHQUMe+kMluvgrPjvziXw1CcVXdSXQGaSo4mToLEgR0h
	aCAE/ig8xpPd/raNHdYgnY7FkMh/n6q90A03BNH8dvKdKnhpiK6ezn/I0pt/pszzOcztGXWdsSy
	Voad/7m99PlK+KoKDzoK1rzhUlMfwGO5WtzOEjXirTlVipxf3IpdLIdswah+xjGUJq3ySlHeYl7
	1M92tRInlGrQHOCbSdg0zpnCVskcPXrZPCB6zGTdhBonfceQ1JkGCf1uUyrw/g/pWM4mxIi6T1p
	2OcWZSmcq3oeFC1c2D9J9yEmYlrVGE2tsOCnJBedShewjbjIJSI40N6Rwjc65OnCUOonQCy1mt8
	SmY2T6/wdiFo1YmcLor7AeygS6ifpGnJ2fawlr455m1lOQbKKO6X3wkqV1EJpC8BaNW4OMaFah0
	lgnzbWGCtQG+BJjQw6JS+3lKEqLMhK2YdFXrb+/XHnRLvJDuWSZuPKZEgRVgnqSQwJ06pP7AP75
	qsTnZFtmefi
X-Received: by 2002:a17:90b:50c3:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-395c39e6433mr9171716a91.11.1787299987899;
        Fri, 21 Aug 2026 01:13:07 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:13:07 -0700 (PDT)
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
	quic_tdas@quicinc.com,
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
Subject: [PATCH v3 07/13] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Fri, 21 Aug 2026 08:11:19 +0000
Message-ID: <20260821081125.4522-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
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
index 0a45e1f55..e08441915 100644
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

