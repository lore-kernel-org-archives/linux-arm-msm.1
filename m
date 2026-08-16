Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED36318EF4
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 16:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786897129; cv=none; b=DuAwNuotFg34PtvQ9fOgw+JckSSrG3YE6Bms5OpmuhoZNt/0VL2t2kCxguEBN3XEszoP5f0wT12Vq5Ed78NE6mYRnTr+EdlM8C+f0Pyd346vYsvRHs+2FS5uohX61W2u5bSGadSp3oYFe/9zVMJLueAZcfxcjFKOfdZKj7jATsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786897129; c=relaxed/simple;
	bh=R6Ql6qBhxv8nRfMWDl4ii2I8yaMmIwHS8a/lEb+KgZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CVYzSsHekryCoyY2gHeBCcLMRC63/NVoPF2p7SV58Xn467XwUfOaAO4YrmGIv8QNcljOf9dPHc5z3UzkOWq2tg7NMlyODebCE+hlj8elrLknCoU0Nv+ZuwGFJzReEXCf2hbyIIi+NpP1Le991EtlQjIbXFShevg9dkHYisOqVvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KejpLKmy; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KejpLKmy"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84e04df8c46so2795211b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 09:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786897127; x=1787501927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xro5hLO6XYdeO9sCaq310qk5ul0LDKCYcbgwbKMsfxo=;
        b=KejpLKmyKTq6UQ8SfT9GD/OMvcAz/8cNYCIzNiGI2DMg6QqxQcVkkMjC9V1x6Iqpyt
         TjqUW1sYYcUb9em5GXd5EH41Fsk81+xpZuiVKTYUoiYjgtFiQFnbbLnofp1Wu9QD9L87
         qQBbukkV9lfwZhyEd9oJruWXttBh/og9GZ+guRlRApM1ZARDHwMxKG0S4kx1ld/J0Jvj
         CwLcDwQG9fI4QrH7WT3qlMmWPpMSbvertN+ZdOORVNkTu/AvaRVwirCB2sW3u/C8FhK6
         oHysUVgD988vLxR5woWBBApsLNx8YxT6D93quQ7+qZPMJ4i2pkglzPeRG2Psoyi7bzzj
         QxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786897127; x=1787501927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xro5hLO6XYdeO9sCaq310qk5ul0LDKCYcbgwbKMsfxo=;
        b=m4AuSacabARIa1el6zLdS3FdpTvQQLUHZuRKLzANE6tXadP2nW4p0qBT5oBYzbUF59
         ve/fNpYpzSzFvxGs8pyreWNjGr7kSOf+RMHQiRCC7d6i8zTR8UwBc4+Ois+2IXxJmPM9
         O+MNjNyOhnfFw9sSpfVSoWRjpy71UJ0ezd+WOs56X+g6ey0Vg4Yrcp+n5fPv/VdRMhif
         vY7gwtkQ90XPA6nAHvSeUMnUT+bmKzivLzQeyDL6ZAw/x4OyL0QLgyn7k+CzXQp21mjJ
         56DygfYpF6s3mExAm+ZHGUNSCIhu/bKIhxNuYGNqhdNbiivQ956n4WeXw7i5Gt5c7PXk
         5AvA==
X-Forwarded-Encrypted: i=1; AHgh+RpZILyPScHD5V1R6UwZhGI0+06HlFVxDVT720cGNZ1DfsvU6lqeh2WQXQg8QDA4Uh8pwikv4Y/HWWm59VDw@vger.kernel.org
X-Gm-Message-State: AOJu0YwtjszPWOqYBXrCNIKdx6zIlbQVWCV75++Eiu0Nuz0IjZePoHmn
	72d+ROozOb8WRMybMEwELLjDxv7VXrPYSf9jjCXuIh/eL05dz94j4GUT2RqUow==
X-Gm-Gg: AR+sD12iwhByBqj+lq6fZGWgrANRrUD36gyk/5PLWENQS/+3eys9nyCY94kDti4OKJt
	r0c28VVTNPnQCOwGVVKu8Wr7Av7hJoQ0OGmwVOmNfiAO3WAD/Yz1vVN1CQOnMrIMMO3MXjGw5xN
	37FSh82F3w5kHJVnDUVwm4v1aeIJeNnEQ7RosXjbHwTctd0kjoe7ZRqsJFoZJV9bHFdniVTOAmi
	4sOcehJPEIP+p+vQwxNeU8kSzmB7Rp19HtCmaOiApsQwbaHF3GmvPcVxx4hFdOXdaJUFItWSghg
	VZ/O36DZVbdPkxdWMN2JaULiBr9CB9b2/NOFTLrn36vUKtqJ6t1nBM/XxlnsR+sC1m1vlwO1DlH
	3vGzT1bBZb11l3CeDliunXAvBixqpa260yt3GLPLaWDWR8ClTOuRxZPqtqdfT2EsXm6WZSDf/p4
	MASHba1PBub9LhttQisrSbYtyo1oVFTJUlqUviMMUdtwc5EvYhImgy2OaQseVWri1SllL/k2h9O
	H3/hw3FWzw9
X-Received: by 2002:a05:6300:4c:b0:3c3:89ce:b5bc with SMTP id adf61e73a8af0-3cc71ac4503mr23228160637.15.1786897127568;
        Sun, 16 Aug 2026 09:18:47 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9679sm28969988eec.3.2026.08.16.09.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 09:18:46 -0700 (PDT)
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
Subject: [PATCH v2 4/5] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Sun, 16 Aug 2026 16:18:07 +0000
Message-ID: <20260816161808.12419-5-sreeshankar0910@gmail.com>
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

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25f62bacb..7446a54eb 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -72,6 +72,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

