Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A77829B200
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 21:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783112658; cv=none; b=adpJPKcOjFLFPNS1cjlYRPU1AMtgbAavlCjKDlU9CU0kRctGFTFgImkT8C2P6RQ4rZYCmZ9qhc3oLgWme3Vt3BbZoPjJWZr88P+kAywlTC8jrl+Q1OC7wUyotBnIktFY84gaD4FbWT99WlXHgPtuBwBvFY0TBkRLhC2DJqW174M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783112658; c=relaxed/simple;
	bh=057Zy9OBNEVAmmErkRANAIhVeUwl/UkARFKpq+4xQ5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ri+IaEWpGwmMt0Zzr0g/DAR+WYECuNwIlto010DiXJlXeonZED1lEicnLxpmK6t3J4H7QQ4Bs10X0O743/AEURTMalzhV9M1QWdfAiLFFzEWgQcO11NPHNy5+XFiFJe5aa26m8UkBRfUv/B+EQHlyvm1n4MEOTXua+UySMcal+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVPZG9WZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVPZG9WZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239131F01558
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 21:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783112657;
	bh=057Zy9OBNEVAmmErkRANAIhVeUwl/UkARFKpq+4xQ5c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mVPZG9WZWetiuUBQBQcNKKAVmZqIdOPlkulglymkdujUkySjI5GzGt05vOJ0HuIK/
	 h8WmGozV76kUvSzOPgDE0V7wzFDe/RKMOLQ10Jc37DosdcnEBPUoLl0javX5eRWm5k
	 I44FfYvnvOwVUzBDxeRTTUu12IqYD3IDOyAPZtIMURyInQ3WipdncvIa3gDpKMduQ1
	 TTHD5E3Xw8bRMgXmr9DYligCt/h3E03ZAubyHVZmJIgsjZyx3ZXYvR7VJOlRqXnI8x
	 2uRKThWhM5rz4YZuAbefx1vfNCuD02NZob/JzwXuvzj8Z/YN1GWkBTUWl1NvvNJ0tm
	 te6KdL94iPkww==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aebd52488cso1067282e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 14:04:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp7oNX5thRGConU3EwJb5ougLEVTnZdmFjN7/7daeArSF9xA8TnnuNeNOB8cfAQZlPQlJCbkIBPBOeuYW8x@vger.kernel.org
X-Gm-Message-State: AOJu0YwbCLDb/zk/RhnSGSzjSaoyb20xotjm0UZ9l3E0cIdoDTV0ocdM
	mJuoAMvHCRc1j1eO1hH472dYNAUtpsjtn9yETKiiLn7kX2Ryg9hAfJIb5JLDclhPhsg3qDVCGFz
	8/uq+TmdURS0+JEjyPbRveLBoZZV/QN8=
X-Received: by 2002:a05:6512:244:b0:5ae:b764:3ba5 with SMTP id
 2adb3069b0e04-5aed50bf5cbmr58705e87.64.1783112655874; Fri, 03 Jul 2026
 14:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
In-Reply-To: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 23:04:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLnmyZauNi11xdPYUXZMA+X_Ztg6TNxkKrK+ATZTP=W7_w@mail.gmail.com>
X-Gm-Features: AVVi8CfrQpkfG73YJB3yBFkLAI4xFHb3eiNzbFOQ7XgJ7pxmuRx31N4Mgw7eoz4
Message-ID: <CAD++jLnmyZauNi11xdPYUXZMA+X_Ztg6TNxkKrK+ATZTP=W7_w@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] pinctrl: qcom: Add Eliza LPASS LPI support
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com, 
	ajay.nandam@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Ravi,

we are in a bit of maintainer transition for Qcom stuff,
Bartosz will apply and coordinate qcom pin control
patches!

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
