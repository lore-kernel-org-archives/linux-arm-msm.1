Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497806;
	b=ciLJi4mSLOex/chbN05Yd79b5VW1hvYgiY9F0Z0FGb0kLUyOkM0bVGa7dVU8YQ7oAquU
	 IVfvHmdQCl7ZsiPncK9srOMKNqghMjAwV2nNiHeTn2OVm9fLqoqZlIfeb1qVv9OvgmwoP
	 jq45BK3m5PZGGCq9HA8ap5diO/uaPI+u+1NIe5QFCW9zkNhFoOeybp5Cl3bxsB+3br07E
	 +l4gKovxynx92IChUxfQawyPCjvLLbjmK3tu4G45crgQANYVCppOnSO1kIzMcYozTGByM
	 nsfNUMwR3DX4VLDzuZYQ8I987150Tm/3sI+kXai8eHbe5NlCJlydMzL4UM/RpRPH68Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bByGg6JAw17Ly5zyYq9Oy9b5UiJSKoKnL0GaYBDTkvM=;
	b=Mou0yUFYw4p87QTOrVU0ElgvcAc4vkQXvKzZeyVJbPYy4o0RrsxT7uSsfaBrA15mVa4L
	 /QAq74GPPlSNTAreZfG1urcfn1MxRKfIZXxZlHLeMZma10sYplsphi4xMtRZQjTGIwQQL
	 wzmOBkeyyCIoeqXIWjaVKdQLr+fxR5Yg/54s50KfnYYoUb+RtEouL3lmw3qVh7WO9OtOR
	 yaGfVZLNoSzFgTOKHP9fqFUyUMqT5IkLQiJG4jqFGO6/dy7wuoI0JVIY1Br6/ZLEt430N
	 ZoHWYpnJ+2VM8y1l5F2FffQ5it3hw53olNtqtfpp5VzCogx9xapKnSqJVP5d99eHo2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8cw1c5d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gX6k5Tlp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984ED606A32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 984ED606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8cw1c5d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gX6k5Tlp
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZOf52593688
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bByGg6JAw17Ly5zyYq9Oy9
	b5UiJSKoKnL0GaYBDTkvM=; b=a8cw1c5d1f0tWkOY/B2w+cAq3Bi5Dz5M8i4Vbl
	yWYkA0MArDrj8xehZZ/+az+VKz3CKcsIMfCK3uaPP610t69Pm+gVAmRpJNeIYsy1
	HOjs+B+otWRJuv7hso8fKQseru3tI28WHmZf7q8ziM7BUP97Xp8RJ8vIPaEExTPt
	pDG28q2YlrykPG+0f0JsC1ipie/YoM/tWY8+OH0iabvOe5JNfeEgbGMr8PjnZAvE
	dYFt4I0upwAjDi3LZdlabj4xb6v3TjYRYAD8RuNlaQ181g/hYjJUAUsnn886f9HY
	mvrkcxBjhsM75Zor33eFsgP6iB6YLqPwjV6AWVnocY7iVyZQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx311kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:36:44 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99c203da2baso348315241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794497804; x=1795102604; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bByGg6JAw17Ly5zyYq9Oy9b5UiJSKoKnL0GaYBDTkvM=;
        b=gX6k5Tlpz9rotdlgtfGIzh/stxizseorFqZ49kX6Rm+HlCXBq3LFXIaBBlfnlufzA3
         NrD/ru4BZSjac2BcRtyn9akariuKyolu0Yu6IxofeP0AUXO5AF32FU9vSixw9iqFZ1dY
         7lDLpX7Lh57/z1HSC1d2QvfUEAyb1bKTo5B0iBUWBaJJun7IbrEraN4UHCmH8missbhS
         9RLn3apDc4izGtVhPA5AFQMh9nSyXbX+yQiQB1ZV6Bx2E5hwBsGMX5JVfxoO5Jru6hLJ
         BKDz5h3S490iH5biImWVCD4iVWHUc7Ygd8GaC9H4lcpYecSwnDxkV92De5OKu+vJevBp
         gNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497804; x=1795102604;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bByGg6JAw17Ly5zyYq9Oy9b5UiJSKoKnL0GaYBDTkvM=;
        b=h5ymKk1GyJhtmJq0Ucd122ZGp2GGyLeXZqVl2Qj9NylKqucKdt58DJY2cGGCu9O/Wp
         8plmckW07DZ6CoeCXYHkuN0GtXcwJ6YdiY5xEGFGU06iQth3HP/n/9kvtzQ1B7TgGobA
         8Ux5eT3i//8+KcXcjhwQ7iyCWMMLmJ2MNpdGEGrAXs8cu1STr1wb4cB0AmY8+fgxGLmX
         dG4GSkSmeGSPoj6Uvo1BL5yhoVCupZNALlnZSSYoUqbX6jGdGZKzkkk9Y6OL2sHRlGyJ
         w3JG8RLMdi/b/nF9SdOyN3BrNg9tAz5W5NwuxqCPs0TWVOobAo9ZXYN5s+IBO3ICk2G4
         FXuw==
X-Gm-Message-State: APuU4Z+QTxOIxBI7aM64KK368ORaPchhn497Khg/n7p8xKaBoJZstnlf
	o1bSULnPMoTqAJ1ux88FanCgZTyL/5yjHcfHeDlHGR7TpZO100k79sqwKNEZ2J3MGfmhFikS9wM
	6tlfsmDYkHwkD3lf0M7n8bbynqQj9tp9mKhe3i0YuHqb4XIjlTiZzy2EbQX8HZbJQCxOC
X-Gm-Gg: AYBFou3UtvGICwDxAwSTsj/AS+8n2eMcp/8As2yCpOBSmTpzDu/BQ5Y/CPUYm93vZkc
	8rGK0bO4opgawXYS52btCmFSI7Ibl60nenQpbCfHHtnWPNbOIbVSekRpBCsGS6lBEo012mw4Fm6
	7TmxOjiIKD71AT+bRnLzeCN3XDKZSTjIan4AHSm2GxthpOgszrsirKb1QG1WQAgIRCJi6NnMFfl
	qsJrmDKWdF8af5q9OuMLQNwYl5cXTp1fjDKsaudkrkJedsndYmdcVGh0WFapSh4s1LKOvtLLgaS
	9kWMtbxCwoRUaBAJs7qiIhGNZzO7syhDaKsuu0fnlzqgrmtWlwQfOajnut3hIDCnKwNFs3ejl2u
	ICvbpfBuplgNQxk+ozJt4z4/17Kwnct6sHp12D8op2k/ZWKFGlNdopzIF9RQKwB8ert99+h5VBQ
	KHSA==
X-Received: by 2002:a05:6102:334c:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d50615aa99mr2084950137.37.1794497803601;
        Thu, 12 Nov 2026 07:36:43 -0800 (PST)
X-Received: by 2002:a05:6102:334c:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d50615aa99mr2084932137.37.1794497803043;
        Thu, 12 Nov 2026 07:36:43 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba09536ebfsm138353235e9.5.2026.11.12.07.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:36:42 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] phy: qcom: Describe the AHB2PHY bridge clock on
 Nord
Date: Thu, 12 Nov 2026 16:36:37 +0100
Message-Id: <20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAXd9WoC/x3MwQpCIRBA0V+RWTfQzOJB/Uq0sHHMoVJTiB7iv
 yctz+LeAV2baYezG9D0Y91KXuCDA0k+3xUtLAMfeSMixreUF+bSAvp045p2lOcDOTD5U5AowrD
 a2jTa9/+9XOf8Aew8FqZnAAAA
X-Change-ID: 20261112-qcom-nord-ahb2phy-clk-2d21a9dcfcc2
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mULlwViyv0exnFtcM2GrsqpSROgeSPiUGvff9t1domw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9d0IsJ8v4K0XcrRUuq3BdJIgorK6rsVPY+uEN
 NtpoxEpklCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXdCAAKCRAFnS7L/zaE
 w6auD/95jrzroX+IKtiATPMHYGVSu7T1Uxa+mBTb7LGhyEWm7J2ub4ba9rYAZv3oQX06/oJWmIO
 NgUfAgALPcd7Q98g2V7z59mAKfrb80yJnOWDhf3XrUfroAIvElqlIYXTfwOUwmYGDLCC8qlyymv
 56etBFyWuDmdhsIrxIIKxBa2v53Aquajp5peqiGNRyaWDsTQr+//djo78kZQ4qQHAIhdYmmEV82
 47+U3+VSszq4qQUV74wnHQl0YrirWuwtNjyyr9x/+AokTuJhPII4MsG5n21H4/zP1+65b9pWkfq
 6LHY+wdsbfD0oEwWVjeAdWgipqcXeHoOlfSQae5Qcbm4Ai7AT9V0/NHZpE8RmMhtoIQ24SbuBiw
 B8uwWiwB13uyVvJ6YxxL7M2E6xz1vR8NqcTA9JniLLnufXojSEmOMPKBcP4JsYmDtYqZDTAGdoA
 U/n3SmeL/vNLUuTobJQA6So1jKFz6PWdOLAFjZnlm7vZ6N2U261uY0F8e53VWQ/b0Mn8kkXPhAS
 UFcmKRhSOeaOqgct4SsUHDgfbadByOIfUp8pVCpCQkzF0I+kbB95kKU5dnf2pRPoQem5PApVVXf
 2Baz1UkBvdZKRh3P6jfLXyspmuiepbzTUy4VDOeD7vBFW8qwEEEMeLQuPHknYAQ1lVJDh6Xuw41
 wVPkCzP+cEEQ5KQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5dd0c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=j5_5Z_UV0zr-ZIPiTBgA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX0ZHiQonnDh59
 WX8Nas9jza/R0/iHEsLyru70A07tTD3+qptWVy7y+NM2Cn1GNoF7aVZeZg5wF5Vtv0dGmO3jWV2
 TlPaurFVcUJ5b2JCMEQvTXohcTRZ5irpThOBzaYiaT5EQnxcGpAuR9o8eV4QED7pJ6P+ntSEAs3
 mWfx1sQZs7Z53Tt8HKjPcHSfI6zJ1E0KiYLRkP4L/0a3bbmnS4uCTBrfUPA3FTBu/doLlUwK+F5
 ngR/uYOJAUWQB5Hp25Rkxvl/B95r/rhLqsVBe/fYys56V/EF5EDlGBHhK7SaazcfdFwIlLD45qr
 yP9ondJvCJlbkPfKQW7ZPRsorQbAlrhb7CYFtm66r0dGVOG7Pl3KKzm+wOiqNE5igL+zwq1KxRA
 JPl5KB5ymvojKFJ/IhRlDOdVZ0/z5Xq57mm6ND806bXW5s8HZJjIO4zCnECYk6f1ffW5reYUG09
 NuD4Ob7AdQ4gQ9dpe1Q==
X-Proofpoint-ORIG-GUID: 7__905tJE-BwQTGSez8yQHtI4uaNM2OF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfXyCnySgQwdYGk
 GHqX1am5oEfktvpJ69mgzWh1JBMt43lUMat9GaC6tGOg5/OAKSFgBoZ7td50jTdhjDiyr1Rqcfe
 J5yL638uBTd5tDG7pC0M8kUXv6KLmak=
X-Proofpoint-GUID: 7__905tJE-BwQTGSez8yQHtI4uaNM2OF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120062

On Nord, the register space of all the USB PHYs (the two USB3-DP QMP
PHYs and the three eUSB2 PHYs) sits behind the AHB2PHY_0 bridge, which
is gated by NE_GCC_AHB2PHY_CLK. None of the PHYs currently describe or
enable that clock, so clk_disable_unused() gates it before the PHYs are
initialized. The PHY init sequences then never reach the hardware and
the controllers fail to come up:

  dwc3-qcom a600000.usb: DWC3 controller soft reset failed.
  dwc3-qcom a600000.usb: error -ETIMEDOUT: failed to initialize core
  xhci-hcd xhci-hcd.2.auto: can't setup: -110

As a result, USB on Nord only works when booting with clk_ignore_unused.

An earlier attempt marked the clock always-on in the NE GCC driver. This
series instead makes the PHYs consumers of the bridge clock, so it is
only kept enabled while a PHY is in use:

 - Patch 1 adds a fifth "cfg_ahb" clock to the Nord QMP USB3-DP PHY
   binding. No driver change is required.
 - Patches 2 and 3 add a "bus" clock to the Nord eUSB2 PHY binding, and
   Nord-specific match data in the snps-eusb2 driver that enables it
   alongside the "ref" clock.

This should go into v7.4.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Drop the qcom,sm8550-snps-eusb2-phy fallback from patch 2/3
- Make constraints on the number of clocks stricter in patch 1/3
- Tweak commit messages
- Add Fixes tags to DT binding patches as they actually fix existing
  issues
- Link to v1: https://lore.kernel.org/all/20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com/

---
Shawn Guo (3):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add the cfg_ahb clock for Nord
      dt-bindings: phy: qcom,snps-eusb2-phy: Add Nord bus clock
      phy: phy-snps-eusb2: Enable AHB2PHY bus clock on Nord

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |  3 +++
 .../bindings/phy/qcom,snps-eusb2-phy.yaml          | 24 +++++++++++++++++++++-
 drivers/phy/phy-snps-eusb2.c                       | 13 ++++++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-qcom-nord-ahb2phy-clk-2d21a9dcfcc2

Best regards,
--  
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

