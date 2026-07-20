Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E44E3F1AD2;
	Mon, 20 Jul 2026 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547383; cv=none; b=sR79sHvQlmsKfRuBvu7dGftSkynUnUXZwubVre+kXjoejyRxfNBYK9AJrPyA3aazFGaISw1ctCY2PGQwXJ/UJ1KNCVYRKs1Mr94nq1M6JnRTsqvwDrcwxf0oKEjBtgVQQwoSmh2lexG+2NOnqDd47bxcy+MTNbhZTAJgiBgBbwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547383; c=relaxed/simple;
	bh=9mBfOdob+PKzwbU9SU0CAkVtZZqEaSSYhUXx8aJrJ4A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e3wzr1sE6ikHVSt/PTOjmTQpqM9gnXps62jkIKUPT/w3kfW+6qHA8rpCvB6WdMdP04lLVhkS+c12D+j6eVmt5eYKrXoB3S2wp9UiXeD3JH697y5boHeT0d7t8dgjQjCXXWs9YB5x4N1sWt8ez8Sn+hUa4OK3DS8vc1Eukdra7Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dg8r5VsT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dg8r5VsT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3D31F000E9;
	Mon, 20 Jul 2026 11:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784547382;
	bh=XIrLylyI5xB2fcWFkGOAHp4UIQ1ri6DLaLYeEPpg4QY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dg8r5VsTmWzIA9UmyzNahI7HXu1N5N2ItZcPRr3R8dci2rDnsMld48iY3xLzvJbbN
	 PPDuflxMm4HL4y4/Ea+iAx7+tkeZ6pc9PaLeEt1TGpfQRuaDyUXOfZMCKhHtZAVIxU
	 eHLKibIQI0kapnjgRcaVlEiU98yVgw/d2V2XLl66FNUVbwUsnyjqrSMFcH5JnhqHua
	 SeuR4RFp/LKwApFrsXBhZoa3MdU3OsraTyzVPvKw18xh6Fbk9qCy1noI7Yt0g66QdG
	 HA8xJ25szCi0RAh6kWeL7s0i8pX2PhGcatafA5OJr9DX6wYyx+H+0ZJXsPlyaHVJYX
	 cgTgFrhKBM3ZQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Melody Olvera <melody.olvera@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260718-m31-eusb2-fix-v1-1-8588a1b94d76@oss.qualcomm.com>
References: <20260718-m31-eusb2-fix-v1-1-8588a1b94d76@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qcom: m31-eusb2: Fix return value of init call
Message-Id: <178454737966.1375859.9151386869031370240.b4-ty@kernel.org>
Date: Mon, 20 Jul 2026 17:06:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sat, 18 Jul 2026 15:01:31 +0530, Krishna Kurapati wrote:
> The init call currently returns success irrespective of any failures
> during repeater init or clock enablement. Return appropriate error value
> in the init call failure path.
> 
> 

Applied, thanks!

[1/1] phy: qcom: m31-eusb2: Fix return value of init call
      commit: 361f533a2dce2c2841fe4dc0c9d85a67117edf95

Best regards,
-- 
~Vinod


