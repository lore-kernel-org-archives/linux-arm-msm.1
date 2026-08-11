Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6826042847B
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786448921; cv=none; b=hFD9WYCsupieXBJbgCTbxJ9E+mxLo9h8WUVbyJMWBiCc8px5NTiPeCpXTa4AE9fFwzHFfmXIyfrs32VyPxkBdYB2hDH9n+Ic05GCaHa6KEGRyoCCk6VQUaxIq2ziP5WPH2GI2w0UadhMNeLN1i3qoz5I9lsPsyBDt3oE1FGpaDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786448921; c=relaxed/simple;
	bh=+otw1eq6KyhMTfaoPWbIHySEFgArc9xKFqFzMJEX5lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h85gnqnjAvhrBR6w2vrz8KR7IryhMSCKhZfkwF9rgZa8ABMzMpKFXCE4JZFCI/csq9QKleV8sWnXcF/L1dRhqfKroHx1TWyQXkrrY5KAvSHN+aYpUrwKRvVOwlIYOaAYWbAjt0ze8mofkE3Ynw92fzoSX5wN5CigJR1s39ZStcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyNnUwRc; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyNnUwRc"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so16623395e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 04:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786448917; x=1787053717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7GBaWQ2WYLq6Esgqzdu5T5UPODeDao8xF4/EzY0gw4U=;
        b=XyNnUwRcChb9TMe3kz01GW5IITe5ts8r9FCC+Whp20teKyu1qMPA4OYSB3n40cyc+h
         n0Ae6PpM57rDBuStXBk6dEBOs5lLO5fFgnhzmgJHuyqf4BquGmSjOm+LdLXLIijio55j
         RPe83bTdQXVodtCK6xidqFx+2bgpx3UZC/7gmg9jWG5kEVgizMMFN4wEEZgzsKoOh3s1
         BgrezF8qeMZaG6lRYYTNUGPIm+RMbJ81HGtFa7zNr/nroA+yqLTfB4RygZikqe/RvKBm
         m6nipX1Ip/j1xSfa6Dhi6GoN24OxqzkKsfadVxXAxUg9fKPOnbfrseEPjpiDe+1AOGVg
         VgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786448917; x=1787053717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7GBaWQ2WYLq6Esgqzdu5T5UPODeDao8xF4/EzY0gw4U=;
        b=MySjh6yxCeaXjIKCCzqfZaVSyY2A+ZPgMWNun1L8Ac5voOg4AjGaajq2HYYQZv8GL3
         tjY1Q+RV9gwM/GBEobZiu0PhEC+B4myxD18BXen7xklabOLBJwlTYn/Aw/yuo/fHmJqG
         aQ9wJrUnwAHmu2ohd81kKMovc7EJBwBjfYYn/1a/YZq6lCIV+ag1+fMXV4e/PKAnoqJ9
         N/g1CtorE9bHLNMTX/kyiP7ZtHYcdAjTxdJqykezge/IvhBQjzsJu0Te24V5RGXhbHUi
         Pn4xBSfzPPfQQcYMk9q0rZeivB5gbxdEwNMUBZXkIHZQFZXv71roGcCn62tOFKrW/aMH
         +LFg==
X-Forwarded-Encrypted: i=1; AHgh+RoNOvzw7pdGMtr7Etakbl+tCSsPUuPEXJ94fzNRcvLKhJ+P9FS1ldDoRrFLWTrZBRBUPTspPV7WlFYRj/6Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yy70NJtpZS9iL4rDmr2Xm87WJcjR14d31+JZGMvW/eqrTBiu+yO
	NiKPpPqSd0Q3osZB27Pt2E6mtuyv/P+AUNCeZh1CRzqfCD7LbCtGFUe7
X-Gm-Gg: AR+sD138flZpj2D2bJJnUv6rCh0aUKh3QyHaWL4jgScv3cVPzwatSontTwpmnsU6q10
	kxhU7V+vQyQ1cHven2Xb7XK8+zfr7Uax0c3tzE3mnoFV3Su1HBJ7/OILFEwwQGi1mQlVE30ejp4
	JGlAKUqRnbefxm/iDu9R/xPs8m662+UZc5SSUNJpElLz21egQD9Yl0fKYT8RJTH2PL6DUTVJPbk
	oz10I2OayvqCSknT1FveaQtBrsxwgTz3oYG5yrP8MxgJ4TClWhBHa7NhYhWAvlXTK3Z/nSAJBJg
	n1JHL08+q11vQ9QNDgCaD9/4MqxYMViItKYMNYuxGny2cLBs6cG+46r0NJxZoFTTrsyPRS7R3FC
	zf9l9O5Ph7tELetbxf0OcVkYyYJOQZUBqg7TkdMqKsR8ei6pnO8WZCBFaeR23943jNPxBUJSFbD
	mslN/w8KYse1NwO6u3PX0MUDdAp7ieXrF7VTfaI3Czy09hiMAQ4EcZOr8W/9ZdPAQdVzrjS3M8O
	uXhHXl1jE6peifKUFKblg==
X-Received: by 2002:a05:600c:c4b7:b0:499:4d4a:4990 with SMTP id 5b1f17b1804b1-4997840200bmr41295815e9.3.1786448916394;
        Tue, 11 Aug 2026 04:48:36 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:cc3:6030:41cd:1906:c1cf:983a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a716833sm3403105f8f.28.2026.08.11.04.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 04:48:35 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Jie Luo <jie.luo@oss.qualcomm.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	Georg Seema <georgseema@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks enabled
Date: Tue, 11 Aug 2026 13:48:31 +0200
Message-ID: <20260811114831.85417-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805193638.15327-1-kuncy7@gmail.com>
References: <20260805193638.15327-1-kuncy7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recording a tag that came in off-list, so it does not get lost: a second
user hit the same hang independently, on a board neither I nor anyone in
this thread has touched.

Georg Seema is bringing up a Cudy P5 (also IPQ5018). Without this patch
the board hangs during boot; with it applied it boots reliably. He found
the patch on his own while debugging that hang, and gave the tag on the
OpenWrt pull request that carries it:

  https://github.com/openwrt/openwrt/pull/24653

Tested-by: Georg Seema <georgseema@gmail.com>

That makes three IPQ5018 boards from three vendors - TP-Link Archer AX55
v1, GL.iNet GL-B3000 and Cudy P5 - where gating the CMN block bus clocks
after probe kills the boot, and holding the reference fixes it.

I am not repeating the earlier arguments here. The bisection of the
fatal access is still on my list and I will come back with v4 and a
corrected explanation once I have named the register and the code path,
rather than before.

Thanks,
Stanislaw
