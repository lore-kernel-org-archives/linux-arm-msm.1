Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA46151C337
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 21:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803431; cv=none; b=YGRY6oScLXRasUu7Z7n7HAV0jt/2jLl6YZmyJ8tU4562YItpleB7SDJivrjUWnOmVfU3g08L3gfjAVnZQWG0vnRDW+sP62j+l7tp8DI0i+rehyoIuF0mzutOc0hd6h/MIHuXluJLjPS25M3ln4dr5Qkoc55WGJeJvLJbMRiwcKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803431; c=relaxed/simple;
	bh=5nULokajq+EGRczUFAS/zID2IRCv4L5cJMxnamASDig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3sRXkuikadNpMVeaec1JAySkjhwW50Eve/aJSDQ6kW2SXG308OylUeXZtIruVth24v0asTXgkjJLkG5m4x7LppdP+3ar0hGpgUrD730Jbroht4tUVZjcl2Ku5LyXQ8nP/W/FMGx2jqk34ThZne52fkW/xNlPb0uXonbTzG6zik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IoRnuKPq; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoRnuKPq"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e17363b97so212302266b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790803428; x=1791408228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5nULokajq+EGRczUFAS/zID2IRCv4L5cJMxnamASDig=;
        b=IoRnuKPqlVsp/Yv0p8kdYuFBoIWbuRUlQdX3kDAIlgGtfRUPkzpP3xza9IqxtiJ4Ud
         6fyCNAGd87Yl5ZAlXguhR8q9lg5qL7UHuHSmmx2QWX4AURrdcbT5HTSElujM7Fmwh6DW
         UuQoZg7Z4qxL2D2gekKuakPIclrV9V5A+2hLwiVEy6Lf7XPGE8gkaiv1ZTzODTypD8LP
         li60Gug9Iy0fG+k6dWN4COoqAlEHmCoujVH3tNhj7VuoJ/A2Nj1NEBVvYDcIUYDfahAt
         fKt+jFauN1Q4HPKEl+xS7gv+WQm0/115ikVGHl+d+ckEDbMsSEIdnmHDdU7iOf/q4YIZ
         2YVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790803428; x=1791408228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5nULokajq+EGRczUFAS/zID2IRCv4L5cJMxnamASDig=;
        b=TKHKiVovJJWV84e7YNToUTtZhcOIo2YP+48Ds6wxPrrtO333QWHK+mgBpFD0E1mpGH
         i+zrp4Z2ADuf7vPC0XRzeHEXAVZzmyAybSfncKgfqbhvndPRSqv/F7q9s13cI5otT0+h
         iij4TyF0uPlbOTlvDfU8bFxUHN5L7priNqWkHkhYhE9EeLtl89ju7Cww4/xguRx1VcCI
         ZyGvANWvUunbrW+BISV0K6XUTUzdG+VyxNbXuAQI/XE0glysS2a/gfU7VHxhMmPkaauE
         7pIv5To1mT3h87h6gMCLzZOgQmrl9iVqVNdBb6IAhHgQT1qBWkbR/92fcQZav+XI5sVn
         rSeQ==
X-Forwarded-Encrypted: i=1; AKwUvBypSrUFhqoNqv76G/46+5dFgu8BDum65SWIvtLCDgULC4qJGgHba5TekxUewigygejM18eea4ZvN498/m//@vger.kernel.org
X-Gm-Message-State: AFq9FYJbnxEyruWhv6NoKUCxfjFDsuvRM9aQnZKlF5ocM6lEmlBr1RiH
	S7a3IvrgmLjQaM06zx9Ya69T16KYAYTpjCSQCz4sO2Q9WAtc+ZQhfzfdX3sRVrIKjO8=
X-Gm-Gg: AYBFou3JHPP51nPtbGUL/hjsO8AeWPsebrDkGs6fSmOoKVBH5DgL6woSZvQDcNtzt0W
	OnPNnmy3a6qs/C6e07MgPTBrI/Nl3RrwrXWGQ09rLYsIZFOn65lWiji+OTptK9SP03dp+IGjos0
	DHlunNLAqFTOZPvsF8FeBDbVzGgN0m6YPfjlCYBRPGbF1Hi5BB+SniXtVnneDGjQ5f+Bk3Hy2n2
	fyHb75U6t+Lo6iYoWvfokHuDhiRq0JbTQpQvxR8gaPJ03R75ZAAjYwoiEKVFThijm+3HExOZEVz
	53joJGawwWYMJ2ADKKOPPOTWakmP6nFIVn8bp9GVHqFFavlaIrZKAqcDqGHQlwOQJf67/Y2eoZG
	RWWq6yWzxVtGQzarA6AecI4f78CxXPRJutOtwsfd3BmLyy+dhUYlVOX17mw2Ba5RES92eM6FfBL
	hunJdkRUu9XDYV4GknxX6cROGkY7GOwX3AZJPggD3cRTmuYxB+M0ChOlT1A3muXAEYuMlXqbHs/
	bD91qG6hfXrVJwIQbQvjksRn8tN8m/aRjk+UZEMwFdaJbKaTcc9hDpFJla+uC+dXZwNgHU2ibEq
	CTtN5ImXDzHuuJIT7G1K
X-Received: by 2002:a17:907:9688:b0:c25:b620:d676 with SMTP id a640c23a62f3a-c2e23ca521emr232682966b.15.1790803428047;
        Wed, 30 Sep 2026 14:23:48 -0700 (PDT)
Received: from localhost.localdomain (83-233-221-82.cust.bredband2.com. [83.233.221.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31e053e0sm59849566b.74.2026.09.30.14.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:23:47 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	George Moussalem <george.moussalem@outlook.com>,
	Ziyang Huang <hzyitc@outlook.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] net: phy: qcom: at803x: Apply IPQ5018 analog settings at probe
Date: Wed, 30 Sep 2026 23:23:35 +0200
Message-ID: <20260930212335.1565-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <f8e1f642-8250-4c1f-be1c-713a0026282e@lunn.ch>
References: <20260928220717.939-1-yongzhao.derek@gmail.com> <20260928220717.939-3-yongzhao.derek@gmail.com> <f8e1f642-8250-4c1f-be1c-713a0026282e@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andrew,=0D
=0D
> Patch 0/X should contain the big picture, and there is no need to=0D
> repeat it in the individual patches.=0D
=0D
Agreed. In the next revision, the commit messages only describe the=0D
problem and the change; the investigation and shared test results are=0D
in the cover letter. The code is unchanged from v2.=0D
=0D
Thanks,=0D
Yongzhao Chen=0D
