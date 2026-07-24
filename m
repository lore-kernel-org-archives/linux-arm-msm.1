Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827743AA1B8
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879303; cv=none; b=u84G/M4LsJWOi7weWYezftsEMTgBmJYhIwdnw/hVSGdtGueL/gF3eBSEb/8SKiQ2iaQazPwyJMyKOZFcQg2zmXY41Yg4GTAT1Y5OdXlqSk/nBg4a2Er2o8QyXOVFbzgLYhEzGxO3Ek9XeU7WOrgevSE3POP9ezsFUPnRkkxuTDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879303; c=relaxed/simple;
	bh=Y+AnL5HAjoCUhYXw0bVjhldz1Ov4kcZKQpwAjjEnS58=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RhP4wBFLn0WeLjd8TVec95tHgETp9svbNWU+NLVHCid43pp9Qzq9Pc8gRvJN0WJxp96DkH/IH7ODe37Cz6zk70q4kIvz7NG/TlNhrv6/CvYBJvyuDNqHWxhyrVz4xt1SlViktTrledmSwmx03xKOrU0kjUA150c2P6418Hi9KJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOr9F6W4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWxD3iHJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOr9F6W4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EWxD3iHJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lOG62162961
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vrujEKY5XD05AJiWSLZWVD
	sZmXBD6ByqDotlXvjH5TQ=; b=hOr9F6W4zzAd/7DzBmTzG9iNV5zDF7y/0rJ2d6
	GbEQVHLBY6n4Z8g6veVg3Tz/N/8i7fUbj9EMJDXUaxDZXU7s5h04WaD3w8OQhX+n
	mOKQ/h/dyFDzuNPBFPvh0Hgy/ijPMU1L7rSzx/+qVCr/EcjPjKFsb4kovC3GU+7e
	kQZ50XDib+UwcRRFxLwopaCFw7wdKSqrb32oQhA8Ys4UxL96v4PQyOZyG05OAx72
	YUuCCo4WgA1N/Eks88nww0oU6u+rhNR9zisgBP10qJ/45JXg4FAEyETsRQQNuUVj
	i2/vX8tLGexYdnyWnmf+B8J9p+n11VwDhpAGhrsd4IbDhFZA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vk3yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:48:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c20762d21so1474161cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 00:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784879299; x=1785484099; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vrujEKY5XD05AJiWSLZWVDsZmXBD6ByqDotlXvjH5TQ=;
        b=EWxD3iHJF2Dd5bsnj6MQEClS1980+G0+xvCkuvLorAu8lJ82wlEnd7tYMUHXUtGH+J
         KhcjBS5itusEoF4CmOHI9F7AQVFcngmKJXJqjpepyzAtpyVo3jT7Kq1+62lrEoyf9Jxa
         FP+8INIC/27qGf+p4lUNGvSPmS+tccAZSUdOirwiOzTIC/V4xGVbHVyctPsMBSVUUB0r
         Yb1Vq8xtbqlGbaAxKk69wBCU8DGNqs3DcIRSUUFFyzCB9OeytfnTL+K6EVEobp/CxUdf
         CcdE8aPKQGc0L8b0KfB3DN6499h0KUyDCPlBE/ew2EyZ85T1wbl+/UVPi6UFQQyUEIg8
         Q57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879299; x=1785484099;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vrujEKY5XD05AJiWSLZWVDsZmXBD6ByqDotlXvjH5TQ=;
        b=dWQ5paUK4zXFn84qBDlPzcOgbCzj7Jdx7wnKbgB1vRip3cyy8ILaPPgHuSR6YRjcZE
         I0gTh9PwHx/a5Dp1rA7shtNrSaoLf40APs3POSjHuFHCvrdBedUs7hF6nQ5SMQ3T5kcz
         aUcCILETfsQ9LbAQohhsC9Y8Z2w5bIJVJFX6vfqwkzyvFoVog+GnS+FB0wUQAAJvcmXi
         sP3Ddx9qW0pL2nP0d5L+zAPIzDPl9shjA6PbAU1NGhL+r7AJp83KdPetBudoYOd0yQCP
         /9ICspyjiDt3FL2C8HOobeVTE4HK/MFmPzwGsuXFwEKKV4q2oQN5hkRrgou1mEeeRsMA
         gygw==
X-Forwarded-Encrypted: i=1; AHgh+RqfZXVbAId0zd2eSZpL34tIR5db32fStZlXBWaR15F7DTEyOLyS2j6ImspSzaW/Y+9yHMqTRr/cf/wcPzES@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/vNHF301K1irBsCShLED5bi4k3jbMeQP8m7aV64Q/fi8VcOiB
	LyZl4wxWrqNd7YNcxCyYmGNH48SI0BssalG4bH2wg0wqdoC8poVtxO8x2CQ+hdT5qcKM/pnWohB
	PPPsl8UJADUx4S28SX2OwQ0D6a5osbWN/WDg7GlyWR2/B9z1F0z2LOwk4f6rDAdYZO+tcd6acXe
	7ww3I=
X-Gm-Gg: AR+sD13rAxjFKyklntZAM3y7Fv9xLY2tLc9x/6Q9OdYMIdt+zOeX36rJcc23flFRXsE
	wdN0vGm7Q/DPRYaSrIAUU2XBB6qRkbppT73L43Xnam0gchhHu15H6caMkD45MpbYFMbf98SmQ3/
	EYIZ0GZAd+L0z4X6fG159p1QzgO3UX1HHDZU7YkEH/rxTYISoFzzGFXD+BjQCsH2i2Zvr+XG2YE
	JW6wbHLzwkFkBDrTr+YZi9JBxXSxGazH9ajEcog+TLbkGGYnsuZgnXDNZytAoRdX+dPbIkkaKhQ
	I2JpvflpNJ3yyg9c7Nxqt/xRPXk1ZKBCdJhS0weYrfYHX0iwCj6SgxM67yfGWmpDf+NVW44R18n
	JBujzjzWS6sU+A6LB2hxfzz/QNXmeSa/O8QcHms2qUeEwCzM58K/kApB4yTvK6jjAlAU+T/48EZ
	avnGu9lMosJFrl64zVj1povz+/HpMKDmdLWenk2YvDc4SAjsQUvw==
X-Received: by 2002:a05:622a:2509:b0:528:583:a6c6 with SMTP id d75a77b69052e-5283dd95c30mr60171491cf.6.1784879298704;
        Fri, 24 Jul 2026 00:48:18 -0700 (PDT)
X-Received: by 2002:a05:622a:2509:b0:528:583:a6c6 with SMTP id d75a77b69052e-5283dd95c30mr60171211cf.6.1784879298180;
        Fri, 24 Jul 2026 00:48:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a798a5sm320764566b.9.2026.07.24.00.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:48:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v7 0/4] leds: pca963x: Add multicolor support and enable
 Monza RGB LEDs
Date: Fri, 24 Jul 2026 09:48:14 +0200
Message-Id: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL4YY2oC/3XPwW7DIAwG4FepOI8KDAGy096j2gEMWZGapAtrt
 K3Ku8/pZUFqLpZ+S/8n+85KmnIq7PVwZ1Oac8njQMG+HBie/fCReI6UGQgwwkDL+3H49fySYuE
 ILSTjsPW6ZVS4TqnL3w/s9E75nMvXOP087Fmu26fMLLngAjuLwtuIUr+NpRw/b/6CY98fabBVm
 +FfsEJWApCAMiQRtKWjzI6gtoKpBEWCssnTN84po3YEvRVcJWgSvPXYYQMaRdgRmo0gRSU0q+B
 aCxEcgut2BLMVmkowJERpQYdgu6TiE2FZlj8lzrc79QEAAA==
X-Change-ID: 20260629-monza-leds-c292e68c9a49
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX4k5XbZd9y9mZ
 3TLgb0Q5//M0ZUnE/5m/l9auJqJL3j6/aAUGdIMvgSYKY3WI7xAr4IQIVUjoSzsQws0Xz2ufsTo
 xuTYRJvbUmQ+wB8Yjtt9O21a6uMTFCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX1LPXW8v14HYY
 az+EQ/aaRCQa2HJLSev1dSH3xG/aQW1lFtC10Ia99noL58AzPp6wO1t7v1/JsFOhnblgNip2g27
 HOJpWQAqyPNl+RtbTPJHk98tPwwr4wZniFRmmelFSb5xiO1rMkpHwSIyIeXR6OFk0vh8OwRwCqR
 INQRRK5/omAVVxO6RPGguUR+WWDEgxREOcHRmkDfLqUcn0Sra1TVdUfOH1rSHJk5KpqE/T6Dr0m
 6BbACm57O/bY8Jl2MUwABz6JUdwGVrrXPorR/2iyh09HVdCQ290JoptSv6zPviUsPyOR4Os2Rcj
 NvpjcbxrT1XZX+GbM6cn2CTmkKGmucoLnN8fGVYCUkMp7rz23vH1mteC1Uf9HE23LCSmDPwYDKP
 GAALBZ4++Vg+Btb50uz5Occc3iIeLarKf3V4Sz9lh8aZtjBKFQIpP6/VqLz5jw0b9fMBYkMXuy6
 5aEduIBc62mqiK4kIWA==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a6318c3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TplmsQoH72OTL2-p6AMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: -qcUQTSh5Z2AUCZavJFHNHD0SehsRMs7
X-Proofpoint-ORIG-GUID: -qcUQTSh5Z2AUCZavJFHNHD0SehsRMs7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240069

Some devices use PCA963x controllers to drive RGB LEDs, where
multiple PWM channels correspond to a single logical LED. Add
support for grouping such channels into a multicolor LED device,
using the LED multicolor class framework.

The DT bindings are extended to describe these groupings via a
multi-led@N node with sub-nodes representing individual color
channels. This follows conventions used by other multicolor LED
drivers, while maintaining full backward compatibility with
existing single-color LED definitions.

The PCA963x driver is updated accordingly to detect these grouped
definitions and register multicolor LEDs.

Finally, the Monaco Arduino Monza device tree is updated to expose
the onboard MCU-controlled LEDs (compatible with PCA9635). The MCU
manages four RGB LEDs mapped to channels 0–11, which are described
using the new multicolor bindings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v7:
- Pass the channel/led_num explicitly to pca963x_brightness() (Lee)
- Drop the per-iteration led->led_num assignment in pca963x_led_mc_set()
- if (ret) rather than if (ret < 0) (Lee)
- Propagate the real error code from the reg property read (Lee)
- Comment explaining why the global power state sync (Lee)
- Comment describing the is_mc detection heuristic (lee)
- Reword the init_data.devicename comment (lee)
- Link to v6: https://lore.kernel.org/r/20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com

Changes in v6:
- pca963x: keep chip sleep/wake state consistent with tracked per-channel
  state on I2C failure mid-loop in pca963x_led_mc_set() (sashiko).
- dts: drop deprecated 'label' from the multi-led@ nodes and use
  function = LED_FUNCTION_INDICATOR with function-enumerator <1..4> for
  predictable per-LED naming (sashiko).
- Link to v5: https://lore.kernel.org/r/20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com

Changes in v5:
- pca963x: fix multicolor power-state tracking (leds_on now updated per
  sub-channel, avoiding wrong sleep/wake state).
- pca963x: dedup the single/multicolor registration paths into a common
  pca963x_register_led(), with mc parsing split into
  pca963x_parse_mc_subleds() (Lee).
- pca963x: use dev_err_probe() on the probe error paths (Lee).
- pca963x: pca963x_led_mc_set() cleanups: drop the extra loop variable,
  use 'for (int i ...)', etc. (Lee).
- Link to v4: https://lore.kernel.org/r/20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com

Changes in v4:
- Narrow the led node-name regex to allow only hardware-supported addresses.
- Remove useless 'minimum: 0' prop, and add 'maximum: 15' in the default block.
- Link to v3: https://lore.kernel.org/r/20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com

Changes in v3:
- Add color to required multi-color leds (sashiko/Conor)
- Bounded registers value for nested led subnodes (sashiko/Conor)
- Add fix for PCA6535 reg limit (extend it to spec)
- Link to v2: https://lore.kernel.org/r/20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com

Changes in v2:
- bindings: Reworded commit message to explain the motivation (Krzysztof)
- bindings: Kept the "^led@..." pattern and modeled multicolor groups
  via a dedicated "^multi-led@..." subtree.
- dts: Renamed node from "leds-controller@22" to "led-controller@22"
  and dropped the unused label. (Konrad).
- dts: Moved "reg" to directly follow "compatible" (Konrad).
- dts: Fixed unit addresses to lowercase hex (sashiko).
- Fixed checkpatch issues
- Link to v1: https://lore.kernel.org/r/20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com

---
Loic Poulain (4):
      dt-bindings: leds: nxp,pca963x: fix reg maximum for pca9635
      dt-bindings: leds: nxp,pca963x: add multicolor LED support
      leds: pca963x: add multicolor LED class support
      arm64: dts: monaco-arduino-monza: microcontroller LEDs

 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 108 +++++++++++-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  | 110 ++++++++++++
 drivers/leds/Kconfig                               |   1 +
 drivers/leds/leds-pca963x.c                        | 189 ++++++++++++++++-----
 4 files changed, 361 insertions(+), 47 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-leds-c292e68c9a49

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

