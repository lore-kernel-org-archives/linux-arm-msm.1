Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751712;
	b=MBMER/Bha0pSrqljaaaOeR45KV22VjT+OGUrSRYcv4OljwdlmkA1KaB/ga6Q0SvMjJkJ
	 lL2SxTMubcdkmeqTMXf+qicfpxC61rvS0FrnKnx0S5bkAaJ8suyrOcW3hUgYf7aJ7nCrO
	 w1z4y/kL9t0P6L/XI5dcv8pOB6MK3M5t7+/ZzllpyfF0ljk/r0ptJdVlDMURgEm4mMm+z
	 mTPOUtvKmq3uUz7CnbCQE3bTjH6RjbxY336rFKAq3SdwcvW6z/MImkqGuRTJ+MxDefea1
	 DFIXu/MEHGlEMuH8VSFsc9JXhGofe2RqWpQZmVpnFAQWH7twoKxo6TJWSRAeLvf0Zdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zheX+XNXZRQsqnxaQohoj/DUJpNDERXKGAb12Po/cyU=;
	b=eqxEejOyiJHVifJZR6lrMBtUAWckwZMsEtBykQMHdPXVUJUUFz0FBQyVNekNrCsSpWKA
	 G9k1DbE6/szCsa7U/De5wSm3oAphTnCdCaXOgCygWMxT54EG5d6ZQj6Mk5QNeY7oeoml/
	 0PnnYk/rpQQ7XhyhTzHheUnoTZJpH9Vnqp+r2R9gN5Ac4yh7LJFvhsu2R1pcMgzh9+UMv
	 AhDg6AX2ozFa/BlREzPpHdFGwo5axO6Fq9C3M89KuDmfZQB8H/bEF1JQbiFkqd9XRI76Y
	 2Kf6GQcYQxboMfhqiA44O64hLWA3y5Usya7zUx2AI3CdGLCHMc6/zqm+tGrOQisevjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jbPi0Iw1;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9149606A327
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9149606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jbPi0Iw1
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e0d1da913so538610f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792751709; x=1793356509; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zheX+XNXZRQsqnxaQohoj/DUJpNDERXKGAb12Po/cyU=;
        b=jbPi0Iw1aJHhHQpSTnENb6ntTeL9VEqxE8JllgVE/SMQ4nuhMEkh4zx+11VIoWuI52
         3BTFTNVDysE3hsDjdcIrC2ce8jd/csL8SC+1aeLIcZ4+eSLFIFvrX+y5gPvk7HMT/0WE
         PotStsJWLKnX+8JwsooEHCrpzu7Bh8L3dLMVoaomEU8ipIABlUPyrfGIiCyitROzINV6
         tr/iMvmyjZLrdv3eXDH+ialHhWtIkgGin+FPLUt+s1udrl42teOU7mHymHjLD+ZvNvUK
         3f71xIKR6b70XQGlVcDFXYqOWG6/XUWAC1yzb7s1B6MsYziJ36L/8EZMWbiWtQ6sFS37
         MXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751709; x=1793356509;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zheX+XNXZRQsqnxaQohoj/DUJpNDERXKGAb12Po/cyU=;
        b=Yg4QJ1ndWZXNnoTNBUg5DV+a0/HMd3XstqiiYctARsxuQUELYjWR+75kfaHKHyDQzK
         lUqR3BCLVUt4KeZsGZGcoI99nA2ngMp1OeENEo0CBqtw1AemgAYwHj/VZtemPE8suONV
         kWLs+sBl6fjoKdktvxTKs8lXr2qQdePc36Xhl3RdzVUb0U2BnLpkRwI14j7cfvhkEVdq
         47f0mPKqTz99tpd4tN1igDHqvr8nuiOKrHZCQ8eTpWAFBet4CXp6itW/Jr/gkIBMfp7S
         ezB1yqaw+U7NPZdphl+2cKrvJVMGfQZpFvdYfXGXj4pPgH68mnv+3fWupxJBhivpBvR0
         BS5g==
X-Forwarded-Encrypted: i=1; AKwUvByesaxsPQYyBVe2kKRCDRIsLUoAB8QQ72KNqDf2pCgzyNsKM3eiIq4PiywQn37Mr1cNdI7nmS/iZfBpH3lz@vger.kernel.org
X-Gm-Message-State: AFq9FYLSLBvNcOoLq2kuOMG2WKt15A9FzpNF0Va0IHScYhhaAO2qv+8x
	lo8WS3Wt0V1/NNZN2OHjieeAHV1wsJ50qC/75N5DuNpnYa4+3hMAlYM8eSYCo/fLgQI=
X-Gm-Gg: AYBFou3Bm417SrzEzQW63ocrI4LB7f+DbZ3U4XblCxKBBNTvh8us0PP8a+OwNRShdN0
	rIaZrWQcm6kZUn3AUazZ+xzuiy9xKBKsQJyYVNz/XGRTUKoZ3KRTAErqvOwDmTxCCaDOOgEcMDT
	PShgGfqMlF499/A4sfEvSeZtxGeQhW3meUGfD+Ove7S/NMLpvdUdMMd47uiCuYUlKFn5yUSvJZr
	JXh/I+KXW+UOBdQU+zb9FG7rH7cdagC0TpLqZl9wogyi7a9v2LOL1RtYmnergo/CPDG5OWafNUM
	MOEZfjjAcCdg+zJGI1L6k9iqoMUElo0s+7eRvcTcR2Cm2DL3yTHpBPsxF/j0bImNJy6POIGv4A7
	+KAifio1bGzeQuv1Frt5wKBqgLnWJpK4WHzAP9zkwrlYZgQ5ioqSb8tn+YC1KOtQ5DR950ip6SS
	xZI0/4myqBIrALopl0LlObXVGitgzU3qdX7yiasuIyNeLlbQYLZdOfRFwOUJZLwminO0gekXO5i
	5J/5rT2voHgtI9eGH8eGfYLdk4lvtI+ZvXbA0QDM0s/JijmaXdwOEmMWrdenie/8OWhMDLc6E8=
X-Received: by 2002:a05:6000:4713:b0:488:8566:9986 with SMTP id ffacd0b85a97d-48e2d0ff5ddmr10532774f8f.2.1792751709131;
        Fri, 23 Oct 2026 03:35:09 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edef81sm4665234f8f.5.2026.10.23.03.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:35:08 -0700 (PDT)
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
Subject: Re: [RFC PATCH 00/16] Centralize the ownership of power rail votes
 for Qualcomm clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:35:03 +0200
Message-Id: <179275170360.4070168.15401690927522463377.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2455; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ib/lADe6pfUlXtQQRTg/Q6ldBcUGQ6EizR7YFWwG8S0=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm3LaKslnNIt9+eW5eVWGnBkLVM2WF645Ynpy6/Ti37q
 Cmld9qwo5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABM5ysPw3yPFaaeKL2ODTfM7
 2y2CDQfkp32sXXf4y0xfpxPLPxg2qjIyfO2Yq5Icx6SspT1v0g6hZtY2f8FY5fvTF0oU3Nu7dct
 CNgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> On Qualcomm SoCs, both the PLLs and other types of clocks alike require
> specific voltage rail levels to operate in-spec, but through the
> separation and decentralization of clock and voltage votes, these
> requirements are often not met and are never explicitly stated.
> This results in clocks being undervolted, or at the very least a state
> we're unable to reason about.
> 
> The devices consuming these clocks very rarely have their own
> requirements in that regard. (1)
> 
> This series moves the frequency-power_domain-perf_state mappings inside
> the clock drivers, ensuring a single, trusted source of truth is
> established and that the silicon is no longer driven at out-of-spec
> conditions.
> 
> To illustrate the nuances involved, here's a couple examples of hidden
> dependencies, as found on SM8650:
> * video_cc_mvs0_clk requires LOW_SVS to run at 900 MHz, but the
>   PLL it sources the signal from requires SVS (higher corner) to
>   produce that frequency. Similarly, to produce 1140 MHz, the clock
>   requires SVS, but the PLL then requires SVS_L1.
>   Analogous story for mvs1_clk.
> * gpu_cc_gmu_clk requires MX to be at SVS to output 625 MHz, the PLL
>   requires SVS_L1 to produce that frequency.
> * A number of camera clocks follow the same pattern.
> * Additionally, some clocks like cam_cc_cci_{0,1,2}_clk require
>   MMCX to run at LOW_SVS, but the PLL has the additional requirement
>   of keeping MXC (a wholly different rail) at SVS_L1.
> 
> There's a broad agreement that a consumer should only have to care
> about the clock it consumes, and that configuring its parents is the
> responsibility of the CCF. Requiring the consumers to care about the
> above cases (as is the expectation today) is a clear violation of
> that contract.

This is a fairly bold statement. Yes, the CCF's task is to make it as
easy as possible for a consumer to enable, disable and set the rate of
a clock, and I agree a consumer should not have to know what the
parents of its clock need.

That does not make the framework responsible for it. Taken that far,
the CCF would become a de facto platform coordinator, which it is not
meant to be. The clock driver knows what its clocks need; the framework
should give it the hooks to act at the right time, and stop there.

When coordination is needed across devices, there are dedicated
frameworks for it, like OPP and genpd.

-- 
Jerome

