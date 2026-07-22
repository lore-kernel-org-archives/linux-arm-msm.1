Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA704746BA
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709448; cv=none; b=sHylb11gAkz2MakksvxXEy8iSTVvzIwvJbmzqg6SYxJba+hAlC0gnXmNhlbJSW1Jo66ox74HPdU/0BG6XlmlxM5xe48+bYV6veJtF8NXxbXabvgwBrCS/G15ljEHd2iOtUWID0kaBsc1nqJigbOPpQFY3P0SRtPjg5GuEH/fuyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709448; c=relaxed/simple;
	bh=R1aowIMLUKz8Mx0Il2jJ3Lj0sfhpmxClc66d27gkbKA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=mUdXLgVDs+4tSMcwPfO3ZKkgyB18Kno/OrFewdF6odcrhLQYxd8/6zvwlal6Xg4xo6jxLfPQ0JVG5NIT8L9AGJ1/E/VQstbIidWFfdv37TkNMERqwBKOt6KgOOe/X9+eEbgf5YefthOawYwdwuVSJJq81yQhVlzlwVCThu3QdQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Pbw628D3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Pbw628D3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so19670815e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784709444; x=1785314244; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hOhJGwQ/jTppwk40BJWO/omCtNBGTT070lPHgUjC928=;
        b=Pbw628D3LlwMuBl7Fro2NfESKu4hM7l/dcrQb5v3odRrQlEHbAqGELZORib0AAoUxh
         DSxPizGtrny/LreGvmxVKMWATOvsyTh6QwmQ2jtt+W99apXQ4iHGoddZXcJpNWvI8Atl
         3qApKiXmpICM8jJsexbJ52M0jp5K9l6RYb5z1OEdC+RONbFD7mYFruj65phXv1tOmJ8+
         PT42p/0kwW0ttC5oAqjs7ZIjbkTeNEaHjdOTJkya8pfFP0nGpjsQ/UOtUfpN6Om+t5tp
         cRGS+INKxT+/JQQh5avc2ZiDPDCq1PWpjp/lBJnQIzCkHWomLOb9QBV1KA10AMxo6ps3
         QTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784709444; x=1785314244;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOhJGwQ/jTppwk40BJWO/omCtNBGTT070lPHgUjC928=;
        b=OmdWch1OEl8soEc7wqvp3N7Nxl8xVol7fCdbpvpkVokajZ9eQS6VyjvOo8G7bSaxzF
         BikA9hzzr2BHHXItPcNMGo+UnnjElGAESadkXvIEanOecki43gYKLY4rGYxMR0b2iblz
         6kRsAKHMll+cFjR7udI1InxcH/RQ4mvTGp9hLcRaziRqVlPk6ISS8j2ixRyuu3tiQtPa
         pFHYyt8CMK42rFUfXs6xRiJ2ATBG+Rn85I3PW6u7POAlh4fU7J8N0byJMNhUw2fprTQm
         Z9YZrsWb17FeYUuODbIiwN549iFU8qSy3hjPPyT+Ypdi6GD67o49rEDb/aGBPrPHLI/o
         X8jw==
X-Forwarded-Encrypted: i=1; AHgh+RoOA11G5NMRErRaNx5VvrIhaFKuLn+9nKonR5PKN6gylCc6zYic09TKjlDMogCqOdkyFlMV/As/tfvmIokD@vger.kernel.org
X-Gm-Message-State: AOJu0YyG4paPhj1mbYjtbcfQh3xbVtTOA43vDW0BV4qJAV3hwF2awRXT
	Sb5xm4HYFL5EkYnI22Ypa68LBlhPLPNvPSK2MYF+G3Hqh1hcpGcoTEkq+94HH8GIZgk=
X-Gm-Gg: AR+sD10U1JJZGem5xwMI6gTcc4jtS2+S9+YOxkT2CkIrw5Hh+V1m77halqc9TO5mamg
	xKvJgzeB1I6x5yRMhB65bTEUd98HKc/NMc6dsiuEJuVL8og/FJgA76vrQnElsPZ0hOKXURX+ruw
	ydOYCQF2L2UI2GFrSUxbgxGXl+JQkWwmrs04k/U6P0s5KMUPyacfgdUM2rwjkQXmYXObesxxn1R
	wHUH+UC6F5Moe+QwgHAvw7pgsUadUan6vMq49D9pliKjJml0JhUC9j2seu4olpap7YerT+1xEa3
	fj4qO6Pj/p6fpA3vjV5uu5utHsXCn8pTZrKzh9COQu3mQjGx4itYvHu+TpFPt5MWXBA1A3AzDAM
	xtz5GvrTgTTyaqCkQ06Ozr1ZWLY7ffZjCJ+pD2T84tWbujxxAsM/5lP1ZoXtNPOM0TJsvtwUpeM
	zPq9iB1mTwjNuhCWvTGSfy
X-Received: by 2002:a05:600c:1f94:b0:495:3da3:beb with SMTP id 5b1f17b1804b1-4954a3dc491mr258598315e9.10.1784709443731;
        Wed, 22 Jul 2026 01:37:23 -0700 (PDT)
Received: from [192.168.5.218] ([88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4956a63fa41sm57819035e9.14.2026.07.22.01.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 01:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock
 enabled via critical CBCR
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
 Imran Shaik <imran.shaik@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-nords_mm_v1-v2-2-17e5a445a512@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-2-17e5a445a512@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:37:12 +0200
Message-Id: <178470943209.3016846.4248808809182663974.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=557; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=R1aowIMLUKz8Mx0Il2jJ3Lj0sfhpmxClc66d27gkbKA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqYIE+5J9Gg8PbLvC5hMVwlZfdB242pjzBhXe4h
 S5SMDXwJRuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCamCBPgAKCRArRkmdfjHU
 RRFTEAC/ouSPXHdha4O6c1bMccpH6wqcdaKXdI0tUhSO+53+iP8xLJE9f2LygyxUDuK42ps/Pwj
 ndEv5DMMf+pVNfsjHlXjTEVmbbQOBHwIXrFMHJB3aYZUfbFkros0KkUkgvMQcksQG1p2P518g42
 NBZ1Hy/fA0UKPlMhLvMVl0YkKoI6Wu2n55tOn38NFfBEoh5pwzPyNrgkIZaghiNqGyFaIzooJhd
 CEb4ichOlrmboq2SrCkYOVLYg7SeM7pW1c8sbUt6M5nx2N6HZkE2SBve78kK4lnWAAL/+5MjiMm
 wUPvgiDmr5yCrnOJuEUqQoZ4lzF+G2gR5aSopqgUNTKLvAAkPf2DfEuRHUS2z62hdLo7YoYFRyc
 4gV2Z9M11K2SiKnEfR6U72Pt4j7Rc6/+uOf+JJmGaRKkKuE780Erh+iP0IYhxSDuXsEyI/yAj9c
 kLA/FC9ihoZUQWplfTfyQcZcuSuH7f4rkJGhFGj0vXHTKvT3HVDuqKtlXa2TnYPlizGPIeQCXzN
 YCAhLjPrVMTYzuYGdNCDP+gCXdTC8LrHg+AgiA1z8wWiSpC5v4vl7R2SbRqhA2skfMGOU/41JdO
 WpmXMpKEeftRt1nz9vwVA7H7i467ejwQ0kQbb2wSHWQr/HBt3gxPmrDFzLCqD+O3Jleep+lIual
 JeSfTRBuX4Tr9yw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Tue, 21 Jul 2026 12:37:17 +0530, Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> The GPU2 CFG clock must remain enabled for correct operation and
> should not be exposed as a controllable clk_branch.
> 
> Remove the clk_branch and mark its CBCR as critical instead to
> prevent unintended gating. This follows the same approach as
> 'nw_gcc_gpu_cfg_ahb_clk' and aligns with other always-on clocks in
> Qualcomm CC drivers.
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
