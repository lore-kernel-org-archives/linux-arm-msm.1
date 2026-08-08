Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC9533F58D
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Aug 2026 17:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786209737; cv=none; b=tLFDzdu+3eZLXea5doLYfT5VQqvkuGZ5u2TL1xAnOZuerKdnx1rOn4xRdHRODxuXrz54yilnsmtnOutcaIvJjtHqnXljqtLIzZq6qbfZp46uno5vZMQrnn/J4x8/KfrJWzATB2uulHdgQ8bQFbX2mgaU9Fqqr1MDqnUV8fd9Dik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786209737; c=relaxed/simple;
	bh=9+v/GpCfHKFKhArOfLO6Guy7SvGHgmzyrCi7dlabPqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YvJ/8jjI7RCa26zNYnnBcuBVHnl0TWbzRfsF1MJUlDVsFeXQzJYCmU+dF3fuCRhBh3eRUjpFe8eTwAJL59pYgW7OR7Nwny6qeWF10mkvwC0+WdNX11yZiQhW8W9y9RErRNMMepv1fAn0eBMPzXVfXdiXFQpeYb/GPwFaXj+tp/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=is7DN8Q5; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="is7DN8Q5"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93108a3c326so194113985a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 10:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786209735; x=1786814535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nU5U7pC0ggAhLEGRD5uoCl677Th+WwF8riKutdXhP5k=;
        b=is7DN8Q50xaAizOJmpE3tY5E70TPo7/GD+kHWsiLEL5VeAV5M+u8/4F4gIthnJZDBy
         nC+XV1IaH/PDNMXY7kbdGcqcmv75XUY50Id7S6yquaFXz6FBXKIqMfSlC4ieP/GD2mea
         MPwtyoDEYouUM0U/tvkq3tezcWsIYFb3yuzJhdXTIiEXDsT4E607swU97ZNxt5wjVqKi
         vWg+/t2eA97KW1nqeEP6Au5Q1n3MvLLLcD/VxnAY/8eKPWEndcGV0lCxtywg3tuFcils
         J92fjVsnmiaUEkF1SMMiqUjsSYhOfnASUNfWhS1JiC/HYosb+18MNg6Q4HKWU9d0ECsi
         Iopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786209735; x=1786814535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nU5U7pC0ggAhLEGRD5uoCl677Th+WwF8riKutdXhP5k=;
        b=oXnGSK1Bd+uHBjio6oVt+0aQEMmPPCAuY98sxB7wQSjlaQA33wFACBwCz3mEBS/ThI
         6p3IYrmRg1W2oN3sicpAj1/Vb+DG5vJ6y6QlSU33i5hAac9ARWltPXgUR+9HhegYqy1s
         tItju6D3SqzuFfpowQe/zHdsKC8Zow+26/e7IDXPwOgLRM3YvdjmeA44Y06Y30FTORGA
         e60VWj6tdP6igBGbBDmdADNvvCmMrWfFJA2d41OWdmdLbxGc2p2M6rXTUoM4BL1//1i1
         ZQp4r+lxwxtxk7+ysMe/nFGPPA9IcLH3FnlQ3kyJXJjh/2L7dy2Xg9/CYNYc5ggTyEeU
         Eu3A==
X-Forwarded-Encrypted: i=1; AHgh+RqzAIvjpqaERETXtg561s/tttK/dMigL2b8AnHww+xOIBZBkv9lPb7vWLa3vaCI6UbKtpOJvJyCpYaxxBKQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzfOXrZy8mhCnFI+B2t1kH4phUzPshr+9S5XDg0dKS+aW1SLIeX
	GNR/dNeEU5+ejpJbbFVZ9H0xJagsK+WflUa0qbyXgOK2r+H4sTEPeHkV751Rm5a5HgSfcg==
X-Gm-Gg: AR+sD12ACVS7sG9E8kQXqp5tgnE9GvofKKl7NsDxb3uYRMOmz1ShnVNf3f5rzpNrpAx
	ipL5K5hYJ/i8wFptLh1f+77oZf43TKZC0I2F5KGdJimKmbck69LpjObDkQytgb+dt6DwHBdVQzc
	qlhTqaV3za+J5ufrGxi9gxNjYqQkIb8AtcHmxCeUnkAG2EXqVpIVhHVY1q7GBaJD2b06lxlT4xM
	Qs0kRwvyhTnyJKIMC55lvgEWPpHyCD/LQm8jFZidPhRefmpfaziH8mg3VsSmqz6Rn+3b0VD8UV9
	jT3KEbXpkzzn5n9XNaHy5i3mgjmtE/OJF/qaOW7E212VOpbie3Kd2REujd1Mp8unkRb/as+jujD
	yX4YzpCRwKN/6Z75b0yN3ryAYhY2zpesQ2O2evUUzKpeFDQFjmHbSuwzoGUsvANuRbor2s06Ryi
	GW/zD5tATjmGvx1TV0CVAaXYjWjV4FddOQghkgIG5GeCuGYzW6nXGthd3hwUKjf+0lGILYTRDuq
	nvyN14bt9yzyAII/qHdVsgxGlfklOyRIo1OJaTqpoIni6Vw/g9LG6jeGC1+3zLAX6ZqJtDg0y3t
	SQZWz9heTQ==
X-Received: by 2002:a05:620a:468f:b0:930:9cbc:7121 with SMTP id af79cd13be357-9367b44f92dmr691793885a.3.1786209735436;
        Sat, 08 Aug 2026 10:22:15 -0700 (PDT)
Received: from JesseofTheNorth.internal ([2600:4041:502b:ea00::1408])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e229787sm408462285a.22.2026.08.08.10.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 10:22:14 -0700 (PDT)
From: Jesse Casco <jesse.casco@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: glymur: use polling mode for SCMI transfers
Date: Sat,  8 Aug 2026 13:22:11 -0400
Message-ID: <20260808172211.137577-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On glymur the CPUCP firmware writes correct SCMI replies into the shared
memory but never rings the mailbox doorbell for them. Every transfer that
waits for the completion interrupt therefore times out, scmi-cpufreq
fails to probe with -110, and the machine ends up with no cpufreq at all
-- all CPUs pinned at their boot OPP.

Measured on an ASUS Zenbook A16 (UX3607OA) through the SCMI RAW debugfs
interface: a Performance protocol (0x13) PROTOCOL_ATTRIBUTES request
returns status 0 and reports three performance domains when the transport
polls for completion, and never completes when it waits for the doorbell.
The mailbox interrupt count stays at zero throughout, so the reply is
being produced but never signalled.

Mark the transport arm,no-completion-irq so it polls. With this applied
scmi-cpufreq probes, three performance domains appear, and
cpu0/cpufreq/scaling_driver reads "scmi".

The property is documented in
Documentation/devicetree/bindings/firmware/arm,scmi.yaml, is consumed by
drivers/firmware/arm_scmi/driver.c, and is already used in-tree by
renesas/r8a78000-ironhide.

Assisted-by: Anthropic:Claude-Opus-5
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f04058d2e..b9db81a19 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -412,6 +412,12 @@ scmi {
 			mbox-names = "tx", "rx";
 			shmem = <&cpu_scp_lpri1>, <&cpu_scp_lpri0>;

+			/*
+			 * The CPUCP writes SCMI replies into the shmem but
+			 * never rings the completion doorbell, so poll.
+			 */
+			arm,no-completion-irq;
+
 			#address-cells = <1>;
 			#size-cells = <0>;


base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
--
2.55.0
