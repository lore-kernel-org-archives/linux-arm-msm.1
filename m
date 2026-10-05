Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEB8429037
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 12:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203709; cv=none; b=gyDntLiZEWWvyjBiDw0+uoeIBVH/b/KGYS2s8C7OsRzbXs7eiD6xDcvfYiBwnhaVlraGkRXZHvR1iA2Df0qDbzDmIV3G7hXpjPOvtO0YN75OoR2IsCXyIDaRpNZCHo2+HGbRg/BrC1beBQfoG8g1l6aMen1FVLz1NPUxDyUy5jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203709; c=relaxed/simple;
	bh=GjpLzScGvDT5+IF4EJ/jQV9Td5tyjYNGeOCPSv5ZJso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWV+rcK+stFk/wyL8O1ejGH60HhTX9+lTlgNDY5cHSB+ljt7nruX7x4IVyV0r+QT50QD+jc/RekUfjV9aFwsgtvBXdSneS0+Wqp+FicfkDXxYFcgKIlwF7UVKGgFU8pL2M1zaGvAylxHeyI9HdPS0jQG4/bk8Br7q/ew8douKVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rqp/7dV8; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rqp/7dV8"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b0fc598f8so1019588f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 05:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791203706; x=1791808506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MtOkhtouXdYxuMzn6oEg118/G/+iHWMuCiEVkeqGr/E=;
        b=Rqp/7dV8d/rrMhrJ6MAiBPt8bmYPA9b4U84tQb0OA+Cmvwhcby5ZW5eMQVA33N/4X2
         aZvODjWnRc+dX7YZQ0Ji1P5XBacQMTnGQR5FBTvkHXYSBfE64m9j0t+Hc/hM5zpOIUuu
         3dWeHXbCMYeQv6C8mK0zvdYfsZof1L8+eLOaDa4Fq6pBv6IbBUDOiG7fCT8vXz6pGUAR
         AZ+2CkyZzwJoH/Gq+OU0f5LhsHEgJ2s8eCqTUuYx+BUUxJGEPkURJRaXpjv0c6+m5hzA
         XgT2bWGXBf55WTLs0SMJYDfnWD6EgMvRbMf8cNQ3QwzsYmY6vPhPzn6iZy0B+4qKsDjv
         smtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203706; x=1791808506;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MtOkhtouXdYxuMzn6oEg118/G/+iHWMuCiEVkeqGr/E=;
        b=LO5KPjGgnBFeedOVbPAOtbdeFCFAuOtxGQYQvnDQvCDRyk0nU2MDISZavxDHGkK2Yp
         buBH11/AJUK64l2xbM16a3GanRCGStrAoG3BcBzhfFbi8w8+gfXHFeExUjHXQu0nhL/E
         2QI5/wHZKNaSHZrsYRG4ft9Tqx53Pj7bbhyWtmH+12HnSW44Ec725G3jHbTGXy9W2k/r
         wYgoThI+CTqBeyGIAVA0lqgKuaPWgkqHv4SC6UWXjIOSHO/oXWQNn+CY4iJGcV5696RB
         dPZnoSdqHzIrcv0AcNnFht/A8BuNgukt/lJ/mBdoa7w1eFyPu43x5ytASU32mmKk9Ke2
         lLJw==
X-Forwarded-Encrypted: i=1; AKwUvBxUskAG/JOCQ/KcHpsYIEs7dEM4Oi2L8R1DLugIzBnjAeI4ZVMMLPoHLjT0YE2x/LuxGQTS8PEQFu9St3fv@vger.kernel.org
X-Gm-Message-State: AFuF++luSW5gcDsi8UkmnSKJ/2NSkRbe39UVOfmvHI2yu2CQSxdn+8a5
	kf9MNhyzl1tWcaJJbvdcOcQYynTn60smr245zMB2FvzBeYIYGeUL08JOjGJ02iTFSlw=
X-Gm-Gg: AYBFou0Oei+dfvsnAJUkpsq5xsFKvP/mVNOdTIWNLGxYGuUYTPIGDPASQQ5A79OHpFb
	h6FrJVj4MEMbFXpSiSabz4boBY8GdVqtkDkKy+5NEIIyA1Djzmn+PRjvornWKNWjD22e7BAdl+n
	gylGAW0tEt0/zBki4dQxJxM3rXSdV8SfrnJrAVFjhWxt9eHwXP8ePYHiKird9fix87ZW6qYPVQq
	Fc12iWnM8zXIBNueekm/IwEQTqrcc3NNRbxTS6tulGChp2ISnJMqkeLtDHJRr36K78OnkHh+Cc3
	QdfcR5V5OIO6LIvd04aYgeE5TrexjQrAbhvlUlPb0/MlALCz3gR6ru4uc+qZGeFiTSRmCJDonxR
	2uZRCtjiLMgo4QHMtQm6WLLb0wmR+3slRqYMXHNrv419hkN2gWz4ppD68/AJlnDEySFjdXXH9fS
	zolcYzI4kx14mYTJkoHmaSAuws2PwyMsfNEyy6DNbuvCLX+3zabZOBEUIG77SeBhqepEr8QWu5d
	1uDJBwAqWs=
X-Received: by 2002:a05:600c:1f8f:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-4a027698a2fmr183289125e9.21.1791203706473;
        Mon, 05 Oct 2026 05:35:06 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:ec49:36a8:7075:6d05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a166bfaf73sm169425895e9.4.2026.10.05.05.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:35:06 -0700 (PDT)
Date: Mon, 5 Oct 2026 14:35:01 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>, Georgi Djakov <djakov@kernel.org>,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: smd-rpm: Skip proxy votes on clocks for
 QCM2290
Message-ID: <asOZdcWpfEtEm-5X@linaro.org>
References: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
 <dab99b27-ebc2-477e-b56a-26250aceee23@oss.qualcomm.com>
 <ad4aff4f-2d66-425a-a358-6cefaaa1319e@oss.qualcomm.com>
 <bbf2e7e8-42cf-4146-a2ec-b5182a161109@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbf2e7e8-42cf-4146-a2ec-b5182a161109@oss.qualcomm.com>

On Mon, Sep 21, 2026 at 10:53:40AM +0200, Konrad Dybcio wrote:
> On 9/16/26 1:05 PM, Imran Shaik wrote:
> > 
> > 
> > On 11-09-2026 02:36 pm, Konrad Dybcio wrote:
> >> On 9/10/26 3:44 PM, Imran Shaik wrote:
> >>> clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
> >>> every clock, keeping them non-zero until a consumer takes over. If there
> >>> is no consumer, those clocks will remain active in the idle scenario as
> >>> well, and the sleep vote is never cleared, blocking XO shutdown.
> >>>
> >>> Introduce the skip_clks_handoff flag to handle this on QCM2290 clocks,
> >>> keeping other targets unaffected.
> >>>
> >>> Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
> >>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> >>> ---
> >>
> >> Are you booting with clk_ignore_unused?
> >>
> > 
> > No Konrad, clk_ignore_unused is not present.
> > 
> > Irrespective of clk_ignore_unused, the proxy votes are placed to RPM
> > during handoff. If no consumer takes over, those votes remain active,
> > keeping the resource ON in idle and preventing XO shutdown.
> 
> I re-read this and yeah you're right
> 
> Is the handoff functionality necessary at all for non-icc clocks?
> I'm suspecting that this was just a port of the ancient msm-3.10
> logic where the (modified) clock framework had a handoff mechanism
> similar to today's sync_state, except the toning-down of these
> clocks was never added
> 

The purpose of the handoff functionality is to sync the RPM vote state
with the Linux vote state. Since we don't have any "read status"
implemented, we do need to make a vote for every RPM clock to guarantee
it is in the expected state.

Simply skipping the proxy/handover votes does not fully solve the
problem, since you will still leave unused clocks enabled by the boot
firmware always-on.

I don't think we need to force on all clocks though, we could probably
also unconditionally send a "disable clock" after sync_state (once/if
the clock unused cleanup is actually managed by sync_state).

Thanks,
Stephan
