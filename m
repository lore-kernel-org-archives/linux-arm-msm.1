Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779341;
	b=hKo5uPYbskoYALbkBeW7FyZGPo+2CyNzI5UYXOgVvwtlwXCasjY6eSF9q/BPuxNPlznz
	 SYw2S3dVoqOxYS4HqAUWfgOJ3rYEMXof8V/tJqOSD7FCBN04MGWzmpdr/LHhmE8L2Uskf
	 GahC8HsLPNDU/rSP6uo1lteSHLs2anJ1bZOpN0AuZipj42yFXdbiZ+TMQp65g9DrgSqyX
	 Q4Tu2ERj+nnB3lHF6ncTHkudawhoCyBw9lKe7roZEvSt4VAzAmXAgosa2PI77OJXb5Is0
	 fLu0TRtU+/h693S7vOu7WKPdPUJwA4rLHiUtez6T8lQtX0jYcyn0x1fDW+tFgKNRn7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779341;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t8uP9Ly29iloNSXoPoKSZxb5cyB9+X0Nbm/O6FRZ1K8=;
	b=jfN00W1GQ61eKpr4B+DeqwXKV82QzFMe5W2b7wb9TPpMAjcVgLD/Fxpyl5WXiXlwZoCL
	 fK8kqM1zFLdrB7AcibgOwwMPtUjurPrN4ahJiN4xh+ZPKeYHVPRva3w52iCNty2nXVKXS
	 KopHDQld3aHvFurYGd14nauUsITCiB0C9KCJZLCi3khAd2lHL+c5YIFrN0DqSm2kmhS0T
	 ORMY5OljhtCd7Ho6Ixfatne0Jl30/Fpd5az5Us/DEpFdKl2wnhoL3o/M16OwWWpx6t6+w
	 go93wAHxmJ/qODxu1ueVUcJ/7zGEpE6uGZd0RU34yCvUJc1NsW5Ta7AO9UFtGiWVeTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=cSsaQ2ml;
	arc=none smtp.remote-ip=95.215.58.68
Received: from mta1.migadu.com (out-68.mta1.migadu.com [95.215.58.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F5D606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 08:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49F5D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=cSsaQ2ml
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZlrHENQm7ZQStJytmobgsP2mX//JSNUxTzz4cjrG2JU=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793779338; v=1; x=1794384138;
 b=cSsaQ2ml9zSzb/3UkFLpUz/LAyJWdM/8EkI2w4iYup+fDE5UMmCm+cT2j0Yvr48Hf2inC1DZ
 hkEVLInA3jD/Z40fBRsSAcJdgtscwupxrih4iYKBWGRoU50rtvc9M8iW/LRbW82eUu1NRapUYia
 Jtg6/TY8jbTxDmQAIL12LOr6j9otWcMbGkh9IooglkpEQH3K037V3vHupEXJlNb2nj2ntPZUnnz
 E0WdGhmEgLNCKhzqMPouFCWzUZvPd0IN3DE1lLG9A2XqN8753OMz4kwDQ2miOpVNN6B32i7DAFh
 i4LcZUU0ATJYLAfAXM1N84FyFEXsIEqMFHTKJIo6Qh+yQ==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1f6a471c368c48bd;
	Wed, 04 Nov 2026 08:02:18 +0000
X-Mizu-Trace-ID: 1f6a471c368c48bd
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 2/2] remoteproc: qcom: pas: Add SC8180X SLPI compatible
Date: Wed,  4 Nov 2026 05:01:41 -0300
Message-ID: <20261104080200.135431-2-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104080200.135431-1-val@packett.cool>
References: <20261104080200.135431-1-val@packett.cool>
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

The SLPI on the SC8180X is identical to the one on SM8150, reuse the
same data SM8150 (and SDM845) uses.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index cefbe8931407..775a522f6a3b 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -2042,6 +2042,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sc8180x-adsp-pas", .data = &sm8150_adsp_resource },
 	{ .compatible = "qcom,sc8180x-cdsp-pas", .data = &sm8150_cdsp_resource },
 	{ .compatible = "qcom,sc8180x-mpss-pas", .data = &sc8180x_mpss_resource },
+	{ .compatible = "qcom,sc8180x-slpi-pas", .data = &sdm845_slpi_resource_init },
 	{ .compatible = "qcom,sc8280xp-adsp-pas", .data = &sm8250_adsp_resource },
 	{ .compatible = "qcom,sc8280xp-nsp0-pas", .data = &sc8280xp_nsp0_resource },
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
-- 
2.56.0

