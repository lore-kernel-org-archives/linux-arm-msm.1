Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470B641837E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 02:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791858713; cv=none; b=rdRk6sOUJJmSyHbdNrgSwxxMIo1ZIocv9O+ErYfF2GiN8HwmMHtl7iYpKgSQoVprLmbpyTzrkauQ2XHeCv95mZp/3FF0gd8mYbcp7DIFt4DJhVMdCIdAIEoa/yLA4vkW45n5zOMBlTOdX9DOew80TIc7OxKeHakyKuak1o/JhrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791858713; c=relaxed/simple;
	bh=QOOZmGzQCw2gDhk3nVUeUzJZ9ASLU+x1zH4rqZROcfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=useHqtGiibrYsiLKcTZO3bEGysmQeff2ZS5RmGR3A5B+7mKNjkpcdr6hPpbBvnzJCZ7ZXmXdH9SFVz6bAejo69B6swCPFnv4h6I9UlNQo3vbCKaK2j9hyZc8/2e7OW6hLk/Uwo4HffZNOL05VrzKal1RJTsAaORG56gB3I9pyJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h50cSm1m; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h50cSm1m"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e81738d24eso21090155ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 19:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791858712; x=1792463512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+kM4xBm5zG4P6Fh6dSoNAGMsQSGloU4B+abBkTHzWlg=;
        b=h50cSm1mFyxpdEDGyK0vCz4wB8eD7Q832rkQ7N55YvmOnReRT7n0lVtB1FNbUpN7Sz
         2sTdowoPEl13Cl/gKXbtuMppXj3vDc2Kc0aHzx2/kmbK6XVPZBI2/RUq3eW1zAwU/G1O
         kgpOEqW4s0ImLx/AsnVnHnKYGH7iWqcuufcv0vNYom2lWV7uf+7JVmgFXYzKsshI3nfH
         wBG/KrbcRKTYEv5fok5QqLMv/4Qob484HokrxiNt3kU6jlgYHxdC0ksJzVd+p5CkULZq
         1l8nNdRMCWlzVR8fOox40WHd8mBrNopL5eW96JNxQvYbMxMeCpvkbfCR0nxV8SZrlV4k
         mlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791858712; x=1792463512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+kM4xBm5zG4P6Fh6dSoNAGMsQSGloU4B+abBkTHzWlg=;
        b=UQ06UsRSY2hqWXUdVDYkBqo6+ba/JPzNPb9Ii+BcB1EiSN1jeSfg1kHLxJIhN1ZM6Q
         ePEZ0Lg2l68JhHfryi/JGEh6M/o01qTU5rpiOv/MXWP5tut0O/1X1yhftav6tePZOHbT
         B6MxK65AIZrf6lYES6wN7Be5KPwN7YdKEf1whLkzs5dfWGEaqgeNoo5Sq18sva2Ep1GD
         SXBAmUL9tMhum3bYkfSM3mCF64AyTrKeOOdF+E2c9mdPFBCTbSw+DdCkZyEDkzr+T8lT
         KSIK5ozUw7x2pQpIOoFztbAnFrMJt87qWHl2M0U/toqA8C2D2wB0WYrZXnBgnBEB/heI
         jTJQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6v/Upmy+RxrYWmBIF6jDjSM2bZQhcuNDCoS47tEU253HSmYP1IXJzr1GSim09vZm6zaaHjj3JgKbnxubD@vger.kernel.org
X-Gm-Message-State: AFq9FYIiW+W3OxpQTOxooUrtWn+18bnKBTIhp0SRz8c+45243nMLzf9F
	5FatKuolM4rELAUgd0D6pAyoqwmUFKvU5eRc+UAIXlrnD9jZ3zC/Tkzt1SAH1IEd4Ax7vw==
X-Gm-Gg: AYBFou3FQWzxHGetg9+nEwK76+nudmBBHsTgwq9kKFiV8qV8a94MggO5Ksvx0BqjXLm
	umj/TblBNS0/e1CHqIxrXVk/DSF0x0/NwKrT1aSoHuIRlSumAalbDgvMKaCzshbqMcW039KUvIz
	aUDRMJ2XSSQLey9GbZzZnoniJL1YtwfgQZh19cQIT056k+CajQjIlPL/+j6uuXZTYQq/dVt7R8u
	70MnsUnmrpbHDjcwUi0Lr1pYNTL/pPLIZiAUE6XQ30D+cU+IKN5tFfgkX+J8pwKCEnNGBZADmyq
	fU2yj8QxU9iwbscJGw/1Mn1oAgPVG0YhoW0VbmBSCuysub1oVrNt7dCevcsEjKilGJb5DRfodvU
	bua80yrI4R+DetvPIOFTzdHh6XlF/kf6YO7eLQIxLirqKnextZI8PyW/cyovM7lss6bPLOmUUJa
	Imo6Q+X6kVSZvLO7H0y73XlaE8Ng58/GIra8ZrhjMseH0FJCSY5BRBUprlj5iQ/b4uhmPrWY0VA
	CVAHuMX9R38nflH7ON3QH4KZn1q877VZT0W3iPHHTTKYdoqkRI=
X-Received: by 2002:a17:903:1ae3:b0:2e2:d77b:e587 with SMTP id d9443c01a7336-2e842cd4484mr116125665ad.18.1791858711577;
        Mon, 12 Oct 2026 19:31:51 -0700 (PDT)
Received: from ryu.remote.fontis.id.au ([2403:5814:a404:0:cbc1:7a8e:f385:c576])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219efbasm49079865ad.19.2026.10.12.19.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:31:50 -0700 (PDT)
From: Lloyd Hazlett <lloyd.hazlett@gmail.com>
To: Ramshouriesh <rshouriesh@gmail.com>
Cc: Lloyd Hazlett <lloyd.hazlett@gmail.com>,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/9] arm64: dts: qcom: x1-asus-zenbook-a14: Add on OV02C10 RGB sensor on CSIPHY4
Date: Tue, 13 Oct 2026 13:31:32 +1100
Message-ID: <20261013023141.436980-1-lloyd.hazlett@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610-a14-himax-hm1092-v1-1-0c9907da47ed@gmail.com>
References: <20260610-a14-himax-hm1092-v1-1-0c9907da47ed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For whenever this comes back: it also works on the X1E80100 variant of
this machine, a UX3407RA, which shares this dtsi with the X1P42100 one
you tested on.

I rebased it onto v7 of "arm64: dts: qcom: Add x1e/Hamoa camera DTSI",
since the ports rework there means the endpoints as posted no longer
apply. In that form the graph links end to end:

  ov02c10 11-0036 -> msm_csiphy4 -> msm_csid0 -> msm_vfe0_rdi0 -> msm_vfe0_video0

carrying SGRBG10_1X10/1928x1092, with libcamera capturing continuously at
28-32 fps through the software ISP and producing correctly exposed frames
rather than blank ones.

Beyond moving the endpoints onto the ports that series declares, dropping
phy-type and following the vdda-0p8 to vdda-0p9 rename, one thing looked like
it might be worth changing: the pm8010 block declares vdd-l7-supply while
instantiating no LDO 7, so nothing consumes it. I dropped it and the sensor
still comes up.

Happy to send the rebase if that saves you anything when the prerequisites
land. Claude (opus-5) was used for the rebase and for running the tests above.

Tested-by: Lloyd Hazlett <lloyd.hazlett@gmail.com>
