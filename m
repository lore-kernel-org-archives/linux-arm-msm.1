Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541634;
	b=wNEpEAjXiV7e+aoZrE1pdWzyKzp7Gj+8tHUfbq2q66yUZDjp2agXSQp92zCq8iIF1XQq
	 8geB8jJUauIZ0sXPpemHNz9DVnkjA++Lc9FzJ4YeYEK287a1rrGvE3/xqJz28kwKBJVE7
	 LKgzkdy1DXcJGA3XHBIQO5gEE0ugWcjpv3Wh/vgUbHaMY0YJr4DVNtjnLAokv5XrlJWVN
	 WPvrLCdCP2xs7hzMPsjT9LP9jkwtBRyGmT8g2JLODRndEamAXVzangsSg/huRfMlfAF7q
	 uibx3KoUqAtcy0N6FIO0SBM2khgSHp56s6Dij8PcZi7kHcqQC0Lwwnm35oEBX1aSNlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wiuyexhBeJMAQYshISHeK6LJF1PaHeuPItNhVAf2u9E=;
	b=VrmfvwzpBdkwG74gL/bEs9GW++FZ76T+dOxuupBVTxumLljR2w+o4n3YxhLezTdLf0YW
	 YNXQge0IhXwE1qWetmf3p/A5n+IHO6KlfX48vpInE3ARLFd2hxKIqu62T7APi/dUcyPac
	 bK4AlB3MbDgdZLKuD7extTSiwq1ip90NqQWl6j7vmd5dH6H8rcX1HAsoH2nOgbT8dd97Z
	 AQoNWU3OnVUTF6K5V6sqi0zlU86TmWLMaIA7O5VOtVQVgIPolx+QgaGhPH5t6p2MNNBQR
	 c8s43Yd7oi/BYrfcz504aWeAHzJ3RvDbLXoUFJQq6iZbejflPnQVEFbbzf+pEw2ejYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cfZ3w1fU;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79293606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79293606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cfZ3w1fU
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so30936155e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541633; x=1796146433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wiuyexhBeJMAQYshISHeK6LJF1PaHeuPItNhVAf2u9E=;
        b=cfZ3w1fUW0vulvRXY6maReaWXvvzJmwc1lPh01QfqY0uV62PRD0Ql3MA+nYd1kW7sU
         4sJtFXAqxGtI2qA8A3QzaAvEr5J+3FvgDrFcHU8mFT8SpIu9DebXC9lOSUVHx6vd9G+F
         1Wcg3GdZ/hySgOeC2BkuQohQySZFWUy6Ocp2iabtffltmEww6EPtaaXrsHqj0WAhdJvN
         MBUX9OFHj1lAFIkwQqMoEKFzAIAQBaanavY18Z/EkgHm9KzwRFKE+E+t3/UHASSdyJCJ
         +wKeoHNVX8kmqGNdcjzjy49YtvgXgR736vdCA/avn0NhgcsLa3WDOQqRTnXu8DlCYu0O
         3R+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541633; x=1796146433;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wiuyexhBeJMAQYshISHeK6LJF1PaHeuPItNhVAf2u9E=;
        b=DiEJMBQH/rnJYD+xzokUddjN8xp5kxon75n3cDtslm8yDQdyK++tR+74PXlJVqZ4rt
         3kWMPWd4fcWi65Mpf5cE0Nko4tQKXM/BWDjmPyF0Ql0JuC5QYr292LKi34OrEsM1WQb5
         e/031cebmRv/Ank1Beb1VDRtDwI+7GFW550lP5mpF3y/bMVyUdLHJNRDZMmfEzMneoEs
         1/KFMV8HKFGZBTrMseL1mu40pKLP1WgFlMMdOfFwZKMI4Ett9jSMf3O+VZzrOJrS0qX3
         V2Qh55+pYJAYwgxm9rTrs6AVMdzGbShgxym804g1qIgUagGcKreXoXXxXX73nMUwx+RW
         MNRw==
X-Forwarded-Encrypted: i=1; AL+hErFE+PMrjJabVIUSQf9e1qtpo1LYx7hw7+4uIWUvpiZxBBg5cAAc+X318CTqhZEX3zpSPJfUz7o5tZ2CGX6Z@vger.kernel.org
X-Gm-Message-State: APuU4Z96A3iJDwDPhNnUelaEYCadc/igVQ9aMCJOUtx+plnhz34utInU
	LVhuzwqiYJFuvYnE0yDJV6iAVPUPHfd0zfqyt3L/EL3RNhIwg0zLECFi0RICbbV3ugc=
X-Gm-Gg: AZFdTZcQqGcRwMDxcxEjFexatTb535jxS4JepTqqnEkcigtolKzTA7pNYkS47ICTqff
	kJFENBl+WhxapnkDWr1oIi3ZKRkCbmdPCDHzIw4L2Sdx+7k/U1MFRQU2P0jh80k5ov5lfGBqypX
	JmtaM6qvFMGKbhSoN1KUJsUeiyStk8vzUECvsN5kendmLUCsoy0S6Aulv8hQG4uOA6HC2mJRwNq
	1pAccWWHbqNP2tJaX8dEn10iJhjWWeG5WZ5HtBoKKH5r2cxRYxBmrfRYGu22GucTF8fzfj2I+TA
	wfSVXTSzPG0CKp5bk+yxbmCp2aVQ5VTG1TFGAjIzb5mUjNuQw6NkPIzzLYg57ynGeAgg/xPOaKT
	nESdFk7syRFhsy8oLYeZNJugV96MCxhmBRhdNfKyf17es+iAjyaRICnMvQk7+Gnxg+yYMXLhsGb
	5om+woi6f99gm/ZtflHVbiz+JtHCCIZ41XaPJISRnB69DMFFlrPPNnNtYIJq221wxrsl3hU9zMz
	G1ztP/DZOvFQGf5oa7zxWrhL32GIuToVX/+FA08o89hXK/dzxEqtk8fNiY+s8TsoUEufy/GfLBP
	mhm0BPVE4hvP0nZCrblY6WUMSUG9pwVfVvgrh09cDdA=
X-Received: by 2002:a05:600c:468b:b0:4bb:5fd1:92aa with SMTP id 5b1f17b1804b1-4bb888160c2mr325342815e9.15.1795541632819;
        Tue, 24 Nov 2026 09:33:52 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm410677815e9.4.2026.11.24.09.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:33:52 -0800 (PST)
Message-ID: <41204b50-d861-435c-9cbb-8155e5e1d771@linaro.org>
Date: Tue, 24 Nov 2026 17:33:51 +0000
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
Subject: Re: [PATCH 1/2] media: qcom: camss: Latch buffer addresses through a
 single helper
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
 <20261124-tfe-fix-irq-v1-1-fd9840d952ae@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261124-tfe-fix-irq-v1-1-fd9840d952ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2026 16:47, Loic Poulain wrote:
> The buffer address written by vfe_wm_update() has to be made visible to
> the hardware, and the way to do that depends on the generation, the older
> ones only expose a register update, some relies on a FIFO, while the newer
> ones expose a dedicated address update that triggers the latch on its own.
> 
> Both sequences are open-coded at every call site today, with the address
> update being additive and always followed by a register update. This
> leaves no way for a generation to tell that an address update alone is
> enough, or that no latching is needed at all.
> 
> Add vfe_buf_addr_latch(), which calls the generation's addr_update() when
> it provides one and falls back to reg_update() otherwise.
> 
> The write master configuration programmed by vfe_wm_start() still needs
> committing, so vfe_enable_output_v2() now latches each initial buffer
> address inside the loop and issues a single register update afterwards.
> 
> Signed-off-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
This is a bit too wordy for me.

Can you reduce this down to one paragraph. It seems like a 
straightforward functional decomposition to me.

---
bod
