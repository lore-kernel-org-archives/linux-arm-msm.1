Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50AA3B059E
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 09:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018921; cv=none; b=MVriGs+DwrKRGITKIswiTpESb5oeYRCi+/9SpQQCaWaSsscb/MKKXMS3RBg0FILjIvhA/Kajp8YIplOLu75gcy0pRYYmyOazut2aBbJfSp9CtjsCOS5SDdmXI5YgLVtA7Vbpq0ppmxM6ue5omaL07Rtjh7h9KwAkQlR7V8/T1MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018921; c=relaxed/simple;
	bh=7mIMzpWt7Kv6nfILtop51S8DtZZgj6RXsaVJr/LrYuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PvfAOYkeiQlRibgJOhJr2bQrNmxQHCRILUxL4EyCjjMLE/JRpmdyAFi2+WJxREScTQObxoI/voPp1+M2SqbrYZSetso+nfSsNFZF87mq2DLQUPTM7qF5KjlLGWZHAru1Ut0opAKVSizTJ2BcBNNiCbhYnb5lDhRL9pkcuMEoQyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/yAwybu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/yAwybu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso4373635e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 02:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791018917; x=1791623717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+D0wcMiZw7JqhFEXAX/EBPaHQLIVoMlrQj5WJPMGog=;
        b=l/yAwybuaFd8Usw2K5olMfjJmTthqbvLtGJZME8MUa6ndH/jY9pFcJoL4hj7nDh6/t
         sfZICwt2y+F5HqlK4JS3zBnKKfHoGUD7CQsVGhKQdYNu0gu5yvcYa1PI3zw8yuP9lglO
         ZwZd2TysCDZr66fi6T1kVbRpWO+sE+wUtJVrtCw7oiXmdx5y/BgwSInqxOuJYXcuwSTD
         7ym8iOBpm3rIVfErwnShz7HEfvJwS2hWeAQkzCcTHvwyetnvYF1ctuUYaRKlQa+u3l95
         jrWzmttgJIlfBj4ngtPWyWkd6TeFPxQ1JqDprIfX1jCt2XwItJ4hYBsCmbkLSStoZsMO
         ocAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018917; x=1791623717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+D0wcMiZw7JqhFEXAX/EBPaHQLIVoMlrQj5WJPMGog=;
        b=QyuFPbOh59GPH0PY3jhXlizLLV63cMOzwGickFHtwekQUMompk6g36JXwgqxkw6D8e
         oGn+VThID0gskk37A81nqmA6IesbfBL8GPMsKhGDuzN9g1Uqa8TmeUR9AscdGVkXdVGp
         8w0BaMAHRzvBH3r1zJCVL3rmFhcuFqs7WwOf/lX2rtJYmAkYN3YTM00A2n7oCWY8w6YL
         d6Y/+9RwzoKLoqT0yLyPhPCo92n2nV2bbV5aZ2vASxF7pwdnG3vhzzYIRN3TDAzm7qsu
         frfXIXBwnlnnRgXQutnrvQT84IJtGDcMup3LGFSk6B9ojrLYlQoVYFUBzlOFtB8UYiHZ
         mdXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwu8M6zaDTLgCd0tE1BUdsBsNjJMywSHsU6QSHE8k/D+w7Gptbjcf+ZMw6+7pMZpgD/veVLorsweice/6aj@vger.kernel.org
X-Gm-Message-State: AFuF++kg7O19xhYBqCJreld4Z83AZmBT8bb6ZsCyWJ3s82ZHwwhC0BOF
	J/LpozqnH9l5n49a7PcvsLQ/MTlbTxd8xcJo4Lo/RbEyX8flAxgY/px+fLAevgV6WiZ2qA==
X-Gm-Gg: AYBFou3lvklyn9HxRAJjMLCj98+mLs1CYGi+ciJAQFFpO88eEFBIqa6bzK3YrGYx9AK
	/9g2du6WBHMLFu7L+plyHkKflV0Xxp6SJUlvyuAPbgD+e1Nu6PQLYGDXGBup37X1x3XUu+8p+pJ
	SVvSJzJh+xcHUcBvKL1+gQjWCO7WV0NnvC9ArssoIICsKY7SKQuQC3DseUed9aHkcvRROqL7e+l
	hCaQASp/q4qq4JwAI5w0iMusdYj38GnaBXUtX47Xwrscy9egvgnHMRfdQOtfVKLzhpFSZ3F7vhS
	FVXHg9DSC74Urqz03DCiZG6r0XI/rSbVnun3Dz3MtkuTBfIkp7ydFljzY/3kZdn0zADzlv0tYp8
	0J3xukBWT8OVbIyeXyoNsFOUZYWMlnw/IWcixnC+ToyUbx8QgQmfYu/vYYEW1HBLs8L+Y8TQiN8
	JXQ2EbaIRi54gZu7I/7ldCZq3TqrnHo87i1eMF5lgowSSdJldfC3+HROyl3Ym02hn6JocFS22h2
	p1BZvGunjs0Ne3ZS5CFew==
X-Received: by 2002:a05:600c:8710:b0:49f:ce73:5e96 with SMTP id 5b1f17b1804b1-4a02759555dmr75369925e9.34.1791018916839;
        Sat, 03 Oct 2026 02:15:16 -0700 (PDT)
Received: from FranzSP11.fritz.box ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253dc9sm11336161f8f.3.2026.10.03.02.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:15:16 -0700 (PDT)
From: Franz <franzelfranzel@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Abel Vesa <abelvesa@kernel.org>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 0/3] Allow DT boards to disable WCN7850 hardware rfkill
Date: Sat,  3 Oct 2026 11:15:06 +0200
Message-ID: <20261003091509.4822-1-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Microsoft Surface Pro 11 (X1E80100, board "denali"), the WCN7850
hardware rfkill input reads as "radio off". ath12k turns on hardware
rfkill handling, so Wi-Fi stays hard-blocked:

  iwd: Error bringing interface 4 up: Operation not possible due to RF-kill

ACPI platforms can already turn this off (ath12k_acpi_get_disable_rfkill()),
but DT-based boards have no way to. This series adds a boolean
"disable-rfkill" property to the ath12k binding, makes ath12k honour
it, and sets it on the Surface Pro 11. Out-of-tree Surface Pro 11
kernels already ship an equivalent change.

This is an RFC mainly because of the property itself. Is a generic
"disable-rfkill" acceptable, or would you prefer a vendor-prefixed
name, or a different way to describe a board whose rfkill line is not
usable?

Testing: next-20260929 on a Surface Pro 11, with the ath12k change and
the property added to the installed DTB with fdtput. The interface
comes up and connects (5 GHz, 160 MHz). The DTS change builds, and the
built DTB carries the property. dt_binding_check / dtbs_check were not
run, because dtschema is not installed here.

On this machine the endpoint is only enumerated with "power: sequencing:
qcom-wcn: power off WLAN at probe", sent separately as a fix for
b921aa3f8dec.

This series was prepared with the help of an AI coding assistant
(Claude): finding the cause, writing the code and the changelogs. I
reviewed it and tested it on the hardware.

Franz (3):
  dt-bindings: net: wireless: qcom,ath12k: add disable-rfkill
  wifi: ath12k: honour disable-rfkill from the device tree
  arm64: dts: qcom: x1-microsoft-denali: disable WCN7850 hardware rfkill

 .../devicetree/bindings/net/wireless/qcom,ath12k.yaml      | 7 +++++++
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi          | 2 ++
 drivers/net/wireless/ath/ath12k/core.c                     | 3 +++
 3 files changed, 12 insertions(+)


base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
prerequisite-patch-id: aafe3fac38f4020441979665509928f8cc832095
-- 
2.56.0

