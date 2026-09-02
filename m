Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD4B233954
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 03:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319241; cv=pass; b=QTc1+G/H8tChBHi7cR6sfAgj25tlCHg9eckgudWzCkpvedHlVWAJJGaRArXaiX6SDRPtJ4DTAuZJZt/3pUc6gZbDJ1AoFnhkQ8e/jhYcxtwJe6V6NCJ4xBBc7crSupeO3YlIu2HHiF1zsbhGDmV1f+usHxaIgDEsuSj234ua/9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319241; c=relaxed/simple;
	bh=Uzv5ZOutoGMcYzpdmAuuzSMSJjkqPNjX/lcdxHqeAuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wm4XkSJWVIdYchUfCHb90f3IvO/kCvDs9NjG96uYJKvn9LyH11uxpFKB9hUfij+vGMgFROneJE2ln9keol6wtKpWIYCxBS+56iUb+dIMSyTsc93aPf3OJoVvLIPHXYDet0qA49j0FCtxIwPplnMFPXK3ncNVV7OlATSqp1ySpxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aZ/ax8I8; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aZ/ax8I8"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66c744a00edso582271d50.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 20:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788319239; cv=none;
        d=google.com; s=arc-20260327;
        b=N/HdDgSxWg6IegBu/GG+BMKccKjICjEjyaj4U1ch54FR8WLq/Apn1Y2LiWeSjza810
         wFpHG06ECD0ZV2RkE7WVgTyihzQ/7+EjEXLBa+nvPRp2Nt0ogaNULMV4Wk6Jfle3YMjZ
         j2vZJxpJlM5abF8MLtq0SwXDu2jOvO5EGDRT0gD3xnpbJZg7/cuAUBSDGHkGKEpQIQnr
         et3dDhclBz1ai3WiPFEM6sRr4CkkdYMHZGjeXtMQPOM5QZHOxoL/WSniQ9fozNPyYmtS
         es2XU9F9SEgoId8+4kLDeFDlcORThX8irTKSBrBfy1mdo4UvnXuKoytOX91TFVc1cONc
         +Umw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Uzv5ZOutoGMcYzpdmAuuzSMSJjkqPNjX/lcdxHqeAuk=;
        fh=EJYt7688Vcj7TI7U/30N3oypi9ksrA+Ga++bQXUi0vY=;
        b=S8qg6UqGb1py/M0mT98aLw+4Fx5VINqjfwfgVZZd6skyZW5vFrHec+z1sngjl1t5Hd
         j/A3bkqIf7CRHOqhjs8DYkqpFXTtUR2IWNGgs+OOhX5BKFl6eIYYyAkeV+aowfritAnU
         mcAEeWZ9W343ctqjxCsuzdBUGp88Xh8lhl35bLsdY2klygZjjVhDIRqa/DDl74wPliBU
         2flg7JykckgOKjM6K8k7I+xrzfUpzuvfoaAATbuGdu4FYwKL2x+nr+Nsz9H0RxUouK/n
         gdhu7ugQePlc7hHHqevpoOb+dNN4Eii3volglLFXoPlUEB0EnkNEGH5tiZk3gAS2tc+t
         UdTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788319239; x=1788924039; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uzv5ZOutoGMcYzpdmAuuzSMSJjkqPNjX/lcdxHqeAuk=;
        b=aZ/ax8I8HLoT006CgqfXSmECGNeWd9hpsDHefXPmNA9qhjwclmnmLJ+p1UUKuAQqMw
         BqbaEEYBiSK871JVp8hqtOZK/GhqONpzgnEH/uDQjlpnKtZroU8VM4anaGJhOInxaxUm
         dBwIr8mwROfyZviSIL4d0rZWVWUf4xDrKT2yftpz5mYs3hBxrfsewMN2v+RgTV8xPoBz
         sTkO/YnL1SKl7tPUOTvbwodjonvBaW81Rll8fePsnT5Wh8kX18KOXvVBOji1uUZYbKgZ
         HE4wBMCzEb1NoWCqgSROh+WLWJnLrbXPssszJhctMj/5eemNgtUUYMthbiBr5ka6o/nX
         hNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788319239; x=1788924039;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uzv5ZOutoGMcYzpdmAuuzSMSJjkqPNjX/lcdxHqeAuk=;
        b=bUD94Un/OGlfAR3M+/u3fuHSYTb3FBrId1qcmJALSuQABh952C4+QNGkEx0Vu3bxaS
         dR9fS6S/NFq0PYd+7+j5cqkD9NkYMJn/ebTVFyWdvw8LF6nHwrGsL5NiucIk+hisaP33
         1P9Hfvhl+5PA8l81UnWAvJF0BLAGuL50xi+tGHTu6JAdltOgAssAERrfXHTsxiRK3wUa
         cC11w7I6cTY+StVy1RC/gkRRkYayyxTEuRjuWSFn2bL9u5eXbkzVCm6cz2t1vO0E/cbi
         l362o5z2Y2fLGPl9El1nlbwC6zNmPYz+wkFXLJyVUXJbeWP0zS9NmlA9+yb1erd3QgnW
         lT5A==
X-Gm-Message-State: AFuF++kG4Trjci0YnPjypGgxwTIP7j69HaKLPrsBaQ1oHbaGn1Y8y1aF
	P8UAfijEjOxc0Xs2zt4U/nh9d7z5lAUNwG3/sNucyaXM/B5EObsU2MQq8tnjPFJvt/B52Hoc1eo
	9cbgkClmJZhxFOU4Md4Mv1l+qhPa2k0PlQPWY43tVZw==
X-Gm-Gg: AYBFou1nCqFs3KLLEmWE5WqQFyeA2KmD9f5GDMgjx81bm5EbsC86yFX8/wusn3HJsJi
	f+ZbIA6E/NLbznoNysr20BqEYHbsDFcuPuHqsTLYn1x2ojGyyXoE1+vHBwGOb2EqKbJZ1gAkwE9
	MLD+RH5LAZBBqle+NHyS3H3GUq/Du2KL2Qb/X8txzyR1HhJN8DmjQCNxBJrht/Ge/ZomBu/D7D6
	rZlAHt0W/Sf77Kw9LAWkI7fM1fNsZM3K2EKFxAVcgcZz7XLdye1MHEbLvpufwfSPwGFXtdM7BMM
	ag4uQsBrMG9jW7lOVyMgzxjNLfwHz+uUzkrU9Isr1uQM/qlyGV4xvAuw4A==
X-Received: by 2002:a53:de12:0:b0:66d:151a:8390 with SMTP id
 956f58d0204a3-66f9ba447acmr526157d50.3.1788319238504; Tue, 01 Sep 2026
 20:20:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-msm-next-quad-pipe-split-v21-1-965dfa5b669e@linaro.org>
In-Reply-To: <20260727-msm-next-quad-pipe-split-v21-1-965dfa5b669e@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 2 Sep 2026 11:20:27 +0800
X-Gm-Features: AcwNN1W4J5dkjR_DtUCGe6FED1QpsI5DSrYSJEiFhZPubNDnqUDs68CxVjgIcz0
Message-ID: <CABymUCPO4zDFniBNqicyq20m3NptU3AHB2it2fS8-7zvreZmug@mail.gmail.com>
Subject: Re: [PATCH v21] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
To: Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

Any comments on this patch?

Thanks!
Jun
