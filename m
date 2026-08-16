Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D125912F585
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 13:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786887168; cv=none; b=Ma5a88r8yZo8BdrXcPZM16QQ2wuQ34W5hg577dcVQx2Y9lIzOqAulmeTgzToVQm4Lekbl9VFktb2mmmanTtko8Cue8llla6CEkq1qsAICXr+5vxQdRcKhfqsPOSDJk3hG0CPw9rlFNdoD2EQTUXbGppA3112XYk1l5f/Z6R5JNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786887168; c=relaxed/simple;
	bh=ixZPv37ovMbvQ/1xTBeZYGXN6DE1mWKjljb0LH8kTIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZlvEE6hs6RGWS5H6ICQfTG4znJkoduxSBdSvDlfs04V4POnNmbHiehkvTu7AH4wVkZhxTo2IXtmB9j1XRUvGbim8hg1z4yBQ7Mc/K+IhA+4DSCNbj0u4jJB4JIVaa9peSHniFVDic42seaTDd0/F0SrbYkAYrdcMoFZfBaDSiUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnThG1JE; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnThG1JE"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so2326020a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 06:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786887166; x=1787491966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CbtfuxDNMIVr/V9y10uvywtGS+WnHONVPtW0WqslyQo=;
        b=jnThG1JElrgXW/VbuXouec3NVPED/8mm+uWzwfMqX0hjjijmlwj/nOmniGHO7FSlq+
         z3NBJ2GaPCA3AXD9r65nQMrmx+MZxqHUxx74JRLlVMCfLgcfrhf8O4ZaJTuzyvxMFNca
         A8p17kAEumHSY2Y/8Nqbwq5Y5Yn0RgJlZ6+vITc2XQ5fLdAYbgThpFu6g/wRSUBkxyPK
         an3MGNBqVz2sEtYFMZsuJZctBWrmbchSLQeC/FQQdXRUxVheK8obiXRZhK7ybLG1G2Tv
         V0McUlIggyqphEkBFhlxoiVYYtP5VNEKfW2fGDjJVYEfY+xC4tb9Trz2yb0T7ZFsGUhX
         fNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786887166; x=1787491966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbtfuxDNMIVr/V9y10uvywtGS+WnHONVPtW0WqslyQo=;
        b=U1MmmDs9c0r8F7Vi8Tg1pnrx74pPFHTithZI3KOqvhovHEKRhn5APBO9x+qfLVz1pt
         8TCYAhhBgb1QTHOjJI4TLyyKudqexq8XzlT2IiYGVVQnPUjgsDVWOb5cZFhDTB02iMc7
         /LzI6c7oTOYYiGOEdTTqq9WpH0VYoNtlCe27aHYwZjR5N7+awnnfdh0xaQPJNxBPNl1A
         2NdIDSISnV/GP4o8VV5NNrFMdUX6vcgGFm60nsfTjlWzTqunKv2FIC2UJS2oOc7TEfT1
         NlFstr4bus6LE1uEA4DVjKnbc1P9ODzSZb5uLAustu5g26VmXtGC2HvRTn+t5ek534hi
         XY1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq+MY1/FV116MpKHk8ea6wMTz7gfwPw5LGENmul7pAyKYpIgCcXud4JQMOkcVmZ+t8L1KjTPAtWQIx6M7Lk@vger.kernel.org
X-Gm-Message-State: AOJu0YwQjz9gSeRvvH0gEp+H+Uj1aRmJ9RCdTQF3uxUJJviGet2lg/hH
	lD2gsZwBrh0qxYpzl/DqrV0MaAMxXjlozKXio4hx18VT0q0d8hVWCg95
X-Gm-Gg: AR+sD12z9dVDhR6VSV6qA5ZA+28v6xLcAVWfVodaGanDHjCeYAZCNJwFb/XCFeq+qVN
	GOX76yqMM72ojq5AinmVLkiF4NRz6M9B4Bavq8C3ePckGLN15h0KvfFFCfs+HwjHfu/T44cm+ad
	YVWO3CN7thbgQw5mjD56iX80gjb6ND7AK4yDV1EY+KPj+PRBTQ6NLHG800w2fR4bwLzE2w1HANs
	1D+wg9nsB/7XpcP3vAOXbLw/gahbA7syH6s9FRnoHmpHMqGge/gIBrX5UtTAIW1Op9HuEpa06Fn
	7N8GcnnNvRut16ZOZrm+dlr2V3a/DICPeFZFw39z3P6swO78Qqu5iVN/Q/xl6K+qiJzDj0eE5s1
	+Jk3S76YfJCPgKPagxJTJE0+KRYsfxkOvZQVQ1wmEXdbnYmvN9FWPpFre2AoER0mPaFbWTIoBMt
	qZy2WlD/TZyewa0+g/UkBulZ+yjibrsxVfFUWH1zsZ+Xky+fRP1d8VST9Z6rTCRi//bK3g/0LQe
	VuiHtCYsP7n
X-Received: by 2002:a05:6a20:9f96:b0:3c8:f98f:475b with SMTP id adf61e73a8af0-3cc71d1e80emr20237094637.19.1786887166087;
        Sun, 16 Aug 2026 06:32:46 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm23599064eec.26.2026.08.16.06.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:32:44 -0700 (PDT)
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
Subject: [PATCH 0/5] Add SM7250 base dts file
Date: Sun, 16 Aug 2026 13:32:26 +0000
Message-ID: <20260816133231.10875-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm SM7250 is known as lito.

This patchset add base devicetree file for SM7250 SoC and
SM7250 MTP platform. This file adds the basic nodes like cpu,
psci and other required configuration for booting up to the
serial console.

Sreeshankar K (5):
  arm64: dts: qcom: Add SM7250 base dts file
  dt-bindings: arm: cpus: Document Kryo 475 CPUs
  dt-bindings: arm: qcom: Document SM7250 SoC and boards
  dt-bindings: firmware: qcom,scm: Document SM7250 SCM
  dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC

 .../devicetree/bindings/arm/cpus.yaml         |   1 +
 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 .../bindings/firmware/qcom,scm.yaml           |   1 +
 .../interrupt-controller/qcom,pdc.yaml        |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/sm7250-mtp.dts       |  30 ++
 arch/arm64/boot/dts/qcom/sm7250.dtsi          | 431 ++++++++++++++++++
 7 files changed, 471 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi

-- 
2.43.0

