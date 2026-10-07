Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFFE4D1782
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 16:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791392374; cv=none; b=HMcxEZCBWACkPfaxuFOsfVGXPSkjBUOstL3oCgodLqXV/eW0rZqpo+Wbb20DH/sILOWG1iworbvjhnWGklp+lx744cnEX1FHewVxh1gQPTGHzywHBFxGiyHVozusyjBkoNjQmeZLMfO5qMIBcH9cQHhHO0baGTLrEDysa0m6Lk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791392374; c=relaxed/simple;
	bh=Z+rLLrK6OAPFyZECPSb2YuF+nAqqG6Y/NbbCKPwZlKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YE5ZIs55rSEXh1OhWncc8ntj+Y29nA9B2C5EWDR0XCLTJ6GEa50SPiRr4pq4p+Pvne2xAxBxfmeRp6LSu78OvgG+swnp/6sDJ5JCiBwxQdkKh5rkl9/t2o6GHtDzQrYLRxdgUWOr888OcTsnx74DBC66gxF5ZTCrKAqZpRbfvWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g87bk6tK; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g87bk6tK"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso1514094f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791392370; x=1791997170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sf+7K7Vn47mwcSJHOid1iW6b79xG37+P7VB8Mpvpf6Y=;
        b=g87bk6tK5lN5BD+0kthPH8ZRkbvzstCPF6tRkhfQbGbXF6GLybosisXk0bTTILszkD
         yrd/HpnxQPT0ZLK/23whZ+O9CuU1s8SctHgjBctG/mGvkVaouKtjoXXTsiFUY/7+ZMUA
         KuPexUxThJPBjd2C59nhzCBNMWuupF5zbKhXPKLR4l8fVJMCteZ5Iap+YvmFBlF2deAS
         lE9wL8myEo1nd0MLFoNzWTUlF90bs1mU537iuD7t0SvqWCkt4Sg4HTu82J6O/3mPvi8L
         2eFSMIhqXjg2MQffcLFzvPcwklx2+8QKt7Nh8VyLz/zFcUJ4CHahwHlYYuXe+odart3G
         e6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791392370; x=1791997170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sf+7K7Vn47mwcSJHOid1iW6b79xG37+P7VB8Mpvpf6Y=;
        b=SfIPPlb3CMim6hABpne8Ujds+EG9/pCCvjEiuks9TCFM8Qlzvj+WDIdDDLthKXUioL
         4D0PrNHjBfl1qdUjp6cqQYQG88DQ0DrI9vYH0PkLLUzrm36km+IU6v5jusXkH/wfuoNY
         44B/kXx6IgT3lQ8lVQ4a/hn6PUf0okukroQ9rZGnEnQxFINxI0AONH+8j6440R9P/RRN
         JTPWlMkYyZC5eBBUYVXIoyRCnamCtw6vJWN/dh0zrXk/PiZuQo7tHIYXLPsGE5wji0JK
         /IhQrRtHaSHenkiOu4HoGW9MqOnM2Fq7VizZdezONmak6Hlts4qOZNAW+BNgcIYcPTrd
         zYeg==
X-Gm-Message-State: AFuF++k2+vq8SIYFNgeuG8lQNBPsGL9KVTxsrkp4JwFhziRVWKgt6huZ
	ytI8N72Fsn7SyJJJKg0J3zj+r+CPfp7AuE65QJv5yj42K5u9ZsJFmPTN
X-Gm-Gg: AYBFou3A12I7DUpmE8IKPJkfoiqTXN33hxfHSqAE8q9G0YqZyCFImeauQtAXQYlSu8O
	1PgGAppjUkzxAugdHPaAFoay3epbVWdmBrdilRRJ1++Cm7tSny3dBzlOwzfiIyOKVZxExSxphhy
	9gu7hTALJ3TIX2iXb/0Y6SzGGuXoPqxNqXrnYWbbpEZ/ffAJzFyrZuV9KwcgBCWf/Jpl1G64FZa
	mCrhGLEmO8GoPI7rteBv66Kb8GUjEatr+ejXpXjxvAfAde0zJUwZ/fcWbEdwnllwnnPZOQ7sGbB
	X1TUEZbwxiMvFuc16TIP/wdS2wsyjDhUUHG2Y5MinjM4/wASXpMf2z0ozkXpD+9qE40eOPxkOpc
	UV2GloR/pt+tdt5bXx/q4WkBeJ0h1e/WCaTBL/OOJz8lODTNzEbH/dIJkuzA1oOQIMxpVRNVmQO
	HAqa9udxpFettKpEyoQHZiXi232PofGgvZJHq2u/WaoRVVbttya5uad3RmAimB/JRDsvurvI1Jq
	LMDCGTBwFIShQWyeAS3A9N5L1dJCxuys25txA==
X-Received: by 2002:a05:600c:3e0a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a180455e96mr50949265e9.16.1791392369621;
        Wed, 07 Oct 2026 09:59:29 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1843d198csm4682525e9.7.2026.10.07.09.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:59:29 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 07 Oct 2026 18:59:21 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: ipq5018-tplink-archer-ax55-v1: add
 'qcom,ipq0518' compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-tplink-ax55-v1-ipq0518-v1-2-0ef058756596@gmail.com>
References: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
In-Reply-To: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The TP-Link Archer AX55 v1 board is based on the IPQ0518 SoC, so add a
new 'qcom,ipq0518' compatible string to the board dts file.

Since the SoC is a trimmed down version of IPQ5018, keep the 'qcom,ipq5018'
compatible string as a fallback.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
index 7a25af57749c..49c4eba57855 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
@@ -10,7 +10,7 @@
 
 / {
 	model = "TP-Link Archer AX55 v1";
-	compatible = "tplink,archer-ax55-v1", "qcom,ipq5018";
+	compatible = "tplink,archer-ax55-v1", "qcom,ipq0518", "qcom,ipq5018";
 
 	aliases {
 		serial0 = &blsp1_uart1;

-- 
2.55.0

