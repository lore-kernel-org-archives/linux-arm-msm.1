Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404496;
	b=4eCtOoMI+5jX1vH+dpz1S+k7QioDL70Ek7897K/wKn9IoBpLAlBwSGPk/W/AiiFb/7JR
	 MZKb5k+fkMTiuuQQe9SAMU/ND09ngzqMsgIRj7jRjvkyBxlLXmYld5XeucI3FPji8kFNH
	 Z37bs/r5FjUbKvwVYfgdicag1yO29WiOPck0lenQ68YfQ09owKwOE7+eChPQV3ij0Hq5s
	 tN63uEM4JKhjaEW0/QjPup7aM+DL6x/3HmNRLGn5dp/w4h9NYKmgfBa7AFXEMr+BSP4vO
	 RgtlYFfIQAlQWOOaR+7HTjlvtCQIkdxRNzmlJBrdMzCHmTFyMALoGvxqRV0MfjmBrYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tgcyXRom+DYUOBHj/B31scavrv/8OCK7JtPppDaBX+M=;
	b=ofvyC9OMam/7bKtj9bBjSx7gtpP+fq416eQFh6P5h4WHK5kOtDd4kY05o3M0G6mip6eW
	 8fpTrqiF4DMD7TaHSnUS4gX0Su3684+M+v8UZjg0yyXuLBGb+zWFMaB6W5M6NtGzvmil7
	 FQCct/XpWxd0iAv4621CJU0Apeq9RaDvKdxGrfOHZ8NELFBokBhE2FzoAX/R1ClRnG8Kc
	 zuADNOqkecYJO5BYY+W+uyz1knnUHp8oViG02UL89iOBGehTCZEWFqtWSrtdtxm8ENcnN
	 F1Q2Qv/xdR9E6P3CNUaAqmGjRwyJkc2g9PQKPesEMY/AOcyvEaarosTAXyrUBbsBq4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F2M43Q5h;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA260606A331
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA260606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F2M43Q5h
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-483c607ccb4so1714356fac.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 05:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404495; x=1795009295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tgcyXRom+DYUOBHj/B31scavrv/8OCK7JtPppDaBX+M=;
        b=F2M43Q5hBJqtm2Z8XTdPEPr3gXFWQKX57WO91E8JYaXNf8lFx6xv482WviotB9saBF
         Fk+pOxkRYsN41HIKHasxbMsR7hGp9UKInskQMg3dj/B5EReUx5meqbv8GAPATba1xkzj
         U2usazsmFAsfu4tkfuq5XgEqVgxmLq0/7SYCvDclv2kJg6nO/F/eAa3nLqJ1z0utVWPR
         vqYVl5i9ccwHZ6kQoiqvCqzLlaywgPJkcKZmF+yudB5MxXUZ0KhcDomdVJJEXcBN1Bri
         LtbtJ1+br4+ExfFu/N41ytzS/8Afdlw5bpVE/1d0zOK1m0wDf6cmPF3mOMF0s/E05sVj
         46/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404495; x=1795009295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tgcyXRom+DYUOBHj/B31scavrv/8OCK7JtPppDaBX+M=;
        b=gZGhQF5cZZGhGGye/JUQMQeC/NJl9yHZ3H7Iu77srJ90/zpP8cZFxtSi3lmN+qKat8
         DQeZu6ySbijvUBugb8JHV9p3HMkJhZJyNT64CfPzH1m6DdMvwpGsWmAL+TO+Kd8oxrp2
         SAfwkdUEXizIhxDqKFKhK1jp58Z6Q7fQGisVlaDL1rxWPqJ1RsRDQ/u3Hrz+/pNVvJby
         vyc1zjkR7W3jZCOLRhKfcAOKPess7wv7zD8M9Qcx3mSLtsc2TvzZMVkFHrmJNUIPEK9C
         a3EtnWa1XZMXaJNgsQhuCFezDZry4+GIAnqK9tvQAiOb6ae5m0jNYiMI70ZhtaR9oKid
         2FMg==
X-Forwarded-Encrypted: i=1; AL+hErE8RQFAigMjemx5Row8q4KOfPz8/aoQP47hSkSMKaUPd2vCpBv/A4m8JBH1+3xNaw9TVPhs2fXkrqpRQGp5@vger.kernel.org
X-Gm-Message-State: APuU4Z+YdlbxSb1vKvB5wi42a/bhNgG+eFaqPR9jcl7x7dLQfOjQLCYe
	nVQeUR6tqHBuRshNQtL2weHML7v3x/H+IVFU8EWsIHy/cGUSN/QfldMR
X-Gm-Gg: AYBFou3nTm/q1cGYu9DofQHAYa+zWz4PL7AbTCZhYh+z407kPZr8NK1RNoRUuLH+kqy
	ccoXFdxBgVJDxE+jmeN5YWtUmoJjzJbRvzN+vjS9fQ6zTolT2N3tjU+ZmnHEJAZ6nX8ayJ3J0+b
	ZHHogWtVuxkhKG8QtPD6Gqy6Jo+LG8Spg3Mv84xIPkgphuv9BSxBdlK6t0VsvrqavqmU+Y2gks4
	j0z3wNnKdt+Tky25nX5tHIvqDH0Nbu87SMuzAeD8PfceOffWHYoDHZ8AlTcgea+sGLB+rLSte4B
	wYmAoifGKRc6KIFLBnBr2xK4dXa36JJfclE6vAL6NXkg73iywVXjXJsgWBnqvdoSZVe3RyXsI63
	dvZfcD3AroLfQGums8t62cuXt8ibne8zQnGOUsAfEAnSViN1dm0vW81oiz3BmV+dFzIkGlIxb6I
	k893hOigMPV+xgiM88p9yRB2yHdxnDWap+LLfiT62sCNVsI5UmtsypIpaZHy5Hgz9k94DGtA7Xn
	ip5y8gAjb2IhzvEtGocralLAkxj5uUj37G7Tu9CszqlV6cGGATB+iAztcMax3tglxbGL63Dwruz
	7AO1uYI3e1Y/ngDzlOt8bzis9/OWuz/dIeRCPfOOarQyqVoPImRtjxGLJDrhAuPmnC+aeKepdgc
	=
X-Received: by 2002:a05:6870:ab8f:b0:494:7af4:954a with SMTP id 586e51a60fabf-4ae46848ac6mr2154035fac.8.1794404494609;
        Wed, 11 Nov 2026 05:41:34 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22fc1041sm3410611fac.7.2026.11.11.05.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:41:34 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Collins <david.collins@oss.qualcomm.com>,
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] soc: qcom: pmic_glink: Add GIO pmic_glink instance
Date: Wed, 11 Nov 2026 07:41:01 -0600
Message-ID: <20261111134101.15019-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111131424.51869-1-jeff.roach0@gmail.com>
References: <20261111131424.51869-1-jeff.roach0@gmail.com>
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

One more thing I noticed: after the GIO test, qcom-battmgr-usb stopped
getting uevents on charger plug/unplug (sysfs "online" still changed,
but no USB property notification seemed to arrive), so the desktop
plug/unplug sound was gone. It stayed broken after unloading the GIO
modules and a warm reboot into the stock pmic_glink. A full power-off
fixed it.

Jeff
