Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894081;
	b=bqcyaUWhONANAuPbr9rGRl1WoQ/JQ4HIJJTfhr1YZIUR8X+DutXFYr1WCkxW4UD03+g7
	 E1l0UF3Tz+7+w7kU6vktCpRzglpQ4t9OfRinotfZ/CRIgXoFTI7a/kQSaxkEjOIz2g5/e
	 57XQQYJK3LI2kZ8UzbmukyUZXyD/IpDm0J7gWcG0bYYS/M+oozrNiQ5tU09R7xvvqo3jI
	 syEJUIYKO9CyYsbJUWAWHX2V+4AXveQqCb+8QEAGpqOnqgrjE9EcVlwIaWzKU+HRr9Zv7
	 0BKZJ9lwuCozbW25YTNNB+gnJWPBibFn5RBCcJW6MhbHjVbQzGS6x3kA+OxfSbhFtXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kgXAga4SQ2gGcYIcOPrgNzb4Xfca195d5V/zBY0TA5E=;
	b=Bf3W5cMT7Ac5E/aU+4n6iyEJo8kWgRLiMD6heGa1iEZPVf4QMH/Yt3SaF3ziO73oFx/O
	 ZCvIZTHkpUcpiXV8Y8R2Mmwia2S0+ieJ6TTt2OE1dY1jeBz+xFmc8rNTnENYeKhd8S+iJ
	 5a4pZjRGtwPyzVq9Dh4+kbuICtuOpzmuHH1TZ+ggidP/04coBRbRs4ML2P/MMORvkK1Xo
	 9docaugKNbTJ0dtAAyKs3eYruq4fH1JYc5MyhjG+0idmyW83Rz2yowvnWoBtwLGTxjvZ5
	 ekYhx14jMNRM/dA0gwjzlUebrKkIQW0BvrIKihlrlxr+LtoXEpGlseWNs4YT8XCv+Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PQr3PgP+;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9456606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 05:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9456606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PQr3PgP+
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3ada81853so3923697c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794894080; x=1795498880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kgXAga4SQ2gGcYIcOPrgNzb4Xfca195d5V/zBY0TA5E=;
        b=PQr3PgP+hc6DT0aQU/F4mOKsRUSEulybv2c1ObP3i+DkihztlWEctX0OrUgl6usesp
         LjVss/ez54+GKqptmSO447ZTgQARt4/Hqnxbxe4wKrARIDHxATiTAuXAUYnd5srby+N9
         vIOlcV7Nd504l6AaiMlFfzLDi9l5+R6A7aeaaPeYS/SdAVWDOIhSPf47Riiy2R6M+m75
         Ukgmqhi7cJ0OgnvcKLaHEGrytFD+SRwSV0uvePUfCnI6UPFqzp3h2OWF+CpLD3vPaxqN
         L2GFjD1uwlGTm474BmzBxVLJXBEP3UcTQIALBo1pSXC6QfWbbogt02vvQ0hKRpb2TPsp
         1BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794894080; x=1795498880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgXAga4SQ2gGcYIcOPrgNzb4Xfca195d5V/zBY0TA5E=;
        b=VIAUV0j7l/q14KxLEi7Nc9c6zvL//DPMvPgbN/cJVBST0ztUU+GNJZ+JoLofXZNDqw
         SokfqxxHaK+McPoqrTozMclo0Cn+Mx4TREy3Yh2OJplZ+EZapJ/Od6cBZGEqlyO1y+DG
         9iZsR4rm8COP65ysN9xhbRsms95CsPxXxUpeYaJ9SZHCdpZpXNrrGeN3mX7UaoyLBeGJ
         IWGDKW37qU0qBKOUp/Zv4r2HE6DkvrhaQsrowptUuxurO2uyx04PE7dNGnXhECIOOmPk
         ImxjfntWeB0GrkkitNtsyptsoyPQERCz8Tpuj5iA0+AS68WA33yo706oO/kdDDdn44vu
         +WOQ==
X-Forwarded-Encrypted: i=1; AL+hErFhs0yrw8YIN6SCq40agspNHeOdRiMAPcEaYEGlIlje+WSRWTuG9wTRqf4Y6i7m23JRWYqHIBw7+41URpr1@vger.kernel.org
X-Gm-Message-State: APuU4Z+nd5slGBifTwNTQvneCjI4gFM5mE6A4NChpZ/10eRxamjMRSIo
	5XNSDOvdgdQbgBZRaCWZ/jZ5EE2UYZpM2QGpQvUednU7Z4mwMiVfOHK6Dm8kBV16Rkw=
X-Gm-Gg: AYBFou3YOEpSM+Ph+JL4m2F2yDEvuOwzNJ7BKgPl/dfvvhbaLBSixsFK/0/UScjvxHN
	h8OFELAbqfOIQB/QwJczqg4K6sYaYYz8o6vUh9V7xL5rKju6Ow1rv4l/G/t70pFKRPyHONSyDT4
	CUXyx/dcnHIBvaVk9+0MNRrSg/v7AFmrKms4c3wgmNgW+W4G6ElzH2UkFmSwcO9tnnbOXjjQ1HU
	m7IUH4qn2QB1gi+MHjpIE64GpHIGZu0Oe7EhNZNFngmQscwFRPkawPPCyXH1MHgfNyQc2gZjTXr
	cHI4rB8pe911RdI6XWgZu9S3ncQzLZLgmHl7Xn6sDnFQjJNQlYyA0RLgshH2l6+nRC0anJ4SVCC
	N/pjE8X70uQyyJ7y8e7mqQpEagD7fJ0Dc0NmAGDABIbILtEo+ZNTdPRZcclg9f+Z5GXphoypGPw
	tdQ37Dzx7lAiBLBjJuwZlEf/E1RYMrJPXkK/mYVH1V2jX5TZM7ol8E0hbrdzMWPI3fHcreHyeo/
	7D9ijkGbcQm+ZYPJZm468Rt1GlooIR4M0XrxYkr6sbsJLlAwZGN3sN0Ge69wEvl4HOCEo4Efcsg
	85H9xgvutSl1L/kUVSBCYDzFMsC93g==
X-Received: by 2002:a05:7022:290:b0:185:4ad4:3d15 with SMTP id a92af1059eb24-1b503068235mr10688010c88.1.1794894079483;
        Mon, 16 Nov 2026 21:41:19 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b524049e0asm17957878c88.4.2026.11.16.21.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:41:18 -0800 (PST)
Date: Tue, 17 Nov 2026 11:11:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add cpufreq support for Qualcomm Halliday
 (SXR2250P)
Message-ID: <avvo-0Gj9u4ZdCyh@vireshk-B250M-D3H>
References: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
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
In-Reply-To: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>

On 16-11-26, 21:25, Stanislav Aleksandrov wrote:
> Document the CPUFREQ hardware (EPSS) of the Qualcomm Halliday SoC and
> keep cpufreq-dt from probing on it.
> 
> This is part of the bring-up of the Qualcomm Halliday SoC (SXR2250P)
> in the Samsung Galaxy XR. The DT changes follow in a separate series.
> 
> This work was made together with Claude, ChatGPT and Gemini.
> Reviewed and tested on my Galaxy XR, where cpufreq runs through
> qcom-cpufreq-hw.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---
> Changes in v2:
> - Add the qcom-hw binding from the DT series (12/17 there), so that
>   the cpufreq patches are in one series:
>   https://patch.msgid.link/20261109-halliday-dts-v1-12-289114ab8197@gmail.com
> - Use the "cpufreq: dt-platdev:" subject prefix (Zhongqiu)
> - Link to v1: https://patch.msgid.link/20261109-halliday-cpufreq-v1-1-d87a397396fd@gmail.com
> 
> ---
> Stanislav Aleksandrov (2):
>       dt-bindings: cpufreq: qcom-hw: Document Halliday CPUFREQ hardware
>       cpufreq: dt-platdev: Add Halliday to blocklist
> 
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
>  drivers/cpufreq/cpufreq-dt-platdev.c                           | 1 +
>  2 files changed, 3 insertions(+)

Applied. Thanks.

-- 
viresh
