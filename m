Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800954;
	b=jED8U9q/Nk6EkF10LhHXF8rEJegiEcbAIJu+Y0jlUaqaVKDHjWjvoQbFbJx/71F8XJTN
	 A3ePf6vTEeZAY1tcWLun3w1feNbK5h7nMHJMzMjexs6iifLvNXWVnI4T5OhfVgZdm9w5t
	 WLDrgxNyRO2sa7hVpf8ZXurc/BCpKcgSEwLzZ/xEw0IH2sVcKpxdixAnoFV3PgBuqhP1/
	 ss3yvLQiHiwobeciijGSqHdw+VQYQZG4ll7DpqT1kh1oc3EpM+0xaXmVhBbngu/PM5qyp
	 KHVaTom3IpPf8jhQ8DkKzuGD+IYorkAUARtnnKrYJv/ev7dYNO9aUHBdLE3+fQ2Ls4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800954;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AwSioBO3+sOu364AlPsy6bDKqo4iTTY21pTGV5k37u8=;
	b=QT42Ri/y7J+CZ/6f1+2fZOfvbgRwYkrmUc+265/Yi6xnZ4Xki/Mb9TyBxpvELdcpFZno
	 JmtdFHlwl9e+NK+DE645voZ8H+63ZouN534Bi2evd8qv+ONIw4bczvKa2Fb/Z4UweIYs9
	 gxgYrPOoFH+MXKMvRt3RGxGJy/yqRuIfmSjArQsxvOvLPnwB9+0BB0hdVr07AjaiR/bzY
	 Maklc0v8XNNAgMg5BxV4qRMmZR+cbwHir0It5kkzqgGvFqK/3ZnDD5sv4miBDM9vDxePL
	 JuaGSNhQWAp1YtpiKPo3SaabqwWa1R7F0Yb4yrlio4jOhJIKLEe8pWRwn5a5xfIuOvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QaT3JhQy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cVajG97L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5C1606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 03:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F5C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QaT3JhQy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cVajG97L
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1LS6u2659891
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 03:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AwSioBO3+sOu364AlPsy6b
	DKqo4iTTY21pTGV5k37u8=; b=QaT3JhQyXTHrlABiDF12wNxcb9ddBRRrWNi4fZ
	fHRXBjnXblW+VBf699jZWh2NJxGrw0MmBi+B8wNi7c0ws8bsHjOJEiajnPZLbwWQ
	IDOxA3y2qV2mn4KnDj2bnNrmhq5tCkMfPrVMv+0lqHBlvrFf/lug0Ws9eW0129BY
	sD0TE4gN5jd2m6FDD45tAFXza/9Iz7j4yqDi5bUDb8EmWlXVMMEiCZXal4vnS2Yt
	6AKCSutVmFh69aZOSaDHX2SDhn/wbtV6KpuuDV0zbY5F00CaXnsfgq3zrPBMT0d7
	wx+g46YyR+CzDn5lNleKQ9Z/LEobXOqYdfdgN5K/TULrUoxg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcchn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 03:49:08 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5713cd0fb42so2456975b6e.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 19:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794800947; x=1795405747; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AwSioBO3+sOu364AlPsy6bDKqo4iTTY21pTGV5k37u8=;
        b=cVajG97LtNTW0prUYIMn/ys255K1pJm3rLqM12H9yKzQqt02C0YOE65HAvPQSWc+Fl
         2wuK8zLhuTjr226XRoRzfYrenl8vGn1lqfo3SGXKumazZNq2cTJ2H5/alsDbE1AgBISL
         zGL0fQ5S2zMxLCh2H2k21YqWSMF/dSipXAScovdBZnlVHDObnRNsVYlNLO/rO0//jpvj
         TyUZxYwa7fLEjNrqj7trwlF/AitXvPNGskxgYo15TWjb8bKu3aEojT88gtQbVbbpXFAp
         4Q8ERxvwlfX0JXUvjZTHyg7WJPlNVWeusb6ceB1dTjIUUJTPq2FoHYwDI5qgusqQtEst
         HgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794800947; x=1795405747;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AwSioBO3+sOu364AlPsy6bDKqo4iTTY21pTGV5k37u8=;
        b=ubUQhAVbZZU0o6OWdBVBBJ9cTS4X24ZtWU1fZl+hEG4yWTZ28LpgId995WDOQ4JgQa
         rf+HdLlgntVZt49Fw7V1jKVvWJHYWSrPNERLTMDRefDIYBY8oMlCqOQdjJ6cMi4eDIbu
         HcdPTSMy0Z7NqKI8+LxcHPdK2uKMMCcAwpyc4T4VlZUoW13cV75y4AB0fgHqpPVUPsIf
         CdfW4n2vtJzv1ueuQOC+W/dUbu/Ji8CxpZzTfl+UrAgGokCrResMinT3IChZBOqV6mD4
         NS2Mb6G71AE7PxfHpR6Z6q7LmlpQO9nwnuPcBhaAOSjgXxSMJ4f8VgX+hJdQ3IRJbkf2
         ka6Q==
X-Gm-Message-State: APuU4Z+smCPEBV69aacSvSr0tLr17VYVRfAKqn6lOYi+r033LwRUPDWu
	PWyqhNoih6B7Uis9gbNimTr2KrZhQn4RmM4gBnJ8uzXKDUWSI2j0cWhwixbJDijPOObBH+vSWGo
	f8fqtl3Np/Rsd6QQ/1GIzCDaX1YaKrZ3HAoweaVrWgjEYYVs2Xov23Ve+kvcXjwZ069GyDEsJR1
	WT
X-Gm-Gg: AYBFou1+deDRbKEwReohyd/RV8Mg8rF3PI6MtLp+Ao91sai5l1g9FtaA1Y0+pIKlYVK
	PK0UVZoskRRwXv3vpqxyjhW2xOLk+L8MD9c8eN9U2ZSjIusrapaLLLqAB1udSErBdWcE0rnjVTq
	i720j41brMjTBN4f3RxqdmkTHsRZ5Hd0Kh5/pMaGW+JFaRD6H6GOkIlEN/vilQ9BBSY/S64RAKX
	VfNWX/jioGRBpQCsnKNQOapUU5Dhk0UI1kzWxkEIXhYRnfKfKOiaFRBJvl+C1WWRNFhIkq76eSO
	snVqKVqRODqOOCCNG9/nJNWxCBjAjjSGe4WaAsVdAbvSbLx2pdRIZXP2LfScxHttXcrma5mKWM/
	vomKQRKTdYWt4RToTs+9eqOPL4DEwJKmxo9rozyrv+5mEITzYypQoAl3OBdySuhUTot0=
X-Received: by 2002:a05:6808:1304:b0:568:195a:3bb0 with SMTP id 5614622812f47-56cd81025f7mr8424121b6e.23.1794800947468;
        Sun, 15 Nov 2026 19:49:07 -0800 (PST)
X-Received: by 2002:a05:6808:1304:b0:568:195a:3bb0 with SMTP id 5614622812f47-56cd81025f7mr8424108b6e.23.1794800947038;
        Sun, 15 Nov 2026 19:49:07 -0800 (PST)
Received: from [172.17.0.1] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7024673csm8903234b6e.8.2026.11.15.19.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:49:06 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: glymur: Add ASUS Ascent QN10
Date: Sun, 15 Nov 2026 21:48:58 -0600
Message-Id: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NwQ6CMBBEf4Xs2ZJuNQqe/A/Doa2r1AiFLjQa0
 n+34M3LJC95M7MAU3DEcC4WCBQdO99nULsCbKv7Bwl3ywxKqiMi7sXYoxSqxgq1RTxUCFkdAt3
 de5u5Nj/m2TzJTmt3NVrHkw+f7Sfi6v1NRhRSkKyN0vpkraGLZy7HWb+s77oyBzQppS+U1KGzs
 QAAAA==
X-Change-ID: 20261113-qn10-29181ac11481
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=O21hWmF3JdxBvxYQdqKe0pInn2b0anFSnwH0bvKSzcs=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBq+n0xpa+l4miB9Ynnm+C0u7F5g+uCEFiffNX4T
 tU9TEWqvsGJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCavp9MRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcV99BAAp92sYWEGlxRLgGrMAGyEfrGMLjrC4w+PZtXvHMU
 s7o0tM8L3YE4czCgSObNQHXRnRBjxE7/hZ3gkToACaA0hPwtOzz7b1+JCnHkkS+ewcE9gUcMpYj
 LPo5PE41oNKcj1HQt8khDylArZeiUqgw8NFQPZA9pJZcNHnabls2KjoK7CCcZBk+a156JH7POe0
 oqSqn0GHikA78joC97xTMxeqoErYVUcbwian7shJDXLjsPLYv+vuPQ9bwolyi45uss4yrpKa2Ll
 Wasp25PmnOaRiT7CyJld2+nND0jMW2aqPcwyygLMq92bJttppAyUENxmJzI2a7d9Mj51X0YRTZS
 HMdzyC1vDydlJ4oq+KzTJtrGAuDA+DOLBiBp+mKOxCIeOb09hyxTXhZWQBOdp3/eX4a3Im+9qRg
 W5gx4u5eN/1qP+ykDkkXBUhFKY17eH/hWgfFgL5uTw+X3ONU+uVXr9KJrJp+2ZYcxP8njXm5FOL
 meHpH6pA+tbVrYR6pvcRGTeSF9JVauhXfwIPvtdomcbK7nST8ztCL8XpFYX+qXUGbTvTfgfrpcg
 3z7ABssEYmXnREOnvlNnfuw6RdTCzHL6Ue7xW+9JOxzL71iw+t2Z4pmqC/V74E/nMSvw4dUgOr3
 Z6TEer5b2L5+3e7juyFLhuKDIH64j2JP8t07fk2XbL/E=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfX5ERYV3smcgom
 SCFCDbesGdGzSvLgFb9jC6wKzDWaID8sfZaIUNZ33iwF67Wx2R60Dyfx8IXiEGMtHbpSdCNY0X8
 xs7Br907pcSm1gQgdKDkTu2hQ8WDzDw=
X-Proofpoint-ORIG-GUID: _cx_JK9B3yp67Y3aR2m_47QGUilAewBT
X-Proofpoint-GUID: _cx_JK9B3yp67Y3aR2m_47QGUilAewBT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfX2TzixvaZVytA
 ZNdES9iO7muHNdOVlXx0LAmmuHLehuxKo6ZO2k34Wbr/tuo7EQO3dhOnZVdIjehA+9jQCGPDXkr
 pHTMLOMHOy6u38KLjjSRIU/slXpii802VxmnSSGM8Zhe84WeJZ3hSmBPCqrgCCuAuyku+0UFmYm
 GirzhezGuwfAhLACCXkQ+rrksQVBLRThl0M/gm2MXxZvEvVO1BFLG1IKZmKOgycq2I+Awwqka5+
 3NnisitH4Vv5bDEOIowIGy/Qn7+Ns4IktswRG09766EieXKkaIcqIeqF2XJXzG+Huux4M02wSxF
 V3ccYUJDsdhGlB2hIZHGiiPkdfJf1i+Sq/9c4Yyi2m1Y6eV4UwTxLGBC9BcC7kzfvZ86ppNcfFk
 Hh9yBEdhIBpaE9G6J/++ZHokeLXhKtcCOWTtiLaJkhv7JMNKsLEiPscHLnn9LdrSiHNMYB+nQXV
 YFII0C8XQ/hggfj9kCA==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afa7d34 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=ocDxE02YPJZ25pTkHFQA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160014

Introduce the ASUS Ascent QN10 compact desktop computer.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Move the RPMH regulator override below the SOCCP remoteproc node.
- Sort the GMU and GPU node overrides by label.
- Drop the unused EC interrupt pinctrl state.
- Link to v1: https://patch.msgid.link/20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com

---
Bjorn Andersson (3):
      dt-bindings: arm: qcom: Add ASUS Ascent QN10
      arm64: dts: qcom: glymur: Add ASUS Ascent QN10
      firmware: qcom: Allow QSEECOM on ASUS Ascent QN10

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/glymur-asus-ascent-qn10.dts      | 664 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |   1 +
 4 files changed, 667 insertions(+)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261113-qn10-29181ac11481

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

