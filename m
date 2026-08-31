Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D6E3BBA1A
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170346; cv=none; b=lApnhiRS8vEsE9I4T/YqtjAodfBeAPhVGYmOv0Jc0yywluPl+ON4WwjP8MnZHe4L3oOhSCUHwTjhPJViASFBFcEET9wH8okglh5sSVls9rBQHewB7Ej32nqdJlhqsWrejOdgjAh9zO2V5F3S4e4hIjG6EeicGQbmBJtMpucFUR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170346; c=relaxed/simple;
	bh=zxbNsA4ixvnoIq8gdfGw1qF9RnFiHaI02uozzPJZzNc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DwrVxkFSqR2YDz09iN5P/Q8tI9cw/kYq4VQAtCVcOnlRUcALmEEEt4gFZRUhRmN0gnba9qR9NY9V/pzMptgdK8jyF3t3M7gWhrV+XhTZcrEBFY01VopnhGWpoVpIN9u/lz4kYOComHYfitIkcBp9rz/CGjjuF8+/N1Eos17mw+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOl6XpaB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enlUN0M4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOl6XpaB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="enlUN0M4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xBqh3664487
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LOhQWQWyGpPpdNc7PYV6/e
	4l4E+Y3Zq6RxhYu2EtDvY=; b=LOl6XpaBKyc/EvPruh+Byx/P0QMmJvmIqZN3Pb
	ZCqfqbtI3+VIT8nFpQKshQfRI954qjdrHUjNep86Lo2ofekkiGUquuetrgVPkdq5
	aUZW2ylr3kfpzYvubAZo1cjeXw1fkbfN+MYpbjc+VqnxT1OwFvP2tVJlaHRDZWDg
	jHaYyb0Ed6d6sqTosF22ZGwanrxc9MSGWTfEw+EZbfgRRA3we0jnzEpo4ypFRLnf
	H1VQdIknSyjf51zI4lehIdhx69QcE0rRoSFsaHjF6e4PcJQVRwPZDF2c6JCVb81M
	w81h3T46Ymrrbg7jMJAxZmsz5Vtubxq2PUZFjRdeMvx+hluw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4x08r2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:59:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938153538caso587588885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 02:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170342; x=1788775142; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LOhQWQWyGpPpdNc7PYV6/e4l4E+Y3Zq6RxhYu2EtDvY=;
        b=enlUN0M4FdRN91BvAxE5wJcl6D9PnOiyXqeVxEXqgisTgC/dHh9iwMEU13U0hSX/w6
         DbV9v7DDqg7FfXHI6HBzmNSwG9ZPN+Q/PJqH3by/ggbVfhjQ0cG6NaxPKSL5QLtWJu6v
         GmudJxTPJaOFuUFYnXmmO+48HHQvlkHjHVUyKBXLupjI9EQN9bpDlaC8nbJ9GirYDqnc
         Tk/dmK9Lv+DC23EzeBqMR7Ra2nWjeHk8nSZzMLHDn9gbeaEovcxhqRTwcEaunMS4LSu3
         f6dPZ++C5dPgqK4O3jMK3XV+n7SXCAcufutH+yc3nHgvc5TwkGqkwQt3jxgmK6v4bFBz
         y+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170342; x=1788775142;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LOhQWQWyGpPpdNc7PYV6/e4l4E+Y3Zq6RxhYu2EtDvY=;
        b=KP5YnHldXmmCQ1w+kG4LBJXR6XMOhTfy1ctbqujYcsBaBPKZhsFWOAz8gII//no0a/
         QVywUF+XY+hk6XKvmxXW4K+UOc3mU4+o1v81GpmPReGyLhBkW8fE9T9+yR0lRd77BetD
         gveHyFnCDouyU3BXExYYGKBcK6+CgEfL7aOcHpHRa2zNYMsDOwCNk+lgK3Gf9MF5Ba9z
         DUOLUF15iAKZNjt1E3SiQKw7EgmEGyITipIlUAc4E9BMnHq28AK/aM4lrX3PG4eIr0yc
         OlVFrZflFHIDNJMVYRRcFq2RRkVYFbJmB9e/eR1Cn/GfL/DSToeA6E2aGLomPSBRpAdt
         t8sg==
X-Gm-Message-State: AFuF++mabXoh5Q6dp0gcJCf6QdKL0ZYApo8/G5mae4a+zEmM/Yft4YDx
	cvVSlhMnjPgdWlzy4j8/pTz+CxxSuuM4VzZcABxucfVB2XAxvJKyP2brntxOEX1TBNZysf12MWR
	N70s3IA9PLvVrSUTdcbZg2OgRBnGHqsd+zPScXifS8w4LjRsBdjbdm9RLy5NxqCKDWZPR
X-Gm-Gg: AR+sD11i1pyk2RoS0PF8u8EKrRPl4wFAIg+D8Z0zOKMbL34ed00C2t34RQMzRpaq9Kn
	LZ7BWMvmPcpPYRsCxe4FyVI24H995jqrtF+JBxzFc0ilWcIV2921JQI1L6MxtCxzCuQmlgs3QGJ
	z7MwbRCMuu4n/JrPSkZppAU6gJHcCaKKkKFCopQWV78F+15p/hlSXhi2jYT8APmtdWf8kvGNLRu
	oSc2sZzYFuLMoPB1QYUtCYGife1Nknahci+l9wYylVyr7EJJcco4v4rbBpQkypEkOSz+kz2Cli7
	fIIr38Gcvd/0TcU/8HoFYgkD6u+7RxmR146g3/mrWcdqWcE185LyrDN3kSPg6I35b/wjSyazlYG
	ZEl+WXw==
X-Received: by 2002:a05:620a:2908:b0:934:81ae:6d1b with SMTP id af79cd13be357-93913903c4dmr2592420885a.22.1788170342323;
        Mon, 31 Aug 2026 02:59:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2908:b0:934:81ae:6d1b with SMTP id af79cd13be357-93913903c4dmr2592415485a.22.1788170341708;
        Mon, 31 Aug 2026 02:59:01 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9281772bsm131001555e9.1.2026.08.31.02.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:58:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/9] arm64: dts: qcom: hamoa: Mark the EC reset gpio as
 reserved on all boards
Date: Mon, 31 Aug 2026 12:54:40 +0300
Message-Id: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGBPlWoC/yXNyw6CMBSE4VchZ+1JSr1gfBXjopcpHBMotpWYE
 N7dirv5Nv+slJEEmW7NSgmLZIlTRXtoyA1m6sHiq0krfVHXY8u+ZH65OPJgxmg4oQYWMNw+C/e
 zRFY2nLtgvT6ho5qaE4J89pv74+/8tk+48mvTtn0BLUn2rYgAAAA=
X-Change-ID: 20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-0bf57fbd24e7
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zxbNsA4ixvnoIq8gdfGw1qF9RnFiHaI02uozzPJZzNc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlU//SvIpvwZYlAEAe3zmMbD9dpithHV4pbwM3
 o0Eu8YAIJWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVP/wAKCRAbX0TJAJUV
 VmuXD/9GQifgrKhBHsCDkm5q6v7kotFyAWCX8byc6fdDD7FiBVThEux81KpvdEchJBYsUoszM0X
 gXEojW2CqEjFvPwRWmuaXP6cQZvqXACG3FvyvySQOo2Hj6TLQDKbpJCDr5WhSsy14b0kd8olG26
 wtaxy9ozD+f+cnpXo+leoGzXO8mPVGMdVyn1BkvaPenIgX021fNsUD7jzdOX5cHh4qz6JcSzOPw
 GhqkTdWdjmR+CMBEnuojG03Ivf8bG3nPA7v2q4YZPsIk9Cx+/gkPbgKZUZQlVyRI49hLQMs3vNn
 OIXKaXloxz6FIS9czUp8dNoVopj9xriguqdxAVXDj/sKQPomxEtttlc+pVsoNRVlW7p2mZPh/9O
 GPRtncyn1+8xRYCBw8gH2mFp0NjKFtoxW2qdiTqvDhXMBIMDslGUX56xMaslwk939wntaFD2bjr
 qWzLMDF/R9d6vCT0agm0+ZAyjK3PRpvWQVrZ7w0U94ETQ2bbg9OfR7AS6YVsFnIKesIx7lHZd0k
 iHmWiPtehZgYSirdRV+1PwWGvrneQpEpQblejYbth4zF9RIFvRarIAuGKAJ5NqfzsBePHx/+r+a
 IeYk3I1p9UpaabtJPcjZfJdLep3KafJR7NV2R+atErC5xZqsTSHmuuZll8BPal8iJdkbx9Nen6Y
 pDdQqm4iNAQwL9g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NSBTYWx0ZWRfX01LgVXjgS/nT
 aITmJpugzFxJkpDK4Rf4HHoG1r/EjbrQ/8c6SGxbREnWKgt8CB6uVGk1eub0wTya/0YVCgNHrn4
 +yKga1abXOxrbcGm4cACu+mNxUUbsEw=
X-Proofpoint-ORIG-GUID: 9h3UrTyU_we5YNOd3cywh1M4ZF1ZFzPl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NSBTYWx0ZWRfX+g+PCvpR/Hmw
 HrHsCgApgiNZH9nHT3DxBF1FyRR9qD7XFRwWjgPrPcxHPs7TCBd9JSJtF/PFssM1acLwDvYOp3U
 csOzSOm8QWGZzG5Pg+w3Bf2ulJNc74kxBRbrW3wlyooi39eWRmJjFjx0e5TSkodjqYqU92lRusm
 Qk+UBx9M8NbWHzLVy6YG7hAJOg3LJmlFL6dLDqNphQ6Bb/koEvM2VR7rH6o0G3zCzg2W7d591Ps
 1DXYLLLJ0/iiHBoBbR+tfdNCEOCT3J3nLBlji2inH8sjlxgwUykQS/D7Bq8NITXpq/ivdUDM1r7
 CL0F/HReRbqXBjJUrRVuuMiekpetiKGVLusIkGs3L69g9d3wQGzEgfO7dwCXpHvHFJ2rfF4T7Nu
 wVzCT55HVZnYB7Qs/uXcv3mOCyI4yPTZUsAyOoehOvrQMo/F9iPbNgMjHBvh+w4ynkYhgGvicY6
 LXFvlSb891DuHDGce7Q==
X-Authority-Analysis: v=2.4 cv=Iqsutr/g c=1 sm=1 tr=0 ts=6a955067 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=kO-tEaKixL4BwDf6IbYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 9h3UrTyU_we5YNOd3cywh1M4ZF1ZFzPl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310085

GPIO 65 from TLMM is used by the embedded controller as its reset line on
these boards. Reserve it to prevent Linux from requesting or reconfiguring it.

I was only able to confirm that this GPIO is actually connected to the
EC reset on the CRD, QCP, xps13 and t14s. But it seems like it is
recurring them shared between all Hamoa based devices, so I reserved it
on all.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (9):
      arm64: dts: qcom: x1-crd: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e001de-devkit: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e78100-t14s: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the EC reset gpio as reserved
      arm64: dts: qcom: honor-magicbook-art-14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the EC reset gpio as reserved
      arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the EC reset gpio as reserved
      arm64: dts: qcom: microsoft-romulus: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-qcp: Mark the EC reset gpio as reserved

 arch/arm64/boot/dts/qcom/x1-crd.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                 | 3 ++-
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi  | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts        | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts | 3 ++-
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts     | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts  | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi     | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                    | 1 +
 9 files changed, 11 insertions(+), 2 deletions(-)
---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-0bf57fbd24e7

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

