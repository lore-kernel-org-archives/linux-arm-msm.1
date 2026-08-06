Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E4B437852
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 10:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011242; cv=none; b=VM6/kMNQAUkqY4qHzr+/21Unp4bGVQ7PTwASwve1Ggo82550V3hFYvaCVtB7CWUEuDEL6kgXZCOQ2S1/EEiuLzvUkFXXUcKXk0gQT6jt+llwRMzXr0oIP+pIPeGl5xkHIIcbYLGs+GgwlTGmHvKLtF+u/s93p/FzcnrhSdz59nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011242; c=relaxed/simple;
	bh=JNWrtYLxwk7gmvfMBwtTQOHeTRpiGtmAjO+J3SwZF+0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QMxNaJONq+TRl2JQ4Fss5wFvC2MlBWpOQ4WDnlVCJP4X9w7yEwyjBKahjs9D0x+zFc0Ri52zEYwrPzEEAnzRRDVEW0FO7UFQkiE+sFH4gXeJRvhMIO5bkOoEDFCZ8hrHW3HEV8UaAT9F4y20riAyBLTdangxw2lvrAAkPkYwenk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGVi6njr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2kCBawG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGVi6njr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2kCBawG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nhIx1871339
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 10:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hLUZ79TEnuLfbfIWErCoO+
	lM16SWLforq3VCstkOojk=; b=TGVi6njr+os3CRM98+SN6YUD5/NnVEwKcQ6DCv
	fmAQUU0NDoqI3NXSSVRE0z72YOIDvZ96q01kCq0MMUUatJL5ln+OGMomcimwLn8j
	Eoss7cHKzliDqi22v9UTi/960w8AH8kQLjH+29roHJWXt5La1F13rTPNEghzlzzS
	cc9tbCfFERRB7mCENmCyUa1vw2XwoMlXGomj8vG/q+Nt5aUK3BKOsDqegT0ENtcz
	iXY/c5oncvOFhsyMe/8MrV1j8rpafrXqkngHCsT37pyxxQhM041cn7YucvGVy/9d
	z6bfLnIIXp1CYVtJwtm0u4SKAgHZL5pI73BNdNkqIBOr6CUg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud1g11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 10:13:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca124bf0189so696659a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 03:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786011239; x=1786616039; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hLUZ79TEnuLfbfIWErCoO+lM16SWLforq3VCstkOojk=;
        b=K2kCBawGEGrUQf0BU8Wf/wKgH/tXlouNm1rW90FUzdOaZDwB+6CoA9BTG2s9RJ0gav
         LqKRIKYs6vl2uyN2dhoZVOBHiqxjHa2KDtOql9QZfOHnZ38BWZ7PFf8lYzUvoGtXB6er
         spPnzA5opAUcCe+qsJJTgV+C35wIs72xVtN+fq7kf9R87IsMI4U4VUkZs/tomMHBVtOr
         4F0NpggtjwRRnTWvqAu/c2W+uZnu507mdRPk1sXQkHmH1xR4b/X/JW9+3M5NHBwVApuE
         rRAA3SoSr4LHJVXGsl4tJ8vLz0aigm3dpKHZ+zBYi6uyGdec+DjgiEpAlaz2BZIMvbfy
         zNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011239; x=1786616039;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hLUZ79TEnuLfbfIWErCoO+lM16SWLforq3VCstkOojk=;
        b=N+RdYr6ivBIU+FsuvY17j7C63fnjInuF41NLlSgSY+NBMhAQjcAavd+s3BH7H/Q0N+
         J2q+hWJrmpzBpkTrPORJwO4hFAVVex704EAZx0x65T/QReWeVeZNF0evEYYZZQ9xetzA
         LivT6MTGXf2eyZMArAXC7RN68SwYJZKj+I1cL4tA31H9JkgHJ+Fb4tAR10COlmmbNJdw
         VzysSqQXS5xJuJvyU2sFYfrymkf/wRSuS/yNqsppPcDvB9kn8mKytRBt2KGvKgneTwUm
         UKRGFjP0mX95x/Z2rxI6AMLWpbPRXBJnPSdiwYda1sXYeVbIUHzrnus+eJSAKpiXEzjI
         d2LA==
X-Forwarded-Encrypted: i=1; AHgh+RrEBfsXHdq8LpjrL/D0WwwpYF6QALKIY8y4Nlq4OoEXtxHZ3e3cqGHNIaMimKIt1r9CIK1GX2j5NyW4KX+4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0cu1Wb/Mz4JOglpKWp7YGjPEwJ7dGh7DahCHa4BFjklATS9Zd
	KJeJP6RXBoW0HM4LMykbLuKMFKT9TnxZFFmcSgUw51WXou/HC3+wVY3Eq0zWMuMjcN0ETGiduqD
	RSg6K7Y15avdi35+XH8I0BicPPELuMYdgGHImkFLJ8J9wVUhxSawBHhyy4PFHuNtsdzAC
X-Gm-Gg: AR+sD11Tkg8ziqPI8OndEAfr8zgV/U1Nf/1fonYPwt3ZeT3y+3UjytFy8ghiq0wEVlb
	5fFWBgmNSpMpBLgncTIz1x/sV8G94SxwKHENIGe9KcjX4MhIa5rRKkhqP43IHNy/tEU9DPF+BQ0
	P5ob8OPGrRbIJWXYhH8fqzDA1TmP0+slsJ63z5N8jIpkEpv5tJX/AnOjuuMPSxwLCDo2bAFZAD7
	1kKFQn5SYtSbiue8mpiysg5C2TmHbbc05vjGkxzrCHTdWJcsM9Fjo0ovfW2TNuQUr7lZvwhV2T6
	wO8wwtK6OoEmGZyG851O5M7BF6M350/fxWyRrZM9VBD5+S2FJV2l8XOQYfttA6Gc0lDiO5aSlv4
	LFrgWD97CXm4xCofz7wXI1QH9Y3HUP2ZKqw==
X-Received: by 2002:a05:6a20:3d05:b0:3c3:d298:81b2 with SMTP id adf61e73a8af0-3cba29c0b7amr3312152637.1.1786011238584;
        Thu, 06 Aug 2026 03:13:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d05:b0:3c3:d298:81b2 with SMTP id adf61e73a8af0-3cba29c0b7amr3312110637.1.1786011238067;
        Thu, 06 Aug 2026 03:13:58 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe707c9970sm2668814a12.6.2026.08.06.03.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:13:57 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH 0/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
Date: Thu, 06 Aug 2026 15:43:43 +0530
Message-Id: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdedGoC/yXNQQ6CMBBA0auQWUsCjYB4FWMmtU7rmNiSzkAkh
 Ltbdfk2/28glJkEztUGmRYWTrGgPVTgHjYGqvleDKYxfTOYsZ6FMEycUBPGpOxXfFlRypg8ysS
 oNgdStE55YV3rzvfGjtQeT0MHJTtl8vz+LS/Xv2W+Pcnp9wP7/gFZp5sAlAAAAA==
X-Change-ID: 20260729-use_gpio_to_notify_master_of_spi_target_activity-5f62a9e14875
To: konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786011233; l=1426;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=JNWrtYLxwk7gmvfMBwtTQOHeTRpiGtmAjO+J3SwZF+0=;
 b=5/Icw4+hByze2/Zn1aU4GKkLQt+fcqbnGKaJSgLRAXl+4M+8NXPQ1HPjEOv4c9KWHH8SBNLTF
 Rl0sMvRhgkKA2U3HCpnLRrGpIXOV2RCJmJ2qK65NK3JQ/RqZ9DJqQpH
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MCBTYWx0ZWRfX7l92ZltbCW4V
 HahD39o1jDtwqn8qthfiG6Fg1tLj9iFqLiAyu0s00TENxG8EG9GORcUcqOgV+f5hRm4do7PEnkf
 UviHFtGOpH9B9So9F/LGy88vHYAg6xAgPtoHTMiC8vbq+w/UHoSppbWGiM26xz3Bth2MI8/nKOv
 nkF63mq347MItS2Rc0+3yyiJ4yioX9tIHXofqU1csc0hewTb7jaXs+GZBSlJfmNGh5Na5TM5Ufo
 gPAFtvY35HheZv+GEFU3v0NzWo7zjU2klrb9QFzo6B7iCfPJ9J81tR84aNV2nNO2ms/4w7lmUgF
 jXgncjR4/prwGEPK4h46/YckORv7mPs1s45UjSX4LNZA/S7Sl6MCvXKLaccJBPBH2X0v7mPXEBk
 Uy6GqVw6XmEF/M6QbVS4ESGnVeQ1m4bF+uZ9gx0vScwQdGSRzYdnECh+2dl7QSywvtkyGtEUeUH
 bbdlGywfeDCwyJX57Tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MCBTYWx0ZWRfXwKlU4pRXDPws
 IjiE+4PFXZNqPQi98jPMatpenlIJfB20w8qVZcHxpHdw2OFScFxzI4fTY8NzqNMhibniwc/t53F
 vJ41d4UXhYIwvlk/QoX/LPfe8PqYNds=
X-Proofpoint-GUID: dnNj4r9arRP52qfnny9dBcj1z3xmHnZ-
X-Proofpoint-ORIG-GUID: dnNj4r9arRP52qfnny9dBcj1z3xmHnZ-
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a745e67 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DF-2czj9NRJiL_b3NI8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060080

When operating in SPI target mode, the GENI controller relies on an
external GPIO to notify the SPI master about the target's active state.

Add support for an optional device GPIO that is asserted when a target
transfer begins and deasserted when the transfer completes, is aborted,
or hits a timeout. This allows the target to explicitly signal its
availability to the master and ensures the GPIO is released in all error
and completion paths, preventing the master from observing a stale or
incorrect target-ready indication.

The GPIO is optional and requested only when target mode is enabled,
using devm_gpiod_get_index_optional() so targets without this signal
continue to work unchanged.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Praveen Talari (2):
      dt-bindings: spi: qcom-geni: Document device-gpios property
      spi: qcom-geni: Use GPIO to notify master of SPI target activity

 .../bindings/spi/qcom,sa8255p-geni-spi.yaml        |  9 ++++++++
 .../bindings/spi/qcom,spi-geni-qcom.yaml           |  9 ++++++++
 drivers/spi/spi-geni-qcom.c                        | 25 ++++++++++++++++++++--
 3 files changed, 41 insertions(+), 2 deletions(-)
---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260729-use_gpio_to_notify_master_of_spi_target_activity-5f62a9e14875

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

