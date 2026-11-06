Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952006;
	b=r9L7O2B1v7vkt0H+mZR+EYom30gIodl0mxuUBoTA53L5KkmQwYmKF5GORPXRpg7ZHZue
	 qTMr3Z8LqvM8EJzD08fHsOwHcVlJTvxqt6EIVV+jPM4ltr3kXXt787ffzJp4M5WRgZuhI
	 YlDWXAFedQlGjb6FOqRJG8CNNCxWhpWtgYpSTapYF5DmfBtrvHV9w7B2pyVNWRBvfHEQ2
	 hNquce3TcoHTH4TxByrnFbSI1vhtV0vh4TJ6IT33g5Rczadize+REGr0azE/RqERzUw1p
	 pHmRd8G0MfnUjv0QhhSQiP0p2kpy1mamLaLa2qNFfxov4WkTCYaDXyWZGvvGv1icXrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952006;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=w+gMWz1mqLi3ntza9kU1FJ9p4AdvGdZcMlMdwkcECG4=;
	b=qtjNzYh8KMSRWa5sBVptQv4cm/7PrVntRCjXW577Ei+c1HEeu2IhphcYEKgTRSTlqjAX
	 G7LqZA8C8tAig6A4wVqotSaZuQVK17/h4EWuC8tv50ubzC148cUOGkEov0ICnHze7vqGh
	 1nJ0zmIK+PD56BBx5jtpOEzPtU9hKprU3FYTgVHTbYsK04rlqpeqlpSN1Bc3S5dNXZuGW
	 1lsUOu7Lvvny0+LCCBeMPGBeJrMehtuahRyfTB2vclUaa+FiDqCLHcaZPI+ut0B1fAlQy
	 y7HFtDF4gcfy1LW9X6c6tBtpumUlslrivsbp+geaU57rCe2JeWRDw1WsW8XMRZ+qVmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pV5ztr5G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="erqLw/D0";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3BB60A2610
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 08:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A3BB60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pV5ztr5G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erqLw/D0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RJ2D1679504
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 08:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w+gMWz1mqLi3ntza9kU1FJ
	9p4AdvGdZcMlMdwkcECG4=; b=pV5ztr5Goq1HaGItyuHqxkh6B6aeKvaseHrcAP
	/Ns4ioFNVqszYBmtEh+CttVFr6kKtkVed7xvZhykpZm/wDwLq6xhXzKInQrt1Den
	oeoUtH1cNku4sjwhns1TwaihK3o9Lm/UqFg7qNuHl/nu7b4a9m2EPMfB7DJGTfmB
	aaESMBNqQQWDNlC5IjhIwVm521xSkQ36B1UecKUSSRAuPZUMBzH5Px7lkDtPwjKI
	NwiNkKulTfry2aRFnvATmFyrO5NDsP10HJqXpvyeyEI1IyFTe0WRqR8bWadWjzTj
	lHtS+COHUBWYdqAxlFqOiEzenAPSPLmhTwnPrW/2hOFjloPA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pc9qhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 08:00:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05c820ecbso539649b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 00:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793952005; x=1794556805; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w+gMWz1mqLi3ntza9kU1FJ9p4AdvGdZcMlMdwkcECG4=;
        b=erqLw/D0O8+c0JPmQosci11yZOxHJYnMDqg1Dw23uzT7Ii3gtDV/2C4VWsToBrGtue
         bna38fAYtxVWpmbqPUm8Y09r4xztp66Ozk8+hfAkWKQ+HRx4abt2QN456m1R5jmzt9DK
         Tns76Cr7hcLWdQi86s3yMu8gfu6ehpBfBreqH+j/RwskD/LYtgtu3LmxeL4aUdEijGtG
         YhvXF2N2Ik/ArQwCQyqVxtAXzZTUx7e9dZ+Av8eEo6BvdBXbnehizUJ7y9aWiIk1Pg6y
         YBZPrKfF+9L/W6bVparyH/RoMcAY/yF/Ti+A9e7g4ou8G6/tEuiQx0ij/mynCytb5xok
         c/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952005; x=1794556805;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w+gMWz1mqLi3ntza9kU1FJ9p4AdvGdZcMlMdwkcECG4=;
        b=I4OOxBlDrepAG8EefQXb26Si5g1hnXiFW5y/77wT27bdweu8JUOB5FwWoMYWl08Xqo
         aRNMW4R09WwAeBSJiPSIrl0Mvwyx9pY8yIsmgmK/AINquXtw5sem+TXCEKfEB6FVD5Xi
         6g0GHKCgtnVn7GPKLR8BedljKzBECMKGOIb8g/sfzjnlMjSObgo4j0BBLkxeP92XBIoZ
         qcMhcvjxPnIKs5JB9Dyi2j2Wt5jWt/yB3GXtbYv3Op6DKt6hn/aM/4IcIoEvk6iAownH
         SASkLAe0SmLUknzDgw6yrAci2cTIiQaWy2sn8EKYjqfapmuHS9DneeLhYQ9xVN1KxIr+
         p0gQ==
X-Gm-Message-State: APuU4Z/CEeBUjlOOkDs0gAITYsG7eAzIogLWO/TQgVYJddc8He1W9xGI
	xXH2H0q0Qy7r+AVJtLXNlcKUxjmUORhBKSR/n28MNSw4AlECqNVMvUqUvS0m7NScvY5R/U444ay
	hcYqc9CYkPenprWRsooWz0X3MTlgY//QW6hNT3Fz2TYDzmDF7eVyw1Y+hoc9wo4piIh1u
X-Gm-Gg: AYBFou2+tbAYc9Wv3DItx5iCuWeft0HbJUaygXoVWOxx35PIQHDI9IrtwxJZSjHECis
	GMiMWcHT0x5sD9ZZ8sv1zeJjiEdmvtOKRPXFgj5yT4WfWBRb/20kzGy/QsKX1DRnx4zDIPfF1kr
	U0xErPELhI1LnxDHXZ2SwS1ObJCGFxVmj0vNrOphDM9AdKvReWCfu/zGsCbwi4gl/qnXGMGTXQ4
	i6XuokGd4ZFq9yCQ/P7H/x+klXRvEX5RbE8X2AMvOnNXynCtgkdRJNhQO5iVCEsw0Moiia5gtCz
	T+1mIKikt01NLfSfamYNr7Kt00b37MeOz4HfRWzDBjgcMEuYg9Y4wqhCmy9D8cwjPQRbagizYIF
	P+Oo8zbWRPj4Hlso9806SpRSB0NAwW3vydCdgnmWGRY8NzxjLFRgYr/YxYq2ydD/vsb3FDpMy2b
	4sciL+YyAfiqlGGioWrG/I1iD2mrYTeODDjkCvMkFbJHuI60LFnirIZrfcZrrSO+QMX8Dz
X-Received: by 2002:a05:6a00:928f:b0:899:5117:2ac with SMTP id d2e1a72fcca58-8b37c241174mr1517783b3a.46.1793952005104;
        Fri, 06 Nov 2026 00:00:05 -0800 (PST)
X-Received: by 2002:a05:6a00:928f:b0:899:5117:2ac with SMTP id d2e1a72fcca58-8b37c241174mr1517756b3a.46.1793952004593;
        Fri, 06 Nov 2026 00:00:04 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b359dd36d3sm354529b3a.37.2026.11.06.00.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:00:04 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: Allow eGPIO ownership independent of
 the mux function
Date: Fri, 06 Nov 2026 13:29:40 +0530
Message-Id: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAOyI7WoC/x2MQQqAIBAAvyJ7TtBFOvSViAhdbS8qChGIf2/pO
 MMwAzo1pg6bGtDo4c4lC9hFgb+vnEhzEAY0uFprUFOqXM7Irw4hOo+Xi+gIpK+NRP+v/ZjzA1Z
 QZS1bAAAA
X-Change-ID: 20261102-egpio_fix-ddf4c2a4f24e
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793952000; l=2153;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=nNSMcejrg1GBEQ1LH+7ONoNsTI1szoHFruhxFh0t14w=;
 b=U5HJKn/ZdQYeXIpwh7w1+GWbTx/e0eIiUph7iWBPt5/Qq2SCzh8OOVtNThluZ3ulKd6jmYKtP
 dsX/rnkurjyA8mBWVC1s5fbH6glWDj9U0Zkf25PbL0EyIMH0oPxGHd1
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-ORIG-GUID: Gdp22L59UEhoAEPDCbYLlvgjAb0iEN2y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfXwsZIJ/SzqrIF
 +sQ43zIZRytlJbABpXGIGfjUoqP1be40nm+M2Ajb4oK2F9zP3Xqs7jODLXjbI6OhIJnN1Kk0QWx
 qQmeDOxBt2tWTa1qnhGAHGU508VfSXV1qOE/2zBUa4f9pvVZv6U23cMFD0FscRwE9HxjsgNTA/W
 4kFhyJemB+hJy31EwdgD9FSFbKZEjhBN3b9qhRM3raOYH0jpuxpVDNLBIZE7CiVphTwcMYSRaN6
 cvBKZZBuF6H0uuoaOxUW1SgCWilcJL3igDacXGh3WLWJnj+jFO6CuxA5K8kuu/WxdDu9M5FE/Do
 sgrCXtEc/Sp0AOCv+YcrcfTm5KktUvLohAJz0kb8/Xlp0jdk9PB/+4ZWflYGdxVUc92gfubml6O
 V8v2EOibBtdMO23FehTMoLEmXG8gPEja9mH5rlL6N5MUgBet6jAtpjUqCTi7o2Dj5rQqiC9HeZR
 wjj8KGFGPQziPc5tirA==
X-Proofpoint-GUID: Gdp22L59UEhoAEPDCbYLlvgjAb0iEN2y
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed8905 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HuJJzTBhwpvvTeHBZjcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX8MeBVexZu4Oo
 aZUjKYbMQKjFs+bTtEiauTfM9JAUFNBmSxGtk10jMKQYcSL4mKFdfb+jcdLY7kVf8AKQsjb5Vv9
 LTjkiuG7zqXwEyv2kGG2BoPzEhVKg/Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060031

eGPIO capable TLMM pins can be handed over to a remote subsystem,
which then drives the pin instead of the application processor. The
eGPIO present bit describes whether a pin is capable of being owned
remotely and the enable bit selects the owner; neither is tied to the
pin's mux function.

The only way to express this today is to select the virtual "egpio"
function which transfers the ownership to remote io whereas the 
single-valued "function" property e.g - gpio, qup0_se0 claim the
ownership for APPS. There is no way to describe both the pin's normal mux
function and enable remote ownership where as the hardware programming
guide(HPG) mentions no such exclusion. Boards that need a pin muxed to
it's real function while the remote subsystem drives it is permitted
behavior according to the HPG.

This series adds a "qcom,remote-owned" boolean flag to the TLMM pin
configuration, describing ownership on its own. Its presence
hands the listed pins to their remote owner, and its absence leaves the
ownership to APPS.

cam_sensor_suspend_rst4: cam-sensor-suspend-rst4 {
		/* RESET REAR */
		config {
			pins = "gpio239";
			bias-pull-down; /* PULL DOWN */
			drive-strength = <12>; /* 12 MA */
			output-low;
			qcom,remote-owned;
		};

		mux {
			pins = "gpio239";
			function = "gpio";
		};
	};

Pinconf-generic emits the mux mapping ahead of the config
mapping, the flag is applied after msm_pinmux_set_mux() has
claimed the pin, so the combination above ends up muxed to gpio and owned
remotely.

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Pankaj Patil (2):
      dt-bindings: pinctrl: qcom: Add qcom,remote-owned for ownership update
      pinctrl: qcom: Add qcom,remote-owned pin configuration support

 .../bindings/pinctrl/qcom,tlmm-common.yaml         |  7 ++
 drivers/pinctrl/qcom/pinctrl-msm.c                 | 81 +++++++++++++++++++---
 2 files changed, 80 insertions(+), 8 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261102-egpio_fix-ddf4c2a4f24e

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>

