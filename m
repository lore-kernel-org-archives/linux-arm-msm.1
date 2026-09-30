Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837F62CCC5
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 05:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790747726; cv=pass; b=VN21qyS09gb6ynLHz+K/Wzipd3ICmb5jDqayUuCHuME5PyWIJdrOk56NUwqFhYF5bOyk0Uqh83gyAfS5DNves3xbzuMQ1ETufee24iDbtZWS29kTLwX9Ff9999+FiFwd/J46s8/0Cs3u2pFyfoqwgm8wvziIQX3F5EFJTB381cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790747726; c=relaxed/simple;
	bh=8+ULgEZIWHVVxMrr1CIYY1TqDZ+KOILZsisC6lP8WRo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=iJKZ8zwmCRVRcMD+KRzG050gTgHf5JUpMaJuN5yf8IBRv2YU1aYCdKaTLOz4CqoGcutJBOCyKJ7N+Ha0LFPmYpfTCilIj+/B6rjaJsgjuxA7TdxBozE1s0AjtAme6kslMo6KOayeeqYX84d/1ERtxcty62HRj5iNJBBI+RBQTc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=avcLIF4a; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="avcLIF4a"
Received: from fauth-c2-smtp.messagingengine.com (fauth-c2-smtp.messagingengine.com [204.75.18.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hvkm51Yl3z49PtJ;
	Wed, 30 Sep 2026 08:55:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1790747717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v0WHvqPEy1zCdoeR4zoo3J7a0wQn2OXgPRqA4AplJPY=;
	b=avcLIF4a3x2tVF2wHOPPNeERR8mdS5JnVznY8dwrZSXYj98f0q+4PbyBhxTOTisQRMzP+c
	kiynEAbSnQF9vljBZF3i9hiO09TH/G73BvOlpp4szVuAKW8dPxfYTDCeNV3ClA4gVTfUv2
	xYeiRYYPOn6iLadOV4KUZjtTsBPSBnidhhqGeG75lBvgUKPfKmAw/bvqjNGbsAkvVFi2UA
	EMWHOs1HGIcmciVaiLrK4koDbJGVDdmgALHrq4LMyegcwI0LRM4HO6MpduZd5bDQBDLhCP
	c2fcDIHwu9TeRLx61vm2k8i5gHzLemLi3AG6iIayGK1Jif6FkVDP5cOiKrqTkw==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1790747717;
	b=rDpTStIo4/hidhrF6Z20FIVPXyqohO7g91n7S2dxr5aCafGHSHtNOqqcMywYabLNPWL3xc
	q+1xH9gTf39DqqSKCyA3G/bjREvYJ383V5/BJ6R5xzpIeEea8lZUNkK3KxT7kJulU48eJz
	/pKaz5mbYG2ul8IIK+C2XV1QxlevlzhoovkDpVAz+Nmvp9BOCYocN50rUa+Qhs1C2LGs/9
	XbCyfNXTXXB1G0UnZt7ywRbzoYmoWAKJlBc+Frj/6nD9s0pNkKjLq60GlAijIQydteUycX
	QVej+DXCIC5KrZgLdNZmhlZMrT9oFPEpSXAXYOMjGL5d8iEJeUIA1O491eJ3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1790747717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v0WHvqPEy1zCdoeR4zoo3J7a0wQn2OXgPRqA4AplJPY=;
	b=PGVs6Pw3TO7kyqbuqN/r8R3zVHnddegrdQfbl9823rzDsREOquZJNZQZQ8JMW6KfQlsqwO
	rEdQLEbcbKERGGAYdXPzlBMrlztWUxH6zZELG8TfuXl18k+vUq7aBeor+U4XGO4xkcxNO8
	8dzVOhNEv29qBqGxRvPFV7M1joSufMpoxXDjI714olPPLP5VnzxWnNOqKRxPm2xmsaBHW3
	jcyXL0Wy9sAhwE8zgWeVLo3jD5QRpW76LDv6rYxTTFbP7FaX+DWgRGvK4EntqqvOTnbGZU
	FZPOgvtCvHBXLfEQPIK0nngpMl/CqDrq4xZU/Zre6238+JygntEA8q7TbuX/Mg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id B9DBB198003A;
	Wed, 30 Sep 2026 01:55:16 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Wed, 30 Sep 2026 01:55:16 -0400
X-ME-Sender: <xms:QaS8aq-2dFrxDqeERM4INVMEk-f_Q5DIFHuE-lanC2UGp7EpTfGKfw>
    <xme:QaS8aljWtWZDzrZyRwH80vhYAJh8mmf9gwoLUH9sl5D1-Q4br9l6tiWVFB0TiPGAL
    c7b_8R-gBcvfcq04NFpecTzMmm2WQxvhnxUnniR8hnjOXyLLjD6bmxX>
X-ME-Proxy-Cause: dmFkZTFp4NH+YWpk8RRtOx7/9/eJYhhRF0wfwR+qn9fmA0oEIQrIu+sy7ZWXMsFF9LAvVM
    SzfwpA0Tf+EgBAQ3rHRnsEGdl4HiNVUiyvbIC4JFIhF1rdlZiPSv0L+N5KHe9Oqohxp70I
    ofLhf90YJnnXnyUNgykBjUrru4MOOiGzSHELeoY2UKCrZNeDPRp/0wWt53PTFKf3y6cUd3
    zcNd434ipqiO8/tYVE0McZzgmOXQrmxVTOki7dlgcQ6L66mQSNNlCS+Nmwst3TClrhaDW+
    jnL6bxTvP43a9NQjoQRsLlDqTjAbZmmdddYC1bEepu6oC5ImfqbchtR2bBvdPDUxnLIePg
    t89nxml+h4BBpA7zMiiztQorDh42JLvPo5ob+kM4IBUYS4ixZJO0khvcLOEQFWRThOg97U
    GjNQ1d0hR/hi1AD3FXPrTi0CSpRKReJgHpeSVxCh4AJ+UukwMJf7Glh8Gofd9EU6PMLhML
    /kf4v0ebmNLcaN8KFwZoIHqttW6IcxOmHE6TnPfD9gGes0ONvOyEdK6qkssOTuJ2/fGMbN
    1G9LvVOBGdfV/7Um4zCbSUXfC5jwc1/oVMjBPHGsBAN2aNIJ/nZcaUeo70SVLCHdSOLwm3
    s+SUPfDaQBVm768N7gxb72e0uQBNdIlUvFBJdpmPQPq40UL3UdF4h+Ko3JOQ
X-ME-Proxy: <xmx:RKS8ariZTGfwhc1rJ1dsuaOh-1QRQ5pCVL52yaVPkrRP1T_rflQZBA>
    <xmx:RKS8apV0KrErLbqYgeVLZ4PpgYKuIqDL2mkucfSbYNNXXeYrnyXtRA>
    <xmx:RKS8avuFXN4B4TKRuhud6s4p1pE1mkGZaI2dZAjcHVYIo1-blS3w0g>
    <xmx:RKS8aq815KUJNwDbNDPTXI6eaxznnNTpR0eCkL4jmvRlZfUsCz7OeQ>
    <xmx:RKS8avuy3y9T435MADUjjZwuuVzQ62ieA5fMTiBpPyFnUX44JsOsSs7S>
Feedback-ID: i02414972:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 73D7CF8008F; Wed, 30 Sep 2026 01:55:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0G5p0OZ_htJ
Date: Wed, 30 Sep 2026 08:54:53 +0300
From: "Juha-Matti Tilli" <juha-matti.tilli@iki.fi>
To: "Marcel Holtmann" <marcel@holtmann.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>
Cc: "Deepak Kumar Singh" <deepak.singh@oss.qualcomm.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 "Jeff Johnson" <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, "Bjorn Andersson" <andersson@kernel.org>,
 "Chris Lew" <christopher.lew@oss.qualcomm.com>,
 "Raj Kumar Bhagat" <raj.bhagat@oss.qualcomm.com>,
 "Jeff Hugo" <jeff.hugo@oss.qualcomm.com>
Message-Id: <6e0ed085-07d0-46f0-97dd-b8d942842e1f@app.fastmail.com>
In-Reply-To: <10091679-7567-42C2-B77E-EFD95CEDD649@holtmann.org>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
 <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com>
 <13BFC5B0-77E6-48F2-B857-37686EA1DB2C@holtmann.org>
 <05e539f8-bb7c-4038-8a83-8ab0d1a5b917@app.fastmail.com>
 <m657dtesuagn7vdajsuzjb4mfysf5xabsu3s6n6lujj7yb3z4p@m2e7e3n4zyev>
 <10091679-7567-42C2-B77E-EFD95CEDD649@holtmann.org>
Subject: Re: [PATCH v3 2/4] net: qrtr: Assign unique node id for MHI endpoints
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Sep 29, 2026, at 23:37, Marcel Holtmann wrote:
> >> I'm still willing to submit a new version of that patchset originally by
> >> Denis, if the kernel devs so decide that it's the way. For example, the
> >> "radix tree of radix trees" approach could be replaced with a hash
> >> table.
> >> 
> >> There was also some criticism about a layering violation in storing the
> >> endpoint id to mhi controller. However, maybe that could be reduced by
> >> providing a correct abstraction around it, so that other code doesn't
> >> touch the mhi controller structure directly.
> >> 
> >> Other criticism for that patchset by Denis was its overt complexity.
> >> Yes, it has more lines of code changed.
> >> 
> >> This dual-card setup needs to be handled somehow, either by Denis's
> >> patchset or by Manivannan's patchset.
> >> 
> > 
> > I wish to go ahead with my series as it is simple and tested across the
> > multi-WLAN setups. For concern around exposing the nid to userspace, I'll
> > implement it in next version, thanks!
> 
> actually no. Seems you have no plan on how to address the userspace problem.
> 
> It would be useful to actually review the endpoint_id concept introduced by Denis since it has a userspace facing API. What is your plan? Are you planning to break all existing userspace code?

Well, in defense of Manivannan's patchset it currently works for PCI+AHB
setups better than the last version of that by Denis/Mihai/me (although 
I could easily fix that), and it may be simpler for userspace to
continue using nid than having to bind to an endpoint, which requires
more changes in userspace code.

The userspace just needs to know the nid.

BR, Juha-Matti
