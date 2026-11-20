Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205494;
	b=RI4rOQsvsbfaFHzcqK+G05ko7Zci0UPHDEP2Jcfm3GS560oMoZKTeKS+Ebu9oDkVocBx
	 KFC03I+2T5/RIQQiYGAt/TzDRerM48F+ij3d14o35dv1P17rv29lEwI0xeacb2IdgT1xg
	 P1wwcvq2D//iN7/paBkX20WSNSY380UsAF8yA35+frEdacuV0l0grcinOXYKWrUD+x6zY
	 FLe+laN6yOnNUa8T9vVmWR2BKFS8hCgrZrIb6NIPVyDT4UhIsAkCO/enLC1cWvIZOwR/R
	 riEBzlUVH79vzqM6FOSTlbZcdDBpYWjtR1IKaH1MyvSAAYJ0Y2W6Ts17ee+DRp/WPGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yLO7PfoHPrwfWKb35FF8N0dGUstLX6IC6yxLIlxOY/k=;
	b=uLz/IYLJ+h2FWPXpmL9p8d1Ze0yeJav5ochKj5p+1xr53ESKSSTOfoP2+n8M9Lf05VxH
	 Wg6lU1Gnn2S+jnNobcT5kM8HcC6Rv/0z47kzGbjShTeAAMhGqM/fayfEyu4h1DzbCLFDp
	 kJifmBSUDZJab3h9aoUFCEmjxDM3SO5rAraQERhIdr8Xk1f2JmwPRJWPtaCwpZ/nIMQI9
	 +6fqTqwKJatJME6FrNU1umZz4MUwjqOwYtC+A/DmjWiPMSn5EJnzlQl8joZG/E+hJ5BIs
	 MLA2pttNPyd3KSoqg4fO9U0h8v6/B1Sbgp37DDpGGPhwcZIuPc8YRIvHFCCkciMJwtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DyfM1oMv;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3117606A6C7
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 20:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3117606A6C7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DyfM1oMv
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb606491faso7587775e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 12:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205487; x=1795810287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLO7PfoHPrwfWKb35FF8N0dGUstLX6IC6yxLIlxOY/k=;
        b=DyfM1oMv01evrZ+ltMOubx/jrmw9Li/OOE1kUesIqFi8220Op8+hHG703fy+G8YO3y
         1WDmwPz5q7K8Rryi1ENoUHFsAwoEqd2Y4DTVOkLTI4XGYLCIuJJICpuGly/Qn/n6QDb4
         5XEUdT5UPAIGP0nT+mFayGgbttqYjO9oHvu8ASV8PN85smz0gFhdy7qi0ShEFUhypyuT
         s0vN46K3ja+aRnetM3HCeUqqcsnWSBOuBW9tYp6Z9pIxrt3WPc4PA7sOVLRXhSltnjBU
         T8smtxQPgcKXpD7xKIcTOTLDeLbZ3nAJKJaz7PL6hW7LUMKtNU3tZ7xmHcDeAN3VSObl
         /DIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205487; x=1795810287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLO7PfoHPrwfWKb35FF8N0dGUstLX6IC6yxLIlxOY/k=;
        b=h8Uc/d9kB4cI6VGMQlUoPJ2/k4PcPO8kMvBx67c8jhqe4XzMWDi61m2EmawqpSgfQ1
         ibCLdBKawG+qAN2QuTHk7rFXQiQ797g9Ioo3PFiqNuncTsjAjv+N8FSkHRYmhQ/X/j9v
         7cBgVHasejbdrp7dOTY8el/w7+DSryqBZ/R7U1q3lbxOvnKgL1iBvLkJZuzoHA/K3w+K
         euqGgYavy4XD6FlCEEzTKvKBjxCmyx4UbaLtQZKNqHiYKDAs/ljq0d1uy4/1BTYRshKs
         SkpK0EMxw168wG35WtuC2EKd4e5eYRXa4Ry4LbAYHu6qAHenlDSgpp95T10DWyyYMGKG
         bAfA==
X-Gm-Message-State: APuU4Z+0x69HYURd+Dz+BRUNiQSSuwknstmP75dhmwIW+7dIj/qtUP9P
	FfZ9/39BQpknHeKxIrOQlhPjAhKS1NntHZTo0rdJE4RnQUByWpfd1ui1
X-Gm-Gg: AYBFou1/i7VFevUXZ5VCsBF26jS16LNiXtOGy/1+0GquiUubbqll12tRuSp6mLqymr4
	zJTkTX3UAnJ9SCvDwe9SnefQnA4slDk058JMQyPqeTioT7ORUFDRYElM0aIX0tBSqqhf0sK9R51
	WzXww12yeUVyN0DlP4VwNKw7heOWC8s+DJftZbddzKktAsgL+YjxoIXfBtQSt6IHxuRp2GXxqxd
	bpD8I3DUroGXVnhzStWMlXGkoL4Mhrs0Ac/XUb1gCnHJnE0yQLSFDzfm0BKupZ0a75UEdjWGUf2
	bgnFGV0LwwXu91Cy+AUtUzdZH65BLRkn7m6Ujc3I1ldP6lkAhk5LZO3D0WQy8vySgAoXOnzAp1P
	aGmAg/efxXC71F1/YjFw6qgqeV6ji0T4AF6f6ZXm/NJbYL/WddkhGB9KN6HCpOK9PzDcr8HVS9v
	cQ/2xf1P4wOsYxYLTL/ABnqBazTmECUB3SfxFFavNw/FPuHvJF/LBi7BQS1uFnGtUSL1WETcngP
	cWfFKxFAICNq1QPF+C0pQU5vkQkEsnSh6+DV41n2oh0GxBpjiEstEIZtu/tT0V+/X/DCDFkdc/L
	+J2lqHCQKBtLkKLuqyK8w+FMGY08Ntswhgoc2Gr5mzXX10VD2A==
X-Received: by 2002:a05:600c:3ba5:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4bb8880f29bmr107885145e9.10.1795205486993;
        Fri, 20 Nov 2026 12:11:26 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm115561275e9.3.2026.11.20.12.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:11:26 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add ASUS Vivobook S16 S3607QA
Date: Fri, 20 Nov 2026 21:10:51 +0100
Message-ID: <20261120201127.90969-1-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This series adds support for the ASUS Vivobook S 16 S3607QA, a 16" laptop
based on the Snapdragon X X1-26-100 (X1P42100, Purwa) with 16 GB RAM.

The device tree was derived from the Windows ACPI tables (DSDT, PEP) and
the existing X1 laptop device trees (Vivobook S15, Zenbook A14).

Working: eDP panel and backlight, GPU (Adreno X1-45), HDMI, USB-A,
USB-C, NVMe, Wi-Fi/BT (WCN6855 NFA765), keyboard, touchpad, lid switch,
battery, speakers (2x WSA8845), headphone jack (WCD9385), efivars/RTC
via QSEECOM, CPU frequency scaling.

Not enabled yet: video codec (iris; the Windows firmware is rejected) and
the camera.

Dependency: Wi-Fi needs the NFA765 firmware, which is now selected by
ath11k instead of the deprecated firmware-name property:
"wifi: ath11k: use the NFA765 firmware on the ASUS Vivobook S16 S3607QA",
sent separately to linux-wireless. Without it, Wi-Fi falls back to the
default WCN6855 firmware, which crashes on this module.

Tooling: an AI coding assistant (Anthropic Claude) analyzed the ACPI
tables and drafted the device tree; I reviewed, built (dtbs_check clean)
and tested everything on the device. v2 has been running daily for over
a week on next-20261112.

EL2: the EL2 variant boots via slbounce (VHE, KVM available). At EL2
the ADSP/CDSP and QSEECOM don't come up (the SCM calls fail with -22),
so there is no audio, battery data or efivars there; I have not tried
qebspil yet. With the default EL1 boot, everything listed above works.

Changes in v2:
- Add the EL2 DTB target (x1p42100-asus-vivobook-s16-el2.dtb)
- Sort nodes alphabetically, drop a provenance comment
- Drop the unused i2c1 and qupv3_2 nodes
- Drop the deprecated firmware-name from the Wi-Fi node; NFA765
  firmware selection moved to ath11k (see above)
- Link to v1: https://lore.kernel.org/r/20261113214424.220241-1-ingo.kubbilun@gmail.com

Ingo A. Kubbilun (2):
  dt-bindings: arm: qcom: add ASUS Vivobook S16 S3607QA
  arm64: dts: qcom: add ASUS Vivobook S16 S3607QA (X1P42100)

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../dts/qcom/x1p42100-asus-vivobook-s16.dts   | 2115 +++++++++++++++++
 3 files changed, 2118 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s16.dts


base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
prerequisite-patch-id: ae6c33cce4db2472b5aa360b5e6cbf29763cfd69
prerequisite-patch-id: 85373c0c0ff98ec4cda496c612feffd19f715d52
prerequisite-patch-id: d752bf7c6f8768fa3d4d39387455c3d4551a8481
-- 
2.47.3

