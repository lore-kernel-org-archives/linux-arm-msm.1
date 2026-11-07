Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018382;
	b=nIDoKOs824/PSaO9tiuqyrewzBT3m/pJU3sg3t0PoDfr/4JddBW2vsmbC+ajNlp0tTX6
	 qaiZEai21fBdRqn51c6dMraMpaFqhf1qRID6xTLakupvvPHlLXM6g9GT2pF0dlkSA+X5q
	 erTjuJlqKIWFuiSMmP6zo761ub1upRClux8zJx2VJBTahs45tI0zF2EjbpAbRXqpa4lmS
	 UVsUG8+LasIeOV6nWDFJ1hVZMcn0Usi6XKb6XwFGcvbmk1GJtgu0dj0QSJg6x6Q3cMQqG
	 a6bb84yAkbmdz0ju7IklDFo9RFyfdYruF4PiJuiEITjstKtyLHjXEkOmvNzvHG7gElg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3m9gvX5lYJSbOZKXUakfxz/981ELA/QvqN7rzqoA5W0=;
	b=ccXb09QQxlTwHtHPFYT0AbrbjaFrlESIAP1Q6GTiP5gsTqpRWt3pINKOepqKPM6tVhQh
	 vbAHV1FsEwT/0X2QiJxCtp547NWtdSsxXhYKnmh4SIF1Vk4SOPT6oHWzbPLsd9zHRuMkg
	 WFuIpuiN8KEWWeDbHrPPLV1mnkdcsMZWmCaNQS72xmaKCnUERLQSJFqCGLn9qSzQaM4Ir
	 JOq9/gGEMi1Xi5qA0r//6o3zWugtcDdVsSg89jHgpRPiM9cNBAiN12E+Xxdc4Fduf2W8b
	 fCxUbwvmW3yAR08Q5ccu80WKOhAQJ6TAoZSSU/4LCFG6ihxaQ8W+4kPcb+ofWYSxIrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MEKMoMiF;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA225606A32C
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 02:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA225606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MEKMoMiF
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eafb65e204so358984e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 18:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018381; x=1794623181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3m9gvX5lYJSbOZKXUakfxz/981ELA/QvqN7rzqoA5W0=;
        b=MEKMoMiF3xiJ/l3EFchdNu8FNUSH9MLUfVZo0v09Xw4FDNrqmbUeH48Ps8MvBhxwDD
         3cr8p7soVGz8dbByWssGeq2iItiHX7z2R6Nodnu0mmMywiMjiKRyivl+wF5XY/Kgh4j9
         zmAjgLQrcLPMCXbCCp6kFpGwglmLzyoGZ4vAE9klB+AQMfzOi+Us2fZ+hLaptFLcZHWJ
         FDIAuwpvE7EopYDrbqcpep9GCHyub+9XedsvnnvYD8gGwRQWb6XiojibH88n3T3LB36i
         WoEm5c9lS8oL7dXA0ZnJ/1pAO1VMgxyai877TrT6ikuOEjznQCxy2fyDF3/i8scBa75N
         tnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018381; x=1794623181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3m9gvX5lYJSbOZKXUakfxz/981ELA/QvqN7rzqoA5W0=;
        b=fAevJghlbIzbfGYafJoHAXAxSR8IxSMC8ynmGXW4SErPP5rsokIfK085AxaVOGnSAd
         PsDKouTkSx1k1ZJjD10MknKmYkUuf8T9O4y1HfA++3WxVmeFHReFVsBoF/+cWXlaUHtI
         +lVQMsREXouX1L/BMiuo43L3+YVuZM2wCYivW32NBthbexV8ESG6KOp3rlEdpzdPTnCl
         P5UYrtnh6Vs1SstektqfwYMNqUvTP1biK92kRckKeaEDtaUubDLgChermXJ0Lb7auJcO
         TbR8rz1kp9QL7ha1mW+dxM4wnWnzDRBqN5keP8rd4jzd0bfCV9jXu/YCfRmaIvaCdOWK
         l7CQ==
X-Forwarded-Encrypted: i=1; AL+hErFKQx+fSfjxdzRo0qgqtrcAc9U3wCZM0aBY9U/CHtuk68znXRnKECoYqaxxUcKNzoH2puAcP1BTQ5uSQli8@vger.kernel.org
X-Gm-Message-State: APuU4Z8/yR6auEIUpYdM2EmXEhqHZC5YXFJiKExBq7C6uuU80W1I3wFi
	bgNZlbDHXvxve3pkA6BoaD1+HYGGVdUQFD/eiPR3OaJDICkVhQ87blh2
X-Gm-Gg: AYBFou09GcGcj6206eyLdvMOdlOirW+dOXSLi/gapw0qSpSItHZNTJWBWi8kZNZqI41
	kvOMZKrR8BaWUZSnpSdJQFbVxErb3rmXxxg0jMUGtY4HZUMZHPr+wBF1Bv7IpZVOFA8bPCSOzi5
	G3Fvw81I75CL4VtDf7HWnHyt9TbjGHcbp3tf8GkWFfh6/EDtcoT6moSvVbrMT2j+z8GvEqm7nsK
	ZKQNChsK39cqO4kpLGmx7J51AXGlfCGMKt4qda+Qy6QLIl7PHcFZRYyXwsU7Cq4rnQ2V5MKGxE1
	/zEVXZUTai+SRxvafq6iRyLIlXMLfoQxUfaoWkik52DdbUycn8Of1LPnbTomQvttu30vBA6simu
	87woiBJufgFgifrNaSDBrOh8aObZFQ0yUPV0pRzsywdRhJzxuk9p5Gpicm7lb8d6dnkPT0rTtkO
	KFobH05oaDfaVe6eEnxKcvcBYPBXqZGwb5Fv4u99v+JsOkCVQImd6hJvYEOM+1OV9fbvpyMy/nY
	B+VMo5BmbHUB5ayVyujpRROIxip3Tjua1KXPBOHI1JDawY57st5XX2p1e+ZaH7Jw5oTGw+M7/7K
	ebf9CG9M8Hyh7ysgE+4kdSeefE7wJ2fhDixXNbfBD14KQCUi1A==
X-Received: by 2002:a05:6122:d17:b0:5eb:2a6e:d3a7 with SMTP id 71dfb90a1353d-5ecc43eb11fmr2142243e0c.12.1794018381006;
        Fri, 06 Nov 2026 18:26:21 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc64a5ea5sm2744407e0c.4.2026.11.06.18.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:26:20 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 6/9] arm64: dts: qcom: sdm670-google: enable adsp
Date: Fri,  6 Nov 2026 21:24:50 -0500
Message-ID: <20261107022453.159341-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
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

Enable the ADSP on the Pixel 3a in anticipation of audio support.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 4ce9b62abe53..2044593c22f3 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -199,6 +199,12 @@ cam_vio_ldo: cam-vio-ldo-regulator {
 	};
 };
 
+&adsp_pas {
+	firmware-name = "qcom/sdm670/sargo/adsp.mbn";
+
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm660-rpmh-regulators";
-- 
2.56.0

