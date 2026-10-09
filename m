Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C244B4E4C37
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 15:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558998; cv=none; b=Sm7i4GaQ2EuQUBeOgsfztUgiOw0N+6RQfBmn6ZIGGo6EH2HwnEGBSt2/bYhK6b6u4Jd+QTMPvgmyWAq7dTy+SDLMLWoLaFPD/YuAHjuPZ+GYUNUq+Ff3t+wPKlckMP5gBHjgMlus+urTck968nxl4VgEPBjZfqkqo8XpISxzN1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558998; c=relaxed/simple;
	bh=9sAgxL0wPdCqCJ80pJnO7SaZPtxN1SKLnKZqrK+Wndo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QCch3CBYAdtYSeTvaklaWRIjAS8YRyl1+1XQeNSP61v5H3LZe7k4Pdam3zYY4ReGAEXn9izJn/ziwEsFWx2ds1bLVmNUvInLRdrsOdYmxyfE/mIttP/TBR7k0qxSk9AlaKkW58M6wQbxOBUWk3MyfVQgFKHih55p35OWFYFRbKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=LMtRaOke; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="LMtRaOke"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c263415982eso596235266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 08:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791558994; x=1792163794; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9sAgxL0wPdCqCJ80pJnO7SaZPtxN1SKLnKZqrK+Wndo=;
        b=LMtRaOkeyn9vl2q3+mxGBqw2kTPPBgIP/2aF+Zfw1a3rsklLWnOl3FiTFmej+J2bn8
         noT9U7KdfWRliQ0fsIu2GbI6QhPyKALhQr8ltkkTpBCLSP6Fsxoqo41zq/jRkO5cPZRu
         /hwLhHr1s6ig/lrTez5fvU3FcAi1sJyfEuLtGuj60nXV4mK1v9WmzpMRw14cYRn37WiB
         lGUwVZjDPoGfM/sN2mSlRzS6/rfxnRqeqwsZS50mgtNvqqOy/NtZSDhihOTfIXTEDIdU
         BqhYDfO15S0dr0WTtDhfuEoxKbLYVRaLjObcmHALYs65YQpem+OgPl0wW/+68E25JIeT
         aQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791558994; x=1792163794;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sAgxL0wPdCqCJ80pJnO7SaZPtxN1SKLnKZqrK+Wndo=;
        b=ySHnzXojlGPHCCb5Q07ipQOCXUOWBxEocs/hiTnWL4Ll3Pd6uPO2U0QFB6w7f/8IKk
         83HiJdSIUrZCUnZ5KC5nEyENcwKCNNKn6pd36AvIOU7oFZHMnK8uDafVCpwhHPE53L4Y
         PpEC2en9kqy4ZiDg6FFNGs/vP3T9OdMUr+7S9XEAYe0z1mI9Ux7/amggihnugLQL3eFc
         xkQU/i0r/OSOQtsxmtKVYTD4jlx+LdfxzCpOVJaTEn8VJveXd6MNMuJJrzUK7abdncNL
         OlqZj54YSzP/5TMr4O8KTw94q3lqWgIpisaT/V6vD+Bar8Ne+AardqydLRa0Tn819xRw
         JnPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcVZpNe8fFGLQue3rMmIN5KXggQGChcUAmEIQy7lszYML4PEyoNrmuQB/mQhhH1oO2uLMiDYGSwW6RzpvI@vger.kernel.org
X-Gm-Message-State: AFq9FYITouV72mPQWa/Gv0LvbcHzLV4MaGy7Eq1vEEROZWzAWSdy9rt3
	LMaO4B5B7e0o1IEDZqCW36MFe8OgMUsra+eajSWUE9CxSrxlAYKik86EeXfm7qeX/lU=
X-Gm-Gg: AYBFou13u2XsAIECYWvZxfEE077hxuO6HClkbpIMveBK9/nw/LxtWRNBI9SAvPwM1TJ
	JuAVX/vjbr38KRTK5YiheBEvvADvefYxdmY4S6rYATY6NA8V199LuEdP3FEUWKMUKOR5mIio34j
	imwPIxKBu4vcs5HcKzFqxn72X8xPg8kCUS6ZKxcdBX+6HqGv0p5QVoce/rm5w4K4AalEJW5CxUX
	zD7EgUoSeu4J/aJ3iFGyPA+AOR2dvl+z2fQP78NTYQICGgKQDjqfxmwoZaZfwyqTY/cD4vnbazJ
	Raj3EiJ8LNuXUUGy30qoPcjv37OKpoGlwp+aIoQph3/n5wHnwppCsjP4C4t8nooGZ1QRT+E8E35
	bg94UdgvtZQ1nxB+OeBSG6xs3NpgpOOTuPcQWuFHNXTaEdoweA3iS1sdZFBnw2IRpsFXrcQOSSI
	Pn1GcbjUNrnGFmuN4iWQm2/i+TWS6g1DcCsOcfIbUrGGELSu6ygerVfu+R/EUuEidXtr3N72BgR
	/lzzlmKjs3syIX6IPEN4aoD/bH2XDIyiSHc1FsxeGM=
X-Received: by 2002:a17:907:3d4a:b0:c26:22ae:b66b with SMTP id a640c23a62f3a-c31a9fa1d4amr241370966b.15.1791558993759;
        Fri, 09 Oct 2026 08:16:33 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa14f8sm111219166b.53.2026.10.09.08.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 08:16:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 17:16:32 +0200
Message-Id: <DM0ENR5MK476.UJSB8FMRYN50@fairphone.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Val Packett"
 <val@packett.cool>, "Luca Weiss" <luca.weiss@fairphone.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Jianfeng Liu"
 <liujianfeng1994@gmail.com>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] ASoC: qcom: q6apm-lpass-dais: start the graph at
 prepare
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Srinivas Kandagatla" <srini@kernel.org>, "Jorijn van der Graaf"
 <jorijnvdgraaf@catcrafts.net>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>, "Mark Brown" <broonie@kernel.org>,
 "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260705033830.305907-1-jorijnvdgraaf@catcrafts.net>
 <dee62f9f-1df3-4f57-a072-12b0b4b8a1a3@sirena.org.uk>
 <20260708215539.150590-1-jorijnvdgraaf@catcrafts.net>
 <137a9c85-67ab-434b-880b-d9d4efa5bccf@kernel.org>
 <20260710143214.142017-1-jorijnvdgraaf@catcrafts.net>
 <b099f316-0e30-40f6-8e6d-5717d96fce5c@oss.qualcomm.com>
 <20260715211919.49462-1-jorijnvdgraaf@catcrafts.net>
 <2545fdff-7bfc-4897-9185-34c45ee01bdc@kernel.org>
In-Reply-To: <2545fdff-7bfc-4897-9185-34c45ee01bdc@kernel.org>

Hi Srini,

On Thu Jul 23, 2026 at 1:02 AM CEST, Srinivas Kandagatla wrote:
>
>
> On 7/15/26 10:19 PM, Jorijn van der Graaf wrote:
>>=20
>>> This week, I will try to pull some wires out and check that on my
>>> hardware too.
>> That comparison should tell us which side to look at. If your board
>> does drive the bit clock from the vote alone, I am happy to dig on
> sorry for the delay,
> I see same results as yours on my VENTUNO Q board too.
>
> As per DSP team it should work, let me dig bit more and see if I can
> find what it takes to enable it.

Is there any new info about this? This seems to be the last blocker to
upstream Fairphone (Gen. 6) speaker support. Without this patch, the amp
doesn't start up and audio can't play.

Can you suggest a way forward here?

Regards
Luca

>
> --srini
>
>> the milos side; any pointer on what to check next would be welcome.


