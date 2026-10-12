Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40A740E8FD
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 19:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832220; cv=none; b=KwO1YWJvAr9P+btNAnGNsy/tlFXvlE7wCpjvlzUWFyMnA2dbmWYRU65amIFdxZv3tLxJpptWa4VyduEnvpYhJlj8QBbXYIXTpamtZF39fDFkvjmM91VFnLgsgcb+/VJTpKgHIogPgDIGzGicQKcRvayk1ZmmutB5VdI1r6Aq/TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832220; c=relaxed/simple;
	bh=0++OQnsnodoFBA+6JtVfiCpmPpE/uYI2by4VMWbbVt0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=En1VJQBPgA/AG8k9/rce2eWUFRBfUOazpq7C1MZP2Ev5O0GFv+Cmb4jUlXoS1ZlOwLfRboxBYd1TLFIb+YRfycriTkpHXs+uPoKQIEuGIxEivh03rwSKvHRl950Ge70hFkURaaGR1nNCeCba/qLK5OJYZMFQKFXQDQU80Qn4X+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NOugOiSC; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NOugOiSC"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1171024f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791832217; x=1792437017; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7OMJ6SPz0N9qiO7f7FRcF4sIfMyC3KFW6sFDXfK2+0Q=;
        b=NOugOiSCTSMWU0cMd03TBYvIYlf1Jup6TameJJ/jlAiOUqVz5AEzKcj1wh0nrfhoBP
         K65eFJ3+E+qQXJ5nIs17eSlpUtmPtj/H9AOpsgG65N7cA/97zmwM85UbhEPBe8IybOxY
         utNor2haU2ekldstbHcxkI+I5d/CuOwXxdEs8c+PF+QcSM2V8IHKPY8tGCw2KEs3svwG
         3dEtw4zX5Pa4XKPB9Q4J/rS8+qGSg8/Q0iWQCSFMPOpIOQ43T/1DHUOWSeqq0x/p2OVu
         EsdwZ+JuHO9Y87Z93/DC8XkozO7xZZiklUfJI/SSk82y96QVosiaqM1F0RgHUjhmd4Ui
         l9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832217; x=1792437017;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7OMJ6SPz0N9qiO7f7FRcF4sIfMyC3KFW6sFDXfK2+0Q=;
        b=GMkzeqcDCZOHR8B1JcRVUDKZH5GmhEX1VdSRrVJOQCS0DsWxZM34Bw4eTgFJAc3SkZ
         YVsF/0OD7sK9aJ+ReCivjxv/sq2rULgNb/OoHpGdo4pCd9fVtBBcLuODOJG5x1tuQpAt
         rszgL5GNlw/s+phZko7yTer+o3Ul8N3KHX+onKa/Yv1vP2t8qDTXJXx/63XlD4AgFFqj
         ruJyYENIE+emxijshmfjRNZK9Pi4redyW0ZQsvkCsnSUYVcJvrJEG6bWqkAY8GpwWJKJ
         DpX8zahUdUiQH5xUgevbDmFvZQ6DEbZYDglGeJF6JYqqeEBW9hJ/vkoIc2z61+mM1RqO
         W76g==
X-Forwarded-Encrypted: i=1; AKwUvBzGekB9VSsE7ELkfReE1oLEeicf/CclM/F9C4/XwuEMNb55FnB4U9HkjlVyL7q77zsQX90ccj78kzMiPVfJ@vger.kernel.org
X-Gm-Message-State: AFq9FYIyBVlQ0NhQVVZT1r6R9CCaz0CYARAV4nqjpf0qro4QPXAc6l3T
	Xo9IPoi8h5DTbUEsWHDMFXG1F0ei7ri0LEjafzY2itzKtz8SACpdAXF8HzQVzCyvcZg=
X-Gm-Gg: AYBFou2pbn8kBudWWaf2OikFa4bKS+382VUcL2Is40Xy5XtKV4ocd/kkSxxiaRsrgSs
	yVcb+rBrkimelvioOGQoOzqWDJiteI1PtDp/If2mAd+JUOD/m6MozEpUmryDw2KXH10yOOeQSve
	clP8vRl4uHmZ++0wiKSkWDDeO+Kg8HH2qbpxoB3V82YlbGxieR5JQUUG6fxvZk23wc4AADLUN+K
	5OXK/VFH+7hv6IFATSi8nkcJGMa1qnaw7zrUXpuoIGodpOyDiral8CrmVRAtUfmXx99HvPJKkdV
	djx3fyTgUaaPb2HqZJskjnw2SxZl2VJiukWstBO6Zc/XigPTVIloNMHDI3GupkqLfyMGXRflLA1
	Fq6lQfSvRF/tRnOUSVzDscomEHIe+tHtaBQ28uhNRr8+pF2j0DBorWAQkM4wT5UQlreFQmZ6N43
	W4Sx/EVYsLAZfKjePvIufWYSxu9aYsGCXMO32/REZZPiDXk/CxOL3DsSbm9uAsrUpa8pw9PTzhN
	BHYU937jhajk6ODWQ==
X-Received: by 2002:a05:6000:470f:b0:48b:74b:4ce1 with SMTP id ffacd0b85a97d-48dbad00328mr17013251f8f.32.1791832217095;
        Mon, 12 Oct 2026 12:10:17 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc91e2sm854527f8f.55.2026.10.12.12.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 0/4] clk: introduce TC9564 clock support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org, 
 kees@kernel.org, gustavoars@kernel.org, mohd.anwar@oss.qualcomm.com, 
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261012152408.3729237-1-elder@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
Date: Mon, 12 Oct 2026 21:10:02 +0200
Message-Id: <179183220207.266355.4262660703229090399.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0++OQnsnodoFBA+6JtVfiCpmPpE/uYI2by4VMWbbVt0=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlnDXqKk5oKeaK1dwRzL8wylpbZcavZWlv3/rw1Mnpff
 av/c/zoKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwESWOzH893h4YJK4smjWDC21
 a2bH1i5YW3SO7U6qdqymb2FOrUP0Z0aGzV99tOwevdI5kM+o35D3p9jw1hGRoy41nO+2XlhzLsy
 FFwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> This series adds support for the clock controller present within
> the Toshiba TC9564 SoC.
> 
> This SoC attaches to a host system via PCIe.  It includes a PCIe
> switch with three downstream ports.  To one of these ports an
> embedded PCIe endpoint is attached, and it implements two PCI
> functions.  BAR 4 for both PCI functions provides access to the
> registers that enable or disable a set of clocks.
> 
> Both TC9564 PCI functions can provide PCI endpoint buses via
> devicetree.  Each PCI endpoint bus provides access to one of the
> function's BARs.  Subordinate devices (like the clock controller)
> can then be defined as nodes accessible on the endpoint bus.
> 
> Only one of the two PCI functions is permitted to define the clock
> device node.
> 
> 					-Alex
> 
> NOTE:
>     This series is built upon linux-next, with this patch applied:
>       https://lore.kernel.org/lkml/20261002181849.790275-1-elder@riscstar.com/

next AND a patch on top ?? you are not making this easy and this is mostly
to accommodate the DT change that could have been sent separately.

Basing on linux-next means there are other deps and you just did not explain.
This makes it very difficult for me to apply your series if I wanted to.

Next time around, please send a series on the clk list with only the 2 first
change. That way we do not have to cherry pick, we can use your cover letter
for the merge commit, which makes it easier to provide an immutable branch
to another subsystem, if need be.

*Clearly* list you dependencies if any. Please consider using b4 to list
the pre-requisite.

Thanks

-- 
Jerome

