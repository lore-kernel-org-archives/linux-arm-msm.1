Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669176;
	b=4cyttdfobzQ5L/5wlQd5WkC8RMzLBwSSWuA99MjcmSq8O2XIpF6g8+a0SMkmymDtp4W4
	 Dm/X78LSMLRfdjTDWTdWMO+FghPshQ/qwZROtb/mmC1txGAJA/wTS2ZDkDhFeo0u+lyCX
	 w1JPfapnFpCJUogNgp2FPZg+NXy7gPqldNGXN71njDpQMhiS7VCvJFinUzzOTge6ND97r
	 8fGWYoM9jnxfxVC60B0THhVKsv3SAMWW9tKVEMIpN9kI80LcWhX/h/XvgYPUKtct6ohGr
	 mkwMhCSjvZyazk88WRvsnlSg7jtNgKQvkBh+kF5rwJIZ8mFDeRYKniINPxlphecPxfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
	b=ndodef3U3D3PuTJpDwPI1dII2/6a+EMkQdYLfi1kMl78ZeMcu51SHlRES0yn1OoBk0k8
	 nwGEDFhFvAbbRZLUSYrpxyD2isvauaxCRZpmfy6BoUYLO0F3mawRQcvCQLHLKDsy0nxCj
	 anIzLvfIVD7sQStKNAUKWxESNADi3Ly1ByR/EEaIWMfyIRqL+WSsfzTY6zy+brytcY6uA
	 wQJwJjSVmciEGCFG2O8X5hSAELqLADnTE/jT3i9gjQjRrUrlJ/ezSWUKhV+Fxxpq5hThL
	 jaGoaeAJYkcw9SoTBhh+P0eb33038mohVlYlrZHPJrJ8cDuDlCVm0G3YVe8MtJdpUkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFzPJxa7;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47478606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 04:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47478606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFzPJxa7
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so10953800c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 20:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669175; x=1796273975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=NFzPJxa7EhtRIB8MazICb1dZm6fNciu0+eLItxW0oiWruoT5aOguqNE9G7jmzxP/nA
         RkpbDJiqDE5/e/XWOmDUN9BV9cSiaDUdMuaUhMM5Z1F+/uyFtVQotT/LTzXewNqPOcrK
         541FmdJagqAoifV30pAUDCG4f8L7RW4NhtqiSqPAIzbhUAc+6zECJG7U9IjNiZrzGU6Q
         t+0xX+hdpAo23j3UIy+7AbGneIcGJTSZpbhmnjOS00LsvKUAP5XNqSiAFcbuW89YxiVX
         0ifHTVOKgbf+QXew0DyLfF/gaqOm2d43nuwGJtKoPISb2Lrlip4DV0RUkvymXqVvE1aX
         1tCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669175; x=1796273975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=a8AUEcrxUOWfr+9xkch17pfYNVtd47iS7FsGHtvUbR6zWcgPT1QNOUGwTPR6SSJn4x
         FgEgaIck9ckY+YIzNGUoag/FoU9EMVsVOiATEXtraiRQXkWXkO3P8QqkIOpqauyxp4ms
         RE2KW7PG7MKzvelfE0do+VEFxcKDfh0MOyXkvtrw4mejHZbNeyDRn/mHSRJ1sSv8XV1i
         IdmnCUohRUOUqT6pYhNEJV+J3uedxt+X/2rSwF6R+BvJqBVejk269h1v+1XpElIffTqS
         xK+8n8yAJAn+RzyiTWZSTnn6jW90YsIBFbfMx7c6UnQgTQPUi2J+9ntA88HTq0blwmdD
         nQQw==
X-Gm-Message-State: APuU4Z+d3Y256qXSTo/zxG4kV/k3Qv9n4RFTIzBVkgUzlirAZtF1b/bh
	lFfC4U2fGUeFktxZfbSgA6bttgzkbdR+Go/iVMZIg2Zdnpm/uIbf29zK
X-Gm-Gg: AZFdTZdBLtxkWHrZGJDFs3Sj5S7wM7cIz2i7eE1cqaakNagAzlhTUw5WbYRyT//4TSl
	z4wG2R7kOIdFc4lBCzUV4Lq49mWsAVOYS0Br6B7fEsaWLhP+FvH1oliYFOCicc23C1x+k1IkXS1
	luk3cZ7YMhMRAhzkiDi4IiJYTtTSjCXQYxsdL3GJzW88sLyoNPAR9uAM6v1JkxLsFU688cL4Y+j
	0zqrXpu4Mb9tLLnt22dUIuPVPIH4DArZexmTv+e4Tffp7GxJVsVtqZVRtFOypYoV7g5Dly+Owzg
	72A1/A4poKWsmus+2AkGOuhwR7Y8tBtnQ6FRFa8xYMn+MUBcYrPeLMFJgZ2zj/E8e5QXRWmgbDJ
	FOBtOqGvCy/7XO7ukpPXpcyZkwx40RTtMo/PuJhHozjh71cnBwMOAco3ps7xpqfIy1WB0jpPPY5
	s8tfpGxBnLohveUbjtU1x9DdtKaUpOVDzo+/Q45q93st9jU3p9qZM7VEPHLm8hBAhtrIC+pmsm8
	MkfPqfUfgrXzfdcU0/ct9IN4vQcGmnD2JO3uBeLdC3eg26UW2iGmSmOW0QODdN40DKgf0D57vz/
	EASC8nad2CkehlgWFiEZb5H57kRsM5hxnLvSAt5d0o9jl1O5kKA/9Cja2/tHVnjywcO3XCsznZu
	vg+bie1E=
X-Received: by 2002:a05:7300:430a:b0:382:7375:1306 with SMTP id 5a478bee46e88-3856fc603eemr27572642eec.14.1795669175490;
        Wed, 25 Nov 2026 20:59:35 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:59:35 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 26 Nov 2026 04:58:12 +0000
Subject: [PATCH RESEND v15 7/8] dt-bindings: cpufreq: qcom-hw: Document
 SM7250 cpufreq hardware
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
Message-Id: <20261126-sm7250-v15-7-492014ec0a52@gmail.com>
References: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
In-Reply-To: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=tYOW7ZwAVWXKL25nNQ4vkjon/atY4Dhfdawj8MhM0Nc=;
 b=8XP+FxMcNtFvSYN8lg3S9ocnbk4kDsIE+kYG7fw3nlTEyPSnWVN5CZnQShpMnN17s5A1283xW
 e+Hz0YVjyQNCExYfLFHhn0nc2qpGwYHJGGrY6U07WfxPHY8D44hRghs
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

