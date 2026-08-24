Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D3938AC8E
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 20:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787603002; cv=none; b=qFSe26t/9bfslhh4Fu6GGyivVXIiLmPmx0ICcyjkcBZ81k6eP11XHxWF1wmwUtZoTmcy9ZoseZPuBJJ/C0ajk2QQHzk/RXYAKuqRZOsb0x26hhryW1Dci2XDMb2uyahoTu1TpYq7xZLqXHSFRVIp7llR74ihA938fgKCBQXdz2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787603002; c=relaxed/simple;
	bh=btENLVdFB8/s+Xjru3gkV7mTsUnieYaafKgbgWSlUg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NHXjmFZ0cqxIgLmL7XTDN6k7yeknYXFdeQHU/x9czvBMuLSN/SChjxx5DTFv8JZb7MxFZouuUI4tJXHgIc/EW9+zN1fliVbo69pYz9GqeGxAgJa2Gmq5FJXTvlQzaA/qT9qmwykARKeULmUZoEO8L591r5m/AmzE3bXWxtYqnwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbrXYcvk; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbrXYcvk"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so4357919a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787602998; x=1788207798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ivaCNP58c6toCkGyegef+e8/VsJt1P++x42BHAWvM8=;
        b=SbrXYcvkdjShlJEBANccdI95lYf5UQ8dkfREX6j7acloh3/L2yJyslItqyvyMULQyk
         ouo2vhoKjwNMTABesW/Y7XDQZl/qgiE9fitVjWNM/rtseDhMP9+dKV0yLCxs/SnBF2ic
         Sx9RYzh7nATY9khn7KqAiOS3fF3CWX22bWS5ZrXeA902pVe3Ug/D9GJ5Y1nAuaZ4cDik
         AdemvfoS8MtcIM3/RnqtbE1wlJtsRvR7Lp0cGihyN16mPUAaSQpnsYTGUMLoPyvmMOSv
         PF+ZpkFrGPqP7mWqsRh8enocIDhQbPpaQmaXsfL7DOHMEr5NytOe8tlmMelGZ2cKlxhp
         95LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602998; x=1788207798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ivaCNP58c6toCkGyegef+e8/VsJt1P++x42BHAWvM8=;
        b=K8m4oJCRIsz2tu0/9u+wnoCt7Ya8jUZ6+tHHNyxUMsB38Kmji0XJR0jTxYpG6nufrE
         ydD/p9DLADdHnT/Vk0TiO/4+/HKplTT+EMMFMKdAL8Yb6YVUwiNR6igoZ2WCjO74/HNX
         yq3x/8LxldAnsAmmlScYnSBj1yFItg+o9bpIaE8FY94iSpnP52MrEZvN+xmqGaaM4Tjp
         69inCY/g55WIO8GxW8JOEw0PJttr0zH9OuyhA9k2mOoQ+pR1kwRRTwz+ylaJMLNFIbPP
         wr4P+eCJVSw7H0aNDdhj1koP6+P2/Wl9InNB1ANbSDpdqg1CQjFAxIljZ9oletUTVCyD
         ZV5Q==
X-Forwarded-Encrypted: i=1; AHgh+RoUD8IzKp4C/dQ1EdXxp87XlW8sgnJHgmQoJst7ywOl5ae6I+LgWw8HJViE7tdYVK+KcqUr4ZXHs0JmQly7@vger.kernel.org
X-Gm-Message-State: AFuF++keYr9e5GbqiWknAJaIBKhGlt/jq/CkCNknrj1jQcSA7br7jDzb
	4RvJTmsTnaD288bXs4Aro7L+KAN+ybkjqxe3xpbOAnmcpLmeE5cyCgau
X-Gm-Gg: AR+sD108ecQUCRTCv/gqxirc2dkthgEEeFL4MR06Oj91eubQdeF/QSrEq+vsWWqqWBX
	7EkVJQ6XSayNI6ewBctgDQ14BD/nYnP6aEm+aQnzS5ea5A7XHTDlVtR0ixg1NI8VlJM5WDixzeo
	yP7wn8o+XoCcRhsTkiFEmFQqnZzcmc1oVC5/yA2vtGQEBh/3PgzGZDNxy7tddOhjYiDROVHblGO
	VKA9RG4grWSTXQf0FeMVqAPZgVyecAp2Ry0XGyfPdibPP++HEtzs8BX31gHJ5eZpSv+cqS44QCx
	3fGVh/pLiZGPFUAZR1pBQool8gxd4Ja2+rRY+w/ZoGevYz/UfkqlyVDX7/osVcZvsoerRt/oCg8
	ToHsGmhR9aluEyGqIv6gIQWVa1m4W7LCOHD6m15QMYB7ISUhAo+3l5w+UFKIYKzfEvDNzszrHET
	oDDsT7BkHeJWjv6ZhjSU18jWwOm2uJNHVm4jrFMxNME7hDBV3jHYf8idMsL0FT4Vvzo/tlSudJL
	svI2SLQWT0=
X-Received: by 2002:a05:6402:551a:b0:6a4:ae0:52d5 with SMTP id 4fb4d7f45d1cf-6a5c40d8fa5mr1195434a12.2.1787602998354;
        Mon, 24 Aug 2026 13:23:18 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:cb3:c624:acfd:1650:e62f:5668])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e001095sm10826690a12.6.2026.08.24.13.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:23:16 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Jie Luo <jie.luo@oss.qualcomm.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Georg Seema <georgseema@gmail.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks enabled
Date: Mon, 24 Aug 2026 22:23:09 +0200
Message-ID: <20260824202309.1196418-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f8b9192f-fe88-4a8e-86f0-6e2c33ed3f31@oss.qualcomm.com>
References: <f8b9192f-fe88-4a8e-86f0-6e2c33ed3f31@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 8/24/26 12:28 PM, Jie Luo wrote:
> As far as I understand, there is no expectation that the CMN PLL
> registers need to be accessed after the CMN PLL driver has finished
> loading on IPQ5018.

Agreed, and measured: with the AHB/SYS pair gated on a fully booted
GL-B3000 (runtime PM autosuspend, gate landing ~75 s after probe,
runtime_status "suspended"), the board keeps running, both radios keep
serving clients, nothing complains. Nothing in Linux needs those
registers after probe, and the v4 commit message says so. The fix is
not about post-probe register access.

To Mieczyslaw's point on clk_summary: that read does not reach the
hardware either way. The provider ops are wrapped in
clk_pm_runtime_get()/put() by the framework (clk.c: recalc_rate at
~1923, prepare at ~1110, set_rate at ~2415/2539 in 6.18), so a debugfs
read would resume the block before touching it - and the outputs are
registered without CLK_GET_RATE_NOCACHE, so clk_summary reports the
cached rate without recalc at all. Accesses through CCF are safe with
or without this patch; the argument for it never rested on them.

> Could we identify which module is blocked after the CMN PLL driver
> probe completes?

None gets the chance. This is not a driver hanging on a register - the
SoC dies and the watchdog resets it, silently, with no console output
after the CMN PLL probe. Georg's timing on the Cudy P5: probe completes
in ~628 us, pm_runtime_put() returns, and the board is dead before the
next initcall starts. So the question "which module" has no answer in
the form of a stuck driver; what exists is a window right after probe
in which the asynchronous gate is fatal, and outside of which (idle
system, above) the very same gate is harmless.

> The UNIPHY block is the consumer of this 50 MHz clock. It divides and
> gates the 50 MHz clock, then routes it to the connected PHY or switch
> on the IPQ5018 platform.

Thank you - that confirms the picture from the DT side (the GE PHY
clocks are fixed-clock stubs in ipq5018.dtsi and no node references
&cmn_pll, so Linux sees a provider with zero consumers while the
consumer is wired in silicon). The 0x74 divider/gate description is
useful and I have noted it.

> Would you be able to try this approach in your code workspace? Since
> the UNIPHY driver is not currently available in the upstream kernel,
> this may be a practical way to validate whether keeping the relevant
> clock path active through the UNIPHY side resolves the issue.

Two measurements already bracket this, so let me put them on the table
before anyone spends time on it:

 - GL-B3000, UNIPHY0 disabled in DT (no uniphy driver ever probes),
   vanilla put: 6 of 7 boots die. The failure does not need the uniphy
   driver, or its clock path, to exist.
 - Cudy P5: the board dies before the next initcall after the CMN PLL
   probe - i.e. before any uniphy driver could run at all.

So the fatal window opens and closes before the uniphy side gets to
execute anything, upstream driver or not. A fix on the uniphy side can
only start acting after that window, which is why holding the reference
in the provider - the one place that exists at that moment - is what
boots deterministically on all three boards. That said, the gating
behaviour of 0x74 is worth understanding for the uniphy driver that will
eventually come upstream, and I will keep it in mind for that work.

The full set of numbers (per-block isolation, the 15 ms / 2 s delay
experiments on two boards, the idle-gate result) is in v4:
https://lore.kernel.org/linux-clk/20260813093351.178419-1-kuncy7@gmail.com/
