Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810950;
	b=e18hRVW+ImwYsscWXz07I+AkBOg5opgsMDUhklqeed/rDyfYaZE/FYTVakqyr9NLDfG/
	 JP3bw7zhC1hh6MSyt35S0OrbKVqhEljIl4Wx1Gvd9It/2UrYI4JshFf0HyOykjo9t6wTm
	 LTA4wGK7ljAnFWIrfJoOrkeGAxYWWFHdoh003SxlxNU4tLIXadvmfs8mwXLB5x/q7knhz
	 VV2Pk7eD8KUBihdHkXTD4kxiFDYCLSGN+8qk7iGs/E307mLIUMNSs0XBTZBVPzbPpaMEi
	 eeQ88CBNmPXRlu6174r0MJ/CW3xN37TY5eqcJ/XhliQRpWFsC8Qug/ZJXf8ZqyXJvKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sP4ZKsXWKOirRhbwpXuRq25+zM6aYIHZ5krwTSsRttc=;
	b=2C9sYLnsgTutS1SgNO1K0jHLiLVzicDX8xUZdqiYa0lurpAg/A6sMQV/nnxFRZDDK2vJ
	 iSIvraKNN7nC5lqXpaTSdvUtdSJhcEoz0naJJiYtuLifyzgZky35zYzt1SFo0kpDVg8PG
	 ZB1tU/ezwz6OXv1kKOPPiP8vrbMzqe8OUw6uOH5RI2EiDAXAmujXolULgXRerOIvaDxBQ
	 bLXnsRc8Y7pf/TU0RuWM16BWOjsiN/KszjT2C/tLL8FTXk2TzpkrqOdSAUz6phcxmOiBr
	 by+aiVnUdxNueEk/Ld95RVJJt4onp10oVoDda0R7w6ZTl5gM4CHwzIMeVM1XNuGMjwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l60hOHWC;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03D860A3810
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F03D860A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l60hOHWC
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6de2f213b7aso649071eaf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 20:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810949; x=1793415749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sP4ZKsXWKOirRhbwpXuRq25+zM6aYIHZ5krwTSsRttc=;
        b=l60hOHWCpd8Y3qAoRl0a1aV6WSFA5+FqXW9kPHrnLLoXB2fKIOrLaf0+/+btreYayT
         NDkkL16JETWWDXu9QwGFZ2RvYXyO79jPnBgzhC2t2CeHBMuCb4cdMUHecxpQ8udxby/G
         1LKFKT2WQjrfvBdPZxfGhguGLlPYu0TU+bO1DLPY5VPH3NGwexkVEoa/qU4A/1D0t7Km
         GnAslrEEbjydG6ceVu4yQpp4UNOMzIY4KmZBPIonOsPw9reAKPFHL6oZfU1YOjv1OwbR
         GZeWKwKc9mO8Nm2K57wZlngkOUg7AkEDK6NV2Re+OWBjEW3nKj65XrIXFRW1fj2yVrBW
         SN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810949; x=1793415749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sP4ZKsXWKOirRhbwpXuRq25+zM6aYIHZ5krwTSsRttc=;
        b=WWuGbMAIW4izhOnagURmAS3BLO9WARTRL4goV0he6hA6K1ABUgp3vvaMYM9VgLIkel
         ZZoIT7Gtf7TutA31I3CAiExPW2VcwC8QKQhyJ5O9ePljLi/i1zt87bTuHiETos5/aI2U
         VwneDPEZLUgQKEO/65fctwfleqNzW8iyRofdkFDwDRLdGIRR3EPOJqlvWi3W0+nIQs4F
         zFZmxKk6LBgyVnzdssDC3WAjkfcq41MJYRB8nTovkF/rVOwR30cwMvxCF4GnWWHK7oj8
         wdB5mcoYsQnRFPnCMmLFulCmxYYT9bAQadzLck7knwfgY9i3J9+H8qz+9LOUE1P2ueca
         53Bg==
X-Forwarded-Encrypted: i=1; AKwUvBxwi4gZtpbm14ALN3m18s7mBiwzT5zvvyiOmqZpQefBszZBWOD4jAQvCr7JolaC6aqe2nzJQOhlolFRQM7M@vger.kernel.org
X-Gm-Message-State: AFq9FYJXiNrPuNyD7I1C22+Oi55JQ8V2nsDSPnihhaYizbxoBFOtx6D5
	MzqQ+XXkcBZcYJL+DmUBLKGAvijpSMLKNxw8PB1Coeu1hBOCwIWFhezJ
X-Gm-Gg: AYBFou1UdZA2VCS2DnOZQ5lOgeo8QQxXajLtf1m/osUZPVQg8ccqEr7dP0uMdA1utOK
	VhZYBUBwerY5451zu3zU2q40zlZzKOLs78NIpPLMVh4HScjq/2M9GHubKP9b0nROWeT1zkenMGu
	nuDpnSG+APJFI2Jia/OYkKzg41CLB97z4X9VkZrvjtEViOqaLe1bX+ht5MNq3uV+5M7404E8e6X
	1O8Dyzpfws7uILiedfPH6jrazsNCIEVi97W8KcZ08dU5Kssz6sWBRkKgqMi689of1Wbj4IivyVo
	LJuvOA5A+8qU/YReFZqKQi+SYW8Ka8pwScFP5DPpwtiz7DFwiTIru5VemPWMQtyKuSg0sVSfsY6
	JkDT+RblcoXeJLiD0hHLZGWoLsE4M3OB5rvkGssE7NjxRYFib/WjVDWwGm/9NIgGrLtJFJu5HI9
	VwnnUROLS+UkVEdBP1RZh8ajuOi/TeKVKis3XswiWASnd6D4nl2uODkESbEP3kEBqWesnleQOOm
	IoY1FnB45SjQMY2pfyc4GzUTf7lfy3RAzoGCADxLoVOt9dM5tBrx8LUzL3SwuZkW6AVxHGoy1fq
	evZJ2g==
X-Received: by 2002:a05:6820:c2c3:20b0:70b:8916:547a with SMTP id 006d021491bc7-70ba0f090f6mr264783eaf.65.1792810948906;
        Fri, 23 Oct 2026 20:02:28 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:28 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v5 06/11] phy: qualcomm: qmp-combo: Add v8 PCS-level drive level tables for Glymur
Date: Fri, 23 Oct 2026 22:01:31 -0500
Message-ID: <20261024030142.13643-8-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-6-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-6-3848c2615d5a@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 01 Oct 2026 15:04:23 +0530, Nabige Aala wrote:
> Add PCS-level drive level tables for the Glymur (V8) DP PHY:
> - qmp_dp_v8_ln_drv_lvl_hbr3_hbr2: LN0/LN1_DRV_LVL settings for HBR3/HBR2
> - qmp_dp_v8_ln_drv_lvl_hbr_rbr: LN0/LN1_DRV_LVL settings for HBR/RBR
> - qmp_dp_v8_pre_emphasis_hbr_rbr: updated TX_EMP_POST1_LVL values for
>  HBR/RBR
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
