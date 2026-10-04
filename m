Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F9B240611
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Oct 2026 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791106497; cv=none; b=LNRx8ae17669XRi72SydpX4O62GZUzJF+TYRHVdTh3XYzpkZKZE8FL1gO5H/GfinGTZl9tC91NlkJi1NgOKdKT+y2jqtXZEOiGoMaalpT0I9i5nPwaTdmQysvsds15ZtuJHwtZWYb0DSj9hmpF1nCJK7SJ6JTSCHVCrkUliBT6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791106497; c=relaxed/simple;
	bh=WGiqPu03Hx9bYtodW4R+dJT8EyhvwKq/2ya9h1+2Mt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aY19L7pWt0vN21Ajn2bC64mgCkxm3BcaYecZ+jI1zpvUDv+Hg37bX5lLyCn7naAVW8mCotuObyu0W4lCiA28LJ/1oYocHnOE3GGQyHm4vCueR+2bzeqZWLpUEEJ47r7hYpwqUBoeTOnLCp5B72tx0jtEWW5+cf64d3GoLHUgcFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nd3XCK01; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nd3XCK01"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-86aecf49833so101509b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 02:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791106492; x=1791711292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMFsAlTkgLQleDkb6BgHggPAQsd5lT/CEjafnTCRCdw=;
        b=nd3XCK01dCMPey50rbwtI+hfsRKQWrAmJLFbL+YCGlh9J4LvT1xLjAefoNbN81Yhjs
         5kyxhh+GS8gOijFjCa1/HyAtWT+fnf6lb7VveTGyTT1CkAsHzmX6fCowEuK1a89BPoaX
         aTA9o3yFwdWTlIttPZZ2XM/IOsSrvYRlVRbO+vcxjXH2rHqhZ2q1sL25f5U+iRyfLtoe
         ZLsyQ/PSy/MS0deM2orWCsuNhJTa1yMDhkzCzOIIpiJoSdcsAzbR2zhj6FABW5XOKmd9
         Mr/gFTSKPMMDd11rHm3V/K37qBZBy0i3xD6BKVuEvUYwwg9/NJUHMrk99sjI/pXdLdI8
         7uVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791106492; x=1791711292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xMFsAlTkgLQleDkb6BgHggPAQsd5lT/CEjafnTCRCdw=;
        b=0OqLn+oB8yFYCwUyjbfE0g/IIWoj5WPnvF0r14BQ7Ra+U2Uv9kkH8cKMQZX00O/Dai
         Yv/u8vUhpcWQALXAAzv71xCkrjiKa4PB6y0AHZrlNSHuuHnIkRkHk7XaR8d0wgV69VQQ
         /d0Pwjs+5S0Kn4z4t5ATArLhCettI1G/LQXm4NlvOFdlpYo0fUXa+P0iu0lljNIJOXJs
         tMxWhqt/gr2X98MkCfPnVnZl4+HtAZS8L5jNd65YGbbs9rcZ0EJLL8sS2sQ/IZU1X+7j
         204deRy4lO3v/vc1dpT3Qli/Qx27BflSPes7uAivOqHULrZ8emR4KVIyParRAjUQbr2Q
         ih+g==
X-Forwarded-Encrypted: i=1; AKwUvBzRgg23HTATXVOPBohwW6tbSvkjmPggfQNa2LiZXPpT1eBIXeBqE6dt3eDncCUpRqDy9girJLhciN7FW1yM@vger.kernel.org
X-Gm-Message-State: AFuF++mcH6F7FY1Jp6EWjP5aVFHITNiT7YX2jHnrXX7GJ6NDrn9TnISN
	KJf8Sv4T7gSFQLThpZTMAgnwvo4ApDfHk/rkiq423gTGHSlSY8DUqOJQ
X-Gm-Gg: AYBFou1liLAAOG/JQxCWQSt8vBia1e6UTavnNeOTSdiFtxRNWX7mKLJLfM/P4EryoX7
	MZF/nQr/tiQgaJGopDBL7PQd7yJOQhyP4MVXUj5wmFkVD0T//5uUWlRAcupUeewtc5eF83MuP13
	P4PSWYh5Lls5vFMmKKL35cBQQr9EEwONxlMJOVTjt1lI2Q7AILnzR8UTrW8MpRKuQWAOiAJIasy
	7evMEM9Mrfo2wgaOWagjYJ4b2j9GBI0BSsSGGc7SB742gIneTD3iZ7pRegcryGkP4ne5gqe2v++
	KY5p2kZV90Tzl1U3FxZtODXenbmxMwG5Rj8ySdpdR0lhtHaBzL4YNo4f7OfP9BcKOLLuQNJCsaN
	VExtH/I8J+sn3uiQZtE6FSCn6+/je1g+Xf2sjBz1esgW/9i4adHpuOkG3vSsMCVfI0AW9aId72J
	jLORjPC57MoO8zkZSy7aK+SeYaJk5M3Q61mxPFd5BKgBi6QcAvknSim55NItSsZTZGPSiOTlAzi
	0axqmMoWO8OCg==
X-Received: by 2002:a05:6a00:2d92:b0:882:4cdd:140e with SMTP id d2e1a72fcca58-887fd634a7fmr6960101b3a.15.1791106491984;
        Sun, 04 Oct 2026 02:34:51 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88d62aaf2f8sm620337b3a.10.2026.10.04.02.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:34:51 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/5] Modify interrupt handling for eUSB2 Phy targets
Date: Sun,  4 Oct 2026 18:34:49 +0900
Message-ID: <20261004093449.74244-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Sep 13, 2026 at 08:10:43PM +0530, Krishna Kurapati wrote:
> Changes pushed on top of usb-next branch. And v8 is only compile tested.

I ran v8 on a Lenovo Legion Tab Y700 Gen 5 (Kaanapali, M31 eUSB2 PHY),
v7.3-rc4 plus board patches. Host mode, wakeup enabled, s2idle:

 - hub with a FS keyboard behind it: no early wakeup in 10 RTC-timed
   cycles, and a key press wakes the system (dm_hs_phy_irq). Without
   the series it woke up right after entering suspend (dp_hs_phy_irq).
 - FS keyboard directly on the port: a key press wakes the system.
 - unplugging the hub during suspend wakes the system.
 - wakeup disabled: no change from before.
 - low speed: not tested, I have no LS device.

Only the m31 and dwc3-qcom parts were exercised; the snps-eusb2 change
was only built.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Legion Tab Y700 Gen 5 (Kaanapali, M31 eUSB2 PHY)
