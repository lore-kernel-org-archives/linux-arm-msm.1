Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483530;
	b=QTAin2fIIIBhvqROMHN2xXrjhGcCVsrE0bCRvH4vrUk2hmu7D33N7uVH7Ij9k26f4+aO
	 DiHfjV5Gwr5sXX0hgs40/Utzha1u5giUjPY4/5QngTlWtTZWJPJZxguiGZl976AItO38w
	 k28y0p9rvW7qAoXdycjjO8wHVdfwJj/dWStSDlHu3OnoAyImXQlmvMfpf8YbHegSKdGoV
	 OtFt/b+pn/qSx61XZpOiNv05iTSK/nUXO2Tatj7sbzEIRhTD/B7xQCoEZizL5GYAFWCq9
	 CaJe9sgnLTB132yhitAThBgr7m5f7q5P6jxACCIEqBYqkhGRGG7tnaLLTY97NJxJbJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BcHFKzH6PC0hX0kM+WnfYgJDlB7llMNXzNgtx2MFobA=;
	b=jpmPXTjgzQcKNj6mqOC2Vl9KCYxXFhfVPxwtuQ2qRqSln3/d4HNRqpPc2y6Qc50Lxpjb
	 qBHdR439irLGoJmcuDZlveEHXjSdyI9Jje8H4TIee5BtuStSfuvYdl7KXJcyLqcBJUXAk
	 ETfp2J1kDO0K962/Kv0nVy1Gdyk7+jUX/wKLsZMb7X8lERzfWuvdSkGgUZLrj9oa2d6Gh
	 opJ/4JptUbVwOAVSvoIkCjWsfNFWrM1J6oGbBNQ2WqjrXBesAUAsnI87MlrgIGy6+IvLS
	 LKmolVyI3/vXuIGBNg4qqVCO3g8SsR8PF6j4rWB3qjyTEi9Zbo//ZxTrfjM+mUJnyOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bpc6tjlp;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA996606A332
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA996606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bpc6tjlp
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36dbde64409so8211393eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483529; x=1795088329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcHFKzH6PC0hX0kM+WnfYgJDlB7llMNXzNgtx2MFobA=;
        b=bpc6tjlpFatIpalsJ00zMwHn1GBcqsf3GQV4V2rJbh6LJsquLTd7ybtJh1ijCy47Jb
         c+d1mWb6vX+BpgcenjeNRTpaOEato340SQNSThVZ+mSFA1svcmkV1KNtArFv/4ehxtke
         m6v9iiJVqFBqRwE1AtFHLxr+ti975c+/Z6EzYpOo648IXJoS5U6guDhNGa28v5f9EUt7
         oJV6DlU68pRPghGGxrQOfOoOqssth/ABpw759qlasUmCj5qh6NuOgzYEtoxLMyt3YpDQ
         dzXGK0sJd/4Vy6sj9SEYrLLXWeV/gWrcYhgZQGziUXAScIlS5FNZKiXCg8f/yvO/ZfgC
         N+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483529; x=1795088329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BcHFKzH6PC0hX0kM+WnfYgJDlB7llMNXzNgtx2MFobA=;
        b=rdGDTaEKjUtRY0ZpLB6+VWOJLUmBoXJXoYVKlFFYXrQPBSJ1Bn2mJyPYZ89Uark79Z
         QQq1K4wpOXjcwTRl7wKMun23EX/7vc83WiJGaWSSuIeoQQMc9LEWggzbbPJPMSPAfECH
         1J7+nm+c/eDTro4iVCzQbJpSbUBCYvn5fQNADU4IDstbU0H7X7Vw56qmrLTdVjh+I07g
         Ruo45jaT0nYy5GtV3iMsgWZo/nWM1V15jUGZmsVo/cg7+IAiYqTv6BiVSW23XcJw7DrK
         88AzuflsxpvqicIzJqNynPv3iV3VJ7vN2F0lrnzQRcilCxkoD8+w+ofi4JApqB2P+vqJ
         e6SA==
X-Forwarded-Encrypted: i=1; AL+hErHeDgWbcOK+TaHVn0laMeIzTvOMHsLtyWA+spdvupcKLYCNFNqxkWU3a9hUjs3MX1qIxRWJfzG0tTDYPTFt@vger.kernel.org
X-Gm-Message-State: APuU4Z+lYwHX2WtCgOcLIdIMmky/4RVnPY99NDwdEkxe4hcL0A80qL3q
	NQOAtrxTExuB95NhNtt09eyPzTbqq6mp6vZE2JGRtw2vZ6T3Yy1fMFoo
X-Gm-Gg: AYBFou07s7Bx0FT/4D5KKKwRDO9IYaG4xoVnM0t6XfhlkrR/CvyVuG0XNylskCNsYHp
	IObDh0loFBJCMHyI1fIrJ7K1wwqRkbJdShziViUsdrbQ/Ni1Sdfg02WVwrVcPf3WYh9+9gTqjFJ
	puRm4H/u6/4TcSaxFv84VVl4zJX572ySIK6jeBEzqbxxMY9s6Q9Xxdk6AD1+qtNrjk96gyaXqn2
	Y/p5kFgBQtW7IlilsLzvarH2Fkd2/CQdipR+5kCeDmw5Hk8+pyYkaw/okt5sw0q7uFOSmJLAaWW
	Cei/29ArmvOOn4HspDnsuWw+TF32o/u1jFIhG6JOYSpKuQZVa82Ev0Lm0M4QII9olYuvvkYFyzx
	n81n0mvjrOuHHlIwovytFKsQMe9FIwrUsszwuoLMxaOCu5qoM0kP54Wo2or4RaYk607/nEzVqrt
	n+i85T6ClCOFibJLd2eVTBre3PByEV8K1Y4zUW9Lcz2g90ST/KbFokk690o2exFITUawMhgKt+e
	wmuC9skzstWLfpB01092MzF/YXCX3yHgmmq85kEjmGzrteba0PV6xIGMkdzFfONakGidpkdgBg1
	TjoQWKx+G32l2ZntxOkHfaOhiSRL8UWGg53mh2uudA==
X-Received: by 2002:a05:7301:430c:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-37683189067mr5405543eec.1.1794483528595;
        Thu, 12 Nov 2026 03:38:48 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe07dsm27149036eec.20.2026.11.12.03.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:38:48 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	heikki.krogerus@linux.intel.com,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	effeffe99@gmail.com,
	prashanth.k@oss.qualcomm.com,
	yongxing.mou@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Thu, 12 Nov 2026 20:38:37 +0900
Message-ID: <20261112113838.506-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261112113838.506-1-26rote@gmail.com>
References: <20261112113838.506-1-26rote@gmail.com>
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

The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
DisplayPort pin assignment gives it all four lanes for DisplayPort,
while the controller can keep running its USB 2.0 port. The controller
has to move to the UTMI clock before that happens, so it needs to know
the Type-C mode. It does not route any signals itself.

The Type-C class passes the mode only to graph nodes that have the
"mode-switch" property, so allow it on the controller node through
usb-switch.yaml. Orientation and retimer switching do not apply to the
controller.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v3:
- Drop the mode-switch line, the usb-switch.yaml reference allows it.
  Disallow orientation-switch and retimer-switch (Krzysztof)
- Say in the message that the controller does not route any signals
v2:
- Use the common usb-switch schema instead of a local definition

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..fdc2bc8d3045 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -158,6 +158,10 @@ properties:
       HS/FS/LS modes are supported.
     type: boolean
 
+  orientation-switch: false
+
+  retimer-switch: false
+
   wakeup-source: true
 
 required:
@@ -170,6 +174,7 @@ required:
 
 allOf:
   - $ref: snps,dwc3-common.yaml#
+  - $ref: /schemas/usb/usb-switch.yaml#
   - if:
       properties:
         compatible:
-- 
2.43.0

