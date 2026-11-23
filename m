Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445197;
	b=qvfK0heisEnL7/n+tEH0XCJCw5lD1jqQ36lN77dI7KEEwaHQpOJ99wZdx2iSPn7v9q1w
	 ThTw0Jnhe5M/CCuUIbmUAFhQzWX5Bb2BDE5yxThc7hla5nNMSIkH0bEvnLJLJ25/A5YSD
	 8f2EHn1itcvVSO/5MrE88W6QvqqyZx63kVduGl7c7fkxPvgF77pXYVsHyxhtaPCBfhWVl
	 NyPIPv2kseN+/QDTBQOY0n1Z1zMA0MprxlW3YMtvU1zsQdtuU1Y730ke3rzDk7fzGEq0T
	 9fNw8kp3qi4sVrPplKtfwAXp1Po6J8Ba2mnSLokWF/SzsMtetF4IHAG59+uN+UgDXWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=0ja6aeSTc/PgeoaI28A90Kc8rq1aEZM4hyzn2AyMUoM=;
	b=CFXhpY57i2Y+wVV/5zRYWcSEkjdPYnRNcf/n4gGU1zQFlM3kb0EIapqw8efJF9mbEmwz
	 lqYbE83VRu585LGW2ldFYf3Cx2/t5BPnXxyHgnWorUh3T1j7IEIiLWRscCmbJmyW37/XG
	 31eW1SuZL5aSr2iFFifq65D5App4HpRjmBEMDXtGEbLX71e0v/dZJPvn5rXBj0306QnkY
	 1iR6i+YxGygc3XURKm1Zuw4w9OS8NS+3JRPHjDRLUu8ngfFUufk7D9JiqiupVxM6XZr/p
	 dzcLxS/7Zt/erL0gKYxvuag2xo7BGxP45PWtr0pYLABc+aF5lxVyWzO5UMx/tDhfEQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=1Iqqepd8;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389CB606A32A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 389CB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=1Iqqepd8
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d581da0aaso454705266b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795445195; x=1796049995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ja6aeSTc/PgeoaI28A90Kc8rq1aEZM4hyzn2AyMUoM=;
        b=1Iqqepd8tSa+TTje+A5rSo9oFKO5k/gnBcsj3RQLV3KKa1GJjhsUK/NeLB+7S6xB2S
         Z7Kg5Py5S5e92Yg0UQgiJidPRSx6NwDmuVpkJExcc02rd/R7n1tjfvNjZn5VOqegz4tD
         EOPcHMhYf5gDxtEJ0OhCh/LBT4l3W5Yb8dl/GmaGk4zgu5U6qlBO4Fk+fxilKt8moUIL
         W1WpTyjeNkcws2DV00/CsGMEHAFF5yA075pq5y4hnXWKotT+pQO66xSjM63pNyyqHxIc
         Yrh+HJlFfzaO3djEnVYfiXsLZnw1J9l2sO9F/GgKrNR/G7YjTfS0rTujq7/+je5pWz8H
         5fBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445195; x=1796049995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ja6aeSTc/PgeoaI28A90Kc8rq1aEZM4hyzn2AyMUoM=;
        b=J3empWXnyOx9s5Q4GUIkke8CS9yIvN/2qW9Ykgo1AA3YNMr19OJw7DcLdGDnY2+wgu
         JZ2lcukOcD/0OsWxoujBAKlLVMRrkUYtme/GP8jluVjnQ6q9gzH9s6dna09BARPbS7u3
         xh9NcnGL3fIq64Qg9xfDvXiEsDC/SX3M7SffolXqdeousTXWH1EK0ee2HJJf8Q4jRHel
         3qCNtJFLhVgyaUyTuO8EcKQV9HfyHfaxEhSKQ7tljlbdCoJ6fzuOelLhoLfYF/1BYWWV
         a1+ydgJhWXeHw4zR2yhSx8moZuRoeN4dHKghfAW9rieFx3e+3r2rWveEcpzmSQzek9y1
         /SuQ==
X-Gm-Message-State: APuU4Z+A6MRX92g9K+gj805vpxD8ukcyJ6f00QTFHBAM15Gy2YmVUqSG
	CMDRnCcoxNJeHMdZW6ldladtyzoOYff7oXyutrWE+N5eqmFyaz41mFHgn2ryIf3GOtA=
X-Gm-Gg: AZFdTZe23fkUDQv7+qJrxrCxX5PycoYvcRCbmTHdNVXsDEj4YqjY09yqSq+Dw3ByzIA
	KYA0iW0Isd47uAlF95y0Id5x1uTEUeOcrY3Q6S80VVO1GRxYzfW7xwzWE0r624b1e4d0Xyw1Rr/
	NNWvK2WYqD3Y2AYx4ZkbXlnbUCzZW4/TOrrCLRekY/K29DP/eWYE0bnOfLu/yLu9wH0hwEkxabT
	t3+mv2pIVmnfLnu0iHBipiI9+lJqwwMAzKVTj5tVn1kS/xz/rFP6qmBquEOvgcaV8q5fB3TmQBi
	CajGXsJ3vpiz8LMyKG+zyyq+TH4UnD+7VWmmj//GVQtpq82SrCMfjZjEKZzlf5+vrstAx7SsUtj
	2WxqoDjP5tafPnQs4r3rlt0pQFomTHnD96/OhKfDm4WjReJJNbBuS2b6oLpLDIwv4o/++h7mLxz
	J9Yrms04k/KymV+4hFSw556RdiyjVYDYStC6Z6ZA6HDCR/YxSoyoMFqFoA8dAMDdXM6qYcyoSyh
	Z8oeqzg+0778vEutEJlmGNNCcSY+OQ4+eGsI33YnSVwRC4ifgzwWEMp/CcMyq9zMBK6tzy/uMwz
	bhPkGg2T4Ud5RwuU1/D0X4HUbNm0bY9I1KSeTSsPKu1juNLsTF0VrIaGTmkc+H5IpYF3ongoy97
	FUBmOYxw=
X-Received: by 2002:a17:906:3b04:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c513ab47f35mr751490266b.35.1795445195575;
        Mon, 23 Nov 2026 06:46:35 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea3701sm433004766b.48.2026.11.23.06.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:46:35 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 23 Nov 2026 15:46:34 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: sm7225-fairphone-fp4: Use
 QCOM_ID_SM7225 from qcom,ids,h
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-sm6350-msm-id-v1-2-99482c9ecc48@fairphone.com>
References: <20261123-sm6350-msm-id-v1-0-99482c9ecc48@fairphone.com>
In-Reply-To: <20261123-sm6350-msm-id-v1-0-99482c9ecc48@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445193; l=1110;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=4K191NsERnP8+lkYFGjVBIqfhrhPmFZIhdoETVgrVQk=;
 b=xeGceB1kyGr6UXT9qc1Sy1z7PQr6yh9WVgT1ifAzyYK0Iln8NTvdjrBAtso7Sjemg4Ny7vyha
 j4Bwu0S5ZmRA6a67CMSkzzr5Bjma5X0UdpOlwK+p9lghxXZBW3rKNXg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

459 is just the value behind QCOM_ID_SM7225, so use the define to make
the meaning of the qcom,msm-id property clearer.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 773304b4759e..bbfa5f76bc75 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -12,6 +12,7 @@
 /* PMK8350 (in reality a PMK8003) is configured to use SID6 instead of 0 */
 #define PMK8350_SID 6
 
+#include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
@@ -33,7 +34,7 @@ / {
 	chassis-type = "handset";
 
 	/* required for bootloader to select correct board */
-	qcom,msm-id = <459 0x10000>;
+	qcom,msm-id = <QCOM_ID_SM7225 0x10000>;
 	qcom,board-id = <8 32>;
 
 	aliases {

-- 
2.56.1

