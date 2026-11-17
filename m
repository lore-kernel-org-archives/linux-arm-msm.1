Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903868;
	b=uxYj+oDcKx3UDm4z1VEy2a65nyQuUcz3flCi23adj0W8oZJ/DZ7a3LeijUks16GnUSq1
	 u29NrQuc9cG3tIFSyzdAl5kEAeveTa4oImh/ZyfU7E6xkPc7IOket5CEizuUxNbgKwMLk
	 ZDfUCG9GhAGQ7hqwpc5nRHZRa6U6YZPzxAN9XP3Ik9kvVhYHi5zx/6+aMIwl8e/Xkh3GU
	 LYvGI4ocBkKnz/3fFn/x+R1ve4yLvO2LxbsYYmppCGDQW2UfjM7vWwBeLJA3BQSg/VX8C
	 5X/5xg0CHjDH+YewX8ZKHY1Oype8imiSuy69OE5j2PKOnwvxEYsUrgmgCs/LKLdvAFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
	b=07YQp2JGavJHCUteF4qvDKS/FvShwvyU14oK48NRFPyjQLAimJ4Irywl05o6bZPIENNh
	 1xGhPD0DW+gmLSkH8VK9cS8Nwf2VGau9CQaKnQ7fqwsy0Hz7Bv12ydHouRJCEXapREfXJ
	 Z82WChlixZXnGPXZyw6WKyU4Uj3xsRuHAZsfoUm5NQybIesPuqAhGl53ySFoZXBIo75ZQ
	 W4NrcFBg9v70aLt0+p9tNMadB0oewUYxsN4tEB9OqthbUXkq/ECjC70TajykwZH9THjAX
	 DEzYppOAxUDuVcsevcQA3Zfiv97x3r4hxURQ1jC6aVlk758Hv1DPNMB22HwnvfE0Z/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=OOSmJG84;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA166606A895
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA166606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=OOSmJG84
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b7a488a0a4so4846889a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 00:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794903866; x=1795508666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
        b=OOSmJG84RijGLublSYWVTMpImlN/WVaYVWH8oU+ddcnl85mJ/nXFQyXqkaCNhDH+47
         KhPkhKvIgNqhs/kM6bF4Bjnb8RAXPDNiq+6SRu1e4EJd5VM2sQCBSKFGSnfCqWk9sOeV
         MIVJpk5h3nFj9f/1YrTEHJMEXcWrwO99d/pZ5BtX58KFjfbONFw225vcTxt9ec8AUS/y
         2axT99gaXokVpb6sSCIlV0RXDZWOkSp2aDJuhAZhA3KYRVANLXZ0bHRnUjRTl+KsPlKC
         aKx7YZKcZ3YEuWgllL/cLAeG8Fp9dk+/dWZQ1/7ZMIicNIKl+4smwKMlxNp6B8uf2lWw
         hoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903866; x=1795508666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
        b=jvqRVMb3E0hVg5eatu3zoPbIG6d7dbDqQP4QLuZCf1KCbXL1S5KXGpOaGmVRnN4aZn
         VdjytUXpo2S4zv9tZxbDeV+HG8U++3+AZl7Qv03yCYYT/Ys1htt4c+6lelgnWppoIAKc
         E9wdS9ZqT8/0fAkV+TT0IUDVWLAFQaJcyP3sFnfv0DM3JxuDXapgm8rR4fim6oi9qqOy
         +N1fd13rHiuOTzyRGTLETWtig52mMyGHa+kEfjVyE++yM4mInjw/sy1wsCssj5chK+SB
         uihFnaDMfLtO7/NBp6bygUBp23bfLGrBPc5KgbKSIWGHrJTAs+fgxy2BY1ZNm6Itx9O2
         8bBQ==
X-Forwarded-Encrypted: i=1; AL+hErGGXmQH/4f1wgKp508P/z/jOha/pmVPxhkFBhhYzvYul2qmVucP5E981k5ln8n98GCFvBrnp+VOtD1Bs8ul@vger.kernel.org
X-Gm-Message-State: APuU4Z8QBz38vSjf49q5BR9cPzupLWbqVjs7/npsSezXf9XFmhUuz/w4
	rWoA+sJcqEeTcLZMASR+9j15BNX6Fz2JAUP0Mswn4whJepNVpD34Mwku1AKcxEzY4UI=
X-Gm-Gg: AYBFou0jl8bRF8ThfVVVoXuVjqGCJt+lD5JgokGgXd4ZAQn98VQuzo5JvnWbpijhhgi
	vz3SPTnEvr9hpjn5a9VVe2gMit75LkX27xAtd5qQfpMwdCiDfTZiKn07iRtaWynvZNMM1ay+YAS
	Ta4mVUqUxCCCDlq3uZkgdC3F9b7dCxKlWmHHrnu/yhcyj8qBcO5S5Wk9f/La4RvmVWaPMbZuBbw
	MgcOB39lKW+CrcMGBF4RimKNz+bYjqyyXHKhEIezPpKuB/bUODs2LF8HkBlYSfD8R8PLQ944YhW
	TSHYzonX3OJmXT2hPvlswHLSp7zMDe+/clxDyBj5r4ipURbLOFNwzvt+t4CXCP5Z7Cj7riMMWg1
	ai2dVCOEagAIUaBsOigHIZ++A0Y7nmA/8oKo0/Zd3hr2DeNOax3irgEZfYJD3pT/+zkSN1WVLsm
	o3rPu154R6gowsoswRjlfZXtORGCPyWvXizsX1vsLl40bCx/huklgL3opXH3fmo7MMW6ulVD2M2
	MdMA9wuUupx6EPTAG+7luXJJ6hA2ozmg9fyZdE8HUS1849t7e8IMBKyk8e1a4pfXscRjF3A+9w5
	tuUowSi0nKMbAClOUNAiHNK+JsKjBtTs9T+mUp7wZaJLIXQLpJ8A5MPcrSHL4mGFG2HDY3MJ9eA
	JwyTvJpcPzLZerg0FYd+zxq4uuWYUkUtV9A3hFp3WS5yulcjJ
X-Received: by 2002:a05:6402:210d:b0:6b7:9ced:824 with SMTP id 4fb4d7f45d1cf-6b7c0c6f70amr9699533a12.26.1794903866141;
        Tue, 17 Nov 2026 00:24:26 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5616953a12.9.2026.11.17.00.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:25 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Nov 2026 09:23:12 +0100
Subject: [PATCH v4 2/5] dt-bindings: thermal: generic-adc: Document
 #io-channel-cells
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
Message-Id: <20261117-bat-temp-adc-v4-2-14d5d309ebfa@fairphone.com>
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
In-Reply-To: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794903862; l=1375;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=I/NJZJX7ehckBNBNEstT8hdZRvbJ5dgDjnQjjzYNTLs=;
 b=Va/ZiG9pLV9kgIqnenCHkblc6VfgP1Axc4rzf1uTf/VYu24H6meIDJzjF7cPq8pDHyZN9T6da
 Mb3xtpa7EcBDjzIwW6JQazspouxo37NOrWeZduY4MV8OdBzf5BelcoA
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the property to allow using this sensor with io-channels.

This means that the output of generic-adc-thermal can be used as an
input into a different node.

As a specific example, generic-adc-thermal takes in an ADC io-channel in
Volt, outputs temperature in degC, which can then be consumed by a fuel
gauge driver to provide the battery temperature readings to user space.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
index 12e6418dc24d..317fc39ed46a 100644
--- a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
@@ -24,6 +24,9 @@ properties:
   '#thermal-sensor-cells':
     const: 0
 
+  "#io-channel-cells":
+    const: 0
+
   io-channels:
     maxItems: 1
 
@@ -58,6 +61,7 @@ examples:
     thermal-sensor {
         compatible = "generic-adc-thermal";
         #thermal-sensor-cells = <0>;
+        #io-channel-cells = <0>;
         io-channels = <&ads1015 1>;
         io-channel-names = "sensor-channel";
         temperature-lookup-table = <

-- 
2.56.1

