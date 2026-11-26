Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691704;
	b=e5ac8nNR0dklLMayo1WUYprHTmJRbqUIsPIZMJ6nRdOlwj5nPHivMcsbTj83MmRF8LeL
	 6dvK6omIMG6dLqI5uNToPHeJKi9BHMn8nnDi0LKHV2AhM6qRLUMsLBoZsw6XGDlwQ9HR7
	 wsbdBGhhd3O3dErLUM/qvJhtKZdNE7HgA/7WwvAK/jaQzjxK1XUPk1jnYRaIR3HpkCZGJ
	 TO2JIPcK9ZgmOxkmH9l/zSMyLuk4fY/1yzigvkGep+f8rifm57oI3KTvlQF5BU1lsn5KQ
	 s+cG4gnV6cGqaGi+JAzPlQZyyrwdNfUTq1/e3bziGitfHRBDH1JorO6FW8r1z6T3vbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xZR+wq+01JBO2j6s4aTMFnOoeuX0T1ToCwOuNIBcgaU=;
	b=WR4v3QCyThEqm1HRLqsE+RUE+lZqo/kOIiU1LK23SK+0GUIRnkbj4tfqJ5DVfOpbrQ94
	 fw0t+yYafyV2etFmCCCnr2HlM5payz54e3J7L/WH+v6qj38JW8P+swKw43qaqy0yaI8s7
	 CvWlYz0S2GdjRgdtSKsfFtcWl/xBRKOGBwqkVBEDyIvBFBp7yu5ygs7RAV5Uo1F2zzQlf
	 kUJG+JZ+qOgcghjzEz6dpvx5n0UqwLosRU8g5cP3eaJxN0O23Ugk21YQb+hwGKw5LNzGm
	 afrmpIQPaC71QJ+tvJ21XRvMJIOqeP+HcUKnuPohLii4ZmKh69VzFV0HwXYzPu18/qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irp4B5Ws;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AF6606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77AF6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irp4B5Ws
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b43d30822fso3690973a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795691704; x=1796296504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xZR+wq+01JBO2j6s4aTMFnOoeuX0T1ToCwOuNIBcgaU=;
        b=irp4B5WslOZBw8G+iVikp/XSJX5Y2nKFHBm1t2G8Sa9CGXOobc+fnN82usfGSWtTqc
         /8QpwmdIEy5pxnU2YMmWjEpAw7Bb8ZD0MCBwcFFwr0dSgK26NS5UEMCgaf+gz71NcmYO
         sfURCZ6xtS/X+R+gQMTUBHmw9J7oaxyvoRpWqZr+HEhg2hN0zGoOk6S/Ed8lshxMRFfr
         zbBCdKQ/7kgyH4Y8EBcGhvnX07o9ODgXkB2K0TWyLNsUQzyCpFLW858O+NcazYa6W6XG
         Bwle+6HKN1aMlvcW0WgS1d3cEq7h8vsUnIrqO7PW+WtlZwaSg09GIFTJepH0QbbBRcc+
         xlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691704; x=1796296504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZR+wq+01JBO2j6s4aTMFnOoeuX0T1ToCwOuNIBcgaU=;
        b=rIBuZomyynXEhT/Yt2HtY75JMdqrSuAAM4QBdHbNJkWTfp7eprv7FyjpmF+PLn1Jg3
         0HJvyUsQocQ6CqHh9eKnov4OpNz5KBqF2pdbtAFDfgpIoAKYHmJczMjO5UHK3i5gcoAt
         zbdwTBRELpaSb+sSntCAU2eBjgviqdUwD/5LL/1Sr4mUU6+jPe5dcnAlao37AFG6xmk8
         0Zc7Zp2jHyfZxu44oyv/vRhiQ3FLu7hzXFss/wqYVlmGx3j470zYhvP6XVcBTegNhCd5
         L1ixnfxMB5hqLHlwRFgQkhLba6k/kcVvC8a0v1Y96VpFXa3kwgGPxd5gGyjLy6j3ytXi
         Xzcw==
X-Forwarded-Encrypted: i=1; AL+hErG6qtCzrhzgoM7RmAJOuHPtoaw4ORVmSI268deAUoOOhGkOZrPPSuio0rkACIghkc67j/sBllFCNWUvH+pR@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zp6oc6v+p8A5hFRkhpl3Aut9E761eGXNuwqttxBmZl/QLQIA1
	2RV9jBO4GXH1ITctJGWPHcjP4Ha8PdrvvUfVeLLWTDh8VnYkCbqfQe7L
X-Gm-Gg: AZFdTZeTHnae2d/v3wNcNHTjbMqGrRmOmqMwzDtQZMpxyutfzK6iyk8u2+LZC5BhxkQ
	u03uJsMaG5SJE2kBghWshdhfiuQYEeDMRZOo3jF+ZfMXHBPwY1IqTxckDiVMxAtF+VfU0CHbSFt
	9AoUNVDbfGThCHOPscq+N4kyvafPvqp8UhMyWK0cqy6wME2H0wfdf04fgXghuTH5cavzah+Gv9G
	It/SkxPbNu77rFZlAU5MI4u+oynUBqyIF3IkLcbHahGaGLRoynt/CK8vqJEhPbq7S1S3DqF9U4G
	5IX4gFOcUN7RaqHIg+l2DQoUWGz0hDWV8GG72Hau7JzzaSnqWLiv7WjywWCrfW2laYBuRUghZQP
	VE+cJsONYcdtCfTavnIXWS8dOuGhB4C54vASA4x8lk31pCam9grxQDNLSoKFEl0/EYOS4Eei7dN
	ZVv5uV+MMindALS4p2M5jjaFkhcS6CFwaxoeeF4a6qcKImXCsD7wXVmQa0x21Ra6moQGKAs757t
	+XMuJXFSla9s/6gPHWgk4gaiyOFA8lImaUhcyh7VKj9B0xMnpczFCytRBxYNQyefREIgEH4NcYl
	du3jrM73IOHUVIjC/+fxt6JOa3G3HBZH+898zBLzP5UOeNA+JQvkJwGO+vfDx0X3OnCMgPDBCw=
	=
X-Received: by 2002:a17:90b:48d1:b0:3b1:832b:bb3d with SMTP id 98e67ed59e1d1-3b41c9817dfmr19137891a91.57.1795691703719;
        Thu, 26 Nov 2026 03:15:03 -0800 (PST)
Received: from localhost.localdomain ([2406:da1e:5db:e000:2565:a988:ec63:8010])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d03adafsm11030373a12.23.2026.11.26.03.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:15:03 -0800 (PST)
Date: Thu, 26 Nov 2026 19:14:51 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Document Xiaomi elish
 panel variants
Message-ID: <awgUq1_piZACNOY4@localhost.localdomain>
References: <20261126063056.2276703-1-liujianfeng1994@gmail.com>
 <20261126063056.2276703-2-liujianfeng1994@gmail.com>
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
In-Reply-To: <20261126063056.2276703-2-liujianfeng1994@gmail.com>

On Thu, Nov 26, 2026 at 02:30:33PM +0800, Jianfeng Liu wrote:
> The Xiaomi Mi Pad 5 Pro (elish) is available with either a BOE or a CSOT
> display panel. Document a board compatible for each variant so firmware
> can distinguish the corresponding device trees.
> 
> Keep xiaomi,elish as a fallback and continue to allow the existing
> two-string compatible for older device trees.
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index a7157795870cd..84ae2d991d628 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1192,6 +1192,13 @@ properties:
>                - xiaomi,pipa
There is a "xiaomi,elish" string above "xiaomi,pipa". I think you should
drop it since you add "xiaomi,elish" in the following.
>            - const: qcom,sm8250
>  
> +      - items:
> +          - enum:
> +              - xiaomi,elish-boe
> +              - xiaomi,elish-csot
> +          - const: xiaomi,elish
> +          - const: qcom,sm8250
> +
>        - items:
>            - enum:
>                - microsoft,surface-duo2
> -- 
> 2.47.3
> 
