Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.68.154.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795069218;
	b=K+BcvZP7in53e/WX8d5b+Lo4j9vE/KLliLFPsaT0JKbeI/4odza3zB+lx+KFqr8bmACj
	 eJvBwFtJMlVCfKgytloJYpV6tEdO2je0FjNxeRJZn+wYZrzUJhm7Xvgbe82Lu8sSUlOi7
	 +kB/wzg7NWngWqXnn2ICCEVw1b9+yNnLqGpYhSa5V9kzPeAynWkE5Dx7+VItsp4eQ4i0u
	 sya5ZcOTmKCAqiLTg6C+r+RSXsCfEipoFw1NX26c4vAw6OykyD+W7zkjw1P5pvM1jjomn
	 MwbDHhXwqJkUPORDowviTCD0DSDVHnAgYJ3kFru6kACwm0Z9s8bteAif7DX/2J3YKWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795069218;
	h=DMARC-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=vJhhUK2qeCwHwcuSsVyrimotDOPw1sQMAeLglbbQQzg=;
	b=mvMUWA0dK1nFM5C60YkHQ9AR4bkxy/1iMSa5yzyOMFA0pHysl0ynkGzSgDOkTY8TmaKp
	 yDk+JEk7Ytk5ySfzXODy40FNN3kAP0tLsHDMfsZhMX9D9yvWI+mtsAKYIRptm2YStisIE
	 C92LenahmDFEyXiiEp7KIBLWeCujeoLaol4MbEJnJJD0VO71vrz0d4yg8vTqxmWGE9UBe
	 tJhrNf2+MYkk5smbQWHrLeqa4dTxEC8Kq+6QRPdo48rnAYd/mCWAp1kE38uvLbRifi7De
	 0RCQMEf2U1CL4TJ9SnPvp2Jsc9wmkW7ldaEXjpG7I3xT71eFq89COT7yVpRgbMM55cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fromdisposition.org;
	spf=pass smtp.mailfrom=fromdisposition.org;
	dkim=pass header.d=fromdisposition.org header.i=@fromdisposition.org header.a=rsa-sha256 header.s=mail header.b=oKvRxX2e;
	arc=none smtp.remote-ip=51.68.154.128
Received: from 4do.net (4do.net [51.68.154.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916A3606A32C;
	Thu, 19 Nov 2026 06:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 916A3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fromdisposition.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromdisposition.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fromdisposition.org header.i=@fromdisposition.org header.a=rsa-sha256 header.s=mail header.b=oKvRxX2e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fromdisposition.org;
	s=mail; t=1795069209;
	bh=vJhhUK2qeCwHwcuSsVyrimotDOPw1sQMAeLglbbQQzg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oKvRxX2eo4Zr/C6fyFqHG8jmF5ric74WFGJ7zMaA/uceIZ5wPFrHp1LKlAdiHozTy
	 Iph9SLiNwgTWmYssfOgs+d6/DMsiFzCm+ZUySYGqMZ6OjMAue3eMeNtOYAnTO3iaSq
	 EgNj2l7BJvFuV+mDV7eMh6Pw5WI3X9IMlDpZJts4KCFKKLvxh4sMkm+Hi8Sqh1HGzx
	 7hPxAOgegh1AKMet+fgKkHNNduQyl9adtlRWeCtKh7q/EgKRoUxSmlReY+4HnMs1KP
	 e6CTkrLJFPI6zlUH2/U35S/7wcmx/29o64HMJjQ1vEe1CO4gZ7NucgzIO8a22jajIQ
	 hkM9/rralkbFQ==
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 06:20:09 +0000
From: Demeter Barna <me@fromdisposition.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT 7/8] drm/msm/a6xx: Add IFPC tables for Adreno 650
 family
In-Reply-To: <20261030-topic-a6xx_ifpc-v1-7-6992841a9a32@oss.qualcomm.com>
References: <20261030-topic-a6xx_ifpc-v1-0-6992841a9a32@oss.qualcomm.com>
 <20261030-topic-a6xx_ifpc-v1-7-6992841a9a32@oss.qualcomm.com>
Message-ID: <bf7ecfd7ca2da3ba64c0222c52f750a9@fromdisposition.org>
X-Sender: me@fromdisposition.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-10-30 10:04, Konrad Dybcio wrote:
> Fill out the register tables to enable IFPC on these SKUs.

Hi Konrad,

Tested on an A660 (SM8350): the ifpc counter goes up and there are no
GMU errors. With the GPU held at 900 MHz under a light 60 fps load, the
device draws about 0.3 W less on battery than with IFPC blocked.

Tested-by: Demeter Barna <me@fromdisposition.org> # A660 (SM8350)
