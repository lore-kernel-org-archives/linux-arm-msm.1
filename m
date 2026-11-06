Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968426;
	b=C+sxbxN1mhdIT+x0BWE15wnNPvNngT7g0ASK086wscbLr4TGYz5PctUYgmGN/o+euPvK
	 Ld9g2nbSTVzTYqaqwNqKr2KupW6rGseOjEfRc1uPa3BJvrIEvHWe5jesCDnDd2UEa59c3
	 sXjnQHgtIoYAzQvAj4NJABIo1IX/GpM65gkSqnnjQYGjrZrrBsugIoQHNMaNnBr5XeAPe
	 TJXlsllFJQ7gZpWb24RU+nWPfp2eWW/Rc6y6Qh2ngSY9XwFRO36zTh52mEajuTOOrw8hX
	 i0a6anXShXBX/vIqeDLDCl3utq98/N7ZvcqJ2CNgIe8FPo+IojC2AnmH9WQVNOG/N8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968426;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yaTzFDos1He5u0Inl5fiMb3/qvjgsfEDWvcCeeW/87c=;
	b=zH1eBX9TqQe0Oy67B5aCSuPDE1Eb6TJTcbdxso1DvuBmG1drbER+c1J8FdqvVTCgR18l
	 MLoWlpjYtQ9t9aSsbmxhI5JC8RQjxZ3fyG9YiY+p0JlpN2zeVaA79jdp6/VleAmdq/WG9
	 qXKQ2w2vkQmFJiy69J3IFTHl/0shOnNNn6ZWaZdfncRYITuflDPS2J6avczrl+PkRbj/Z
	 r717wksRg8/3eKMNKkSnqt+k6WBgVYI3LcecVddEvp0cS8+I+i6DwrFNUuadVS9/xU43g
	 Zq7mBMvstLxD1A1eZlp8KLG590WsnmndriL9/6SsiayRHARsYOgR+HeT2ZZwnEGKKmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KURNiPJF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EpA2WVMR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA20606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 12:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EA20606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KURNiPJF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EpA2WVMR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APFY2444341
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 12:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaTzFDos1He5u0Inl5fiMb3/qvjgsfEDWvcCeeW/87c=; b=KURNiPJF1T4e9Jyr
	XsgNebTnPP9JDEfU1fvFUoNRAQay2ohZzRz60t3OOaxDNnrf6RN4skcaA3L7AtCB
	wA2wRLSqOwKaYDZaaaDlJLjE6vd40dhPlTqwfykANq/kCwf+8W6yqPpXqfZUvKVm
	qhbFXKkYyMQjqeScWUAa9vvXsCHISKBJrby6JOqoi3vCLMkwBrl1COChFOJfxDMX
	Do9rjA/SnK5WKzzi900GcoZhRRi3ToQ8fqS3f9x4rKI1zkf++CLvjiUlDYdOb2ZJ
	5z1aeGZVT7NQ39BwzBbUXvBxcLvl2vr67qxSAN/UBSje5GtYqDGJJN3lfrXg36TH
	7jjmzw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9ttpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 12:33:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so946761eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 04:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968425; x=1794573225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaTzFDos1He5u0Inl5fiMb3/qvjgsfEDWvcCeeW/87c=;
        b=EpA2WVMRAWL1G2qkHuX+HPOIKBIh2J0GqTNBlIlissw31NXMcOxAyUu3E9A3FDofpz
         iXe3xhI3t2WfX1ktrkkBxlXTYt12GqesuiDWLTrDxYSbKiOSOxRZZ7QOrmyjsxMCP4uf
         IhIh7egeF+FiziLoztB5sT7DPDEUqfHXEGxq/TIBYAdLSkKSf6Pahm7jj+OBvYKqpGAI
         udFGagCfbnm/c8qllVFGN/6KKidjkQuRpzc7PznKgUF5Kwhcp5U2eHh19svgKPVS7Wm1
         g5P9AuJEaXpEpdfutZrvJUblks+LqR+RIIVpdfWtqkD83ND25d3WHU4G0pBr2M3Yj6H8
         IVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968425; x=1794573225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaTzFDos1He5u0Inl5fiMb3/qvjgsfEDWvcCeeW/87c=;
        b=giigvsH+YoufOX+Hkj3C2TpvPQz3qDVVeSh9V+FhpDesWDmuj8YA4snMzXYLpzoFdy
         15YTua07LLLCfdTHQaUwafcZjL5g6IPga8LFMCvMSsggZCBlTyekiypDpT1Nqk5YlACG
         ceCaOgk/1ri3NM7jp/fwinQae+oO8w2wIumLsRTh4ghBNBVxgAi4pZ2bZRy7aXz6QN1y
         BcgvlrOGc0/OorQaOn5EGgOWXU12WsA6Q1Ep6Se//vi5WpdMrvLn+ZkdF5FJJihNPPUR
         AZTns6dIbgA6hdyNgzMM6KjZT8qRxkH6dr5Uw5AqDbLOIXYgYu9JpfBqOKRpZQh/ssEh
         VlXg==
X-Forwarded-Encrypted: i=1; AL+hErE5fFV4tXPtbhKul5j/xqKCSKqr3bxwuBfLS8Z3UbXTlPoP5wZAv1WUwGucboBwbBKfvXIyoIPjDbgPMEDE@vger.kernel.org
X-Gm-Message-State: APuU4Z8znfKHqlMGbj8YUX7QPXaulS8l4Yc6Tf/6gNc9sHzn0DUmTLhR
	Lex7YU/j2TBuidiOPJs+0SGKZS0Yy+cjJqluSySo2Xe11gml6jwpUIyL67e6MsMtMijx/II/wWS
	EWDFzkAb+DB8EpzUZ9v/+VjDXTY1dC5GYXSoE++tpgbyDtv4qO8p4+207ki+upMvwFyTr
X-Gm-Gg: AYBFou017/SYMyZFHkuZNv6S5L1Md5dY9KKWGANF/Q7oR9Wliws4PCS4w1rlyrViOGB
	y135VCCJO9GgLS7Lg/Axsq9hJo5O6AYQwZIUOPkNdDdjy0x5WbTSpqUG4tdNTZRwMNbvEs1+04/
	16u0dNCnLGIfslGEmZRbN5+q7kSI6zdptOXj02q7qZHOQmyHd/1Nj5As51G8K69baE+a7nG6qnU
	yVLt1mR2uEsrpEFoV4J2uFPLkoJWS9qfSzKUbvffawct99eXYZmfvY+kmRviWmSp9GrTmmCEoNC
	c5Fk2p1SJXKNVzlzl3MRJA106m2m2NOWXr4QRMjDCqM9yFxRSf7JiHnALhdXNiCU9q8UDbKAaTx
	ySoMrle2rfjbQ0IQ7wQVyJ4Qu1Xifo/emElvW4+pvnddyOsokCb2LActCBXWxu5v3Ju42wnVX80
	re8GZCimO3
X-Received: by 2002:a05:7301:dd81:b0:36f:64e9:f1c4 with SMTP id 5a478bee46e88-36f7553bf78mr3084266eec.6.1793968423382;
        Fri, 06 Nov 2026 04:33:43 -0800 (PST)
X-Received: by 2002:a05:7301:dd81:b0:36f:64e9:f1c4 with SMTP id 5a478bee46e88-36f7553bf78mr3084205eec.6.1793968422619;
        Fri, 06 Nov 2026 04:33:42 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:33:41 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 18:03:03 +0530
Subject: [PATCH v6 v6 4/9] ASoC: qcom: lpass-va-macro: Add shikra
 compatible
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
Message-Id: <20261106-add_shikra_support-v6-4-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
In-Reply-To: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968394; l=16565;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=pMkevngB1TwXlQAj3SKqNRTOXHvnLKhwTY1TDrygCU4=;
 b=Ps3jOg6d+Zwt6yRrtwLk4wdtfhGP1eauH2hfW8YNChvHhYclXQem5Fe17AN0bsnIcu+YvoNT9
 vD9hBvwJ95QDaJZMrgtlGwM9FGvAyIC6UZP46vsFZedo06/yd2PzTeX
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX3Cd825Y+NETB
 B8Q62WLfBfktwg84TgiSoYhnAVZ4rC3ZSD+9Y0Nu7I45PuAEmfGOIRmhC32elX4UWxQuJxqejf5
 lO2R6CAyaPbxsfHuoW9wzpyzfRki1Xo=
X-Proofpoint-GUID: yhhN0CS_tn9rtt2YAyfUHl_mBVw2iDas
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX4bRsr0WrsMYn
 nQ0H0hRQl/74USmj3CeEMrs87JrtefhtwpJrb0sN3aLoWzZGfMK4/LRSXZ4+92Iq8bs86y4RJwq
 xb4lZEInpQLG4yiTMEC1NLotpW7DkW17SBtbNC4hc2Ixk47MT5BH5xVbEnlVg3Q/fR7UuxwDUQ9
 fWvJXoxfsztlrZw149k+FUV5lgbsRvEIjusOWc+KJZIJz1CClQImP6BPdv0JOjo1Nj1JW66xl7W
 eJexj47DMLqpaOmArXk6pwX8tC6x3E0To6ah0BW4mHv5WI6kVeSDMFBEknGV1o2EttgCf2eEcEM
 LMf0SNEwJEIM3OIPxosYdaAVmotE6ueNiU1ZxCBlJ9tzQGxDoEb9YwqdjvWcd4zwilzkWfQFyN4
 S+Ym2OxhaIWQB9GAzvg2lQvgwIV+W5yxuL5UoZQRGBxx3srsAxEZYvdqARHMu3U6olAn7jXviAg
 VciIVE6ZSKsVChAYplA==
X-Proofpoint-ORIG-GUID: yhhN0CS_tn9rtt2YAyfUHl_mBVw2iDas
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aedc929 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DfWgr_zdYjWxq2KhsJ0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

Add shikra specific VA macro data and register programming needed by
the LPASS codec v4.1 implementation.

LPASS codec v4.1 extends the VA macro with four adaptive filter (ADPT)
blocks at 0x0800..0x09a4 and requires the FS counter to be bypassed
before it is enabled.

Add the new registers as a separate reg_default array, used by a v4.1
specific regmap config.

The register layout has to be chosen before the regmap exists, i.e.
before CDC_VA_TOP_CSR_CORE_ID_* can be read, so it comes from match data;
probe then cross checks it against the version reported by the hardware.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 276 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 269 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 03d6434a4a12..db395674312c 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -26,6 +26,7 @@
 #define CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL	(0x0004)
 #define CDC_VA_FS_CONTROL_EN			BIT(0)
 #define CDC_VA_FS_COUNTER_CLR			BIT(1)
+#define CDC_VA_FS_CNT_BYPASS			BIT(7)
 #define CDC_VA_CLK_RST_CTRL_SWR_CONTROL		(0x0008)
 #define CDC_VA_SWR_RESET_MASK		BIT(1)
 #define CDC_VA_SWR_RESET_ENABLE		BIT(1)
@@ -156,7 +157,54 @@
 #define CDC_VA_TX3_TX_PATH_SEC5			(0x05A4)
 #define CDC_VA_TX3_TX_PATH_SEC6			(0x05A8)
 
+/* LPASS codec v4.1 adaptive filter (ADPT) blocks */
+#define CDC_VA_CDC_ADPT0_ADPT_CTRL		0x0800
+#define CDC_VA_ADPT_CTRL_EN_MASK		GENMASK(7, 0)
+#define CDC_VA_CDC_ADPT0_ADPT_GAIN_0		0x0804
+#define CDC_VA_CDC_ADPT0_ADPT_GAIN_1		0x0808
+#define CDC_VA_CDC_ADPT0_DH_FSM_CTRL		0x080c
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0	0x0810
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1	0x0814
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2	0x0818
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3	0x081c
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4	0x0820
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5	0x0824
+
+#define CDC_VA_CDC_ADPT1_ADPT_CTRL		0x0880
+#define CDC_VA_CDC_ADPT1_ADPT_GAIN_0		0x0884
+#define CDC_VA_CDC_ADPT1_ADPT_GAIN_1		0x0888
+#define CDC_VA_CDC_ADPT1_DH_FSM_CTRL		0x088c
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_0	0x0890
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_1	0x0894
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_2	0x0898
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_3	0x089c
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_4	0x08a0
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_5	0x08a4
+
+#define CDC_VA_CDC_ADPT2_ADPT_CTRL		0x0900
+#define CDC_VA_CDC_ADPT2_ADPT_GAIN_0		0x0904
+#define CDC_VA_CDC_ADPT2_ADPT_GAIN_1		0x0908
+#define CDC_VA_CDC_ADPT2_DH_FSM_CTRL		0x090c
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_0	0x0910
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_1	0x0914
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_2	0x0918
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_3	0x091c
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_4	0x0920
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_5	0x0924
+
+#define CDC_VA_CDC_ADPT3_ADPT_CTRL		0x0980
+#define CDC_VA_CDC_ADPT3_ADPT_GAIN_0		0x0984
+#define CDC_VA_CDC_ADPT3_ADPT_GAIN_1		0x0988
+#define CDC_VA_CDC_ADPT3_DH_FSM_CTRL		0x098c
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_0	0x0990
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_1	0x0994
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_2	0x0998
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_3	0x099c
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_4	0x09a0
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_5	0x09a4
+
 #define VA_MAX_OFFSET				(0x07A8)
+#define VA_4_1_MAX_OFFSET			0x09a4
 
 #define VA_MACRO_NUM_DECIMATORS 4
 #define VA_MACRO_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
@@ -210,7 +258,8 @@ struct va_macro {
 	u16 dmic_clk_div;
 	bool has_swr_master;
 	bool has_npl_clk;
-
+	bool fs_cnt_bypass;
+	bool has_adpt;
 	int dec_mode[VA_MACRO_NUM_DECIMATORS];
 	struct regmap *regmap;
 	struct clk *mclk;
@@ -237,6 +286,7 @@ struct va_macro_data {
 	bool has_swr_master;
 	bool has_npl_clk;
 	int version;
+	const struct regmap_config *regmap_config;
 };
 
 static const struct va_macro_data sm8250_va_data = {
@@ -357,6 +407,119 @@ static const struct reg_default va_defaults[] = {
 	{ CDC_VA_TX3_TX_PATH_SEC6, 0x00},
 };
 
+static const struct reg_default va_4_1_defaults[] = {
+	/* VA macro */
+	{ CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
+	{ CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
+	{ CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},
+	{ CDC_VA_TOP_CSR_TOP_CFG0, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC0_CTL, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC1_CTL, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC2_CTL, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC3_CTL, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC_CFG, 0x80},
+	{ CDC_VA_TOP_CSR_DEBUG_BUS, 0x00},
+	{ CDC_VA_TOP_CSR_DEBUG_EN, 0x00},
+	{ CDC_VA_TOP_CSR_TX_I2S_CTL, 0x0C},
+	{ CDC_VA_TOP_CSR_I2S_CLK, 0x00},
+	{ CDC_VA_TOP_CSR_I2S_RESET, 0x00},
+	{ CDC_VA_TOP_CSR_CORE_ID_0, 0x00},
+	{ CDC_VA_TOP_CSR_CORE_ID_1, 0x00},
+	{ CDC_VA_TOP_CSR_CORE_ID_2, 0x00},
+	{ CDC_VA_TOP_CSR_CORE_ID_3, 0x00},
+	{ CDC_VA_TOP_CSR_SWR_MIC_CTL0, 0xEE},
+	{ CDC_VA_TOP_CSR_SWR_MIC_CTL1, 0xEE},
+	{ CDC_VA_TOP_CSR_SWR_MIC_CTL2, 0xEE},
+	{ CDC_VA_TOP_CSR_SWR_CTRL, 0x06},
+	/* VA core */
+	{ CDC_VA_TX0_TX_PATH_CTL, 0x04},
+	{ CDC_VA_TX0_TX_PATH_CFG0, 0x10},
+	{ CDC_VA_TX0_TX_PATH_CFG1, 0x0B},
+	{ CDC_VA_TX0_TX_VOL_CTL, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC0, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC1, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC2, 0x01},
+	{ CDC_VA_TX0_TX_PATH_SEC3, 0x3C},
+	{ CDC_VA_TX0_TX_PATH_SEC4, 0x20},
+	{ CDC_VA_TX0_TX_PATH_SEC5, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC6, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC7, 0x25},
+	{ CDC_VA_TX1_TX_PATH_CTL, 0x04},
+	{ CDC_VA_TX1_TX_PATH_CFG0, 0x10},
+	{ CDC_VA_TX1_TX_PATH_CFG1, 0x0B},
+	{ CDC_VA_TX1_TX_VOL_CTL, 0x00},
+	{ CDC_VA_TX1_TX_PATH_SEC0, 0x00},
+	{ CDC_VA_TX1_TX_PATH_SEC1, 0x00},
+	{ CDC_VA_TX1_TX_PATH_SEC2, 0x01},
+	{ CDC_VA_TX1_TX_PATH_SEC3, 0x3C},
+	{ CDC_VA_TX1_TX_PATH_SEC4, 0x20},
+	{ CDC_VA_TX1_TX_PATH_SEC5, 0x00},
+	{ CDC_VA_TX1_TX_PATH_SEC6, 0x00},
+	{ CDC_VA_TX2_TX_PATH_CTL, 0x04},
+	{ CDC_VA_TX2_TX_PATH_CFG0, 0x10},
+	{ CDC_VA_TX2_TX_PATH_CFG1, 0x0B},
+	{ CDC_VA_TX2_TX_VOL_CTL, 0x00},
+	{ CDC_VA_TX2_TX_PATH_SEC0, 0x00},
+	{ CDC_VA_TX2_TX_PATH_SEC1, 0x00},
+	{ CDC_VA_TX2_TX_PATH_SEC2, 0x01},
+	{ CDC_VA_TX2_TX_PATH_SEC3, 0x3C},
+	{ CDC_VA_TX2_TX_PATH_SEC4, 0x20},
+	{ CDC_VA_TX2_TX_PATH_SEC5, 0x00},
+	{ CDC_VA_TX2_TX_PATH_SEC6, 0x00},
+	{ CDC_VA_TX3_TX_PATH_CTL, 0x04},
+	{ CDC_VA_TX3_TX_PATH_CFG0, 0x10},
+	{ CDC_VA_TX3_TX_PATH_CFG1, 0x0B},
+	{ CDC_VA_TX3_TX_VOL_CTL, 0x00},
+	{ CDC_VA_TX3_TX_PATH_SEC0, 0x00},
+	{ CDC_VA_TX3_TX_PATH_SEC1, 0x00},
+	{ CDC_VA_TX3_TX_PATH_SEC2, 0x01},
+	{ CDC_VA_TX3_TX_PATH_SEC3, 0x3C},
+	{ CDC_VA_TX3_TX_PATH_SEC4, 0x20},
+	{ CDC_VA_TX3_TX_PATH_SEC5, 0x00},
+	{ CDC_VA_TX3_TX_PATH_SEC6, 0x00},
+	/* ADPT blocks */
+	{ CDC_VA_CDC_ADPT0_ADPT_CTRL, 0x51},
+	{ CDC_VA_CDC_ADPT0_ADPT_GAIN_0, 0x11},
+	{ CDC_VA_CDC_ADPT0_ADPT_GAIN_1, 0x01},
+	{ CDC_VA_CDC_ADPT0_DH_FSM_CTRL, 0x02},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0, 0x77},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1, 0x64},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2, 0x00},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3, 0x41},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4, 0x04},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5, 0x01},
+	{ CDC_VA_CDC_ADPT1_ADPT_CTRL, 0x51},
+	{ CDC_VA_CDC_ADPT1_ADPT_GAIN_0, 0x11},
+	{ CDC_VA_CDC_ADPT1_ADPT_GAIN_1, 0x01},
+	{ CDC_VA_CDC_ADPT1_DH_FSM_CTRL, 0x02},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_0, 0x77},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_1, 0x64},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_2, 0x00},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_3, 0x41},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_4, 0x04},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_5, 0x01},
+	{ CDC_VA_CDC_ADPT2_ADPT_CTRL, 0x51},
+	{ CDC_VA_CDC_ADPT2_ADPT_GAIN_0, 0x11},
+	{ CDC_VA_CDC_ADPT2_ADPT_GAIN_1, 0x01},
+	{ CDC_VA_CDC_ADPT2_DH_FSM_CTRL, 0x02},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_0, 0x77},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_1, 0x64},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_2, 0x00},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_3, 0x41},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_4, 0x04},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_5, 0x01},
+	{ CDC_VA_CDC_ADPT3_ADPT_CTRL, 0x51},
+	{ CDC_VA_CDC_ADPT3_ADPT_GAIN_0, 0x11},
+	{ CDC_VA_CDC_ADPT3_ADPT_GAIN_1, 0x01},
+	{ CDC_VA_CDC_ADPT3_DH_FSM_CTRL, 0x02},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_0, 0x77},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_1, 0x64},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_2, 0x00},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_3, 0x41},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_4, 0x04},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_5, 0x01},
+};
+
 static bool va_is_rw_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -430,6 +593,46 @@ static bool va_is_rw_register(struct device *dev, unsigned int reg)
 	case CDC_VA_TX3_TX_PATH_SEC4:
 	case CDC_VA_TX3_TX_PATH_SEC5:
 	case CDC_VA_TX3_TX_PATH_SEC6:
+	case CDC_VA_CDC_ADPT0_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT0_ADPT_GAIN_0:
+	case CDC_VA_CDC_ADPT0_ADPT_GAIN_1:
+	case CDC_VA_CDC_ADPT0_DH_FSM_CTRL:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5:
+	case CDC_VA_CDC_ADPT1_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT1_ADPT_GAIN_0:
+	case CDC_VA_CDC_ADPT1_ADPT_GAIN_1:
+	case CDC_VA_CDC_ADPT1_DH_FSM_CTRL:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_0:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_1:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_2:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_3:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_4:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_5:
+	case CDC_VA_CDC_ADPT2_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT2_ADPT_GAIN_0:
+	case CDC_VA_CDC_ADPT2_ADPT_GAIN_1:
+	case CDC_VA_CDC_ADPT2_DH_FSM_CTRL:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_0:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_1:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_2:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_3:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_4:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_5:
+	case CDC_VA_CDC_ADPT3_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT3_ADPT_GAIN_0:
+	case CDC_VA_CDC_ADPT3_ADPT_GAIN_1:
+	case CDC_VA_CDC_ADPT3_DH_FSM_CTRL:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_0:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_1:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_2:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_3:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_4:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_5:
 		return true;
 	}
 
@@ -463,6 +666,26 @@ static const struct regmap_config va_regmap_config = {
 	.writeable_reg = va_is_rw_register,
 };
 
+static const struct regmap_config va_4_1_regmap_config = {
+	.name = "va_macro",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_MAPLE,
+	.reg_defaults = va_4_1_defaults,
+	.num_reg_defaults = ARRAY_SIZE(va_4_1_defaults),
+	.max_register = VA_4_1_MAX_OFFSET,
+	.volatile_reg = va_is_volatile_register,
+	.readable_reg = va_is_readable_register,
+	.writeable_reg = va_is_rw_register,
+};
+
+static const struct va_macro_data shikra_va_data = {
+	.has_swr_master = true,
+	.has_npl_clk = true,
+	.regmap_config = &va_4_1_regmap_config,
+};
+
 static int va_clk_rsc_fs_gen_request(struct va_macro *va, bool enable)
 {
 	struct regmap *regmap = va->regmap;
@@ -471,10 +694,14 @@ static int va_clk_rsc_fs_gen_request(struct va_macro *va, bool enable)
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_MCLK_CONTROL,
 				   CDC_VA_MCLK_CONTROL_EN,
 				   CDC_VA_MCLK_CONTROL_EN);
-		/* clear the fs counter */
+
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR);
+
+		if (va->fs_cnt_bypass)
+			regmap_set_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
+					CDC_VA_FS_CNT_BYPASS);
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
 				   CDC_VA_FS_CONTROL_EN);
@@ -503,7 +730,7 @@ static int va_macro_mclk_enable(struct va_macro *va, bool mclk_enable)
 	if (mclk_enable) {
 		va_clk_rsc_fs_gen_request(va, true);
 		regcache_mark_dirty(regmap);
-		regcache_sync_region(regmap, 0x0, VA_MAX_OFFSET);
+		regcache_sync_region(regmap, 0x0, regmap_get_max_register(regmap));
 	} else {
 		va_clk_rsc_fs_gen_request(va, false);
 	}
@@ -749,6 +976,7 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 	unsigned int decimator;
 	u16 tx_vol_ctl_reg, dec_cfg_reg, hpf_gate_reg;
 	u16 tx_gain_ctl_reg;
+	u16 adpt_ctrl_reg;
 	u8 hpf_cut_off_freq;
 
 	struct va_macro *va = snd_soc_component_get_drvdata(comp);
@@ -763,6 +991,7 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 				VA_MACRO_TX_PATH_OFFSET * decimator;
 	tx_gain_ctl_reg = CDC_VA_TX0_TX_VOL_CTL +
 				VA_MACRO_TX_PATH_OFFSET * decimator;
+	adpt_ctrl_reg = CDC_VA_CDC_ADPT0_ADPT_CTRL + decimator * VA_MACRO_TX_PATH_OFFSET;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -772,6 +1001,10 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 		/* Enable TX PGA Mute */
 		break;
 	case SND_SOC_DAPM_POST_PMU:
+		if (va->has_adpt)
+			snd_soc_component_update_bits(comp, adpt_ctrl_reg,
+						      CDC_VA_ADPT_CTRL_EN_MASK, 0x00);
+
 		/* Enable TX CLK */
 		snd_soc_component_update_bits(comp, tx_vol_ctl_reg,
 					      CDC_VA_TX_PATH_CLK_EN_MASK,
@@ -1526,6 +1759,14 @@ static int va_macro_set_lpass_codec_version(struct va_macro *va)
 		default:
 			break;
 		}
+	} else if (maj == 4) {
+		switch (min) {
+		case 1:
+			version = LPASS_CODEC_VERSION_4_1;
+			break;
+		default:
+			break;
+		}
 	}
 
 	if (version == LPASS_CODEC_VERSION_UNKNOWN) {
@@ -1547,6 +1788,7 @@ static int va_macro_probe(struct platform_device *pdev)
 	const struct va_macro_data *data;
 	struct va_macro *va;
 	void __iomem *base;
+	bool has_adpt_layout;
 	u32 sample_rate = 0;
 	int ret;
 	int rpm_ret;
@@ -1556,6 +1798,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	va->dev = dev;
+	data = of_device_get_match_data(dev);
 
 	va->macro = devm_clk_get_optional(dev, "macro");
 	if (IS_ERR(va->macro))
@@ -1592,15 +1835,15 @@ static int va_macro_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	va->regmap = devm_regmap_init_mmio(dev, base,  &va_regmap_config);
+	dev_set_drvdata(dev, va);
+
+	va->regmap = devm_regmap_init_mmio(dev, base,
+					   data->regmap_config ?: &va_regmap_config);
 	if (IS_ERR(va->regmap)) {
 		ret = -EINVAL;
 		goto err;
 	}
 
-	dev_set_drvdata(dev, va);
-
-	data = of_device_get_match_data(dev);
 	va->has_swr_master = data->has_swr_master;
 	va->has_npl_clk = data->has_npl_clk;
 
@@ -1654,6 +1897,24 @@ static int va_macro_probe(struct platform_device *pdev)
 			goto err_rpm_put;
 	}
 
+	va->fs_cnt_bypass = (lpass_macro_get_codec_version() == LPASS_CODEC_VERSION_4_1);
+	va->has_adpt = (lpass_macro_get_codec_version() == LPASS_CODEC_VERSION_4_1);
+
+	/*
+	 * The register layout comes from match data, as it has to be picked
+	 * before CDC_VA_TOP_CSR_CORE_ID_* can be read. Now that the codec
+	 * version is known, make sure the two agree, so that the ADPT blocks
+	 * are neither programmed outside the register window nor programmed
+	 * on a codec that does not implement them.
+	 */
+	has_adpt_layout = data->regmap_config == &va_4_1_regmap_config;
+	if (va->has_adpt != has_adpt_layout) {
+		dev_err(dev, "LPASS codec %s does not match the compatible\n",
+			lpass_macro_get_codec_version_string(lpass_macro_get_codec_version()));
+		ret = -EINVAL;
+		goto err_rpm_put;
+	}
+
 	if (va->has_swr_master) {
 		/* Set default CLK div to 1 */
 		regmap_update_bits(va->regmap, CDC_VA_TOP_CSR_SWR_MIC_CTL0,
@@ -1775,6 +2036,7 @@ static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
 	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
+	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, va_macro_dt_match);

-- 
2.34.1

