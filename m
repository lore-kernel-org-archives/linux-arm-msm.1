Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626842;
	b=iYfHS5vZWDEjEKTRXxhXj1RIlwaJqkxr7zjMFwJUbnC81qa36QI0iR2MsiJ+WHy3OSY/
	 4WybDGDZ7FTeLn6FzYHvOHlgYzkyEnqmMONuXtSQPikmmRL8vi92h32BaxQMjowtbz0HU
	 DI62kZ9O9Vtc/plwhsqFgD69GCdiWQZbsf903+sddi4ZgG7ozp9fCUvZSBdScwaWviNV/
	 yEB4pgjXfaz43A4z6SI7fUFIG55ywFI5pKmSARSvUhaF4cnPsGJvlCdJuhMfaAv24XOH/
	 oN/10pmdD0KsY12Cz91BnZUj8fSlwplcKR0Bv3247BOIFhc+FfAFz41HrCEv3CsnS5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=8K5TXnmWR8LIG5Tp7mnH1kUMA0OkWMON+TeHwvlViVY=;
	b=f1rK2VeBEewSSTU7D+6+psIMO141rx2E2aFPE6njlp27yaIJ3dBtK6BzGKs/SDuMinmj
	 NcypEF/wGR0oAn0TVrDF4HFqDnVcUBVnbqnw5e0EWDB32UY6sDaFGH3i+mL70li3sLmSh
	 yO/XF5tVhl4VlQzWaT7tzCEx+ZEWAkUaSJz7/xIs1LRUhYtxEPOTtahgsNiFRdvpqFWUe
	 mbA4Rr8e7S/Rt0/p7npI3t+GkTnIVgbiwcAUvIFUzbT2PzhppkMVhKH7IsAFQcRYzn8qh
	 RMPF8d8QnVHt0/1S3Rgnd957GtamJPlzJZMfvzjsQH4YBKi84ru/H62b4G1UycxPnHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I2qGGkHV;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B281F60A2623
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B281F60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I2qGGkHV
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so25672085e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626840; x=1794231640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8K5TXnmWR8LIG5Tp7mnH1kUMA0OkWMON+TeHwvlViVY=;
        b=I2qGGkHVM4HOQZrV0J9GsfZjA1PIAXAjcif1FjfLQhtZnQs4/DCNQ/EY9a5LgSrzgJ
         Z0DSLQsudURUez4E0NvnsFmBHuSDyc6X+eaTj7IxYPC2h69jy0iO7Gh20XAewo/iBLzm
         GxMNurdLGea3F1McaXdinIeDuCpkfqgRAri9wGBroMPjU3nzOFceCtR97AZhPgCZk1wu
         gwPuXoDMC+ifI9WHgnrBvHvxVfb+YyOwjKyDqjBasw3ovSkk7JW4b8hrNOIF13b0OJAz
         eA2v3FUVws+AirBAw+ekXENF4yDmNP3UcD1PyTwMSIJPIqUhCWpA60w/4OPEa7jT8XrM
         rptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626840; x=1794231640;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8K5TXnmWR8LIG5Tp7mnH1kUMA0OkWMON+TeHwvlViVY=;
        b=TbSqi8DqoPK9m1s1n6d+G+AIfu6audf9bj/+BccDivewSLTNrJk0CFZuR3aQeJ5Rcv
         jaoNrCuYtevmSFZx0LJkRU8zqH1LzgKLwf4z+TApyuA2fInOb85r3zkDiubZ+KOAXHDC
         0aIcaOkHKwXr/ruZZW/XclZawLLKenjEU4eWX73KmrTSHJBhrBkYJAzfEFE0EdjR3WEZ
         3iF9Hul/VScFOH2zw8L1QYeyOwtO6YhNkzuROAq2GQMb9Dj69DbtX5NW6f1GNqfaxVkv
         XCJCNBaUiTUmxaNSXo8vfqEusvRKNk6vyJcLpH9Sl9gkN1AqKFQUHRVtk1JSGxY2b146
         MnAg==
X-Forwarded-Encrypted: i=1; AKwUvBwUAkKpETIuFEk89rB0XAMgG9+dbH2qILRdPLpfwDFoL/h5MWZO7ripzMjWol3ovd3qqSLEjDUu7AxvrEfP@vger.kernel.org
X-Gm-Message-State: AFq9FYJil67NUM72daS0bSGCoYxfANJp0PaQe07Qvw5b95xQbePD4XCd
	QT8q31+gQYWESK33Wot6qs+f9U/ZxHOCxifABY63jxCKUnLe8ZhTqHQWhjFg/N9qlXg=
X-Gm-Gg: AYBFou3zH/0V3z8GrELp+bH+XnRqDf3oh6AI3KZYzkXZJRqPF/El+fQgK/2hgzjmDkr
	ne0vSgHwYlpc0gTYxDHWDHDUkDt6FPH5L71VsnqGWvuy+qwIzpBzlYi7JSXSLJrcnkgh5zHqF2J
	kvKmbDtHvRVegT/9ZoDWUOVdDETLR4qZYh5KwUup1ULGf9RF+6DYwOSUle/yns6pHa8c9KPiBwa
	7rfKxigN+JdtfuB2nnOuBeK8TvHr9fvdExiOZmdbzG6npgqYjHIif18jXjmh+JMLfUpn8d2ibIM
	cU7lno4+yNydcYINluXncMw7FDYKCXQavcSN6tHHHaloOD+G9ow4geZ8E0LklcA7VrS+k3qcvrV
	B0mlqspv4ULmNtYt/3cH++G6P77J/uOEAxSveZFAYvhxw8ATpriVg5qahqBfV/R1NFzr0JIj+ot
	YhB9Snf/qCm9uQeSHBBBfcSPxyIKLqO//WloXWNESHdSI18q9988zA6qy0hurrPmkEpm09hUUiE
	Xid6Ekt5EKUxFW3cbCbxjeM6s04vNc/eq3TDC7DIUPZQSZXow1RtlAteFgP7jQjf/CZT1R6xPM1
	aIdmh6o1lwiWv0jdLGudXpnznKt5jkuP9Q3j2cQ/jWkCFssCeQ==
X-Received: by 2002:a05:600c:3b2a:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4ac14fbdd04mr230324575e9.4.1793626839961;
        Mon, 02 Nov 2026 05:40:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
Subject: Re: (subset) [PATCH v4 0/4] Add Novatek NT37705 panel driver for
 Fairphone (Gen. 6)
Message-Id: <179362683894.3310106.5892756542563969007.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:38 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Fri, 09 Oct 2026 13:24:59 +0200, Luca Weiss wrote:
> Add bindings and a panel driver for the NT37705, and then enable display
> on the Fairphone (Gen. 6).

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: panel: Add Novatek NT37705
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8ddbace1197498d7e32d36db66641b7e1dff868e
[2/4] drm/panel: Add driver for Novatek NT37705 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9ffe0df0262b573c276cc17089d15a08b9b4306d

-- 
Neil

