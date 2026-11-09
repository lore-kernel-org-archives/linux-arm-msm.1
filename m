Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261246;
	b=vk92uWaRapKKe8XEBOok5Y1Wcfn/uzLOXNBPvukQEZ4jN+/KZQDhFdulBJsZSdwxb8e5
	 ZRxQNn5qhTwcsEUKegedbWtk1TIK668y7yoBuPbA+AxBlY+wF0+lEtNYrhIHVKYR+enSu
	 IfhOSoFQEvwGKx+9k/I8E2ier8I+wTFP6kSUaaluQMcfco84rjkKKJhognwBTV91xwsKj
	 unSH2DgFsehPMcQJwmFO8mxpLTff/8pPL3NZgQb9vojmHirS8TgWXLmHBO2FUh/ZmC0PD
	 q1XrYq8zpNGIY9KW+w1bgqzIsyAA96KCB4bzxBr2AgPTIknlsH5MkcQTfVq5++2OfcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1qMDA86n23QkRHQ7NDzdjzzCwQYU3ppwfnDZcp0lbw4=;
	b=YUVNJyCGbcsgjEWPDw2WeqOEWOWQmVb1Fj3behZUeNhHWbFPgdei/c+me8tT/9Diugrq
	 aw/DKrApGDHAbwpjdordHO/zZFBkla1CRQxYCsr8oZXGhDyAv3MpB/giLn4S+ri5KKQZO
	 UZqVM1lw6Cj02+UyDA6/zNUidYS3uDhBlOhsMyDIH4qvxV7fKuNPUMowPZ14rFSW02UlV
	 C1CTwWgF0j1yw08kzlmCr8aJXbkkNQ42eeMm60vtCj2WsSAe5WwxwNYfNZ68U9YHuW8aa
	 ciW3937CnRILo0dEyfZgmxBYqlBQ332T4Phg3qhPliAz8oIjr+nfmV0Lg1bO+ynD7OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JpGYn+ol;
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93B2606A321
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 21:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B93B2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JpGYn+ol
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67bef25eb92so1951399d50.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 13:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794261245; x=1794866045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1qMDA86n23QkRHQ7NDzdjzzCwQYU3ppwfnDZcp0lbw4=;
        b=JpGYn+olxwP6g1AsWQ5JC0dZWj25OdrPJQSEeGtlGaKzWLxHImPHrLKLik/zep9f8E
         x5Sj8992XN7PYjydp9+BkADH+ehh8U6hx02X3mkJN59R02bg2az9+LivqTORKQ3BG0uD
         UTfCQAjQNf8/XheFYBjWMqrpk57fx8dzoOH3S2YJR02Dd2DHy0iF+KbdnHUPf2m+G0oe
         MW0vG3joKSROH7DL4PJ3voUH5wtCNhx+oFeYdNPVgcDSj3fLJaKEh6h9yf2YiFvO5lG/
         9BwhCJnK/YWyqVp5I6S2vaqemkSVhAou0xGHEQRTGSyLeIbZsGsUIyLkJRXQ5klG+D4J
         aKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261245; x=1794866045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qMDA86n23QkRHQ7NDzdjzzCwQYU3ppwfnDZcp0lbw4=;
        b=CW7I94XlZ8mlEz0fqvcw8YCJxDOqTs9O62efkZAJGeuwIDfc4WYJ9VuQ0pYXhliNa8
         cDRaQPUZcX255qvx8JnEC/Bgo9ei5avNL1MS9NF/x6nztdPUrAQBnZgwOVio2H+W0sy/
         0mEV66l/F6Oqki0aWt5gx9hpzw6Lf0Bvr+sHnAZXK/ukWP4f7onoLr8mJY2p4iYcGecY
         DAPMOPJxoyB6u9rUdNgAJBFmEzj27F7IbByHwlPX5ndD6EN3mPJXngBPu8Y8UGyS/fs4
         +ZVm6sWoSPD/w8mEIFYSmcCbZDzb12NPr9M4UKRqJ+En5sMUgMFEowzvWrJ1P6Cjkdjp
         XobA==
X-Forwarded-Encrypted: i=1; AL+hErFt0N+H3a4Ypz8YSR5Di84cX/OQL+jKX1LP7ra0xaDz5zM7Yk6AaIu0/58RlbF5dYYDj3TBfS0Hhu6zz8BA@vger.kernel.org
X-Gm-Message-State: APuU4Z/FHg5Rb7yOKIpfq4ANemNwTtJQ0fqBPbKnSkUZ64WvfpZ82Ghs
	At4XQ3jAWFSneJfEXkOVM7Z99e5XpMlosNS53dNKmgsdL3tXTM3oe/qM
X-Gm-Gg: AYBFou1Ms8eMKDYeqbKstTXBV/2WERgnRU373chSGyX4u2AAn8N6mpMkDHd/QLegrkI
	PC09nuXONY7uMUpuljtQv/6ObxkRZEU92lZC2I/Uk02lRHGKSIiu7WituRPocUcbrK7zsthHXWX
	AO/I3C4T7BhsZuxB++8HhyIRqPNaxubeWnntJc8jgbP7/4zxvXOJkCgUiTnslDa08ORnSZeUQuh
	0xjDFUxQ0MrEjhjQQlmsDU/HCwpWHm58W9IWfDM3HcnBUpemHqBJ3QSx1otmRicEmRorUHKgImG
	3dgEx/Ax1F53DTTxE1VXvWF420GqWaLNxATJ0nodIs+Ed7kT8ju4yTFfmg/4swyqkSwJVDzPlYn
	q2sQctAcXEjh149hCu1/K4LyewE40DflnTU62RbBbwx7YwUOooV18Irzqyb1UYl/sNaSuNDab9e
	0O331H3b42sKJNqVExvvkSExWnkMZZK1MCmMyqb1SoYPpB1KUoFAm20D4i2QNyyoZ2NNqETEUKP
	a2FaYKrIcT01VAjRQ+/LG58y8b8prJLzqAdoF6EZCZ50fzPWjwcdZ4OayyZ7EWb/fk9JIFso+eQ
	MzqDqtaa+dEHFErabJAdnq9GDN7TJDa1ivO3RI9hE4OQcdyL
X-Received: by 2002:a05:690e:4505:20b0:677:c21a:ea51 with SMTP id 956f58d0204a3-67c5711cc8fmr277638d50.27.1794261244652;
        Mon, 09 Nov 2026 13:54:04 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a3450sm334827d50.4.2026.11.09.13.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:54:03 -0800 (PST)
Date: Mon, 9 Nov 2026 16:53:52 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom: add missing tlmm labels in
 examples
Message-ID: <avJA8HhGiFzC-tJM@rdacayan>
References: <20261109-qcom-tlmm-ex-phandle-v1-1-b77b09e6ec9b@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-qcom-tlmm-ex-phandle-v1-1-b77b09e6ec9b@oss.qualcomm.com>

On Mon, Nov 09, 2026 at 04:57:25PM +0100, Bartosz Golaszewski wrote:
> Several DT binding documents for Qualcomm TLMM pin controllers define
> the gpio-ranges property in the example node that references the tlmm
> node except that the label is missing. It's harmless as we ignore
> non-existent phandles but for correctness and consistency - add missing
> labels.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml   | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,qdu1000-tlmm.yaml   | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml  | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml   | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml  | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sdm670-tlmm.yaml    | 2 +-

For the SDM670 portion:

Acked-by: Richard Acayan <mailingradian@gmail.com>
