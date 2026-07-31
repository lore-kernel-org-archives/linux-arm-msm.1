Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC8142A179
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507821; cv=none; b=KH6nEngLGV51T5oTRHJDsHEtHkWSwVFElbDFG29khBQOQ9HpfWSVvzBS/9nFcxXXMRlarOyVcKkq691zwYtrfs9JfAvdgTJW+8GJUyXqAYhZzaAh0Ve8mqOwaExQDx1obhbWoTgdUaKWQIgCkXhta7RljQmPnBqqMawIHDjw9Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507821; c=relaxed/simple;
	bh=MtF5Fxmphw/oNM/zVvy+umnHlOP+HVsIzMQ7JUars64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q2HzguRSveZ4AnMufMiej0AexF1EpLdJZOBIhwkp3m8m50qbCdFwx2lCUNW7i16mmTB7UqrUceabIr5bFC4Fij+3NQkx8g8uZLx6bzGzEkLq5YRT3E/2kxp2Bs3xapHK5mkASXHMCvSFh0gUaWxUcgK/sICNQ1ZnakB+8/Fk4xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfsBWdo5; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfsBWdo5"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8486672f03cso1244798b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785507820; x=1786112620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cjRB82br0ApA+p23VVbRTgbSkeTLuPSgpSvIsWgWyTE=;
        b=YfsBWdo5AItcZXdqs8SCJkrh2i92stOWcvJrOetRakozOOmIy8SCNwDBN6NWLNWjek
         qit7cZiV8C3rf7jtgRM3GsS7hiZKj68OmDjJ2bgLPOoMidgbDMkI53ZmwnBwuPgc7aNO
         lNXwiq5ukIe2cgWADlF9p7NqbUnrkgVkfYyFDXva0mYhku5rFBrSHJu1E+IM2txVzH9F
         nODJqlW3gf1bANSHHPh4UHkxjmaPJQOV9m86nT58oCbZh8xH+EbNBWDUInu1a+ZjKJRN
         Se29nKkSZeHzRaOCGZMLlob4H1dRfOJP/+hH21eZpLWGhVHmSwo+siCCOSsNo6pOdDJR
         w6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785507820; x=1786112620;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjRB82br0ApA+p23VVbRTgbSkeTLuPSgpSvIsWgWyTE=;
        b=g0EMh1T7728g0mFpuL4bJr1monERPXx7aOhM8Bsb7WACQPUuADuZXHq7YQpov8+UOC
         ZBnzWrlmc8ljm9OrzKIJQiZBOxUF9XOI/d89UcR2baqBwL/JF+DPiia4TxVBt+P0SYky
         z9Sbq7uLj/OsXVsf9a9EGOGqwkpu/8Sd19sQ+VBAEQfCoPxqFsnydPKaQycWVbmt0tHN
         0zG2+jr9fABX7WqgMmDrTOmcN83NyXos7YF3eNJrZxNwcsv4Doouunj8C2Gau8ntDTni
         kWr93Bnvr7YpW0lpka4OieqCWaEVankT0ZavG7leSNA4XhQkAU+GzK7m2UOVqxU0nIHZ
         Bxdg==
X-Forwarded-Encrypted: i=1; AHgh+RrUZxzHLWcqFeOooQKTMC/ngNAOZxRmLmx0V6DbjYagyphwMz9/CyyxWMkBwb6XAVqZsoX3EuUD697OXcGF@vger.kernel.org
X-Gm-Message-State: AOJu0YyiEx9If4yTRYDpkjjfLh+6ED3qNlfPHxx30bB3EZeCXCqRpZ75
	kjThsMteWCms/sKs7Ym0CPf/mzcVkKC/qqDxfex9OqqHhFOyVpoiFXMbK0O5fg==
X-Gm-Gg: AR+sD11SwrSlFWjR4cOBrDFIX7hKlRA0NddIZzOk9xfxzlVeDYO/qmeU1Plw96mxP2s
	ymQhrblNpdvcQJWrg2M+kaZ5uWhMob89BL1bL+/WaYaZO6IZ9yEw8gBbZK8AILz/caJu1lQDPzy
	G4MIc0ijpNuzEtKC+cpnVNWzyWzJjdTVrBujgrlml2plFxyRVr43auvM2CnDBcgVB9yjL0JWjMt
	BGaYxoohd5m+JZzXxZ0yP5hEpVByljmuA/v3gVV1aajd33YYC9rPqnEOHeMtFp5Epp+5ZnvNPQw
	lXdO0NClGFnz2mX0ibJURuJXEWNOxlhEeJufrxk5CADAaSqAMIoECNcyd81dZGGKAY+5kOiWD6p
	qXbRE6L1sZ13+NUZQo20t3W1Wnxf63i9LaIa3uAHbGiW/WjM6qsgXc+6R85vOK7NYr4lrXecWiB
	+U8CZLcosSAtaeJi9zAyxwdA9Y65IlDFRjV9z4IsSHOUEUQp88JYAZ/Sx/NGhxH9EgZ1PR+ZLYt
	qhGUtT7dhoo
X-Received: by 2002:a05:6a00:4503:b0:847:982e:cca0 with SMTP id d2e1a72fcca58-84ed6ec190bmr2126643b3a.19.1785507820016;
        Fri, 31 Jul 2026 07:23:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ee1b049e5sm146426b3a.58.2026.07.31.07.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:23:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 31 Jul 2026 07:23:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] watchdog: qcom: report bootstatus on IPQ9574 and
 IPQ5332
Message-ID: <4bb022c7-d1d3-461b-809b-0c863083613c@roeck-us.net>
References: <20260728-qcom_wdt_powerunder-v1-0-de8d9e964e7d@oss.qualcomm.com>
 <20260728-qcom_wdt_powerunder-v1-2-de8d9e964e7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-qcom_wdt_powerunder-v1-2-de8d9e964e7d@oss.qualcomm.com>

On Tue, Jul 28, 2026 at 04:28:03PM +0530, Kathiravan Thirumoorthy wrote:
> Report bootstatus on IPQ5332 and IPQ9574. These SoCs use different
> restart-reason values from IPQ5424 for watchdog reset and powerunder
> reset events, so add separate match data for them and use it when
> decoding the restart reason.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Applied.

Thanks,
Guenter
