Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A8A414A34
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507791; cv=none; b=caGJpxD1bWMLGves1a0WLHKnk8Cf0NR3DIom+CqhEK0Sp9CI5Oi/vrkqYaDalbMpHQkDPJB3Cxc9v4lN13t0C7wy/Sd+hR1x06J8bA2E96EI6iWU3JRUFzzeBwqZmD7u5WtjAsVnsqoV4unBIEQ2c1Jh31Db51S3jxFRA3jvh9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507791; c=relaxed/simple;
	bh=FsNxEQ9zYgrcs77DrRGsPHp6Dw7Br6Di7ET9IvQSP2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nT0Fxnsom27uvLfbZlxVRPDKeh0NvrpgMtgr4sjfspRng6hvk4T38q2v4W7t+4nNPm9m1PcLQeYh5qlYaa63QD+AooBq5ra7c6XRC4DjtAozsuR3yL753JvUcNxu2ZFh/Pm0M3iK/H5DdrNtqXtqnNP2fjCgbr9fTAMKwgrQZQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VO2JyepT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VO2JyepT"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ceb096e675so12090295ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785507790; x=1786112590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ncKId1czsDRMV8J36ogHF8okZkxS0jzr/V6pUyPO0G4=;
        b=VO2JyepT0bmqVCSPyBLxDEgFiGHwYu/M81xMejh+PI+spiAqgPFuykDL30PhWGecbm
         aNpTSmDl96UfkGJZEQK0pGvX/rxO1DdNROnPphc4QpKKaTfMM9oTSUEWi821ibyVzA3t
         QX+4ZJefX0T4tpgNPc0tQXyTJj3/EmOsmKCZVmC4MbMiiEiU0G1OczMaTEIMdMmU7M8w
         vntmdst9UM4Ztcsa00ex8+1SHjX1muNhYQXWqoHSvOBAv56vCw+zpiDuy0Uw1BlQIiMU
         xe4GHa8EuSxNy5iekoxBsjK9k2IWQswJnXdEAGWV3k9BkkwpsXdEp9BhaFXHI3HzylHa
         0Uhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785507790; x=1786112590;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncKId1czsDRMV8J36ogHF8okZkxS0jzr/V6pUyPO0G4=;
        b=ALmXkQeWcvzL9xUy6FYjW91xtiTtrg58UroDWO7zCwnYYEM9MgNfevMEiRTbc1YyNW
         oXjRRGcnjzTcysQb1azcT/f0WvlxO/iowbWWNCK+j8frghqJ7ycymXYzrKnO+6QlGAKO
         QTYTsjYej5fAKFakpMSVPXWxALUK1DKrgaSYJ2xzH/4EtpQoVauipf/0u4jm63QeCyQn
         o/spb+VkBhQlh4L1pPBlG4PG46tghY8Bzh4RMkNqtq85xkBDk64eqGwNJtH3ZL1sjY7Q
         Ij9VHqJdGfufqfefXlBMu0JYeRmaIoXoI1gfTtesIi4jkGQVL5Blo3QcwfnGdQuxbe3/
         LAdg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6OTgjrfv3SuCgcHy5vLKlgly8jHFdHpDVhKj17djFFTM92nP3G14rrQcE1fKlQI3WQN8C9L2G9AwTXIcz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Yg6sAQmVd/HlitJ5tpTxRF3sxZznekPzSjYWdJxK8FMnecWR
	+OsiK9PwX31hR9XQFlb+u2xXPekdS2nfIfgT5iwiGssH2bXX+2It+THi
X-Gm-Gg: AR+sD109g/rOSi3VflhsxW+l1a1msIYKOX5Go55OiH9Z4hcoI5v2kYE9nZO/96Yk+Bv
	oz66nmnlgc/k2jukD6RjIksJMoXCcefUjlkj6DLP+cpvQk7z649zB+Y+PQwvqEWbc9aZY7YvEX3
	rNQja3wGhsZS632hdiiDAlBYdnogJ9yJPERBVdLipRpnolWrp9HfnGNpw+N9iu48Xxv8tsGQFPR
	ibTdtmelA+LvcCK0cKd8GyC045dS+n56/gEsbPcYpV2HG9dH7CkOf/xfbDzyms13nSGG+1BdvPA
	Eai3F1dk22VTPimXJEaB8H0Y3takb3DYwv38BiFqTjy/Vhhp/HHLl/1i4Am2b3WyxkpkcAwvVRa
	JaEB1QXa/e0TfmIQrFgfLY0PrTE4zsgTZvFY66Sd2DnUlssXP+2k9CWEYPldow99YpGALUxaqDV
	lWjiXHoK8Kgx4r3w6W8DSQBnGllvEe+ETcjmyu9yShnRlby4EJopbL7MpkVvCI0SO3MqKuXd8bL
	A==
X-Received: by 2002:a17:902:cf43:b0:2cc:f7c6:834e with SMTP id d9443c01a7336-2d0523c030dmr2199335ad.32.1785507789702;
        Fri, 31 Jul 2026 07:23:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b120d98sm6045965ad.59.2026.07.31.07.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:23:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 31 Jul 2026 07:23:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] watchdog: qcom: report WDIOF_POWERUNDER in bootstatus
Message-ID: <7bbe163b-3226-4516-b8c5-d3cabceea426@roeck-us.net>
References: <20260728-qcom_wdt_powerunder-v1-0-de8d9e964e7d@oss.qualcomm.com>
 <20260728-qcom_wdt_powerunder-v1-1-de8d9e964e7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-qcom_wdt_powerunder-v1-1-de8d9e964e7d@oss.qualcomm.com>

On Tue, Jul 28, 2026 at 04:28:02PM +0530, Kathiravan Thirumoorthy wrote:
> On IPQ platforms, identify the restart reason as POWERUNDER, similar to
> CARDRESET, and expose it via the bootstatus sysfs interface.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Applied.

Thanks,
Guenter
