Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087516;
	b=Vcor6FkPMVS9PmqsBgP9yzJIQ7P8kMF2sn4SlAtaWAOMgSuPlTsPsFnaT10+FW++EUMm
	 cUq6Mg1UDEaDB/zw1AGetJeEuJ8YEDlN+2VDvPEoyEzBDMNFPN5pGRkTQBfdX2au8kXk3
	 ZU9qpsHgSfZ+ytNvIYw/6b23/oaksw2982De/7NEH4pTTmX6FmS8JumOefvYrf0HpF9gK
	 fpGc+e0SXfRF8/1ZhEmfk6uxOzsXro8BYkLaFoZKpUUKK74jTlq3lReseSlKYe/UfoKpU
	 cMfBDNLpnqT6+sxIkhejxLf7NBTHOrp+V5QRbXT8uk7X5Ve5UVL6pLxaeawkSQz/T+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
	b=tuFpydXvKiWGq5w8ezzaZjxNybURKOY4Kl/0yA6GYQZJswXf5pbrIANSO+/TUtFBEs7G
	 ma/wozctj8JLV3N5wDcMvtBicbUukywboDbC1zOa6WYj4K0/mXG4iEsPN3/DJk0719gkH
	 mVSLDddJvYNDCx1pz3/moSnF37v39NhA7M1OcJqIm31F2zOJoioQRNKEW9He76qFML1w9
	 ++ncgpM2Oi8tmRXks4/RywUCO2FSsWTlogE3WEW78f6/iPFqTsgRsbD5gs/SL3rlF1nzx
	 C9vbefxLdYsFLXYftXotZi8wTSKTaY+73KJGN09HJKZ/Qp9u7cpniZArpNs/mMZsftA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Th5NzQaE;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F22606A325
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F22606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Th5NzQaE
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1826904a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 00:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793087510; x=1793692310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
        b=Th5NzQaEUYOBrvxS+t97ujyJ6xOSEnTatgCKODt3mTYxgxQXhwzVuSyc10yg7JsvGl
         0KSn6LlWG+wu0eJmO76dVr3pid9UXbQMAPNYvi2RXhW95Gyu7xL1VDPrtYBOwZGuB757
         4W6PZeiP0hzZMNIvb9v7uLNgH8EbH9XOCXIjEqOpBMJ4/6Aku0habhJPpWeIi8K9fzcb
         wdbW7pKb+qmqea+6E2ZNOXzCqxaVeYMyDDTXjLdh3Uj8YwmL5zcb5ghSEOtcznibSOiw
         OM0sA9DFVlaaMZXUSGb0B2kAPSaD2HFuWMiTb7ZCwS31qdxVH8CWuyPw1Ci5moglEebd
         xw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087510; x=1793692310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
        b=GA9Lny8PpYcee70Jwn3wU4GEh/neiV1//KgtjFwemA2jsqEx7bBueqx713EXL4N0Qf
         ysnJ9Ac4bQAxiLAMM53WgPaY5sCg9oKHjTwTd31s8K9uMqnoAAPtSNDEC89JfuMiwmbq
         N4XK1QLJKFW68kbrtc7cgaab4H2tqoJ/wtXFf3hUcEEuO1Ho9HiW2JSOzw+ZdfSphGP6
         MjgwunfmDnxFMxxYTIoRRdFTHU/Wsz2wd54SWnUuCGiwsPFdfVx3H9cifCPnlxrtzD/I
         m1EAzGx9k1JA/0+xnG4yM/el6WPuUDcqG/mPVaTg7LobF32ipCnVr/syJQmBHUcEhjur
         sbxg==
X-Forwarded-Encrypted: i=1; AKwUvBxDtSJPxe02nSKKAetT7FysGlnWaYZrBLlK/jTs28rpLyUgmhP6ofWt955ghxm0T8EcTnE4636S5Q6N/Je5@vger.kernel.org
X-Gm-Message-State: AFq9FYLZvApb9dqgcD15hLoKzilbmHOlr+2oGa/R1On35nnx+1+gfR12
	W9PTtvykRmLWgSLBZu2XqlagnfwsrP6LkqGnceqdQhsPgm3ODJ16CJUs
X-Gm-Gg: AYBFou098bTtkM27EImeNpMI/GzDD/cwEnMIYHo8F+GsrYbCKgoBisgdxzuADppXLRA
	A5Cg9GC5O452yIxTS3DgL/07s0kDWBo2vhQuhReIgbSCU5S+rEdfBm3CJjECfpdTB/otBw/gLER
	qlVBUDNLh4TxZGnJq+id45zRa4nNS2sFXzxbOBfKsfmQdHRzqiadotCN7ycHsj+PZD8waQ29I0M
	97seAffooUIM8Au1H2nXkSeqVWOZu5redq+9KAQwvy2JXhPWZ5zeK8hLKzgZL3Y+wwyIWFI1WNV
	QbZ3CsSB7N/0GgFo9lkIrElbhTv/m9WP1vh5QbfwfTjxMwcjU8kT7otRxON3pWMBROc6kqQ93dG
	xI4GuoyUkCv1SI6YVRk6vzGNhh+MsVZVOf4JhM7zPUPLhv1HppaNxh5A+wcJH5818GubhT47wqH
	AR48998zjFksw/NAdsBJY1WrRuzwjaDAzHNA39IhRWkmHBSXdJIal4kKqrdojzNnbllaCCWUNhG
	LhAJAYkAbcy0OBGNOr/R2Vjy08TlP8x+8ybn0yIrj+6blrrTweNw89Izpc=
X-Received: by 2002:a17:90b:560d:b0:3ac:9ed8:f30d with SMTP id 98e67ed59e1d1-3adeafbb160mr7153902a91.39.1793087510014;
        Tue, 27 Oct 2026 00:51:50 -0700 (PDT)
Received: from debian.lan ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614d7dsm2542311a91.3.2026.10.27.00.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:51:49 -0700 (PDT)
From: Amir Hanip <killdeath104@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amir Hanip <killdeath104@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: arm: qcom: Document Xiaomi Poco M3
Date: Tue, 27 Oct 2026 14:51:15 +0700
Message-ID: <20261027075116.41673-2-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027075116.41673-1-killdeath104@gmail.com>
References: <20261027075116.41673-1-killdeath104@gmail.com>
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

Add compatible for Xiaomi Poco M3 codename citrus, which is
based on Snapdragon 662 (SM6115) SoC.

Signed-off-by: Amir Hanip <killdeath104@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557c..8d2e4f0e3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1068,6 +1068,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,citrus
               - xiaomi,lemon
           - const: qcom,sm6115
 
-- 
2.47.3

