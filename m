Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDE15221D3
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793574; cv=none; b=TrONHhdQ7T260pCkFewFhe8ikYJK/ypg1J8xnYZeTxwIhVhIkIMZdT9UnKffD1eQUzgF+LMVJ3IocLJpcvKdFzNgg6BdOZLtS7G+6x3IPLd/hlWyQMVq3M9X4mQDBIMixqjgprBIMSeYr/rdtXVblQ8bV71GK4il4p52jsTdVxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793574; c=relaxed/simple;
	bh=XsKp8bokv5KQkAjgiygtz+XbYJSoI6gq4xMZGzbAlEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUdvyo+Eg/chV98D0bd7v2H/y1+CyONukq0hB7hLi85ae8KE16BFzsvpWgWmCOkINCejpHiAmk1dvCATjZ4/Cylit2moWcS9RRrTaoNlBFZdBhgsXdFGWaBshqYYuB/by86Nhms4vXeQ7eszBvgqaGLsDoHSkyy60Lw3fhDJu6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IB7DlM/O; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IB7DlM/O"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d31bda43so3606485a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793572; x=1791398372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsKp8bokv5KQkAjgiygtz+XbYJSoI6gq4xMZGzbAlEU=;
        b=IB7DlM/OVGauDMEpIDbhTZJYnLK/boNbaBXffqzfpKWjQQEtGA55PbT0r7EPD9H3ti
         wdgVAeqwTup/FFNaxtESQNQ4rVKcZ8GeMyNkaYlW+0DuxKysY3JIVMGPvQCZzcdQlViE
         yCHVCj3CpoYVd8hEYirxUwfkp45Sn9umdoabdoZk9S/LW1U6AY8QSotOjkYz1rUdh68K
         ol+5hoE/6ae7Q/JlAx9EEpwZghxnA2Joq04l7tGA2kDfBC2cntKVltOev42QOUQCfCpA
         hOpW6uScPWF0u+H7AxFCv0ukrTfty+mI2ahacARliUEi2w9UOjUu6nYST/vuG7qzipxK
         lFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793572; x=1791398372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsKp8bokv5KQkAjgiygtz+XbYJSoI6gq4xMZGzbAlEU=;
        b=r4O+dQPcqiL03YF2Ri3Sc1cJPUNKY00FDahk+qUmmZsUjDKc+VpmOa/KuhvuuGhXEC
         oCi4LO8Iu1XZfQqXi27l0mf+X/a6KUzoBa8vx1JhBAcZsBgBWauA4vU+QxOZVUR08Hp4
         ejKmS3lNJW+ekF9xSKpfi+dR/KTMqbW9uVWWF/4flBgl9JtAfkm3k2hkEm1mSYqkaRaW
         uPfL3L/NsVfRqqZ04porCe/jHX48XCSxzmwz4Rc5PZuDLGsajHbAeo86ilrcKf3C2GUi
         BE+9MNkXwVV0ksxxaLPxzQQUhiEws5/bUqQhL6PXbCuCgSv1Qrdo2jzaT8W4WDhLtDBU
         ODaA==
X-Forwarded-Encrypted: i=1; AKwUvBw4xehHf15wlZCqZcVFGEy8KPSf4vI2M/L7lJsrIKk+qSk+rNXQ5iF1QddwFRZ+0+NYN6Z3021cUW4KV9Hq@vger.kernel.org
X-Gm-Message-State: AFq9FYJK6WUYsiG2Z4tfZfwDJ+zGdFUhtiYVkowx78eGBJUIgDPaRbRR
	0YQPvqyvodTy43VORJ5WISF/3Yjwqzwjsjd+2r5XgB3CRc+/i7E0vUmF
X-Gm-Gg: AYBFou3xTqsy5zoavsl5UOUeX108kH0AxBFi60yMnNZXoVaRqqgrnhPWsq5SGFsGUFY
	yVOad2Nhf8+XrDekX99M2jIAfTVGyc/HBw+lV3+c+AYjaYDgUucMuf7zqnM6FZnJVP9Hn+sHwaH
	f9CiQAGJ+T353+figIG4niwTxwW/zk4UtXAKniXx8eXTKl7Mki86vR44WPuQlLXpLcoIxX7GAQR
	8EzAZYYbxDucCpuPsFEmiL/fI795AtfOVlOnsNnrHzKZgcd+C0+J9xNLz22qp6psfISXNwGHLlx
	x+Pb2S1pfF962Q4YX+C4W15vxK/1JHHYVTFfbygIyjGYkar47k8uPkBG5MMKWjrnAV2aylhB/QF
	sYQikdhYRLlx7jGACdbbnMZ/8UskuCBTu9sWli+97YDFPxQm23CdyWskH786oJCcbn3Uc9aFIXp
	2eZSXrPpETJYcv9q9wT6E73tNK/a3kJ2cHMVsQaa5Nxq0TOLNgNBDbi6pMs1EfhdaD2ogBEiE0p
	gtImvZbwucm4M3FYq+b3u2eOWKxdAtZUc7WaRp3EHTLHGgIn0Ymb53GtZc30i2WW/hAJi5Spyh4
	4Q3YclMr3VZb+r03+KRISjq93OfgaO2Lf3Td+Q==
X-Received: by 2002:a17:90b:48c7:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3a4f71d6442mr81998a91.36.1790793572062;
        Wed, 30 Sep 2026 11:39:32 -0700 (PDT)
Received: from rahuls-x2elite ([157.51.37.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f75019b6sm49026a91.3.2026.09.30.11.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:39:31 -0700 (PDT)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: mahua: Support GPU and GMU
Date: Thu,  1 Oct 2026 00:09:16 +0530
Message-ID: <20260930183916.1197-1-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com> <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/25/2026 2:44 AM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
>
> Mahua SoC has a new GPU called Adreno X2-85, a slightly smaller variant
> of the Adreno X2-90 found on glymur. Override the compatible strings to
> correctly support it's GPU and GMU.

Tested with patch 3 on an HP OmniBook 5 16 (Snapdragon X2 Elite
X2E-84-100): the GPU and GMU bind with these compatibles, the GPU comes
up as chip ID 0x44060030, and GNOME Shell renders on it with Mesa main.

Tested-by: Rahul Pon <theflyingrahul@gmail.com> # HP OmniBook 5 16 (X2E-84-100)

Thanks,
Rahul
