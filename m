Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957903955C4
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 16:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791392374; cv=none; b=LLOLebL3k3LLC6yHXuXGUtaQL/1dDkvESF/0IPZ8in8rqaRw/LWO4H1SkRmnc2fGPSMKRMFxKai+VZkiM3DLuThSPiOFISK5dQUre7Qx23903yHDA9gi+EhWo5lXREAseB+EZM5J/5ixnXHvGyKcJTT19m1vp/rv/m5Q4gx5VA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791392374; c=relaxed/simple;
	bh=YEKjxa0mNyCMsHdPEU3NsdOvxeYddiBDFxsW6WPNwdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvSjizowedREYrIm7yl6ABY8bUEV+/Dy1eWZ4DbYhjCJ6fWu96DrtDMcDyh6REJKGpYDSvE4gH0N5cDmUSr2ZXEo2xjn4qJPAM88X4yKTNpI4jbXiVDIDFb0TDRPdWirxu36iPepf7/f8p7FazatDJZFc61FFn40PHBlxIZ3ZN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJmsSE21; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJmsSE21"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49ff680331aso45886645e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791392371; x=1791997171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VgGYjJHqBbE7sDJrXSlB56VBshAv0VupAJsWriXDtU=;
        b=EJmsSE211+Inx+TiNFYe3evuU8y1sT655n1+s1PDUPjiDruabGsrLdS7f0pNvl+RBa
         tqy+nh3o0XoD3WjEMsAM19XQMlm7VLqq7swruAJD09gpt8nOK3AuVWz/OJgpyz8ojVA4
         cQcyJr4HuF7a4ffF+ci/yLPGX4L0wYiLnmD9hLFYvUGeTHS2bg5V8EhxGL4t7oB/CNdg
         WQP230JKqjlEEt1bB6b/sZVS9XJWcFEEURDEffkniMAlIe2TjYQSUzp3rvi0EuTSYbvy
         AK40Z9o+tOB7bUKQ1TPOs211Q0voxzxkWK/k/Swd7Sp2pWlkC2rMK7N0zeMeBUllC1Ch
         qdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791392371; x=1791997171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9VgGYjJHqBbE7sDJrXSlB56VBshAv0VupAJsWriXDtU=;
        b=Yd4FcWpGI9gDfHp0XhkWH8XjECHGNtIvuAkYZ107MgCGSvYORqpC9x01gLqkgEUb+L
         +XVSM7zFZCyOI4jUIVQ9UiSw9RUz50ZwpMaj0yWIPMbSphqrYt+Y60hrK1Q/NHSDM/K8
         w7/uXXCAW82TY+psmGOVGTdXJIG4fa7HCtGzo4YhMDfHbo7zk96PEkWxKXOJvztkZd/Q
         sv29mKyo9BxvqiGvpn9YllgK0FpsuLO/5laNnTJTnDOaiateJFMXky5JDwnpWgsUEaDo
         XZZcszPI3vT1oWEGAVuGnavTI81beUKkxfy0pVqgN4YbYAOYBWOAZqPs6vEdXMWmCVe9
         zx6A==
X-Gm-Message-State: AFuF++lbF/v2+Aay1erC/l0BXodBSzohZGdzgavHRZku1s+h2aZOGc9R
	VhGptB9r9UGgcgrcX88TDW6klqXnJiF8A8/3AvhjI3fAGpu4l0yx0t6u
X-Gm-Gg: AYBFou29MGNwoGRKdNNxvEFfrVorKvtzyarN3qW76bQfwtgv3H/cyHSzRnvZn/ZfN//
	16XYf4W8/2fTDGNENjAMxFgdIHOQ7hnIdglvT3hWDaW7vO01X2UCsrGSnxZRIlScQjTCJ536dhB
	Bc8jbQ1NCfoeGV7/hanJzMFPQKnxuDZkmmOyVe7r8Tg7OxIajxseiiO2cVlzAfbQ+gcdGLKYYEr
	p46oxM1MDJAkQ5apYKBY3rjV6O8m+YNmml3ibXCeDlEtFp6FzDERLnPopWJayb/1gnvs899zer+
	AmYIkzPXrZ7k3iD9se4GvuH3vHgk9WSkG/3mIArMs3tD8BL5b9wl/1zG4ghsYlI2bdhAKJBZHZ1
	BUzeyFW8WAVjD6nHEsVxO/abZOiHjHzmHlu4gkWBUszhFjsgGuk2BREEnojXoxAfU3DvUess2Z2
	S3iuLAKvkpWIC57nVDkf5cNXy57G7o7TLd7I9X+fIkkMxK73Mvn9Uf8hhL6iSLAU9CPV+rJ6g0f
	Nk9+OqebIQ1+9+5YOyKtM8nh9c=
X-Received: by 2002:a05:600c:1551:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-4a18043debcmr44973795e9.10.1791392370783;
        Wed, 07 Oct 2026 09:59:30 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1843d198csm4682525e9.7.2026.10.07.09.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:59:30 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 07 Oct 2026 18:59:22 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: ipq5018-tplink-archer-ax55-v1: use
 'ipq0518' prefix for dts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-tplink-ax55-v1-ipq0518-v1-3-0ef058756596@gmail.com>
References: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
In-Reply-To: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The TP-Link Archer AX55 v1 board is based on the IPQ0518 SoC.
Change the prefix of the board dts to reflect that.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                                       | 2 +-
 ...5018-tplink-archer-ax55-v1.dts => ipq0518-tplink-archer-ax55-v1.dts} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..76f414ff98eb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -30,8 +30,8 @@ hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hawi-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq0518-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts b/arch/arm64/boot/dts/qcom/ipq0518-tplink-archer-ax55-v1.dts
similarity index 100%
rename from arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
rename to arch/arm64/boot/dts/qcom/ipq0518-tplink-archer-ax55-v1.dts

-- 
2.55.0

