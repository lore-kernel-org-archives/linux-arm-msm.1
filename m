Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432105;
	b=uCzvoWGpZweWStSF2LNGnQIjB/CszpYZ7d5gho+w+4vtxckXJhv1OGuy5Bdcek/3xP+n
	 GWeg/NhKmQunhMmc7iUpcbIBSpD1soLzqpc3xhsX3gyGOuKpFu9YEmmXsWI8L8LVUF8K9
	 jihJZYeADsOspwhqXkZMpQKahJDzT8cpRaUzM38S3f+DaQPBdmHCRNtdNWYodjkzf3oPw
	 vLFrRmdyIh0SmzglVALrMflVDC7tieTyKaD6fKBkn85FNoJ7toGeqRIGCyuWPd96hB/5+
	 OnoctA10O4y3E0VbhwRPy/Nx73adulHdT4zaPq98nUmx4r+VHvBeAimm4rnxxdgm8mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=apdOIp+d8dMosghugd4A61IWkZa+bKaIlqx3d3jd6f4=;
	b=S3+gJctzlHBY3/gsiQqgwmNzXWFBw/FREaOIv3bxKXBgqPLKKzFqmmcI5uqctpysOUA/
	 Y/QLZ7zWJtczpvtW2SrkyyhZQ96R2paM3IVC+EgK6uXOvfJDoi4WHjZtKzfuaFCT3VifZ
	 VG4oS1t6TM7cwzI0oNVQ/lwJoRvk3dACBZ6cAH09Q/oTSaH5yrEGTWEfrM5lOVzhNWPGB
	 SGDBpIOtRv5U1Juh/VG8lEdirUpaqGm3EWcACX7KrX4xTMSrc+oBPMYe1ZnLLgSrNv3LL
	 nP0dZYScFoKGNrv4JsNp1BomZsrCkyJGC1NgVVbF0pxI2432RZzGYYhWAEX+Wbco6Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwoqaWK4;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832F9606A327
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 832F9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwoqaWK4
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso6853386eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 03:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432105; x=1796036905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=apdOIp+d8dMosghugd4A61IWkZa+bKaIlqx3d3jd6f4=;
        b=LwoqaWK45pNBukfs0hE3P8NcEWeez9hjX3QJpbuCkeFGZ3IRbS/bA9ob05/MNaPzF1
         /QWJCjhAdYFuw79LnEu3pC3MHACbTpz6SfAe9I6H6Zh0Rei8MSCiau0i7ZSfwrOLIwVi
         guBmrn8bKj3vJ0hAPEmQy1Olh0ayHDqLPb9z/w4jVbagtfpHnnazFx7chJnaeL3BK/wZ
         C8oF8qjWjHcBK7hid+eAD7FaUqsl3oUKhudGZgjUag2SB6mKGTeoZ3N2d1wxt8FUrIt3
         wrIKddjRTUt4e/zD17S9i9xmHSSFtp0lo3v2w92T1rJ9fXt7blLEIVGepbjOJgl8NqCv
         ZVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432105; x=1796036905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=apdOIp+d8dMosghugd4A61IWkZa+bKaIlqx3d3jd6f4=;
        b=iQbd9stVZE/p38geNj5PLReTT8gGxWyGHz5TRtmxUFyF5VLsK57HZMZTdEuBdl3RgY
         2K84HDXa08tYG14yUABHVTnyhToPyxVCrMRU31bbIC4IBRFldTc02ryOTldHJ48aPKqH
         94W88QC+27DBzHbJnnOUAqfvZKIdAukYiJFSr+CWOspREABgjNHk4LkXaizjuF0z1gqT
         QKUG9N6fS2STOorz/Zka2jpx0nvKbEfZqttRJmNyKS3VF8vPqOJ8TIGFM/ZBndEpRlfl
         NMBXXCtFqtWydTNANC9rHkT/8UL79h2vdiF4ZNK30uM7sLNiJxB3++FuU1vSlKtHvdZ8
         5HyA==
X-Forwarded-Encrypted: i=1; AL+hErEbfD4jWgTmsEj2BmWpkhQbztxRf71lQg9SsekRZj/NezFGxhWNMzgARg1/6pKs89aNhQbzy8NtfeTEb0P0@vger.kernel.org
X-Gm-Message-State: APuU4Z+Bh52vqsyR4vWA+FG9AWfzJH9uoh0/xGYsEjNo8S26FT8JtXKZ
	rsXa8dtoieU5wIVlaXHmdsFUyNQUZ9F5wlgs4+hjoY/gNgUkJqp6Yytf
X-Gm-Gg: AZFdTZeE3dg3cFHoaNK86MGVw6JlClQ7rMb5C+q3BWOoqijgtivM4t4kgL6sJ3/wnAe
	/d8klwjFuemTAh72vpPF8PR8dAs7xqY6Mi5esEVcHKwzS6GZYY4El+vkG33pd+RtX+/cL/jIOwm
	T3BAZhQYwyZwxF4/4BLDy9uQeex55RNzweAQCYyrZw1nWqtNVP+0/pgqZZ7Bk1u28NMCHGYLHxm
	Rto3aN7tge2Pd0XlCZC+nc8a+m9nzkSEjgDrHIPoGm96qfOTBwB/X2M9Sq71b4Q6nLCrLmWeXfD
	FlX2aRTC8U1ZGENFwdoOSD1z06i+T3n3xlcNtdwb9leYlWCGsKszPuOtEEVNo+Y8k5mgvWBD4XU
	bOz7Epjp5beyEnMhL/30Rq+ZzD1QM30BuhQHB12AXtzMDrIRXq2figAZZspiaFFoNe7k7FMoiHr
	2KAOabMAa0/fEJN3KZ8DhFg2YALo2BylmURsqPqHavebmnXKPpqSvYVwqQt0rE4ItH3iWb5nTEb
	ewBC39I4HWnpqLSp9V6/wp/4KSyN5d0agED6Ne58Byuy8ZglJ7JJSfgXQ6/Jsk4AlddEQBKxxLD
	3k3auZPCYt2nK1HwuynOblgY3QCX1aGmTIDaJ0j5hMZ04w==
X-Received: by 2002:a05:7022:1103:b0:1b3:b3de:9232 with SMTP id a92af1059eb24-1b5568a15aamr10021894c88.9.1795432104625;
        Mon, 23 Nov 2026 03:08:24 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:24 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/6] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Mon, 23 Nov 2026 18:08:00 +0700
Message-ID: <20261123110805.119610-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with
a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on
MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Switch the 100 MHz parent to P_GPLL0 with a divider of 8 (800 MHz / 8 =
100 MHz), matching the 200 MHz and 266.67 MHz entries.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index c4ec9950ab68..3987cab327b4 100644
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

