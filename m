Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0D94582E3;
	Tue, 18 Aug 2026 10:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049273; cv=none; b=BGwqCBqpjqx8eXj08O+uCUTlr7ufWmt85kQ17/6dxusoyt4U0mzgl8mZjgvAfxqIGL8aGvurFYuwCDb/816QiaFim3n26zTJJTt7CD1IgZCeCKSlgTvPaGsbKnHbiTrXoDrSdghIL78dgijuT3oa3fV4JKWJ+TNb6pQQpWuCkJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049273; c=relaxed/simple;
	bh=hiOgI1ndTCEkfC3iZfjsHT9ckaVHeELOVnQlLUYGXf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=np42HDHOjRHnK+yCwabCc3ZP51lKWYGCE6Nkb47UfXw7TzEOhUTuYaAKl4p+Jntyjo3GHGVv6z21ev/fWqA3tR8qHMNACszA7AIowAChkWrNttcEsCwk5gln9QD+ERtk3xjE+S9CNba5WhWm7rfQBcxaVz3zpSssqpDLmJxMajA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFHmVlVW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFHmVlVW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445201F000E9;
	Tue, 18 Aug 2026 10:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787049272;
	bh=jKnua7rwTo4pZk6ubp3u4xm+J3TGijKXScsxXkyo5N8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZFHmVlVWIEUFcyOlH4OK3oatUwRbuE0j9AYHzFqUXYNqnXf3wji13Xlw3YulwncKV
	 zHYE5ZJGq8DfiI2A6dzsx0sFsVGkbYlGyWqbhjPC6wyGBIu0ezl00o7Q9I6bNlIEJW
	 /BdS6nZus7QGursisyjTXVocrV8/19LAkW+0kTR6RQTfphDw9JOTc57iUOSjdpjBzf
	 dN43lmj2d4S/BU4RG6etMEq2dcUbbXEhNpZ8s/MXHxrGvsMh9EgGBeubKPweN1OWgU
	 h0G8Ib7KgKVdt8RXVj6R7q+AX1iqlolS6oaX704T2S8Ps2BNMYsxyLQSfmr5UfSZpq
	 WqNugW3PuUrcg==
Message-ID: <cdd180ff-5df5-49b4-bd37-9c18ca5dee50@kernel.org>
Date: Tue, 18 Aug 2026 12:34:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: make QCOM_PDR_MSG selectable
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260818094148.3838539-1-arnd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20260818094148.3838539-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/18/26 11:41 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Selecting QCOM_PDR_HELPERS from outside of a CONFIG_QCOM_SOC
> block causes a build warning:
> 
> WARNING: unmet direct dependencies detected for QCOM_PDR_MSG
>   Depends on [n]: QCOM_SOC [=n]
>   Selected by [y]:
>   - QCOM_PDR_HELPERS [=y] && NET [=y]
> 
> Avoid this by allowing QCOM_PDR_MSG to be selected as well.
> 
> Fixes: f2866e6a27f7 ("soc: qcom: Hide all drivers behind selectable menu")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Acked-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad
