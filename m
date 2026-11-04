Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768981;
	b=doKS7u7aKGuzkY23bLiVbhr6y1LXntLveFDKwCbposEYl5Xi5tRLwGIeWBOaj2XVnACc
	 7z8gffDzfYO5Z3YLTwlBD1ZgnBOoqa0jRkYkkOm9duzlVFhUiYnor5sKirmWn39r4EeLG
	 UuVsLHoRJGDcjQJ42Be4m/dMVnM1Uwxf8jPH1ZLq6sgiFywH0UCGC1R33Vk/+wJEAZG2S
	 p4lw4AqWWOIg62QAA+OSZ9sXfA8NTg1NEXAOgY+njKodVgHiLiVIFu5pQ06uFYBLjmfIU
	 50a0m3umPMxgXudCiC2lg7EcLB8yGp6+Nv1cjJweJYJqfq9iVZ+iHXI77XtFxOL1SKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768981;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=juvjpO8TO68+H6+cyYV70oG23Q9tvM+l9FESY+YMx8E=;
	b=IQljtACVYvjWDkzqy96jBwWcAXaSOdqpZe+X6MuQjkKhagvD678F8nmoQH1beeRkzjWQ
	 ijNbX27up6q2v3oGweir/a7G/u15/T9pW1qe6v+ZUxz0AyZH6uEbSxHfZIQ/UbAquibpt
	 L1wyMpNxr9wn4jEuDfjw7A59CFvcZNTCdWqV7C6ryJzgyqJtwm/ySMJmgMxBSVzNjm+nE
	 XtvmbvURkoC1SyEpKWEtEeT+QpEWY3W93hm1ExngqyxjYVri6ADwj6PDRtKLKgjXTxN6a
	 pLlhkNvIrN6Up1biMeAtyzfRBIDlARz7V4XDZYo9fvWZ/zV0o8M5NplHBM/nX1hiRUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=OlZZiGBI;
	arc=none smtp.remote-ip=95.215.58.229
Received: from mta1.migadu.com (out-229.mta1.migadu.com [95.215.58.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A3A606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 05:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5A3A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=OlZZiGBI
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ti4s4pmcbtPE8dHuQ0ldlHt/Je4MRoPTj/5T71M3Rpg=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793768978; v=1; x=1794373778;
 b=OlZZiGBIFPnwmux7dKnfwBf3Ql6I6RrV/AD2bjBv4VkqILUI6+eebUXyu6RKg0ftaLHQZFQ4
 oc6ca0tmwuY9qJplliu2mRwmh+xu6Xg9uScPYznh+9WCLmqbmrMFMDtImAMUzrL4d6qC6aA5OsU
 INDgydQ8wioBRmyzUf12gOebGnvTU2BaZ6sQY4hkIKQwTRwiDDFsBksFg0NT8maIqHeXf4EBHIA
 MtlbuNOuuVgbxf7YENsjmYUsN/UKN3GhHOSaAPlDjwWQamJ6DfjQhYhP341aJsUkRQmF8titGjn
 hGSc+DkXBZgf+Vs0tg0f1X2mouJJtdlirwV3CmsbdKdow==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 11e7a3c2bffe42e8;
	Wed, 04 Nov 2026 05:09:37 +0000
X-Mizu-Trace-ID: 11e7a3c2bffe42e8
X-Migadu-Flow: FLOW_OUT
Message-ID: <82374fa8-1511-4da0-8270-6c4b1c85f2ba@packett.cool>
Date: Wed, 4 Nov 2026 02:09:30 -0300
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
Subject: Re: [PATCH] ASoC: codecs: wcd939x: fix device node leak in probe
To: Wentao Liang <vulab@iscas.ac.cn>, Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261104022814.1484303-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261104022814.1484303-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/3/26 11:28 PM, Wentao Liang wrote:
> wcd939x_populate_dt_data() fetches the remote endpoint node to check
> whether the headphone lines are routed through the USBSS part, but
> never drops the reference returned by of_graph_get_remote_node().
> Probing a codec whose audio port has a valid remote endpoint therefore
> leaks a device node reference.
>
> Drop the reference once the result has been used.
>
> Fixes: 10f514bd172a ("ASoC: codecs: Add WCD939x Codec driver")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>   sound/soc/codecs/wcd939x.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
> index 2d463f062e6d..595eab8e33d9 100644
> --- a/sound/soc/codecs/wcd939x.c
> +++ b/sound/soc/codecs/wcd939x.c
> @@ -3214,6 +3214,7 @@ static int wcd939x_populate_dt_data(struct wcd939x_priv *wcd939x, struct device
>   		wcd939x->typec_analog_mux = true;
>   		cfg->typec_analog_mux = true;
>   		cfg->swap_gnd_mic = wcd939x_swap_gnd_mic;
> +		of_node_put(np);
>   	}
>   #endif /* CONFIG_TYPEC */
>   

this is already fixed in:

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?h=for-next&id=9003f8ad9c4ea1a9f645874ccba6eb77e923120c


Thanks,
~val

