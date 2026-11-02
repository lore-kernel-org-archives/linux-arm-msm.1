Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609466;
	b=mRnorQZFShx7lg3bpT8NUfF8ntNIbVJHesy5qj9rQHGB9aGkDwAD682wxDYygmzUHBL4
	 anoakkUyIf0wwWqJjaaxko8GXrai8Z4d/GomnFL5Xu6RRyvVWIsXhOPVIhJfahqUaQ+Jl
	 fce8qUS1j/B1zY9agWsCSMNf2qq8CPLBoZq20T6JL4mqcoba7ji6dbNs30+AJmHr9zyZx
	 4LeB6UX9j6ypzkilfXVYph4GFkNRWw+r4/3pWkBxgdmxiUduMrLC0NcYgic4elpPSXiWI
	 IUtrThaQ7T1a21NFOKmZiZVnauMv/DvUy+Bo9mS/Ne0Q4T+RWJSUsTTTGbLJ9IcBrTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609466;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fK+MfzAdps/6x1wKXxC8U0J9pUwDKyZlecelLkcuWlc=;
	b=v4D1VVywNaZATWtiMD9e67mitIAdSFnkglZKG/1AarddjPrEY4EZjpZI8ozhulQsmiQH
	 d3kQgdbSFdDisMugpb8GT8Vw5Ld8DVLEaY1EkytOVb5GNE10AFAu34yBlMXkR0+FzNenx
	 xuRWIiqulDFahdv8RzQnrGGntwX61vFOk8oiIXXILQamirgsX7YcLx9SKVtBSUKIdP8Va
	 JxhpKXAOHtJKcx/eeZPN8HZatUzo6zR1SI6uGF90qw8aUCWLWfHbV5rFOcVYlng8Cw0n8
	 bHWE3YIbwaUQZtTh71NXdRyYVq5mn/pLzc5RwoXvQF6zdcxf5U7wDAWt+VaUEhnRcpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HErbqs6n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GhH8AmI9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B324606A32F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 08:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B324606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HErbqs6n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GhH8AmI9
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A25VsKQ3924170
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 08:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fK+MfzAdps/6x1wKXxC8U0
	J9pUwDKyZlecelLkcuWlc=; b=HErbqs6nU0hxqI0mA5JoSmE2p2PdO5+fJE6mrk
	hUM1PKN7wtYBKCvAXR9jD3ug4TKzTnvej8g+ywslTskCnDNZoV4o3kjOGBOZQj+y
	hp5rJMRmagM0hJluEanpWp8pE3meW/vXDJLgz9DtCIPrMLd7Rxl/4kocgru3SKp/
	o9ygQfhsye47QbzfVxHRG/Wq+zSRbrweBqzyFbmLOdBInR64vZI5H0ksJ9bca1Tj
	xQXU3hanAnzlllOCMAe6pZGzBp5kcTklyupX4FJHWy7VRKbYoT7/BWWQRwd/pUlu
	InyFqk5x5KALJfcitd6HovTRBkkFyIP/u1S0c4PNmRTSGdHA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1rq9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 08:51:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso2682022b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 00:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793609464; x=1794214264; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fK+MfzAdps/6x1wKXxC8U0J9pUwDKyZlecelLkcuWlc=;
        b=GhH8AmI9AjePY7U/JEzX9AlIjIjCh3/NPJwgTopPwA2XmWVtTQ28zUBwY4nJ5Xjcg6
         8x91bmDErfd9Qfry5M7beHecfwwfPWs2hdjlDdhHlFz2eWl2Y1eBsFtP/GtQrPFwqjdG
         9U/rJz/Gk1BUhE1/tbNW3be3Wqg+tTtrg7DrABAkgJl0L0RpchX7L37/hpTAPS2pS12Z
         XbnSTZ/9EUCqHrlrm7wHiDIbaRvWiVi2ujmeLNZ5JDxnSdP/YoqHp5co15q90NELZjRH
         HEMtZgUlvrRmE0vvYAjm+0Q7S8JYCkIHUSHQdanPInrlLcZk0PJU1U24/A7sN6cEEUWe
         yPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609464; x=1794214264;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fK+MfzAdps/6x1wKXxC8U0J9pUwDKyZlecelLkcuWlc=;
        b=nhzyg/gLpBdi8/GZa1vgAAC0w3uo+mx+mhjfZhpZrb04Dw8O4VfcLNGZAhLVETUVWa
         6//ChT3WXGrViLmDZzg+5f3QDdm+rQp1nzkCfMbHkAX+PhjV4KSY1wPRYlPE7KmUgW8U
         vslORtS3vLnnMNVJ/CXoS4Z8HsUYseHsoG0Sfxg7xDU77mbTRy/vtmTzbyqK/46UR2G1
         fq3DjVViSIFcyDYtT2Fdg/Rk25anpcmLj5I4iDmLI75oizJqClJ/0wOozMSc4ButcgF9
         8mvu5evzcMzuwX/XHS35SE6T9hp4mx4h3UvLIduJ0Q1/aJ2N2wtAmC2lyMAHuPlITu7o
         7sPg==
X-Gm-Message-State: APuU4Z8Tt2B7T9f3acvcGL7o9txGnQ0UeiZdh4tCmBGxAefHX+KWbQVC
	g363VQLi4C8K2AQgB4hOYFfNsNb7VJKJMDxB6R53+YpIYZzQdl0uAKAHk29PJLl2XwB8H4MbyjA
	crj02XzPxCEVEZLtyv5315DhkKM9dopbuXzQwLcPgG6AsLeSbheSKNfNbz4nQm4HS0v21
X-Gm-Gg: AYBFou0mQN32IOxdMvYHdp/f8F0pFtQ1Kmjlc0HXGlaJQI6AP5EUI7l+j+F72JXRDKH
	Wpq429Lpe9YdvC2SOU3ssFeSzzsqUDKNELB2WoYsBMiPEId3L8FadMxyJEX9jxnjS1orTBb6M+D
	KhIiArmB+nK1BGjjxgQHWM1BXdl/+gmBWWvBFdVM9lspLEYuCiFSIDKdi9AeneVPSTz57AWvBUt
	rbIH7u1H/W7Sn00aXNKNtWevBybJpquLHN27tR7lMWFS3GcXn60KkhERL88r1fIg5qDteDABMR4
	rK+ROsFOuyY7aOm1B41WvtJAUH0GQ5Kza+EgWSiFW369o4Xbe579enYgQUR819rVhmy+nU633Ys
	8ahb+q4/8UHXyHy1WKBL9fr591TGreQL/y0P5pk5Fp335c3oYECg9iDywXf87bwEQf0/RrSn2hh
	kfdxg=
X-Received: by 2002:a05:6a00:2407:b0:8a0:2882:852c with SMTP id d2e1a72fcca58-8a83366b9f4mr7480389b3a.51.1793609464004;
        Mon, 02 Nov 2026 00:51:04 -0800 (PST)
X-Received: by 2002:a05:6a00:2407:b0:8a0:2882:852c with SMTP id d2e1a72fcca58-8a83366b9f4mr7480379b3a.51.1793609463545;
        Mon, 02 Nov 2026 00:51:03 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cfccsm1748329b3a.9.2026.11.02.00.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:51:03 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH 0/2] media: qcom: camss: Use Glymur graph ports as CSIPHY
 IDs
Date: Mon, 02 Nov 2026 14:20:56 +0530
Message-Id: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPBO6GoC/yXMUQqDMBBF0a2E+W7AxGCqWylSYjqxA422M1pax
 L031M/z4N0NBJlQoFMbML5JaJ4KzElBvIdpRE23YrCVbYyprB4f37zyNYYsok1M5zq54JxPUC5
 PxkSff+7SH2Z8raW6HCMMQVDHOWdaOuUb1w7B16lFD/2+/wCjGpphjgAAAA==
X-Change-ID: 20261102-glymur_camss-1cf83f4a447f
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793609458; l=1407;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=NKMs1snAVmrZ2J6U8AwvfHr/ySDqtJanq5jMU2OoPeo=;
 b=G1+y9A9bMG/HwEd6iMnE8y27+Bl8LpKfJQZgoV7mHRUdnPhGSe+ywah3seqSXTrHNp+pISGAi
 oVKCgIbPphsAHXKlE7wtXedzDB79T2QtqoNEfQD1E9NJPI349Mw7p2Z
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: 4__NbWeLE0PcC45fdXE7oBZ0KVxyoHU8
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae84ef8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=IAV7YMJS40DXAaybdl4A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfXw1fXedfD2udL
 fEke533C3RGZsMYFEvX+Yi64cK0qZr8qtj76Wrxabv41HoR4oFx+EvBwqFUAVuQDSFfVKhL7Vhl
 j6DMW+rstEVELhWAOOxv/zVdMQvqqSL5hpD7g1rNk0rtVuGv2FJaisVz0t0I8RTrIMo17Y4ii6l
 miGGhsuu59Gi15tSiHd1y8bSDofZUuRdlLLNBeUJMG1aXlvzFLwiPE39jSf+Y8EPup33MMDBTBj
 Rsc45/ypie6fwY8ElN3xdkVZD8PKKOK1pAg2nYai1au3QdY2lZIjCBvr4WXf6vz5iU4xrP/Qlkw
 eNEp7/+Ig3756eqsrxHd/rKFaK1lRYcVbMsHJZRE9A2iLkPwxecH5U3ipv0wv5Z3mOcOTTigVlv
 I9/afD2OrQ0Ez5l4Icu29r4O05BrA+Rhja/NKes9u3FL3eRYZMbHDG3xlSXXMeXFaXsyIsr9ADn
 NZOWSn7hKvxMz5bvFwg==
X-Proofpoint-GUID: 4__NbWeLE0PcC45fdXE7oBZ0KVxyoHU8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX0rrTwhO9jXx6
 l5sHhcnCKUhEVaBzPOOAfAbM26xKTrzP3Tyj7Su1m8HklV7Niy6HZNkRZ+LZztDg8wDzZFkqkgp
 RoXqf4s762B8Qo09e9DcYpwnFsjMDrw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020035

This follows up on the discussion around Glymur using standalone CSI2 PHY
nodes instead of the CAMSS CSIPHY resource table.

Glymur currently reuses the X1E80100 CAMSS resources. That works for
CSIPHY4 only because the X1E80100 resource table maps resource entry 3 to
CSIPHY id 4. After dropping the X1E80100 CSIPHY resource table, the
standalone PHY path uses the graph port number as the CSIPHY id, so
CSIPHY4 must be described as port@4.

Update the Glymur binding to allow ports 0, 1 and 4, then add
Glymur-specific CAMSS resources without reusing the X1E80100 CSIPHY
resource table.

Discussion:
https://lore.kernel.org/all/CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com/

Depends-on: https://lore.kernel.org/all/20261026224957.1115370-1-vz@kernel.org/

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Nihal Kumar Gupta (2):
      dt-bindings: media: qcom,glymur-camss: Use CSIPHY indices for ports
      media: qcom: camss: Add Glymur specific resources

 .../devicetree/bindings/media/qcom,glymur-camss.yaml    |  6 +++---
 drivers/media/platform/qcom/camss/camss.c               | 17 ++++++++++++++++-
 2 files changed, 19 insertions(+), 4 deletions(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261102-glymur_camss-1cf83f4a447f

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

