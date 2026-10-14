Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DEA4E66DA
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981432; cv=none; b=eEnzcwCgaqZ1RhlgZY7tRQNASBSJd0PUDQUOKNTfcs6f1g9RxlivrQKrhCkM27Qx3YTbZL36JDA7r0mtkuv+8jt3mzH3z62il9EHDBa28vTz6DmUmW5AVcb2zk2/GWs3UpO51vNuIklK5i4mVLBQWHen9OS62yofD2oqHN1or5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981432; c=relaxed/simple;
	bh=2sBp7G5mc6uJL64UNxM6dPPb+46Qh7eHGxK9GvyQ9M8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8NYF06onvA6jzhscMQauYOt3JriRC1LpvP7XueBBEWKRtVL7jOIQLaotHWOnRdd3lzlgLjdb55Ypv2EhFclY6YCr9c3RmZkwIBYfkP1BYgxyfJhxM/fiiRmfhwMFS4D1lzcQ7N7C1HbwBk1b/6gWEWkpHjyox+fe1hd495xc5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AlfsYFZZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1FVo13O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlfsYFZZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1FVo13O"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAVNVW806980
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rewnoAte/tJ+Uf3m9Ci2S88OVFipQXBWInPmr2cUEoY=; b=AlfsYFZZiHLF5rCi
	wGlfXU/2kSJ+RvyjkPXizaFvhtZcX3+soS8b9X0bEtpg2jMZ1/KehuZctksYXhy4
	w9GsiK/7mhC3RvdEaF0j0rqYO4HWDnEm7ERb2G+36WyxrWGnY0dE6DebcM/ugyeB
	jcWDmG/3njb5u1KZ+SCDCpOEG3IFdeBR9BKxj0xw1uOjuPDUzMhV27+gBwH7VX28
	69lITh8sNIuvikehQB59dc4gYzSmSRJLtNZ1wxtF94p0evtDy02VaTKHFKw0NBeR
	WsIqoCGxiZowXFKI1j+zcpye3M52Ah7lbkDzsUaoqMPSQPZSH1LDw32zKDvstXIp
	qoiYLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6bf62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:37:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e46c120dfso39454485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791981428; x=1792586228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rewnoAte/tJ+Uf3m9Ci2S88OVFipQXBWInPmr2cUEoY=;
        b=K1FVo13O3ebtcq5qxMYXWD4B24F1JsdFDD5oPDj9KWrgH7jToQBjhhTgdCC51IoceV
         oaxkHWuUOG2Ca+V5/UN6xM7jcyTlgGUOZiZ7aeceGShrir4vmapajudoSAwdVdHp7aPc
         r40Bs1hkHO1FigJQq7wUL1mWY04h+rugTVd2FgZj3lG6E0THR8Kco02EKmDSPj1nru1l
         jOxEjsCAX4LUauGyxDwsBo4gnFd2TZF69vJNcxbORqbIhgNAfiu1uBM06a1z6SbzMt8V
         V9HjxnPlDMC0Rl104Dj75Sp/11eIwGNyapxjto598YIyP00AO2LGt+puwRnISrA7KOnF
         tPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981428; x=1792586228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rewnoAte/tJ+Uf3m9Ci2S88OVFipQXBWInPmr2cUEoY=;
        b=AERtYMnO1ddKoetRmxpdbTyrIWvn/Ky7gxTCyP2ETAnMkM1NMjYm8Mf6jYtzw59xp5
         eQ23b6OUdP2NxjKxdKUK+oGaW/cqjMOyOmk9wr9xujd/tDmbAodcsL410uRzUHujfNi+
         nvD+/DIvwTQ6XowonhluSdjcUdo7tMeODopNZMhTbwOKkx+ayOICUwcpFCVeh06UKVlA
         d5Sc97xYJgVUR1iBSMCWlUOSBR2Q5o/MZZA+RlOjqQ3Ci3iQwfkchMp3N295bEAw4/YY
         GpXKAlWPhtRa9MW5pn1pVkOeLgigSTvSC1hL1tyr+jxEu7/E55YY30p6LY47TIW+b264
         ecRw==
X-Gm-Message-State: AFq9FYJSPrPXUqAK9Yh8MKK3Sglg5ajBi79i7NodODlqGM8b3XNVKI/6
	rSaIGGga+kftX91SMjIwMfa6t6m5284VCh/diet0VY88U3KvnfNzgK6sh1cOYqocFm+2WUj+/v0
	6TTIyCfOLQ0h8AiDk7pkVSgztZBw9FhdrpdVVx3Tlb38gXwwHYPF7+U5j3Sq0pmBy/Vus
X-Gm-Gg: AYBFou30lq9xKkcj98iY6EJyhbjXjQ5hFqrRF9boxfpZeeGCQCSfXvcDU1MrmXffjyL
	BS2GC7XIofcr6Rnh3dmNpb6lfhnuKkjjBodmqcbQtT6D0PV226MwZwAXh5YaXvAFRkwyJ8YCOa7
	qIEPOUjKy//Zqo8eUriCxNUodl0ohGVjxNS2S5T0BrOudWEE+fPEzXrC6pB9ircbfcqgr5Fi5C0
	GLpwmtzyEiDj2DsRD94331lqXt6T0YBTzq7sTIwRf0Z6HrjyBQepzuPgB1FOuCTHOs4WxQNNedi
	Vz3wHLLsCZeYfJpTnKzFGxtCYP0fUarP9h6Ji0ItwCK45eoOLwZcBNH/OJUX7U9tAHefNMzTRxY
	x7Qu9sY2fWsZUEXRo9lVE/DqEbiNo
X-Received: by 2002:a05:620a:44c4:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-93ebd282089mr2546074485a.59.1791981427438;
        Wed, 14 Oct 2026 05:37:07 -0700 (PDT)
X-Received: by 2002:a05:620a:44c4:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-93ebd282089mr2546067185a.59.1791981426847;
        Wed, 14 Oct 2026 05:37:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm206122615e9.3.2026.10.14.05.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:37:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:36:40 +0200
Subject: [PATCH net-next v16 1/7] net: stmmac: dwmac4: don't program the
 1us tick counter without a CSR clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-qcom-sa8255p-emac-v16-1-0266c2ead980@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2229;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2sBp7G5mc6uJL64UNxM6dPPb+46Qh7eHGxK9GvyQ9M8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz3dl4m+qpuql2x9Vuhi+JubZ+193cRWj0/Vsd
 rhj3qvfaZWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas93ZQAKCRAFnS7L/zaE
 wxR0D/wIXdjVmoAyOQeH7rB9q9+tq0uz6+cpOevgEQPFym6rHDfDydYuv+Yx0TwmDKaVxqZEqA9
 jkqxQdxY0HzAlkxLaSYJL9dSajCUAOaQizKey3sUqyZ7gTnQDdYKJIM0saQvyScb+N+VM1CDA8k
 nCOaR4A1ZkyhRe1eaRwXPwqDRV23Y3dscokhHny/y2qlzPrjHUcocoY9Pxz2mKFyd/1dPshepuB
 ALhQTHp2qyGnx/sbNa40NyMyYIxUSOqLNpg7MPPZ/eHcKYgkGdFKBuvD2nc/aTbpFGHG5jyxLP7
 frCLl5Xa+7k1cT8qg4UPQXAjT5M9VZGOy0QgPZLiQMJdI7DjYAqQCNwAjEPF6Bdmm3tpaZetRLC
 XgnGVlbnhs/uZHx/2whbV9/5bXedTCMQikDfotazCFTGCdTIo+U5ShDYDkAFqkFxFAMdt1Q77RU
 FrTnQ/+A4OMvVXId7/C5hRBwuLsxeyoEqwLXi7guVcuc++nVFS9OqFGBV0mCz2L/Hv3+M0qQ3SK
 5kDrgaYLzvgplw4JYzqeNct7wnTR6M+0AxpMQbSCzDQKiIXYKo22NyVVXf8wZNCzpQ3j8Wix6vp
 14Gpzo8HiHXuQp4PsyR+VZQ3zaYmSmsJGP8CN32EV6T2d1AeDhgTNRKD1oP6kJRByraeJ6rRevV
 024vzSVRofGO1kA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 3xLidDKdrIkyc1fpPpSIyDyDNzJDu1uU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX0Cw9pJYy2gZ9
 zbbeJYcV+bnRNwEx741re6m/QFu4EBEh/lLK60A1Cy2ljaPytFrViKJg8w2+kbYE1qE76gOszAF
 9ux4fyowdN+wWAM0MGwGZoWCm+1nJSw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX8v5iK4IuTfxu
 wbPuUp7fyDUKq77QNJUZFyLWkowU1oDDfyjiuBQgHkIA/z9dg001AT0y2H57GXiShq5u131F20C
 bM8WA7pwKl0SK+DSkRcSSqLHTzVGOqKJ+9Ac0KNgH+BwP5mpnYUI/rkM8Nxnk1oeGXCmPFOVK6x
 XkIoNMRepyx8NLXOtKQARFDCGSRRD3Co070MQMcpt35fmusGhJi9a0lL1iFiaNmtx6w4dgPUqhV
 jTTq5BoSBsROc7KK/u0XC4T2jthaaf75/wqojjucEH0FkVPVbqsAUlXB16O7oKHYBcd1AcSRjje
 aaWbSDaBk9Wlq8xcvgvn95WZEksmKiR/Okz0DNVGzqef20eZ+0sfxoOGyled1egEojaG0WBg6cC
 J7j0KtWMfpZGvYhZGZPP+Q/cYITavzaf8+M/RDqBrtDZq8yi0+4rU55FZ31V4W/LfGUS0lLxZPE
 PFdikg0NaLhJWrSQ20A==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf7774 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Xm6EMxWvXKbCXn_Kg3kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 3xLidDKdrIkyc1fpPpSIyDyDNzJDu1uU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140050

dwmac4_core_init() derives the TIC counter value from the rate of the CSR
clock. If no such clock is available (for instance because clocks are
managed by firmware and not described in DT), the rate is 0 and
(0 / 1000000) - 1 underflows to 0xffffffff, which is then written
to the register and can break the LPI timers that count in microseconds.

Leave the register at its reset value when the CSR clock rate is
unknown. The RX watchdog conversion helpers already cope with a missing
clock by falling back to clk_ref_rate or returning 0, so nothing else
needs to change.

This is first hit with the Qualcomm sa8255p ethernet, whose DT has no
clocks.

Fixes: 68f5d3dc2808 ("net: stmmac: qcom-ethqos: add support for sa8255p")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/179052656185.2160803.1751830002645522416@kernel.org/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index cd6c5d6f42b5445918f277a2b4168d8f473bfca1..259e2ebed8c14dfdb9318da9be03c5f1dc9b1284 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -48,9 +48,14 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 	value = readl(ioaddr + GMAC_CONFIG);
 	writel(value | GMAC_CORE_INIT, ioaddr + GMAC_CONFIG);
 
-	/* Configure LPI 1us counter to number of CSR clock ticks in 1us - 1 */
+	/* Configure LPI 1us counter to number of CSR clock ticks in 1us - 1.
+	 * Platforms with firmware-managed clocks may not expose the CSR clock
+	 * to linux, in which case there's no meaningful value to program.
+	 */
 	clk_rate = clk_get_rate(priv->plat->stmmac_clk);
-	writel((clk_rate / 1000000) - 1, ioaddr + GMAC4_MAC_ONEUS_TIC_COUNTER);
+	if (clk_rate >= 1000000)
+		writel((clk_rate / 1000000) - 1,
+		       ioaddr + GMAC4_MAC_ONEUS_TIC_COUNTER);
 
 	/* Enable GMAC interrupts */
 	writel(GMAC_INT_DEFAULT_ENABLE, ioaddr + GMAC_INT_EN);

-- 
2.47.3

