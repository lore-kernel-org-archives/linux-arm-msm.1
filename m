Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779756;
	b=LYi3/0KsFL4IqAdjyjLqpx2OHO0n57byzzetsRc4uMX7OPC/DNuWTYUdQeXp/ydFBxdR
	 aXOc7Lzez1I83BU5wlB/HOafM3LAzfYJLUWr82mN2ShzuE+j47p0qxryfxzg3GLncLE7G
	 ZtfglIw6pWQuh7P7yLP4lQvlC2YjrraoHv3UcVxcKyqBai0/fJRTtfDRfik/zTqN9HSx+
	 qJpxcTQ5p0k8VkkjVr6WHEYJFsMyi6e8F6ODTh6l6qW+Kw9IlT2RY+vRitEwk4xeZkJD8
	 xMuM/EcJ5h8Jw0WnIoIo6P5IphcA4n8HGkSQh1Bs73/rj2MQ6sRUApNkUnzhO39JWNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779756;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NyDUwgrh6wWbTckiN+W3o/gquXyln8i4quGDrjK+rpw=;
	b=mR26SY3USSjP+ef/s9rnI36K8kTtMVKFZCGF1WjmfBP09MYQswpG7R6FBa5UFBU9nvAY
	 n17r2z187qV4FnxNlh/MIwjO7oXcLSQUC4eC2I89DdjJf5z+0GpyVaKLdJhIhg9te6Y/1
	 6rJC+L30s5n54zE4VO+EqeJmXJ5P0i/gXUwYSd9qOer/RMvlRR69FTq7vsSbnF6hBIZwD
	 46DENhl19F8WQllAg+ZSRZ5biov/E2iJ+AxEm8E7zB7qkubThNC5MpZcU46PB7Bo2WW74
	 jWpyXWAbisU1RG9UK7CcekDFWqoV+HAT/qoOPDzSWHCwY23lH0IfcG8h4pR2n7kZSww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z7cl/HqJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJdW2Dau;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794CB606A324
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 794CB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7cl/HqJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJdW2Dau
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAsOXC3610500
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NyDUwgrh6wWbTckiN+W3o/
	gquXyln8i4quGDrjK+rpw=; b=Z7cl/HqJCSj8mduH7FEaRvabZFow0DwkuHHlFM
	Y1HTH92Y2f8dWljTKMZdM85PZqr9NzRL4y/4I1dAbCZSftgz1Okll7kZ2YpJTk6V
	xnr7lOznw/qUiiD2EK4nazWGiSfVUIMKQGZlseipztNWCkSQoXJYTicPgmh62dzD
	wSwbcM7RfoSNob+JeC9sqRP93XHlpUs4X+TrniKWrC85pSiCiKjBPa/I06//1W9e
	ZsY9q/ZxWG5Fkihoprslzzwngxc3/TU/Gs9ujo0FK8TjlOTVM92gZ1NgZdKrC3mS
	3wsqud8j18MaLe6HonMQF1TqkMeR4d9mHhyjuS09wYspUqzg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh9f3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:42:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so1384218485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779754; x=1796384554; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NyDUwgrh6wWbTckiN+W3o/gquXyln8i4quGDrjK+rpw=;
        b=iJdW2Dau1eHiyIzITJ7HUvaLcQ28wTyzNyE1D63lhphhNREEg2oc9nQwdqs1mDoTga
         gccZjtt0T42BhYTW37/sLPDr5vXet1YJNenuZP0gNQOHhw4BDHL6a+YUW3uytxdz81m9
         s++bVTeBzjfF4JDMGUEh3U1V/zTlAXhfEHNSaJjZAgr7KZS21ysGdkl84aDc73OzrXYj
         oEYmrXRXp+Pg6poS8WfEUba8K8Wc6bvt6ZhDlBl2dVagBKaL4N3opWF/cezo3UDdRj/E
         QXskifGj5ezGG+XgLFeWH267SlIaM5iPMN9LIq6QSeMJX1geRh9C2VMuoBX2fTa85YTg
         U0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779754; x=1796384554;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NyDUwgrh6wWbTckiN+W3o/gquXyln8i4quGDrjK+rpw=;
        b=M/HdzvAFrE3rpQmg3kMm7xmjI1iZxfLHmiovbU0AYJzPkYNvzPwTeZBfsPF/uEs050
         81umxJXkMPi2k8K/2IWpI43/QHClW1I/5cTXKBEhkt+l43hf1VhdywBBUghT06xoSXTi
         0ujpZCwSVdVmatj4xspOUfIP4ZHL8dlARnQsb210ea6GwdPTd5TXxNjDliVkJ32YyoK9
         jbXy8upp3PQJnn3ecxdEAbGTazeTXpHd11tamlb9pOrDEdIEhA99MMFP0x3pRLYms4qR
         d13IPFBrUTqq4+8z0Tb/XN0r2eeFtg6GdNHGjcmjXxnDbExwl/JiEUXLnqusVm5vxe1M
         6BJA==
X-Gm-Message-State: APuU4Z/iTfLOW7cRvLDFO3Fa0JaYt5nRs8L9Lzbl7KX8OK5DCaTQOsxC
	SsltNx0e1VA3BDdxynP4j7bd/e3vaQAm+F5Hvkh+NCsBnJxWykXLyvlnbng8bW9evu9zot/YWRa
	5SFFdtPa3488R8KSUVDiwraV3+a5/njpSvbTTA9OtIQLaisT0eaTHnnR2bhGmlnDb3TGs
X-Gm-Gg: AZFdTZfxnnBMFjGLq8h3Isdj+QXdW7Toj+D2hgxTjyzICCylz3j2/FYk42VZtvr0W/M
	apL8bydJxMa22FJ2ge02iN7u+i2ECnXJ2QPhvJMdvg9R7V2H8AfniUlu7fIDRx9MPjqqtyJjZNy
	EFtMB6+JZ6qRM2CzgzK2ayBRRKXuwBUVht5hI2QL7jucGopp6NtUc6nawamzIPwT/KvbUe+dngD
	RMjZ4sWkB0QS881IdYqcbThVPrR0oDemU3X0gr4NlWxQKX7Nt4AAWWgYbppc2ESemQnPPQoGJut
	gwE+lGwNWMqVuz09GCokX5ik6v/hIHsj3s99+YJvKIDKYd7s4zU8OecVmBYg+uFgz22Lz7wBpxt
	bBac7T4C4kpNR991ShsgXymXvbPLn/g28hp0hQS68H1BnvOyafbpYeJMWItayQYhPK+bLp5Q9+0
	rPLFepVXZ/8ZtKC2KakrpPXGASmTrQeT1E4FGFmmt444a6NjSMrsmNC5tRuxoepVw=
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr4265140285a.14.1795779753744;
        Fri, 27 Nov 2026 03:42:33 -0800 (PST)
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr4265136985a.14.1795779753306;
        Fri, 27 Nov 2026 03:42:33 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm56457254f8f.21.2026.11.27.03.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:42:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] interconnect: qcom: add interconnect drivers for
 Qualcomm Seca
Date: Fri, 27 Nov 2026 12:42:28 +0100
Message-Id: <20261127-seca-interconnects-v1-0-a31bf9b36ac4@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAKRsCWsC/x3MMQqAMAxA0atIZgtthVS9ijiUGjVLlEZEkN7d4
 viG/19QykwKY/NCppuVD6lwbQNpj7KR4aUavPXonA9GKUXDclFOhwilS00/OG8DIsbOQg3PTCs
 //3SaS/kAYkpvNGQAAAA=
X-Change-ID: 20261127-seca-interconnects-891207666a30
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T5L/ehKajD3lC8IkBxCGBFiU3AnyDbdankjiDTN/CUQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWynaNU4v9gsq42PA5w0vDEQ9Pux/2f/2KROY
 1Y4njgT/AGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawlspwAKCRAFnS7L/zaE
 w9jED/44rFltmRX3o1MM89yXJkc0vId5h6c56ucCmoOZc8fXZxq9v2dbxdYhF7TBEaT/R9yOpmu
 nj10ikKCqGJs/wD6SHZlf7QEr/viB9qTGrklYu5TVoRr18/EqdHxiFStFUm4Mro/MprTo67ngQl
 Obyjy59Ir41JmgXLDZ+0LoYNi6+ahFoQS54/KXWMAdI3MwFHsaCVtXwMDpeucSJOiBQ+JDLojzF
 k5zNR8h5uunisaHi/FfBPvUBSsgc+y7dodqK3+vl71RWLvyYq7qAbRqsFOQ822nT63aiU0lTS2I
 VqqqcSmy1SGn/Jqkv9/Pw1+HmUhG/YsSHPdsHwGamJWmWkMsDTU1noaDmcX15rqSfpqmBHtSRd5
 dCBVueY3m1FTfwRTw9UQFsRE/5Zn4y6oS/qSWt5xoP3whiPBUiBTYU6wi/efENORYfE+YaHFBKQ
 MDohUi0SIE6+n008gXszRiHSKKmlEF0OfPVeMzOV3djHoLFuiu5AwmweySE0vkYqsM1GFnytr2h
 eDvAxPCIPw055CdwPXgNh7qw2z0CL33zktKrbngnGlLtNsT3WIwPaB+ks1mjLYTvpXCGOitmJtQ
 86KyNaELdGt25Y2Uf88A38W69/i9Qm5pFEZrxUKCENFfVLdn6A0vPReghY9K3nFJAPeTwUcWfy2
 YGuUfJdxZ91+YrQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX5sXu1JqrjKwG
 qO5eBVMKo+p3EAY0rKHp06sN7LvGA7WYi8S0I4nZehOzr2VEaL4cqoH7FRdn4sAD9CkyM21MyB5
 1vN16NTlLEAxSa398HOB1BBSdX6aZnWo9tmcZ6AHDKGxyLUuGhTmyvQmA5ocG9txNbZpmHZrLr6
 OWz+VKUvZ4qO+QL/a/MFpz4BXZF64rGLnmFujROpwZot6PHosd8wZzB1Rz0SxzE3U1v8Z2dwKlx
 JSBlMcxvXzkcKxEglkMzpgCL34DptfkvRzCI2fz8EELXlcU+7KMQnIU+lgZ2AinGehXXflw6fvK
 9X4Q+ww/lWNe76jgDBULfAB8Zktl7Ei9gZHm754xjD/REiYDdcsqXS4nZxaSsdMf5XmkRVf8btw
 VV3ZfSKdeLjy2iEZ7bQE6D+RCNPC8lE8pKrH06EJk1AZQIlgNfgpNOB1MPOv3AssR2ncud5pixU
 PJrqIy3KR93XP6RTruw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX2DcPpXuUyhrM
 tJyHb9Qk2XE6QOv9A1/WEIkDd2NVQO/LbYzXE/VWwqhYXbXIi1ft3Fy+6a+z+QGpgDRmK0QiuFf
 HaFvwvhf7J8/zJjXb3kVoWb7YBtMjTI=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b096caa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=0vBr5WPP46mkPm4xHpsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: THXRHJ1rM3xOtRlmSfaH0_LeMZygP5TH
X-Proofpoint-ORIG-GUID: THXRHJ1rM3xOtRlmSfaH0_LeMZygP5TH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270046

Qualcomm Seca is an automotive SoC with 12 Oryon CPU cores that's a
slightly less powerful cousin of the Nord SoC.

Add the interconnect driver along with bindings documenting the hardware.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      dt-bindings: interconnect: qcom: document the RPMh Network-On-Chip interconnect for Seca
      interconnect: qcom: add the Seca interconnect provider driver

 .../bindings/interconnect/qcom,seca-rpmh.yaml      |  141 ++
 drivers/interconnect/qcom/Kconfig                  |   11 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/seca.c                   | 2335 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,seca-rpmh.h  |  191 ++
 5 files changed, 2680 insertions(+)
---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261127-seca-interconnects-891207666a30

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

