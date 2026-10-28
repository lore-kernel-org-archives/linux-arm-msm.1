Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183961;
	b=rIHoYBNBdPVQrzyukHq20+3CgE9I281FQxW5mQFkvgmD9bVTdmPVlpCDvrNemRny0tZe
	 X0ac3pgqdFdobTdUDvncUSfQCjEbUM3eRMwVVh6t5fkDiz65iaSJeKoCJ+dFrSDSISzQC
	 tTUt1GPFvVT6/DfXdAhZnNG5oTVCNKTxx/o/kYZ6wKTNIjO926zp50J3QVj3O/oDTRM8b
	 a1LgXz3SxFGdDKbZIsvTxgUsEpRhWC3DOQ+Is20d7D2VW/+R5LrFmhdAN6gZpf918bKrl
	 JWnqQoK57PwFXKQnjOzJj53P4njd7imP8uHV9Uy0i3Ip9IoXFONRjbG3AyQUZnBH5yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183961;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cOggzBuXe5PWUbLSzi+bwdNe7VzMo5TdvnBdqMxg6RA=;
	b=b9mP0kNPbO0OKRq++HGkhiug8FDBJG8yTPqN6W6WZk+EHXTk1vHYC+LYVvBTgJsSSPc/
	 UJZO6qMTXge0lvCLq/wDLXq5pq3ZDtuilwO0GoV61Hk932w0lcqmlJ0sb0zz3y15zcDUc
	 5i/3HudmdxTQGHaMWbDXRHbITjSDvCLrjHs50MKsCNVReVs7iIyYG2JYKdKtQpS5dqbBQ
	 M4i9nfVyWUntxFK7L44qyf1GNzm9hxV5EyCpPXxiVEVRpZjtBFaC10w07SeGGx2/3uHHW
	 yzD227UPie+K4EWO7+/P/xd5rP+O7dATw0a1Idj1CEKwCYzPpUe6IBZf5cbFj+5kuwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ex41vhHj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZB0faxeP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DA2606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45DA2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ex41vhHj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZB0faxeP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KxlY1101871
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cOggzBuXe5PWUbLSzi+bwdNe7VzMo5TdvnBdqMxg6RA=; b=Ex41vhHjCXZfXRf3
	M5h5ID5ktYSlPWFWs43rtvcAEPFiAcZDLTQa3MhrKPvDDfxT6f15bqD93gFqQcpn
	jPjh84iD9iJQ9r3PmqdWhleVrOro9AjVZmov59xGcmsrvJbPiIKC9z/rIZRaZv8Q
	YcQFQRYAhLEinnY7YcBCRRXkPhHZ/sv2+aZpAdKn/yr2uejDQAplgtROaEIiTEnx
	DXUWAxGRTNu/L37zlZI3KC7Y7TgApZB5rUj3I/FoXlmtuKkVKSR2Z1bSsKL0AVYl
	K8UUt9VnaZpuE/CGTgjLfCg/6UR88gL9BsakyhxwF69zjJWsVX1arqLoqSuGGJ3W
	UtkLYg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7rg7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:39:20 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1663fb7e005so1064963c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183959; x=1793788759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOggzBuXe5PWUbLSzi+bwdNe7VzMo5TdvnBdqMxg6RA=;
        b=ZB0faxePdQDhxAuKylBL55Lr8TW1m1ZF8FetBFcx/pahznBG44AEgneOp/2E/gF9nh
         Tsftkr+CoD1lNn52zDYNk4ii1UcKLR7GOs3wRdm7DJCG097oX8oJfMa1Ij7+ss7Tyw6r
         boarXNvKEB+1WVt0RbuupycPeXsbUf9dMkHD4LvAj4BWRxYLqxlF5rPWlr4A1Gj3v99m
         RSEkWXOP6BIwM/uaVa3qbeTJZU28WgD7wiqW/dRa1uM1N7esaq483lGHOPsVrndZKdP4
         ljPrWQ58ZS9rK7VnZOijO0Zg4EAjM80XLwnlTG6w0gBcvcWXj3ATQMz1eS2F0oWNK+NA
         XXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183959; x=1793788759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cOggzBuXe5PWUbLSzi+bwdNe7VzMo5TdvnBdqMxg6RA=;
        b=bZThchmeGjikgYcyFJMM/jQrGo3vv/aGrs5Q+zllzW7gegL2InWKl43cLMDDZLZWmf
         ZDVJttSciMyYXJwe7l6t+nX/0X+8pv7ksSfY+Ta33oBQ8FKupBLkap5eSKHZlRA7WPms
         lfqC67vGTRvVWNiboL2WjwKqBHVPVRPpMdXQDpYk0akWV1KhrIZEMVzt1JJUNTR6i8qR
         x+PXN8o88G4S6TCBDM3geWvWwhG7OIg4F4j+O2SN/7aaun+fOzGKTOgVKbE4ieziZYm+
         L3rngUS7JZimrNh/DDsGmjGW6t0cRGMpH6a8IdIroKb8xLv9gelVJ5KDDaGd9rpAFo7P
         2TIQ==
X-Gm-Message-State: AFq9FYL+uhgLxSATAWbuGLGiLzFjOr7j04LECkq4KCuefBv0zPuX70dL
	ZraZb/SI/lHur64t+WTKjzSnVo5m5MZzsRUvZF7ljY9HNX9zqav96eR3C0NJY/uZM5lHyCe39yd
	6il6Ti65mSbd91XMYzA+Nu6Pve/dzuPO9S4rOB1e4BBrcNpoNp7IUgDGwd6/RnK8gOGf9
X-Gm-Gg: AYBFou1ma2W27YeH0UTsiTUAq8RIo7TXihfRFLkC3mxJXvY1csUEzbDBxtwwU7vNTt8
	Px8WZuQVewpzIPcI32r2TVtW5WSljQDKeMfbJ874w8bxjFGkp6ymKnD/ZpfuVC5czt5yjRD3fYK
	/CxFALHiIFhA0qqDoXGDDcKSeR+eji0VtfLPE4tsfgoSuPBXKxKqrIUMkAxg53KJr0t7/OqAIjE
	kbfNsk/0/ZkdWf0ZIvqyjoqACq2njdT6Tl5jsmhp2Xm2/SjkZO7fU0cmHDVepxWP93asOX/s7Mr
	E8cIg6CaQLTraD71g8tswyYCQARydvxMhol1zFVbI+FWPG60l6lerT2qdO10Gjlcy78Dh3AaJ+0
	ZOcfntjTQAQOnh/DG6J7l/wKqMValnIZmRjF60Wg3wp3wBin6uTlcACWyAjU8nUI8N1vysRdhli
	w=
X-Received: by 2002:a05:7022:6989:b0:183:7d42:cfb5 with SMTP id a92af1059eb24-1a6cfa0c476mr3695691c88.19.1793183959046;
        Wed, 28 Oct 2026 03:39:19 -0700 (PDT)
X-Received: by 2002:a05:7022:6989:b0:183:7d42:cfb5 with SMTP id a92af1059eb24-1a6cfa0c476mr3695659c88.19.1793183958485;
        Wed, 28 Oct 2026 03:39:18 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm8340186c88.14.2026.10.28.03.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:39:18 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:08:05 +0530
Subject: [PATCH v6 09/11] phy: qualcomm: qmp-combo: Add per-link-rate
 auxless/LFPS and drive level for Glymur
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-glymur-phy-v3-v6-9-1f1d2e565a66@oss.qualcomm.com>
References: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
In-Reply-To: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Jeff Roach <jeff.roach0@gmail.com>, Luke Macken <luke@phorex.org>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183900; l=4357;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=3qT30A/YMPDhZ+MpLmMclyxDiHTDhR4lXcagSkGGyhc=;
 b=N32otEYMycrrVUbiLKxd65HewJ1OTs55AMU4yQ0Dd2DDTU7AYkDw3VI/Kpri0vyyi4Fhe3i1P
 StPcxntzNSQB2r7dOGUVrW7IgGz3olvVov/KWYKQHF3Y2PhxSwfGRHF
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1d0d8 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mO8_gwkcAAAA:8 a=tE633ojKFf1lYKHj1RUA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-GUID: ZqI9iKFKiw0NyueuH9pC6ZcP5Ty3pZ3T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX0+lcyfCk8vUI
 67QQL7QQQH1peVnl8XCSVci1LMYUQl4KB0oiMsKEsDIOY8M5XcYgfZhRINCNgP1y+Za78TapWu0
 EF8LnP9O9Eo7RdPtVNxnZVgGTfwpaPw=
X-Proofpoint-ORIG-GUID: ZqI9iKFKiw0NyueuH9pC6ZcP5Ty3pZ3T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX+5maC8Y/jtaw
 T+4enxFGeGF+94etBbnfcYDBEjodhUoJvsR0qDOyCWD3fHy3ppCn1olr0xA8W/b644TMcBKMBTE
 7B26qSDxMXVaCbsAwNi76MtyJdsDo6eSMoLf6Th+2B0xMpvToV2VtmLV4p3pYUVXgBSj26xrXJ3
 ritJo0bn13WpIbv0tJ/2cWDbS7wXlkfCT8ll5gYvrrX+rizvQTLQ8d8aCCqGeQCoHNl+MvCHdjP
 L/DYCOlirTgNTGWuGismBDLJgAPSMRPXpeI94zHb10IUEHeofJaRLqZcWn3odQl5I61zVVG5eu5
 z/cgriZ+znXJs5HaSIuvVEOuAKByTqcXsG/kKoJ1hdfylos4Bbdax+vcGumqETKQWDMoQGkOJ5b
 BWLmBlN2rL++UYGjrtFOl5JChw/zpNesVADol7AwLo9PiU3RtmWuY1bHv28E/0DMjYms0LT70q3
 Db1cQPYADnTQJEo1A8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add per-link-rate auxless setup/silence cycle and LFPS period values
instead of using fixed constants:
  RBR (1.62 Gbps): setup=0x03, silence=0x06, lfps_period=0x00
  HBR (2.70 Gbps): setup=0x04, silence=0x08, lfps_period=0x11
  HBR2 (5.40 Gbps): setup=0x09, silence=0x11, lfps_period=0x33
  HBR3 (8.10 Gbps): setup=0x0f, silence=0x1a, lfps_period=0x55

Add per-lane drive level lookup from the ln_drv_lvl tables based on
the maximum voltage swing and pre-emphasis levels across all active
lanes, replacing the hardcoded 0x1f value.

without this change following error can occur:
- Link training failures or instability at higher rates (HBR2/HBR3)
- Incorrect LFPS signaling timing, potentially breaking USB3+DP
combo mode entry/exit

Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 39 +++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 51d7102aefc3..10b3efe48721 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3945,21 +3945,47 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
-	unsigned long pixel_freq;
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	unsigned long pixel_freq;
+	u32 auxless_setup, auxless_silence, lfps_period;
+	unsigned int v_level = 0, p_level = 0;
+	u8 ln_drv_lvl;
+	int i;
+
+	for (i = 0; i < dp_opts->lanes; i++) {
+		v_level = max(v_level, dp_opts->voltage[i]);
+		p_level = max(p_level, dp_opts->pre[i]);
+	}
+
+	if (dp_opts->link_rate <= 2700)
+		ln_drv_lvl = (*cfg->ln_drv_lvl_hbr_rbr)[v_level][p_level];
+	else
+		ln_drv_lvl = (*cfg->ln_drv_lvl_hbr3_hbr2)[v_level][p_level];
 
 	switch (dp_opts->link_rate) {
 	case 1620:
 		pixel_freq = 1620000000UL / 2;
+		auxless_setup = 0x03;
+		auxless_silence = 0x06;
+		lfps_period = 0x00;
 		break;
 	case 2700:
 		pixel_freq = 2700000000UL / 2;
+		auxless_setup = 0x04;
+		auxless_silence = 0x08;
+		lfps_period = 0x11;
 		break;
 	case 5400:
 		pixel_freq = 5400000000UL / 4;
+		auxless_setup = 0x09;
+		auxless_silence = 0x11;
+		lfps_period = 0x33;
 		break;
 	case 8100:
 		pixel_freq = 8100000000UL / 6;
+		auxless_setup = 0x0f;
+		auxless_silence = 0x1a;
+		lfps_period = 0x55;
 		break;
 	default:
 		/* Other link rates aren't supported */
@@ -3969,18 +3995,17 @@ static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp)
 	/* disable core reset tsync */
 	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	writel(0x04, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
-	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
+	writel(auxless_setup, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
+	writel(auxless_silence, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
 	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_CYC);
-	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
+	writel(lfps_period, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
 
 	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX2_TX3_LANE_CTL);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX0_TX1_LANE_CTL);
 	writel(0x01, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_CFG1);
-	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
-	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN0_DRV_LVL);
-	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
+	writel(ln_drv_lvl, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN0_DRV_LVL);
+	writel(ln_drv_lvl, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
 
 	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
 	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);

-- 
2.34.1

