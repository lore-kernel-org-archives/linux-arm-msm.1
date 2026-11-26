Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678840;
	b=YaY0VM7NkImdT5PzhsW75/117u8iN7sX8pMQtHgvc9njHMx3Hyy958oeMmtp3ze1PNJ5
	 O21qW2B/iBWqMXpjIjFo/cL4CHMojJBggM4QN4caBzcJ/Gv6/hz7c82jbrc1SICC/2mHR
	 bP8S5mHo769to+GGuPtvguVTk0ltNr4fPN8oFk7Yc+nQ9vQS4Cg+eScCCXarhlPll1zPV
	 ZFSRitVL7eNrX73W/G1ONTZgaBceEnM4SqLvbNA7BWegYP5Z2ZKDHeTC5QOObrLGwf8WH
	 a6ij/cYfxQInbV/L370gFdtSk/Lkr6bgEb+f1Fpt4DyCfGXNz80l6yrkE4tBROu6lVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=41zv5RzYIPm5yVXR4qWN7+yvtS7MaY4Uz8JUaUkw5xk=;
	b=YAiSVkI/z2PUapgOwQg1kUF+oT6jGtUbpMB5NSNtK3P3gXdXzITmHj0AeH7s/DAEjFL2
	 05Fhe39K82CprwPAUMcV1coIYY7oeFf8Yahv8QTkNz2V4lsmeQQrDSSg6hNajbfdDS8qc
	 6OBxKZqZFIvm89nDYQ2EmBAnCl+eXrVCGwL4CVMiz2AW9vXsKNlgKuoHrolCnOYw/PXFn
	 JR+K1qmfriUe0z80EDeeCHET+V4rPObxZ/uQM1eQFikau/1jb3qi1z1/J4CCdFfZvF5+W
	 +rMf+VHiCuErENW1SA/lDKZR1UdO4e5QlWdS5PpyIslVk+IDnj4Ndb/DJmlcQUgpDGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m+i9gdUR;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C335606A32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C335606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m+i9gdUR
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c00b0866b0so393057e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 23:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795678837; x=1796283637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=41zv5RzYIPm5yVXR4qWN7+yvtS7MaY4Uz8JUaUkw5xk=;
        b=m+i9gdURt12WvcYA3+Ma7ZMye6NVvbXEljn0s4sToSjmsJX6iqFzLVeKmPoc2VWo1q
         DVWxhYrliolRwFL/bkGHdsolf7+nkv0N2r+uGR1Z/00MAMQws+qfeDb3BC9dnXZgvhjP
         xYXsFNLcXoT8z1FxAhjDKPKNoQt2XvWuvFKoG8gyXQEp/TI+w/G3egBlFpvsiUIyQtrk
         5iHynqxZvVRLS0XHx+HZfR+odjwskybTAgAIEzrNpHdWd/k2VOUkzrv/6mug85t5mvlZ
         Q5kqP83zNMBdtc28BayGQA/zqqnIBAIG3psVVaUG0SiZ/eHusCeBUhvgHnF2MfB++j2M
         XsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678837; x=1796283637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41zv5RzYIPm5yVXR4qWN7+yvtS7MaY4Uz8JUaUkw5xk=;
        b=xfxJ7Sq3+0aDqc9PfrIuiRFmS/K8tn18B3k+npWTDq+5YAd6WDFWvble+vWng29t3N
         lhKCgpgqj1XuEFirR+cxJkmI5boHA7DJ/OY5JHihSlX0AsPgKcaniIFJVHpvRqvpePYs
         6AGY6Mcz8P1DWlscvVkUg+auQ1lsLAmcZV04x44pM61jtwpURtSBWWkB3f0VmwQ6F8he
         D47uD0PU/WHmzfB9I3oOp5rLHnvyMbzxvK/erYMqeThA55vWWzYtoB5nOKxjdnDDSF98
         jr77T0h+F6fzzIe35N1KRfi0bPf+s/2tfFUi/s0AKgVF1xUFFzvjQ2FCR0z9V55aFYC3
         udgQ==
X-Forwarded-Encrypted: i=1; AL+hErGO9xw61e+dp8CmtybFv8L55OXd1fJQlV27mUqTm5Kj5rBdF7/av9jWaX0oqR0v2vfimGBdHSt7Y4AegyQV@vger.kernel.org
X-Gm-Message-State: APuU4Z+jo6sMqwoxp+k/hxWcZxWkfxGc2guyCJ1LRVqdK+HJR4fR3mA0
	XPys9bb4iyJJuUkiTP6AhkEYwEfJGbxWjqrD5d+3tMuBCbzwYX6nqrkTNlkTxrfihfg=
X-Gm-Gg: AZFdTZf2L7WrdDeiay/zEsq6KoRm70CcbvvaKXa02AE8cnG+ysvUTOU6jAlLOfGCbj/
	PmVNw3/ltBwws9yT0hVJfLbwW7CXGBXFDfXVEDNFzUCbx8ejeJT5sAYp32qeIXkVBVWOcJU16F7
	Oh1D00tT3K5VPzZguTLv4Gso+QfLoU8B+vqp6erN1LCR+++UHY2L1ITy9SWDtxKAhSTQY8cC5ut
	d53qLmovzxTs6f+4L/nCw1xp8KQz+zXk33zAX2ex4g4HsOr5M3zcJDUpEpe46cdY8phTN+59SDB
	IVVzckiF3B5TH+6Ica2wES9S5rAwzZkHVQ7W9z+pQ2FcL4qkbO3FfmnS06xXSSSRr5hDlwx/Mra
	K9jeFyDIAv3KTtFE7YLfJYwGqCHRgRoC3cDXQ49LKFomah+KpBT7k/VEt2qgIbSFUPcA+PFRSqx
	PHvuwBYaWa/YheX1N1frLhLUCB/hS+Jpio354YFTdk1a+kELJ9YLbwpLwSQNIfsCrYQln2f3g4j
	BJcqN1A3VOsE3Vc7f4JHg2NUi+DyFBM3MHzZGggHkSLE9hiHLQarPOgLN70mO9nFmWkfRYe8dPW
	R3d56C+5BCtYOL0y5ETKzy0uZS5R73PpxGpNZKqSdR2kuTlQQUsCcaqjZ8tw99qRhWHXOAFQ40S
	VDszgPPMuJEHyNl4=
X-Received: by 2002:a05:6512:318d:b0:5bf:d00a:b6c0 with SMTP id 2adb3069b0e04-5c1bc78eb99mr7625087e87.3.1795678837561;
        Wed, 25 Nov 2026 23:40:37 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05e235sm4984521e87.64.2026.11.25.23.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:40:37 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: gcc-qcs615: Fix GPLL0 AUX2 parent of CPUSS AHB RCG
Date: Thu, 26 Nov 2026 09:40:23 +0200
Message-ID: <20261126074024.1440367-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
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

The always-on parent data of the CPUSS AHB RCG lists GPLL0 twice, while
gcc_parent_map_0 describes mux input 6 as the GPLL0 AUX2 output, which is
modelled by the gpll0_out_aux2_div fixed divider clock, and the non
always-on gcc_parent_data_0 refers to it accordingly.

The RCG frequency table has only the XO entry, so the kernel never selects
the GPLL0 AUX2 input itself, however if a bootloader leaves the RCG on it,
then the clock framework takes GPLL0 as the parent, and the RCG rate is
reported twice higher than the actual one.

Replace the duplicate GPLL0 entry by gpll0_out_aux2_div clock, as it is
done in the downstream driver and in the other GCC drivers with the same
parent map.

Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/gcc-qcs615.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index f205de3a9361..4c7d44187dae 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -229,7 +229,7 @@ static const struct clk_parent_data gcc_parent_data_0[] = {
 static const struct clk_parent_data gcc_parent_data_0_ao[] = {
 	{ .index = DT_BI_TCXO_AO },
 	{ .hw = &gpll0.clkr.hw },
-	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_out_aux2_div.hw },
 };
 
 static const struct parent_map gcc_parent_map_1[] = {
-- 
2.53.0

