Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691941;
	b=UkVxeqTjQr9TK7r3x+SWI4IEAd2RSscBWXP1nkPEkLphZbaXoY6EzFVROkDQfAy5/WPN
	 HTKrga3YgblG0rZJ2hiXnQGFRAWfbznQe/dnZ9mFgnwTdIoDfpmLL6us8GrBxWRF7qlv2
	 o35CYrD2NW31g89A3DBea8HDTFeMrJxfgHjW/bxYxq6bSC5rw7Z+/HSHS38TP4H6zBsmN
	 /67Ra517QOkmmJIvgMULsuvpZLv/5sog/WZl96x1bGB+OPttCHlSOy29ePWpvW/+7xHDf
	 3KZfTsFbHRv/XnzXaKDXisw86p/Gh/xev99xLhmXJJ/qXnCzfzc60Xl7bz7LuBzxqKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GnDQFeTzByRSH3a0f558isd9M/5paBCYJe8HXi4k8w4=;
	b=1FXMKmfmh1a/QzRFPadITI2DAKKnL0lid4a0N5Rvs64VHCrGCUm7KfrA6reGY2uIFk1/
	 zMqizUuiAekrfcm/oAGZJsI+dOTD6aJx92MQC/HBWZSx7CpJotBdVluqmzkoqKFwkcOQb
	 bXKo33IkcHXF/9iZAp5pZ/tCxRtldJyH43VxXlJ2E3yJs/ysUlL2ao0EAxmcMcYVOBuwR
	 3uIkOoEgz0Wrm+h/wgWzKSond9b0ISqrEsVLz+WdIpihO/JdEUCWvDrJFUGqMdlLfNiDd
	 EDCsrC/QZ/BCRZOb7RrEU9Qs3nCR9Pln13zx0DWKbaxTZRy5GpHDueYsMrNafIn9NbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xOrFnJP8;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241DE606A32E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 241DE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xOrFnJP8
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso2754783a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795691940; x=1796296740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GnDQFeTzByRSH3a0f558isd9M/5paBCYJe8HXi4k8w4=;
        b=xOrFnJP8JcRkdi0mUTD1ku955kmOlhNtLkDUQdCudcoJbV23nJeWco0i0E99tgGalN
         8MkdYNy6DXJHnsfhS5vgioMT/dw0XYpiKEna0SWtXgWasKoIq8Ww1sRp/mD1E5ywEWvy
         jeCE4ULcfSrvkYCAgnpR2e183PTn0KMfC7Cq8T5XpGQu5zbzBsjwmK7fnUBVjWzu5gTQ
         wBHtXl8slfZwjNVVNre/iSfypZ3dS6ehi9l4rIZDkITjkbZhNSNS+2WcpzBCO+ta8r51
         4IQodr3tPBOZcU5lTxkUBQKMNDnlNEjIXauebANOjeGfm1pnhKlfsmY6OhURWgdA271Q
         pBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691940; x=1796296740;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnDQFeTzByRSH3a0f558isd9M/5paBCYJe8HXi4k8w4=;
        b=20OH6//vUYgJdejl7hb9mFjAhksY1x5oJpa9JAMIqL3BEce2r+cCQaFSZq/LKY4QC+
         qEjr9kpDcwyLb5kISDwRn4UZklaCc03Br3f4tNe8BmGt4FIlYe0Z1EaHWs806/lOgiK1
         YZUzzxpoQsxgiYWuAVKL1aKoFqNGZTftn25kK/787zUmudXacJGDba7JyVERVRSi7Ess
         BTKIcB5BzbZkeSenhAOyw1nSAC7r4shmc7Sc7y4SBaXBTL3B863BkoEzX9rMd+hP8Ya6
         xYWw8HhAeRHtyLUCpjueIa0GIJuiyG00bsnGjbeEc9NmYpl7XBQ8h/9KPmmtif5t0EGK
         HalQ==
X-Forwarded-Encrypted: i=1; AL+hErG/hUeiBXkrqYUBQ1eDUMbVwH2TRqHNkmyJxgyI1kczCJCQ6W5EOubYydf98Hk9qWNaetAkhCZ7OZydaaJF@vger.kernel.org
X-Gm-Message-State: APuU4Z8lRP8dUYpc3sLED4rjZHFJIfJd6Ty2kIyDyxVApdwVJL4dl6wY
	oXzPOvRW0gq/MoruOW18H3KUSnvOh53cQfaTRZzO/xHMAzLXvUELhrZx
X-Gm-Gg: AZFdTZd4IMdRZtmwhu1/eo8fZI6V2rro+/XMkMSJuBASvAIykpUwF5JpaOBhRSq9/hE
	Zjb2jgNhxGWx78u1K0rbRhqQuUo0hFTVRfojm1ZR9NkhWMruT2PlRX776vB4GRA1EmMn5W+UhF7
	G25XbZRdi6MzwoXuGTmboLY2Vmjmt9pkcko28wNGb6Jwl54G/h8uWAMZpjhVvWBBg8XMQxOs7f6
	thwuex9GhomIcUEwykz48Ks02pSVPAhCYiUFi183s0msFIgSxbjpO5xvb5HXUI4Kver9ug8oTQy
	srQH8UB1QA9bz9fhmLA2wVgdrt53EM9TKbj1LEGIZGuOgSPsyAL9LbwUGak/felDuL8lB2A0xbL
	F8gh2ojzC0xY8+quI0uuEHUzhgGENtO/CxGuutSE+HpB5sf86a7Ijg9tVJuPPKdaGVcvlfur0GV
	At+KJLvxQvY6vmBivcbu/u9YnDdY5eZfwPB5Ob6sKr9K/u6Hih1GyTmWqhr9fwLFkg5iY9EVF18
	RZmqdpsrKHhD8TqGe4lvMDVQsth4BcFEVtnxVhcJL4X/vgER3RA1YlF3CU1JCg3eHCJjt3ETtKA
	tMAeVNfnLKJhfiwZYVbcNScysb3DpAeu6uf+6LvQZhYHO5f8zRd/9+72RudOzCj3A7AV3PIDJg=
	=
X-Received: by 2002:a17:90b:2cce:b0:3ac:a521:953 with SMTP id 98e67ed59e1d1-3b41c982ee6mr20203831a91.46.1795691940411;
        Thu, 26 Nov 2026 03:19:00 -0800 (PST)
Received: from localhost.localdomain ([2406:da1e:5db:e000:2565:a988:ec63:8010])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm35575930a91.2.2026.11.26.03.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:19:00 -0800 (PST)
Date: Thu, 26 Nov 2026 19:18:52 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sm8250-elish: Distinguish
 display panel variants
Message-ID: <awgVnFUK7_-O3b3U@localhost.localdomain>
References: <20261126063056.2276703-1-liujianfeng1994@gmail.com>
 <20261126063056.2276703-3-liujianfeng1994@gmail.com>
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
In-Reply-To: <20261126063056.2276703-3-liujianfeng1994@gmail.com>

The commit title should be arm64: dts: qcom: sm8250-xiaomi-elish: Distinguish display panel variants

