Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589534;
	b=TW8KVQdZpa1sSaNKASC2pGd9ZJrXBTds3eoxWWPru26cnkQVmwCovb/Lqnaciy3Kt7UV
	 mIClopImXOKdoGxtDf2OxDF5CYIxSAX5PMIlywRFSzZSgrZa9Z+B+l3HV3wKCApMkH5DQ
	 LsltirWRRX35BI/fyzh1Q8MSsbAbiJtm9QI9bEzN3eTCTOhViIUmenddCrztkpwFGibx5
	 OZcZjqT7OzSx7svvAY7pAHlcdskKSURKOPCMhBYPaOQIwNx+wkbZkVDGcPaiLz1f+gAiO
	 KiEPdQUVKojafm/h96KP9Kc7b0JeK0X3rtcEdCRELwQRaI/7fy1PBtkdMCByyx6kPlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=nJCnzPlEYPTpiPpNwhFLsc1nTWFuyJzYXd5f4tSr6oQ=;
	b=05dkw+86X7VybDqllDdj0Z2G0hZEcGzP8SHHSIysKr8MVFq6QXh4kTPHhr2C/HeAfYOU
	 oAFzj03S9MgclchOMg8jy2pY39gsNHH6Jp7EJCOnvnX+7Fmc6xe4NCcBAYI4bVyV3mxjQ
	 wrd2/NBoCjZafCSSEpqpnAlh9Js+ymyGAnmb8W1Yxi9iGExsW7xlaDX6MaObz3wXueQND
	 h6f52wEfI9thRm94QUYDf519nPGufssbKt/W18y2X2MBiYelY/jFgmjCzlgXTlHWlWEbL
	 jmrytr5jqa3+qJt6Hp7zFjvyIOkGfd30CQglCrA24U8xvoqQTV5u7lu8OOhNQRG+a6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzdV9ohT;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA47606A32D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 03:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EA47606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzdV9ohT
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so3838640eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 19:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793589533; x=1794194333; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJCnzPlEYPTpiPpNwhFLsc1nTWFuyJzYXd5f4tSr6oQ=;
        b=HzdV9ohTmNFyqmLLsDCqmODyoy6Sx31mv0ijemiLjdQg7hHw0X40I2CBE+mz0w6uWC
         aNYtC6Yu5CBBGxnEVhvE/Y4P6wEZVejk2WgvWSIhziXfRTXvLOnmEUo9UxTr7iP4XE/3
         2eEplDFJDBFyraV/0AW3CWGNlYcrVqQIpT2k2nOGcHrMMk5JghogbQjvZYX+UKpoAakp
         Y1Cxg2O0X+lnxVEt7t0wL7ZtoESdT4GuM4+mampJwV4M+gY1pIlnVR9DJfvSBaw9QIpW
         NQcWRXEroXcZLMc6vUr7ZvMWPYeFlup5uPOXrbCj0dmNQE52XCFrdmOQbDZhTClfxJTa
         y+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793589533; x=1794194333;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nJCnzPlEYPTpiPpNwhFLsc1nTWFuyJzYXd5f4tSr6oQ=;
        b=A7WMs7K9ZO77Oe8nAhOZ5DP3tk+Y2vp49ignY92gmtzzmIamXlcO97ta6gm0R+e9Aq
         1XZcQKC6qMCfEjVnWkcWZQhR4MLVMuc9wXDu0118OXoQV+6bnL4l16crIH+fSZKvyMR8
         6mPzGBJ9eZy1kl0Bk4IQOFbEQmb3mT9uW5wo4/FRolsz4Ewj3X3yyUoKbyzSurTcPF5V
         iDo3Gc73Qt/Z8YFn+X4ZDo+Mx71KfEqfQUn4bCWRSaleRj/SdhKp8O0IXZe3kWy9XLRu
         sbbVxxWRIeo89Z2EgANoWt2Y2iguTazs0XdHnGvhlSnI8Na4eKDe7n4Yi83L5zjZdKI1
         4DeA==
X-Forwarded-Encrypted: i=1; AKwUvBxs1u2rqPNKfmSb3Cna/CFLwnGB+M2izrCINrmk8sxPB9CWlDkWBFbm80DUblnlDQAXV4WvaLSI157/E+De@vger.kernel.org
X-Gm-Message-State: APuU4Z9BajVyQUpQizGeoln3jJylmO6zP7hx4M4J9eWp0wDFOGGGsx/Q
	IErUGXU4BF8r1vfqpAyusqFrAW+BSWpjpf8rHX3nEZMVd3KX663QOr44
X-Gm-Gg: AYBFou2I+nSVEfvjksDFIFDExveZBBGiMVgS5KFI7aIqvNhAOL8HUBy9dfEfLZIguQj
	KPOTVP9FW1MCjlX1pyY7+YSf1xHxvUM2b241KYPpiEoKAstOr6HtiR5nRTTSe4TI9+tBP7z0Wpo
	qIPzeXUJX9uBseIhiK50JeSrQQg6DVFsJsAfA9pYEh732aRxSZTJB6LRvfTZOHNJCsBhqU7ubhy
	ifC9/uWDKnbwzC3GdiA2KbSBi5IO5+3WPa0cRvqFSvUfiuwVCm3NBWC8CBpKa4VjPhtb7CXM0nF
	EUyE6fQ02VCmp9xyWKquCmjCN/QMPvK3xPr4n3rOQiIzFoU/JvI0XI3XzKey74R2A51bYQX44Kq
	EJ8xd2n6jo8lmAHf2hZ1gt8JniNVfrSa4GFi5YdR8lwczj1wWARmr6uaeXTBQ+5K3CwTZt6anU1
	t6zBaAmw9ltwdGFgDusHsexkFLLhgt/FqKhQF1nt/SG1Vr/WQxPneRl2UEulPsdYVNCRvuKmM3Q
	KKMGSwsFb4g1r2z+nNTY2t2Wh7N0h77DTdDCrS+UyRKeJFQw3UZBhd2WiANW+G7yWmuzrN86vp0
	oJO1XsXVFEoDsyAovAF3u17xpqWxx/CzMcoRuLCr3rEqk3adfI9jTiZRz2rRK3ucdl1gtOI=
X-Received: by 2002:a05:693c:20d0:20b0:36a:112d:fae3 with SMTP id 5a478bee46e88-36a42435927mr13964731eec.40.1793589533040;
        Sun, 01 Nov 2026 19:18:53 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:d75c:a9d8:6c00:c5c6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6eabbsm33411882eec.24.2026.11.01.19.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:18:52 -0800 (PST)
Date: Sun, 01 Nov 2026 19:18:51 -0800
Message-ID: <4590302cb7f26ea6173018f5d7083977@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Petr Hodina <petr.hodina@protonmail.com>,
	linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	stable@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/5] Input: support for STM FTS5
In-Reply-To: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
References: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi David,

On Fri, Sep 25, 2026 at 11:22:18PM +0200, David Heidelberg wrote:
> Used on various phones. Minimal viable driver.
>
> Includes device-tree enabling touchscreen on Pixel 3.
> Also, tested on Xiaomi Mi 8 (device-tree is not yet inside the mainline).

I applied patches 1 through 4 (leaving patch 5/5 for the Qualcomm SoC
tree) with a few small adjustments folded in:

 - In patch 1/5, added a missing trailing newline to the reset timeout
   error message and fixed a typo in the comment in stmfts_power_on().
 - In patch 3/5, wrapped "const: st,stmfts5" under "contains:" in the
   allOf condition so the check keeps working if a fallback compatible
   is added later.
 - In patch 4/5:
   - moved ABS_MT_TOOL_TYPE setup from stmfts_setup_input() to
     stmfts5_setup_input() since FTS4 does not report tool types;
   - dropped the undocumented "stylus-enabled" property check so stylus
     contacts unconditionally report MT_TOOL_PEN;
   - checked X and Y resolutions independently before applying the
     10 units/mm fallback;
   - added a check for !sdata->ops in stmfts_probe();
   - fixed the GPIO name in the "mode-switch" error message and a couple
     of minor comment/log formatting nits.

I will also send out a few separate follow-up patches shortly: one
teaching touchscreen_parse_properties() to parse touchscreen-x-mm and
touchscreen-y-mm directly so drivers do not have to open-code resolution
handling, plus a few fixes in stmfts (not aborting FIFO parsing early on
non-touch events, validating the 4-bit slot ID against
STMFTS_MAX_FINGERS, and switching coordinate reporting to
touchscreen_report_pos() so axis inversion and swapping properties are
honored).

Thanks.

-- 
Dmitry
