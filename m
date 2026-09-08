Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F1941D4C1
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865222; cv=none; b=HVH1a5Roq+88AM/fqb0p3iuabHssQORYFGdP8/woDulR6jTQ8AKnCfgbmXHqIvWW33mGVnLd/12p43gLWbXD5rvoBSZV9cMkl8BswzJja07UyRKXUwWve5DXr57sf1CMTyF0uRU8EFhSiXCn9VX+mksANfwQ7+UpfSxyQ+N8c+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865222; c=relaxed/simple;
	bh=Suqd5ftmj9Y6jk+Ge3M0i5T+AGs4crNAREB6UPMJwV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dXsdLhkObMAmvCTQh3DYqUoN5Jm8JEwomWb62KRMCe1wUs2eKXARA0EaCQu5jdpdiH57ZC4o32fWwwFKY0kyJar+h0C7UwCeUTZtQ2MjULecD4k8l6tSsbIb5ACNZqsVo4M6rwNWAvusllW7ElANzm9IOgqypX78TsDwqVnTWHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XaKesQsa; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaKesQsa"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d91ded8174so34616315ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 04:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788865219; x=1789470019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5MIH5m8h4rgx1wf2ZdrB4T0rpezySvGnbGk7lhC4ZfU=;
        b=XaKesQsayHa33cKi/oxjUxR1e7fx9zCCzLvtX4oKd1R+tq4A5G1D27r34HcDaUQJtg
         iYmfJroc0p6vmNl0LnuSfE7x2OyeUJ6GfmvHihAechfBWtRDlJoMb9RmzINHnZqzImU+
         KqrJuGrL2EDf0XF1kOLTCzCCuPsPicOe1+HEjDB16iXWnAjw52AkTFskGo55Fgv8Uhi5
         qKTPDjjHkn+4/tQI/HwNkHDvc8o3XoXs+i7AmAu4+f0GjwaUCvLffUvZg3F6Fzx+52f6
         g3bRXv4vTziTlQW70VkU+gzg2U/sZKK9MAI5K7j7evQqCMxDti8o9vlIuaKH1qs12W/x
         kL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865219; x=1789470019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5MIH5m8h4rgx1wf2ZdrB4T0rpezySvGnbGk7lhC4ZfU=;
        b=MnZre2VU0w4c9Ax7Heyv7OW/Sbv+cEwzitWoN48OQTrRbmsNVb/DanndV3tUiK7Aag
         F/mr6TELpV3JLpisKO9HNo/T6ScJif8okONw9Ko8T8k7VQbDCPGsmnm4PLKmxpnUXVVz
         nd7N2yxgvv3EMsMRd/rTxcMYAWLvgdHWAxCUHdY01yaiDN2MKsqiGpHTQt3cYPoU3k3R
         3EgQtJJhaCuuZDNY8djP8Qg8FfiNzxL76EvJdQyHW7OABPEpm6wlILiftpmY9X3xK7As
         2W3/0HdgrgvkF4yXy5gN5RWeoAcBddTnqdZHNKqbGjDhKngb1GVBtWQBwYv91vv19dJy
         Kk0A==
X-Forwarded-Encrypted: i=1; AKwUvBzmSXeDBghPsU35xlsn4+af58RIW2vZbMAOHJ8eQXl3TxJCdrofv2yvkJNDhW/6i5qft0kSq0U1zrrqBe3F@vger.kernel.org
X-Gm-Message-State: AFuF++lNIb4z0S5IOCw49AwOD02sz4K6rxHdOeO3a+1aGGeegXdL9uUB
	H9Ho12Hf4HrPLKd28iK8k38cM3C3WwhfxEq8hqXRyaNiMD50CjDW6sk=
X-Gm-Gg: AYBFou0RtooiiulToOvs//6Qq5S1EqodeQCpoY77vV3W55lmQCeZZQMEpMJO54d2AIx
	p73zgkZFbbi41uWZ/9n8Nc3nFget3XY3Of99BreZRdmKV/klPMeFYSQ9Ncj6pq4drn5qU39GEtZ
	zKq6dXUamiKZH6z9soT4FzkY9l2bM2dLXBQ7CBKOkET6qQ6W7y28IIYKglLGUA6QL6MW0+4Ce+t
	l/H7S3h6QF7cSeJsz8+ad9mnPksmAEqMr3M54FMnUz/rlS7hqVscWmylLKj7BaRPTu5SwoN1E7P
	2t6DdjqH+xQ+/uSywt0X/jsVNsVTIz2rdMiqM30rKSXsh7Z1kmL015j9WiRbgyqf9FWzaPGqAhR
	ioYVHkRwrn+1MPjy4Nl+k+ctpe0RmsX+qUV8PcMc7LcAsLb6bvtbzcqkdirnPnST4kC1iAOjy1V
	znwReQyjU77xezlESrw7CICVqL9BvQotrxdWmsfKOVrJOABJS5TX9f04123M0vJACoRGgqQNBBn
	Rom2+2b2IXF0qty
X-Received: by 2002:a17:90b:3d92:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-39b2614df9dmr43960484a91.2.1788865218856;
        Tue, 08 Sep 2026 04:00:18 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:f6ea:9d29:b387:9ed5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm32429842a91.13.2026.09.08.04.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:00:17 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux@armlinux.org.uk,
	daniel@makrotopia.org,
	o.rempel@pengutronix.de,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH net v3 2/3] net: phy: dp83td510: handle the active-high LED polarity mode
Date: Tue,  8 Sep 2026 19:59:58 +0900
Message-ID: <20260908105959.70453-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908105959.70453-1-donggeunyoo.kernel@gmail.com>
References: <20260908105959.70453-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dp83td510_led_polarity_set() only recognizes PHY_LED_ACTIVE_LOW, so
PHY_LED_ACTIVE_HIGH falls through to the default case and returns -EINVAL.
of_phy_led() propagates the error, of_phy_leds() drops the LEDs registered
so far and passes it on, and phy_probe() returns it. A device tree marking
a DP83TD510 LED as 'active-high', which leds/common.yaml allows and
ethernet-phy.yaml references for led@N nodes, thus leaves the mdio device
unbound, so phy_attach_direct() falls back to the genphy driver, which
cannot drive this 10BASE-T1L single-mode PHY, so the interface has no
usable link.

The callback initializes polarity to DP83TD510E_LED_POLARITY(index), which
is the active-high setting, so the request is already satisfied and only
the case label is missing.

Cc: stable@vger.kernel.org
Fixes: 5b281fe7e396 ("net: phy: dp83td510: introduce LED framework support")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 drivers/net/phy/dp83td510.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/phy/dp83td510.c b/drivers/net/phy/dp83td510.c
index d75dae6071ad..9e9a41bf6457 100644
--- a/drivers/net/phy/dp83td510.c
+++ b/drivers/net/phy/dp83td510.c
@@ -439,6 +439,9 @@ static int dp83td510_led_polarity_set(struct phy_device *phydev, int index,
 		case PHY_LED_ACTIVE_LOW:
 			polarity = 0;
 			break;
+		case PHY_LED_ACTIVE_HIGH:
+			polarity = DP83TD510E_LED_POLARITY(index);
+			break;
 		default:
 			return -EINVAL;
 		}
-- 
2.53.0

