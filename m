Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893597;
	b=ZShppx48ivbPeHSXMchdz4xSE7Hb8FQ19/NiD99/WUHNw8/dKFe12XMMjxlvsx5p0Mdw
	 0UoYU8/Zrh7dalrD+XdlcO/+SmmreMDUsw6f+Ayf6nRfdXNKYiShqaoCKyvR50DXoKfkO
	 uZ51R6qiWcnYB7Y4WKluLfOa/RULTG3qPfoJdFiJGc0i8/2VP4RM2+2EYov1eVUoSRxU3
	 7Q1bSp3O+SFxdSH5n27VJG4KliXrUFNClhmUpr/5FSXzmgxRTlINVv0ccysZtEKxoGj0S
	 YjXJvLKfUxMxwqLPFIg4aB357kaRWfRElto3dk1hmVUjWAPsyGac/Ldq5MSHjN1C22Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Cz1YEfgAYIVyaKhtnxIgh6hL4aaxiRbKUnEOpQeT7xk=;
	b=tImFeik/tw4Q5NKYneM/T6D/+gNvjBwfh5xNOPQHc+qDIeywJEImlXjx4N1kiCe0yH40
	 rsqLHbPrUhI2qEu1jDTFH/+C686TXRxDAR1ls9Fk1Fm9rL3UY+hzWe1cUcVuF0poa2G0I
	 C+NLwbOyEY6rukyrYYU6TpPLGb6cDAt7elGyvUAqGP4KZEkfOJtWQdmUJ5fZW/z8jVQXc
	 scN6nOqKkK5bgX322Iple5u4Ubs8MXvdDEd9cVxEhSS7e5yZbQhlFF1BxvYSTYHvwV88Y
	 XB8GawA4Qg85s+vpIAwrouYFtL9y3Y3dfyoQmnLofCb7oYmHqsnCJqu/X5MEGpNEo0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AGL+KI8L;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C72606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 05:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C72606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AGL+KI8L
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-372bdb942dbso3827137eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794893595; x=1795498395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cz1YEfgAYIVyaKhtnxIgh6hL4aaxiRbKUnEOpQeT7xk=;
        b=AGL+KI8LRIwJ8cdflaNKNFX41d2JvLSAp7FK7DVGhFMM95xQ2g6hkZnMXfgy9Dk+tz
         jF/FOlGQCot53XTV7jjbVzexEd1ibyLLbiTnWYmzyGIob6wfhXry4Yrmn9Xjpx4n0mmx
         64xX9MjzM7kY4bo5/t/gzirbKWGfsp9tEyCAHOimcl08rU5Jl4uBa0Wx9mSgCrQuQqsP
         BuKV0XZjl8k+qcTtAmGxUGGvp7T/UmVu1wwVOJRLskCsA7D8hi57ogVTzIBQqTPazWwz
         2lnQjRhPrDRp+kLd+NWigdsX7LEWGmKltMB5scA64g+l8CZQH+UdN3I43rrZuJuzgNuT
         z4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893595; x=1795498395;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cz1YEfgAYIVyaKhtnxIgh6hL4aaxiRbKUnEOpQeT7xk=;
        b=ahjSmfzo+Hthxg4RzayVMvSoEtFQyoJE7ThH1A24jdCKHQxP8ecbVBmBwpXX2+T29f
         gqEfFtKXgvp78iqbtxYe+4za2iz25kGXvYbXkVELt27wCBbrJk1GH51MVm6cFgTUhTAp
         zqSc7vBxA7Ei/RTrxvcPnmUn6tfhiUCWue6CeSIHZjK3czgDfOExNMxaOPaZYkj0T9h5
         HKIOaJAHjdfqm8n8qfjM6lfy8Vp68+jKKPikk8EtNXohuQtNNMuRZpUsKJTXgo3wI52J
         Hr4t9orL/sk0+Bm+owbn4Bfdtz7trij4xESbaEV3WVnaRp6EPI4rnW/M1zmUoKMjrns2
         RU/A==
X-Forwarded-Encrypted: i=1; AL+hErGAXHAPhdBextaNy5kX9ZM5kvQU0OIp16LS2qBAK7fGs17qey3phFU9jRB8xXXvaP7dRh2JdSXd0O1P3vn9@vger.kernel.org
X-Gm-Message-State: APuU4Z+q6GPpsklHd5Gsd8es27I9ANn1BJn/QAVTzdz+P/Ui4EXBlKxF
	VoFjccv2h//RBQvod/sxaFqXrVJKQAP76SCntAqvC6zcqJZ7VYE7OnL+YyjHDxQgDjE=
X-Gm-Gg: AZFdTZfi+P1iaY/WcH3YyetOB5BN3WIS7wEgwy2Vv/MG3xarDLgNcBmIAgeoOrOkoyH
	lI1SXj9yj3KEQ9QVcOCZc2Lez/frRG626gvupklwa0sCqeO5g7Tt4l45LP9jqQPh8/l10+8tZhW
	b9I0GFJfSxM8FCQwp9728En4iO7Yz1Tn8AqLJr3Hwg5FC1TvDF0Y+uTnd1AssgMDoi94TYcaXQV
	9qEIAsz8r6HAfkHtxx8mjiGrnONTrhk2gcrW7zkgeGCd9bFNslKoaNqqw3ecOWRaTZ6fIL82E8x
	ZcSZ79YrLV807uLZLG25SZiY7jA2JKd6GJImsZHzWHTQXIHKSKBoSSKxW6dpQuAZCLl1WcI1Vao
	tTQ8GSn84hz70I1frxojtIZw7co/iwTOL9ee8mw8vMQs49aT3ZqsEj2Mj9SoZF1JrdDLOfIVBx9
	7+SI9A5HwMTVmSpK4A0EDHk3vInzlCYplOWWsJmX4AIhn8E89fvaOlYr+BjZB8h7vbScRP1AhAS
	+AdtlsIpGrCD1Kim5khY3Xg7EkKnn4bInkdrCjMGmzXQjaGMOfbTcVmxdaPawm3Fpet3GhNdHjM
	YMOSyDgv4MEXnVXOQq7pnYBW6vYYFQ==
X-Received: by 2002:a05:7301:b06:b0:376:13e5:e8fe with SMTP id 5a478bee46e88-37964b08f4cmr11532201eec.3.1794893595271;
        Mon, 16 Nov 2026 21:33:15 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm40174212eec.7.2026.11.16.21.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:33:14 -0800 (PST)
Date: Tue, 17 Nov 2026 11:03:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Majid Hajiheidari <majidhhdri@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, rafael@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	abelvesa@kernel.org, mani@kernel.org, admin@mswin.me,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: cpufreq: cpufreq-qcom-hw: Add SM6125
 compatible
Message-ID: <avvnF7zQfYhF11so@vireshk-B250M-D3H>
References: <20261115003158.391171-1-majidhhdri@gmail.com>
 <20261115003158.391171-2-majidhhdri@gmail.com>
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
In-Reply-To: <20261115003158.391171-2-majidhhdri@gmail.com>

On 15-11-26, 01:31, Majid Hajiheidari wrote:
> Document the cpufreq-hw (OSM) block on SM6125. Like SM6115 it has two
> frequency domains with one register region each, so add it to both the
> compatible list and the two-region constraint.
> 
> Signed-off-by: Majid Hajiheidari <majidhhdri@gmail.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> index 98eb36bff..8dfe77d08 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> @@ -28,6 +28,7 @@ properties:
>                - qcom,sdm670-cpufreq-hw
>                - qcom,sdm845-cpufreq-hw
>                - qcom,sm6115-cpufreq-hw
> +              - qcom,sm6125-cpufreq-hw
>                - qcom,sm6350-cpufreq-hw
>                - qcom,sm8150-cpufreq-hw
>            - const: qcom,cpufreq-hw
> @@ -146,6 +147,7 @@ allOf:
>                - qcom,sdm845-cpufreq-hw
>                - qcom,sm4450-cpufreq-epss
>                - qcom,sm6115-cpufreq-hw
> +              - qcom,sm6125-cpufreq-hw
>                - qcom,sm6350-cpufreq-hw
>                - qcom,sm6375-cpufreq-epss
>      then:

I hope this can be applied independently.

Applied. Thanks.

-- 
viresh
