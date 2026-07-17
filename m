Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66613F6615
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784288734; cv=none; b=KzkK4UCoKHid1NgywdBxZFoJ3I1x3ASvBnRJL7hF7CVRddZFCEUfNdW0dC9JL6gOL350kCczwsDVsxvMbDD4NDtUVKGYIuhZRnxP10mUp+n4toHCSEwt3l0z4NxJ6Y65TkpAsmtNjFhvgj879xPVvq9D2OXkbAaPa9vVAnPuWSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784288734; c=relaxed/simple;
	bh=9LbC1FHVDDMZdYZI0WqN7RgRzl9vDprPfnVnjf9MUaI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UqjrnDOnYy3BKumBh7J21gg+kZfJhDdCdSfY7/6XQOBydECfEM4hWCHOUiJKXAsamb3z9/8n7zLAyU+GcUn+hKQHcClInA+Ao3x0dm4Qn7Ozt63ZFMN59yIxq08Bjrqwr9ZLOoH+xrVk+BEZZtw2D4ZQM763CThH+8UuSlrH65w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3ryjejuU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3ryjejuU"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so2334705e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1784288728; x=1784893528; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EpUodwbhkAxMkmXtH6zvZRrKPhM41ygJzANZM/9HTt0=;
        b=3ryjejuUxYTfUqthX+6JVN6mV4yYEwMcwwceDmQrFthpdosF7FuHqRBin/WkCEZnfc
         bVroc8hCNxndz7pvXLUvmwl6p7CCRJNsPbGMba9+tUWK55Wcj+Tk1RVGU8ugzl5QddW2
         q8Iufr+sGixnWj8+4asi8Im4TMPkuzSvcO5lnxNomVM7MGWX+lrcSJkZziP0Xo3ksALM
         rsrDM1NcP0yxr+dGz6BE6jP1NmUrmCclnYszoHLLq8F3LQZniEoZR1rJmj4miHCWWSkA
         6Jr023hi1rYPAIR6gqEQbwektat4iwt4gHgQhkBgEKNdGr4MBQr9wzigV1U7jcf46svq
         t5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784288728; x=1784893528;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EpUodwbhkAxMkmXtH6zvZRrKPhM41ygJzANZM/9HTt0=;
        b=OQ4ICL+fJ3Ql3X3us7xesVmEEOkwzPJStsC0Vx9tXnXoO/eD6c8bQgABfRUQTWN3aw
         kk7NTOzaKU3AnFXEBugx9Aw6mAwe/8Oj/M6FXvSNRjOQEnAMaZBigjYhHvGT6Nn9MYsi
         HqLLs52p8LxGrmld7Vkp2lAG7Xxda7nuUEgwZ5XqK2h2/IsQJmrOpQwMqIrz5YWeY1Zo
         qDtqA3d4UKGXoZLdeTz+i2TTl7q+ZsZM8+6zOr/uYhT1Ck3Lk9IMfWli03PMUtCwamDP
         9c1alg6O6fM1dbUFozjNiRFDepgOmP+erbpWgThw04Lggs9GT0qu2ZFZhV1g1fI5Ama4
         E1CA==
X-Forwarded-Encrypted: i=1; AHgh+RrgB5FVj1J/QeZmIIK4qgyAd9l2pC0roSaNx3Zp3OY7zmyoXzv81F18C923QmbbTivX5UYOsQsZxR00ilyH@vger.kernel.org
X-Gm-Message-State: AOJu0YyVKj1POKTJXNVMQtPuuqbjvkVNxnsyr7F3455pMW2w+ng8Vz/O
	lXh2buyy0dR+b+Lu70tg5ljXHqtjnB6utowxmB+5ToZJWybA+lYXPpnZQ0q/vx9eaGI=
X-Gm-Gg: AfdE7clp6eWdROVwyWzupK+eae5/JVFNVUVidy3AwrQMQIBVQFR1B9FMTReWCHnK7bO
	IUW14dFJmzSCx9Cw1dcGFxpoXCZHCPU396UG2L5/HtEvI/cw4WEF62U3WsPyPSQj0vOsklssHz/
	vEYeoDsN0Hio6EaRbytTy3FbFeVTraIVqv4XYF0sw578tVV5YSp4UxK0GZRkuYzc0nRi0EISvto
	I++oBjNL38uWQP/tn+1860/BvGPQYUgXWktjBjoCF5sjo7bqnVUhshUYSi5kd6YvS7PVXzaRQPF
	KzNN3q4UVZd4I+7WntK8FxEZOsciynoKEvz+2KpaUXqXadZFXECLPFMiR1d6fRQVculUP3eLVgp
	hOGsanEPQ1R+tRfZO5yweUozqKPtQDxQ19mDJ2sJAxEPQ+bRaTqID1zwAzkm5UgDiHLaJZTkT7W
	dqzinvwctD1jMYLXg=
X-Received: by 2002:a05:600c:1396:b0:493:b150:c607 with SMTP id 5b1f17b1804b1-4954a3f36a9mr25499865e9.12.1784288727673;
        Fri, 17 Jul 2026 04:45:27 -0700 (PDT)
Received: from [172.18.170.139] ([185.104.138.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm41353855e9.0.2026.07.17.04.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:45:27 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add Milos CPU-to-DDR BWMON support
Date: Fri, 17 Jul 2026 13:45:01 +0200
Message-Id: <20260717-milos-cpu-bwmon-v1-0-dfe0bac9898c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2Nyw6CMBBFf4XM2klofTTyK4YFrVMdY1vsQ0kI/
 24Vlic599wZEkWmBF0zQ6Q3Jw6+gtg1YO6DvxHytTLIVp5aJRQ6foaEZiyoPy54tIb28qwOZLW
 AuhojWZ7+xUu/cir6QSb/MpsR6VXqVV410EMiNME5zl3jacq43R2hX5YvqiRshKQAAAA=
X-Change-ID: 20260717-milos-cpu-bwmon-fce32974efb1
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784288726; l=983;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=9LbC1FHVDDMZdYZI0WqN7RgRzl9vDprPfnVnjf9MUaI=;
 b=vrKpPTrZL0S2ljLXdwMb0KdZ1gBG0K3Q0BF4hIQXj4WiGn98nVZ7Q45EATOPjPOb57d+Gw0ZR
 mTE7gVnOQtHB+UYaxZoWMscEQIhJFqmq0SKKNOpYD723i7Eq4WoxpWu
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the bandwidth monitoring block on Milos which lets the
driver vote on interconnect bandwidth based on monitored throughput.

Similar to the CPU OPP table series[0], this would benefit from driver
support that can differentiate between DDR4 and DDR5 RAM since different
votes would be correct.

[0] https://lore.kernel.org/linux-arm-msm/20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: interconnect: qcom-bwmon: Add Milos cpu-bwmon compatible
      arm64: dts: qcom: milos: Add CPU-to-DDR BWMON support

 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |  1 +
 arch/arm64/boot/dts/qcom/milos.dtsi                | 49 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)
---
base-commit: 19827e7930a5511c68e12aac6e4522f3661a1709
change-id: 20260717-milos-cpu-bwmon-fce32974efb1

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

