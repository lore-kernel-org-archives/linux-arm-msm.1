Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA1F3E2AD1
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041654; cv=none; b=MY3RKJ+u/8oZS1KwckcGq4eGWg5cgrXPbggwqlkFSRUpfgkx11jr3Ni15tZLfg890XR4zWTb3JrksSlrem5EsSypTD4vEUH5Bq1/z02sZ8SCxRUn7kdwaN2eVUPKQFkbSHKHZkOdWV/Tir2ufZr+WEWwRqBs4x47CO103Bg5Oj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041654; c=relaxed/simple;
	bh=6sYp6gwLdM8q2X0kWDCuDxQHrC8+z3UsdjNuoTgAQ4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wh4MTJOvxlbXQAE/BT6Lxz0cVwj0pINf9+YTZtwBYxJQiNgGZnZZEC6R8CfhdvC/W51fX36p+xJotxglipLhGV2Eohk2UsTHIZT9l82TOgsWXZaOYBzrxqKqfzAGivBAs6+45/O53tTHSSXys1a/MnbZKbZ9wyXp34iPbDcKHic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTDZn2Mk; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTDZn2Mk"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-353804b591eso8598793eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 22:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792041651; x=1792646451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=gTDZn2Mk/PS1sTuvi90n4mjXrrr2ikyhlmgrnzrZwnoZYcCVtBc7Q8gy+YzYHp7czJ
         gEEjmVsTjcC/Hccd7L0sIBTkahQcrRlb/Y2SvNN2/ka4U2GmKbpCbBGnyNHO28rRObwW
         E6/npQwf2X9LyWggYeQYSbcYND1k3JGwovcam5rOHvnctN/mpEemfuxu3T5ChrEXeUpm
         G8ZO8UVW6QCbGeSmr+i7E2tgl1iKK6xlrhvovZWeMVZ4FCV8ZmIDhZqqvgIoTOBuwvVO
         KmDtf+1CUdxS6cwN+Z05FMaDyb5TG2wBKTqXcV8Kh2HFYFyhTQMn+hA+MGLdVxR7NiXb
         mXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041651; x=1792646451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=DlSUDqFKoNUORnheM99sa+6zz7xoC5b9eAnUva6Yi8Q5kcbURZAV5fif+LGGW9Q/Ao
         WsczdQWpdiWVBSajfu6vnw+74lcTl72hxVVasFgjBuFDOSJ69IlSaKIJbSxLdkJm2xMR
         7gWjjYLHaolQl2m/pqfZGGCgGaVqKF2rMpGm1xBT6DB0bE3WGTq2DXkRPWts2qlpgh3Z
         db6J0l3qOIIk5s2VbweZV99/FnJlVA6crOCkqHD8MwjoNOQICMCXvQnRfEAQ8coQ1/O5
         DRqGLe7CyKrXqSZb0ztIT77j+KAA4wY4z8y2bMM9rkf+5pqStVVVzhEUNxzhbMr+sIaW
         Q10A==
X-Forwarded-Encrypted: i=1; AKwUvBwu/E+1kCBuhRs7463tZcnkR9Qmz/x1DZKh/hM9uIf1CW5OfpzHz+aKgjPxARWVk63hofeb+llWuFn4nVCU@vger.kernel.org
X-Gm-Message-State: AFq9FYIXanOmL0o7qFjqU1pYaYU4Exz+0PsMJKn2zPmv16Rq3hQITE6v
	Ll8X2h0XYK1vzHbz0pWL9BASXBgas1z/uFn1tIL6VrZ4J1CtX7aQ9CKh
X-Gm-Gg: AYBFou1eZcA5S8XKGwFXCcTK3L6obMA0qv4fENSyJaF9l2dGLBdWyETTnO+NbVGJXuo
	wIsfYLvOWUY8oINtIjwVVq+lnsSVV5LqK5Lvwt660axXq+pkP9U6bc7VypqnJihoQ/UJouEuqrS
	qo3cnz930m+b57p1PgecqF2MhanUKrf5GjPdaOcO7jM3VsKy0/GLajhFrgcUgrEA3ISj7UYGvxG
	zFMX+sKC1NuxLvT26D0aHTtNBCx5F758dDQNMdBMiblcKVquj0C5Vy6HoKC2NY0By1mt5q7HTNk
	ZjzmQFTAzAzwpVMHPkN7ILNeJasgAvuB+mQ0KA3pGh5Wl827Tb+n4vVbYgE4KWUbpRw0wGKq8OL
	qY5k5tLEK79Y1IlTSX6zJg/WbA3EzVP+yDtKjRgIiJYGFhfUqkU53Fr35HFj/+uXZBGxAhHIfRd
	YshiuBUSSSYDcKC2AIJcTyDls4EjSKFb7pRy+wfyEi6Yp817RMcjMKoNSvOBguiP9lk6g/Yncka
	6H4sAGF7XR7qGKdXiUd2XN1eY2rssaBx3nT7Rno4ujObIa+rCEFhU8=
X-Received: by 2002:a05:7301:6e98:b0:33c:e74:4624 with SMTP id 5a478bee46e88-3537e112919mr25527157eec.27.1792041651470;
        Wed, 14 Oct 2026 22:20:51 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm12923112eec.25.2026.10.14.22.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:20:50 -0700 (PDT)
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
Subject: [PATCH v10 4/6] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Thu, 15 Oct 2026 05:19:24 +0000
Message-ID: <20261015051926.13752-5-sreeshankar0910@gmail.com>
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

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

