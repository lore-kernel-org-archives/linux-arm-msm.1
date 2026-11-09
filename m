Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262522;
	b=duL2iHLTTsAf/B19GyrI3dAXo2kN/PFut0WLutRIPA6g2g5C/lhe3uK3VzRBMnpCNSpT
	 TDQJCSb8VRitdOT8pLqFp9ygz0qgFkC9vyIbseRuaBTkporQ8xiHg2poqU68vY7VTlQTM
	 RG+G7FmXDpsCPeRcAvrtT03I9+1pAGgEv5YCdnCnmIcK6wbcw7Nk+HdZgj3PaqnEfJaKg
	 eb2s27YEIH4FIXMKpY+ARL3sselxs0YCX9YXKPETmJlG8ufMGku8ZjY72O/0OgnTDYCr4
	 FVbfCLCcJrUONoXFfRqDk+rIu7Q1TWhzdz60DnnqCz0nXpsEw0LWuygENxGyJqUljFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262522;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=r4ARuiayoGmnb3gobGgT6ycbMUSvczq2GaGID26XOPc=;
	b=Yt2MMk805DI7F6Hxzjo+J+x6ooRejlgHH3vX2Rk9DKPpoAv2BXoM4hUdiowrg+xcPXPa
	 YqW8NxLa+P7gl5fA0jU1zlP8XqLm5LNcAEHfQWuieRs2jYWPaAHfqayHnlQfdbOCXRofR
	 uJ30cgS6XO049GOWBvee6NKMRG2wLsIYbzhhFWrj44tzsbwtvhaycqL/3dLagmAF/cwlx
	 +GX6CKvOhqmEKCEOoFzOrfgJxiEwgakK02gkmoThpmQssGYQXfxc+77PxljWhgO1lZjag
	 HwWI+L+SOKqylWeQ655PRc7STqKv/MOuq8F2m1mx0N0BTB1+G7CQZQ54BgTvt41VesA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=RovrZmP6;
	arc=none smtp.remote-ip=95.215.58.3
Received: from mta1.migadu.com (out-3.mta1.migadu.com [95.215.58.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A42606A330
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 22:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A42606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=RovrZmP6
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q8GRugxCN0NxT2mKf+lhcXEmhEoypzxpW7nD5nFeee8=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794262518; v=1; x=1794867318;
 b=RovrZmP6Cj1YQBDypTIF5FVVIEVchsTOSeLItTMPsLi921ny9sbYzQuPFjuGOoM5KUk4T665
 4wwV1DfYnqDYsOQZKNU0Y57VL2C3p3j55KWhvsYbXcTbmeYHD1ReTkwGbQqCOLaH9BHj23BhfRb
 KSvdz6YcfxXYXlhHmJ8PA+/JQe+ADP5OFxLxk0T1taItAA5LiBwzbVV4V2nEU60K8D/AH1X+2Q3
 UR4vMlK8Do+FzSQC2kI7uGjJ5iJK4/CeqZV+l3LFOuXDQYl/BkUygQhIbwUUszzYR46bxGYaLuH
 B/I1sypNwPn14zR8++bYWUxe9gIYV9976QxqRVLsVgDoQ==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5ae3d32ff97ae3f5;
	Mon, 09 Nov 2026 22:15:17 +0000
X-Mizu-Trace-ID: 5ae3d32ff97ae3f5
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Michael McAllister <me@michaelmcallister.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] arm64: dts: qcom: Add Moto G9 Play (guamp) / Power (cebu)
Date: Mon,  9 Nov 2026 19:14:29 -0300
Message-ID: <20261109221453.658316-1-val@packett.cool>
X-Mailer: git-send-email 2.56.0
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

Hi,

this series introduces a common dtsi for the Qualcomm SM6115/SM4250
("bengal/kamorta" platform) Motorola devices, basically the ones
listed at: https://github.com/moto-sm6115/kernel_devicetree

and two concrete .dts files for the two phones I've tested,
the G9 Play (guamp) with the Holitech/Himax display panel (which I've
previously upstreamed support for [1]) and the G9 Power (cebu) with
the Tianma/Novatek panel (will send the driver once this lands,
also waiting for the AW99703 series [2] for backlight adjustment).

+cc Michael wrt the G10 (capri) series [3], sorry to bother you
about a series that already has R-b and all :) but your device
is very much one of the "clones" on the same platform so please
consider rebasing it on top of the common dtsi. I've deliberately
left the SoC dtsi include out of the common one to allow for
sm4250 as well as sm6115.

[1]: https://lore.kernel.org/all/177451576040.103892.16399746050578598756.b4-ty@linaro.org/
[2]: https://lore.kernel.org/all/20261016162912.64581-1-lukapanio@gmail.com/
[3]: https://lore.kernel.org/all/cover.1792840208.git.me@michaelmcallister.org/

Thanks,
~val

Val Packett (6):
  dt-bindings: arm: qcom: Add Motorola Moto G9 Play
  dt-bindings: arm: qcom: Add Motorola Moto G9 Power
  arm64: dts: qcom: pmi632: Add LCDB regulator node
  arm64: dts: qcom: Add sm6115-motorola-common
  arm64: dts: qcom: sm6115: Add Motorola Moto G9 Play (guamp)
  arm64: dts: qcom: sm6115: Add Motorola Moto G9 Power (cebu)

 .../devicetree/bindings/arm/qcom.yaml         |  12 +
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 arch/arm64/boot/dts/qcom/pmi632.dtsi          |  14 +
 .../dts/qcom/sm6115-motorola-cebu-tianma.dts  |  18 +
 .../boot/dts/qcom/sm6115-motorola-cebu.dtsi   |  43 ++
 .../boot/dts/qcom/sm6115-motorola-common.dtsi | 541 ++++++++++++++++++
 .../qcom/sm6115-motorola-guamp-holitech.dts   |  36 ++
 .../boot/dts/qcom/sm6115-motorola-guamp.dtsi  | 127 ++++
 8 files changed, 793 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-motorola-cebu-tianma.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-motorola-cebu.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-motorola-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-motorola-guamp-holitech.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-motorola-guamp.dtsi

-- 
2.56.0

