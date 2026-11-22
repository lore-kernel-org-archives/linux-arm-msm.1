Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368956;
	b=G5NaNvIyG4ytEbvTFAgdTxpIc2wmKnOXTM+MsfdcV8OHGaZNHwf4BrTjH1ni6Ldlv2Fq
	 KIvzp7+3D5fWkeOunLXLkPDlZ3y2BvtRFe4s+BLZPQgVQ718KMLJE0Tjjrm6J8GnfYwrc
	 7utJJQ1dQewaxPyV/Y8ZUZQi2Fd7Z6pZewsGa6spa5A1euu/9oJYUh28mmcMB47N2U3PA
	 2NdNEBI24/PsZER+gOz+x8hSPYE2aVbz7JJR0c+m4QrHW35ZNPO88B/7zR5RxcxGOFvm/
	 GAGyEth6j3rYyf74py4+5cxx5vmtwQbes1ofCZry7dswXjUJqHi14+GJk8Nf1DlZb2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t+GouGnPJfECXmIJYX78k/uwgPhvZezU2VNMojKprrM=;
	b=2ulDSqyZVekGXWT7VYWLenFa5yZpfPUGqTzgyUswHSbq31Q88SW1KO3sZx4grYqDshjQ
	 8+zd+t7GvxhkQcInqEy1Dr501v7vL8pGMT2f31eEhd4/7BT+RbZ+Qq30AFJE6jiAa4yX0
	 0TnT0aMx0Z5VBl3S6Ee46b7NFycL+WvDmN+b+7r2zQZpf76/u8iZKamyqT7RyabNJ+wBt
	 guALmnQw4SjimMTQ4vXECo8OdTj6OAI4EvTfp9zmSvIBIQjJd8zZRDHHTQVau/S4FJw7h
	 cS0xbcm6GjVnf1MTLP6g+JLj8EK6jSXpHSx2Ch64rvB8dO9sXKvcsBBZNQ7bzhjLUEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCy30Koj;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B951B606A330
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 17:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B951B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCy30Koj
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2af4c8d00so4562894c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 09:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368955; x=1795973755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+GouGnPJfECXmIJYX78k/uwgPhvZezU2VNMojKprrM=;
        b=CCy30Koj3yGMktI7EOf5/TKNz7iYG67TRpkRh4+WyGd767qqOqi2odsV0Kj9RgzdpR
         0MSArWOqWa+qgM+DG05fmhi9iCLdhsBgQjyWvfKvR6CvHw0Kw1swCXgJC/I/7YZCBFAx
         RZsTHUXrF++DcIHmfu48ehUSD7lTQd/teBhoG7/svuDH6wVGUUZoRzezr2+ICHNgB+xA
         7B5kvhbXX+rswGCJVvdZwKkoJksBx01YiTcQfMMqQbNarj8hGRVzKxYKOSZ4BfgjxYel
         89B5N+j/zhAHZO5DrKcXigl4LPA6/fMZ8gt8HzA39nE2qNvNiOa8oD5wwUHgzPz4oTWv
         z3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368955; x=1795973755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+GouGnPJfECXmIJYX78k/uwgPhvZezU2VNMojKprrM=;
        b=naTSO5QQBWbMGbmPwxSvf4Rs9xcJPwnXFJhEcd7iiONHNWefGvY/CzGoHEIUtAZkcO
         pYcr2hDCw//ZupYGly52FySINGjOBByWC9iAh6AxWczln9UcqgOQ6M72jExayFhTh063
         ZUoZ768GLLFMPKWCpwo6SI4cU1kFkLW0jhvzD60CQCG0SrYOIDeZnd3TrzbB9A7EjZVi
         z6ldFN8u8aEz5HbDNsUvWiJQCbAqLYTo4mtM8MRUulBOSOOgvIvT2jUq1W1q2xmxO5oc
         jaHN7/mCQKlLWOPmtsg3QLx0mtMfNbvIjlf0J33aET30+nkSyOkpazTox/6tBmYVuwU/
         QZ9Q==
X-Forwarded-Encrypted: i=1; AL+hErFdoQlrGq6RQFdW3mCRgDJOF+0duWks8Mm3ZDJ/JA7u4sTxBEWINhUozgWjCyJuZaU8AkTyQAL4N1hZjz2H@vger.kernel.org
X-Gm-Message-State: APuU4Z8A5+xBuZhFgt4+X5CfOEIVLyG/YaOU5/LQ5SFiEGMVePpJZMrn
	a16wtJJVJ7IYJ9oYlUlv26bYkfQeYzNkxiP1QCxHHnpKtkUwQ7VbLERW
X-Gm-Gg: AZFdTZe0zayaJF9dG9bX66ZEPSdM3Yd2tYRyF02mTVT8923UKHgF5U/kYhfGfGq5A6P
	/OWaPyRwj3NgkuyEwZfNQ94dtM1hmTltpyWovel558/myWbQ7hrw/Ny7HbEOE06aqjsQ1qrtE3+
	tQQyrJg2mukxL3e5GRfEpZtzlcpfNKbWCZoU7P3ZSiYdsVQTTyI49BCSzofWJ39NsyKoKu17Ysr
	ztpEfXK+OP3qeW0cGN7dor6mVw5nn5ZJdkkhN49Wf26A5zhSVYRJxAsqtEOMyvt6KSvH1nZfrzj
	+RThrTl0HukCwoHCfHatG83UREidVocXtcYWWwQGs7Sg+Da/ltne/++/mSRascJnaetV8TIPn6Q
	flaAD15x5xf4ho+w8kNS0pNiy6ZXCMElTcU7bFTdA6/fHhZ28HYZ8YaElx7xqxxmz4f9IdOKK3D
	y1TpFLlsLxw1HXIrBv0T17j6NO65uiYeaVJtTYnmdTsxDLqhDINTp/cV802dCFJta4GZHhnGGh3
	e4CIHvTeHrT4lQOvVxT+Pe6p7RG75fV4n7E5tulC2lLVQW0YG6mv+obXPgGmaIU3gJ4TLjZ5XS4
	BO0vDxa0yRBZPGDuWlHXJkhscJJCfO9n+JPWz+v8+4BdNDRDcJymg4KOoL6Qr5tUvjigIT26G1n
	oynjddwKv57m/qsEUg7rI+yg34oaEmtfozVK/eH+01pNOde5X3jLt1qeY+QrjbFr/6w6d6onBQS
	/RdcjG8lzpdQM/nlhMiGUVM8VkhA==
X-Received: by 2002:a05:701b:260e:b0:1a9:c52f:655c with SMTP id a92af1059eb24-1b556900476mr10503800c88.36.1795368954863;
        Sun, 22 Nov 2026 09:35:54 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:b842:8324:ef7c:136d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm6419485c88.4.2026.11.22.09.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:35:54 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v3 2/2] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
Date: Sun, 22 Nov 2026 23:04:50 +0530
Message-Id: <20261122173449.21009-3-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261122173449.21009-1-surajsonawane0215@gmail.com>
References: <20261122173449.21009-1-surajsonawane0215@gmail.com>
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

LPASS LPI gpio5 can mux EXT_MCLK1_C, but that function slot is left
unnamed, so a device tree cannot select it. SC8280XP already names the
same slot ext_mclk1_c.

Name the slot on SC7280 and assign it to gpio5. The third slot stays
empty; on SC8280XP it is qua_mi2s_data.

This file also provides the SM8350 LPASS LPI driver, which uses the
same pin table, so the function becomes available on SM8350 as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index a61df10d4..278d5fac8 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -34,6 +34,7 @@ enum lpass_lpi_functions {
 	LPI_MUX_swr_tx_data,
 	LPI_MUX_wsa_swr_clk,
 	LPI_MUX_wsa_swr_data,
+	LPI_MUX_ext_mclk1_c,
 	LPI_MUX_gpio,
 	LPI_MUX__,
 };
@@ -77,6 +78,7 @@ static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
 static const char * const wsa_swr_clk_groups[] = { "gpio10" };
 static const char * const wsa_swr_data_groups[] = { "gpio11" };
 static const char * const i2s2_data_groups[] = { "gpio12", "gpio13" };
+static const char * const ext_mclk1_c_groups[] = { "gpio5" };
 
 static const struct lpi_pingroup sc7280_groups[] = {
 	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
@@ -84,7 +86,7 @@ static const struct lpi_pingroup sc7280_groups[] = {
 	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
 	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
 	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
-	LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
+	LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk1_c, _, _),
 	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
 	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
 	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
@@ -118,6 +120,7 @@ static const struct lpi_function sc7280_functions[] = {
 	LPI_FUNCTION(swr_tx_data),
 	LPI_FUNCTION(wsa_swr_clk),
 	LPI_FUNCTION(wsa_swr_data),
+	LPI_FUNCTION(ext_mclk1_c),
 };
 
 static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
-- 
2.34.1

