Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787133;
	b=QISt6e5BG34kUuKi0HFqQSgUgqeLQRwyl3Sw70IrDJNYyxCHTVxDE9LH6q50jIrdhBzH
	 2DAadwkSR+/2/Cpo3OnzHty1UWGmKS/sgKDUti7+7kX1V3/VKZeqCzu0s1+eNrLHAPL58
	 qLNycrPS+wkoM3rbWa9RIC+JGWNqaxZa3B662qHBttv6ubDNObK2k7V52xmS96lakp4zm
	 PH4Bcw1RWJmKsL2Hn74Wgp0HilYLmAwtIqPE0jfeXbwDu4Of8/uAx/JLLodhaFnaoRNbZ
	 tfniP9gv5MQjQ58DZQfm5VUFkv+3yHa1z7EU6J55r2fdSBbncQaf+XJLFB0A4nSya5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
	b=29zi4gNxLeKHEqwrDPiGoTSHuSBB9qwiS7RFFJsBe0zvsyfDl7fgKaqeVc09SM8qA45p
	 umLj+i3SQ/GUR2whuy8IFAymBDVw0Z2nf2vmWbd0Od6QSaQt9vPI/ctXBrzouXeJ7WMCZ
	 PY+Rm5pIxgrkRK8wVHwJF5YePEj7vdawLH/47MA3lvBC94KtMRVjTHo2ddoxZCGEjLYWN
	 zT+d9xxPYdAflFa+XXLI+iSSExAOftp44lMBHMIgOgQRvtZzVQQ9rGVrrpHCEPtDyZn8S
	 9FL8a161lnioy4cWpr+voPurbkb8uWmxNru/WYMMZGhaY3c2lcmA+vOWrAaiuN+gJ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PivZWo8R;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7F5606A339
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B7F5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PivZWo8R
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f04244c3d0so63731525ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787132; x=1796391932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=PivZWo8Rof7K6W9Vheb0qp0zThUzh9oIVDgxc6i3q6xWx/3NrfyXUY9IA3TQRrg1KS
         87/9gnEPwQJghnt4GOIQu1d/7nHtLh7YyK3tzfpCIGi4kfTjK0xSJhvP3i5MjA9i34K5
         5+9amcagsLV30MUbkjRVZFuaQaWkFGwV7DXBKQt46IDPdNi1ADSQrkTLEJ8yad+fMHSA
         SHxNYXroc3W87etzrXbTif1r5krOcCxjXTn0SOc65Z68yE28tlLl615HRgWjQyEJtXzh
         mfcaRJp5cLzkTZ0Culgxn0PvYL58NGjpyjt/p3lhM3ImtleycWA/Q7jXXRplaRa2jbRj
         CPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787132; x=1796391932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=q90ISez7GDaemaS8ZokmbsC99aOeRM1Op32Qw+3fX9tynM/akMN7+8DtwqkwiaQ3AG
         bWJ9q9byxdSMbY7K+8pY+94enmmWzSrnpIk9lOfw/uNPJq3N/LtGu+gu/orc3sg2ZGOa
         7k8Jh5yMZFgwD/Dyn1S1ZyNqeXxZM1GbZQbNiT498ytcWl/bf7zmlTxWE2dlpwe3ADbj
         QTFUILZyD51eFCFts2KgURQ16g3s57OWcwsctnSOx8wdmAJZH0y+menIKJ+faD8a05em
         zPaRLu1WzmHrBN+VFOqsmwIdIXB07CXpE2+ZfFAKLNQqUbpfr8mEA44QtU/phDJn7vCH
         sEXQ==
X-Forwarded-Encrypted: i=1; AL+hErH5W3093rW2TZIyCLldXfa62T9A8etrVj9xVBt8ulubvKfl3WyyMk/lKgzDGsm330zL+sEYGgEe3fw4wfDg@vger.kernel.org
X-Gm-Message-State: APuU4Z9h26NYLkVaK00wcm37Ms2QQ1MIsSqA/vosAfvspLBZlSTLijuQ
	ZMgxv0xg8kziFS9do0D0c1J2LLwD09cPvH2dMPg1TisqB2lJqgSqGde7l35atPyz/I0=
X-Gm-Gg: AZFdTZdxy0ZNnpd2Wx2sUmksduF6KyKPUTZKXJcZGyxDGAR/cLuvx75sV2mkNwEnSUb
	65f6+UMYRMYmWioupc9JGioiOJNNOQ2hTim6hZqX2MfLfXNug0QOoDpb6m014T6KFRYATMizQiX
	oVVsBv89LoCfg4TIKNieaucZDDXOmzSls67urJV8rrcXjDX9D+X77NwogwIAvkzSystWwowTdyo
	hipNBA/zSutO5sHuOlztwBL20OlqUrnIow6YlDOGWkzqcb/JZwnXeFhZBn0I70ducGvnNwfx184
	NY0jFP1Ic42OIshZBQE8K7hz0/nemfBWYdsP5s/hvrIu2PrBtIpVqN5W8kqgiIHgb44cBFxIqcM
	hz9jhiEEGKVyNJKh95EtRQQJDzHzIxtSK3nP+7m/LOcOc3RX8C27UiurK7rLvoQdsDyx9+wQ+wQ
	ypCWrzqttmQiaHD9gurnDzb5TMSca6+ERIhSGVMtwVv3fllJ5O4ZbNLTAq4mbcIIg0xca1h4qo5
	C3N+cSAzIvtA3Pl4vemNRmRUaxynyX+0oC6Tmslt4lJuXH7P2K9+iouq6gptPP3mbv6JIO8rXoI
	CDvzlXYZQA4nkOmPm04rcum0d7mPTRXmDJCN9WGy7MpmZA==
X-Received: by 2002:a17:902:ce0b:b0:2ed:acb:aa96 with SMTP id d9443c01a7336-2f03f11c934mr272576205ad.24.1795787131876;
        Fri, 27 Nov 2026 05:45:31 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:31 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Fri, 27 Nov 2026 20:45:01 +0700
Message-ID: <20261127134507.125513-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2

with a divider of 4, leaving gcc_camss_csi0phytimer_clk stuck off on

MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Switch the 100 MHz parent to P_GPLL0 with a divider of 8.

Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index 8fe1d3e42144..8aec5600e837 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
 };
 
 static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
-	F(100000000, P_GPLL0_DIV2, 4, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
 	F(200000000, P_GPLL0, 4, 0, 0),
 	F(266670000, P_GPLL0, 3, 0, 0),
 	{ }
-- 
2.47.3

