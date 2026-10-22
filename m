Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661790;
	b=WQdLCricKrrQjr4LuEcOlnQ/69lU2+3H4ElG48EjPJjG+GPhsC87dDSjlxZZsysH0d0R
	 EYR7waaLgqxfK3yUKsZcWKgc3rgR5GkPDLSzBbZw+DTWvlt++YGUeREJDOkc/4VbbkXPY
	 YK4llXS0nWrQksQ7yMLlEozL6kPcvl2JuL2O0/btvw0NSwPI9eJaLciaxETZe+a3CO9OK
	 1gTZkSm/ovUoVK0StyYAFGCPpBn1/0bJlUDKsikY9mZOXQjJYF0ZMcIHCKwxlLsD0GKYb
	 JplI5LPZITVLspQESKGHaWnTBNPVsqUIgfRYJw89S694S/8kayz6+tznxT4D4XSaVuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=EJKNlBEgCm7p+7oPCoUM5zbUFRV+dndiBCZolGIq55k=;
	b=LBjvRhRPxaMYbw5pXOaNb21cia4UXtcu9M+VDc9yzAAJ1xKn9aN5D/aXg9aCJC1m5u4E
	 vgwYTTIpVYn8OJfkEJZaxWAnMKGejUohUNiJP66e28N+sgoHSF2lV9BFxDtnXfpnL+RIn
	 DDFVn1Wr80OK6eUhb/vSZg0RB3oZpaKrpaU28QDBzBy94X8MlHTIoIP7Q/VaQpGFGzyT4
	 iVzwXAC7v7vvB9Gb11As4r9pSaMaQ5+ktcmmpSYzOyuMyVGpXzckxUiLdlDRckMXeG0Mv
	 aGQffMisG9SRtG0fsa6LGV0v1FwniZAMOmmxNRPSlSM8nn9iqR8zdOlgkegeR7UeqNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H9yeTlAh;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCE660A261F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DCE660A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H9yeTlAh
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so13123315e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792661788; x=1793266588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJKNlBEgCm7p+7oPCoUM5zbUFRV+dndiBCZolGIq55k=;
        b=H9yeTlAhmisCua6DzWdD41f+GW8SU8mecq4vo8AnQAqO9/Px8uwM5dHew5UGa+Cz6j
         RWzmpG2LkyDXIlpWtNhuv5iJtPwn9AQgCCIga5QB6OuHBfuhrAEiScykJPjrkRusldX6
         dOtYH4sPpxHj6ij3mdz/187XGF8mx11uti7jd9fyHW3fxmoe2SL0nDVkKOdlCeyp6+rN
         ndCvEs3YnWwup07xVLhPl8n71TJyVnsZZWEJr1c18Vc7OOJXv0aUCbMCC14wyE+m90Yw
         ge+RxBCc0KuVWOaeGgOSO0sUr0hM3OMX4rXpr7HoyVYMW/Un1s4YZKewf3HFUWiBvelN
         1OPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661788; x=1793266588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJKNlBEgCm7p+7oPCoUM5zbUFRV+dndiBCZolGIq55k=;
        b=rWFfd4oVAW21iUk495j4BdPdAuyovsuqTBaAsVoFfytrMcLwCnI+FRRrPfgXXiDquj
         k9FjNpEz++3kDbo6KUeQnsNlnepNdUft9AdoNpvikgJr4wB9JBxnJrjey1zvy92ahntg
         tbYfVYQeKYYLa/GZMJf9l5rTrZsJU5YZiM9b+Sm0F9Hw1djVNq9qssPQTTMrsAAVPn8i
         zS7QJeEV/3oHHmfq+6m99QdlCItkVc2pZJhDarQ13Fei4uwgL5+dFQ62xEE7N37DSCWD
         C+za4OjuMs288idNg/NuQmvNEdozz/4JpSXnZReBvsbxYm/jPk++jhfu/2PgDJDV7M4k
         GZRQ==
X-Gm-Message-State: AFq9FYJLba6yzzcCwdFt/3EdQdfH9FTwNv1nvzZGu75rXrFfZBD81mut
	sgJQLMYJCbrf4H3hsSwU2teDLrmbAqM2dB4VBYKiByyUFTZXtvAdC71ubmzCplnySPx3JVemGpz
	Lnyou
X-Gm-Gg: AYBFou27kvigX/l1z2Fj0FqK0uWQknJH8HDWQ4b3Mt0PhGapCEjbEFhzXrstw4et0IN
	ng7Sg8UT9ctsQkKVSaLoUHc8zhxGkg70EN/i1llor9tzuy4qkQxM/mopXsul8SJtEn+WWXguJk1
	1/x0s7JRbCmMd6cKQiz5IqYmQ9VOSFfZX9lFfr7ultgFiuctxJInXJZ1qNOQVI1jSbxPnCXy6O+
	EJYON6zmZgbITR5whi3SMbv2HN8GTh6l8GNtMXXcXPJ3GW6aX0EM0ozC53RzSkBH0RE3g0A426o
	ycCZEAlw77zYIRz7/rzoCSr02Du9bY82fRzM3lvFUSOK+cBE1QvyRRhPsZmXP5rS3y03KEb79gS
	1GtDEV8kvtsyLjo2soJIth0KSuPohUpVCIkOd5W6MQsCpXqVd4kcsGIrAYq0RPUZcYLlDGvrg4z
	8KrwjdTCQrgObu8Ixy1+QbvykVxvKVsBLZsZINWguIEYyH6HUpvcEpuVNnITkHkNh4onsqT1xl3
	Ei8PPzBh+qKT2tSomR0/F4YbAZegT4zKFbmRDnOStu254vuD7wkaJKXMughIXXRqVQ25Oo=
X-Received: by 2002:a05:600c:c16e:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a1fdd2aa12mr101703615e9.12.1792661788000;
        Thu, 22 Oct 2026 02:36:28 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm53299485e9.0.2026.10.22.02.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:36:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:36:24 +0200
Subject: [PATCH 4/5] arm64: dts: qcom: sm8650-hdk: add DisplayPort audio
 playback support
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
Message-Id: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-4-8a189c71938c@linaro.org>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=857;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Vzm3fMq8aK+Ti8sUZ/4U0hRCLJJYQ9le4GA01KYf05Q=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dkXfSz6pon40QvPlwPcCqOBNsGmIGdye8IN80bT
 v/jWoNqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnZFwAKCRB33NvayMhJ0Xn+D/
 9H8I7lfUORQxWJ+UfKeeMvM22W6dCz3bOszJL49C8ZmKtetMpLDbp5xtbr6XPkv14s5pMC+G1p5y+/
 TA8pb6E/i5FhS8JXXDRlsZOxhz5kHxpYAV70R03L5s/DLr+2i2Nhn7bFfx9lwRrhV2rhmcBL3qsBF8
 FpIrGfBwQe68aH5bpHIo2yBDRWNpvEEivV6/KcBsIbs5lEaLO24Y81bgy7fwxFtFar6xA6I47mXsb8
 bDkKawZhYvkOqW+flyFsbT8mcz0axUI4K8h6I8iD5KM2R5tEPGAeQ1dAQSrr4VOhAuPi1igMgXamow
 u+HK5SSg9eD5obIvt6dNk5Gs4zodPg6QANj4B2xgFU/Ne/F5Ancye8aYBG0PcHeOMS8iLHkPAjmLxa
 +AzMBvxXnoKBMK8BFP9P/nqvO0xXek1HJyK9chgBT93NWKGTQznPcVFM3xcr3FBQtrBnNk0bYBqlN8
 J8DpSYMiuPEOrrKsiMzqO9N1g/tJAn9rPpUpHpBAGEn2nYRaJyr93Z8Sc16A6NwNT/w7YjjCYP8F1A
 j1+obPRPwreIZCgGB3XNzMXkmRT5uhMKkInLNMXPY4kkYOpdvkZS9HuMvxuTGKes2GasY1K76Lrpfe
 0V2FneMUZ8NAtyUaBCCQlVqdermwR1M+RDscJTqoNR3FMikFHt6QSMqgXNNQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the DAI link needed to enable audio playback over the
DisplayPort altmode output.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index eba989e6766b..9e603ddebd72 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -234,6 +234,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		dp-dai-link {
+			link-name = "DisplayPort Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.34.1

