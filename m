Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F264E2F1A
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 12:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733128; cv=none; b=SRyS2YPrvOL3smoc+V5TlF/vpNgKTBw6CarSoBgJOGFOc1U4HqBql9PFq4CZo6Hn6njRf/P+VUrp11G74HsmoRJUP93melClGRM3SrAJVJr2PkIb11mhTMU/GB+dxAi2a2rK5RK7L+UcsppAQLxnWEpnyUUlcpxcuNpcpo1euY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733128; c=relaxed/simple;
	bh=K0/AdUj3KM/bg4Lw7l6vPYmAnKy+pFldBgXjVVQfZww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kd2GwdaT4luTcwGAbLulgXrwOfmX1u5bVq6kbdhdR8trsGu55Rk9GYQ3IllXNwkpWvBNQCN5cPdRZMSEyCakk75uTKMRH9RGCmId+OJO0wJh2MHUdLUpM9HGRBDLpvHgg99qYi1LPjAt3XonmOCjnGkJBUFJbvg3o/WjqOoabJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nb8dyezW; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nb8dyezW"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so466942f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 05:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789733124; x=1790337924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+5N3eN7ASbvgkLS4Pu213O3p6rNfiCNZSfRMqAlfbE=;
        b=Nb8dyezWS94M/5P5YBHS6vLNUrzCMU7Nz/GWVtKnO9/sju0VtmkiGOVyNdI0/1b32b
         iFVU/kjihthK7NdeGOmYCFiE4GWLGemZWLpdEtWEYO6fgNRGa3ecHb8+DHfD1a7jMCwp
         hzgIM2JGo2fiJUDwt/AydSCWHaTXor3/Qz7kdgShMcnDdcNLoYaCl4ZiBVP6+sU+ulNL
         L83nLEXqj8VFyaTW85p1OZ79+KbDcWzMPDiJjzOOIZIhhEBxi/Decm6g0JLSnvwvGnM2
         8qEO+C4kgrQx0eqckhym99UNNBCrp+dQl8Omov7ukCa0xqtNz7nOhVU7qpnr1iCd50JL
         qprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733124; x=1790337924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/+5N3eN7ASbvgkLS4Pu213O3p6rNfiCNZSfRMqAlfbE=;
        b=nThN/XlzDv8N/fCbCqM5ubeeDUpiEJInnRvfPBQbRanOoXZ2nNnPXLU4LqaQy3EPae
         5z+rdMJht44zbSIsSWLu5rZ8BwRkJXNrccKt9UbIymEtGd+IY6H5TtuaXILKhIaMkSPH
         HzZ6STVSucxmCMCVg3QCOK+POB9Bu+lUwdK7aU1O25gvHCe1qqAN73ngWPbEZCBTIE4b
         2AR/gNcrbEyw26uNLAC0SxWNslB5w5HYU3Pmyx5Vt7qJYcqX3PPMnDCj3YythsTw/1h/
         UYkHHf25znksFv/ahzHkl5ycwnqTLrwHCV8TcoBE/SmPsGkdGHKnJPUAAD3EXzX68CTd
         1wEA==
X-Forwarded-Encrypted: i=1; AKwUvBwLyN+ewW4XPdGAmxSK5/zCYn1aHkk3QxmWmIbu8jJknuiBGIFqgbmL1TSYFf7+wPNrZY5MzW/qfR+GoOZQ@vger.kernel.org
X-Gm-Message-State: AFuF++mys/wV6N5NP77gVqjIidkfPkvtTZOmQsUhpgLSs+C32eGn0pqh
	A8J1B4SVd3BKNRybeyHeslUmelxKa3fJHxt/fn31BSV8pXVSPNcxnhBn
X-Gm-Gg: AYBFou3PUT6owt+f5gAOin/2/nurYsmhgeFzal+t3eFleAEoBqS04CDK3VLkeHrtRf3
	ECNqF9Si0AR8Jvb4FrGQFzrc2Q2ODNDATXuFj9jGB1zM+dB/rWe2cdZO4IvpG6t+LkzmHSNi1Bj
	6Obcy1H63Fa55w6wbOwiMYJ1+svdEkCFthw1fTViFOAkjb3J8XPjH7A2gu4Q4clxkmeOS+DlYZu
	wEmqWKVees4bO2GPsuEAeQ1hDlvdvg6ctpAbfj4dzULHBh0djEqasTviY8VtWpjesb7iG5WGFC4
	9XNy5ryaRGFtucX465vZFo9jU2LAqwLPwnljv8swOqERQl1LSRRGh2ZPJTmaBvDy4zGtKSZV8UA
	atoTwerHxqXLaZtVfCE7uu3RCFlEDJTb0kuNksvIlNWtzsnokZHfF4s4OBMZZwWlOFHtN2h51Bf
	hYizfD7oljGQpHclgn4dy1yb4Z9y3X5Zb/gxzcayQQQ6xZlyr653SGnjrMECQ/ggY/EKJLu5T0H
	vSxDzhTZhA7l6s20GLHbOfzU09utmaCmuxJgdluBH6Z1RwHiw==
X-Received: by 2002:a05:6000:2c0b:b0:487:342:d143 with SMTP id ffacd0b85a97d-4871e269474mr3130746f8f.33.1789733123502;
        Fri, 18 Sep 2026 05:05:23 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (public-gprs688668.centertel.pl. [5.184.233.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3a8easm3703919f8f.9.2026.09.18.05.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:05:22 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Gabor Juhos <j4g8y7@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	Jie Luo <jie.luo@oss.qualcomm.com>,
	Georg Seema <georgseema@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-ipq5018: mark 'gpll0_main' clock as critical
Date: Fri, 18 Sep 2026 14:05:20 +0200
Message-ID: <20260918120520.140553-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918-ipq5018-mark-gpll0_main-critical-v1-1-fbe8f27a0106@gmail.com>
References: <20260918-ipq5018-mark-gpll0_main-critical-v1-1-fbe8f27a0106@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested-by: Stanislaw Pal <kuncy7@gmail.com>

Tested on the TP-Link Archer AX55 v1, the board named in the commit
message, on OpenWrt main with kernel 6.18.44 and ipq-cmn-pll built in.

The image carries your patch and not the ipq-cmn-pll one, so this is
your fix on its own: devm_pm_runtime_get_noresume() is absent from
ipq_cmn_pll_clk_probe() and the CLK_IS_CRITICAL flag is the only change
against main. The board boots reliably, with no hang and no watchdog
reset.

/sys/kernel/debug/clk/clk_summary shows the flag doing its work:
gpll0_main sits at enable count 3 here, against 2 on an image that keeps
the PLL alive through the ipq-cmn-pll reference instead. The chain you
describe is visible on the hardware as well:

  gcc_cmn_blk_ahb_clk -> pcnoc_bfdcd_clk_src -> gpll0 -> gpll0_main

Once the board is up, gpll0 has four other enabled consumers (USB, QPIC,
MDIO, BLSP AHB) while the CPUs have already moved to a53pll. That
matches the failure being confined to the probe window, when none of
those exist yet and the CPUs still run off GPLL0.

For what it is worth on the scope question: on this board the hang was
reproducible with ipq-cmn-pll alone, which is what my patch addresses,
but I agree the root cause is the one you are fixing here - any driver
that takes and releases a clock early enough can pull the PLL out from
under the CPUs. Happy to see it handled in gcc-ipq5018.
