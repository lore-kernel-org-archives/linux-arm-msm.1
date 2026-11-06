Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978224;
	b=dsI7xkwMMaIgdOVMSdKUhEJ+uxZfpZsB/lcfe136iqG/DpFgyUcVOmqbmVr0BfdLqqe5
	 UbUhPdUFGVg8R34HWQ3ybL11XWDaAlYXPFdwiB1q8snZrUip+VNrMHuDE1jU4oOs6Mjuy
	 xOW0qUOwZ27UP3ToGKyIELyVw0kkLLXpdESJb5Mx9cCnPWoBbF3p3KHGWfUwx075C25up
	 d4LhizY5lALFnS3nfX4F8LrE1V1hY+NqtXSzSk+4aYHOgQsFDJ7c6Tg8EALowXj5tPR+e
	 e6EVPag/+bQanYLTQMaT2RhvpHAO9y3zox6Gv7jTHJBHBLF3JjimB9N0olWY4go3w7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
	b=PC4s+KueKMUzKjPwZ/guD9pNOQlF0LVBXrh5/ZdYqJTqwhmBChKIBwSyJMZVxYyWH69/
	 iVPU7gJN6xSuImXEpO+pI/7ejkWCVfEem2T3FAf1x9s7u9ydwysJtEwp0lxG/2xvU6n56
	 roD0qNsCKKIB4gKew5yzcQRTIzceyHZUGtANWYgxJdjz1BIB04ktos5n0J+ZE0qoEOlnk
	 FY4+Q0FsiNPXCfwy2f2sG+RZFot8Gx7piWlbBjgvDsUbTIqyUqlgMik+dC5PFEr1VT+Hf
	 0aZaIPKJ65tXdV23LzzXD5eeptmGbxW78KMI4sJFdSZGQGak1wzKuFy3ixvd1pCJEcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hm57Ipyd;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C306F606D80B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 15:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C306F606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hm57Ipyd
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2327415eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 07:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978223; x=1794583023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=Hm57Ipyd4zR0uJlvm6dhRylUqkiMorh1ZS7/8CIZIjoXX8W4jWlo5vqp5/4jt/ydkk
         QdnaSgyNWo9/sN8XKK+gMrZJWjv7mm0ReLPBCbwPhKKXSRBomJWJX2ybDOwfKE2jsL7H
         0hyiMTRiYUD/u4oVkNMkMQY1VNevjc6LJcpFos3UhIqI4WVQUnOzO8qd0wmw0mMvYCUt
         ctfNM4AbnSRx9Oczt4ISPdBQCx0OMHEduHduejZq/YeIJRkTPIozhgJPnBHJ6j2kOFr5
         6T6mcZs0HwP7b1+duob7/uJn1O+7ANzgsU8uocJiS2aqejFMnIVJITikaUoSF+beZXCt
         4ukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978223; x=1794583023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=zRttKFmxEVZQq8lbEv3aDJiibyzJF+dgaV/onZziMhygaFQi6JLuvX9h5tkpXp0YbE
         OsGMC1F5PebvOECD1WxLxwpCK6113QQQIdLOqdmlmKMNmA4FoDwOgZ9U4DenhqELpba3
         uZXB0kM8C/m7t4WoV+ExghLbQwuf7zBfcrH06/r2967H9QLRlEw0ryXlO29wNzkz7QU2
         37/5tRuCl/3oHOmRga4qrNsWo1carky4QQXjVpjlDuk/y+ynzcPdxDtDs3mPvmL2Lb4r
         j/GlkZ0za0HdPo9BMi0q7KJK2sb8mWaBEVtREH9ke01RphiIqjMQSKRQEAlAIVuCozlO
         EuJQ==
X-Gm-Message-State: APuU4Z/F8eSb2c+Kz4IGS1AJZbMcIzgnUtmhM5dJ2ObfsLFEcWfqBGt2
	na3p43MxfGEWjkKflp+BTTk5lhI/8u3ElsHjXCWzHUlp+Chtk4ArGd6Q
X-Gm-Gg: AYBFou04m0dVK7MRYSpvLJlZMQN5b1o7YWf8ShOVr1981b+/YtaAPfmyEXZkDczGqAz
	zFJM/pOpA0tmZtf1IENLksbxaRrYcLol5PSP/hagOPZvBdqB0RkuzAyFJEauWUuZZwBRdPR5Nga
	Qwf4aFsYc5gbjnfhQ41YCsd8LSzdowgDsK2tVfPgpnULfGc37lmh3Nc8vRpfMk+noM4DEEbVYpE
	piITy5aLjlW6UShoBdqpGbjV6MC04/Qjanjlp0bwE+2SddmjaBesx17aWUJxeJnD+6N1xPiMdQx
	H6FeWxi5HSnzHpLokWT8SqLGMIrpc/yS24JkyHMf+PNuCqQPPJu3oTTsEOlYt948RHItYXArPJZ
	bYyj+3Cu/KgDJ60blDLiYowuq7zBPnHYpeo05hhXEyGcrAkiuGlHQ8XOoDPvZzSnXmZBH49w8uM
	z1YXO/0mVNSTzSSSk7RrqRhZzz90ctAcbVBxSyv4WoFgQxx6rtchXGmPm50V/4R89XYFiqPPRot
	52IAkZVED9hA8hyte+jf2Gc4/JcUayylUXZL+g/HwUUtKof//DDahqEiC+tB6bH8puPIcblYSUt
	sg/pbxPWL1Ezs5r5qYDKLpwCljIj09G7rn/29oWrcFB24kLY45pLCxwBWNDPDaT84hubzBLPHZI
	nJP9HMYI=
X-Received: by 2002:a05:7301:d81c:b0:36a:2382:7dab with SMTP id 5a478bee46e88-36f75a2b011mr4038390eec.6.1793978222959;
        Fri, 06 Nov 2026 07:17:02 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:17:02 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 06 Nov 2026 15:15:42 +0000
Subject: [PATCH v14 7/8] dt-bindings: cpufreq: qcom-hw: Document SM7250
 cpufreq hardware
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
Message-Id: <20261106-sm7250-v14-7-7d167e993f9c@gmail.com>
References: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
In-Reply-To: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Sreeshankar K <sreeshankar0910@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=tYOW7ZwAVWXKL25nNQ4vkjon/atY4Dhfdawj8MhM0Nc=;
 b=pBWXHjOFV8yy/kVfddEOkI1z2Vr9iOnPMtTW0sfnFDwT+AdWHZ8KZUKMMqogu35cKmAlw7fOZ
 Tzds03Lu9S/BDhGPFs7OOqoZ0Ml+RHtklhdEbV5ZxocuZ/BaH/Yzk/7
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..f8cdb652f 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
@@ -201,6 +202,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
     then:
       properties:

-- 
2.43.0

