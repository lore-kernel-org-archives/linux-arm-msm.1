Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592575;
	b=Z+bjh33BNZ3FmsM6m6UJUQOZKqM8cho4xEb1h8zDz8AT2n5lkN3C6T7zyVcUSmM2Hf7U
	 QnvXdgHiCVbF3cZfjaKyf9/Bgaj8YPZucZcZ+svi3/VZOPkqwwFve2Ir9GqZ8xmuwy7Ix
	 8k5nI/1A/FOfNmfXejH60m7HVY0HghxlpD9nxP6QU5bLpvM8cWoDGMVXcMugQ638ZLPjD
	 BN2bq1+MQJHteIKqrXqx/A8ws/yTR8ZiQ3+utF1eqt/PIth3oEqg3kg/iRahRbLuuUDGq
	 Vvl4R/j5Uv1+yMsXrKgeuOLoHn/Y4Z2zMTcp0e3PB0pJZ5g0PMouZjlqt9+3y0mWg0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592575;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ilogfIerAIOdSnwNNbXQRexfXEEtio2AIV3VuZD+dCc=;
	b=gM2dwhsi89G4A99cuOn3cTnqnbcpJMOk35q/x/Ia1EnlZ6962YyDFQRYEITZp6lucdSX
	 ahKxjIMwtme0srCv25e7NdZCgnnRqVz5PRVXzouR/NQaiFnFT3bw0+YysFBS99JkEAf+n
	 YpY5zj7pnNfaLAbY/fcYKFHMem03+FsrWwcGdLw5Oe0a600Zz4pXY6bcItAhFcC6uQLB6
	 x3dh5PDmBnRBGHgTgBaIPjMD5rCoVSU6j8qG6vk4yX4FUds/Vw59GePFGAoV8/4SBzxi1
	 uQnWQJNQ86hKMVnmS2ieWXNiYSwpCjwbPWd/3JTIurcM/Kup5Vy8RFbUN+6j2FIjKxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npG3JVPe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iZtr1oK9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A912460A3806
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A912460A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npG3JVPe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iZtr1oK9
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF113876754
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ilogfIerAIOdSnwNNbXQRexfXEEtio2AIV3VuZD+dCc=; b=npG3JVPex9jt6z10
	QuZIaEnlHy40zUnbeFPSTkYUmeMDGFZCXcebettzkxQbnZqXYb1i17KBG/KDiysh
	UelSLZXKjkX/RyEf17chZpDVJSP5F5OrerMgAeXCQOciEjkHGbYyXvTJ/wSzwf5b
	7I4hQsZzIda/5wP6dgYsd3XUw4yeXQ7u8dhF9I6Hb3aPNQ7wMnGjaudfezCAgk+G
	M4rwAjpOd00qImACEhz8A1xLA2Q5bbM+bpxB85kz9yQwp3CTMxT+fYRGXbChb/VK
	rmjLEx+/xW/y0UITXFQEkJY9uJ6zQPq54qDgy7HF9QrtTdJyppbceRbGD8VsAU+r
	80lMdg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj495ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-313b1501a0aso81860eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592573; x=1793197373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilogfIerAIOdSnwNNbXQRexfXEEtio2AIV3VuZD+dCc=;
        b=iZtr1oK9aLkpe7Au87SRx4LXNHm+fI3gxsHJ16TVwtpr2T2BtpPfCZhMuJaWe5Iw2I
         VOfJh+93At0+46yAqHroSszhSA5UnmUkKHEvJAcAqFgkJbFftxHYyVnGZbAXqHnDo/Zf
         ew1jN59GbR2F7FVkgid6FYDePkrXw0KhZrS9Tfr23HXvvJG9OqGoUy5NvOsullhls2TQ
         wgPDamDSvfCU3JTN7Ow9XlK8P5PwBkNHxTtGYF4Pxxgsd3nC7K1+AWdnny8m6NyW6FBc
         iFWFw8tLFh+Frdxc5WGH9gtLQtrhBfaezMv9vro2U8jAm9JjyhRBFJgRb41LZiC/y8AP
         gzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592573; x=1793197373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilogfIerAIOdSnwNNbXQRexfXEEtio2AIV3VuZD+dCc=;
        b=I2rMSKOIADDZMxpiE71nIpWeMnZeoaDW+Wd0nsN2H3GhnjqyvUTU+b9/KgJjCgWtYW
         7sAktdsH3DhTwikQgYiBZcFc3UHs/VbSA68RpyRqVKf9RbUT9edFHuS8poVkDKNS9QO2
         LosTokwfigZ0rM2GqLAjpiyhQ2XwKWcMCgLmy5sm9qwu5KOMYOHTNDlb5epkfkhKx2iM
         zvycVqNTexVcTgroxJzNcrM1T/njshWdAWEDBDd6AqqgNUbeLnH56y8tKXZ6NmL2XI6F
         EqDRkjQYyx12Yv36kT/zjxsiKUeaVPZ975NjlEswvW1TXGnrvp5xtwkiQJEi4Te7aXgx
         Irzw==
X-Gm-Message-State: AFq9FYLU/hBqyAerXxi7CTmUP6o8AVjiNuCosUJEgMnutPqMoj2JazYb
	WEuRsEvMzDsqo3qg/YJYPPI6+etLMsbtvYA5ZAyTTeJwj15kwVCeb1R6jkGBa3YuFrejWG0u6fF
	tamp+J0Q2ABJbb1RCsdV+FBpkmoHN/ZWUKT1XTOItSOmfV4GBuMSBc/Yy7AEhQYxSEKaiklGEkJ
	Zr
X-Gm-Gg: AYBFou1L91SKzoKmx76YHyyJYBJq2qa66Z8xZp+IK+2mU918cj00WkC2mx4ukj30T3i
	09xZJGH9d/ydsVtYYQl/K3fBM0qENsgEuE9sb5zaU88z/66ZfgLAyPrKUNQLfSY25X2r5xxwDoW
	27nRTL4kFZ12tqNBQrz+VmvIPK9jaYrbHL08Rclf66VBprXY2WA6T+2UJiYNflBu5KIJEEdtvAh
	QQKclcq57Omo64e+PC0dxSIi9LVsawUuF/wCZE5G9V5V35zt8SoFMjtU7s1oZVOWArNuqm5VRAs
	170P2z220ZQdMPFqGRIa5hzdjQOapo0Qjl2Rr5XXaRW4f1bqFkpZD6DgJsVnnS2ZT+xqdigCiBh
	dLY8WSE80+gYjaoObnHmibxNQPln/Maw/kv4bSWrMSBgXtRLyafkjhMvI4QaCyZjWl8J3x0CGnu
	9PtDONKNGNvNGDO7F4a3TD0pnIerjhu2zNIMKrSvBJTM1stRBT6LU=
X-Received: by 2002:a05:7022:43:b0:12d:c389:ae54 with SMTP id a92af1059eb24-190a465c342mr5156125c88.2.1792592572927;
        Wed, 21 Oct 2026 07:22:52 -0700 (PDT)
X-Received: by 2002:a05:7022:43:b0:12d:c389:ae54 with SMTP id a92af1059eb24-190a465c342mr5156022c88.2.1792592572043;
        Wed, 21 Oct 2026 07:22:52 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:51 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 19:51:49 +0530
Subject: [PATCH 6/7] arm64: defconfig: Enable Waveshare DSI panel and touch
 GPIO drivers
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
Message-Id: <20261021-shikra_display_overlays-v1-6-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=1137;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=wKRFTCBJIBMmNDY89gm1Ek35up9XQQNdIjIma7SHnF4=;
 b=0bZgy1KRlsumildNKdSdrtd+3ObPSv+aCKqiaI3pmsuFxXukpbKiDMIQXPRvPcNqNvwmsviKd
 MV0zGyK0DJHCPB8x8c36kDrYTQpLaoxVrIouWd1foll7OmwigRFK+Vl
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: uYkBr3WS5h1JJJwTVy29Z650ylFAcyW1
X-Proofpoint-GUID: uYkBr3WS5h1JJJwTVy29Z650ylFAcyW1
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8cabd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Y4Inp1xfyx_JXr0qu3kA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXzGU3zFjjN5p6
 LOx7YK5HMkA1TI2vEXwa9P8V24H5A68I1h7X+HDKScXPV9hJVVAiBJ+z0cTFLEhSIRVlJGaOLGx
 sfnXWBzf4x/Vn1Wt/da+RKa+C2HwtlXKNxp8uDsRm/gXg+z5GfgkvKjfP3hB8vUsxb6RiJnYdxD
 vDYfIBgv3naB75V/RdbzSDVGib8F/CHBaeNskvVUZRtfmn9ZOHw5TbTw+kFl/fYH5bmSbqQr+Mo
 isvGYtbrl/jOWSi5uzTbUzD2UpOeVeKp2W5QQ2OrbHPyXsCU5i+XSXS/xqXpnZgZfvs7CL1art+
 4m3Wr7IAlpbGD5jPKEszcyVWR8s2FdyVHgUxbcKPYzKPwWJWLK5e8jm94YIKu05JzLJu7ljLB93
 TuNbF3aOdXUxn9EYaqNcN9cYufK4o+SBsEdinydVNskOxMoG3tmzvE+dP8i/qAT8a9C36V9zmOX
 rGySiM0EZ1m/VsFeS/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXwif/j6RPzjqS
 mNzMBTqH3VOyyfMXTEFPmfZtCZoj+3WSLkoUoOI5Xpa/kSiWjsC9g+Tq5fN6LOU9RB9f1Df923f
 ODu/b9C4L4Nfn0+sMDoqVd+cSKLpjK4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

Enable the Waveshare DSI touch GPIO/backlight controller driver and the
Jadard JD9365DA-H3 DSI panel driver, as modules, for the Waveshare 8
inch DSI panel on the 22-pin JDISP1 DSI0 connector on the Qualcomm Shikra
EVK, Talos Lyra EVK boards.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c4c47a44af9..73c07961f655 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -727,6 +727,7 @@ CONFIG_GPIO_SYSCON=y
 CONFIG_GPIO_UNIPHIER=y
 CONFIG_GPIO_VF610=y
 CONFIG_GPIO_VISCONTI=y
+CONFIG_GPIO_WAVESHARE_DSI_TOUCH=m
 CONFIG_GPIO_WCD934X=m
 CONFIG_GPIO_XGENE=y
 CONFIG_GPIO_XGENE_SB=y
@@ -1032,6 +1033,7 @@ CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_ILITEK_ILI9806E_SPI=m
 CONFIG_DRM_PANEL_ILITEK_ILI9881C=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
+CONFIG_DRM_PANEL_JADARD_JD9365DA_H3=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672A=m

-- 
2.34.1

