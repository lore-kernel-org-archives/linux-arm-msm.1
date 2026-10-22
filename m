Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792659803;
	b=FF8o9yx7deMrI0Il6TxsG50BJGbLKIFCibpJEyzlilNtcPBPVZngej4vQo4fvHJnK2XC
	 Y0XBmlx2x2qqs7zf2+S2komROTjzjow2MdMpWaScBism/2y8GrEpgRbXHPS7hudadFbA+
	 tH6CkPYJIgvT09ayCnaN3JHQUH329DUkVNi7daCXaQ7T+ZAxKzpYLabytJvzvM9RyEQCY
	 tmfNhcebfyP22NMwL4ADbegUd2CJBi3Tl1j8NyCTOch4ohtBstCS2/9hQWiwM93wS+FqK
	 34SajjEOEnYiFcFWF0fk0gv5SnRfkGtAtPUS4sWJOLItjcHLuLfyMEmGpvCqXj9eAHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=woa+e/DGRt+AU4ivMXmTUiTEYIP4GbuTy3RmYJMU8m8=;
	b=bJKPBlkXKAUiioUyeUMPwJ4kmQRbAiSt2FO5F7E0tUUUbBrvKjEgfM7zfTt20IUXKXmT
	 Yt4a31RazUpSS6hnIS1MX72mk1Vk7CMvhuUxLt+EcM3xkig6b0HvUHu/HGzHz5aSqN6LQ
	 hNodU5PtPyHE0LJS4IMnbhahmDoQiGmPGJ3wJWCxVujViWs9rZwxFXur659yIAsSx4g4J
	 ndRcSUudGRzZu2dWjTdGJZyT/2cqqVuvuoqLoyshWTT5nTOmo45ewHA2wOfIW8DDzTaiL
	 Ddf/tPdt+aPq/4N0BdtRAhRSzzMHIarKuK6S4LbUxu2H1zuo5j3QucqbPeMbQp9oe3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gfTI97l2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE23606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDE23606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gfTI97l2
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b10ac6ab7bso16355617b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792659802; cv=none;
        d=google.com; s=arc-20260327;
        b=fnuWhJKSPGWJbkcUzSmmJ9olxadlVH/r+t1dvOnvS7BH1Cly80NCUACMueMD/GsyJY
         5WGMOVAsIazII7JGpO6taZxXBTGEsNTw+CpW+F5u1Zv0INMRYTeNSPsKcw+ex1NpLbKZ
         zoqlFUyYzJJzexq5ZzZNL6e55rwRcmihOwD7wABwhMHcvmv6Wmq0GjepAibJ3uDRrCL2
         KStpYZ+8bh22AibDibr4w3+xQnMYzNb3Nmd0lRlZ5FBesPzy/CfQEpq4NcOpmQHUr1QL
         9ER13kq2uoPuDzNOV0HeHmUX+rHwezJQKjAdpZzs8s5DWil9lTQ8ALiFVdW8Ou+4OBL9
         +t7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=woa+e/DGRt+AU4ivMXmTUiTEYIP4GbuTy3RmYJMU8m8=;
        fh=Cdcy56S8d4dTDZCqHzKlch/rEso3TVJO7F+UiV4oLvM=;
        b=IKnPcVFPxBEnCXTNzbupSPFrcKR1vHnnkdD0mvW60jbFE1xijX6aE4jYxFdWtkdIkE
         U8pDXEApHfSCr0IfTcY1/jlaMedatkxDEBL9rwIEUbV8BoLWORxEEQDktrJyww3pvyuZ
         AOyu2dlTu+VvzoHRrcnMYrzZyGihKrzEanHj7oIsitBbewu4T6WuZcI+MQaHMkFJdNLV
         OryXZfLgUsveqb9ybspZKavKgvVQonc0b4mfq4GxqOoiCSRoy4M5v058X9Fh6fP19fND
         E6EtSXO3ActNvIWeynOFaAodrj0tgqO68YCM8evjmlqcY5i51MCI89gWDvmNQCebx+6T
         vw2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792659802; x=1793264602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=woa+e/DGRt+AU4ivMXmTUiTEYIP4GbuTy3RmYJMU8m8=;
        b=gfTI97l2APZ5Y5eb2pvgmBAcJPxPWkyaMIeoupkwpg/G3zfAXg2Wvpvo5JPGquuYzc
         /5JQ22VD07t7duYg/NPJ6sHT6l933oF381drXccv3pbL4Jxn3ZvktZrot6XIgVS5jHPm
         Eh9msNag2p5o0GxJuyyPJ9ptxHfSwnLNOZqoIoOGCwjSAw1asW4X0OsQA8WDL4wK7NG5
         Q45v20NQcvn0tRSbC2qGrNKTTvrHnuAxoxFkS2u3HDiLTr1N1sy55yTmSN6/npq2dQeN
         hGmqwFETCUAalxfq23tyKN89t0PfOuAw+jO5DigPtyXVMF2o5Js0COnPFGz/5jwxIk2I
         F06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659802; x=1793264602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=woa+e/DGRt+AU4ivMXmTUiTEYIP4GbuTy3RmYJMU8m8=;
        b=2w1RMe6nKXedtdS0hK8FHvbtZRiVXjtXCNDwQK2TLxEWGGX0IIYtGjee3Dbzy6DmIf
         T0NRf8ppgJ2IR3r3btATHDWPxX+CjZ9LpELVZ3uxNIkIa2ACD7/qmJMfJug6K1e0ySgn
         6ZgF1DuKhii45m9+ccJRvuO/RPRLMJ4oUxuREZTouC7wliN3rizW/bLG5eVz8KEZSfbr
         8jRpf32a+QvangkdVIAe3uIZfolxJpCd4mTsGTFetWpLqNpStC4IDmMTWrQltgp1DKqY
         fWz8qmo0ta4b3KuxOE6tW/pKbaRUHSL+oLW+c+Ya+5inJM5zZ2eT7WyMYCXCumG4kG6Z
         s1lw==
X-Forwarded-Encrypted: i=1; AKwUvBwYth/i0elUZUiBPJRFiC7dBamRgJYNl/rHLzyreug8qOrjEuedLhSM5UQUnELvXuj7lMiPU/1aT+UlyRuU@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2lRGGE3yYzucHkfRCBiPSiXvd6KekeWyor4YegGi3z33pw45R
	leG0xoHTkCnI9L5JUMrgJi1fnhlmm14rdjX/mdij3abGMf7bINC9sxErgSU56s+Ds380Vs0fPjr
	m5QNKB6+fUuYaTpZyNAm0g/7zkqo3tY8=
X-Gm-Gg: AYBFou3XYGsTHKOgAF+O6+cC62qEFFzrN1C0qnYvWNlhKuYZUD5czdaHz1nJuyQ89zb
	T54HnmZlfnX75DNrsgxSBR+w7/pfSVCzGVHcfwfkbxAHeh6v7rCfDVIFcRt+ABzhZp6WaIHy3aE
	wvgBnG0hCqAGqWo4kysTh3VQsZOGRtMAB7OzINbRj1pNjg9cnwcOTl74J2d1snn7NJv0acJTYl+
	jQQ9XXh8y5Hks1vDRL+t3T/BFxqgEZQKmkqEBLCQGAUbfhTFhX6m+rNz7exA/LiqrO03kK0Qgur
	KvrhhCym9NvG0wy2ln5bXdF89mOAXvImaqlDJlujDMpwF1DR7ARFKq7GQmIIluVICzlTctWtXrT
	4u14+sKTQz3tooL8+50lSVChbT0LslW+n
X-Received: by 2002:a05:690c:39d:b0:8b0:ce77:8dd2 with SMTP id
 00721157ae682-8b134346641mr26849877b3.62.1792659801067; Thu, 22 Oct 2026
 02:03:21 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <13181dfa-b92c-43b5-ae12-912abaf79c41@gmail.com>
 <20261013015728.43307-1-liujianfeng1994@gmail.com> <74d7c3dc-0880-40a4-b056-f9a089a0ddc4@oss.qualcomm.com>
 <CAHk8ZdvrVt8TkZrSd7qyzi5AirL+FtwUpHT0QLcUd5qBJmhy+w@mail.gmail.com> <f5d77b3d-a6b3-42ea-8b20-939a301ae331@oss.qualcomm.com>
In-Reply-To: <f5d77b3d-a6b3-42ea-8b20-939a301ae331@oss.qualcomm.com>
From: Kaipeng Zeng <kaipeng94@gmail.com>
Date: Thu, 22 Oct 2026 17:03:09 +0800
X-Gm-Features: AclHuK-9tJRRLKPk2BbNOku5118pQli1dH--Z2N1H902t_ekr0ZNJcjRGWjh_K4
Message-ID: <CAHk8ZdvqoEE66xPJmV_p-2nCrqNj9yQ6RbjD_wTrZZM84bYS4A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, jactry92@gmail.com, andersson@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, konradybcio@kernel.org, 
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, robh@kernel.org, 
	krzysztof.kozlowski@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 4:00=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:

> My reading of Jianfeng's email is that the "Go Pro AI" part does
> not appear on the Acer sites

Thanks for the explanation!

It does? https://web.archive.org/web/20260314171131/https://www.acer.com.cn=
/product_list.html?parentid=3D323
("=E9=9D=9E=E5=87=A1Go Pro AI" on this page, '=E9=9D=9E=E5=87=A1' is the Ch=
inese translation of Swift)

I don't think the name (Swift SFA14-11) on the support page is the
official product name; for example, you can find Acer Swift 14 AI[1]
is named as Swift SF14-11 in there:
https://www.acer.com/us-en/support/product-support/SF14-11
If we are going to call 'Acer Swift Go Pro AI' as 'Swift SFA14-11',
will we call 'Acer Swift 14 AI' as 'Swift SF14-11' in the future? In
order to make the naming rule consistent.
Sure, we can name 'Acer Swift 14 AI' as 'Swift SF14-11' in the future;
then we lose recognizability?

It is awkward that Acer only sells Swift Go Pro AI (SFA14-11) in the
Chinese market; so we can only find it from the Chinese website, and
we don't know what product name will be given to this machine when it
is sold in the global market.

[1] https://store.acer.com/en-us/swift-14-ai-laptop-sf14-11-x128
