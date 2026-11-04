Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777263;
	b=rSdXRTu+ayCzkfgl2yfN8mgcMsiXOr8iunXO5IQGAN8DobLMm8Hm6WWxNsNGRRbFpngr
	 23H2hdyH4xtSjIKiOhkcQNssG5W5uSCQci97dgFxn9e0XdEW2T1l29KbXjHiD5wyw8Td6
	 rvJunIEY8WrMEa9+p40mlZGaAUdvNwOezls9t945pQpSOfDqwoM6WSsUfSuOzZKAkLhwI
	 dZBTYgb0p5UMd9B0X1UXaEICunuqR+s/hIDx+2lENd245YzM5Dz/8GItl0hnI0h0y0q6H
	 U+4J8cX83b/saRpbFTYhDqiEfK+OMIoiGpylGAid/6hsX/WqlLOXuMTuTG1sDgvM90w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2eIrsdGclmsUkVstChbgZeSp9y9jcEYAK+IEJRWBFtw=;
	b=fQmDQIUZH5k5RmQh/HvvM5hgylYB0W+KlNpBGbJIJBD8m6Q43+eM+y5HEi4sX4tvvBlA
	 9rril8lD1uGsXqqkYbJjFSboqgN0CE6dP++RXf/aLoHoOvOCZhFwo3Pkek3gc7cxwb00D
	 thBdqHEUfR8gSg8fdGKpZTQaCnt4uMd0bZ27o8Nk4sm0RlRWLVWblxdXn+HOSKO13HKx+
	 VaQaNxUrL6buAQUt51rjMKfuwIvUqtk0/xc/RTQBvKR3WacgcRv4WDhlCSVjBopzzkwpj
	 cNtui7YfHb7bCB8s0tzGDU3CVwhXD5mwo973H24BqDU3HgwMBtcHqDOCRpMCFWE3Avg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URaBGwXG;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95048606A326
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 07:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95048606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URaBGwXG
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so148598a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 23:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793777262; x=1794382062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2eIrsdGclmsUkVstChbgZeSp9y9jcEYAK+IEJRWBFtw=;
        b=URaBGwXGMK1WwGPhLq8jIwi21Gh294q3SvRM0Jm2or+AOHs/ep0LgltlMwQ26D+NEp
         qi4tVEY5bP1wNnHzx6dqGplAIS3YpDlbzr319bHbfsv2q0+eUWpB2l6WQwOENyMBrRIH
         TKOi31tIVcsnxIdQJw4XS7eJ5CnD9f7snxjuYn6wWFl0TMtxSiXckqzf7Td8T6q/6bJ3
         y7/jZsqMXixZzVO3ta8BjYZNIlm4jGE09DGpmJKXQqr6PgOCZPpygX/ZJgNDzJXAMYew
         NcqLnntsMHBArEq2lA8jWCak/Cs/Gn1ZrXpT/tOMapJnmC2G+GTXvF/lFzWTCydJD/1g
         N10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777262; x=1794382062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2eIrsdGclmsUkVstChbgZeSp9y9jcEYAK+IEJRWBFtw=;
        b=lbabIlEpwbCimzwLdq28gb/wW/WVgIEBpEGWJleUs/TV0R3wQYb60y7HYqopvIjPeY
         nHz/ZlJ1OtIFS05mM+obApENZjlSRNFXdWjpasIijMkHFdxd4sU7lBM+9H+rTJg47G1s
         yvCk18d6l5Ma8BHD22X+die9xKSgvaNqj8SHWvTBp0tX0eHZqyrlccurpKTze+m9ZO/x
         O2/yq8rmijIykN4He1OyLvmbpuU7B9JmIM4PfZP/Z9v+oJkrP9flajoe4J4lsOhPxLzF
         kGKnruIMGzAnWZK6o7kEi5MzW61433LUVRkQAcddQGX4zwCc5wNoUfI3WmBfPeHUUtfT
         zD9g==
X-Forwarded-Encrypted: i=1; AKwUvBx8gEnSQerCDQnSXJTB+wjN5YakG2zq03JrdLDJ83CvON6TRW71IkHvX45x63s/yzS6PW1ElhyxNftca0lY@vger.kernel.org
X-Gm-Message-State: APuU4Z97/V+cfaLW+n5VqKaDqhg0y0yCZv8c9p/1b6Ta8RZCa5LaGxAm
	9JxSYKYPi2YOdQcxbXbnkLwgN/MXj0YtaGWL+ZXDDN6RmEYfA+6epX0=
X-Gm-Gg: AYBFou39PE9bgP3G1dmDmxo80TkPMtx0Lp3gpP0bLc5syc87jzEtR1HH0uCVtmRSYqR
	3hGYgVlNOSippcsJ+USp43W0CXUpZu6IdxhlQLtFWHcRjkP95+DOMi/K4ozZBj9icWa+n1LSJOR
	iFvP4khNK72r69q87b9zANivOYaPZNNmxEhtk9DHrvDat8oT/N+47vIydfHuhPnggz5xzLVqPeY
	T5DC7oOgbZv1PKF22Yn14R7P7uweRHBUMnkRvMQFHK5nZP/QTTEYIPD4wLyOumZqgQHq8QrRJDa
	JMdEbcxaSunI7BCnpmGcBllbdhvbOGTW9N+Y7IK+kMNScvDznGqeDYaMgjFoZOQih8PvkF5wn/9
	iynVP/LQaBri4rGTBuBt1Y50SYuwrIuYJUUSVFY1A2DkztkbTVQn3OSTD55ms1pGZJGqjaagceh
	qknsILNoehPEIKZ4bU1DcAUp3BJUx+rAV7fxIi+qtOESgoupLzscC0agNTG6tnvKVIqMytzRmp0
	Zk0IfExkgrvjLjhqZdL2WnLVwZi1NSmqz1SnZpDdpoXHA4CNXQYgl6BdGUcki96k7CwFJzDBadM
	p8CYe84oeDuOf8ALIh7/rl41VjqOus3JlDg8kr1bTZFzNL8YCmkvmCWP35R25wcjVQGi0VUCLC8
	9tOTYWTFoh7yggg==
X-Received: by 2002:a17:90b:3951:b0:3a4:945e:bc33 with SMTP id 98e67ed59e1d1-3ae89798089mr12661430a91.47.1793777261725;
        Tue, 03 Nov 2026 23:27:41 -0800 (PST)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7e087csm8019210a91.4.2026.11.03.23.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:27:41 -0800 (PST)
From: Burke Cates <burke.cates@gmail.com>
To: ccortner@gmail.com
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: edp: update v8 power-on programming sequence
Date: Tue,  3 Nov 2026 23:27:37 -0800
Message-ID: <20261104072737.3489383-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179346367993.44447.8683103034067826560.x2e-share-edp@gmail.com>
References: <20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com> <20260622-glymur-edp-phy-v1-2-814b45089ac9@oss.qualcomm.com> <fc3d0dfc-20cb-4289-a0dd-67ace50d42d8@oss.qualcomm.com> <179346367993.44447.8683103034067826560.x2e-share-edp@gmail.com>
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

On Sat, Oct 31, 2026 at 11:24:31AM -0500, Christian Cortner wrote:
> Writing the firmware values at the end of power-on, all 120 enables
> over two boots trained 4 lanes cleanly, and 10 of 10 resumes. Which
> register matters is not known. Happy to test a revision.

Same result on another Zenbook A16 (eDP at HBR2 x4): v7.4-rc1 with
Bjorn's v1 as posted (ldo_config 0xd0, not 0x91), out-of-tree Glymur
board patches, and your five values written after DCC. Link enables
with at least one failed training attempt, over fbdev blank/unblank
cycles and boots:

  without the values: 30 of 400 enables, 8 of 61 boots
  with the values:     0 of 500 enables, 0 of 162 boots

One dpu_encoder_virt_atomic_disable() "enc42 timeout pending" at a
blank (1 in 500) appeared only with the values; cause unknown.

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke
