Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810951;
	b=4y+d9dVkr1Savrjle0TY5NQ0PEsO4vibxyQpvpM3J6T4pnd7g8SFS3lBUA0dZ3tgIB22
	 JttV/0XQ71BGXmaVJWrn0U5d9uxFWKnFKtYLHlcRgqHvWk1RgT04mqJDa4XIa1MNJ6HJc
	 6R/hPvnXOSV5S8EhgvjfG4/sqTVJ/CmAu1sl20HBhtZHdrEiGm5Cy+B5lNyglASjxwVj2
	 QstLiAfIsYSBOLHZu6UwEuDBK1F27BP+PWkEPv+k18YcAO9LqnLT231KaeJi1YScnxmQY
	 DBLRkUB8LSe7hfScZRsYKSfVLf/vpBxLUvH9hys/rMMg6S8HDg5mUyBjFOqGyNK629g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=26kedF9SHIRpCFFDMM1QZNr4jXNG7AuPwLWQ40UbmjY=;
	b=iiQcpl23Xz86fAEnXWHdC5aIwjuhBXSHOJqQUZRVHD256+xtvluIGzdLI8i08GtLaORy
	 ADG0VoxLxwOb1T+KmA0mtyGWs0JwQfa5eVZB6MYhdcyF8eec59RxyyH3jj6+vgAaAYziV
	 +4h/UYS7YGYstCjiTYuBB+SoyleyHwT7B99JDaMzYA7bUknH06B5BaNnDy9Pq1oUNt9cq
	 fw+cZZBxI+NPshzIv8SSEkk6JWdpEAb/NHalfCv+FZykm3AMrKA6RM+7+NUC++yNRsmtZ
	 yIdVV7u0zHS+jTvP+QOKokK/ROvF3vlJAJLO3qaujVxjTRMa393OdQo0uGgV03j2nbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lbF5pG6c;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5163060A3814
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5163060A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lbF5pG6c
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6dd059478dcso959728eaf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 20:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810950; x=1793415750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26kedF9SHIRpCFFDMM1QZNr4jXNG7AuPwLWQ40UbmjY=;
        b=lbF5pG6cIhPxgsEpIVWJat4zS0IDBvVd44OaGWPD5wqzC3WR2wKjclouQ8zHrzOgye
         u4YZA3x9sxIev8riJ49vX3qjZwwphs9u+HI/RgdYdgSaOBTRoyo0QN5LynzXKBl8OTGw
         SVh7gw8zfsdZsmm4HHp46yji7ISep4tTyxZ656WtiUEw2zEpBmzKWVyVbcHLCuB5Xprb
         jOZxi8cktFDm6mIgySf7lcYDp9dVhZHh0KY8Xl1XB5+/Y8cOwoX5IUtQ/ROwVG0/FNv1
         +T+k86R1qIFbr97v4RfXQQIVgGJfpj9GPHdrAMKLN7jWvIUWGqfyTHp3b8Mcckb+yc5t
         nRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810950; x=1793415750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26kedF9SHIRpCFFDMM1QZNr4jXNG7AuPwLWQ40UbmjY=;
        b=r5j9QoVRs7FxrXLdWsfEnVtirYPoFABwJbB7u58MW7ehk5ZFD/WcwAfSM2zAAfVBJ9
         lXfk8jlzViTtGJqNT9zIW/+19QstRrDcnEP534kEmx/0UTSg7Y7yeXNh1hl+b7SHrMJo
         PINcj6Yf7OKl4kfgQO6qRKMJo40uEhQKr2iz0ipPEOwPORXumHZnfMZOe+BjS/tkSmyl
         Sm25oxy23tyANIal/z0WzTZC/Y5P3wQXumMvHwgKIu+tBHoijvFUGRFG4ZdN9L8V00m+
         l3rMJeMBt2tKeEGMVuFPCSRSf4s9BGJoKaRBbFp8v/Qsls2AdMMKB6Plj1dDFlP7AfpB
         zHAA==
X-Forwarded-Encrypted: i=1; AKwUvByDfJHoQMr7QleswLtz1auwnRsJglW0R4ha1sbKhSDnJwxxkedt+4gWLKbS2MiR/NPJqzS7DAEHe5J/Smsg@vger.kernel.org
X-Gm-Message-State: AFq9FYLUu+Uc8UBKUP1B70PsVbOtvzZ+alB/XBHHQuHcyrINOaiEBA6A
	K3qI8NR/MvXwJkND87nm6eIcVmgx3Ao8LOssVcsfKc6drEwVf0lozU3c
X-Gm-Gg: AYBFou0xfBlr5Fk+3kVJZJD1TQfBPV4aKCxAwV9wgYlqfPLx/+PGHeeo3qR+H87zOba
	1e2G/PN53dgHE6BW+M+A/vncRxEmSV/PJVvz9+byM2Glvsl5L+IvHe20/MakrkKTGgzSjeeIawl
	Tzb9bKsuCanLOWAnueA5enRzEVIaHzpQbgaAJl4bHbFO49IdVVLmagBBnsImdj3aYCui1tkKjlJ
	wSxxCw7tGd6jlv6j6uRUBfmNNc1boLny3M5CB67Ker7c54XOdAW5sn8BOtIg1H94tHI7r8DKqsv
	N5h5Det3PX8PwA3ayg4z7iN9eA3T05fm3GpF2R7zNM4kFSoFOy7fVIpda5JSQWDv2biAV8OfAV5
	U3jMrkA4VmBYAV2BZlQptpbxCnWmiaZlnwvgnU+Msg0SFkBXgbppbh8gnRiUqWKB/el7JKsmrTc
	msXoZR8ZUCGp8KrJbRwl4rxDn5RyygyQyC9QysP69YYEmBoIrV0XPnpAXAEyMm+ETCDE1bOUNAd
	LK9p4xTM6klNSjfBJbBCvZTkOoEF6iBJSE9Bb0j9uEm5pkBk4D+L4IsLMLCbruwPuu8bK9XCXqi
	gP/cqj023/jDXQ4IdJXVE9QPOA==
X-Received: by 2002:a05:6820:1ca9:b0:6f7:c0ec:1a67 with SMTP id 006d021491bc7-70ba0e11aa0mr387906eaf.21.1792810950282;
        Fri, 23 Oct 2026 20:02:30 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:29 -0700 (PDT)
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
	Mahadevan P <mahadevan.p@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/11] phy: qualcomm: qmp-combo: Extract common DP PHY init sequence
Date: Fri, 23 Oct 2026 22:01:32 -0500
Message-ID: <20261024030142.13643-9-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-7-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-7-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:24 +0530, Nabige Aala wrote:
> Extract the common DP PHY initialization sequence shared between
> qmp_v456_configure_dp_phy() and qmp_v8_configure_dp_phy() into a new
> qmp_combo_configure_dp_phy_common() function.
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
