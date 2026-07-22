Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA8543B3EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709445; cv=none; b=NmotUlUvx0OzIRGu/b9IqsyYNMkrB8hJ1yP05C/qBardnxQK3oPHTn7cQM403q+1q/u3XKFdC+ngOaK/VKkTUipy0NbpPvqq7BPAY0GMR7SL1D3PQmNx4BLPAD/OopFbNYg3x5yvqcCvtHMrKFW4NW3XkqBSKV3g2g/HX/4aKCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709445; c=relaxed/simple;
	bh=Dvs8iKiA1s86fHZzIox6PNu9HBXw7jF2cFihY18EQnA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=GAXa6uqFPe4eJgHfexGMUhPjJfV4y83PALYl4doA+lXDEtUJ581xIGg4SKJfZzEXuKbRh9GtAqqqLR9WDRcgt1MBBs3ADiD+N4s6KnRWbr9/8DT4zzs9t9k52UZBu8Cm1wb0iAj9fQZSwk0SQzRXt+WglpgjnLeAlSnkimDCbRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=S2DIfQDh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="S2DIfQDh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so89023915e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784709442; x=1785314242; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0KxUqkKLp0O43MKOzWjySTokmH8Zpb0ihL6Myhjw/iM=;
        b=S2DIfQDhIEPeBl8uYyE+232gxcAA1jgKYRXdy43DH71vRMvGD3/jpRdnYFwh1VeUz6
         dpNFipAMJY0jFlR4k7ZPtviG+yaNAikMMPENLFvP95cpwQalNbh4DYFtv2jGE0042JD1
         eargdZDyaVJtb7+cgfZXZxGEeSzqYb2p+DSsXN0rWFgqChOqMDroLFfN1uJo+4EIDRmF
         h5vdNnDPANPLgK81tZPUmE/4nEQdObjixV1d6KshcWXmKvwYLoPYd3e2xXasopGq50cK
         PMmtp8/zm2KsfknCX6D1F2TP/5Muy0F00PLwe5X8ZFJlvhmylfbQUn4mhFwxSrE9VSU6
         FnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784709442; x=1785314242;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0KxUqkKLp0O43MKOzWjySTokmH8Zpb0ihL6Myhjw/iM=;
        b=tWefjUamb8buIkxmBbK05NwS8o/Ig+dUe0QaKfLBsCvQy/M8wHuapAdTIfSTl0UMim
         eBgWAcVCZ3R+APZvEvvV9pWFmkueD+cqSPXt2/9qW5aPXYrbZcPolXUMmRGkhHH5TtJ0
         5Fgc39/whOO3qY1uvaev5IdVT1IYAYJfM/2iLt6SQfFZ7iKCq647fgiXIpjzmPWyWNUq
         noqW//rJZvkJQlHhCM4Xx2oilCDrp9wdL26Vuwm729gtxb6rd2dh0yhGTDW9Z8AICm5j
         IMAjVjCKgDdxr5U9y2a19Q5JjC3avnfd0EsgclAFBzU4La7OW0elApRxUTzTBiJGeVIJ
         1NvA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9Duvwj4bwfcRfPmDYX334jnnKYHi/PVyKGVC27ad05QJgQgHRIHbkNw1JR7RjR6aIRYMerfJSb21fIGWe@vger.kernel.org
X-Gm-Message-State: AOJu0YySb4bjvEZIAXdWufw/xUZC8c6HSEiz+f+9QBVHrkNxTU5ge4NQ
	7UduiBUVVs1PsAK1b3qIQdP2px6L+Rnhz9TGG/d+l+0QzMPnawaXYjwTh0mzwT6Hadc=
X-Gm-Gg: AR+sD12LNWl6srz9HCdvzV9nu6G+A37R53AvB12+Oq/LreZQNOYn9saqPqWySJiDejl
	mb2kqTj1k50ydVvcmSKGDlZJfAF9OqJl2ccjQWoBsWTY+PqUsciLkhG2IxPELxXYHa4HGDAfLN/
	4xdkDlBb/CTW1+Exb3PCk0ciPd67HDNZsKHViP2dVAeqUMDQbRkbqjH/nyrvAyDBldwhArSXMOe
	mRpvhhg0kEoFem5nJi5FTT08iLBDbC2NGsFI8AmsmFg7hhPFub1Wnwyf1qLcQPTFtQR1/SL1bld
	jsvJuHcwjxjFSi4wdlJ3/h6xwoPEpTnwl+7CaZfbap2inRfkPXcqvCAtxMcLOlunozBEn5D42Mj
	X0GBCfstIcjgFhQE1EabR7fQVvgwli839ePRY77kEqu9PSKyJ/kL0Yd7M8z/wVs0MS5z5xLJQqF
	t4QlsfAFewS+ANjfuSzuLa
X-Received: by 2002:a05:600c:46c7:b0:495:5205:86c with SMTP id 5b1f17b1804b1-495520509cemr186921755e9.22.1784709442333;
        Wed, 22 Jul 2026 01:37:22 -0700 (PDT)
Received: from [192.168.5.218] ([88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4956a63fa41sm57819035e9.14.2026.07.22.01.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 01:37:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/6] clk: qcom: gcc-nord: mark PCIe link clocks as
 critical
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
 Imran Shaik <imran.shaik@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-nords_mm_v1-v2-1-17e5a445a512@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-1-17e5a445a512@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:37:12 +0200
Message-Id: <178470943208.3016846.11776209051004302989.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=500; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Dvs8iKiA1s86fHZzIox6PNu9HBXw7jF2cFihY18EQnA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqYIE+pkm1WguCA5Ju86A2jqA20XEbXTXE/5pJG
 P4xBNgAB3OJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCamCBPgAKCRArRkmdfjHU
 Rd5RD/43BPSVA1i8qc8Iln6ZtlH+4tyXuICKw4p0yEEeJtwlaCT+gbl+veVEHxOZ3Fl36iDlvO9
 qeuy7uez3Y+N+hYZRsC+SVUxBT/emU2XybASJNIyp1KtBp65152knhRdc9RelkdKp+2Q7bRE5ag
 SjCWyA5ALMeunJXB10dHaH5UMKA8UEPsXQr2UVqMP0o6pjo/K4IsqsCxwKSvJkqVS8oEKk4vfxO
 mpLvC9Ye+S2BHP0k+GVP04fun9Tp9LYAgHvasc6kXWU95PsAhH7xjyyqegGzxDxFQ4AroeQXCX+
 y+rGwWJ5AS7ZxaOgDEJoaxiinz9cuU5q0uM9OeGoFM3dx5jfMZS/ddgGIvGBQvYyTiLws3yY1tJ
 IAHezfYpqRSXr5Zb3lLyH5JM6RRwwwsGwv+GimVWrXoI6cabCzAcMJBB44gBVlBKRDdmeE6J6Tb
 WHAmT5FoLGftfYNaACC0qzFZNCRAQik5mMeJhOqWW+nwfwZWibeffwnTjc+ajdegSq1G07BPWhE
 CFcffToM5bqjAYuR1rDDuzwOxzmNDkWLluZYEp+hCfSW7YqMQgNydcx+8Em/VsFGzuMvP3/TOvL
 y16pvkHJUXSqJjLFtwvnUHhTlqPX7+s0h5landjQ83quiMRU5kofyjn10Bsranw8l3cqpYHpq/V
 14PfqzVAYrzj93A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Tue, 21 Jul 2026 12:37:16 +0530, Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> The PCIe link AHB and XO clocks must remain enabled for proper
> operation. Representing them as clk_branch instances allows them
> to be gated, which is undesirable.
> 
> Remove their clk_branch definitions and register their CBCRs as
> critical clocks instead so they remain enabled.
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
