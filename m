Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C18748CD43
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168133; cv=none; b=mtzTAr1g/cem2OzBnDcffD7ugPJyhdYG/os1GL83K6TWooh3qybWyEeluWLWt8B/q2eOi6btcnCisOVb+LsElplToMWnXLxys4ruP6Zl7ty2ZL4lFcC5XGuT7Zx972z10DZC9ASE90L54hDjDjmCTXc/FVlD/yfoCH+TmMIPL0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168133; c=relaxed/simple;
	bh=Lwt36zS62yRZ6vCK1BD8pkNCQA1zr2fjHFHmb2IlsjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GePgIXtyfiNhft24dNoJdew1FDjfZg9QV8bZK40gM+rdpbs/1l1QgG0GeSb4tKqq26SKvJhIe2VP4onMhyb13XFjhncFewRDaB8qzTQKEIRYUkWNc3G30LawwKKC5mi7gl3aSF7S2EHCDbjDI76Rcxr7gBhkIOezkJKuuTn1o0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=h7zZjekR; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="h7zZjekR"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so4336935e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790168129; x=1790772929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lwt36zS62yRZ6vCK1BD8pkNCQA1zr2fjHFHmb2IlsjU=;
        b=h7zZjekRjKB/fNX58WS4XfFDDb6hb1VDFk44Tlxf8gihKEmKcpux0r7+lhnUwvpLUf
         TwAr7yvPhCYFZc0pczYfGfi1ZXJ0nhI39D7RG1XsUjSDZauVO96D/YfRvEEaD7qQkmCg
         harhPAUGHcVPJZbmHeOjgN/D4Q/PBqiQ51UlfKPQochFUsDz77Sb2MRzYmuTint//9UM
         pIXb4sBog3tjkkwdLcRKpsC5bAu0DKAKzkRMnMkogTdBAhRaZaVkXxh6bfZWba1oQhXo
         KmapCqmvmrepxiXF44Kpuk8+wV+xvlh+Nms/vGeOgbNRqpgr+Ape2IxAW98JoggMeg13
         xQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168129; x=1790772929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lwt36zS62yRZ6vCK1BD8pkNCQA1zr2fjHFHmb2IlsjU=;
        b=U9ISZJWDmeIx4M9yWusXEGeobepaaU2rqCSzNaI8UfRDsgP8nhsTpE8kKcKMqqIjPm
         Wf5qpOr0vaIumFY5PVOdGxUFamy3dZY6hH+VXVSML8BSCi8FDawGO7hvNlXo9EbV2XAG
         MwBGJT/Ui+SWkyix4nfpkFpW84856UDDMvV034i44K8CRBNT+5rhC+XJvQsgythIa2NH
         u3/quVnXAmJ1AjCIpVmgQO2/b3QF1vbXdRcvAPMoweb3XKs7fUGDXF/B3eqPw9mOuiqS
         xMICQvSwxS/RO6vNz7VAE03YiOPqfHUerpkU1njmmbpeinEa0EEhPRclZ5BIlxL6XCib
         UvPw==
X-Forwarded-Encrypted: i=1; AKwUvBwh40UzsKI8BLnzoMRplWp2I1n12SOJCy/XX8hvXBbzPBfgOp00+FicpZXccyTT4JY9M8lAJ+xSS/AFbFaY@vger.kernel.org
X-Gm-Message-State: AFuF++mzxhkl74q6gHbpiDm94RCXW64ih3OBw8gC9zq4n8MRHmPV+up/
	+N+lzQROljMuOPMeu1nDoz42GvZWDCkSdV4HgApBGmVqcw4hM/kqH/V+Ib6dcOcn9/k=
X-Gm-Gg: AYBFou2ctEyVJobsbat+ccQ7Lu8lVAI1dO+SYqqLlxQUJHcKLhT2L8/7oFVxFHi4VJ6
	mEueEqW+zgua9FAsCBgI4WrL1iE9V1Q7mCR5qqE0/PYKOmc1eHzpLnSw8YqXVZRTggQhHw4OGro
	Bm5aJP2We3gIDAVFUD9IZAZ2J1SFDChRSF7Vj7NsvtWD9OqvXVo6y2TQNb+GufmICAAKqRc82iw
	C81FpadcU7I2Pbkh740c2CTqeeMJqTxs7WC3JYZ8BVz9HClbIjY2Qp5DCOPm+/7UHqgKdVfWKQa
	P6/+/p5/TGiJnnyahOGMrEASoHUDK3kcOAJfjDVRSSMofYAJGffLKJ0W/NLqg6p9c2plFVz8sph
	cbjvmjiD1VLRdiYcgSGrbGCOSSFNNvT30tyOkuvC73J8Oid0Msp9d9jf0HvXSqHrpP7+FQRrLXE
	jnjW9WX4rh/wd10TGXvldNQzltm1bDAEE1a1fthrZjncYoStwXbL95sl/rbkEGIBWaTzJVyxjnC
	VxLF0bJbvCn5WTzfJNYXQW85s2lRPquIK8jpgHVocw+o5w8zaWX+y4mje5R
X-Received: by 2002:a05:600c:4505:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-49fdf1578a7mr31453415e9.32.1790168128729;
        Wed, 23 Sep 2026 05:55:28 -0700 (PDT)
Received: from localhost (p200300f65f19a9046bef90cd97470407.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6bef:90cd:9747:407])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fde1c159esm84444015e9.4.2026.09.23.05.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:55:27 -0700 (PDT)
Date: Wed, 23 Sep 2026 14:55:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <arPMAXs4jjUeu1DE@monoceros>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
 <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
 <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p23qdzzba3kphtno"
Content-Disposition: inline
In-Reply-To: <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>


--p23qdzzba3kphtno
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
MIME-Version: 1.0

On Wed, Sep 23, 2026 at 01:01:44PM +0100, Sudeep Holla wrote:
> If Uwe is fine, yes I can take v7 as is.

Fine for me.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

The nice thing is that the device_id structs are not API, so this can
also be addressed later if someone comes up with a clever idea how to
implement it.

Best regards
Uwe

--p23qdzzba3kphtno
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqzzDsACgkQj4D7WH0S
/k6svggAp6Jdfc+Xv2nUfAqFVfbCWZPZ88qKW1qMOteW0gWpuiaNHYYP2davG6FM
Wm9f4BcMIVB5SEWCvqqMT+zvwMxy8614yA4/sd756UX1mJZDA/nvw8+ZkMPnkXNa
IBp2GTVwH1XF7O91KL9nZCsC52taJ7wE2yrBojLRNEB/+KIw164n7lbXO3XrBIoE
h0QLxyatblxOchoALTVDIFb9u664jBtlTFzDKepLyyGaeHbSBk+RJ8Uz/v8ls3Kd
3fFPADN4IEJAnHIDOCExNdpreKhCW/1aRhZf5YZJX300ZH3x59s8UKvsg2iYEzm6
BGRNNyDjN4kR+bqzxKfXqWs9TXUpFg==
=Uvoh
-----END PGP SIGNATURE-----

--p23qdzzba3kphtno--
