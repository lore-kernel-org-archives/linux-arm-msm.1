Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368923;
	b=EjdLD915nyg7LDslbK+dY10VRHbvjf4wbRpMz0OByEceLf8u3O9TSSI/FOL6kNi0UyeM
	 IuCsG3D5lSo7qgZ7tPxbfE8++ihXkMYhd7YI5iGdM7ULZWbxei+zgiVfm3pWF4Nop93wZ
	 /iaVj7OLm2bMruQWtnnWmyKpKk/A7aBszBr2ADTOgBMyISdE4sSe1a1sw3DLx2XG0nP4n
	 9DOOMCCgw0kFXyLUznbwSfveyO2OZ3IVjbyOWWIxyqjbCgXYPtnb7js8mihbj0N9Oyod1
	 IWOhpJuzgWmIwpW+Ewg0J09VIxSPxfErKo55SQHLBgZ2bWHOk+yISuZRilYtEFkK69w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NR3IF3W9rPY84O5okCDlPMWK4xLZD4rHGc1s940WQoY=;
	b=jmUV+IDf0DOknsni3nVxnmt2H55SflWjkmRDruvecb/WObY/wZ9blYVaROo5mtw1TaBY
	 tGaiqbnN6h6zszLwnp1/6JW8brWYnNFP6MXnyJfYL3Xu+8h+VNvRm1uL3ziXm7L6rS8tH
	 RCra6VvoVgH8Z/2hzTfLRhVVGWMlqWKUrwBwaqj+NavkomLNousT6Ex2Y67B8a+2EZ0Pa
	 ZpxePJKrxFRwwYyfRQyg4V+yYjMRWn+sYo8rfGR34wjYio0Jnfr2LuNeL7GQZbJVuwzHS
	 baAcQgxA5ftNCroYJvmf/9yrBttptT22XuewF8+YxwoCNYczduX8iOgMa5ddubZghrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4qC68+X;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821DD606A32A
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 17:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 821DD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4qC68+X
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38699cf08dfso2028409eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 09:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368922; x=1795973722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NR3IF3W9rPY84O5okCDlPMWK4xLZD4rHGc1s940WQoY=;
        b=W4qC68+XpfqvfpwyUVqGzy3qdQukJLa8vbARoxPiUyULgvpMdOLwWZ9mdNp7Y+q1S/
         a2fmnkWbUQ4g3PDmBD2Xi+MVOCf2H3+KwoihsgGiI7itQbQQB35TEA47qniEOyOA9qZU
         fW3nC8iru80q1ix8yEct1+VqIWJEeD94z6WUOs27OvHaulTz3Kv+7Jn6/lNkTOkLGDde
         /5NAWSb/AoExQZo3VKznyWbOCIHfqdIC/+3Z7mPBw3mqJoMXBOOLa7D4Ud9zUSgp3jnF
         29MLaCjxJOAS/3R/0vMjJWRGqddVakOkvd0y8p2F58PDKuc9jgJYBZzwQjZUcaWQUHDi
         QNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368923; x=1795973723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NR3IF3W9rPY84O5okCDlPMWK4xLZD4rHGc1s940WQoY=;
        b=CBcRGzxNT0uK6PdXlUms22xuYY2ALVJ7c/PrqraEg1Cfn1eLlaY26LD8bGw5qyNKfU
         9oxvnh837z6riqS9QLWCa0YYQA92lmTxFKgQNpfMgUvApo/ECA5u5IUrQC8PHkdviG5q
         v4YxSzsx4k/RjrYhXLyRhHXTXldo0SDEoivZ+nJ4ji7Kj5Al6VPBBhWSEGj/Prz+FTZT
         9/9fwLw0FVmXVaJgPSFeWZF7sf6Z4g8+5fspyuzaVZo9oOm/4iOfcqpyFKYuF7Xw9MSZ
         GjaNMIxdGCW6vQEWqNherB6XL6ngIKiLtS7njjkRcop2wMXuACg334O0VsYlxFxJ98mJ
         AvrQ==
X-Forwarded-Encrypted: i=1; AL+hErGouMVwh9OEfsAwnpagWrqjtAnBYLxQiAvqey+n4XvwryMPnuIs523sdVtFv91dTvyiKgbBPSxH/8CIuuxd@vger.kernel.org
X-Gm-Message-State: APuU4Z85CrT9CJCCQTztlUOoMlvhc5ms9LHulu8ABZKy2c3qCJzVRBGN
	umnuPTyKJNXf1j0B37rTU1jV3y3vooz1C7CdADKaK1ps8crX84XmBGHV4jTeQ/JOW34=
X-Gm-Gg: AZFdTZdr9Pxymk64OA+DY8n+WEK0XhhqxkRG0krWDLZw0TJTq0pQrnA6Y7+3mW3ehn1
	Jj/sMB28wWiyMg7jwYbmpKrxNnIM5zDbEY6EeCfCCZW2bEVAyGMjBvL2I6dOm12uGB5mO1Z70GL
	7ac2ZWrnGPgNF8Ydv9vWTvfvDjPThnPSNarj/NphZNsxm+cSW/y/c7pxkTWF7CAEFsbxsurWX/D
	WpSJcYe8jxMv6i+6z3UwZD1Z2sG/tGloMBWSxZMk9NQsVVElrQrcebZubwROUVOrDK4+fGFntE2
	aYtiaNXU1rEMx6Mp2jLXwB610SRNouICC1sqZLCetw2LwOnVI8h7V0E/PV0ai8IKTU44CRgbWyW
	4LkkS1PNEpJX0Ry5Zx06lZgIFTaYB0B7OWOIGVZbEu+uNgQVGm5weh7D6uNGJFoktwTDtUzCg0a
	Gh653hZ8M1pqcitMYg/pIzBsHMlUTCSadl1/U4nic+hZrk8awgdGytvYF/w6l/QsfIS8yzwbg3r
	X5ecnfU7vN0XQY+WNWxKMk2AYHNDpbuinHwFrKOOQowSkPzbykOZ8Xu9fvdGjJykp+s727koX+Z
	pCxbROcPsukDUG8ubG3YzWYl9Lya0jmI+9AtwgsEzb4RbQq//rShX9pL6AafajoWPKwdxDg+5kX
	P4QI8U3GQwG8nbuS69RxfotJxqdnCpfHLUQ5SkpoOkl91qM/09uRpRd4zhk8EzdpwRMTGrHCJNb
	+Vf71qNPYBFy5lp53zFsawdNn+3A==
X-Received: by 2002:a05:693c:37c8:b0:386:a0d1:1b41 with SMTP id 5a478bee46e88-386a0d136aemr7108384eec.34.1795368922569;
        Sun, 22 Nov 2026 09:35:22 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:b842:8324:ef7c:136d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm6419485c88.4.2026.11.22.09.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:35:22 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v3 0/2] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c
Date: Sun, 22 Nov 2026 23:04:47 +0530
Message-Id: <20261122173449.21009-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SC7280 LPASS LPI gpio5 can mux EXT_MCLK1_C, but the function slot was
unnamed and the binding did not allow it. Name the slot and allow
ext_mclk1_c in the DT schema.

Changes in v3:
- Fix commit message: do not claim existing SC7280 driver ABI.
  The driver patch adds ext_mclk1_c; the binding allows it.
- No change to the code diffs.

Changes in v2:
- Add the DT binding as patch 1, as requested by Linus Walleij and
  Konrad Dybcio.

Suraj Sonawane (2):
  dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add ext_mclk1_c
  pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function

 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml      | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c              | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.34.1

