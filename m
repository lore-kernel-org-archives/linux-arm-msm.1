Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDE3362154
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 03:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792209148; cv=none; b=RhSumrwEJdPqF5+qIvkZgp/Peih/w7erWcl89h2W2See5FR9OUp4QuY5Z/Z+N4hEUb208aptTbrcRHRxeuZThD19ry/++Y6C+2SmHU6n4ike8KbsV4mTuXEA2lz6teGSJ64O4rdeiTddC6eJrVK1K5wUplc7Q13BodDX4D5Nk+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792209148; c=relaxed/simple;
	bh=sO1KrEv86EVrexKpLzli8BENnpzHRBMlT5dgGwO99zM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KJtbNriuktaCMFRuORCyls9jNoR2cSP0g8N1Mzs0s7+22/1B71prXAspOWHFE5ejOQoKHAheeqULwl6kyjiFtRtAhH71bboQovNJomJkg7zvBulw1+4QFHVhH1TDBMl2DzNp/5HXaavWYhjWPL82tHagvoA/zKncJMR0RBTIm9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ojNTjD1l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NisK2WHl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ojNTjD1l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NisK2WHl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H3jrtB3163493
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 03:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ouMhjJ2W5x2xNX05HwynhCEBAhDpgm0AIux
	Z8xIIUp8=; b=ojNTjD1lWAhwpNYmTK3sIScjHNZQ+nvdvpJ4lUy78oG5qzz47Xa
	Vfxb1oaxZX28Yk/Kw8IEeN/e3cg4OCweUYV+HpDhB1jLq8gN9LfifFjheC8uP+RR
	FJFDwOmNMdGXhyT22dvjXP8g9OrGHFsyeiH2lxBYs1vM+waYgt8Nl35Gsk9m2MMW
	CYAPckIeuav+j29fgFY0LY9ra3J6CnbuUS+5H5Qv8zL0v5UJMOxT/cArl0WpQrR5
	ED/aV3gjlc0skQ3rBZHqArsBLl9rCgThcbbUWblaizP3wyyktQtJ7YmZxbmD+EDq
	0lrx2bNOsvYg45QisMMyoomXvpsQv2u0apw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7r0d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 03:52:25 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso1126284c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 20:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792209144; x=1792813944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ouMhjJ2W5x2xNX05HwynhCEBAhDpgm0AIuxZ8xIIUp8=;
        b=NisK2WHl1W5axzkvlMEyCfIq+P81D+O93lR6myKTNectMTdxoplsA7QJGQVY7A4WA9
         6cic19y3iB9OLClHl5R8eO8uaDH57c7xDZK4lkrsV8QArW3V5ttYbKRNOQ1y9IHRBnfp
         u53a+cqlyzGEeeFGcUea5qBcgI82vX24LIKvR465K/8lePKnChyX+7ZOFZ6LFWpB3OQA
         +Ayg1urDcTDXoCaeNIeXY7xbVO9GA9jEf+24CdGnZjVggE4GtgmgdSEQNRwBK80i9H6L
         t9tDgFFyjWrDeaNEb6fMUB9QUOe6RA1BIr+JItanB1GeAshqQQlfVE9SfwxBQx0Q32sm
         rbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792209144; x=1792813944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ouMhjJ2W5x2xNX05HwynhCEBAhDpgm0AIuxZ8xIIUp8=;
        b=eoCeuMCPOAZ+imbaIC2evSEvak/75d3yBcuBRkRgNEyDRw9wKZdGkZdH2dghRHtuHL
         bNGuDx2iNrsLKTk3DQPkIhJKZHATHdVmBo4kXFoyseE+vy009+fSlmeipP2sGCiaIUv/
         cDY5jD3VfwHAq1MF4gbm4l93GfSuHk/pyye3Ct1UzNq5YVk1QCBy4GkzuA7J2Wohu2PY
         V7mjDomiYFl6zoDgJd/aKEQ1kO6heOYHhj6TvKA/E17/wg6WsNj6p67YPuept2JNHTiW
         Z/Kj/8iPvaqqNZNznqeshQZ2egw+KG2SyQlpTmvpzTFvnO+ou7QFnHJRXF9ThFkXeZ1N
         mWeQ==
X-Gm-Message-State: AFq9FYJwwLzSihRfDNIsQRdQ/6W7+zMTRtkrN451of2BchDST0B+hobw
	aFFxh21hJVqO4nQeeQMfh/L2j3N91bOA354YXNioL80VIg/ZWKNTcPFC1HUZGR/sBmYtO7dvf+I
	XKH9fb4a5mMrRIjEu2NEpiqkfPJHWhSQ5JCfjaP53PRgJ9iTeBPW3x/rWg8iDMyt+40Iy
X-Gm-Gg: AYBFou16mdek5o/dOGZq8LQUfeU6wl7m164ebLG3zO5dPfNjG9xlFXNpzykSz0hKs83
	vAlS0+x36VbFVkU+bvX5NauSCeE971ONll19o7mzHjSILzFPOAo/FJqYpAHj4MUtN4N6gVQpwzd
	fmfiCjndHmirpv3Rf5cVJPX8qpwTdrfIUMS8egrmx0Kt8SJHRcL4lboUBi/2PYsEZgK2ZtLfEpQ
	7bcQTtw2fwCxDEy3ECsZviK5KIZMe4kxFIJMlAUdKxJQZW7zUOPvdygvI2afdMOTOo/mhftvNzZ
	rEQEHSG4QQ/DDaO66RvUcvMkuU6LxoKE6N2zNMw5wW3BepbfSaIzik0JV4ZIHjAE6I02z/h/gv7
	9DL6yvbszr8fschK+ZatcPgOoi3/2tTQOye+uXLUSBCfZGMDQt7WyKw==
X-Received: by 2002:a05:7023:a4b:20b0:151:6e80:ba7e with SMTP id a92af1059eb24-1850ce9f56fmr2609842c88.4.1792209144022;
        Fri, 16 Oct 2026 20:52:24 -0700 (PDT)
X-Received: by 2002:a05:7023:a4b:20b0:151:6e80:ba7e with SMTP id a92af1059eb24-1850ce9f56fmr2609810c88.4.1792209143415;
        Fri, 16 Oct 2026 20:52:23 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75ac0fsm9723006c88.15.2026.10.16.20.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:52:22 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: david@ixit.cz, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com
Subject: [PATCH 0/2] media: qcom: camss: track PHY type and scale link frequency for C-PHY
Date: Fri, 16 Oct 2026 20:52:19 -0700
Message-Id: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNSBTYWx0ZWRfX0TjRMsf3F9sR
 jvfNgoPTaCx27JMhHa8ZCCva2PxlYMJar63IlOLdzIUqdp0MhXPBlEp55XtJilDpWaR7bdF+b9Y
 HvQeURSdE9SuDjQ1lFgcBR0uv1mt5cc=
X-Proofpoint-ORIG-GUID: yjheMmpf1P5PHbOaA2xBUyy1Mlkfd2RA
X-Proofpoint-GUID: yjheMmpf1P5PHbOaA2xBUyy1Mlkfd2RA
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad2f0f9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FUmL66orSvod6niQ26UA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNSBTYWx0ZWRfX+22i+ajFb388
 Grgyj+clgqfFr+PU764xvE+ZSEO8cXetiaouvVkq1LwCYEHOU8vhAIjOc4sz9hgzRoHayms+0gB
 fTjTn1+a+lsj5Lc8vBB5PyDyD53qODMO9LosXOzat9tW6+JHtzwhIRcgYZ/JnmWKDXE/azkNDoH
 ADWP41GiRbjbnI0MLkA6Ixr6cDBTWtkZpVu0ceDvMci2oNK+3GwJfI1Ol6E2oJKkpG7Xn7KBBvc
 iY+0zHMgNqtpFuY283uMTgG3t4MSwrGwEwxG7FIgURcLu4qgKphypnFa2E8pb6nCu46jRhvyqAl
 FM5vUw1B4Kj9fFr30AdNZ9mKW3LWsqwIQkBvtUN8EI+pIHdYzvoC9UFrGoRkhEkgeX0RxSg2POv
 QbmYveysx627U41GffBUKe4TunIewgO9fM0p08XUgH3Kmkfr0l2uQHfXB0EFCvZHRGFn4F65EdB
 VdVm5I2VxcNI1k8DT6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170015

This series lays the CAMSS-side groundwork for MIPI C-PHY sensors.

Patch 1 records whether a CSIPHY endpoint is D-PHY or C-PHY from its
device-tree bus-type property (instead of rejecting anything that
isn't D-PHY), storing it in struct csiphy_lanes_cfg.

Patch 2 threads that PHY type through to link-frequency calculation:
camss_get_link_freq() gains a cphy parameter and scales its per-lane
divisor to match C-PHY's 16-bits-per-7-symbols encoding (vs. D-PHY's
1 bit/symbol), and the CSID gen3 RX front-end's CSI2_RX_CFG0 register
is programmed with the matching PHY_TYPE_SEL bit so C-PHY streams are
actually decoded as C-PHY instead of silently defaulting to D-PHY.

Referenced using David's C-PHY support(v9)
Link: https://lore.kernel.org/all/20260617-qcom-cphy-v9-0-83da8a8e4e44@ixit.cz/
Depends-on: https://lore.kernel.org/all/20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com/
Depends-on: https://lore.kernel.org/all/20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com/

David Heidelberg (2):
  media: qcom: camss: csiphy: record PHY type from device-tree bus-type
  media: qcom: camss: account for C-PHY when calculating link frequency
  
Anusha Arun Nandi (2):
  media: qcom: camss: csiphy: record PHY type from device-tree bus-type
  media: qcom: camss: account for C-PHY when calculating link frequency

 .../platform/qcom/camss/camss-csid-gen3.c     |  2 ++
 .../media/platform/qcom/camss/camss-csid.c    |  4 ++-
 .../media/platform/qcom/camss/camss-csid.h    |  1 +
 .../media/platform/qcom/camss/camss-csiphy.c  |  8 +++---
 .../media/platform/qcom/camss/camss-csiphy.h  |  2 ++
 drivers/media/platform/qcom/camss/camss.c     | 25 +++++++++++++++----
 drivers/media/platform/qcom/camss/camss.h     |  2 +-
 7 files changed, 34 insertions(+), 10 deletions(-)


Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
2.34.1

