Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776741;
	b=YCRQ2EJrhh5ryGRlkTi9i8iMGDR6zeE98trx0IUV8SBc2CH4sli1yM4/9HIC3OTk8cFo
	 EdxTbIWpXCFFQRfqyIgxYCUFRARlio5EejlX60PtW3VYqUwEoBkLyiGIjTW4sP0zNdUUr
	 vIJIpYEQbvmyMku4XRnANiNSpot+UETxFGx8NYZBCvdtTf1EmYvgZpPlOvNs1r0y+oK3f
	 mNTxDPBdFfA1SpuvL5TIrOK/ywYn4972BKAJeocw8/tXTpiiy13w9oZMLQAgDvoa1hY+N
	 fC2T9IRUpZ0m1obxt1bbFK7MKO7xn8xwbJSoqzuFTS1BhuO2zmZxkUCqpck9SP4GmUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776741;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5uqGsLlrlwUDzRKxFJbZUkdA9wKU+IqOkrf3/Zut9EY=;
	b=G0NUC6fQorOCw8BlqgFDD4Sx7zViC6stcTJobXQRbOOV/dZEv4d7DJbRKvNhOQjZostu
	 X91Clr9kduq4xxdacJVwng1MA/BVpjYr5d9VTx01iNe5elsjjXGuraVVjEZ6Ej4+Duw0A
	 O32le/FWwBJ88qF5rs/ra8xwZ0ncv9I0Xk7MAdJvs0UaoxHW6xV3BzilQcTvH5MRHWUAI
	 JhwmTervWAqBJv+Fny0tWOQOKi55wqXaOQ0O22Wv0CFoQqH7/JNthb7ye6qL/Gos5+Jic
	 KIUXSEqAtLWqys+nwLAZ1C6JxVQAQ7V8TNwW4yfFB9iiu91TyQS3mGyzcFE3gwi1bsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cbRRqBzB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F164C606A31E;
	Fri, 27 Nov 2026 10:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cbRRqBzB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED36A1F00897;
	Fri, 27 Nov 2026 10:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795776740;
	bh=5uqGsLlrlwUDzRKxFJbZUkdA9wKU+IqOkrf3/Zut9EY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=cbRRqBzBY5ufG6mtrQYHRRNNGyFkmjOfwaui0shhprwKOCrBTEJMDSZgq3pGuO8Il
	 RV4G9Cml5mGnSUvqaRuuBgDlYY5Pp79f2wM/s6uv7xgS00VPmEqbjvbBXEamq9/fJ+
	 +9O9tnLEfs5coGG9vLMhmVo8kAuGLF3SfU3IPnR/vjBDlZnNzt8zd+16owp38JeQd6
	 chGihxVlOLEAISMX508vZ6zi9TuDK3leIj9uewG0LS8EtRUUHi03LYgtmpTQI/rRPb
	 jB7uN9JHNohBiJbTPlbv5372l0IvxwwuJm7bW5mXsbidK7jVNdZSEUcGmiCNWcie6/
	 1fpdmUDY4mDGA==
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
Subject: Re: [PATCH] phy: qcom: m31-eusb2: Add register XCFGI_199_192 for
 HS disconnect mask
From: Manivannan Sadhasivam <mani@kernel.org>
To: Tapas Rana <tapas.rana@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
 Elson Serrao <elson.serrao@oss.qualcomm.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Prashanth K <prashanth.k@oss.qualcomm.com>, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261118143406.2351999-1-tapas.rana@oss.qualcomm.com>
References: <20261118143406.2351999-1-tapas.rana@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 16:22:12 +0530
Message-Id: <179577673235.3421.1721263701456802634.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1704; i=mani@kernel.org;
 h=from:subject:message-id; bh=KBT8BudfEJpceNaiUFJ6IcLShzuFCfyqnnOBPcmdHQk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCWDf/I9KM05kK5oiq4cSz5d4si1hUg5I5bB4E
 ZZwI1gDu5OJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawlg3wAKCRBVnxHm/pHO
 9bhLCACkeGRAUyRrycT7RAm/y2qtjPL+VLWKRDre18OW4TbeI9KGssHvugv+mH1AYIq7EXBc71k
 OAUMzQ4Su4NTC0s57irUtAExvWbAhT4mIKhDMxClq1cp0uM6o+Ejz4EFnuRk4zs59SXev+iGZVr
 R4Le9xafI76ibskqwcJ9V3fWM7TOA2D2ABBmrhIYaUZsLoic7E8Rvw5w8iy87DR4waLRgZZPp66
 fgRq7OfxzVWSomroBqhM5HzwVLofAeKmPqj8v8S9sV1YaZcJ+2SRMhUAW6UM6l/02NaBOyi6Cp8
 5vn/NKCwn3QbBEFwTW99+H3/6VdZDW2h7TIUb1zlOuKCrZxs
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-18 20:04 +0530, Tapas Rana wrote:
> In USB 2.0 High-Speed, a device disconnect is detected by the host PHY's
> analog HS disconnect envelope detector: it watches the differential line
> amplitude and flags a disconnect when the amplitude exceeds a threshold
> during the bus idle/EOP window (a disconnected cable reflects the host's
> own drive back, roughly doubling the observed amplitude).
> 
> While the host itself is transmitting, the line is already driven hard,
> and trace reflections / signal-integrity overshoot can momentarily push
> the measured amplitude above that threshold even though the device is
> still attached. With the detector honoured during TX, the M31 PHY latches
> a spurious HS disconnect mid-transfer, showing up as false
> disconnect/reconnect events, re-enumeration and transfer stalls under
> host-TX-heavy load (e.g. bulk OUT to mass storage). The failure is
> signal-integrity dependent, so it is intermittent and board/cable
> specific.
> 
> Program the XCFGI_199_192 register to set XCFG_HS_DISCONNECT_EN_TX
> (bit 196), which makes the PHY ignore the host disconnect status while in
> TX mode; disconnect detection continues to work normally when the host is
> not transmitting, which is when a real disconnect must be observed. This
> register was not programmed previously, leaving the envelope detector
> active during TX. Add this bit to the reset sequence to suppress the
> spurious TX-time disconnects.
> 
> Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
> Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


