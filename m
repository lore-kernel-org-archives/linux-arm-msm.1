Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF07517BC9
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 20:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812688; cv=none; b=JwPX/rL+Vqk1+mjEETflnAAerOr1XFjzH7OTpOKDwpEFrUsFAvOdgvHiN5+dApkEaIjE92Sfr+lxwsf5tiSkCQ1ISc99QY7hLgxyG6e1E6wxrpP3uP8RrubySNnnNClK/pSoDf50kwc5xAzDSG7teW+ZBTMdn9so602u9XJ3pXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812688; c=relaxed/simple;
	bh=lnIs5iGMJ1/TyrszL3HdmC9OvNff74ciWiwlTO04duY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N53rXYpdzfzbQKXQGN+HHvz5oXbUsPi5LDRF/pyUtergRZDClwN3gQGJllTjKGIkK+cMIiBqK106NNuhN6vLJSw71dlE4rrH8GGprx0z/QpBwPqzYfIThdTd6hgpvawflVf2jXE4oBLghKV7/vcsHYpwnBd1GwVGmxxjPeERbGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XfBO1OeD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VObA1KbF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XfBO1OeD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VObA1KbF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7nZe1314403
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 20:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+JaG7DKTSi7xhDFXHxjPdAJJFng2xHhnPLV5SDhTiMQ=; b=XfBO1OeDaI8C8yE0
	nMeDOlsvy9eWugwFQNl++ShzxFd/G/y2X2kxXGh4JfcPlC/gdaPLdvswvM5S7iKD
	XDpEj7k9esOziJqN3xCslzyTcWCKh4gTyGJhSFOXq8Jj4VTFzVBjgiheDjCtMpQ5
	IazvdXSZtSj67Uo5Oe368CLMrXbUh3IybztdeJ2vYQ52WpoIfo9MWPnidmQBFMN+
	zxewce3cJaZPR8z0j/CNABPngsvr9KxGgNr4HMfDuTJl55heBScAealMO0czB5dX
	2n0HHdotg4BLQiMPraZMkSRYqrD/pYkq1I64CQzbGiw9VPkCz5iKvWqWXALfMpIQ
	ZBusoA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk9uwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 20:24:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3b126c9fso27798415ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812684; x=1789417484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+JaG7DKTSi7xhDFXHxjPdAJJFng2xHhnPLV5SDhTiMQ=;
        b=VObA1KbF60AVm++QDTG7YVM27UPp1YUI+9PticX4boPkVUQm8nQge7m6gyTVvNwEJR
         pQbYJ/7eO1BKq4VqVAGTuXIN6rH90QK398KgvNVSS52sq23ezksmAvABYWpaDBJb0Pyd
         /9mh4DkNNK0BIq7a+J43Z2FZ7dp9Ej3w6LbqFFcD4SPp/JV1njisQC/jvkAd9t6hJxC/
         sbsY4FKGf0ji77NUrvJjZmCpFtnudzf9gMvT/gcJHLyZ/zxE5iMDAdLy0EXaagHEwibH
         3Ph7d7HujsPqa3ntz6sUdJvh3BpYq8rDd8DX7eYvyc1VTNWKTiawogBNDiJaO4uCkFJJ
         CmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812684; x=1789417484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+JaG7DKTSi7xhDFXHxjPdAJJFng2xHhnPLV5SDhTiMQ=;
        b=ldTUnqCe/WK38f3yP+Syu/3ri7a4eQ4Vu9B9upBwgKaAgrhJu/CH3rfWYQ4Ad19WZk
         p5EqtKicpuGmSfE+PaW7SgJFWbV4Ba6Cf7aM2U//dpvX+4q64jBdIyL8Vg3hf1w3XmK7
         QFUCNoO5cK9ClIBG/0LJidut412TVj7O/tEY7h/dlXpM3e8imk6nZqMMYaehG7LBCVtZ
         3ypcXV123EsCK8YIabU1W63Vr837GfLSNCe6RwRjYBF2Njx65yOJE4R968aJUwqwZr5/
         cdBt05Ny3bqFvzSakEmFH4sNWU4KL8edxX0mri13dl27v57VBK2T0ldTp+RANJ+/cfQl
         a9hA==
X-Forwarded-Encrypted: i=1; AKwUvBwU0lZMpzDqRuh9T2fHsVah1r+vE63W7SfecobTjiXrycBVcLYELHwMV3sx9jyACD+e89xSM4+g+4p97MMh@vger.kernel.org
X-Gm-Message-State: AFuF++kLZESTWizDWTh+DAuCk2w7wDKRaJAn2VcDDx5+SHJIKULcsy3W
	clAN2JkzqomQ0gzjCGZCMo6P9Gcu3GCFK6srgmqLSl9zBddRMKKU9R3UNVkRTOvHdjjNNXi/SEw
	3uCDZpjATvcr/2xuls9aoBHQTbn3H5E732FRV8/f66kiT83nPZ8c5is/SIIvaAY/vOhKe
X-Gm-Gg: AYBFou3SYxWGfqImBDMLySHUoP0+8qg/QeCJCZsCT0zWKVlsnSREgYxy9p1IZoNH03q
	49jAcCE8vtA5SwItFJTpN/0tQvygyydGzpdoeywpibRbO2BhjBWNlr2jRtPfPicle0+ov0g4CJ0
	5zysiWnvdgFU2CKBkurx/zm+GAZuRJJHI/E458bpRkdUORFFmFfjclmGJ74NEPkvDmckgoU0sE2
	K1pYHjXwIlF/55R68aIVeRISRXDUH9CAR9dgAfosWtiqeIZ8OFjabsSOS2uEXWCd7W3OkPKe7J9
	g9F2i0SEeuPJanCpq4baEDbTPFVuZNe8RVcTV3U0cX7GuPXiTpU0aTWm7+ZTyF6tMh5aDjB9fnR
	8OYikqCLH6zqjobDUo8PzrYICwkH/ag==
X-Received: by 2002:a17:903:11c8:b0:2d8:d4de:fa80 with SMTP id d9443c01a7336-2db1235721dmr345681805ad.4.1788812683842;
        Mon, 07 Sep 2026 13:24:43 -0700 (PDT)
X-Received: by 2002:a17:903:11c8:b0:2d8:d4de:fa80 with SMTP id d9443c01a7336-2db1235721dmr345681275ad.4.1788812683356;
        Mon, 07 Sep 2026 13:24:43 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:43 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:19 +0530
Subject: [PATCH net-next v2 7/9] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-7-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=1202;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=lnIs5iGMJ1/TyrszL3HdmC9OvNff74ciWiwlTO04duY=;
 b=PlfItwBPYCNw7E604PKTJ17SgNiJIFuqKR0zm4aGtFG1ZqfCDUXoVzeUencwPv+khFYTEm8U/
 eKLk0dGU4CQAJ1XjFA1wGqgeMRDsFUVkiV43j1CRG6ATflSZwIqafK4
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX2zyA5N28X9l+
 Y3Qa2AEhabF5TTLnEeMbCFjIp2MXLLKgQ8ohIuTvz8TxzDN9X1K0LexWWOUUi69Ia0qCA4UQWv4
 0uFVHE80JaKu7eD0Rk0kSYPvJOM+zeI=
X-Proofpoint-GUID: sjVPxBsT8_5uA5PpHhHX4H8UZ__GbNEe
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9f1d8c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=oGeBSM6iGANWI8Y-5VEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: sjVPxBsT8_5uA5PpHhHX4H8UZ__GbNEe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX79uhJ80zcSZd
 4RRqrZfHfSSIsVBcq/FV2n3eY1C5a5GN7W6e5DySn/9u9SdhSUrR6b9q7Oa5Rp0Ttn0YmwcKnMX
 /51IKz1ujJY1aE0qzF4YaS+s8EjYjdpdLV3mnczwWF/cAcuneCSGEuHse1aOhK/UPZ8mBI68yZC
 cl9XMiPe3PGPOyIjNmJJHMdG7PXMxe7rOiLB5L3pt4MxQ+NZ1LgK5qi566r0e4Uqa8CxmzGevzF
 REVuZqba6cyo/O9HkFNKxN1UdU31HGAltRvOSBoaDBkWLekEjaxXNgbKBqYMeLE06/6n9kU9fik
 b4CF6jP8HzqNyymahloMrCwNi4rq3pRdDVjJ8V2sr2kkvCM7zz6LdLA4T6Y09zio/0TJxbg6rNL
 3gvP7VpLrBrk1b7zfICzKDCt+147Y+L3CI7CF1OxXRJH00lyqEx6g8qi8fa53lIjDoLm4h94b/a
 UWWPz0tLwohZob9WpGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224

On probe the RGMII link clock is initialised at SPEED_1000, which
translates to a 250 MHz source clock even when no PHY link is present,
drawing unnecessary power.

Initialise at SPEED_10 instead; fix_mac_speed updates the rate once
a link is established.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a92bf4a6a2dbd987893bd4a3890df770bb7a7e56..2471871562ed9915398614d5c88d1c6673829db8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -814,7 +814,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to get serdes phy\n");
 
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
-			       SPEED_1000);
+			       SPEED_10);
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.34.1

