Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38A23E2AD1
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041644; cv=none; b=dFNk6iovYdXMd/28nw09nSbNZtDQyrRgrMSo8pualO6vk2w4ZGSgeGMw/VSlUhdTchzU65EkEhxRteaixT0rC0Hc4Xd3qGwY8vtJ3RcjYFKDmS0qLzWbd9R6BgK7oSk1qdHdGajCQx/wFDGfSO+Zl6lPP/iECAUJ7ID1X8h15X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041644; c=relaxed/simple;
	bh=gKbqr+JbhugVzrK4haKucfxH1GbAmaJ/63Ra+8PimmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ssxRsdSPOh1r8A/4v5+fABdxTXgR+fmug6IT4wil6YUW0fjhfpTu3ILSAPFs5OQDxhxVXxjmJBUi8mMFRR1rtCHau/WTqtTjY5wntk11OjXQRhLfYq8apSQNgJZvTFU5XD25yzBJolR1ZtEXf7Zoo4yen5EhtrThdWJnuofJbag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n+bFMeNC; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+bFMeNC"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35943f55c06so1598854eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 22:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792041642; x=1792646442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=n+bFMeNC16QxkHowkyZZdcBZF+iwwaAxkGiKXiZzqELskTBfXYPWZpxIOGrZzOWW0d
         SVnf6uguN05UPRKHoHzm/c3Tuz1tMmv0AzbqRNkL3lWTcVcyiCknNUEURX3D3yHJL1Kl
         +shsmDKkbKf2pxuGEbqCSnLfqPGkywUBSBvjnfgDLm5aDxpUhZaYpv3CLeFCWDKloHv9
         VFktgBM4eqFlxZ0ibyPZH0amgmBnZWn//NAOpw71PpeLuWKKuI14FkCOaEdSijtfTmI/
         h6yKqkZNK4ieZF6z5Do5oXIOiDyK198E/cpbFQcQFKh1mW28+6QcNu7j81DU3TOmqJcI
         h9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041642; x=1792646442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=gmx6u/yvSKsQNTJqYZz0nzqcrmiZYBmHKClr/sKKRB3z0oSpJFdxyOq4WHdAoHuDgN
         iTN7o/TNhvDQaP3fFCgIvLrY49oXADkMyP7aJn0GubJKfGA/oFCw976xdcCwj0JiTbKC
         Qg14igwkJQTmPAlqwbjXMkFhxhgss2oxUmP8P7btGK1p1oQipjAgwhY+rkBXs5CY4oCz
         U8T1o1tTbUGtZXC0mf25cByyfr29MXc3kzlrSm8ohrI1KhSsvN//E2L2LRkHm2OxHFwY
         A6rqUpD0Jll9VeQ4JCiZ+IXLJcIzyWg0FjgW3p+3Y+mN/6fP6iGg21d/ryks9vKd3uMK
         oRNg==
X-Forwarded-Encrypted: i=1; AKwUvByS8mH0Y1ptR/YXsNxvphBPxedvtfQqmh6sS6g71NdU7TZYV9UBl35J0rXnO8eSxIvCP0fa+JlbpHmjZn1q@vger.kernel.org
X-Gm-Message-State: AFq9FYLPTWUjqZV2ShXLxEbiXl/YNVbcacNFEuQGQB40ukL92LndY1N6
	aSF8nBtdWqBjv7iSgKAGYpIiBWOAt3RBz2knoH/xJDinQvKD7Ht07Cmc
X-Gm-Gg: AYBFou0bVzCvdYfdR7dd0h/slLTKBod1LVgZCKjQ7ORpCJ+gRpVrofCW6pIvmiyODqs
	5eOBESH5RexrBZ/iG5wol0VT9DbimGkKbnWt2jFUSfqzqACEWJS72XrgubxVogFU+RIrrBUUF+u
	t7uOgW9bbIUnPFtW6m05afe0/koYfnWoj1VagGYXnTUfXIIcpNrz3IWLr0MZM/NmOIxnbcxBJUP
	2wp8s4TvJElFZb1vC3PJ3LNLU4i0L5qRR1vzaCjPgq4a7vtNXm2o+2N5ZHsuLxw6NTuZr092kVQ
	zBdiSbYPiOgeThkTGNHs5WZFiNcoi0UipU8UL/o5AJ58NFIQsm5D/y7g9e8Er4fRFatJMmcecdM
	JChw97Z+GcdF/mn8GmsYnNlOpnzX/i2ix0cLmk8Idd0KSWZ3S12I8q3MeA/ILuYc7wJa44YV+/a
	rC2wOcjdxLoxPgy5j0DH3g4U4h5SzVgL/uZLXbGRvVOkDa0QPOqEEUL0vxeLKSQPxDzCjIu6xyM
	A2n/4IVbanNyob5VVeCHKDvYOdA3aNMa2wGIa10i8Sum3MqEknKHNw=
X-Received: by 2002:a05:7301:29b3:b0:351:77a3:55f1 with SMTP id 5a478bee46e88-3536c593e65mr25970438eec.19.1792041641930;
        Wed, 14 Oct 2026 22:20:41 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm12923112eec.25.2026.10.14.22.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:20:41 -0700 (PDT)
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
Subject: [PATCH v10 3/6] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Thu, 15 Oct 2026 05:19:23 +0000
Message-ID: <20261015051926.13752-4-sreeshankar0910@gmail.com>
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

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

