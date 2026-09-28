Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC3049D5A0
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591005; cv=none; b=LnXUhVlvJkUh+lE8DMN3kZKJOqkfLI0ry0l6F5kLhMj7+MqlcbBJwQhY1eD9LXsthi+rQKepwz+dggd3rBumpm78/wvYDo34A6h8qIsm6NXFCfMHAyCNSaYchQIA0daGWR/qdFyMOHXVVnGpY5o3cp4GQfPTsEm+FKLAopql5nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591005; c=relaxed/simple;
	bh=Zfuo4MY7PIOTujR94JDa5G6M8PRZiDvEWeZJmTK8f5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWi2S2G/r9vnGX/tGNT7MEDSNfhjxw36yWf0Ga8ULPGDsmIoTZ3Qtgs9MWRJ/bbo5uM9s7fujuk974SJN7ORW9HoCDWl6YzZ/P5nl6C+TNmkpc22D6vhGd9cQ0qsqsXF9uqpyOOPWuzokONhe09yRCCr4phOqA52mAHfIlNBqLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=U9uEngRt; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="U9uEngRt"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2bf3cc16baso222286366b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1790591002; x=1791195802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zfuo4MY7PIOTujR94JDa5G6M8PRZiDvEWeZJmTK8f5A=;
        b=U9uEngRtKkY7mvafN702Hdxj/4YmhjXHyIa9/ozX8gTOUxadhNawGBBGt7439H4q0C
         Pdano1VUy0D8dwIUBF64yO/J8SKR/agU3awPsNd23uf/BOAGVQLppqwJOFbTIwVVYkZr
         8BbOKItVRuNjXPCZHyJDWltVBjrf2gs5OuFrMqLKZTxQn0plfbFTNzOiT/1JuVCpKHJL
         poU1C2dI6TMlzywDaBUdXvFTRvqXZhMuZmoPphDKQStpHxbcYJHInMRY2ueR/84prwf0
         p4iz/NIZEzEAvRSnFj8B20y5tcJrSucZhH/gyyOIOb2OEJ8ki1L89NMCK0asBnZwXdla
         IlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591002; x=1791195802;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zfuo4MY7PIOTujR94JDa5G6M8PRZiDvEWeZJmTK8f5A=;
        b=crVsItu8AIBbvP2XSTdDurOvOAuoAC0RwB1QCe/niMH8hMQ7sUNwiB88N6XceS0Y5x
         3+BdAR48ZIDcj4xzKrW/f/59vcQ9MSpQnakr2v7/lXnH5U5VV5b0hJkb9RWizD2HJLmv
         uCiLsTQmA4GjKQ0Yuf4X5z86xLIldRqBSrhdm/K/e2ThRl6FWHb1syyI3Yf4uZx/H8Dc
         7wO9f9uaUzIOlI370J0QhOfZMEmVFSvmvWynXz0XT0N0skFf/jN9ioQjBHrFtwjewHDQ
         SfdFoNqzUal97Wd8zKvPTwUbsyVFSVhDxpy8Wdd3Ci+N5FPsCcfBuNAFWtyBz8661xu8
         yZDA==
X-Forwarded-Encrypted: i=1; AKwUvBx8o+cwPoZOR2Z3M5Q6Xs38ySJxRbDP+0wspkUXdbvZCf+S9TKvyv3sfaM+OZvv1LKr0uTrTM9KVX5hj0jg@vger.kernel.org
X-Gm-Message-State: AFuF++mMESvNzYlagQx0o8pN6uFOXBK12SsHvpOJZw+PuMnkoikhCVGm
	NhMCe/F3IuD1uHfv0hJwyfqVUz1T1xImKgxskjvJEc4F209b4M82w4oXYPCnVbehGhA=
X-Gm-Gg: AYBFou1hFOyrH+Go6TKm37aVC0HDGlgPUZ9+2byU8Bq3C32ppYW9FrOamrf7O0ReznV
	ZNrtLITjUhmF1a8v+MZGmtwTwHbZXXxoHMz04cUNYELzn+qymn8ZgUjDGRvFwb6LjlswGIG6GBi
	fOZmIL2vMDi+IQSDmfys9w+blr0Jw91FqenZaYTm2BWF+VD6Tnwynj64rXNbkAj/pK4dZU3HRp0
	dmGHg2aEWsXl9zHPKYwzJh1pilQ1GAhT8OeOgS62c56SAfku4bChQDtJQSHgseUM3kdsYvJ9csi
	6hlCzFN1t7rXuq+om0DRN9TJyHo5cadkDUXHBBWyKwBE3jotIFrpLBZbItsnRq17du5pAuH/FKz
	ceOvhMOc278tc+8j/sKDqF48WuaG4YhebGFPBkp46pxb3+pjhO/MEMwq+L1RyE4qkl/ecXvYj0B
	cEJi9ml/qlWk4xKaT24/pTMRG9upCEtoehqnIrcwv4p/VBrfniQ8X6cmJdNte5VcExQk3umpm4z
	exTfzeRMiXOC9X623H+CHlEeRDjYD1Hk33qVfBDeSL9jUKXOgQnCUPOjAerKjpeMcTPKzbBVPoW
	cFCHOgc2s/oFtH5IBnLlY5N0CHuOWJ1TsFUUxnrs
X-Received: by 2002:a17:907:3895:b0:c26:1649:47a5 with SMTP id a640c23a62f3a-c2ac53964cemr968869466b.27.1790591002152;
        Mon, 28 Sep 2026 03:23:22 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757ade3sm450982266b.29.2026.09.28.03.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:23:21 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:23:19 +0100
From: William Bright <william.bright@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 0/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Message-ID: <arpAF3tYlxKw9hjj@will-Legion-Slim-5-16APH8>
References: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>

Gentle ping,

Can patches 3 & 4 also be applied?

Regards,

Will
