Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105450;
	b=DNT12P0KVlPfCZctBu4foKuu5lG6N/1HwEG93oyIMapMHPzTvQpsEPFoh62a0GHG87r/
	 lLxlsLj8O1VERVm+rBqgcr56Jrw0JGq7HPz41lHlJligTvYcUeNhc2MYhCdPi4YBIjmRy
	 R4bINSlaEhcdV2jALl/5UiM7+PNBQ//PwQMRKTC4tj9B9ZDrlgJNW5X6DaPqB7/X5GAVi
	 scWSS8N/Dkx/j1Bd9sBwi/yF32M4N0b616xsXNW1Fb1qtLGknnztFSVj9UrUCuBjomof3
	 JMKsIlgrRF946gH1K5fPcYCyJjXUo7WxMRQKdTpMm8xxfxhOs9bBhCv4zZL/fBc0N6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105450;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=AkMiUephLKiNzveQJzwmn2T0m49/fLiQwWfrZq9JTIo=;
	b=VNuyy1DSbpS2FlfcetWlumoJ3QH3qY9mHUobSLCC/tcgdHVyr1PN7H1O44kBpHb/JHgY
	 GCzy97+UoDWHqFmVoypKouBGRqHis1J5I1nm0+4qk1U8FxSO43qjnRTzTxcwg8kk6Nd3G
	 GBIGFuJKpTlAG2CQVNQr/bWC1trOe3WlrQIkuNthAmM3gpcXeHcPMSvCrOii4QVmlce4Z
	 pjInL5uDmKtif+51lE1RAKX+tC82utJTFLSmCKDzP8bIgZD85py8WcNXvEpn4aulOflc/
	 UHtCD2qQBMs+qqFuCq9t+ezJBVgk66kq+hhAjyrO9fsdqxKM6pzhYCaaXj6a/xNi8kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WMO2BvPX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AD460A2602;
	Thu, 19 Nov 2026 16:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WMO2BvPX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68CC1F000CD;
	Thu, 19 Nov 2026 16:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795105449;
	bh=AkMiUephLKiNzveQJzwmn2T0m49/fLiQwWfrZq9JTIo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WMO2BvPX7k/e/g7h1btHiqwMzI1UhlU5fjLKU1hpdQZHttOIMzTRqQ79XVYhX8wop
	 iBNeBK6hlkB+TomsNBJyxa5xEWUbmGIhfyReSPrpMhB13SHEPzNbPLakKKGgK0i6U7
	 weZR0m2SQuxdHxLGZcQR4VWfjy4VMIBhnZzTxoOc4oKxc2au4Bj6Mpkvu11LEKIobd
	 T68bDZnwGxyjg63vi607brAd2HmFbRqCCAasq9VfVU4WR8cwwd2CRP2letuGBI69Fr
	 Sc40pdHAkQVJHwDuCNNpW6MS7SWh1Em9PqeTV3vw47jtTQ3jaxroGUZHg0dLqD6JuY
	 2OlHstHLeRUZA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-topic-usb3_sequence-v1-0-5b144f5e6865@oss.qualcomm.com>
References: <20261102-topic-usb3_sequence-v1-0-5b144f5e6865@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] Patch up sc8280xp/Glymur USB3 PHY sequences
Message-Id: <179510544737.1370333.1438032186611624937.b4-ty@kernel.org>
Date: Thu, 19 Nov 2026 21:54:07 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 02 Nov 2026 14:58:35 +0100, Konrad Dybcio wrote:
> Bring them in line with docs.
> 
> 

Applied, thanks!

[1/2] phy: qcom: qmp-combo: Update Glymur USB3 settings
      commit: 968edd3d8d6565f88b2d95cb68a655bdcc6435fe
[2/2] phy: qcom: qmp-combo: Update SC8280XP USB3 PCS settings
      commit: 27a01a3ba61465a3638ee640255e4706ce4480c2

Best regards,
-- 
~Vinod


