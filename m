Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444972;
	b=Pu9RiHn9HU25XB3PQig0GaqHCo01VrT/XH4IDtUUNkovn7DY80I3HTCQGD7K3YBxCvyY
	 GkPX0XElD9I15MuhKVq5ByBrLSoQ3Jc9FgXZInXwGFGy4WBu1dtZG5aBMgV7OLBo2rA6D
	 kLWMCPaI8ICTQotHFlFf/lz6o5NGHeZDofn2URAODje+4SX39V+5izCemMD7iyoYX7M1F
	 imDqCuQ26JhEfNvKvQ6oxT/ncYz0SwqfJwJgQXh/1+KfEjIvJkVDllw6VKL96JjryYQhf
	 QaYb9zyYEk4ebNSNxEeTyMgBTPZTyljCO0YDGyXCNFiRjJOjGselplSKSwBNQpHg9lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=PSInUSGmoNCWCLBv78RAKxmVaK70Lkm4LuCPu8e8TNI=;
	b=5VZCG9WEmQ6CnDXstNZ0Ws0gu9eTMYg7i1bhQE7gMRJ2wyF6jvecBWscMiZUlD/U5Lda
	 pCzOwYJZJZ/htEhzp8Q+HPb0rNi7mPmPCKCYadzk8VD/zCeHT1UiHkfOt6BUdmLSPUA8C
	 J2p/d1GIr+mbJQO5rrIcfcgJFMiTDCfaKPtt63ndiM6M4O0s5l+fnWNcqwMiQAl2TfZfV
	 d3kD1jy3CfZpI9QC2azAjQ/LG3lzzMfiHWhZUiLUMHLgs2L81X6vdFcZsk8BmoKDCrm74
	 oAQVZtO97GJaX4oNfBVK/l0eIRoSOW1LnDLXT3Y2m5ldv1BV5kQ8SXhyia+w/K9wOTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A7Gf99Eb;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F4E606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2F4E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A7Gf99Eb
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d581da0aaso453956166b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795444970; x=1796049770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PSInUSGmoNCWCLBv78RAKxmVaK70Lkm4LuCPu8e8TNI=;
        b=A7Gf99EbVb0om3U6UTcAtakVM5S9WHTKrp4ttP3DkQime+XOLo3Ev5eGI9MH+DXWoB
         tHFP7ps+pD7gJKS8ICpyM+wItA0qEJ4glHiK0AIn5j4pF4p8CmgjBU5LwBTHRdXw4YaU
         FwETzGkpprve/3CrJ97p5Z+In7/pWM2DWq7icDBEBxgDdxB0sSRsGfFNx6ix8xzBbCUp
         8fTax8CRkBKvZ2U8Q+j7TBAtLCDhiSzPb4qfUC87Rjzo3mS31WjDkDp7WgUIap8h2amO
         dvVFYA3c6edQEzIWcsIC2skBpfaf28cZ9GsEpfvUWuCWkpwr/XKwxWOXmJy8okubjj5h
         D7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444970; x=1796049770;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PSInUSGmoNCWCLBv78RAKxmVaK70Lkm4LuCPu8e8TNI=;
        b=f41WfaHtY78aAibJn1S4pak7B1FD+3Ac+hSQ9d977bj3zGQU1/cQtOlttQz12PngCE
         R7gaGCWynkGRIduMC9Zq04vfNh1MezdbACbNF+eBaEQIYCTEZz11bj2IZzD6f0DKTVDr
         cfl5FeGI+8BxSaNtU1lnSzx6Gf/PRAMMaB21Le6QQK67M4D50UtVRLFMgucu127nGfqw
         nSo9sikVF7qsY//7gSf+p0apUHNmAONJcDVsnw4Vg4/6lVF/x1ur6GxZ6L//beMrsEd4
         y6HbZzdZsny1wH5aEDsB7KDKBGquLf4t3pImV1Wj7pMEgr/kVVV5g9HR9qnD0LC0Mamw
         Ld3w==
X-Forwarded-Encrypted: i=1; AL+hErHs4oxzKFZtwWU8+A/R67xVdroe5yod2Lm60jJ1kw1/K/hDyl24tGODAPM3ccQZDdNdsjx0TgDP36Og1SRn@vger.kernel.org
X-Gm-Message-State: APuU4Z+JZf3fvxHTmWmL7/N5VcGiNxo6vtqs0IkJvFAhTaeVkFC0GkP4
	//ALttCQ4Zhh7l3Qsk5TelTS+Nul4dF37E1Z51dCrxVwhtGgoh8DAy0vCZF8JzTcqqY=
X-Gm-Gg: AZFdTZeuayLOZr/Xch1LeBO/D1Op9ljTCBATdtGMte25PBb91CSjQLijX/zHVx1BWdR
	IfljSAjcxVWJyaFNs6j0yqprXTvh4kcMig5/3+l+jL10IvZdDZtNCLegKA0SS0YLpjCqQjnNhYL
	Iel32wQWjQZp7wruFKYvG2sZDmLU51pGCxvZnicxJxohgC6Y7+MJGRUmNVjMHL5rmoTCsoanHML
	YK17F5EhGIOc6r/JkhMsvPVOQErdD/3eXs2cOVsizl4IlFCV/bqCA+IVR53qXcsLpFIiTM9bAgN
	d4rLJsV7zgBLlVHFtI1AzRrRUrF6vK58swr8oBS0mTTyZo6xN+pJ+pZ4arx2LViPJ8syyoyANPa
	dh9+iBMsz8wI++53MPRwzv2WtEEdWIrtaLjc1LBdMNtoDcy3n+svh8ISxZYhAyCq3RSd6uq5G6o
	R1EysuDawm51KfoyYBu5/IQmDVVuUOah5Nj9bWiIZN2Eo+om/WHK4ZxOLYNhr3tz+72Ek2oEM9u
	EFOEy5goRH+TFEF8lSPf14DGi94wY46PopGLlsNkwwxOukdKdSjS++9FNzzEVFLNjJUZS1HiXUc
	v39Ufjoksu0Vj/CAVl1VnthPcdCRNE38DsRDXxI0q/m6YTvTyF/V0GZK0zS7gDY=
X-Received: by 2002:a17:907:3e28:b0:c41:7e99:c6c2 with SMTP id a640c23a62f3a-c513ac99405mr977016566b.44.1795444970020;
        Mon, 23 Nov 2026 06:42:50 -0800 (PST)
Received: from [192.168.0.167] ([64.43.130.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b002b9fsm417794966b.78.2026.11.23.06.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:42:49 -0800 (PST)
Message-ID: <a374af79-7308-4b36-94a2-cf70c6714a85@linaro.org>
Date: Mon, 23 Nov 2026 14:42:48 +0000
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
Subject: Re: [PATCH 3/5] media: qcom: camss: csid: release parent device on
 power-on failure
To: robertijtsma@gmail.com, Vladimir Zapolskiy
 <vladimir.zapolskiy@linaro.org>, Loic Poulain
 <loic.poulain@oss.qualcomm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
 <20261122-camss-fixes-v1-3-9df4deb87ea2@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261122-camss-fixes-v1-3-9df4deb87ea2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 13:35, Robert Ijtsma via B4 Relay wrote:
> From: Robert Ijtsma <robertijtsma@gmail.com>
> 
> csid_set_power() acquires a reference on the parent device via
> parent_dev_ops->get() before resuming runtime PM, enabling regulators
> and clocks, and resetting the CSID hardware. If any of these subsequent
> steps fail, the function returns without calling parent_dev_ops->put(),
> leaking the parent VFE power reference.
> 
> Consolidate the power-on error paths using goto labels and release the
> parent device reference on all failure paths.
> 
> Fixes: c5af8db84c01 ("media: camss: Do vfe_get/vfe_put for csid on sm8250")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
