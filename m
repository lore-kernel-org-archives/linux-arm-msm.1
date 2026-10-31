Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793446957;
	b=j2fVwrW2TFebjz+KmHW0Lc+Hv9joYA7noXv/L/Y9qCWy/DvFctFs0qECZkvjP3Os0Hpo
	 25gztSL+rpZnJ7EF7qHiLGEw6StGtnKQ8WsAWXTXxRJbvXKoRaktVfaRNDP8a5ng7jziB
	 P/6ztYp2epTGcpk4lQPAp7dXDlRj55aUeMpb16MePbqbAS6UD6KF/LVM3tmrJ8Jg4LEhv
	 CPph44AWFN6/tEp9Cjdk7ig9hdiLpi2D57Nr1tse2wdIGm9v+Pp1duIw3B5MHFMMigitL
	 AsKqpgmLlHenbWgQWS7SLqEfLK/TGIYDeWCop4iUOElM+RW5wOCQ7MJ9uSU99z4RW6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793446957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=upwfxi0DBGFEpM8kAk0eqTBac2ACweYPhkRwvSbMeZg=;
	b=bLPeuxBAapUjydK3hirvdhZN6tScQLWuB7yZpaDxMIQ1S0lnFdEOdk6GEE3dN3TqQvev
	 w0P4nQ23q3j0eOhtY8u8ikQWeoS5ArD1YJ1pQzXfY2rUI+nNJBxrEznsriepBeg4ZcLiG
	 prL+vZdvUJoo5sdFiQvbD2sBWBk1+4DXeXmAjMQniDZNzOHOW74kF7ElkTuJkUgzH1aEe
	 7q1XjuBr3FBp7SkKUHg+rVr4o4qKvPNkArAkCZ87jtbPI3GsYjNZPUp9tlJwQgrt/sKV5
	 waYgt0twZh/YvnwdEmHmJlvWmRww0pEf6uxNiVwRw3cEhTeRS6FBm0WB6BXHUAqAySg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NkoH1ROu;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46876606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 11:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46876606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NkoH1ROu
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be4716d76fso226294e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793446954; x=1794051754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=upwfxi0DBGFEpM8kAk0eqTBac2ACweYPhkRwvSbMeZg=;
        b=NkoH1ROubAkIWDPJ1im0+DFkTYQ+QDsHYpHJ1b8JVv+AUR9kcj+duOMIfsmFLCq1qK
         enT3w2pAHrpQwp47W6dI27rwi8EKz3Iym3s5uKJMLdj2KZj0A/NjGOeM3+lHpRb/LdSq
         08bXx9xCxLgeuqrMci2rD+XbGl1mFl62Uez72WHtSsnnX+HEyTmEV4tDW+n0x6alneih
         VqRZSvP6mnGJy7CI3mEWU3+ity1xemK5Rfjr946pzrYEcW6GZtcUOqgZKRBRD7MmnrHW
         OZxvZpWCHTlwzTqocCke0IoUBhtBN5m9ZqSbDbFUxPTzysYHxj9nCiT1lcBDF5ZuKL0d
         W9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793446954; x=1794051754;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upwfxi0DBGFEpM8kAk0eqTBac2ACweYPhkRwvSbMeZg=;
        b=HK15JFAVd+HylkGL5zwtcGG+3KNuZYE42ed8dpb/kvNHNxAzSp8z0uqiib6mhFVmUh
         ldjyHdMtVckO+LyhMGIiHEhl/5RWWxgrC4TG8ckPk5w5uSQtvh2tq7mA2Ll4oZmJ+zjN
         i/lGtqpjTU++6vMInYd14OjhE182GdeUlzxIs0ZEbBUZFI34ViZXsHbaOJ6iOmiuP05D
         SPs/H4fARwEBfBAxyTLZyULNYaHulzvxvFZ0TatOrOjJGs/7Ouy/TIZS+f/t28exBEDA
         h/NV9WY/qp9ER0+Tk0+cz6fMpEzbmn0/qWUOfPqbv/6hfcWDX3x/lGFL9zf7oncn5W2u
         i+CQ==
X-Forwarded-Encrypted: i=1; AKwUvBws2iIvT7l8iks3nmHKPFjepSKW2Ax6OhyeprkFEz5gWlbIqtB8dq0n4+RknnkeJxwQEJp8FD+ipMW6s05w@vger.kernel.org
X-Gm-Message-State: AFq9FYItg+HU+k1qgADbAUBQtkGJfSPBxP25MX+uvR91fFQfygrD2WXx
	+BRjQqHh/s0B4ice92yRQWG0CAgQ93oflgUYabZwvINqB/Fsxt+baE/DKzfjN5PL65k=
X-Gm-Gg: AYBFou0VZN/8juiyODjKyHnr2C8yYT1RoSsO8lxWuG/uuIQvoyMfQR32eo+VxQmlt/F
	BoB8BKLY5AAJ90/HWXp1Pv2MjJFCMrcrzNKuAVHZyNV3AdCoihfK20FwvXiNYNS6Ksb/EsjtVhx
	4sa9bpxRw4gZhlOLFvQfrdrhuo7HrHeFOUuvU2lcuWV54mFmcdvkYVfXnnvQ3MF5tqhZTZ7tkm0
	4YqWsx+3yUrqUCJhakvvJQvl7sPZohuNB0aVZBCQcjwKt5oO+Wz7YhrpIdawLFzWgIh9NQ4EbiR
	s7dvJFsxRdbe1fhIJ7D16jBNPHfpUzp4Jkq/687Kw3A0L+PYA3JmtNDlbhDIHa0bsf/AQpiZepW
	ci0PaFFbDPlUe/yRtFI80YRhKbBR1GmyrXKG2W8XDazJeEA7m6blLqCq+SlHTsZUahJUfRLKnzE
	500SW8hjAgTVrVm3GlFRgLEJUOM22W4uzSNKteEd3DB9/QgodJxHJ4Pqa7ei4toW8cZhbIoiPxY
	FN/ZpcCkPSHPrbf6zfu1xbJ3WJU1aJJZa+S+GqvFao4tpdZcWXaUTS/0l8qWdTU3IBn1ezXIWs0
	UQhpQ+9wer8YuWP+kiBbgLxe9TST/wA/q6ov7sz/830oej7MlZo/pv7JWtTH81P5sLZhs6Pqs24
	hgCa/Drs=
X-Received: by 2002:a05:6512:220d:b0:5bf:b8f1:80ce with SMTP id 2adb3069b0e04-5bfd9578721mr1660720e87.5.1793446954460;
        Sat, 31 Oct 2026 04:42:34 -0700 (PDT)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0740446sm536809e87.61.2026.10.31.04.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 04:42:33 -0700 (PDT)
Message-ID: <c10dbcfd-b9d7-4ac0-be30-6b78594bfdab@linaro.org>
Date: Sat, 31 Oct 2026 13:42:32 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-1-95f250b18612@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261028-kaanapali-camss-v23-1-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 17:20, Hangxiang Ma wrote:
> The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
> C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Wrong, it is NOT compatible.

Due to the functional difference in the register offset, which is
described in the patch 0002, it is NOT possible to fallback to
"qcom,x1e80100-csi2-phy" compatible device driver, and there shall
be a new stand-alone compatible variable "qcom,kaanapali-csi2-phy".

> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 1f1e2a4993b2..6e9eb8e265df 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -17,7 +17,9 @@ description:
>   properties:
>     compatible:
>       oneOf:
> -      - const: qcom,x1e80100-csi2-phy
> +      - enum:
> +          - qcom,kaanapali-csi2-phy
> +          - qcom,x1e80100-csi2-phy
>         - items:
>             - const: qcom,glymur-csi2-phy
>             - const: qcom,x1e80100-csi2-phy
> 

-- 
Best wishes,
Vladimir
