Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708483;
	b=e4q0YuybjgWF1els0PX+aAqWnP/mKptKuC7awW4IW5CJqND6BfTUdRAZqP9qP5JgAOy4
	 QQZ3oDzxPuQGJVPs9IDQ0zCwrr7sSUq/ydEFv7Wh2NV/ARBnT+MjVS26RWhRhSVUPd+xH
	 dgf/LNARhjvJnbI7uauRynjii1R8ZpzJtSPMKkcJaAYFdcaNFN4h1G7ECyUtvDK5P9X61
	 dp/R2MvV6Joe5o3gBDcB6O2dGdHy/Kgdtoe86zxasIV9RULr/FJRUPkZa2mM8Mt1FluWO
	 lkG3fA4Earo7z/KBakjAVauHvoldjKCU5G1GH42GEYFm1J8goTbY3tSvCsYCBo47GZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708483;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AndNmGo8lQbotsc74hcb6AbQ0tgDdYfS8IkK4yUiUDY=;
	b=Z2qp0uOJizJl+Z5pJxMJ+OLzhH19yqePOE3Ul/FhwLwcq78k2Gqz74rA+kFH/osz18V7
	 nbEQ7BdW+THWITgZiJmeRfzJoE7nZGq4RsD8gnFvmooeFKwVDakTjruMO9D6LNG0a7W0M
	 Jvtiy4on6ineECNK2ScLZZlmo00CPonkwRHdy47m5fQEGX5U5CAALaRxkBlhptE8K5WIo
	 EwW5hw+6RwWiQ1PpRg2gtVWVNxZg4wDBmFAZ+Xgrs7RUEhbosQctzEjqn/HEJa2PQ/3fP
	 TTN12v2b+uyNhXsgL+agtnp6YOd15W/4gZ2wniVhyTN+7xnc5hyDRRXuSbwxsOyMDqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jEnVdcHK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UXb4EaMg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F325606A32D
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 12:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F325606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jEnVdcHK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UXb4EaMg
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AA8oQ3526200
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 12:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AndNmGo8lQbotsc74hcb6A
	bQ0tgDdYfS8IkK4yUiUDY=; b=jEnVdcHKbnI34ZJFSYl0PtMo88QQEfjwbsw5H/
	FbB/QA/RYgemORPogZzbYDRvHhB3hFddgIFDkHmoRZwgBrjD9AeMCW5ChNomdT4T
	FaOteLSWJhdXBEup24ikrkNScpk5cHtriMXzWhAt3j37SYrwvm+zeSP8VG4RcXEa
	LIoVsdoAH2f/mj9J1aI9JSfXIsDJWr771+5AFPkj8oe8x3MmmWc5ht+rwq8xqjMB
	AZZ/NA87d72lgV7s9lmLPS+7Yr48cs5V+gLr0G/GKt9/+yLRT6Rs+IGEgtPvNqzO
	nYNEXl/DXVDaBtp761T7xQMVRDD+SQf3LfkrLXoRsYmEJrKg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy2tcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 12:21:22 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc36b97a77so1071226137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 04:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793708481; x=1794313281; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AndNmGo8lQbotsc74hcb6AbQ0tgDdYfS8IkK4yUiUDY=;
        b=UXb4EaMggB4XdPzOOXvcZ5F59wAt2lpp6i2lhbOa6nY02KSOjzlKcENZ6AVOr9ZkzD
         mz8Mmg685RCcu5Gn+VO9HhYCCLaevgKEg8jAvKac+WqAysFoZu1aoFDm8BTqHrYESKih
         EIxVz0xel1g/qdNiG0vJYE+3ft/GScCxA2rkrvtj7d9Dl6+yVDV3PmKX2mPFaTqlwLe8
         cqWyn65xIs8Ct3vk4MDZNiJ5P+sBZZO/k7aLGTv8e/zdC+P1lhneabsbVFrXocGlg9/T
         UacJcpFM1Dhjk0dgkI1yuzXRFefqcoWEJ40GnklwIcJY5rYqhyCATSpIXqMsIKJigB51
         j5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708481; x=1794313281;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AndNmGo8lQbotsc74hcb6AbQ0tgDdYfS8IkK4yUiUDY=;
        b=nmYxFuP3U/6LrEd20uxQ94bBamLlcru1iSI+AyC1OV1ckwdQmMi9nhO0qUs45+3m/J
         8ofz9XFnu9vBw8GmCZyefLoD1oM3++ReotBA0idvbocol4aLlqCmnnSlISdNebcsdmFo
         8ITVI6dnQs3JASrVVp+3urs/M1j3BjvMx9BvOrTVu1gEoALapxPG9c03bHOqOlmdBCfH
         cyLQU4D+8ngBakBiSmMgZs1Rpj+Vzwq5y5YAoOqQhPQD4PERjY4AGzn+SabnPFu5uZov
         8wz2zYqbZm6Z2PnYWOGm4EH7g1O+N6g4scvNr2w6Ia9lUz8QSL4r7ngGNqT04DcT/onW
         s1hg==
X-Gm-Message-State: APuU4Z9ZQZ8szps+6IpE3ll35Lo+9cjlTVmPAEsUrwPLBMiQQaZMM3g5
	cIIqoN3lCabG4v7/R0aLU906bzyKAF0lRzWLYqEqoNH00EHf4d/fZy2lPkbfbD4Lsvrf533Zo2f
	Cl0hPEGbgOteeB+7qoPFRdz4sQ5VtrnYlDyt4Is9yQivROp7KVyQ3wRM7IBIS6WsORVGC
X-Gm-Gg: AYBFou1ik9EZDqtZXQacp2XNvL30qdY4P5gyqMeCbVkfpOD1AhCg/IXFez5htTWBdC7
	afQe2HixhrDybaVztK+icabVS1YVVt4QlA1qsP+3b3SE+HzV3FfnY0T6/6PhxheH0hWrtvQZilz
	OaISM07OQwVju5KkQ412CQXAFZBBzZRsMyhgAXnRzlyHMa2n97/fB9lbMWFbukAOIX4FscfHwhM
	6dKyTP71vDh/kM2DURMPJry2zzwwfuGCW90R3nTu4J43ht/+nExjIRgviTWJc1eJmZq6Zagtgnx
	j0zJZP+nriJDDkde5gY2t5N9t1tdJqyy/p218CSHcOES+i5jcDFFOTz/U2L09gPmsEA+5/Y3nJB
	KcBZY1+t/gGZIWY8cBIvwE1qV3ZwshMzFQdryCpKVRMe6qSEYnPeob4aKgwBF3452Hm8IJ96y3i
	OVpw==
X-Received: by 2002:a05:6102:3590:b0:7cc:2152:4f79 with SMTP id ada2fe7eead31-7d072c1571dmr4466669137.16.1793708480994;
        Tue, 03 Nov 2026 04:21:20 -0800 (PST)
X-Received: by 2002:a05:6102:3590:b0:7cc:2152:4f79 with SMTP id ada2fe7eead31-7d072c1571dmr4466660137.16.1793708480497;
        Tue, 03 Nov 2026 04:21:20 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm24378293f8f.47.2026.11.03.04.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:21:19 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v10 0/5] gpio: shared: replace platform lookup with dummy
 software nodes
Date: Tue, 03 Nov 2026 13:21:13 +0100
Message-Id: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALnR6WoC/43SwW7DIAwA0F+pch4VBkzITvuPaQeCoY3Whi6s2
 aaq/z63hy2HBe1iyZZ42IZLU+I0xNI8bi7NFOehDHnkBOTDpgl7P+6iGIgLjZLKyk51Yncasih
 7P0US6WPMFMUh59fzSURnbfKxx55iw+dPU0zD5x1/fuF8P5T3PH3d75rhVv2POoOQAltC4wAog
 n/KpWzfzv4Q8vG45dDc8Fn9gCAl1EDFYOeNtA5a0CGsgHoBgq6BmkGDqAP4lpxMK6BZgqYGGga
 VQu3JGkxkV0BcgErWQGQwGa8oBYkdtSugXYLVHVoGrU88boyJFK6A7RJ0NbBl0IfeoO5t6mkNd
 Euw+m0cgwRILQZCu/oo3S/IYg3sbh0C2RBQguzcH+D1ev0GyxG/eFIDAAA=
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3649;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7c+mTVq+054pKxMVUCbyHgpt+ZNyHRHGO85sefHp19Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6dG+6q20YTBnkIfhWVtV43A2NWIZQKXMcRGlu
 PR1aDhnld6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaunRvgAKCRAFnS7L/zaE
 w6w7EACt7dQ5Jn+hvODrd2fr3ydoCi6TUpDmfFqn8qFw9Mp1krAGrGj+0xQoCtKZzzUg1pjLlHO
 oYRS44DGluhaMGR6XA5qItzYVAP8jspRM61SQ0aaoAbt5L845mZjKPm278aA8IfXMmHbrqdY/NB
 BF/D9DYH2aRfj1HQK/fDBRFrNNkcqoTcyt66fb4nf82HfOJjRZGVeyMQh0U7Y/A9TYXbNHdP2Zt
 FOU21/35ZvCs9JwCHqgrfQqcBLOk7H9WQJT1GMWXOnRizmKLHt19KWOcGjlBzWkVwh4YXOOAMxx
 D4vfu9MXk9w/qWDIHTrlna0rNFWe0MmHnq7BLYD9kYmFcjSJIa6rHiB6AMoXQ5W5UKAV8tb/m0E
 NJuRr1jX4BjdpWUvzvzEab0lVCEsjrPyTD05OgYJJpHZ100yhQCu2KC03UQZNQl+sDEjc6v7vAA
 a6Cu36FObj7+WtPsQtuPAgE/ikbueiQ26ncIh+vhdowEth8WQ5pJHcZd2Dn9Odg8Pg2PtFpweYK
 3BoNAUExw6C5olgqGhtlCZomgEcUIFSU7uzvybt3ORPchEG7NIiSphnGoTTZWsZ6VJjC5Mflxwn
 ardc2eYIfwzTEUo8cUxSoZHfWRXD6VfLYGqsD3iWDmptvl/y2ymhM2nB1/sl3vgNa4OL/OPew34
 b2n3Ya04nGxIb4Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: R0XfwqL2aEHY5Z2d9S_cSL-GbgrkADCT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX6GZB2GH9B9EB
 3KCU16a2HMKLTFDFr5quUgD5FuB8tPOJnLcgA/lelAIChkKzXGB7qYP7pUu0L92WhMOrv3VnZb0
 uyHsRJYg71SC4bXJFu2nBIqhZ0vhJUmpavhwyn0Sm4pAk8HuipZNn9n13DaYFbaOzLPtpH9SeIq
 9DJkazpmizWXCyA5AZ0+R1ZMSasEnblDUMVOiVxiVKzGMXyMIges1eV02MZIio8zrOqQT9KTPlj
 WLhNQ/76OdB5PkISEmTD+pKoBRA5t/FCvN1zzhRS0DkVv94BjrCK7yIvRjhO4/tu5l0QqeU33M+
 o90svFdXqMJgGCIPGMfdWfKdUVuNgG9YnQAndepHnuj5quvvjTkj43WlsqYHuVN8ConATwsD6GV
 pfVmbxVhzy97flI+YiSXKzZKDQ20CoLKPymzHDtg0kUvbC9OUb3OcmixKOOSv2IojWVM195gSCi
 Op1h/Kpjj3jkOYweogQ==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9d1c2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=I9N5W6qJP5icRhYYgJMA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: R0XfwqL2aEHY5Z2d9S_cSL-GbgrkADCT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX4TcWCcghbHzD
 FxQhAeZN5geAlNkiYzMskb2LmDHIpvSM+WJvjo8C3eenxStSQWnhYllNmBRmrrZnI/fCLB0jRcW
 SiEsh2rvujtX0djJDJfwyWhIVSihsKo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030049

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
for shared GPIOs. With the NULL-pointer dereference now fixed, this is
a rework that implements support for this use-case.

Sashiko pointed out several issues under v4. Some of them were bogus and
I fixed the rest.

Tested on Eliza and made sure the fwnode-only lookup works correctly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v10:
- Use unmanaged software node until the release path of managed swnodes
  is fixed for shared nodes
- Link to v9: https://patch.msgid.link/20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com

Changes in v9:
- Fix software node life-time issues by using a managed software nodes
  for shared proxy devices
- Avoid mixing gotos and lock guards in the same function
- Fix a typo in comment
- Link to v8: https://patch.msgid.link/20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com

Changes in v8:
- Move the auxiliary device infrastructure (including swnode struct)
  into a separate structure staying alive until the release of the
  device
- Link to v7: https://patch.msgid.link/20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com

Changes in v7:
- Fix race conditions in teardown path (sashiko)
- Don't allow passing a NULL fwnode to gpio_device_find_by_fwnode()
- Link to v6: https://patch.msgid.link/20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com

Changes in v6:
- Add patches fixing the error path in shared proxy setup (sashiko)
- Link to v5: https://patch.msgid.link/20261020-gpio-shared-fwnode-lookup-v5-0-f4a2dfc059d7@oss.qualcomm.com

Changes in v5:
- Drop fixes already applied upstream
- Check ref->proxy_dev for NULL before dereferencing it
- Assign ref->proxy_fwnode with the shared reference lock taken
- Don't return uninitialized ret from gpio_shared_make_proxy_dev()
- Simplify error handling in gpio_shared_make_proxy_dev()
- Link to v4: https://patch.msgid.link/20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com

Changes in v4:
- Fix arguments passed to ida_free() in error path
- Fix memory leak in error path
- Link to v3: https://patch.msgid.link/20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com

Changes in v3:
- Move struct auxiliary_device out of struct gpio_shared_ref
- Link to v2: https://patch.msgid.link/20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com

Changes in v2:
- Rework the shared GPIO management to replace platform lookup with
  software nodes associated with proxy GPIO controllers
- Link to v1: https://patch.msgid.link/20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com

---
Bartosz Golaszewski (5):
      gpio: shared: factor out per-entry teardown helper
      gpio: shared: factor out per-entry setup helper
      gpio: shared: unwind partial failures in gpiochip_setup_shared()
      gpio: shared: detach the proxy device from struct gpio_shared_ref
      gpio: shared: convert to using software nodes for GPIO shared proxy lookup

 drivers/gpio/gpiolib-shared.c | 314 ++++++++++++++++++++++++------------------
 drivers/gpio/gpiolib-shared.h |  15 +-
 drivers/gpio/gpiolib.c        |  20 +--
 3 files changed, 192 insertions(+), 157 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

