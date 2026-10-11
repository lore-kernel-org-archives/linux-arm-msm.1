Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1443037DEA1
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791712492; cv=none; b=YztF07W5Hk/uGkFp+qOFwUuktiwoy9xOXkMe7L/G16kko73+eERqdF5ATzemPKyuj1qzeXinwwcbNCwAWargCSIViVv4Hx87PNeKCQPJO3YlA0m/FhVbhUukTNfZF87+kqbN5yGdgYYkxK37aMqujbK1HzdfmB3dExHmCahvwDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791712492; c=relaxed/simple;
	bh=U2B7BU0Lxs3FsucnZq7AS8Yh/09iEnWsum1PYUMmvv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Af9MU1XNyBZabfr/adKwbnWo6HQQrV9h2jAFWcWtU4HBxwPuMTjqNBWffwzwTyU8kzCKudo0Hgl3q0Asf9QbUaZ1Hq0+RWIeWoeGeiEkbaxuJGGHxdea3Gz0n/Ay5tZtZMtuc3amSCiSME/X9pCL7R8RQ4AZatIQaK13oFo3eHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AM6A/a+k; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AM6A/a+k"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso6964035e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791712488; x=1792317288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QY/EzmyzTauwW5QelrR89nN81T0UYxkWsgWg8RAQUTY=;
        b=AM6A/a+kiIEkbC1HcxD2S9+zSHPsIeM06GrzAXDi+/cPJhBRR8ap5Vp43naBKP0SPO
         6N5zc2tp4OBLTZ1rXEvb1yiKDWui3voXcqXI5cvtpBtf2MFDu0yUEu+kca2HymoQS0ra
         bVATxnSOx9yt5yE9I06JCIcFxnqE0/e5JKTA4Qd6qoZHGj1ZX4m3RPUNFpTPnm5FF9MU
         NviYhitZT2NtdXr/yJEtlDKdXBjuoLZpoW/+Dnx6SP2Z46WDjPa+wq5Oy6iNy0c6sI4E
         5Sd+ePbcNizljEE7ZZVjT1k/FIp+ZDpgUqeMMGIAkJKAmAMIT+qH/KJxgStIItkljwCM
         Wt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791712488; x=1792317288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QY/EzmyzTauwW5QelrR89nN81T0UYxkWsgWg8RAQUTY=;
        b=bhj4R0pyT0b8xb++tjfm0t/snNMlA51eddYlL1JdFsYA5IZw3fIUPyzOq5oDhdNq7G
         KxhVs3S6QxucJoQAE83uOXmMNO+QLX1pTicI7ShCG55Bf47RvK/HM7Eo+wZ9q/B4J+6N
         yptJdHhLhIf14IAYzSe7/CHkj9btJ2WW9pW8Rqa0zFToVrs8j1A41ONV9ALXqVyhE6CJ
         itlJYARR81A3NWiPmQAzHHbNGV1QHqHJkZQF7j0M6+i7wEB8zZWhN/9xsLV7APicZNkW
         tC1wRBdHXtIuu0Ga2zF7oYtV0XSKNMmaQrIaOG0/FFDjdGTseyjbELfDFcUJZBZpOfId
         YW7g==
X-Forwarded-Encrypted: i=1; AKwUvBy9XPkuTHsE8gpwP2qSANH7xSX7BHf0kMutqTeiVedOMkWhfrT9Eykb4edJi9/j+ataLRu8wrgb77WesFmP@vger.kernel.org
X-Gm-Message-State: AFq9FYLDPOpFUq570O1GjgEcar9/+b65iVUKpMJXGN7Q/4/NXQENtd5X
	BR5OrTTg9DOL3fsFplWEDVyGVfoOX2Yp+eoIQp4XLlSCiTprFEShPZ8b
X-Gm-Gg: AYBFou3XHu0tkv+MaTkMyWFM3AnkoL3aSW4BePKEg5wQhIH/dNhDiw+e6eBoAbZ4ykc
	XMbsf2ejmSNReZFVFJNwF/3VAkPbfE5bGhW4DksrBKvp33kL7ORtypZegiz2khgJp8a++CtFzEY
	q7FPHmp4GLmN4k1EZBIMGaylekN1qhTwhHgvrERBdQuWV2pNgy3zdGg8rcwxN5DXHTKsDAq5oDG
	6539noLXJBm83fcjKXOc3BWc4yxjG0YtvSxP2YXz1sZ/HAV93Jn/ZmOQeKZqc3PoC+uRHY62pwZ
	TH782Iw42XGPSA37ARFt80SI3aALsfPuX23JO3s/neQT48X2qs1ZErFu9RfUwscfVQFefUJfFiJ
	20iLs+HfAb9tIDO04txJSMbFZKceWEEfvDNOHNhFoZsVF0c8g1rCDrVSFrD4qmlil07TmDEOb2+
	cG6NjGs6bHmaSiZTxi3BCx6MBzCCC9T+m7LcDSvee5LmWs4j0VyeV831znK3eryQDDbsH6N8/Yc
	WMryceaVPfDQNU=
X-Received: by 2002:a05:600c:6297:b0:49c:fa21:1c84 with SMTP id 5b1f17b1804b1-4a18e4d6853mr119440645e9.25.1791712488276;
        Sun, 11 Oct 2026 02:54:48 -0700 (PDT)
Received: from localhost.localdomain ([151.27.249.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm377837785e9.9.2026.10.11.02.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:54:47 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksii Onchul <oleksiionchul@gmail.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Add Nothing Phone (4a) Pro support
Date: Sun, 11 Oct 2026 11:52:19 +0200
Message-ID: <20261011095221.24767-1-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial device tree support for the Nothing Phone (4a) Pro
(FroggerPro), based on the Qualcomm Eliza platform.

The DTS describes the UART, GPIO keys and reserved memory,
including ramoops.

Boot-tested on the phone with Linux 7.3-rc3 using a minimal initramfs.
GPIO key events and ramoops persistence were verified. DTB and binding
checks pass.

LLM assistance was used to prepare and review the DTS and patch
descriptions. Hardware testing was performed by the author.

Oleksii Onchul (2):
  dt-bindings: arm: qcom: Add Nothing Phone (4a) Pro
  arm64: dts: qcom: Add initial Nothing Phone (4a) Pro support

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/eliza-nothing-froggerpro.dts     | 157 ++++++++++++++++++
 3 files changed, 159 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/eliza-nothing-froggerpro.dts


base-commit: 705529dab1fa872d8b53b09c95e1b03a95573376
-- 
2.56.0

