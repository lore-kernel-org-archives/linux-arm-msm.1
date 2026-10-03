Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9727549C4B1
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 17:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050225; cv=none; b=CjSdZ+yPy0DHaAnho1NGwrg82K0yO20BPNWG74N7q4OyY7G0alsDxrQUaJ6036pyYwSOIYhT402bdSIou6FhcRpclfPHXYCTYKCis4Zak47zQz+i+n2JyWSu+NYwxISXB+bL/vFV2iI5FNybJQaVLZsSGDjS0jVxwKs/q/t4D8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050225; c=relaxed/simple;
	bh=LOhl3Aekc4RKo7oAx+FKR3eE5zK1tDJ8SzPFFk/DLWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ru00ZUE/khAs/fT0HODkeFEFoWQmhJpc3+if3JGW1LVZnfi8uUweTo2YyuJM86Gsp4NnL+pGsadDMfhx7YAKDSQFTr3kO/ZtP+CTiy48a/Ewj5hA5DSjCtZQyffyasKeopf4OlnK2FFs4aw+3jdiF5uLT3J2uKx5op70XA29zvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgNmc5KV; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgNmc5KV"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53440816851so6989441cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 10:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050222; x=1791655022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bsXt4MoLEnClFiQiLZ/irOmeq+7VrIzcy4lTR5NyCaA=;
        b=CgNmc5KVxHcqI5p+cT7DPLeAQOJlNlq67j5LX+48L/9JLzAmKq7PJHMFkPo3q/DCE+
         vUZkVeG1LiSVHplH2VaIFQDa4+FYJcSOKKwWrGos/cuUsaTQfPyR6t41CFv57vTpGuRt
         tSr+bEyvLvHAKkYOP1g3FYuHjI784WIBTEo1glLi0crP5x7hR66VOUetZrnp1f6Vb3vS
         Ol3cj0OmjzVfKQf5fRa0HGfGSgHxgV/aKOwzDeOEGw2xsu6ApyfdDVvilE93xyS7O+78
         4XNfAMNTyFyRxpa5Mjq1BGxgPhRRqv2liJc9x8YzO1X7WbvXfdjqayWwwDVdPtL83Bx2
         XIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050222; x=1791655022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsXt4MoLEnClFiQiLZ/irOmeq+7VrIzcy4lTR5NyCaA=;
        b=d33WJnxMNSofpMfQ+DtepsSEt1+2R7wrbMQnkS2otw8jf70zrVCFuAjiPp0129kJKX
         K7pt2x2m7QpPx42uUONAHEPgRNro16yYdyehtQBokwokhzpCNv6MFxPV1bJfsvNaYSak
         AvuCGBQjYJnSLYR7OSlhRLgWpWjzO5rSeG8FkMZSpA2rISVknzYfIBe2lJIW70NqP6dK
         6HFM5Cjn3WLUCVIDWRZ8pQO33/xeV8sYcVj7/FjX4+adX8IqPSwmEBMSuu0iXymoW990
         SV1QFv9OGhrvv/jYkaW2+ZaSUhvuVO3fiFjmy1xGlE5dA4xXHpV1aSXHj5C70fgqnWZt
         loRA==
X-Forwarded-Encrypted: i=1; AKwUvBxCQpLVihSy/Qc0bVE7luZ2SxfpV6KEeIga4O2qrDd/Kg5ke3kBK68Ie/F3pamwzpKPlki1zzC8xFQ193ph@vger.kernel.org
X-Gm-Message-State: AFuF++mqXOyAN8caIug5zR3d7LU48Jeam/G3FwYM9zNVkibglHqfeHE5
	A00jvSsa/5bCmGrPZNEFX5Bd3RU3WC+gBy6my08tBNq6F8reMZgsaUpx
X-Gm-Gg: AYBFou0DbYA+TBVFXSPnoo0jNyVtuBcllKUVhrA8s9DaqpgXV4NQ7j0Fbh8mbuamU7r
	FhX8wCJRdbTALYojWD+aZlBc4EsEDjjjvMxKOKCOQ0zLICwxuRWX1z7RZi1IVrJx2cKSheWsAN+
	NB69DLiqGaLW9y/oH9BMU1HxuXIKhys7CpGz92lKrQ+JBisdtGKL03YqNyEWn7zbcq8wKYXOtj+
	YpSwgUCXNCx9Xzvxc5+WwWBLaBRhbiLragO+RQplPESoO5GEwC2uJZF++0sw/9PJo4A6iIBU0od
	WlYOBA3hBPmO6PMZFurxNlFCbg6ZcjCUvo4UDgjRq1BkKKfH8x8h7tZzywXZqyMkSYKv4z3s1GK
	St3lcgRVLm/tbT/CTMxWPQbwCI5TcKsN2tp72Il35phJ2Hm1CuEIHyFy4L6t3Nf5BL/m2n1LRvn
	EoUkNwErmosKLxLlRI6wUSZAUYBJu19KqbTFxiAxTec2yz3aU18OaYTRBd4bTF5GEI1gUY/2F54
	M4=
X-Received: by 2002:a05:622a:260f:b0:530:ea8c:1b6b with SMTP id d75a77b69052e-53511b4fed6mr52480151cf.3.1791050222471;
        Sat, 03 Oct 2026 10:57:02 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398bf8196sm57217881cf.22.2026.10.03.10.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:00 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 00/11] ADSP for SDM670 and sound on Google Pixel 3a
Date: Sat,  3 Oct 2026 13:56:48 -0400
Message-ID: <20261003175659.23536-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a user for the SDM660 sound support code [1]. It also
adds the ADSP remoteproc for SDM670.

[1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com

Changes since v1 (https://lore.kernel.org/r/20260922015801.32373-1-mailingradian@gmail.com):
- squashed sound card and device-specific codec config (11/11)
- converted to fallback compatible (4/11)
- added compatible for WCD digital codec (5/11, 10/11)
- removed sleepstate comment (7/11)
- sorted subnodes of dai link (11/11)
- add review tags (1-3/11)

Richard Acayan (11):
  dt-bindings: soc: qcom,smp2p: add sleepstate support
  dt-bindings: mailbox: qcom: Add SDM670 APCS compatible
  dt-bindings: soc: qcom: aoss: Add compatible for SDM670
  dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible
  ASoC: dt-bindings: msm8916-digital-codec: Add SDM670 compatible
  remoteproc: qcom: pas: Add SDM670 ADSP support
  arm64: dts: qcom: sdm670: add adsp
  arm64: dts: qcom: sdm670-google: enable adsp
  arm64: dts: qcom: pm660l: add analog audio codec
  arm64: dts: qcom: sdm670: add digital audio codec
  arm64: dts: qcom: sdm670-google: add sound card

 .../mailbox/qcom,apcs-kpss-global.yaml        |   1 +
 .../bindings/remoteproc/qcom,adsp.yaml        |  33 ++--
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |   1 +
 .../bindings/soc/qcom/qcom,smp2p.yaml         |   2 +-
 .../sound/qcom,msm8916-wcd-digital-codec.yaml |   1 +
 arch/arm64/boot/dts/qcom/pm660l.dtsi          |  40 ++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 150 ++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 183 ++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c            |   1 +
 9 files changed, 398 insertions(+), 14 deletions(-)

-- 
2.56.0

