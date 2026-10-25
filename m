Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792932817;
	b=yIca5ZG5eJ1wq2tpbHWB4A3V1TtDHaUycBxrbAEc5CizdgzRliJriZeVFLgxXr1pyJje
	 s4fDSK5WfgIeLKzB/KepwNTDGvuvblyZgHlC7snUh2kYHp+PTgzZoSiPfGtX81+ndT3XJ
	 +65KrHxRaJjWRcYhBm11eZJfxYFKj0pyG/bChts7Z+MVcElewSkt9bZRa/nPxviva+UMf
	 2RolK/xefzYYu950/hyHy0NX7wccDmKbrDo9w6OEQgpeXNeI9wxCySypPmtIdAi3GwsD1
	 Wv24+XrAXooDMwhLvO7x8R29qOkGlGP1FDVRKpHQVGUzcET4EF9mmU2jWP9c+kbFRZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792932817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MK0x3nBQPvSgNRrTqRWrccBMM8y8IU0drMw0at/VEos=;
	b=Mzh+M5+fD/36EFnu68/aarUHS9EtY5jbAhFAzpqZqP8f/n9fDw5m5gbyrnDdGX1KeD9r
	 bVkJ+eoRPr1zb5EJboLn3FF62lniun8HYBBn9S12C3i/H5C8t2+Gwrr9VpZyWC5KXiikW
	 3kO/zkTJ1luwdPo8LR1Krv63uw5phuXOJbUGMDpOJUmNXFtlbd7XNUZWaLskvxanaP4M3
	 R1COl5pLFA0zmHnrXXSyAOsKQPvWJCHdBYe7j+x30byrL22X5VCPZwypguBYtkM1hDslo
	 L1OvYvBFUYOcJxzkWNOcAlFWA+e7iPmwwu4Fq2uNBfQpu2NitP2YpRCrbsjjsX3l6Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FBjLaSaD;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FAB606A321
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 12:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4FAB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FBjLaSaD
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a208d93758so24634045e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 05:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792932815; x=1793537615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MK0x3nBQPvSgNRrTqRWrccBMM8y8IU0drMw0at/VEos=;
        b=FBjLaSaDH3fZfQWRluwUMgZreHqpA5e7QVqgiXVE2TBAvUPiYk+tfdCfjqnU4S3IVT
         w4FlAjggUyXYJYQNf4Fn6e4aASunt1Q8VlqmiI/nSVuZTQmcX0oF36lV1a+mEQ3+NBM6
         EWwEjfO++fjR5dR/RLhuUe6X+aK4Dbk0y2i2wtvyOoZgUZbbOH9lqvv/CiLxYl/nlAHt
         51YIVXvgOd2nbXsrgBySQCexfP2tbToiLV11Rvp1uOUX8TUa0gVSQXyZtG9FGN9jc7dh
         DGvFZUbihe/jP2Jchjf0qMxHaLtc2sJAqxPmhUpqZHr/0xQkBognGoyFQxm315GuA5B6
         70hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792932815; x=1793537615;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MK0x3nBQPvSgNRrTqRWrccBMM8y8IU0drMw0at/VEos=;
        b=P7bVQGRYTVdkFGd8VSJvr1vOx9wzpNkXq2woSBSiiAC9guNSNDK/bVdTEGN1g+O8jA
         bckapUmV0cQ0r9Zd5MTfoIsuys8OHP2Dcu6HMeuls1X0IeitFG9paK8Eu16PAeeOlGHE
         E/d4SCi9eLpLbBu9r3sdqkwDJSyh8qADKXmoSVa/1x46a0+XUq3WewyZrLX9Azgi7I2j
         6Y4Ag3vMsyxWJB6FYJsnQgWkcVK9MPggCVXsOujrUU1aFDOKFGyuJCVVaCD5IjmdDGTT
         Rzv4PRMjno10oIz01QNeIQIa11oWdy6rxBQMsj0blkH7JqpwOi6Djj4CGGRhP0DODbIp
         P6bQ==
X-Forwarded-Encrypted: i=1; AKwUvByOYj6ZeIuxt5j1gxEv4aJijzp5qyZqkhnyTuoABncVXUMGSuFuK2zOfl8ky76d0IqstT7+Effibdzuogk5@vger.kernel.org
X-Gm-Message-State: AFq9FYJgvZHM8A1jxmtWpdIoWFC+8x5tbE6adj15NDWAPygKGDyC81E7
	XCzoAT+VPzFr2b5/7i1h49otFdD35bk4Ig9sw0jlyhbgcux+8ejHNN+N
X-Gm-Gg: AYBFou0SpugTakOfrzoQu5YDEIGaGuc3Jylz2gOf9h6EYUnFyPglC9akkl/wTQrM2+a
	SteJwWNNcZRtMDUvCzqxIbE/ySxGkWsTjcb02INlvz+Z+692sht2p9a12ySDkRTjMQN0OAPWXx4
	jOd5Pt0MwH6rnXzPEPxtWt+/Nv+1Gak59cmK8GVjWyqn5v5pUKo6wuMa8eKRdVnE4j99yrkOhq0
	RyQ86uXorG6wrneZt94GEUzbXgqVdFLlFVDL3bjSkE9sGZUbjLpcgn1/GJb5kFyuaqeSjT47lF1
	RMUnxyBM2Pgppy4DWmRSOEiU9TyWYSfNMNAaqwAiHx0rGCt/L2vXt6jlVRDhQ5pArijQsrib6Op
	8Kqzbbko6eiD1oLN5r1e1k5rMyT5K4F5j8ljHE/496stWMjsZgVspeOcd81/sNxRzfDR8AOGVhC
	eisrJetuHnVWjaYvONVclCysXiHc7dbSy9toEoN9Clp1/eRBc+KUYoY1k6OhAXaFmJV+WUjMFsb
	vtQ62TOpHgzDsw6tmlMm4OMyVfPWKmqqlVh6YEJVE1ECHMxVLS4Q9pwXzv34QSyfoHXehJNNHJR
	DpAbe8VEyWAhzeJqjmmVAzYOf42udl3bElVMHaBlb6E4Bad04muJucNLyxWUHgujFKTu
X-Received: by 2002:a05:600c:c110:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4a35ac91142mr63664005e9.7.1792932815147;
        Sun, 25 Oct 2026 05:53:35 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm9792478f8f.16.2026.10.25.05.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:53:34 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Val Packett <val@packett.cool>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: lpass-macro: release macro and dcodec clocks in runtime suspend
Date: Sun, 25 Oct 2026 12:53:33 +0000
Message-ID: <20261025125333.208382-1-ramonjesusmiranda@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f17f962d-22d7-4a88-bdcc-9be6556040f1@packett.cool>
References: <f17f962d-22d7-4a88-bdcc-9be6556040f1@packett.cool>
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

On 10/24/26 Val Packett wrote:
> You're working with a tree that's months out of date! This does not
> apply to linux-next at all.
>
> Commit a5ee3180a2a7 ("ASoC: codecs: lpass-{tx,rx}-macro: switch to PM
> clock framework")

Thanks, you are right: I was on a 7.2-based downstream tree. With the
PM clock framework in all four macros this patch is not needed, so
please consider it withdrawn. I will check against linux-next before
sending anything else, and I will drop the attribution tags.

Ramón
