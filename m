Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445197;
	b=kpfwvFM8IVO55xvVKyS/KjR4S94nzFFQt6aLkM5TtgmxAa0f5p7+qxY8QnwzVGzq/wFK
	 UTRUmxnD3GitVGtZXDx+fjANVeUGyzjJu1avcoNghaNvW+FY3WkSex5Z5xDBdUPxqJnIQ
	 Tx1KZjlDKorD6fDkUeLt9s4JQphFRzDwG/13fJtG2ZiJ3HpGrRuiXpzzc8x5y2n6Ea7z6
	 660lUysmAuWSfDasGG7tAh0RluI1AxgpcGciEC+/4NUVL0HopP1Hw7i6VgBzRCyjujSZl
	 d/DB7dlNmpr9lNLQadEX7AoXI5KHjud8zIMRDI4uoDjxbCqRTtpdsJw7FaIybWiRT1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=JIXavW+q4rKI5c+QcuTJovpdf6c8pfXOH1QwT1FMHYU=;
	b=2gA7BTftWM8NtBcxWO9E2XHPukYwow1/B/kBnCyZDpO1fY7awlegQD6jaJKR1lV9SIiv
	 95q4Yllf9zmFBOeBJloYPlTr/Y38ZAPE2KmZcGzq0dLG902wiNbdQmmgFMPrJ0jfwtEl+
	 nxLEilrjjsrIWJdH8otAV6Azg2IepCfhm7w2OQd0pGmWgXtT9ZMS8oaLxTZElah3IRi6d
	 afe4mGC68TJ7+IiYZdUfJ3BRIAFyom+cXkZwNIDRjt5920cCLfBuqh+fkuelVPOLxWPiW
	 IVDET4erYTJK5qUsZEv6M5hznnk8UteDq28HdVtKr8UEfb8Hw3zk0ZmyuiarpGP1a4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=JYv66QP+;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B03606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2B03606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=JYv66QP+
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c5118deebcfso493682766b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795445195; x=1796049995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIXavW+q4rKI5c+QcuTJovpdf6c8pfXOH1QwT1FMHYU=;
        b=JYv66QP+V0uAj5IpLt+P3FOIffffjKyTJZMalhpAE9NsbjlwOvwb+Xl0yIW8XEjjz5
         +a0q5tS9Gxl8HAbNNCR7xQq0lTCilGyWPPe1/ilHriezJ2xfrL/zXPB4C9X8DMTsIIMp
         QLeNG6TJ/gF/e2nEPFmRCbbwCKTG/aw8qaF7hlRGSl9+jnhaZgGd8Wvv/ikVT1sLbPyw
         8lFCevE3tdrMaXBdWGIFwHsIlqngYWY29g54iB5Wt5LZWx72kR80PsLVv2DAGm+6zPbM
         7roOZuAsBff5h4vEfqoZQpATvnkqgXvjr8WHanDcz72lrivv6gI4XMKtzH3DjCn5uGDI
         BhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445195; x=1796049995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIXavW+q4rKI5c+QcuTJovpdf6c8pfXOH1QwT1FMHYU=;
        b=abK6dBiPFZPSEnZIfbjK+IASN+vcm/seSvWxFSecUnAhIykoVJ1clzepOyxk+Zh5lw
         nSTU9FicZtGw71lRTr7ABzncA4qPfP7sW6V13FkOaE/kcxO9B047Vh/nbFa1fImWfLcM
         P+HvTUQ78fLdKgb7UZQ5faqdsE4b3dP/aIzRdbeZaXA0ddLfbromr1LnDYcqMDGm3GTF
         8dGGpwUDecdz9oxDtD4FopPeRkxEMLO5FQ2kX9OqtbC1IVJa4RhWrzEN73G6T9orEVeU
         coqEocluizHgGs9pfqXa4NTS2cicbp8aMnuuP59KwKaJE0BGGLyabMBmVBNWe6rbbRDg
         /xMA==
X-Gm-Message-State: APuU4Z8MQqQ04vj5ykZ9qd3/6865pRKsrQBd1kKgsom23j5HGif9zGVI
	gJ45UIVk89ij1vIBGb2HAwIklE5dx4xqGONbihsprcXCB17wG0StLazNDA9X5QPZfmw=
X-Gm-Gg: AZFdTZdZDQBb1W32F1QWKHv4PVyuylUW89fgAN4ORncf0qCR238sY+urPsoyo8fGh4l
	aRwJV4CP65WLmMNMCRL8M/jW6x93FnONXeog/BC22PMMeYxSvcTvB2bLoDWuNOMJERflBWGoRFZ
	LD88WHk/eZ8xt/jUE9fmIRqAkRuBMOuhOXk+in78TQuvVXB1riN9LNrJXZigKidY/18TzViYVyg
	WhkUQPzby8OJz+d0+qJWuH407cmxAyxhaiEymZxcRbf7HbRfy8cVE3OUvZ7bwdprcZ0Nlf9blGS
	cW0RalNOtkJeOSVG0tm6DbVt8NEblTXoqPFu356k1n0Lh+nfaUtCWP6Ie6lU2bRrz3CtC3OSMna
	QWK+HRoUVuAzQY5n1BlNlibJ8Egq3WXw7njsiWOj/cVhj4xMJKJCn1mUaHbHVyyS8kBotLu3Bnd
	D5vIE+JKJ8Lv0LxqyBJag9dlC7MX/8xbURlg65vRcNaX2XctS8sDU8RrD6XM9NoZKJh0hdJNg8c
	SeU14HSvWlbldzq3KOf241NKxtpid8tOKXhIyFZDK5g4Y9IdxNCEVX9wOQUpCoIfLCMEbop5j0Z
	76bvHW4HOLST3l4ldSSdn+2nsumxQJaYcNpfY6HxuZNzuhmoR/ohXDYNATS6Oig8ALdvbPm9Eio
	xHtjIhe8=
X-Received: by 2002:a17:906:3b94:b0:c26:1649:47ad with SMTP id a640c23a62f3a-c513ab209f4mr755332866b.35.1795445195058;
        Mon, 23 Nov 2026 06:46:35 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea3701sm433004766b.48.2026.11.23.06.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:46:34 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 23 Nov 2026 15:46:33 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: sm6350-lena: Use QCOM_ID_SM6350 from
 qcom,ids,h
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
Message-Id: <20261123-sm6350-msm-id-v1-1-99482c9ecc48@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445193; l=1314;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=MioatHSL4y0vJqbIZo9adAiprmtkveXc0RY5gOeh64A=;
 b=SV+ZTJHMf9QlBLfDxTsw9zKgSDUnoBlSmgiDdiCbTMyQiO93Oq0oqkW5zNt3bohtXoxhv2sd3
 NWwUb47JMGwARaApwwyU27UXRbHCcqVkEVzBXaLYi/Z49tuxRtwikn3
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

434 is just the value behind QCOM_ID_SM6350, so use the define to make
the meaning of the qcom,msm-id property clearer.

Also while we're at it, drop 459 (QCOM_ID_SM7225) since the Sony Xperia
10 III only shipped with a Snapdragon 690 5G, not a Snapdragon 750G 5G,
therefore the second value of qcom,msm-id is not needed.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 6e2bbf4f060a..a5072496332b 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm6350.dtsi"
@@ -13,7 +14,7 @@ / {
 	model = "Sony Xperia 10 III";
 	compatible = "sony,pdx213", "qcom,sm6350";
 	chassis-type = "handset";
-	qcom,msm-id = <434 0x10000>, <459 0x10000>;
+	qcom,msm-id = <QCOM_ID_SM6350 0x10000>;
 	qcom,board-id = <0x1000b 0>;
 
 	chosen {

-- 
2.56.1

