Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554421;
	b=cwfHnrUSohROY5vAQncwZe4rwZxMCg0o4RG1DwrS9qwHxVlMnb13+NkNVicgZpJbcp2F
	 +NfffDjQYnPiXkmuaeZH8Q99tk8fpA3tKri5fgFtICzhp9m04hyWV/B1/n0GtCrSI26M3
	 6bOSeKZJ5GuTx6n//kf4ADlxNcVWhROqsYpH/4R1mGaYjuxkVcFaJxuQ29FpTGT6INmKr
	 hj5KKQIOQ99DnYpZsneQl2YVO6fR0KRmRDTEhHtL8CJ/ogthyn3N/gRXFQnC5OcMk1fAU
	 kFfQWxijqR81sT3JCsvbv+ReEmiTPbu8hT7b7XpVpaT2dzP6LIbGGGCZ3AevuQ5QEYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554421;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=Nd5egijEuHz5k6HgmAWO5z6p4hohcvBntFn8OJY2//Q=;
	b=lIHAO3WqyGIkBvGLLJ1lvo3iLPhnli4xfdMxPHVjNbArNyUCmnijusvb5o/NfSbpJRWb
	 5vcakboYVfPXgHKpbqxeDQGIEo6pQAJoiuvu9nqCmYiMSO+pZDutXEDxiYe8xcePpjI/1
	 ySRBWpqHvhAe/fHW8Bp0jxumJqRuAgwSq6L8GQlS4JTd5AQc8qjYnGHy/FyDf2Q1/Msqd
	 ESA7IhsIKNjx2lrOzuGyyZ9w9S6g1TCj7LjE4E5RZ/gXvzq+fkFRAnCddOlyaxv75dqrl
	 OxtjfBnnl4RoFlwOUks9bwJhl2WWwYqWePv2Zib6PEIZPT8Iq0VJ+tVP2E3XxDtlCmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7vtpqVy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FC8606A331;
	Tue, 24 Nov 2026 21:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7vtpqVy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7811F000D3;
	Tue, 24 Nov 2026 21:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795554421;
	bh=Nd5egijEuHz5k6HgmAWO5z6p4hohcvBntFn8OJY2//Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Z7vtpqVyyo/dFzvja2YnEQxHbyLFVI3oQN9yr4zNY4f13a0Qxd2pS/Z5hnLijffs/
	 rWzoRekV25ghHhCo62NvBhLDImrvb4bPNiLg0DfWgo/8RP/cP+3CFfcRXYKjk1/K2C
	 D6ZBAjSrIxsyykzzDBRx/QiZi+KDdsAhCWsg5njK0b8lHrfKS+9Ki1wAOxiHEPtoUo
	 WGA+ftaUeSP+qzvekl63XYEsd1Vo9ewNTRACqAEt/ZxvMY77PsnONF1g6hv2VMr8yB
	 +iw5n2A99LeU3zQdvvCQ9HqcnKKeybs47WYzer1NSXUGXvE7q+Aper4N3lf7qXCpZP
	 eB+aIg9zmiH9g==
From: Srinivas Kandagatla <srini@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 quic_bkumar@quicinc.com, quic_chennak@quicinc.com
In-Reply-To: <20261117-interrupted-invoke-v4-v4-0-2320a8a7eda2@oss.qualcomm.com>
References: <20261117-interrupted-invoke-v4-v4-0-2320a8a7eda2@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/3] misc: fastrpc: fix context leak and hang on
 signal-interrupted invoke
Message-Id: <179555441922.417176.5407939769432502204.b4-ty@kernel.org>
Date: Tue, 24 Nov 2026 21:06:59 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 17 Nov 2026 15:09:44 +0530, Anandu Krishnan E wrote:
> This series fixes a context leak and DSP hang that occur when a
> fastrpc invoke syscall is interrupted by a signal (patch 3), plus two
> independent, pre-existing bugs the refcounting audit for that fix
> surfaced along the way (patches 1 and 2).
> 
> 

Applied, thanks!

[1/3] misc: fastrpc: remove dead context drain in fastrpc_user_free()
      commit: 78455fa9f022722f5c743e30a7a80131cd204310
[2/3] misc: fastrpc: drop the DSP-response reference on channel removal
      commit: c9c16d1d15038703c08cc56330cb5e506773f320
[3/3] misc: fastrpc: fix context leak and hang on signal-interrupted invoke
      commit: 3f645f6884b5c753eea253cab37521a432c69105

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

