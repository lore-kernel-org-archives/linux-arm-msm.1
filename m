Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.227.133
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793877098;
	b=V4FthpOmuIkcmv3FN0xVYk4quUYKY6E62HfEAUTLpikP3ZFJilNLn0j26pD0dxd1lpNe
	 eVtQu0UBe5l3VnjeQdC4JjyJXoIcZSinZ+Mgww0f4Ig/Bi2gdeW3VwV7hXi+uGA7T/bnW
	 bvxHJRmkqhD2RpBBQDAWmBz9POeJG72AeMj3oua94b7AeuSHC2Db70vD+XZ0OeTJXT1z5
	 JZQgi/1oMAC9/n0inQX5DvE65GYShMv/PK/SHJVU0FbH3iOuv+ds/pq0Ra7CZaKteoRDI
	 uA2xL5oFzWBWHQ1OY6X76ISlnUYh3ZcyChfZNiSqdVPaumcua3ieBvGzIfwzB4iKdsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XuSFZPqiwo0/+iUG4wYz7aJW1g1w6mQvKfCSFgzt1nw=;
	b=XG8aX2+Hss0d+PE87HEYlFbTqBQrNSNSxOoR0aY/epWWVsV4+flN6udLkwFRvlkzyMIH
	 mViVSs2LK8dd2suhHCqo27Lmbukv/p7VyyzyaT1mK9WdZzeumIfrGUlQlga4L1/gou0Lc
	 D2CnZmpH3s9Dp7zh3Ip8JxmoVtsPSI5hpbHgZlfLzpTJmJYaPcDpPB6k0SPfTFkMfATmN
	 lsg8jD0U/RcPTZWuQ3Ge0UMx223SCvlFjam/UyO1NEd0gRLgLcixokT7QBW2WQ1+7Xf5m
	 QzFCyuV9Fx23oSjWn8cRo7uoe2+z+GryLMaKWlNADLWzbz/gIAIV+m6OjQYSj3my98A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCJHKpGU;
	arc=fail smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FE5606A33C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 11:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09FE5606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCJHKpGU
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2e7c8213b09so6493695ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 03:11:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793877097; cv=none;
        d=google.com; s=arc-20260327;
        b=Pk7VoJN09MVnDOf5Noj9eCXECih2oKlCBlBadNKk42FGhwMFXIiupIrBfKYot3QpCu
         AzbnU26/Gifb5051Ayn0Gt/nXwqeqaCidrvKO4ERZVZVKrhCPaSfGmE+YP+2gLJpziTE
         KXRSiMxPi0uNllzPh9NtHiVjoGuFlTfQbhYCykoDXC5r+SbUIeUOyjdVXJy1UFzqe1o3
         3oKgVdLQtHoJQ/Yx5ei+c1/dFvekWTSQ7EUtu7INJJUT4WbFYfkOH9n7uYs4mt/vPqii
         Fq4bSXcl8s0F6JCWgjRPlqRVpz+TkcLLKI44lx7BWrjcS17LPVv0HuPBVWHyPbjaM8R9
         Y3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XuSFZPqiwo0/+iUG4wYz7aJW1g1w6mQvKfCSFgzt1nw=;
        fh=tH7YC9qQIOpBp99zxMbbN6pKwAlk5z9eZumE+H/t0YA=;
        b=NTzftnDirIroCMMqwaXN0Bv0ynxcRpGQ+XfL47kSQcx8wqq6y3+GoKE9Y8cFVHOFEk
         lLtciawwjaYdy6/99e5ll0OR5wg7z/bp3pa6Dz+Wjfq4MQ0EEaU4537AWz92wEiocFpb
         taagl0eklUaDg+2+uztD2jg+F8oxZlfBFaWcaQR0I1yUFnMLhl8gI8AKCTo9VW8TFYrF
         trhoU69nO2cyYVV1vTSnGvkqHrlLOvyKb/CUwhVal0GIWVlrOP3OcQVnQZ/UI8VESXX6
         C+6sZiWMCGgzc7rgQYcAy81Is/LLGxoaTR9QYXd4a/4dH5ORiTWvlfd7YWWqnixqtJ69
         JIbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793877097; x=1794481897; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XuSFZPqiwo0/+iUG4wYz7aJW1g1w6mQvKfCSFgzt1nw=;
        b=xCJHKpGUq7uzZhoQ74QyaADEcbOAnTn6kZVHVUMQQjBb41VKKpimkEb2TmR1fjgl3r
         s9eYFKxwfoGMN6yrGs7ZuT+oBN6HNA2n5EaP4pUGcfKjSh5pI0S1jllEaiMar8v/40Zb
         wZ5WRM6oKOTA6KlZFC05vsGytferTk+vVQ4u0R+lyo/nvZkH42SsIdR7mW+fzVN9IKZU
         w/Jt+eF6/yyPr5W4NBKk8TGb2JUMOu/GrM+791mRV+XDmJ98gnbjThKYcPS08UeHNSNj
         iOiAJR5dH4MnNhcvcO+rxiw0jV/PiX0acPFVoMGTzdRM8L0/Esjv/B7j0nY9EivpJKYb
         d/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877097; x=1794481897;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XuSFZPqiwo0/+iUG4wYz7aJW1g1w6mQvKfCSFgzt1nw=;
        b=0lR5+6GZZLv/yix6zRrxY0QW6ifxj5nlQgZ4C2/bt/H3MV/1ILB+e2KU/oFwW720CY
         08ujGgLPl+PV9PhghhEzPkbDSguzFtupWE4AJhYT6UCNDpzCiIRTANDg9PbzzyjF5Ers
         sCvXT1GAL1VouDbduuf9BJaU2e5mvj/bsQrwJDL00WHODK9tXk4ue3aAH0EzADUAGneG
         yTMyR/HGatqI8wVhkEJ6VsPge2+pdZ8+FhNqL0tveJ4wX2j8vchGVFjSGlGQfBlJbi4v
         +pLWthIUFzLvdJi3V3NWjqJX6CQIZFM+x58W5LVRfCmyoE8fNQmmzrVwFaxDmREKfT2o
         BFGw==
X-Forwarded-Encrypted: i=1; AKwUvBxGUGaG6GfzufbjSg7/NTISAoyAmPu2+HQYE8GimPcrGwNckCZOwrKX+WlROtj6wxTeT1tozSAi5rb/Z8Cn@vger.kernel.org
X-Gm-Message-State: APuU4Z94AFB2Ik4eBwLPQuftWbLs3wSzr+rR8PhhFEp0ATU9aKTxt3jz
	HDQ500LhCEW4/R7wz2pV2HGHOvoJemFSdQVfz6trnNyKvppHDdg6nmeCTkw0kxxfvt0f3XFPVVE
	1Ij7I9C6m5uBWfQfoutmk4GnR+Ate/w==
X-Gm-Gg: AYBFou0JFUXFky58++moq7tTMAKjt44DJEdIQLhEX4Xk8U1+sx/x3ri+OhkfKGFSAHx
	KV8+6wJfzv9dxYKpbwBMUlZXP0ri97sN2GOLsRxga7ggE3Io2R06/eu5GRJSL0H5ljGiayaW7vi
	l/+PDrv3+pxMTscx7Hz2E8oDc11/nD8ldYwR/1GiebItcVsaCqqub1ty3JWINhWf9778Pu2vreo
	vNhv6wt3mJkZEeZTDqfbCYTnjnsOrvb2YM68proKOWW/HOdctCn9dBdcoog/dtYzggq+hB6Borv
	1x/wJM8sDCNJTg6YT64tLHqyv7al1TcxXJdB7dCtxauYi3e7FZd/EY+v7AB5wLYCwSuPn4LARiy
	3TSDSxf97uDt4n11F3gtxBhAoxfB8TDIU4S6h
X-Received: by 2002:a17:903:3205:b0:2e9:5714:608b with SMTP id
 d9443c01a7336-2eb364b11ffmr186637435ad.34.1793877097307; Thu, 05 Nov 2026
 03:11:37 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-m52xq-dts-v1-0-b198f02912ff@gmail.com>
 <20261104-m52xq-dts-v1-2-b198f02912ff@gmail.com> <b2498fed-5420-44a3-a215-02438b623ef6@oss.qualcomm.com>
In-Reply-To: <b2498fed-5420-44a3-a215-02438b623ef6@oss.qualcomm.com>
From: Asdlerto Korry <korryasdlerto@gmail.com>
Date: Thu, 5 Nov 2026 13:11:25 +0200
X-Gm-Features: AclHuK_K1rA2ODQYQXEgmmGIBBNJicth9b7WPHwdpfBELTwGQmOcDjIv1-lq_Vc
Message-ID: <CAARotkeDeZAY-rxXApYE0qs_-kYEvLX8e9UjjtEVFH83Q+ogKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7325: Add Samsung Galaxy M52 5G
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 11/5/26 10:10 AM, Konrad Dybcio wrote:
> Drop the reg and unit address (numbers after the @ sign), since you
> have a memory-region handle

Will do in v2.

> > + /* NFC chip power, switched by TLMM 42 (no consumer property in the binding) */
>
> Please fix the binding

Will do: v2 adds a pvdd-supply to samsung,s3fwrn5 and makes the driver
enable it, so the regulator no longer needs regulator-always-on.

> No superspeed / displayport?

No, the Type-C port of the M52 is USB 2.0 only. The vendor DT limits
the DWC3 to high-speed as well, and I tested it: with the QMP combo PHY
enabled and the orientation switch wired up, a USB 3 stick still
enumerates at 480 Mbit/s in both plug orientations. There is no DP alt
mode on this phone either.

Thanks for the review!
