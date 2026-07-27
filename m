Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F28138A715
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164081; cv=none; b=H+k0jBaSFKwHuIXnTsRfD9UfLTyIaM/80m+aqLrciOyp495yEjV1SB0NGBUjyt/9n4GNhLjtzPMIfMQTQgiPxQKU3wo5ZMJtpGHtNHANg7yRLHlFzEhEbWjm4x/FK6hy8vkd80yK9sB49neCatb4xjIluaiZI07nwFbclrr8WUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164081; c=relaxed/simple;
	bh=xXyzJdB6YbkE/YtuRRtJ751/jp1klII4hawODy4l0h8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mI+Hn/nmArI6tnLJ1ecNz57S5cfK0Z95YPkdLAi7IRM4FZg1g+btq6YwMMSYelI5sANEDgzJc/GBbY6UlVCwhaOPZpa1oOvpvJ/l4YSwUjSE3Xlv7s7S5g4DuoBtY34XMcIq6yiG5jlAcAXz1c/5N1uckIvN1ZKqMW+KTjNxthA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaXkVkLy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMJ6dbnI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JaXkVkLy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMJ6dbnI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDm96M3823637
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yzqSchz4Oq5EuX/YsRclpV
	0d0k7mwwAwfJEMLNIbdkg=; b=JaXkVkLyEkv279PkIphyionoeFHvZ6mEXm/pyP
	W77RrM/ci/g5hKgV1uDoe6509gzJhULgICWNq+PsPP4zer++r63lxHLqYD3CNad2
	F8Dza3KbIL/n0PDL8WDwd7NjJwvYpUptdLb2HekFu9sE5P+HZ398uD1wVL4SBhkE
	rYTqZBKxhN0RiKJaQ1zRqEfm5Xbr6oeaGqcX749KgovHtcP8oizYctaLIJ8Di5Nn
	7yH1YTIds5ZzQUa8Jcy/VMH3eni0qJsCLNHv3XPpzVpq8b+0nXee4JN5iSWFV/Zn
	8wR+vgKJyLxLrA3QyIUb08mii1nvD66ZPWstJjsyVJyEqaFA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbs99j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:54:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-529ae8e96e8so18944721cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785164077; x=1785768877; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yzqSchz4Oq5EuX/YsRclpV0d0k7mwwAwfJEMLNIbdkg=;
        b=iMJ6dbnIPUBrtc7wy4If8X00NzJ3sOH1+ErFO8MW7OsAOCZHpMmm8r+o6+28fgazZw
         X5BC7gQwrBVa9l2chq7RBFMzesQ2fbe+AeAh0FVvrKoooY5QLMbhjIyX5kosPITdkFbU
         4p4/TyA4k2+DWYrguPOv/Bav+0R34NhIN6RAaumsIkmGd1yavYOZhvN2XOyjMVNRV015
         /zEPxIEKUOZAZy5qWv9kuuO2+tG/+ZH9FZjc7Nm8lE0u5hIZpg7OHz6kyTybW0IcnY6m
         kB2O6NH59NFJ/bEdxNNFCtu8yNiqVSBXcOSSCBRMIWd6q9+eTT9d0xFzDpQYkb2qqybV
         +iWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785164077; x=1785768877;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yzqSchz4Oq5EuX/YsRclpV0d0k7mwwAwfJEMLNIbdkg=;
        b=O5zPQQmO0FXpprCJhLsSQrtuanVbcnqeT5YUXpGTAc1bnHeZQwmwv43YGgEr/6uV9R
         TN6TLDeNTV1Ym1mBsEaEGS8WJFc+nwRolK4ctT7fpNvuh9PFm8y71stfzAPy3SjsVUHR
         Uo2owbkYa1ZbXUlX12L62Ic0GvuyW0gexhIy+SLpFjD8VCAS4R1lFiwjC9JLZE5e7Gmy
         UqpDsPgy6PZCLCLLpAvYCdZWER0t7TAT6Hb1niwXXr7nKr7dG8m5Jnm53ys0Si3w0/TL
         jEdwY/CNUtsFthvodhyDkXrDNsXyTZAycQ0bV4Ex/31WAI696ZWlegKwohIQq+EQrLif
         wn2g==
X-Forwarded-Encrypted: i=1; AHgh+RpinuWFrVnMb4y+PDRYiknh4T9QJ1aaak6OmxBHXftkQB3FdfuNeXVs48w6G7tEeiKVdzYV6gyv7KHlaGFE@vger.kernel.org
X-Gm-Message-State: AOJu0YwTKaryk5Zyz9Cc2pvMhBSlRGcIv26bFqypg28tajkWRXJEDaov
	c0N+w+A1TWshhap7Ts+8REb6M3vb1ZUlJmYYmomqvAoKropws4kLKamktKwdOlu8ZMb5NXqbKqh
	kWxKPbRBLQvFLY5oErNCtgG1KclCtABEIS7IOrIsz8xF1jzgf8OhpT8jGq6SspS2BW1JJ
X-Gm-Gg: AR+sD10mzUO9XNhccFMBf8MUjPLQ12BdcxF60XHDWg4LcraAWWPVp/hDAdo50Zin37z
	RIOe86B7HTYkaYqnwVXxQOy83RG25A1SAjK2bGUCkg9FqhigUzU2vylMgO+jswPAgSbqfzxfP9g
	J2sI/8fumYtrRY2TksRcg9poU8ig6/2mp0HTb69t5AnIdIjJjYxsxz0Y+m7+T2qFzATqZOcoNBI
	Kgw2CYkGJyfw91YNmf67ZVzqoA65NAAl677O4nxiO0HxDLSfqLmqv0XkA4zB6OYzewzKEpkW1j9
	296RmviafwwqYF1muMoNlzjqQqpLBiukLXA4FShwUSsQu+bmd5hNWbBCvlm55fy0i6/G581HJD6
	q9Ytnx9pBa9gkbNZSzaDCitnWr/pFDx7Dm8stV7uYqdoJ5g9FOr895AsxoNcACQz/7rLX1PlZ4i
	zcDqWY3PQwo+mLmXEBl38MrSTOewSp3ZAyT5oB2gKSJrB6vMZb35xD
X-Received: by 2002:ac8:7e85:0:b0:51c:f3:34e3 with SMTP id d75a77b69052e-529a84c3aefmr88731791cf.28.1785164077468;
        Mon, 27 Jul 2026 07:54:37 -0700 (PDT)
X-Received: by 2002:ac8:7e85:0:b0:51c:f3:34e3 with SMTP id d75a77b69052e-529a84c3aefmr88731251cf.28.1785164076769;
        Mon, 27 Jul 2026 07:54:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb594622asm3027582a12.26.2026.07.27.07.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:54:35 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v8 0/4] leds: pca963x: Add multicolor support and enable
 Monza RGB LEDs
Date: Mon, 27 Jul 2026 16:54:32 +0200
Message-Id: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAChxZ2oC/3XRzW7DIAwH8FepOI8KDOFjp71HtQMYWJGapAtrt
 K3Ku4/0siA1F0t/S/7Jlu+kxCnHQl4PdzLFOZc8DjWYlwPBsxs+Is2hZgIMFFNgaT8Ov45eYig
 UwUJUBq2TltSB6xRT/n5gp/eaz7l8jdPPw5752n3KzJwyyjBpZE4H5PJtLOX4eXMXHPv+WAtZt
 Rn+Bc14I0AVkPvIvNR1KbUjiK2gGkFUQejo6jXGCCV2BLkVTCPIKjjtMGEHEpnfEbqNwFkjdKt
 grIYABsGkHUFtha4RVBUC1yC91ymKsCPojQCyEfT6Cw6dEz5FZ80TYVmWP/W+S7A3AgAA
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
X-Proofpoint-ORIG-GUID: C3atLg-D60ewYXjAHO1hV-jj8KoM9i5k
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a67712e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TplmsQoH72OTL2-p6AMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfX0/I8dyy9nOq9
 tFhwr58TKxa8SzQ6+LUpuQceIAcA9PegKXFOPQdBlpgLtDoQA3fmbM6dj0/otwezYCD9jR/w40S
 WmuA9oOuqpiTHtrU9HrHGMGTkQv8Gg8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfXxRpqTiP3UpP9
 oRlV6H4zBidMnSTE4klYnujXa1lSMUioWZik7afGQ8jpECeDntwS95JwyuGeUSTEzBLcm5FX04H
 XBWBJ+xQphB76RmsAonhvu+cL/HZXptcbOvmw542CdkUIkPwuNAdLS4cKIRtD2TMprhwF8rHUFQ
 U/NedZOwQtRB+yRNhqATgXOTqFcUf6SSh+rhR7oDTzI4VSiOo+n8iXZsQI2K2bDihv1s19lrans
 yDN2XnVhk9d9Hu72JGqHHU0epZqrHxnnE5OJoGKTRcMbsHmoG38oSM4sefw52MY0RHnN7cKr4rF
 hW/KLwkdYpzt47M13Jym4OwUZWJ5GVRWctddTODmdcoxMMYLE0MVShLAQpkF9EaphUIbo4UfLX/
 Q6qKkrYpdpggKsluoFaR0yPH2GXY4To7l+grePe5IzASPgqsbnww0BwUrp7xa/408FYsd9cOoXB
 /T5u50ianfQ4vy1mIeg==
X-Proofpoint-GUID: C3atLg-D60ewYXjAHO1hV-jj8KoM9i5k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270140

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
Changes in v8:
- bindings: fix indentation in the multicolor example (Krzysztof)
- Link to v7: https://lore.kernel.org/r/20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com

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

