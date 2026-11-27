Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771724;
	b=5YbmuIX09WTMwoqzTlq1Fjsvbz1cU872htXlP8tNUckGxlGK2CFlFSWZTIXQh5jAuzA9
	 xYQaZx5Z+8fK4SUiWSRVs5Zz4DqvIhp4F8lyPoh/ygo+5q3cLIDrEfsP24e+eOOfA9Vy2
	 jMI2mEEOhjtzAVpXZK5mQ0tkTD3WijRAjkxw42HN9eHSMeDVP2LeU2iQrbvNpk5JyHlGN
	 90byWGC+1/+80LCG7JM7RjQfx+jDZkGqZ4yrjBwen3cElTIX+8nBBFw7WE+VOwAeht9Ie
	 EEOp6VUlYL3MZjsKqwaLGk9Cm3Z5jm9fkIQWLWMuTDQQ/Zc/sDItBX6wELTkEOqZ3ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OL9rbtESSgwSWVfK1XNXFtFtBgJaq0gp2fPLISBcSjk=;
	b=MvYv2kgdr6L/kYc7qI+MA0IoAIvnFBWYJUm/3tJQaGV+eRK5y9kYdHpeZz3XfhadrIh5
	 iCXoEVriz55upzz2/B1JlXnbQspV2oCpcosasBc68J+5wc+tixApP5Yb4PNiVZiWtJGG2
	 5xoRqZmglZhob2v+VSX4eAWPpy04hrUawMYLWmr2MX0RCfO5M3zbhwFU3OcKi2mRRJX7h
	 OwvVsNwmTLxWQE7/HakVCUQ99W0+XdGq9e3bD5eBGEUarBuq1cZhAWEp2eFboyB9smKGs
	 Ck07AFXWQZlQJrMHxMxpAlImz4p80lSmDgdYtXSoc+xioNtLPL0QAji/wWR4Eomz+oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s1TJkJIS;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB05606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DB05606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s1TJkJIS
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1aefd1bf74aso4331473c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771724; x=1796376524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OL9rbtESSgwSWVfK1XNXFtFtBgJaq0gp2fPLISBcSjk=;
        b=s1TJkJISXewQmUpUVQiIHzHlybd4cEGScZ7uhhzsXXHCcV440wn6WcsiLt793R+Y52
         gquERBUFNVjQsL8WqpRAk6ESNpW/3bqBqVI2VVbyz1PeoTq7Zq38JC8EE/2ms+vVh4yi
         hcA60n5Pw6kPtwwgkuHmhLxUChjNKEgagUfp4dip1W8pzAF1M9cpQ18yeivcleY4y4qN
         do/a1XGC2jNb2MbnOOSQ514ga8jUjyDrGYlIeW6FiHaqOz1apeSQuZwXEElNKjpGPIUb
         zWgyU5yXAkOfPXLqsLy07SVvF/tVXfW1wDg/GxyW5unBE9Z72w1lP3OKSKW/+KszPa/k
         OOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771724; x=1796376524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OL9rbtESSgwSWVfK1XNXFtFtBgJaq0gp2fPLISBcSjk=;
        b=ISMcwN+A1CZRynY0cUyEl/0pI6oLpSxNi6EqNWoKlgMCvsw7O2w/c3JsIqpz+gX/vL
         eHQkAX2Uwj339YPDnh/ICQQnsn+8z+yrvlEsUY6fKOwSj7kjF8fvuJo+a8X/ckL7CTAt
         ANXnfg1un0EdAg8pc+YuPwdSCpY8EUhej5SBSibOEectOzKWp2SQOonHEnCH3qb1w7bp
         skz0GpnT1K3R+G1bumFSrVY1Q+R5ikSatlrjwrvQXrFTpiJ6NT3MNoqFY+BcnCKqDVpR
         N1gWavgk6PMGSYxOusgdLwi2AwBQaIjnj/oKEpzIT5FP2N4pM4fxWKxKW1+ecoEZ5VQ3
         uS2g==
X-Forwarded-Encrypted: i=1; AL+hErG3/PtYL93qbk2GeWtAEsY4BRFPH1f8WZX2rsDY420PxSG8Tg39slphi0vyOFyCz4m8Op6VdJQa8CcnOS6N@vger.kernel.org
X-Gm-Message-State: APuU4Z+CcixjyepcMiZnkeUoHHBD4z9r0yYu/m7CXwqerzaqKKBW7vmC
	zzqGcqhsPBs/mbn4NzKJL//vJTjx6LTlwzU5sAi8rgo8zvrr4Hfl2f96
X-Gm-Gg: AZFdTZclqOM1BnYRD2r16qa13XA/2/uPpyfPFlIKQln9/Bu0gkzuYhS2fyw9YuoRKn8
	e7sBow6Qm/ImB0SuZgjhTn/ZF2wzyOVhGM3QAv6K5QAuAVLLMHVIc7OjPGU4wS6gO2dlpUm3Xlb
	764bTdsZqvABoJkeTfGBRgaopFn09sLSEiaRwVaoPaUIa1J30PDnO2qogYN3heyDZ08pvUO5AWg
	zF4b5RBeGSadkTJnsQ/gJM6eIjS+Hg81Nnnxo7KVtKs+MssFynosU31DPMzn39PkJDUOjc1/ZDf
	Yk6wWSm3guk126YtyYT/lBq/krd8EtZKGr4g9LdnMER4HPRbf65uFje+XTaciMV0nfo0Y2pKVrn
	/46yMJDik2hokO46yW+O2fbKVv10XdLwcW51l3s+S+X64X4EF0cDiYm3lyIBmZ5jcfr5TXrD7ac
	SEcgSGCBTqshT+B2idraO69bvlMi3VOoFwLQaiUZ9CwqBvKBLqB7Jdb6u0WKMrpDSEwz42e1QzC
	rJRIHF51CtfVuBva/U6xXd2Ol0VUhw9YGVpufFxWK+oYbWUcR79r3DFWNjMx0oP8WTPJIeai0nr
	x6b2k/VXx4i5enC2A9NVhC/4n9gdkNhFb5SvovZidsW69GLtqOk8D2KF
X-Received: by 2002:a05:701b:4583:20b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b55247f0e4mr22389092c88.4.1795771723614;
        Fri, 27 Nov 2026 01:28:43 -0800 (PST)
Received: from JMD ([220.158.183.16])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm83505304c88.14.2026.11.27.01.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:28:43 -0800 (PST)
From: Atul Akella <atul.akella@gmail.com>
To: gopikrishna.garmidi@oss.qualcomm.com,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	konrad.dybcio@oss.qualcomm.com,
	abelvesa@kernel.org
Cc: niklas.cassel@linaro.org,
	rohitkr@codeaurora.org,
	sibi.sankar@oss.qualcomm.com,
	robh@kernel.org,
	quic_srichara@quicinc.com,
	konradybcio@kernel.org,
	rajendra.nayak@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: Fix da_to_va() offset truncation
Date: Fri, 27 Nov 2026 14:58:33 +0530
Message-ID: <20261127092834.731-1-atul.akella@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261127090750.2059755-1-gopikrishna.garmidi@oss.qualcomm.com>
References: <20261127090750.2059755-1-gopikrishna.garmidi@oss.qualcomm.com>
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

On Fri, Nov 27, 2026 at 01:07:50AM -0800, Gopikrishna Garmidi wrote:
> The da_to_va() callbacks compute the offset into the carveout as an int
> from a u64 device address. An address such as mem_reloc + 0x100000010
> truncates to 0x10, passes the bounds check and gets mapped to the wrong
> place. The check "offset + len > mem_size" can also overflow.
>
> Use a u64 offset, reject addresses below the carveout base and compare
> without risking overflow. Apply the same change to the pas, adsp, wcss
> and wcnss drivers, which all share this pattern.

Hi Gopikrishna,

This overlaps with a series I sent on Nov 7 covering the same four
drivers and the same root cause (int offset truncating the u64
da base subtraction):

https://lore.kernel.org/linux-remoteproc/20261106184312.100-1-atul.akella@gmail.com/

Mine's still awaiting review, so happy to defer or let the maintainers
pick whichever they'd rather carry forward. Wanted to flag the overlap
before there's duplicate review effort on both sides.

Atul
