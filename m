Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793145341;
	b=DSMh5BXfhhmXM/WQVtl1wQviteAve8xqo9ZrSGzvVlATAWiSvcyE2Dn9lQhGE+KR0BtS
	 9w3vfe7UIc2pRpqKJNca673glNc5/8YIsPUkbif0umQ49k7M1wiOxnoasNXtau9e9o2Di
	 30QjlEGsNIJPBj9aKUVvE5ZBGZJvddVunDsiVBChW58+BcUuqAcThIb4dY5KRSSqKy+ut
	 5m2uSqf8FJG30XzxZ6l+9ZKRA1vmHPWHnM9tdUfVMWWtgRLy0v6RNl9yrX3LUEPoR5y01
	 hrFYLqtZ8kr2hBR8J1W3lVbGbKmedUCRRuhtsMwxXiz3+ivKSREDRGCVnosEbAz59Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793145341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vpayMuArKl0N+L9ZZISl3VaIV5/mes5Sw/FrduN0nwc=;
	b=m5nUqXXIo92b683ZNoV31XhpZ373O/sIm0ZH42Ht9t8R1CpdsEST4GPc7Lg2EEo6yRTN
	 o5bfq9UWq71OX0gqotbMZ16z0XilMiB0VaQTvpX/Xp8jHK8CQ1WZ/Ef5MI/uYB5nSbXLz
	 uxoakNvV/iSoZMKZgWETzqgN558VBp5ihx/ruMdEDFHC5Zwto/m8n7KTR0dHNqw9VqhWQ
	 ResjshBipYfhUYRdgZUDijWCUmCOLuffndBZbUkPNDdeNx/KZ6tBsmIso3gB2rbNAItmY
	 f/nrEwTCn+bNTorT3H5IyhbibSWOMAtjNTtG9hvji8zUlcKFzgOKzU1EIWVFIWyeEWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R8r5tbas;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F327A606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F327A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R8r5tbas
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e96502e447so2911045ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 16:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793145340; x=1793750140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vpayMuArKl0N+L9ZZISl3VaIV5/mes5Sw/FrduN0nwc=;
        b=R8r5tbasXxOORkKo9Vmy9n+lXff8yrEx8aYTQ9qRxxMJALgpDqQHGyyus9ioAdpAjC
         cCBjbPdGcugqIkiuv9H3KdEmI7zZEXrh+C+wg3MNSe70C6qIhvz5ATum9IN4Uvyzg7E/
         qOFbP8Z/v7vnOZbC+RPNht/8IMuADAh8/ToTDoBDoIT5VoODZv5qRY/mgANq8lfdO72v
         7AzjCavHokKKd4mt8hT5Yy1NYls5lmHE6Y0Odr8UF33yZ3ShSGPHcyTo7nZQG3Vs3sQp
         +0FR68hDT1t8atVrBypI6/WLyZh2yFhUj8Mh94Ox2pbCtu4HQoHL7OaG1YjNBit2EAV8
         OK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793145340; x=1793750140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vpayMuArKl0N+L9ZZISl3VaIV5/mes5Sw/FrduN0nwc=;
        b=Fg9m/8YwK5lchkfTxj9ytEVAS1ZS9Zea0/f/2JNpm6OAORspqEZiBCwKoSA2641+sw
         VODK+iFXOYIetauTpn/S71ihULrn73UHuYwdkjncZXhdD1SXSSzj135+sya+x+krUAQE
         8iB/9v+bSaunBmrKuhEL/d5tVa5sMyFoAu5RAMnzJJfckiX2oZcdsopC1tCoVDBUhOII
         igMYt5TralRq1hn9q3Zsr8l83tG3bD4wP67N00m6VRIWAU+h7PkHKXRpwSxO2UOjVDAH
         otuIVwqIuP0hj6h92g01Mdvk0bjwXfd/JLAVh4KkQSKZ3tt+OiB2H7IQR/9CE0gxWCNp
         pLnw==
X-Forwarded-Encrypted: i=1; AKwUvByUr3Lqh9fL4ik83SAL8cdhMhVidXCVnCRccDzsbFpLOeoCbi9/FYPiZXBBajwRqbnkZSuvoNHEjpmG2Mn3@vger.kernel.org
X-Gm-Message-State: AFq9FYLdtdrG5qNIX0U0uWbhB7l59cadJisO0jhYT2TvLOkkzgCD5g/F
	PBYNq/IW8+P7abEc/O6/RQ3Pxweq3q9O/ZCLDU9whDwhdr/E93iIvqA=
X-Gm-Gg: AYBFou3lSY76JGv8aFd+v5X8A54AIAgMcMegDPB7IUbbhhDg7687r/ZE5yNiamhkUgn
	4snwrX0ZQJSMX1FgldJ0tkgtLYePDNJy6fRDvJvV7IDC5PgzATAO0XTyNOBzBiNy/KDkJMwdFiM
	TNOlO6a3UHx6gYWuxRZBKCv46izC2pAjxlg0CydU6mQ8yqwFG3d+iGD7DMupfuT9cuAWuEPE8Z6
	37qGV0XqeJG127Na4gkuE4zYRG+IEjtPu5UANIwMfMvUqgE6Lg8OsJo4G39isRTDGRDikMeo2qc
	Bj9NEWGV0kQvbKYbkHwrtSfFXf03Ykfmt+V48iQC/kciJpZxc3n9P1urs+M+gAljgYe/uRCgKTn
	ZE53zQqIfNJa6CiWuF6PBaTtDpbzVFQArO6GlU3+Oa7TrOu0trfKFV2A+D4v8nRJWcbAGxulkmA
	T3rcONA6uQJSboMERb3GmP4WVhoHn7GD78HmX+sTxyx5rbtmRyHUi4jKRW3GKwDbXD0LLTJKlgd
	P3pDOwD9YsZr5kvQIWgrJKvCwI4UzjDnKeU23OMtQ3P1qyDzx/rrlORzwLQ/CKheQICkYPGcTSV
	vYtEfUMnRHb8LfEdy4hxZbt2nMe4yg/VqhXTDEo+K/qPILXVRyenXWmoECfFCIGSmSfbIzh3Y+l
	IovWLD7Ac
X-Received: by 2002:a17:902:e805:b0:2dd:b795:9cb6 with SMTP id d9443c01a7336-2eb0048808emr7482155ad.21.1793145340203;
        Tue, 27 Oct 2026 16:55:40 -0700 (PDT)
Received: from [10.1.1.198] ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b77e2csm14776105ad.19.2026.10.27.16.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 16:55:39 -0700 (PDT)
Message-ID: <830ef909-d0d9-4f4f-8b73-0fc0cb7b46eb@gmail.com>
Date: Tue, 27 Oct 2026 16:55:38 -0700
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: phy: qcom: qmp-combo: Glymur USB Gen2 fails on one port (chip rev
 2.0)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Nabige Aala <nabige.aala@oss.qualcomm.com>,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5b31ea48-7918-4f0b-b012-6915b384b922@gmail.com>
 <76e97352-3a54-40de-8ef0-eef0ca27ca73@oss.qualcomm.com>
Content-Language: en-US
From: Burke Cates <burke.cates@gmail.com>
In-Reply-To: <76e97352-3a54-40de-8ef0-eef0ca27ca73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/10/2026 04:07, Konrad Dybcio wrote:
> Please check the attached patch.

Thanks, Konrad: your patch fixes C2. With it, the RTL8159 10G NIC
enumerates at 10000M on C2 in 8 of 8 tries (both cables, both
orientations, present at boot and hotplugged, including a hotplug
after a cold boot with C2 empty), with no regressions on C1 or DP.

I tested on the A16 (UX3607OA, SoC ID 662, revision 2.0, BIOS
UX3607OA.312), on v7.3 plus out-of-tree Glymur platform/board patches.
Your patch applied as-is, and I removed my local PHY changes so it
alone programs the USB tables.

  - RTL8159 on C2: 10000M (SuperSpeed Plus Gen 2x1) in 8 of 8 tries,
    with both C-C cables from my report, in both orientations, present
    at boot and hotplugged. No -71 or resets during SuperSpeed
    enumeration.
  - Cold boot with C2 empty (my original failure case), then hotplug:
    10000M in both orientations.
  - A VIA VL822 USB 3.2 Gen2 hub on C2 (a third cable) enumerates at
    10000M, and the NIC behind it does too.
  - C2 stays at Gen2 across s2idle (no disconnect or reset on resume).
  - C1 is still Gen2 in both orientations.
  - DP alt mode on C2 still trains 4 lanes at HBR (1080p60 monitor).
  - With the NIC present at boot on C2, iperf3 to a 10G host gave
    about 4.6 Gbit/s each way (TX 4.58, RX 4.71; 4.55 + 4.56 Gbit/s
    bidirectional over 60 s). The NIC's link partner is 5GbE.

Under sustained load I see about one burst of "r8152 ... Tx status
-71" per minute, each followed by an r8152 reset of the device.
Traffic continues and the link stays at Gen2.

Separately, the NIC only gets Ethernet carrier on a Type-C port when
it's present at boot or behind the hub. When hotplugged directly into
C1 or C2 it enumerates at Gen2 but never gets carrier, while its USB2
side errors out during the plug. That happens on both ports and
predates your patch, so I'm treating it as a separate issue and will
report it on its own once I've narrowed it down.

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke
