Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463874;
	b=z83fKi8gV+lMZZ84dJfasCJMo9wsmbWTAWGVQw8Ifqkn6It2cyBvvmc38hwnPyVuZ6NS
	 UjNN6K8IORmzPmobZmNxo238QeLovBZdPBRfTN+sFd9eUaMRekwJVi7Afw74xddX5/M7i
	 lz45iOHzVV1nEYQnsPIXpRaMVV6Bo6QCHjmCzySEwsY885irw27R9C5/LZ2kKAN7eIe9P
	 Vtb8QFAWDGZEAW/g5VBd/QPP11kacJd58ihFvv61g1ATB1th3q+utHXnwCC/GCDVGfOG4
	 /FHHBPeR40Z2whFdfGjxUnjNi3jCpvlUHxcf5UBhVqmJHIxdEp4lwxvmCokyR09UpAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wIweVJYcGEf+JF0pxNSl1gtpRzcg8XL5MMMTo3haHAQ=;
	b=5EzeFYgzY2TOXGifP70PkSeKmVtVMLnhRAPRGO1l4bTBUnmATJ5BzszQ2GFeCo9SzOu9
	 UINgE4r4g8z1B5Ox6rx3sJRXaI5aoJP6ZrqlfTS1/Pr/PFXv/rRW3FVRheBoyg5alphwG
	 m0p6vSznms17fMdrN4+KBQF0GE/wYeMfr+PYoglBr9LirrJHyRRKPIAzXOeMRbUkKTBTj
	 1YGSI+EIwGLHUgzvpbih+LLqXHcHvAGivphzik+Kzzbt1X/ahbFc18WzniT+2P5M9zLlc
	 a4PxbCtLbGrlljpcBbcbWsSCsiOBEIgZ7QS10pS8YDofZD/CLXQlGx0gHbZyVJR16KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pRWIBA2S;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D50C606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 16:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D50C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pRWIBA2S
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91c847584b8so23812706d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 09:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793463873; x=1794068673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wIweVJYcGEf+JF0pxNSl1gtpRzcg8XL5MMMTo3haHAQ=;
        b=pRWIBA2S2QtzRQU55NrtkPIug7wojsi4Ze95NtY70HubFtZ6lHj04hhPHBGGgz6yDE
         ucGLO4fjJ91JJpmkkN89GlFyE1VfAPpCNxq6YCOkw+QeNSDbWMlsNn2thPfmChu19F1d
         jIl5q3JmYdR8tawjjyaJyKE6NiMtBrv4aZVyOZRtsVFFpxOWItJD5Fqpv9ZZiQ85qJ5/
         A0DVSDtvTmTC1J5JsyVnB0EC69JLfALXC+E943Zozn8m5pWqDl2ToeEmpnKJOXIIMDmj
         wRE0tsQKuYbtTWPr3DxUJbrDyVbeyf2vw06m6GoLIlM219xbnVIyArr9pd15WTgOjVbZ
         iJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463873; x=1794068673;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIweVJYcGEf+JF0pxNSl1gtpRzcg8XL5MMMTo3haHAQ=;
        b=WUzc8TNiEfjtX+IXrs5vAt/ugOwjkEYZ2LcWxuuxVAiaf1vEprC4eIF3ewSR0CZn7T
         ykJ8FO8PQSzHXyr7dg5sEpBUBhdObyLCWZdWExG7tsirUqRtCmbGuUaRyruU49khqfjR
         WRw9wxi2txnckqOpMCQBghd1Dqkpdfv2Evip2+x2nP7jMwiT2GcDMX5lWJAk8WS4gAD/
         K/u9OUXjrkK6ysu+kBCXNHc915ihGdXzP6vjMh86MudfW9JnSuqRctUKvNmmdGT4tEeW
         VssIUy6JpnPbPS+z5iAbNmzdCmv5OupYlNE/SQOSan2ju3C7kvWhPPyliGqqPj6vGFm0
         p7XQ==
X-Gm-Message-State: AFq9FYLyT8ocL4C2kNY9pmqmCNQjTYKfRDeAqwRVoKdSyTsZXgakSXp9
	ep2kABBbCkc+sD9F9Bq2+FarVDBUOBaWaC+foOj454GyS4+VfowGJU1l
X-Gm-Gg: AYBFou3CRYF20qqKdo3uquS3mRhAHUOCXvDQWRRmQeDzzfU+O6QcMeTm1TxffQz+TO2
	LtVXkcgSG+QPtb3iqZBmvAC4EGs4ygSX78dnMNhBtYd1Ou/nzTbj0yNJfDu/3So0Aogg9XVo2n2
	0SYtOhHXpZZ1ZIL5IRLOTPkX6q3S+98FsZiH4VilnExYzd/WkVEw002xiHG8gZlT8CUT076CwV7
	dbaAvzEEmWuM8H6ldwHjTbc05t97jF0cX60Vau+2dijHdr7ehaECQxysRqj07BIZHzYwvhyMKFn
	H5hhQ6ChQjmG4r3VQZeXYBayBF64CAUuIJRDQ07nleFhP5P6KMvDGkPIQRh49AvSmIQakVB3Xed
	OD6QhVR+qmq8tMSCBZnPVPP1+UjRDB2Ldma58qGcDZh2fglhi9YDstGgDHJ/w1WOB/Ua8KEomol
	90wp+Jfr3eRTbswOsj2PA9BGHF9dOW2qpYkDn6grTeAjdEGSUycpEbXJ8qpMHkMLFg7G/5k9uKf
	HLzqXAJUMFkUuhuS6TpOamvjjenoplX+Gvt3g4RBAuKcghrhirTZz0X4FvNgWZZ18KpBAret5pW
	wYpuy8cmRdZHjP8KlFhaG0kMek2uGZjoXAgo8ozloFiSnRUA9uPVqTdp8qCcFzhCK3pjiqrwMSY
	V0Z0czg==
X-Received: by 2002:a05:6214:1d0c:b0:917:99d1:bda2 with SMTP id 6a1803df08f44-91ca4af9845mr87259526d6.8.1793463872919;
        Sat, 31 Oct 2026 09:24:32 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca807047bsm44369856d6.39.2026.10.31.09.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:24:32 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: edp: update v8 power-on programming sequence
Date: Sat, 31 Oct 2026 11:24:31 -0500
Message-ID: <179346367993.44447.8683103034067826560.x2e-share-edp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <fc3d0dfc-20cb-4289-a0dd-67ace50d42d8@oss.qualcomm.com>
References: <20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com> <20260622-glymur-edp-phy-v1-2-814b45089ac9@oss.qualcomm.com> <fc3d0dfc-20cb-4289-a0dd-67ace50d42d8@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
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

Hi Konrad, Bjorn,

On the Asus Zenbook A16 (glymur, eDP at 5.4 Gbps), this series with
Konrad's TXn_LDO_CONFIG value (0x91) fell back to 2 lanes on 14 of
120 link enables, with bit errors on lanes 1 and 3.

The firmware ends power-on with five registers set differently:

  DP_PHY_CFG_1             0x2f -> 0x0f  (the bit 5 Konrad flagged)
  DP_PHY_TX2_TX3_LANE_CTL  0x05 -> 0x00
  TXn_RESET_TSYNC_EN       0x0a -> 0x03
  DP_PHY_TSYNC_OVRD        0x3e -> 0x10
  DP_PHY_CFG after DCC     0x09 -> 0x19

Writing the firmware values at the end of power-on, all 120 enables
over two boots trained 4 lanes cleanly, and 10 of 10 resumes. Which
register matters is not known. Happy to test a revision.

Christian
