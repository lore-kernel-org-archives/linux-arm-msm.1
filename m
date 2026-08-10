Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24E43C1D6E
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362162; cv=none; b=Wqn0JGy9q0E8D1wdUfy9irrScv3eXs39J0woVgyku2kpL7irMVjb234GtLU8FoE5jpIEc+ItJoMnxcJTb1Mmf8ksHLwf4KW/adsJQnZxCBLYcx02knXpwqTSChF3NHIkLqp8JO24J1aRJmi3gC2py6fjEjIUCh3wfF32U5NXwvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362162; c=relaxed/simple;
	bh=AVCqVf9cUb6onN8q/nZVHhyRhrReTtaAp8rhIRv2URY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=akWzWAM43BFWM4rAxThcigF30IKYhtu7bJ72HkTIUEaf4hT2h/5+DGTzEwJiNxDAV/hrz/eSAAPmFW2CiWdbBSE8e5sjrhiR8PYPWcHcgwgXFJIYRHky77HRZeQguogh5lGtAeYA2petEyoK6ZmMP3UjMNoiThJKGXZcCgq7Ii4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVIAb8KJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KXLOCihX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVIAb8KJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KXLOCihX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9S1Jd1189337
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kM7XsYvsbTlHzN5NeePXFj
	cCpwDy8mm+ntXcnUV6Y54=; b=WVIAb8KJTo6GT1JYwfmIOpXSqjxbHCSGvoepCv
	nBYcOA8NjZ6eUPKjZQVhTnw0vctuHMOuiducaYis0llD4JzgtbFsGsPRZRSd4Bqw
	LmzQVI2kTO4wuNiwt+W37yGJR4X8MO7Q69zOltSAsmQk3OpBJSpicnFpRlCw6VWS
	L5BFBygGx7iHccf6NS2vpQmYTvkuhcfqWQZuc8ZqjzVfT0AP9vv2PeTbl/PRnSlf
	gREO5gAG+F0BCGTMSmxHJXu7uZ4E6sYxfgho89p9COF6BTn26JgtK0oBKJx9C4qE
	sC+Uin6uKMBQzwHKAiNonRXLr60phm7xLmfCY2SDfYznsjaA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v29ckn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8efad04d884so31718086d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 04:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362156; x=1786966956; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kM7XsYvsbTlHzN5NeePXFjcCpwDy8mm+ntXcnUV6Y54=;
        b=KXLOCihXjf9UEQQju/I2hopsAu9rCVyLCvfuLEf2Y2Bb+jA1O/DAPOlutMU/COrDl3
         m5Yb28XUUp9sItBFcQeGiLNvceZcgKWTESvi3ywzo6uo+DkrWTQHFGRNDub7Q0mWyAL+
         n5abV9HTGcn6/unAJjkELQhHon0dUC75U03FE5zCzlo6FXPE5Pj3kVm4hTH1vwsYNkcA
         b2KN4zRbhqBphVdRuNxc4FOKJo+ciCyhieeWImdMAZ5tgZdjVXGeIejK52wYyLusfLLE
         P6AIpASkHIpc377qEFuJpT4a/TDDrLc1xa3KlV4n9OhUPB9wbo7K0TFNY/jsBrwldaWp
         eIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362156; x=1786966956;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kM7XsYvsbTlHzN5NeePXFjcCpwDy8mm+ntXcnUV6Y54=;
        b=iy+qPxvpDAGdRlJyfXwig6DdCm5xs3JC4peNfazCheMg0rFF8M5gNEBfr3VMoTlf3r
         /78T9CroKPOkD+oKsoKYghGQZGYVNFzPWohPy/bOqXPtk6t+MPhGD8O162Zep6kE3N0I
         zUgEBP5dJYe6cdsilwGSp3rTmMvLFO0e8BgXHMJ71rPxQW57ZXh//sPDyvQEvFCqkIEw
         Tn7tM8aNGzDEOFWrvTOv22joL3ZYVm3NG3kKj4mJDW9qmbFcmH8hnISbag6jF6RoKqXc
         bVi9toyoE0jiU39PDSmHHrB+4gGvqS0SUYFLRd71UgFhZJqCeoq0eujVwVg+QYs6wMBf
         GuFw==
X-Gm-Message-State: AOJu0YxysZhjU4yf5QZ2GGVkm5kJcixRu6+u1qNUQtf6bXKLwvnqHIVB
	216LrYY419z18Jdbw3FvS33sJdjOxPjIrfusZFQjTNA0GwiZA3P+1V/JEHRjb3Rbnt7dnUiQgkl
	ocjq/FtkmrKsbQ2bzC0WJzm7A4/OFpXk7cFJdOAZdzClEPjegUnjHTpQhjhvOq3qCqdpa
X-Gm-Gg: AR+sD10s+zTjdPH8bVr/SdxdkEium/t2uPcuM9DZ16i9l6yTyK76AVrhlMD16R7ksrv
	V86L44dRJx4SiMW+Z8/uI+1j2ZA745socjPLJBdcViF6fqj5wEsdT3/9i8cW4hRVbumN/fnb+8u
	RFewix4h9xtNCyeBIVSrH55pXiIvyqMSJsoxxApNPpA6SDq9mqplnupY+wp9mlAINIUgn2JiVZ/
	cRFHNo/Q0himnUkCE8dIidkKxxX8SPiUx3dTkBTH2ODSLvLMr3eFtQDSB3oa5fqTZVFAsfcMUa5
	yfwBf4Q46Wqqr6ER8074rIlt2s1xdAg+MHXy3EA4coAOJvj/ZZ9JdRcCztd2jFGBXPMNRO4Ye55
	o++UCaofdT5nDwc9i+zW+DxXv8YeXFxcKXxLjH6AJS42F8xIkG3PPC9YsT4kkqpt7ajmZnNhi1p
	t+bOumt+dLuPnDXw==
X-Received: by 2002:a05:622a:2595:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52d0b00401emr342790691cf.5.1786362156084;
        Mon, 10 Aug 2026 04:42:36 -0700 (PDT)
X-Received: by 2002:a05:622a:2595:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52d0b00401emr342790291cf.5.1786362155717;
        Mon, 10 Aug 2026 04:42:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/10] ARM: qcom: enable USB3 (DWC3) controller on MSM8974
 platform
Date: Mon, 10 Aug 2026 14:42:30 +0300
Message-Id: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACa5eWoC/2WNTQ7CIBgFr0JYSwT6B1zFdAHtp2ICKNCmSdO7S
 62JC5eTvDez4gTRQsIKrTjCbJMNvgA7ITzctb8BsWNhzClvqWCUuOSE7GoyJVMR0UhWyUZIZiQ
 ul2eEq10+ukt/cJrMA4a8O76LCK+pdPIx+2UU+osEb4KO4x4jUoxcVm3d8I6qme0yoxOQIThns
 0Ielnx2OmWIuN+2NyRV00HaAAAA
X-Change-ID: 20260810-msm8974-usb3-8591395891b9
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2235;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AVCqVf9cUb6onN8q/nZVHhyRhrReTtaAp8rhIRv2URY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1blTg0hyZevNVjmZTFv2vxQmp3Zh6GrXizzIv8Glk2x1
 6R1TX91MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAizzLY/7v/ujk1tt1CK93s
 +g2B+cLs9WeTvAo7Tz9qjFzimj1BWNJ4lfhNaXUmvzuznm9S+ZLbz76wxu+GZ52TkBXf23we5kC
 Hi2++BHw4+9fnT6D9QqUGszt3pzRviDpn+GKCnG3DFZPAIEPhI4aKfMFvMnaLnC6odXj45cfG3X
 6Mjw9Ki/mw3O05JixR7bE6y8a9ziGneLnhe+P0Jw8FF25QULr0VIaB8f4Vz89c7h9YMm9PbOH/u
 StSh2Wpe/m8p15aXXIPGK+WrzWIKaifve6uycfDeuW3uR//Oux0OcxkQ6jcym03fM1rKpf8eRg0
 I7Pjn2CMEuvOuadU366LX/dFsDNrQU/F26LsjsUSLDMCAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=S9PpBosP c=1 sm=1 tr=0 ts=6a79b92e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=iQ4cL05PARBYzk5mw1IA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: wJ4WvRnJ_LZKO1sfjKAATJuO7Cx5h6OY
X-Proofpoint-GUID: wJ4WvRnJ_LZKO1sfjKAATJuO7Cx5h6OY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX2Jh2Jl9RutGw
 rPm4pkJfGDBQtLocV/GKO9EXplJg4BQxtXbcOGPlQE79O6Prw8pNw3wHFoX/4Hf8rS4qInXq4db
 dPlLGzt2OK3xgNKZ+VY2Fa7hGe3HxnkrHxzc4Swuqau9FXWglnYQ7NjkkiWgn1oiIJWYgGw6r95
 qAMxZCKYNYTYHXE1p31vST2ksAwnd+6y6dAAAFDWj6L1mLJ5oxfwDiDBNStNvnNYg7beqrc+tLo
 UZ4VcJvgvq8WMpz0QqI7VpVhGsceV8HN516XxA8IYlM0530ORVyn3EKeCrZxVWI4sZIN1KdciMe
 Srzp7uyzZaBtfKdye5rw8UlEyOtPmDJ+oFNaRzb/Kcsi5vjcxpFomuaMvXy90xk/M7CBra/Esbm
 uyY0FXpkC/IYSlMhIw+oOQKAzn/qQ5tLtp/n/j2Sgo/LwrkR1kVYzBsnt8VVu9JhAZzSKX0MLf9
 1ncFXoAAP2ncor8ajCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX+8+bHsh7DLIX
 qwTFaI07as2x7lsPDmA5piaq7PgrkVSLM6m0bO2n3r2mZnVZ4LF3v0E1ddFRBKOGXl2mt0ahI39
 rG6EuehUkKZwnVzxVO4kPYZFBW6Uh/E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102

MSM8974 platform uses three different USB hosts: SS DWC3 and two HS
ChipIdea (normal and HSIC). Enhance qcom-ipq806x-usb driver to support
HS and SS PHYs used for the DWC3 controller and enable USB 3.0 host on
the MSM8974 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (10):
      dt-bindings: usb: qcom,snps-dwc3: document the MSM8974 controller
      dt-bindings: phy: qcom,ipq806x-usb-phy-hs: document the MSM8974 HS PHY
      dt-bindings: phy: qcom,ipq806x-usb-phy-ss: add MSM8974 SS PHY
      phy: qcom-ipq806x-usb: add MSM8974 HS PHY support
      phy: qcom-ipq806x-usb: fix the SS PHY TEST_POWERDOWN bit
      phy: qcom-ipq806x-usb: fix the PHY_PARAM_CTRL1 field masks
      phy: qcom-ipq806x-usb: parse the tx-deamp-3_5db property as documented
      phy: qcom-ipq806x-usb: support the MSM8974 SS PHY parameters
      ARM: dts: qcom: msm8974: add the USB3 controller and its PHYs
      ARM: dts: qcom: apq8074-dragonboard: enable the USB3 host

 .../bindings/phy/qcom,ipq806x-usb-phy-hs.yaml      |   6 +-
 .../bindings/phy/qcom,ipq806x-usb-phy-ss.yaml      |   4 +-
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |  19 ++++
 .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts |  61 ++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  47 +++++++++
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c        | 107 +++++++++++++++++----
 6 files changed, 221 insertions(+), 23 deletions(-)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260810-msm8974-usb3-8591395891b9
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

