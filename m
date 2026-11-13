Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606277;
	b=MOu6M6yQFGa/tGoIivf4a2fj2pMdi45trtipbnrd34T8YOHAc/5qPR/qmTsu/4YfsJOQ
	 PEKmVXMK2RNXdtQbVb2KsjpkOGO1WnDWdw/MrabRPQ3I8ggJeZS5TMCJTFyseDbG7nqow
	 5SX8vXfWeNL0vGTyk/FMCycEHAY+9zCyBwlmUXxnCsk5Z639HIXh/VcqSt7fiuWOvXVjf
	 bq3oxzUa9F7hzOBUWqSUz7gi9+5W2ykBsNYM/n4Dq83IextmqNoq3uBuQYs9BoBbJiYAb
	 lGS54l4NBrtJAVuxx1rC23fGN8pxoMESFvoq/MTcwl0L6okFMQKFsg6jqLHn3elmzRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=idHWYPumru9E8eUEsbTnG7m5cr0Qeebr13UTD3g+dNk=;
	b=ihwwTfm5c1JVPNwbzcvWP7s/MWZItUFeODqDwpw78AV4uP3AUB7mtPp944/KkIEy+lSG
	 4C58bizJrbVzFynauUZnDYahfIIKUZS31JrA6M6GN0fqrQX8r1O69TbQsLo2ULelNwQ0B
	 b3IaR9DIF/i02SVuj1Yr8xLvvPRxS6q5/koFgQl0yf1sca+onMF2t0S48EIFF3ch9JeCf
	 pvBqy8jc3G1T5zWfPn80352NTvDHAIepVOFuf4PdqHG4GdjlvN0eoDpayFKPzuFyjUBbU
	 B89IGR7uvt6k1GCHE0TwcVJy69d8R657s7gnJMr//oWXqJ7az8MSQ+eNJB4jCJmSiSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kI/JEfWF";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F4C606A33B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 21:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65F4C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kI/JEfWF
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1168012f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794606276; x=1795211076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=idHWYPumru9E8eUEsbTnG7m5cr0Qeebr13UTD3g+dNk=;
        b=kI/JEfWFxnNd2OdQAFjZk6WGtBuxQ0b2J1AxChRphTz9LtqA+crMd6d/JSq2A4uEvW
         8xEn8XPjVKMiXFOIWmMKfD7MxNh+Bxuqn7hm+udWlxQdIzQXr7ZNCbFOydxEiXQ7F9uc
         zJwHZQR6kplPB0GxYj/ofAShObktk2YAAe8tx0E63/rUUtRWwGhQwJbTifwqsJkfT6IK
         4P9oXauZi3svoArETQAU2dnOgAqvKCFtIGvakO5vosGIW4BIqJp2Fu8WCFu4Z3m//yOX
         KmxHY5pZuciNqybfUReUFYuEiDGadUqgzzIPQVb+O4v1agvHqo28BTQztGYreMzNSdBv
         gNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606276; x=1795211076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idHWYPumru9E8eUEsbTnG7m5cr0Qeebr13UTD3g+dNk=;
        b=docMvcE2/YDm1ag+V5TFoQthrJvZm8tJEwbmogYqe+YCFYDWZYVKOx71yiSbSZjQav
         DMQ13U4o3aAxQMXW5Es+qLskF5eKzFnSrZ396bshymrS2gs2CSV3MWBhATAb93OKWAJf
         6SQ7l+knd93O5K68z5f/his7WpQpAoKj8LFpKe6b21xtuoquJpH467WC1+4UMV5J/fwQ
         jGZb8hE5DCfOqMoBFegPCLQb7wrHVbJUqZv+K51u6xLS+yIvV9YrftOWBspcWqdV+JdX
         UK3ByhV/xOiC+aSIEkF/fERyr6mtmrhzlwYvwb5dv4yeMahZq0pQCGUz/CeGQRQqWG25
         AlhQ==
X-Gm-Message-State: APuU4Z9gHOpNfoWiN39qSLSrrmI1o/toQ6rIvWkKZfKYsARXOehQqfA8
	PCNJ7Ur5EAMBDkCQgzn59U33JnyXGxXpjRDdPujvB9EW/t5U3HhyQXod
X-Gm-Gg: AYBFou0XxCm5QklbONkYvNmsjnhwYYu8KYOyqb+//xW2xIKBn+ZHDXdtIg9+BDSDeDC
	3LzL3kq+gQzr2WpxLS+e4lRwRDuREIArfDWzmJrc+RzPsKDqXlx5FTUcuZvQlA3GadsD+6AEZ7y
	NeDbFIMO/p4V/JQ63WhwpXl274nIf39kzHxSm8+pCDTQa6ogtQ+UlmCzxE8UIn+0MyClIXaouhd
	rjjQJ/pU8rRhtoiZD90jWqY+HJfeyycbyte5Iy/P5faX9Z5JFg5n7ooLxbfl4Y/6dQIkcZaqcPn
	boC5g+QFbW3sVBYl3SRbiSoZ720/E9CA9Y4qmL3kF/jG1vRQR1hdX8YZDWxxn3ZuYytZey7lHX2
	atmXQdHlEowmvJ8xCU4Vbisuz9wpirImBXFpEJyYibXaeT5EIKNzUxdYDsDK0lPeqLhOe81B+bz
	CzM1YQ5Iwa4d3C7YNLOkUCWn45NDjHb33smQ6zeN7ywZFY8BwnZW3ZLbrKpFxUz+vzzAO39aNy/
	xNQMatVP7RPUSb343WDEcFpnKuBbO2Pkw/OWM3LWPQw1cxTh+3NyMg17LsGnrPM6bLrJXqmMI5w
	lvUvnlkCEeAbjnsRylTV9GdOWrZkQqeijigcF+EZOinRlJyUJw==
X-Received: by 2002:a05:6000:993:b0:48f:bc59:ab9c with SMTP id ffacd0b85a97d-49c6fd932f0mr8024260f8f.12.1794606275654;
        Fri, 13 Nov 2026 13:44:35 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm11644595f8f.7.2026.11.13.13.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:44:35 -0800 (PST)
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
Subject: [PATCH 0/2] arm64: dts: qcom: Add ASUS Vivobook S16 S3607QA
Date: Fri, 13 Nov 2026 22:43:39 +0100
Message-ID: <20261113214424.220241-1-ingo.kubbilun@gmail.com>
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
USB-C, NVMe, Wi-Fi/BT (WCN6855 NFA765), keyboard,
touchpad, lid switch, battery, speakers (2x WSA8845), headphone jack
(WCD9385), efivars/RTC via QSEECOM, CPU frequency scaling.

Not enabled yet: video codec (iris; the Windows firmware is rejected) and
the camera.

Note for review: the CPU thermal zones get 90 C passive trips with
cpufreq cooling; the SoC dtsi only has critical trips, and without an
EC fan driver the machine reached its thermal limit under sustained
load.

Tooling: the changes were drafted with an AI coding assistant (Anthropic
Claude) from the Windows ACPI tables, the existing X1 device trees and
boot/test logs, then reviewed, built (dtbs_check clean) and tested on the
device by me. The laptop runs it daily with Linux 7.3.3; this version was
tested with next-20261112 (several cold boots, all hardware listed above,
without clk_ignore_unused/pd_ignore_unused on kernel cmdline).

Related patches sent separately: panel-edp entry for the BOE NE160QDM-NX4
panel, the qcom_scm QSEECOM allowlist entry and an ASoC line-out jack fix.


Ingo A. Kubbilun (2):
  dt-bindings: arm: qcom: add ASUS Vivobook S16 S3607QA
  arm64: dts: qcom: add ASUS Vivobook S16 S3607QA (X1P42100)

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../dts/qcom/x1p42100-asus-vivobook-s16.dts   | 2137 +++++++++++++++++
 3 files changed, 2139 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s16.dts

-- 
2.47.3

