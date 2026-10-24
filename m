Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810944;
	b=Ld37hX+WTiGn4d5paPgn5TSxgSepI6lieX5sPM6luGDwNzmL6amB3WkGGR0D5xww1zVu
	 oX7UQsotPBl8KCAUW0pcgsQXnVBeTPB5+QtTJT2nnodYrEaCXYgiEu9I5YTgjA7z/zGWo
	 aGZX85n257mda7zLOX/jlr3aPKWZm7NSemMvRt28+63TysnJXmiGbXffZPgrJYhCdCJ6I
	 cLXJYQsHGU/zhMeakTlnIyPqxq5uop25RLdcjEeOLwLRiyQxG+5OXQczAVgWaCgyIzjQb
	 A56n+3aipdLwn2+ZjFzyLIpp+KHcVF0Q1B6IMx9EX/ULr3nEXtxEZ1PuPlSKQTK8EIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kGCxXEwPwI4lAX7fe7S92k1f1wQoJNpstz6Mh/Dxeog=;
	b=YMk8mRYzk1Tn5vhjjEHNEzwzI/jzNcOHtf792xcC5BM7kM7+++8GISfuxasFN4nLeHSC
	 zZo2ybU/9zgWkmbtSLmZaft94aQmq8ns8gAC6JAG2J8lQNPFv1Pkgb2k0WDwsj0KJYS8j
	 Uz1ivuj0JVl5ijT9UoLTCTAsYX4uIvb2NAYsxTlAnEx3RJhBu35WpWuyNfGnAkmeovt1C
	 HdQOY5H5vdgh28CccV0acQpRDDwylW21VBir3hYROJEu8+3JzAmvYE4csMlIBO/AM9qyB
	 Kg2boFoWdFrBWLlYUegOS5mSjlW0HtyXB2CY49b11JHyHOMOpGqVmAUUi4OHS/fEiGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AEWlX3ts;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F2F60A2614
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61F2F60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AEWlX3ts
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b19e291cc6so1200354eaf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 20:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810943; x=1793415743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGCxXEwPwI4lAX7fe7S92k1f1wQoJNpstz6Mh/Dxeog=;
        b=AEWlX3tsC69COQXbIMqZ+Q92h0GavoeO6F/p+pNANvaT5IUyY4UMDRMNteR8TxOJ5+
         e8abKyiWH+koqvPi61Fa5CQZWfBImPffRi/gV9sv4sZyKnG4yWDBaD1bXLrVImlUWLZU
         7/2Xyy+EenpYVnw0c6j5tXmb6O7axTUJsXNAcV1qJmQC2Uj/bkn/pohlHJoBY7syzmZ9
         LPlWcmpZ+VfVgjavjs3q34z8mqod7+SjLcXdqi6MJh3Se2q55aW1hNcAik5vt5MvmygK
         foKYDjOSkUeHgayBhRgBbuUnvpqAhkPRoON/Le9rrq0wGHvuQETMcjyL5jhDGqo0y0pD
         caZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810943; x=1793415743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kGCxXEwPwI4lAX7fe7S92k1f1wQoJNpstz6Mh/Dxeog=;
        b=Y2gnxlEoZMC/pdC8xSlxEDaWFaPG4Eie/cmD+BnL2YM1CPlE4Vfe/koUCSReiyi1qy
         CZmH75TJrbcWIOcwRfRglCSei2ImWytlYEKkk91pCYcLRemlp3l+7k7HhynDdgAKA7GC
         m0TWLj+e/iWE2hdmb5AaaAFKTrvVG2lra0HOBXBVfvfRV/HpQDCK9OxU6aXaKweb4IJX
         RsLfiKE4G1vUkJ+AfUw091HB3MhRAkyXj+uzmgatB0zWMK9pJIFtYPoOdlvJba0mlbJ3
         O0mbDSXECeMafp4Lx+gTNY/BKC2mx7PlRUkfz/MRS0QE9IykHrMd2sLpo4blZCD/1kat
         d/mw==
X-Forwarded-Encrypted: i=1; AKwUvBykkqnpK0TdqMH2hgaPxv2CdWVkF5wvI7hiX1qkNOvzjcQIMx7nyBm8mDgsObHWolG5J738p2Sb3hpoN0MC@vger.kernel.org
X-Gm-Message-State: AFq9FYK4/0UzHXz1nqe5JKSad2EeNBzKT0xSYMhbiF+/iRDjX1ixYPmT
	DVeyFwrFUAArNkg9hjnrf363+RkgB+YLU4VqjDRyeuyELXKxC5JjC9fA
X-Gm-Gg: AYBFou0Elx8k90UoVMK3MXjL6qFbRszMEoKfN3jZfuRfWdwpfJBT9d72OUaNUNJB3m1
	GbbDDbaY7suwmoez8q+MLerVnywKYiVl2833QAElGDYiZzUAQbtJRKT00sXRIdNJv51B+0l0m76
	Cg05YT7fy9Sij/yrGsQt9qzERHnT2/8xIy9f9HHmaLMR37Wu6pGDlzP/4C7wH0FktdJRQzHApCp
	Mn/5SeVsH/joAdcMizTt40MNeEUTrLXITwoiT5fuktw15bfnpXgCCOcgYU+cMdR4MdDAyEPG7/+
	5Zzd1ckOkIaS8QRdi6FdGtq75HlR+4PvCr7sCTIzkvFuFDDNQluq7smw4CDIKPtsCgeo1Pq8Xmw
	hBfu3PIAlBFiE21d8Y7hfKf7dwOM5d3Qlx9DwkuxgO807ad3Z14150/9f+p6S5lo5QV7UmUB/5s
	L1Tfg/yupIRj1M+1Kw/9mhPNW/t/ozCZtfIq17vQv6Mt2P+96q7/SdDJwRNFYoPNlDLmV9asKvv
	G/hXeqprZh/dLTrgCdNPHZWnq5r0DHpmSP8d4zy6M1f3uDokJr2qsLQJ3XV14LO1XXIJWTDTqFs
	oyBX
X-Received: by 2002:a05:6820:c44e:10b0:6dc:beeb:34d5 with SMTP id 006d021491bc7-70ba0d725admr258799eaf.21.1792810943330;
        Fri, 23 Oct 2026 20:02:23 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:22 -0700 (PDT)
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
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v5 02/11] phy: qualcomm: qmp-combo: Update DP PHY common init tables
Date: Fri, 23 Oct 2026 22:01:27 -0500
Message-ID: <20261024030142.13643-4-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-2-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-2-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:19 +0530, Nabige Aala wrote:
> Update common DP PHY serdes and TX initialization tables with
> corrected PLL control values (MODE0 instead of MODE1), updated
> SSC step size, reset control, and various TX lane configuration
> parameters including emphasis levels and driver enable settings.
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
