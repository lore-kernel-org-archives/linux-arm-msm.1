Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376497;
	b=G90B2ck9xM9rsCGUU04wdTeZNEuuw+oS7TiuaYGtWIrI0j+kN/zTlRb5qP75B1k4/TX4
	 3mrbplM/VTjY+ORBKpLWMNmybSQ9piDsugoyVmVqm2szPI5OXxkwPnvOKy9WkBpVngzFS
	 6evHQJ3JMUev3ArOBUOUjtJjlU8NNIpOsFS6rXE8HhIug+00OzsoZwbxqEIybGvhPO/+L
	 2egbXiglp7Zv5Gr+p5kZtI9b6JoAs/0Xf/ffO/0jM2QnzK2iWC4aUA085UB/tQOY8u27+
	 fHjc5+yIWBgMiY5YNQAnMhJwhlrvQ1o0y/Jz3O92/HCwVMkrRBqB2iepSE+6s8HdlHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZTyZfh2vpkguWMlHu7iQNp2bVhFcR2C7lr2zyFVmITc=;
	b=ZAErQ17ZpYgqapw0JEfeGJxcikf+mwDTagwPaaw+4W+OtOD20lkGqTtrMY3Dg0JaM5/2
	 knfRCHB1OQRkV8ULQu5gu1iz9UYV1ImuyLiNv377vY0ZjYsV3+JMnj9SkUf/a8GCGvHAa
	 U3Yt9IHCKWjE4A3tgtri3fYkqwfckHSA/alX8qkJCQQ7IRaMn+vKv31/FCiGP5tg5eYad
	 VBa54ImKxpkt7N2UDjMla6Fp8a8qVk6bJl3Xg0su4bRdsLUmH5Ga2I0yWUTA0z5kM/0m3
	 ghf8ZeERy1DW3vUsi6QMPwMrA/NuMyPSNcWZJmj+WnywGUVVg12DqB1/FcQU779t6JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pznymhil;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ILV/6SOY";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D738B606A331
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D738B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pznymhil;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ILV/6SOY
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVAgA412392
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZTyZfh2vpkguWMlHu7iQNp2bVhFcR2C7lr2zyFVmITc=; b=Pznymhil7qOIumbz
	nZbrB9lhsptGjgcMYzQY5uAmT/V/6eaUXZpghNUTB7U+izXm4cY4/fqGN1s8HmR0
	JCxmMJFmAmvnaDOFlHzTlIf7cirgBuS6ycUm4RA5O+oonVXR9DDavagU8o/29kZO
	vksSDnHUJ39jU/RJ3aU//DRLvmRwqvc9sU7hIfgCM/CokDYKlS6u8avSyIQ/WUIq
	LMcXPvVGmEVHq1vPhWjOD/wEodUrWgRLKiPLurpRZu2AljUheDM8J3aSLFL6PUFa
	iFAf1bOe/eslvKwvjIA8/VhFr8Ak88Z5Yfp1Cet61PBp5e68UmWFYTdFi3w5cU2r
	sOz9iA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6m69u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:41:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869accaac2so1207582eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 11:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376495; x=1795981295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZTyZfh2vpkguWMlHu7iQNp2bVhFcR2C7lr2zyFVmITc=;
        b=ILV/6SOYE7PN1AAGndLx4hbBk1HC/fbw6WfYaW+H7UR95CgwgpfwAq6teqssOgrtWK
         bqMT4pxbIpXOy2mJ5HV3QljSvQBqPr4GBPSHaBbHF22PAH5DqHuwJOZ0uLbKQ0M8pmfa
         x1Vcv0nqqB757WBxrGMVRsY/05r5LKt5LTxiaugUAQ3Z2SxXYVb6/d/GN55RwwOACXcd
         +NUf1Uks5f5nCTKwxOMVdlRkQZv4+ldNSUWoOnfyXkDHN6iS5txFSxytMmvJCqzszrsd
         UB5iGSEf3Dz3ZACl7MPYxSFkT0vspotm4HCXCb6ICOLuVbazhy/CMniJAwOGRzRa670e
         si3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376495; x=1795981295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZTyZfh2vpkguWMlHu7iQNp2bVhFcR2C7lr2zyFVmITc=;
        b=OQXs+0p2nghfK1l9DoYrBdj+8lESrKajLxHvjOxYCgXjOyeGffp05hX4Y1jY3yA/mA
         2QTyCtZzBEALKtR0uzv3y82VnFHmO6BFq/IBJU5SHKMIKTd42MHJTaYwH758LBMybvGz
         6PV7G7WRb/Sb4fybwKFiSUH4t3y1PvabYQSNp1KiMY9tWDmfm2mihRDAuSByaoZX0vQw
         GTQ+in8rzYH582UpVY3jGlDTsaGS5x6B8eBRAJ7HoB49w5k8/9TUwfhSFLPP0Fon8GYl
         DBzKoMe6bheyBc1NwA8ihvIqwwxeb46EE+HF1VzB33T3jnFIkfXGZmcTG2u3kk9uhnRH
         xwMQ==
X-Forwarded-Encrypted: i=1; AL+hErGbovLnzHSRt5pQlsw1WK2GP5SC10LiU7kaoI8dOlcfYjN3CdfQ5L8MdPvHHVQ/Jt+B/4meqpJaye6lCQ6M@vger.kernel.org
X-Gm-Message-State: APuU4Z+K3r8Ww058hWt3j79o3/+5B+0flp3DDTktSautenloTL7j6wsY
	Jo4PYuvBg1DNS8HZ6P0MeWSuE6BIpGui08r9bvKthLLAsW7PF6kPuX/n63E4GrZl0xrpx+aiy8F
	fltDgUaOzWPwFVZtFYfnwFzm5wS4DXOHMUAJFg/GKl3TL2VDFZdz3Pp4Qul6Pr+KivHQu
X-Gm-Gg: AZFdTZfd7XtFmtD3H983baRltm5i+FlDcuxOImr1U+fPGKFTMNnLArtikzFfK+z5MH8
	taX2CV1qfCcYrIZc/NDghNbzGotSFKsCZwt/iJ3pk2yBI2PqOkbSdjAvL74evWjRf5tS2YJ1FtQ
	+JB2K9pgShnwoWhdX86K8VuPhFEN5uc5V05/d63lyNQ1r3HFCHNxDeh1JCarwNobgKHONYaLsQs
	lNMmOWDRriInqTK6c7+9VxYUAoPPHZ+3WIVomohAiP00ip3PvkKiODwIwrMiXPf/EZRqXUnUZfP
	9kBuKk/M3CfxWiZ2PlEstHxzXmob1plwWsN8CJxV83s/QyA5/isCeV24DUMBBdq03h7SfTdcJLH
	aAoB80qyBl7bAwXhF+U7w26XIyOUClMI/2nhpgPmJIpCplfPU+5FVP9NvyJ6tyCYpul4tzDTEW/
	3GkhtZgq9kmQ==
X-Received: by 2002:a05:693c:880c:20b0:386:ab85:a011 with SMTP id 5a478bee46e88-386ab85a718mr1994523eec.27.1795376494783;
        Sun, 22 Nov 2026 11:41:34 -0800 (PST)
X-Received: by 2002:a05:693c:880c:20b0:386:ab85:a011 with SMTP id 5a478bee46e88-386ab85a718mr1994497eec.27.1795376494258;
        Sun, 22 Nov 2026 11:41:34 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm28348711eec.15.2026.11.22.11.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:41:33 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 01:10:50 +0530
Subject: [PATCH v3 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-evk compatible
 support
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
Message-Id: <20261123-shikra-machine-v3-5-e5d074264428@oss.qualcomm.com>
References: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
In-Reply-To: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795376465; l=3030;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=4SN6i2HTiPaf0z6YipTowuymHZB7HSO+hD8naOMtrSs=;
 b=yCNiyJCyxUQpouVGL6b4NFUw7GuuO8QG1jSu8cZ/elffQaehHG3tdrSoCb+hi6/wdgoM2ph2d
 Hr3QxhcWZ7SDyR31777E+s/zGlAqNLFhUgaTwmZ/NBjvSnrW0IXWIHJ
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: dP_UZfHu-_hLDYBT69cHruLGli-nhQr1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX1xJbaXlPzxh2
 pdnKcwytnK/bY18T5pSIBJQ4EFOUap/IGZQo23zf1TzFoXB8R422zlurNSeeRQvT9lnkb20Fzqz
 0ouQlnMqCozDLmTjXZDugsoHZl6KgkE=
X-Proofpoint-ORIG-GUID: dP_UZfHu-_hLDYBT69cHruLGli-nhQr1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfXywHCAWLET3i6
 ZA2GEVbJcV/k2IU3HZH7ubD3awR/w0fClMwCNtNQ+BTmPmQV+Efy+01NNHOzOCkhkCELb/JmAb4
 /sUAMOiKaiDpPIQb1LMoqR2H019hSJGxHESQ5TlkaSPvW6eu8Eq7l+mjJ0Km1QF8YhQD/Ac2zjG
 ATHkH7L4rEH9KLDvq1OdB0uKtYBRIvhRzuZVPB4rFE/bVH/Qrr227Gt02aWjN05libWuKcTgf2Y
 mzTYlS6Ce3k3F5cHaSSGvTa1c/jORxt0Brv8Hie8ziT2Xr4autTBrKJjs0HZq0bbGDRdPIh9G+C
 cMQojT2hPNr+1Qe7k71EfuJifoZA+iDcZDRuEIvy+TOBtB2LV+Ts09B3CcY9Xz6YNRjVQekNxgp
 tmDWEqPuxpfZBJd5buFPXzxRWFR5amOZsmBY77wT3p9Zio6Mhofbp7nDMz/hNQKxJNQv80R6eEb
 9OES5VkeIyzdmH+d0SQ==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b03456f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fMRYn1g1GmHmK2_E4s8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Add machine driver support for the Qualcomm Shikra IQS EVK board. The
Shikra IQS platform uses a third-party MAX98091 codec with modem-DSP
support.

IQS requires board-level DAPM widgets and pin-switch kcontrols because
the MAX98091 codec driver does not expose its own endpoint topology,
unlike the Qualcomm WSA885x/Rouleur codecs used on the CQM/CQS
variants.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index bf62e8330276..a380c82afefa 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -45,6 +45,7 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
 static const struct snd_kcontrol_new max98090_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headset Mic12"),
 	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic34"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic56"),
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 	SOC_DAPM_PIN_SWITCH("Receiver"),
@@ -56,6 +57,7 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic12", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic34", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic56", NULL),
 	SND_SOC_DAPM_MIC("Int Mic", NULL),
 	SND_SOC_DAPM_SPK("Receiver", NULL),
@@ -755,6 +757,26 @@ static const struct qcom_snd_soc_common shikra_cqs_priv_data = {
 	),
 };
 
+static const struct qcom_snd_soc_common shikra_iqs_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = max98090_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(max98090_dapm_widgets),
+	.controls = max98090_controls,
+	.num_controls = ARRAY_SIZE(max98090_controls),
+	.codec_dai_fmt = SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BC_FC,
+	SC8280XP_DAI_DATA({
+			.id = AIF_MI2S_RX_0,
+			.codec_sysclk_set = true,
+			.mi2s_bclk_enable = true,
+			.jack_setup = SC8280XP_JACK_SETUP_CODEC,
+		}, {
+			.id = AIF_MI2S_TX_0,
+			.codec_sysclk_set = true,
+			.mi2s_bclk_enable = true,
+		}
+	),
+};
+
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -826,6 +848,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
 	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
 	{ .compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data },
+	{ .compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

-- 
2.34.1

