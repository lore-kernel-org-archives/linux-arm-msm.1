Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672723;
	b=bBYPVHE/eWvf3tlvXCz29xTrGSnnN+6Nz6G4PxUxItNLrQgt8Vk1Oe4ItEZqc4v4So2E
	 /AxVqxaNg/ZTLnNkb6BppZg2kBOWpIqbKPP1QL1bVznH+POmiieOUNFdxqHJroR+JPHoc
	 TbWv4YI2ZM+vIhq/sDtwz+ZKZXAtHzOLwwYURN7SRnROr1+XaVaEoDMM76fScQLH+hDlK
	 +Nds7QCDBgOc20CR/Erzizn4Ow7qRWgLMBX6LJqCHPGQbuSTMeYrAVpq2R4OiBiJWX6Nb
	 Xe+J9SswzB2d4aq1Clv/wo824GMuadgDIj/jSM31OFPDWrC/afVihBqNz4/alMpCiJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=z9mqzTj0TE8Dvmu37VtnOOjrtJgwrbw+0ALBo5nrPOQ=;
	b=IS1ES+Nl43WZqTduXZ9w+yEdnh1NbB9dY451lTVsBvART8mgkKxC34CLz52h/PyX4mTB
	 95r8G9rYwKUjq6emSln4bIX/deVT76lne8wcAg72I7ol6wt3jFC2X6P5yXXlI3HVzUbFK
	 qNmCH9DUH/CMzzos6BaV040wAhLkRBb7FYDWSktBpC+oe44VqoawP2w52h6JgY+ruA5ll
	 AAuO/zNLcqOCFk6oYHZe4TaozYNBbZ4sxRKLQA05FqTjXziOVwgARQBEMYHei1x651pgP
	 KCg5uVt6hT6JeOspDV06Egm7CwUovheqaDiR2hzpxem7G/FOAOrCZiBIR+ZGBrmRu2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fgwd7q4x;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32F0606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E32F0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fgwd7q4x
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c154a41f8aso501736e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795672721; x=1796277521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z9mqzTj0TE8Dvmu37VtnOOjrtJgwrbw+0ALBo5nrPOQ=;
        b=fgwd7q4x2oo3KRStS1qxJPIf7HEppN3pEKniLX3DvaQ0dz0mnDLUa2B/J80XkRGLOi
         uSj/dv4qEmD1ay9SwXIH7KcaJQuiL7PMmX7c5wHN6RuL6Iy17q8zb/Rj+q95xJ7Z6TcF
         1BADaB3ltf+Lb76igC3VlFAjUcm8+/WK2J8qvBZE+bakF4FOrIofJyCkCxciMA0qDFZ/
         mt1MEueLyRgt341f+wZm0DcDAVFuLDV44Fycw7rkElZgzXIvE6XeK/gJPEY3IS5cYIQN
         gtNxHQEJvjcIdA4k2GIpzChqsayFFFu9FnSGq1EgXCABDVOyZxlbRyV20ZoBYkdGY6zy
         w9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672721; x=1796277521;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9mqzTj0TE8Dvmu37VtnOOjrtJgwrbw+0ALBo5nrPOQ=;
        b=wI5xz6DTBOZUOLPuoKKKV1uZIchyV2hT6qF3uYiSbPiOBmhV+BMCrPIUd2t7mbC/08
         w4YtuHDTcTsSg/ahliKPWNMxDiUCdFzXdDx4t+tlp8e6iVzm3/C3zOb+SFbPYiRf2KC/
         LBO/Hzs8mdzqF9SxnCObFbkmGDZR9CXQ473Ash+GRD7cdcrc6K0r+CN5C6lH9LCtF7cn
         fr88on7493AvWHCWz4ef+parTyI59cCMvKd/sBPf/Zzt18tHhqO8QdAX3FHiHeUPsNjN
         8/QX/+GIEvsnKschoZlPsgvFQRpcQWYIV8BfjUcrIFq0kVASJGSP2dA62rPg+8b3q+An
         be1A==
X-Gm-Message-State: APuU4Z85LbOygiLnl4nAhGnVVZoJlR+tevv9bwbDGFPPiwronocWaDzc
	GV0VWeB9iMW3r6Q+IdvkWIo58PaE84COTGo53tmHwTvGq7qh8jaWhXT5+H8ehTmZn2s=
X-Gm-Gg: AZFdTZeDFkTX86Vy78vKT1XV0HTrIDO3xfSSjp58U8h7WhscW2EZFgJKDKXFLamlTJY
	YCwBRcY7HX2vJ+XU1YNDxMnrMfTOy/8fiRxxvb/1iU96GlkDes18Eu8xeHvGCq44d0Jw8CpB+an
	linQxTYUzM8ss8GjD7b2Z+QeWQE11x6JB1A0R2mWNKdgApk8Owj4STikfkZMRqf8zTsSfhrXtZo
	guZ+L7ntBhA1ljgyX9UfwMVbdUu4KKQY85lm/1c5wl/en6pfwr+1PsQKrYnLocI6UzF/BnSs4tb
	JANXm/brlFGb4t5NZjvlrZD0suj22Mm3rJbd67PrnyG7SqPDevjOXNQVEPoy/l09DjhpX3CiVO1
	LmuzMUrhJ2uPGoq9Ejm6QvaLNI4iZq9wXFRmkemJ8lcioHIa3e8rYlVTr9Sa7w6ASFNNrR5Ju6L
	DFOHYjr6/KAs/togSLu2JCateFVR8isJNhrYiaF0w826Ynu1YZeW24oXKUggEzJAPXN0KajRslG
	AIpYLsmEzKUXkbABw+WeoJWzIeCpLw31BfDaRF7Q/T3yvZou5mlpl0F3hfyQarGKd81atfhPYKd
	Nvtleui447BAJ1Bca7D0iohibYGygu/4alLwIDqWsqC8AFgtzniaSqcH5EuUgRbOrWqhX23Fypa
	SHc9ys1Y=
X-Received: by 2002:a05:6512:85c5:20b0:5c3:2506:4c1 with SMTP id 2adb3069b0e04-5c32506083fmr1030505e87.4.1795672721080;
        Wed, 25 Nov 2026 21:58:41 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd043420sm4925147e87.57.2026.11.25.21.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:58:40 -0800 (PST)
Message-ID: <69b8d22e-f688-4458-ae2c-0e75f7b23234@linaro.org>
Date: Thu, 26 Nov 2026 07:58:40 +0200
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
Subject: Re: [PATCH v4 1/2] dt-bindings: media: qcom,glymur-camss: Use linear
 CSI ports
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
 <20261123-glymur_camss-v4-1-d7db74f59e22@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261123-glymur_camss-v4-1-d7db74f59e22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 13:35, Nihal Kumar Gupta wrote:
> Glymur has three CSI2 PHY connections: CSIPHY0, CSIPHY1 and CSIPHY4.
> The binding documented CSIPHY4 as port@3 because the initial driver data
> reused the X1E80100 CSIPHY table, where entry 3 maps to hardware PHY id 4.
> 
> Fix the current v7.4-rc ABI to use linear graph ports 0-2 by replacing
> port@3 with port@2 for the third CSI2 PHY connection. The matching
> Glymur driver data maps port@2 to hardware PHY id 4.
> 
> Fixes: 1e0c8f82d710 ("dt-bindings: media: qcom,glymur-camss: Add Glymur CAMSS")
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> index a0b77edc212319fad69113f3d55ca24f184d4b23..18a38fc4f9025f6b927780f55ed4fab194091c02 100644
> --- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> @@ -109,7 +109,7 @@ properties:
>         CSI input ports.
>   
>       patternProperties:
> -      "^port@[0-3]$":
> +      "^port@[0-2]$":
>           $ref: /schemas/graph.yaml#/$defs/port-base
>           unevaluatedProperties: false
>   
> @@ -288,8 +288,8 @@ examples:
>                       };
>                   };
>   
> -                port@3 {
> -                    reg = <3>;
> +                port@2 {
> +                    reg = <2>;
>                       camss_csiphy4_ep: endpoint {
>                           data-lanes = <1 2 3 4>;
>                           remote-endpoint = <&csiphy4_out>;
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
