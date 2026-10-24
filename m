Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810955;
	b=KrK8/C862wUaBywwzyi4D3PF9Yli0w9RELdQrO48DcJa7JXh96ycjJyh1nwMjtiLx9Iu
	 zHI1xop5Q6YLQZZPAqgC3jxxYRUIKvCO/pisgClt/gjOtpc4mNMBFKXP+DIZf93KraRvX
	 MbZLdlvOadASUijeh0tJ1V4W8wQiDOzF40Pi+Lf7wPtN0a9jUOCSFG+RMIHkt3tXFhakt
	 ivh7PBEP2Tp9XsD4OcFW0Ks6zHhvsp7IB4/pBynkbgSSLDjnb6dauREplVivQeqTd2md3
	 pr3yVMllEhixHukh2ENaGf8UXTN9DT5BWSufEb8Ys5+hcX+h/zE8WaIwMIYb3pDBLJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KzYwebK8+EyE5IOADDn5pE86fQ/miF+9X0GS6d/yof0=;
	b=fbfVp2orVL2kROtVLq0PtH5UNVT20P26Xl9CCRRLKpzwxe46ViQukv3QXvnQKxeHjKNr
	 D0M+35QiBUTv3AK+tcAs8mKqI9gEubh6rhtqfGkRA7YogXQtwVd5cS0PaRtgAnerTQfos
	 Tg1wcYO71r2Onb7Wwz2sepwo8vWzwSaH8NMkOO63/dtywFWj15Dbbl1mbDEvG1m5NRJiA
	 37pBPrkaRbWxrk+7AS2VTOJqrxTnPkEyeAa7aTXxzkPKE78IIYQfZBPzTtRcnsomF4lO1
	 0KlGRFtGLNPgvzxlqE8yvgZELaSBb9kjWQtqsrnARYTm2md+bu85BH6E4ldSuJpYRkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d5wAdJ+R;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4641A60A3835
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4641A60A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d5wAdJ+R
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-705cb6cedd5so1682027eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 20:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810954; x=1793415754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KzYwebK8+EyE5IOADDn5pE86fQ/miF+9X0GS6d/yof0=;
        b=d5wAdJ+RfNF1EyTdmthoWEg6TVOWu02H01kjTeboWpUGczhSApApGCf/E98LyDanIX
         Ru3skHjW04y/QED6Rlca81V+Qu+GdJncH0AZPRauVMXQa48S8S1wVdKCMl1tqHUXaEjr
         dtd7LaRWSTyHeBWjY17bMKE9Zrdph/9x5/wUhTIbNPKmV1VabuD/AaY0KzIZcmtjcCxq
         zR164Remv9MO/z4w4os8wUPu2kV4ezzXAb8BMrujXP9XKoCPS/sDU8a5AEvI+OEIuiFV
         NJVDlbIDwXLcKveoj+xyYN/Za7D+7JMiNuWn1VHw8JF08H12Oj1L5yEQ6KMCUtJDc+6w
         vyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810954; x=1793415754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KzYwebK8+EyE5IOADDn5pE86fQ/miF+9X0GS6d/yof0=;
        b=EMklipJ3T7YNOA2myheUrZEIsScEnIhI3UYHJHMm2q8uGfFbdTTxzlrUlC3YYcJy9r
         ke3Vzr3396mKKpLWCmao81d9SdQG+QLNGQJo1i/zS3OMvx3M1lgqv+cXf9D5jlpvHPZJ
         hOrM8OhuYTPzBzDCr8S+Oo3odH9i4LMjS2Ig5thZ8zD1h6eE8LuONL2vZ4yaExo9ppTN
         xXSt9zCAkq4VaCl1Bm44UPcBPkmxCakaiDoCfD8FBhdHurMQwDL8jq7fOA/V69qRkdz8
         /Kejl5IbzM8AWEyw5gid14a0//om6OrSN59+WSzdS+VVmdJisNu3U+Tw/TUxA83Q9jRG
         Tggg==
X-Forwarded-Encrypted: i=1; AKwUvBwHNjXdtKrLpvz7H9CPtBa3d9g55GyW1mqcK1QKqaDVTS+XXMm/IYlgo0Ar6MV7u1EcupXzmuCJIyc4dSFq@vger.kernel.org
X-Gm-Message-State: AFq9FYKhVATDlMe7VjU64M45mLLEMqEZEMP9qII/o7Rvzwy+7OBTCTzE
	jduvk3OJWys6qEe6tsyJ1gkkntilIgqYgOrb4sVovnrFLveH9+0ywCb4
X-Gm-Gg: AYBFou2K98by1qRytbCVLQqabKrZAHCbFPf++3lFwprf4lVh99wLUfQGW5MW6nd7Dx+
	s2My/dHFq9s91HX723AJLKmNoxtBViHOg3NZn2X+PfM0gjHTVUnm4+4wUMDYfyPjrn11twcKfCs
	vecbBrkSiB2DzKngTY9LCWQSVyYzKoLVRgKgoq8ChjSX5TGaTQjTgU/iEWqsyNP9oLeB87aGkA0
	kunFI1JAqJKzGv+hdzSPDUcZp982vImjq4a98NFXV1hkOMaT3scHDC/9HyvZP4MwGshU5oOl69i
	vaNGUsRTb9rrMGu23vsg2bBpp/bTPWNQrLzVDqaFBvEtCDYoq4FzScxc0eMkKRGX+MrAtYeejxC
	J9ynn+dKUadNBsY4qJZHgTtOQwtA2lraKVatnoOsy3+kNGMYL2eg7avfJGs7w+HWJfmZJCj79Rv
	XKg1ZtfrTFeUL/qY8Vf37csiv6W8TL+OnYshohxjnHEFFL203TnG1yNx5L0sFMSb5XDr2ACKplM
	bc+3+ajgLSNRaLOIYBgLW6g1go5DBS0NtjJKY8Qk76/TaRh9YsvCUgKpNwS4jXq50St8LFVusVV
	+Pd+
X-Received: by 2002:a05:6820:5611:b0:6cd:3fdc:2669 with SMTP id 006d021491bc7-70ba14bc3bbmr133916eaf.42.1792810954300;
        Fri, 23 Oct 2026 20:02:34 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:33 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v5 10/11] phy: qualcomm: qmp-combo: Fix Glymur v8 DP PHY init and configure sequences
Date: Fri, 23 Oct 2026 22:01:35 -0500
Message-ID: <20261024030142.13643-12-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-10-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-10-3848c2615d5a@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 01 Oct 2026 15:04:27 +0530, Nabige Aala wrote:
> Update qmp_v8_dp_aux_init():
> - Add CLK_FWD_CONFIG_1 initialization (0x3f) before power-down control
> - Replace PSR_PWRDN with LANE_0_1_PWRDN and LANE_2_3_PWRDN in PD_CTL
>   to correctly power down the data lanes
> - Correct BIAS_EN_CLKBUFLR_EN value from 0x1c to 0x17
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
