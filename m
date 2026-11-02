Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618269;
	b=qi6v2SW3Sgrp/+C2pCdhSwk3+0ByoOF1RC9c/tZ990jblixqTNYFLgEj+Lvn1TsicySF
	 hhgrDA+fkR8pA+Yug/7qw5JNvO8AmEkCVDayhqorEc1RENogyNET+d/c6GcTJhL1qWpZH
	 iZ5nyf2kZZ/XvZhvy2B7gBYeZQBUs43pclQJevw96W2IKMR+gmX7crVKGEN3Cdyc/BnYT
	 1Y9gkaHWcqhd3cQYfsWD68iXA/rv6m6iR4VyQ+W7VTpYp0m0SBjm+QviuYjWYkBIwP5jW
	 +K//iqijFi4nzuOTqVxn7QoXA8uxUC8uhKj7vZj/1vA+PxxdOe+DVy2eRt22/442Vww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618269;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pAwUqom02A0DTMlHkITyukQZFvpQ9lTes96etKRTtbQ=;
	b=YhIY6GXsyYIBHFpjTs59ibCkmRuDSPbNSB8cZ45bmus5VUz2Icc1bxcxMnHoohRgcrrv
	 6rsIoelmJpdMSWUtCMyT8SnLv+w4nlmOTht07237rjaBaachqHawpLj9qi40mR6K7z5gL
	 taIGTha0C65skI2hWEsBm7Ax1cDnmOzeBEvdEduNKNWJZNbpNB0/Rv8TqWp7SkqtmzGco
	 8IQveCeF+yaZZvVSG5OJIBTrnyzLhLmtOdjd7/0OCPvcDfbAFJuMzJ2Ckx+voBZVpoWfY
	 1AoHqp7lX+GNDYoSG5VeKl5Z7XyM7N9jfCfANnIhN9hre8gUCOzFh0XlDHU7xmpXsPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bcD33cvo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhkeCBte;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E91606A330
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24E91606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bcD33cvo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhkeCBte
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A0Ac3402437
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pAwUqom02A0DTMlHkITyukQZFvpQ9lTes96
	etKRTtbQ=; b=bcD33cvokbebHC038E1MjpApESiL9JijynWqJpQhJSje1qkHHtz
	oEfv8Bftbbqu31bs2g36sMjRr9BLNoSfQxAtvek8YbXFn4XQDVkspjO0+VvBpBcp
	WL0UdgEP6aBqXRTycX1SYbj4NOkwDzqfSpKywJhs4goLJu/XJHbHVDtQPdSJVPAZ
	X+gd3qFxqwQgi0RRw4WUGe4fuMlUSJvnHcat8V0Npd/Sd4Nd2caM2XEx8gkniZyp
	4JjzwAXR/CAfcojJcgIdLifjXaNcK8yNVfVKBxF5j2m50xQ5+Ms647JLiFbIw6Bb
	KMZfNPqm3nEhf6VMSUIfojsboH5EWxBv/GA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8tvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:17:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35cbea41088so4158122eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618267; x=1794223067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAwUqom02A0DTMlHkITyukQZFvpQ9lTes96etKRTtbQ=;
        b=HhkeCBten0JAY4UYxT088DhUsXuzswkqbsJYabQodzxtY0DaFrSb26NGpLEdVRyxlP
         Ht+YrCxhZAEduEMW8ms5W11xcYY6H97EO6t92HDGRF+hdNQ3EG41GZKAUa8MaPczQYGx
         dU4Wgcdoh1OmPSLzoptQCmXK8dgMKG3rSIKqcgSluau2pmnoMXnY3NXZHSRj/7fr2Rxe
         GrEK2OCyUcODkcUTpNgdcW7BeUHOqdarYh4FLy3lyCIeREvQbLjX22134E9JN/zICCSw
         MJ9LNgxv7KBO74bRMD7Y0Uvwx6Bgcu8pGIDmnZiZbKN7tuG+vb4Sf+cRlIWEiYhVKlCk
         lcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618267; x=1794223067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAwUqom02A0DTMlHkITyukQZFvpQ9lTes96etKRTtbQ=;
        b=H1LgcubXIByLNbyiFHEQwNMrbUnxOnTGSxtFR9X7p+75YMwKtJC6Kvz0LxtfExHOa6
         w070230MgySc057j+w0ocGNbAmvamAfApmEtNf6N1d1xVXyoJj103fjc0cadXoGnRG06
         XDgId4YgCrwcrKtOIuawI3AylBfDqqB1/Tonfmh4Aurhmj8lpOD99CFWxg9m3cJyizR3
         E09/fjJfdwqEmzw3d2Hl+XuVGh2R92N6C61EUZJpPlV/RBfUbtOjs85yOvOcH/67Y0zx
         4yu8PCxPqVXIzHcse9czM6RAh8rqNcuMW0nQaZwod0d3Vj1oUUAL+73aFinO4sg+zpDE
         oGgA==
X-Forwarded-Encrypted: i=1; AKwUvBxjfVL99POHJTsyDfNFbwVHtl+tlv/n6OvMnmYmKTEb0/5ZimxbkfgiFm2VQDrBqPufusoUEuENQlbVoJOK@vger.kernel.org
X-Gm-Message-State: APuU4Z8FbdmN+ZgdkSM1mb70NOxUlCwcB9t2yNAJp9xue35O25dK2oMy
	jXGalWxmpEQZiAoAlCteJMQvo7Bbga7WKFjoAU1LgfvJbHY2qtilm/arv7AZXhX5aIvsCLgBw18
	dmrPQFxx8Dy6iAh53S5sgbfIYDqqlr8yu+faasff10imp9ZldzpiCaThf834A+cX/QSBn
X-Gm-Gg: AYBFou0IGZgDPs/FSs7RoCWPAbzuATK8V4qmtLnx5EozqoQ7YZM46ixTfBhjDBA1YkC
	hN4F2FYaxDF1BRbicOeJ8Vs8MeGp5Bxg4epMriDXahPnuPWzOIWF5XaNw7JhdKBAApedXW+S/f4
	MIHcU9vcHzbwN53XPx1/MLE1vUNaey3dMHnM23KbOMkseOCyDZU/wtgtBc3qxc7xwZmphowtoeL
	ZCGVJHEpRykPVEAKNRT+Bi+ZlF83EGUV8m55fq15aZVexwy7idmD8y2djIR0Jemrdg0MylBGzwU
	oMZAfPLE8Uhmm7rinp1BbB3XjqLdPFnu26r8WVyYpO8u4bNBq5uJ6QsMW6fyOnCIJDPtxrSZ2hW
	GnAwaqLVO/GWgRYRgtev6tam+RNuEAHqs0+RrPKWrSKCApQ5VV7KHKbqeYqetKCRobu0fVGhjfO
	dTFTCVSXYUDRtPtaefVLsq/efdrHzpLf/3
X-Received: by 2002:a05:693c:88cb:20b0:36a:1e50:e45 with SMTP id 5a478bee46e88-36a423624d5mr14292677eec.9.1793618266503;
        Mon, 02 Nov 2026 03:17:46 -0800 (PST)
X-Received: by 2002:a05:693c:88cb:20b0:36a:1e50:e45 with SMTP id 5a478bee46e88-36a423624d5mr14292638eec.9.1793618265943;
        Mon, 02 Nov 2026 03:17:45 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a5eee0f20sm16492078eec.17.2026.11.02.03.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:17:44 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Mon,  2 Nov 2026 19:17:29 +0800
Message-ID: <20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8715b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=R9LytnawintqPorzxAkA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX0WMyxJX9WFcr
 23wHLbZYwX3nogSQtYmfySkgk1DI7VwXZMIC8psGwCTaNQ2KRlTgwoeP0fxwAZ3elq9uMRb9CB1
 4jlcCxKtON1wg5yr7kh0eaayiReNs+cJM6tQlqpQXrhRmqGjfdhkCTA/YQVfnTNxmV3xHzOuS0u
 OoyacrJjmaRWl7S0B7kYgEGpqsc1BNS6N+Glil9pUuOwKYHh6248Lf3uZ31WRIC810YmibeulkZ
 2Amsfa8+cngyebVCCyVwuXAyWV3+e4+mLTmFYjvRHvsnKWfpWLLATz2Iuj3Alh0KZi8AWHVA/6c
 pGcJ6qI7HdQMCtpiw/j5vX5vx91y/KZhwTPQ+UM+OSYwNu6i1bOH8A2XALp6tgBXCrhvP9+8shO
 KPJvdeHaB/2WxLoszjIHuU/4u9DPVrY1SWegjPdKaEOTCvRZnqjbrpC4/ZNOTrn0x/7kats9t36
 9h362dYmPjlLOM1AGBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX3QX3Zs/Xt+M2
 6mnAjOD8DfMcLBPnO4ESGO9S1Yh31ggewnd0y2e6JnqC7FAN6wM3+4mvxhQsM1kaMVSNUM15k5T
 otU0aqHt8ncin1AhtMXD1lTSLHQOW5c=
X-Proofpoint-ORIG-GUID: WOMKiZcDpQMFwDb0tIZMITCiIe8LytVA
X-Proofpoint-GUID: WOMKiZcDpQMFwDb0tIZMITCiIe8LytVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Changes for v4:
- Drop Assisted-by: LLM
- Link to v3: https://lore.kernel.org/all/20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Address Heikki's review comments (Thanks Heikki!)
- Link to v2: https://lore.kernel.org/all/20260911073414.16711-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Drop include of <linux/mod_devicetable.h>
- Link to v1: https://lore.kernel.org/all/20260902045938.184221-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (2):
  dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
  usb: typec: Add onsemi FUSB15201 driver

 .../bindings/usb/onnn,fusb15201.yaml          | 152 +++++
 drivers/usb/typec/Kconfig                     |  17 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/fusb15201.c                 | 580 ++++++++++++++++++
 4 files changed, 750 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0

