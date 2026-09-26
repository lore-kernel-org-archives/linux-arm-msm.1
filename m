Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150CA45D5D2
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432906; cv=none; b=lTmyJ+Z+HpjR318RMdm5GGXNqvh8xKWefMqr8Z70kf963S6IfoCxfGtnFnrxvip4RZuqgp1U9e90MoALRKbeS90IHbSKGCBCy8Rm2Kt04Jyi4pfmfsTXBFnANlWhZ6SLUKKwB8AvRjNhqtASCqxXBmMwCvC3l9O6NAB2JLojR2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432906; c=relaxed/simple;
	bh=7vUh66oXceOvBZh+BHUwEREpPut071+FDoigXD4wyck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hcmNfyt4JHrTW4bA4NI7VBSmmqhGZgZfHx+dmc0cU/pez8dDAROl/1UCWwltapHLrGnAPCO7uOcyxVWr1ZJnCvy6DU0XOY/ojqa4FxFlNtQw9NwfNjPfmKyEEI/3TeWRKiUeaeXMz+3EWkTGyN8rSvgi/GZ0GXeSb2DPTG4jOak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EKyalSxv; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EKyalSxv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso964885e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790432902; x=1791037702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRyn178SjOYN2ExubyMZSe0BAzVjg4ClqLKh84+ypJ8=;
        b=EKyalSxvq0hBxCCIXaymCWFifaWylDdddOEbRxrZiziaYkZky1xJTW9IL3rbKuo/QB
         /S2h5nDhk4I9Y0Xf4OwFv3P8bAHzQVaPOyuTqSNe5iM+tBdzn4hK43R2ckKqC40FOY9U
         VMs59fbopJ9IuxAOv4dTpXeQSKdsWc7AgHKc3wa1ZTwIneNplp5bOBeZmL+keLfLK3+P
         yWFMbpWx+Zi/CyxScfdOPeHMyJEWF8CpEJQt9J51hjZn2Fk1EF7tk0IRCH+PKci47yzB
         ve2LhHsK1tNbA4Q48iHI/1+gJ2c/Xqby2UeoSctSgEd8J3MvSvtYq6sQC3E8qm6W9nFk
         kqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790432902; x=1791037702;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRyn178SjOYN2ExubyMZSe0BAzVjg4ClqLKh84+ypJ8=;
        b=Fyo9r/U6l8oJ+1GnGLsSPPu1LhPXgpzynztf9igdGZaMSmSrJfTSzpfWmbMS2HxEN0
         NHSILwi7C3AZKtU3eiWaulCUFJy384IrKWvU4uWxfg0+J24zIZJvVYL6XKVmXW/C7HQR
         TvOQzgrHuJPQTbAAGD2CMRxjPSfi0VDj6Tu8ANJ8bpRxnc4I6SpIm+iJDU1H8IfOmogL
         DumH2Nv7O2mm4agycZSuZzQWZX/ox09g2uobj/cGI3YxdqMWt9Kl6ZH1E1Q0QCR53YPU
         DcNI1N0U5IL+ljmxzFTAANXv3tilW1Ti7QUzUKhbD2oAUSmXAHQEcER4U6XY68Thtb2N
         2hnA==
X-Gm-Message-State: AFuF++nPkHZwhnnHjs4Y04dWuO1ZJ9ynuCHzJv3vBRloxXivTHd8DOKS
	wq8OOQZLSWG1Wl3SaFZI5GOswS20lNNdRRSt6gyuDGrIf40Ecd0YBbfYbHTBqHLu0GQ=
X-Gm-Gg: AYBFou2FyMNI16zg4P1Q87ujViHGN52KDcwJ9xYGp5VZm3iblBmItBrFi8lndH0eDyi
	VGXx0wm+w34dXlTcI5alK90MSdHfeCnzS6/c4gN5OCsdkmPJWgdBcFvm6fl8A2+VcrRrU8bB0Rj
	21QlPRI+E9VsM87FuutGIpoUZyWIghbZJcyHlMHfNJumoplNf3IV69LWhBdYQQVU+RzlZQjNjc3
	WYSSrO/CciekB+wfo73EoOFF/Dnp4leVR1UQQ9lcllvY7uRuCMFB+GwIzE3FNkohMWGvrpz6reC
	BqUnDN0IEb68UEg1ZWhauc02WeSqvhaXZehq82QqH+MT/iZInbnDyYeHKxS2PnGNtPyVq5m8ZTs
	IK+LmRAY/T2tuPW0Lqby7Bp2Zj0EN0uI382lzIKBFCsS3nPq4dsZWJOI376yjTqCJX1lNChyh63
	+XwZS58TprJkl9bdmEYQmcoJfQJsafO0HO/YQFjlAx9OEjoUxjUDzFFR8ho67IBY9+qf9gz+XIg
	OJjp3AvMQmdWhUPIlEKFA==
X-Received: by 2002:a05:600c:4f12:b0:49f:ce78:356b with SMTP id 5b1f17b1804b1-49fe6700d0cmr169059275e9.28.1790432902328;
        Sat, 26 Sep 2026 07:28:22 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4271sm320463865e9.5.2026.09.26.07.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 07:28:21 -0700 (PDT)
Message-ID: <d2a29116-967b-4ca1-a6de-510d68afec0b@linaro.org>
Date: Sat, 26 Sep 2026 15:28:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/12] arm64: dts: qcom: pmi8998: Add USB Type-C port
 controller node
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-8-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-8-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add the pmi8998 Type-C port controller and PD PHY device node.
> 
> The Type-C CC logic is at USBIN base 0x1300 and the PD PHY is at 0x1700.
> The node uses the 'type-c-change' interrupt from the USBIN peripheral
> for CC state notifications, plus the 8 PD PHY interrupts, including
> fr-swap.
> 
> The node is disabled by default; individual boards enable it and provide
> the USB-C connector description with PD capabilities and port graph.
> 
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/qcom/pmi8998.dtsi | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> index cd3f0790fd420..878e577c667d0 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> @@ -24,16 +24,43 @@ pmi8998_charger: charger@1000 {
>   
>   			io-channels = <&pmi8998_rradc 3>,
>   				      <&pmi8998_rradc 4>;
>   			io-channel-names = "usbin_i", "usbin_v";
>   
>   			status = "disabled";
>   		};
>   
> +		pmi8998_typec: typec@1300 {
> +			compatible = "qcom,pmi8998-typec";
> +			reg = <0x1300>,
> +			      <0x1700>;
> +
> +			interrupts = <0x2 0x13 0x7 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x2 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x3 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x4 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x5 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x6 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x7 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "type-c-change",
> +					  "sig-tx",
> +					  "sig-rx",
> +					  "msg-tx",
> +					  "msg-rx",
> +					  "msg-tx-failed",
> +					  "msg-tx-discarded",
> +					  "msg-rx-discarded",
> +					  "fr-swap";
> +
> +			status = "disabled";
> +		};
> +
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

