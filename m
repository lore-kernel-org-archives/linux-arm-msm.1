Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C964940B398
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 15:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376536; cv=none; b=P4A4zS9AtWfoRABxwBL0AZKEep6xjR0YC7Gf2O3Jzc7Fo+Uv243bXQcRlGIaIpqZtYlF/hs0yqQVhb9Rj/dBhnk6jYOdxvmpwcNlyZyN7y0CmKARwkEgvdsDScSWwucnqlcULPxwNoFicbRauLtQl5OeaGPDD7RlsO+Lgo6jI/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376536; c=relaxed/simple;
	bh=/iME9U4DZopgH5yA3YpkX0M4sCoYyTKd5z7eK8+7e/s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JZpHTim5MCTiu58AaRR0+KK/uv3P8dX0iH47fvVwhy81ZX+RHxSPi0s/JDW54XZOl3c5np9mDjqQdozWK75bZOcG8ORM8kNuYIZCDcrlyg8wks/JJq6XRiab9hoJNMDtg6zUogYkY5IruIlooTH9UhzHbMkobcJOEDpCAaUCBqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmCGpgjz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evIOavhB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmCGpgjz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evIOavhB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWEXI2090603
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 15:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eLuS4u0Hi7E3hpkD0vQROs
	yQnpBAEmZmD8ZIrcsAD78=; b=kmCGpgjzXuqB/vrAPivyv58e4IEe5MeSjGUBDw
	vDacItwMTtJXxHixvJTduuh/uec7JI7n8G5xo6Kp4GKUXilbR2MA+Shh61JFREOm
	PK8mMimkunq6SSx8BpCltLfzstCaEMixzUN1NtawDC6swkdijvrxrSt/FlS6PBwI
	14kd4sDpKu3k5jE/xvxNGKAaXS/iudj4i9AckDwLPDFBADE5krGF4Aiiq69rXL6F
	E+Ujks1xn2tWPqGg9nMEPj1A8g1+cKN7tzwXsnkGbBmlzI7rXifBDFa4ov/xdApB
	Asx5KDNH9EQGXNvYj/JouDRxCt9rAiNILX87edINqJsE6RRw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fybh59qax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 15:42:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1eb52e1fso38200841cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376532; x=1786981332; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eLuS4u0Hi7E3hpkD0vQROsyQnpBAEmZmD8ZIrcsAD78=;
        b=evIOavhBkWVe8LRtqgGFS9iqg+vE72Ht1kO0ISxdLHNoFusao85DBgJW3EZ2NctMXe
         oaAaiF8CdQSkiqjDzPkCHyzLoYd27yRBDAKsdpeHDAdiic1Aq5c/2pimDRpNDI1AduMU
         EETHHM0WF2VjSPm+BwGVJgfkOKO8XQCAqW+VNv9gRK+jAnoUCaHizqK36v93lVVbg95K
         cGUg6OC/F+4NS4FzAyGFBy2ejs6fxnx2eO5ef8sL/UfDoe6wwbH6bUq1jAfJb2yw0nW/
         1TmUF0R380sHoWDoWhsPEEFpjCGYGtGyohUElt5R+QSuICxv+24qs/h3e+ot0dBR9WoU
         FzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376532; x=1786981332;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eLuS4u0Hi7E3hpkD0vQROsyQnpBAEmZmD8ZIrcsAD78=;
        b=jzWekYfFDZ2ziyuJfn2/5JWNR2buoKP2bFhLrgnCDJV5ul7wtCsGI5gfdYKA/dpQgF
         vCxHvRrsty1T317I1Lti+7pMPF5bNXMvuU0IB722acSw205H6kgxAT+HfyCCLsquUd6D
         O6FOWCntxcIzsKOkKmtvqxBUy/6Ka2IM0I/yxLwFMuW23KqO5gWFQ01ZesOIyV7sB4t1
         uVfGeJVfpkdl/0S2ioLcK3VxvjWkvtlT+vyWdHE1levsLVlDAbhh0/ai49epTBWJ1Udt
         VS+GtEmKYeDdojLMjxVjjqC1QWJYCe54W0+CDmWQ1gY9ejGL6+NhTgp9KcPyQWJw+DoU
         SV8g==
X-Forwarded-Encrypted: i=1; AHgh+Ro93/jseXHHoAfM0W8ifcw5q7zOxkEJHlTx/7o3cLj8sqU93wHksvTgLO2yIK1gKqWflSX7jasUVAI2GdBG@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ1GQTu2sjJw0X3gZ9idWE3YbBbO/Z5A7bblyQBmwKOcmlhtTL
	eQNdaSSjPZi6s2Zo/yCtQLIJ3fM03uNSl5OeSg65rn/21rw+uLFbrK6axtuPS1WzbGOp8i9R3je
	LawiBV1UUz30niOAHdGHbVOFhNhKtC9R5LhJ8W8tqH7ZSwae4A1LVt4Z96idALrt9eciqpS3Gn0
	hY
X-Gm-Gg: AR+sD13kAEb8wmJPImB2ioeGxUvznctX5Dsn0CCp/LISaX8nOv6e3mHWnbde/4d3tlX
	it6mHoLei4G0cEGUpyh14+5ive+5qkFddaQLZx/B5OemTiPckEYuKbBTDkYFBeEay+GNZNBkSj9
	dYbtaQpI0Dkp2MWGBzRaI7kYgtzLOXDcnDM6Lx6xnXsL6VfMkPi96ifLXgqMQKmzxMeEgov1MBW
	OCk1DjQl1p/aWMkI4wA5R6mfBPsU82L7Pdo0FvvweZQq85p9BhjFJZD0iMl5UzqRt2b+TAXRSbn
	mSkNRlWkkKwPyahSNqJSjuw7rFQs9f/VcI72vfKJJcWpkq03YgZzZGx8U0nbspoRW8ddrAHSLfL
	pBau5TjOnb5yeuJhsHk79i2v0trhpBbbxIDht495ssb16+QeZ8xBNR9CiKPiBwiw5pjrNifju6n
	Gyb5Ic3CrfwTht1A==
X-Received: by 2002:a05:622a:1308:b0:51c:f8f:13e with SMTP id d75a77b69052e-52d4bdba3ecmr28771561cf.40.1786376532054;
        Mon, 10 Aug 2026 08:42:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1308:b0:51c:f8f:13e with SMTP id d75a77b69052e-52d4bdba3ecmr28770451cf.40.1786376531332;
        Mon, 10 Aug 2026 08:42:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/10] ARM: qcom: msm8974: enable HSIC controller
Date: Mon, 10 Aug 2026 18:42:04 +0300
Message-Id: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEzxeWoC/22OQQ6DIBREr2JYl1RUFLhK40Lg29IEbfloTIx3r
 1WTduFyknnzZiYIwQESlcwkwOjQ9d0a2CUh5tF0d6DOrplkaVamgqXUoxeyKuiAmj7QGcpLpo2
 0ra14RVbsFaB10zZ5q/eMg36Cid+doxHgPayuuNd+KpWciXIquGS55EIyLdXIyP+9E6bvdN8Eu
 52UwmYyLwueVemB6gaBmt57F1XSwRSvvsEIgdTL8gG+TI26EgEAAA==
X-Change-ID: 20260810-msm8974-usb-hsic-561bc9dfd757
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3676;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/iME9U4DZopgH5yA3YpkX0M4sCoYyTKd5z7eK8+7e/s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFPhPppiU/+8z7hFJ5yT8GEzUAfh/+bYg8ci
 lA9lX/VZCeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxTwAKCRCLPIo+Aiko
 1fVqB/41VEeOkcrTS1P/XDhhk2W7e9+oWZOskE4kdqebE8gex94qYCg0uX8JRrIQtjceF7If5sf
 safqOPI2dzMh9Bi3w9ZBem3+BEXCeyM+2RmPotYzOEMlkAz68ApxD4usO/MK9SU6BRSUGRWdurh
 v+2s2IYRiEgVFTLPdNRvvQk02pX9cnTQmdwL8oHlPSftykZaHSEq8HD01R/7g0OE5JFtV41gfbN
 KBMK3LdyfDjci6yFftIMAMnDYtziMJf8BGds8gRsrcdxZDVaFlLaK6BBtTsmEL/cpSPS0OnlLzF
 PKdVpzkV7HkffEWOlmrBddyZLuDupZfp/kodPyjYFjd8yhw4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a79f155 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=sGvnmoecOSnWcdYzNygA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: KqYvh-SDgmpmwsocPJALWdMkFwLkSkNz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX0t81X0C150rm
 CaDrFzTVY4RzVe60P1Uherr9zlV4TfbbaQfRiLIdmaQ0hDAgiWFLrO4UP4irtp8SefOPUSsWfIR
 3k0vp+73FrqSInGtXFazaQIYphVw6Wg=
X-Proofpoint-GUID: KqYvh-SDgmpmwsocPJALWdMkFwLkSkNz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX4UZbZQHWUqAR
 IRFbelYT0BFQ6TXM0q0iPyrJ0lx4iYqMQZBWblAtZEMFRJxOMfOrxJkOJRV2fSuJvdelkDeMWNb
 NCgRQz5Na0D7HVg09PkHE07vV5EKwlk+h1QO5EP5eH9hsMAcc7doNaMxYvmhRoNCt3ihrVRrBcL
 ZrYuxZAk00fiXmhnzy8cwx1yiVA69TXONp+cxTaWnHb9p67py/Vy/tv7DSX5hAWys/16qpWGlgJ
 bqt5fZZx1IyuPH4GgeuZNa48AUL9ykeFhDGMBXo3ako1NRRNA6wsg44zPHqndnKKT+xkmGB0sxj
 CHQ2QikQ5v2JFf1O04Hkvx8i/BtXvIwrA34cmiAeNzVL7f+SmdSEifc+kiv/CWX3tWH64hEvGtm
 2M/yOZlzARFIGnziC93NinPrA0m9DoaNWou3R6c6ZGPan0gOncQeoG13MQDicFi+vRWe5jUapO4
 BnKct2wwFrfxmFueDFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100135

Qualcomm MSM8974 incorporates a special version of the ChipIdea
controller, HSIC. Enabling it requires some quirks, which were not
present in the kernel tree up to now. Wire up the controller on MSM8974
and enable it on APQ8074 Dragonboard.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (10):
      dt-bindings: pinctrl: qcom,tlmm-common: allow functions on the HSIC pins
      dt-bindings: usb: ci-hdrc-usb2: allow the HSIC PHY as the ULPI child
      phy: qcom-usb-hsic: do not run the sleep calibration clock
      phy: qcom-usb-hsic: engage HSIC mode from phy_calibrate()
      usb: chipidea: msm: support the HSIC asynchronous wakeup interrupt
      usb: chipidea: msm: keep the glue device runtime-active
      usb: chipidea: msm: do not force the TX FIFO idle on HSIC instances
      usb: chipidea: host: calibrate the PHY after starting the host
      ARM: dts: qcom: msm8974: add the HSIC USB controller
      ARM: dts: qcom: apq8074-dragonboard: enable the HSIC host

 .../bindings/pinctrl/qcom,msm8974-pinctrl.yaml     |  1 +
 .../bindings/pinctrl/qcom,tlmm-common.yaml         |  2 +-
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      |  4 +-
 .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 27 ++++++++
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           | 71 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-usb-hsic.c           | 50 ++++++++-------
 drivers/usb/chipidea/ci_hdrc_msm.c                 | 28 ++++++++-
 drivers/usb/chipidea/host.c                        |  4 ++
 8 files changed, 161 insertions(+), 26 deletions(-)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260810-msm8974-usb-hsic-561bc9dfd757
prerequisite-change-id: 20260810-msm8974-usb3-8591395891b9:v1
prerequisite-patch-id: c26539fbb2d694a92439cb1e726212918553475c
prerequisite-patch-id: 4ad3db6c6ac190b38705ed8876802392c8d7d339
prerequisite-patch-id: 3478affb2dfff9e7ab10d3021889e8b18457533f
prerequisite-patch-id: b646868cd0435307c98f9f5befcc6b19f21ec0d7
prerequisite-patch-id: b98cf68875fdf3b81fdc383e1b69a3fcc35bf986
prerequisite-patch-id: 4af06591492ba21e53d415f18de59488bfc3c2d4
prerequisite-patch-id: 5177cabe40273cd97110295567ff2cccbaad02df
prerequisite-patch-id: 1d2ed9fb3f5d99c6ea828eb5aec1412f4b46467a
prerequisite-patch-id: 246d719fc20ff640d41bd295fb97061dfa979250
prerequisite-patch-id: 21c3534b93d76f2902f08fff2e5d922402c0b8a3
prerequisite-patch-id: 8e31a3323407f373d791f26edccb7a0aa6c51628
prerequisite-patch-id: b50af8d10a33e4383d7d4baf76d710a91d0d6c6e
prerequisite-patch-id: aa0ddfa89a9b0d7f11fc835846a5566df50f94f5
prerequisite-patch-id: 109ff819c0c46ed02dac52641e7b9f4b254d09ed
prerequisite-patch-id: a3059aa8be37e0b32e0eadbb964b0aff6547e563
prerequisite-patch-id: bc77eb17f857d18e1076597a662951a10ada9535
prerequisite-patch-id: 19f3ffb7fd87e270623c8a605a9250b3f886553a
prerequisite-patch-id: fd5725234a661c4284ec4804bf3da6479452c5c2
prerequisite-patch-id: 80439f9121f3cb7d269caa0d2f117f30599611a7
prerequisite-change-id: 20260810-msm8974-onboard-usb-98d293645270:v1
prerequisite-patch-id: c26539fbb2d694a92439cb1e726212918553475c
prerequisite-patch-id: 4ad3db6c6ac190b38705ed8876802392c8d7d339
prerequisite-patch-id: 3478affb2dfff9e7ab10d3021889e8b18457533f
prerequisite-patch-id: b646868cd0435307c98f9f5befcc6b19f21ec0d7
prerequisite-patch-id: b98cf68875fdf3b81fdc383e1b69a3fcc35bf986
prerequisite-patch-id: 4af06591492ba21e53d415f18de59488bfc3c2d4
prerequisite-patch-id: 5177cabe40273cd97110295567ff2cccbaad02df
prerequisite-patch-id: 1d2ed9fb3f5d99c6ea828eb5aec1412f4b46467a

Best regards,
--  
With best wishes
Dmitry

