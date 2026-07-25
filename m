Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067F223BCF7
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784983624; cv=pass; b=P5SXcwlzMNDiWq7SnzdhzaXxkgSxXF9pleaAxHWSlbDMKy/xPvDcgmdO/Xg4+wjCpKuffTnDGacjaJp8LyPac7bcBUHMhjJyyCR3Zcq/v3y6tVLYAIu0O6Crfg/LbTlMpmQtr9EQ1EsmQjHsTEOfREQzjYXzF4hDxhi8E0ifE2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784983624; c=relaxed/simple;
	bh=OvrNT+93qZFUenq04qZyqRBg/XnwRXOAV++TlHjqWj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDE3UqnREo9mC/YeUI9PrxpTerExWzdKGMWr9y+Gk/UesgGfW0BNKEaxAYBPcjHzZgkZatSIWDlAmzwG/AReDK9XacfRSmg7r9YonCnFTUCzMlzbMUKCFvhsLkwATFhhsf7Y7SAqtMx8GJEtmYYU59i/mo+wXQI1xVHrW9XltiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=VDSZ/t6G; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="VDSZ/t6G"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so905890a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 05:47:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784983622; cv=none;
        d=google.com; s=arc-20260327;
        b=N0bTD/Edt5Y6Gb2dL+XnORT+duV1k7WgTMM/fen+27cDyv40awSR+VyEHIDGnV2LjI
         HXSJEaXJCU/RzVi3facOJ7vBvo+NUyn9+doQJ1YJhpnaSPIuu6xKBBJ5NKwPzlUX/2SG
         4/08k+WNFC4H//KhNCUi9AcKfY9OPOjf4+VCiLwVeRGNRqeokd5PwHz3ONC7ZSNO8JWw
         4Ou/2G7Qp8JOT17BOdg2p2KL8Ji2l81KrysWTaQ8TMs+DwTjlpPDazj8GIyAtPUsOJ8d
         kV4/TN2gyq7A44cyVcY9GsFloCLJjowlUjIFXzQTdHKvOIaaanGS8Icq2R+97zGTDQHl
         88Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SABMkpCvnpZQFfCqjkujdH0sHrHtEaNsZiUpRammpMY=;
        fh=WAOylv2E5N5yFZRjJel7RUB/Ls8xYszWZS3zRKeWx+M=;
        b=pKHq+p2ZrMAxXPCWXiZGl3ylcCCPkmAYrWIqRk7fzrDKsOe5m4Bjw/CQBZjZnk7lqL
         xv5sAJUOufN1cn/OyYqToE5eyeiovZuliRbEuwv8XpH3Bvi1rWislPVd8Q3q/ZPOz/QC
         330V7737TWQY7/29LkhUjxrnnqZr1cH0QnVu1Q0SZUoN/SuBl4v07AGZC0sD5Av71xwu
         oWkgtcExjoyJEvUFZW9g9cx3Cb77XpJB5ouZEVVDu7vJJ2iFhn/ONM+x2pwExDfFkM51
         uIrDG6wTAvb7BsyioTylOFKTD0tEa6IO6VuXMfzUpsYFuScyuG/u/bU1uTOJGPT3tzbU
         OWMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1784983622; x=1785588422; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SABMkpCvnpZQFfCqjkujdH0sHrHtEaNsZiUpRammpMY=;
        b=VDSZ/t6GfsDy310tFkkEXjR/iFq9qAkdkm81dNdcrTPYS/NwS7jGhBzDmc2oNjFKYf
         Op0k+/wMSeABxhExD5CvZntxJ/pDTEAKghPjrO9BYzCktmj9WF5Ae0rgIFuGvbK6BbSa
         FnkGQ+acFaoUX0owBowE3Pn7jgYDwsRMReq1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784983622; x=1785588422;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SABMkpCvnpZQFfCqjkujdH0sHrHtEaNsZiUpRammpMY=;
        b=Tgc1PH9fUI7shFU0V5Wti8zIt0e8cTQstj60TLMKkTdht6wDa7jS6NYwjYTfB1VyIB
         j/L5JuVhfjk//Rh/cyoYHaBd9QmmDDSlxphgp8X+tIfgwMaXndUNgIzurA/fk5oDih91
         RLlF6aHDpszlgAsouTJPfzPdC/nP2QDOVVS3GhdDPyAdS5lSjWU3C8La1IE5QEcg/qu0
         rDgPWGwZHsyO9Qlqqs92FsW+eQ52QWokt4Tts/V/+NG9v2MuIsWUTAALjZbx/qPAhWdk
         p5V3cxAQEdR0uilFKsUCqy2df2D6+Dd3sUeU21E2IX24aMl/OZfxj072T8AMMzYq+Q5V
         8KoQ==
X-Forwarded-Encrypted: i=1; AHgh+RrrUK2fRUWhlfbWKGUpVIfBoIOI+MJkLWxqqlDXGgVUMjpu8xfBYxPVLsPHVyirXdTTaSCtS7dJIp8II8QY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2vFuxn2evWxKe4FmqxHGo455RELs/uAAR3aDSTX6SuhuibFID
	C4dG9sUazFsPED676pfCuGbt1N/Rb0Sa8oAMI2uX2txrUg3tgjgc4y2/9XF1OUjjM1tqbGqm2CW
	KExElmXGVdMtF8iXPJYph/9jluKhK6OP9HuACeRn5mbo6j4n+P1dYbWJhLQ==
X-Gm-Gg: AR+sD12sknZ/0sWGl6FeqPyWbDjb82y826Xv29rrOJRbG97/dPcW5peK5pkc5RMcwis
	4NWdauT3uxqNZIWsN5ePTG6dmEwDvhhTarFoBFUkyvgxhSkMIgGAM3ysT7jwjsLCRqumsnp68AJ
	kt8D+h+aNdpwektj2nOutxJbuYcxCh2sb7fdMUSx+3I2ZeFoa8XxrCZh4/NmGcqFQhk7dyw0Xbx
	MRWxPGyp4PmmdQcxTQYYKZjoDprZgD4Lnzt1hRjkymFlZyLrGXv0RFpQA9oB67cHHl3AIe91qr1
	s4yyFGVthtMC0Ii7bAGjH6eLVW5SChlPLh6kjFwMwqksOrRyaJk7jfKzufRR10WOsr/7fK4odsN
	Juf8Bnw0idnmchmuo2rVmHb+6SzejnHI3/8dhvIxRiG9yEIbz8e+dF3qf4Lsea9XobtQLmqLsnx
	9kQdB4xTBrMTNtUF1VQxsK8zabHHtIror6a7cmHDykBmdtd0eDXZQydKZv6fs=
X-Received: by 2002:a05:6a21:918c:b0:3c3:8ce8:1fd with SMTP id
 adf61e73a8af0-3c67e0821cbmr2043147637.73.1784983622294; Sat, 25 Jul 2026
 05:47:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Sat, 25 Jul 2026 20:46:50 +0800
X-Gm-Features: AUfX_myLwI7kMfc-XbFzlYvC_Qj91PEJsD-glXmxVIjHTMm2QKWFeYyYEBStVBk
Message-ID: <CAMVG2st=wGNYF0AbqRqadVqJL6x_F8G2u6BJd6VOweQ0nNebKg@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] arm64: dts: qcom: Add x1e/Hamoa camera DTSI
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Christopher Obbard <christopher.obbard@linaro.org>, 
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 08:44, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
> Changes in v4:
> - Implements agreed port/endpoint bindings in CSIPHY series
> - Depends-on: https://lore.kernel.org/r/20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org
> - Depends-on: https://lore.kernel.org/r/20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org
> - Link to v3: https://lore.kernel.org/r/20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org

Superb work Bryan! This works for me on 7.2.0-rc4 with 'qcam'. I
support integrating this dependency into 7.2-rc to reduce complexity
later.

Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100

Dan
-- 
Daniel J Blueman
