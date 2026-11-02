Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657122;
	b=k8D3NRgKSRnaa0txDR8xQxd/h4zGSD9ezQQlpuQGErnuRPWkncM6q7wrt0mCgbrfmLq3
	 N/8GYJFJb28IR/oNjBbGHtD6HjwEHh+psdwMgs36am/gQhfVimrr8WhBX+mLO6lLtBhmU
	 EbtF0GRVXoYTPAEhX08Xo6zF9Qe/RXo8iBu3ykAYTYX5OHxWuyVcB+dDDWT910Phop6cz
	 vUEH30RPZaRtuYYQhXV9FV4JFu30EhPGc2ocCZqNGtF5QozEBbUt5aJ8yNamUwVIEzNl0
	 HGHW6Q3XdMjpeS8UlhQROmyBnEVfisRVgVAtaeJznMfdpbJS4wSlX+zevy3B1O0WnaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1X5bXRL8qqmcC6O9ai7+IAT4c81ATWUWkhjo+536Us8=;
	b=LyAsDWGvHoTgRWU7W2WmH4Y1Z0h4NsOwDR+DAaIkkXDeyXyK1M9gsX64jpXB9DPWDpd4
	 bAQ5CP7PzU78IGbhEEXbdfSGrdaGa1RI39dIGsMLbXlxxDXS8cqagCm22+6ksjCOlBTc9
	 swqlVSRgwm8Niei37LineYAbMEOykU/etSH/K2o99bXmZHITmE/vssgff8POQtcZWEOMY
	 V/ReP3NUqGHecALPMSfJqZBCevRRhzd0B3QRHHrRUPnn4MnrNki+OX5GGquEbK76MKhTJ
	 5Jtgeig2VMGI4HVp6iB7wfx8UZXVwdw39AuD7C5LSnRp6m9TwrIR+BVFcExQE9SQKAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUs3mu89;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09786606D83C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 22:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09786606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUs3mu89
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14394530ec6so4538243c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657121; x=1794261921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1X5bXRL8qqmcC6O9ai7+IAT4c81ATWUWkhjo+536Us8=;
        b=PUs3mu89+syzBRQDWzZ5ixeKkYfm7Ii2ag28THP8+Pd9LkZZQOro6Z/HEuWYy7rQEf
         6s25DD6Mt3qyvJ8QfIjMR75zutVoFrxfYCDKAftAiS4v5jL4bj0qUJfNqKmlOqq4zUlR
         RPafHTP0eJY2vVTf9ppyCe+YK8I7tlameB6HcKJqSgVyGEbnjZHG1HK5MEawyr7VMhOX
         8ZTHNrPpSQA5BFgYTbWPLSF/R87ic5NTl3MnIuhRRvJNwFmMfHdviPxnyVboRlWk39Mt
         wghhoMBEaOFeFVHMYbZ2U+snwUafVNI0uu0hGUcxqhrZjFRY9hAWw13syb8TM+TuaWRF
         N4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657121; x=1794261921;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1X5bXRL8qqmcC6O9ai7+IAT4c81ATWUWkhjo+536Us8=;
        b=P+D4Ud8Gl6kkPUTGmIlptb4IEHM3Os0MhK9ElOLrSYCxpQn4muItTB96cjXdrm+wqS
         XDmnUm+8/FNFS2+lEJPnnYEPZjbzSnWomqPFVieELwGSKvmU9IHmAnn1hW0dBZW7INMD
         JE9be3TMkJ9IMaqGH3YNLgb2MBwTfpkeRF8Hq/XvaxDmrkPT2fVrTEmD3h29gV+Dbwj4
         QahwKi8PXS0kPi6mwNBERUjIvSQNWJENR6AvwVtKlW7h13folul4CjqyAjKFKOnOinKG
         gh2sn2/iLxnC4203AZRfd0CbhJVE5pNtsz+pzyYh7V9NRccrWELDEHPNExxBsufUOk41
         QZAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMOsKWAnkyO/YqskHwsQC/BO8uEVy6HW2iozp02drr/T/Ph6k2rhb2cRHR2wJbM0rnuwr6n2QiRNOGcxb7@vger.kernel.org
X-Gm-Message-State: APuU4Z9giirpQrJATXcnv5tkgT3olTbkqIGZpVxRvm+JcjjcJDZINR/A
	XxAIZxQ+NsZdABMzT+fa1LTnfC18MVMggPopA3RXs6yPwPV4nW/UgX+R
X-Gm-Gg: AYBFou0tSVeyrAhqIyFpWFVScFpF87J0Oq6YE0RDrURgCRNS1Q4TeOjvuNVwcv1rz8k
	+MjBVxJ0/NB/63yGWAiqvGYKeHVxoDdEggKlfA51bU73NJv93AWxIMoex7op65v0ykIqOtqIvGE
	jYvZfdeWbW7ETdvPvV3CkDe445eVrTIzvbuzBzMw1mRMhXLn3BhME/GKwVlet29w+dzI+6VRMCe
	oubEtO2c1q+cYU9ztpk2IycsfBENgAi0rUECtLF7JXedk+OJvyKNJh3hsBy7ft3AUB391SCKgEu
	bIc+kFTWECZ3yZ4OJlrXAF8FDBBW1/KE5LWKlAR1cgTg7z2WxK/U3aSsx2wAj/MYINOwCjj/E+D
	IyOV0uB2rb10yaV/nYRMa/TBeColC4IX25R1bwHqjizMDjAdmrJIj+jGtSMIpgPJlvTX1lbay1U
	tbMMIVcuCEkUF23ff8S1pAEzaZo26kWzSmRQhrYDY2xs7El51qvOXHt57UKRUjE7ofqTJy8ib5Q
	pCkH6CTvXS90aTC9wprxN/96KlM41k9wz2HhLEChOsdyZqXGnqhKlkuwtSJGdhAwMj45vqkoy7U
	lptYHgX0ih++HWWg4suvcfhxn9q9jKRaZX5XsKTEmyH63zd6LUgSjfVmoh9q6VFekg==
X-Received: by 2002:a05:7300:3b0c:b0:36a:238:1485 with SMTP id 5a478bee46e88-36a4244276cmr24803721eec.37.1793657120646;
        Mon, 02 Nov 2026 14:05:20 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm42657742eec.7.2026.11.02.14.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:05:20 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	media-ci@linuxtv.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/6] media: iris: add iris4 specific H265 line buffer calculation
Date: Tue,  3 Nov 2026 07:05:19 +0900
Message-ID: <20261102220519.1738-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261001153221.4FAC61F000FF@smtp.kernel.org>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com> <20261001-kaanapali-iris-v4-3-642f9ac5e699@oss.qualcomm.com> <20261001153221.4FAC61F000FF@smtp.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 01 Oct 2026 15:32:20 +0000, sashiko-bot@kernel.org wrote:
> > +		dpb_obp = size_dpb_opb(frame_height, lcu_size) * num_vpp_pipes;
[...]
> > +	return ((ALIGN(dpb_obp, DMA_ALIGNMENT) + ALIGN(se_left_lb, DMA_ALIGNMENT) +
> > +		ALIGN(vsp_left_lb, DMA_ALIGNMENT)) * num_vpp_pipes) +
[...]
> Does this code multiply dpb_obp by num_vpp_pipes twice?
[...]
> Is this double multiplication intentional, or should one of the
> multipliers be removed to prevent over-allocating the line buffer?

Some data on this from a Lenovo Y700 Gen 5 (TB323FU, Kaanapali), with
this patch on v7.3 and out-of-tree Kaanapali support. Hardware decodes
were compared bit for bit with software decoding:

                             HEVC Main10      HEVC Main
                             1080p   2160p    1080p
  v4 3/6 as is               pass    pass     pass
  dpb_obp multiplied once    fail    fail     pass
  once, OPB lines doubled
  for 10-bit output          pass    pass     pass

The failures are "session error received 0x4000005: insufficient
resources" with no frames decoded.

With num_vpp_pipes = 2, the second multiplication doubles dpb_obp.
That is what 10-bit output needs. With one multiplication, Main10
passes once the size_dpb_opb() part is doubled for a 10-bit capture
format. 8-bit streams pass without that.

Is the second multiplication meant to cover 10-bit output? If not, I
can send the 10-bit sizing as a patch on top of this series.

Thanks,
Joonhoe Kim
