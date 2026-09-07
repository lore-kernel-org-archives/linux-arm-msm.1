Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBEB51FCD4
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 18:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804631; cv=none; b=XQBFfym7HxuX9d2r4qLv0x2OLYE2mf++VC0k3KeyPplXvY5gLKnCf1xYEqxxv0ie0x7TTaqAcpy5KttrELOgdStL1Cu4RvYPyK0RILGh2ZOxVTKVf4QOrqEXA0TGjv0yeAu8x1ycyfDYbDVOsYdKAPIoT0cmF4nlonkx8+9WigY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804631; c=relaxed/simple;
	bh=ibq5TperpF7A9jrT8/0vCPjzNrL4H059nqE3swlslIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CjFX2RaMcpKo4Sxjg5bH5RsEg9vCLrmNIo4UXrQt/27Nafzcd7w8AyJuUhojDAGa+slYY8vbDS6UwRfs8rksYv/F5xawEj+GNXstJ6oQxx5VT4HQnv5NUr9ZLNWCNBjytl/cwNdcpLr3GzBvL4N2mFFFEo23T2BOQ/f4OSS9Nhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q64BUtBx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CzRrZ1tg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q64BUtBx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CzRrZ1tg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7f8m1641974
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 18:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0YpDB9hlyWgs62i2uJGwtVGX3LyAfFTiTM9rdLVkwGQ=; b=Q64BUtBxTRFwPL8P
	plsoZg2S515PfXEVHzJVpgHJsCXxE7Q1miZRG2CdcDvPYbsSQD4PLLFTjI93KcMz
	4ROHwm3fzRHqCkkT2xbHuIj4fpxizv1TCEXOi5zRq1pNN3drVYcvsOqYPrgN6o8y
	4904kfTO0yNPDpNyb9t8Xz8TU/UfQ9j626I3tfVXzL3cuygXIGaDf26jwtTEX8fW
	bicRzUi/6i3YlEQqPdCq1eN/tlbhJSE2AzNhIjBwXiN1FjuFWx93RyN4+n71Ok1B
	H3oXCEQy56fK3p01oKoJ4gjAbpf4h6xMnqRjpQMD2rC0a6vkXZvoT9zluQju/4CF
	uXcNtg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghruaajyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 18:10:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7151120d6so59389305ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788804628; x=1789409428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YpDB9hlyWgs62i2uJGwtVGX3LyAfFTiTM9rdLVkwGQ=;
        b=CzRrZ1tgVG8VZbg0Rt6nyuNzFeLqkg56ZVHTr7Ck1Y44XwAU14TK31xQsbviFjvQ3q
         dGEWx02sDmYkLntgqxLsAoYnf36y0hB4aivO5MSUNqQmWj0W/7ZCbEhyCQReBvNYH0Bv
         TxzZJ+GOY1vEJxYREabMWT66SFjWtQZ+bXc2jHNpzwIE9RG3WVSpcMEIgSomUFoNRKXS
         Ap1qyVJwYvA7+VAhU3+3S6LoiTDeqDgk0jTtGrOQ/NOP2rd9iK8tCApTPljPHnJWeHZ9
         qn7J0BeJNHatwl+2UQNDxlFaU2X3HQjRP0qA50uTK3r7Xt7fvobtcz1Fc2JgV7oRJQt1
         aUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788804628; x=1789409428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YpDB9hlyWgs62i2uJGwtVGX3LyAfFTiTM9rdLVkwGQ=;
        b=L4FaWyWX7klsX/cObyLFAeK8mMhpDRLhZMEdrOm51ve1WPqFngii+yf2Pt5pRZcbQY
         FdwQrHPnl94V5AhTlu1+KDegb9DO9iFev9cXCJgmp30Xxqrj8BNvl7BRCeOZqhCTeC3T
         rbX5xi5102UJu9BmdC6Wr/QtWiHV9EZODIxu+14yR38RfDz84q5PlxXV4weOPicPdWML
         YYnZFUXMfbyPSVDDG7U8USsJBAux6RyNj8K3NlcwlU8jGuTSrsjLvwzlFoLWhZiOessC
         ueWrsiZTgXyiUouL4A3DfkuKDnU2AqxB/8geL2TLQWwUVRp5s9IIGmhY/VdscoSl4d38
         wMbA==
X-Forwarded-Encrypted: i=1; AKwUvBzEg7Y/ARac6tMFyMDaUbQHJapJ63DcK4+kbUxqUPVaa3i1SszJrNcT4u4pBADmecZnB7TxLUJBrI/PHwMZ@vger.kernel.org
X-Gm-Message-State: AFuF++nGMS1GJT0DR/gw0pliw1ntF+q+E5E+oUsikZP1pFXnDkmRMOjA
	vAFOSiOyu4QPmmprLCCgmAhGHvffAuo3zeP25n9+KfXsLTbN2qJmEVxbHbMSEPy9iQKbAmyUQSc
	ZIXUceeWVvbi9At8+XWNR7tGqqCJePdT1N4JDglmyJEoO8/ly3SGFYd2IGV0LN+NC43tJ
X-Gm-Gg: AYBFou1aJ3/KOFarjkJ4iIEPuOoEzDwJWTRZOtBtRhrqz27c9ceODp5dmK6voqIEy21
	mQ75uKZY/SZkmgTrhdP5mQDn5hM7AjS7e4WT3GqJ1/idbMMWBFNBfo7JsJR3wKRaLISbNDKVfNq
	9C+txTEN7KPN0ExnIf5+R1fyA0dQdsHiTFSXSeOrrefmUPwds/qL/pf+brBawX0LDauNgeQhUlv
	gSG0qay9CgHJoHB+ToDAYTnQy7WmqJkeewHR8EuC3eqypyCdgX+i8vj5GNu80EV/zlKPBdMniam
	RNdv4PBuS4XXzcTutIOJn4DXNHEySlxuGsT7C+JxPDaK0t2FNhR0Fo0LjdmlaM2ktCcPT6xKFGW
	KD+C/ITaxKXV/lh+r9q+j+bCkX5ofiaiFnLcT
X-Received: by 2002:a05:6a20:6a1f:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3da39ec3154mr37307962637.12.1788804628232;
        Mon, 07 Sep 2026 11:10:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a1f:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3da39ec3154mr37307902637.12.1788804627806;
        Mon, 07 Sep 2026 11:10:27 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm33961954eec.21.2026.09.07.11.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:10:27 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 23:39:44 +0530
Subject: [PATCH v1 3/5] ASoC: codec: pcm1681: Enable system clock before
 regmap access
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
In-Reply-To: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804602; l=2155;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=ibq5TperpF7A9jrT8/0vCPjzNrL4H059nqE3swlslIw=;
 b=tXG6U5aLLaHjGg1mY3KIPnmf1ncikfJ7KkwbNwcX5EkVTX9x8A/tFB1OgeDoA9wlPWRIgmICk
 EyqlVwHN3DyB7vFzQFWXBWRqx6mtRYhgi2Ytm/Lv2QERLaGNKQX+Rxe
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: tW8OXCQilA1ggFd-_4rXKU8-jrNjqpkr
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9efe14 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=cGfOUKfoVt3f02dCv40A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: tW8OXCQilA1ggFd-_4rXKU8-jrNjqpkr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfX+Z8VZfV2PNOe
 50C2YWJNcpIEEC6Qrp7CN1nBOp6w0d32N6S/YuLCPaL+S1rOemUmDI2uEisET13f0QKq5vru/ye
 mZ9csBQp1al0c8nY+wwklfLZqmAX7Ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfX8IQQPP1fw1pl
 4q5RxXdGX2tpXtrqF0YGVCl2ZYM7N7uOezSruz5+XsfcGKrYQ+4G8rybU0Rn7wyRkBoCjVtyGsn
 qrEL8lC5H5RcwerGmGzLPqnaoLU1y5+Wm7iS7kaV32Dqy8dRod8gEFzNFLJ9H0RZVze5pg33nM1
 PPo818VJzqUQk1O2erWIwV/C2Sn8778UiOg+Zfjw/ANSxPTHSd8ArG9peGiUR2kYNruKuskcWJ+
 kEAa4/PrHrpGLFtRnmgO40R6uzeRcOQVUo8KaNZyOQBc4Z088HnJa/gkKJLQE4Wn+iYd/lhjMq+
 q9IxLhUlBn61XKSV5qBA0CSh+BcLEnw7se5AQf+/mD4k6Nkux5b7ahjufYIzkWVEFRyCm1tM3Qf
 6vme2oUB2mB7JNCUPYRf56/1ODu6KSSsoWQtwEq8o+6oSF//E/KQh35EMDB9XK33UB6uDLi0eZi
 fQHW3T4oIacvY1bwQjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070201

The PCM1681 DAC requires the SCK (system clock) input to be
present for proper device operation. On platforms where SCK
is provided by a controllable clock source, register accesses
over I2C may fail when the clock is not enabled.

Add optional clock support to the PCM1681 driver by acquiring
the "sck" clock, enabling it during probe, and registering a
managed cleanup action to disable it during device removal or
probe failure.

This allows platforms to model the PCM1681 system clock through
the common clock framework and ensures the device is operational
before regmap initialization and register accesses occur.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/pcm1681.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index 60fdbe5c4e05..cfe549176d14 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -12,6 +12,7 @@
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
+#include <linux/clk.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -74,6 +75,7 @@ struct pcm1681_private {
 	unsigned int deemph;
 	/* Current rate for deemphasis control */
 	unsigned int rate;
+	struct clk *sclk;
 };
 
 static const int pcm1681_deemph[] = { 44100, 48000, 32000 };
@@ -311,6 +313,22 @@ static int pcm1681_i2c_probe(struct i2c_client *client)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->sclk = devm_clk_get_optional(&client->dev, "sck");
+	if (IS_ERR(priv->sclk))
+		return dev_err_probe(&client->dev, PTR_ERR(priv->sclk),
+				     "Failed to get sck\n");
+
+	ret = clk_prepare_enable(priv->sclk);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to enable sck\n");
+
+	ret = devm_add_action_or_reset(&client->dev,
+				       (void (*)(void *))clk_disable_unprepare,
+				       priv->sclk);
+	if (ret)
+		return ret;
+
 	priv->regmap = devm_regmap_init_i2c(client, &pcm1681_regmap);
 	if (IS_ERR(priv->regmap)) {
 		ret = PTR_ERR(priv->regmap);

-- 
2.34.1

