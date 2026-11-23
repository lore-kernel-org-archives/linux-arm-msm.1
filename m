Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442188;
	b=A5cOy4qS73H52b8fiErnXdkNQ3kRr+5B8853d/Ep+76q8XmB0nVu0SzAY5C4QhQAOnaQ
	 CZ7Uqb1WZ+PuIDeNFOJXTJBbUKV3lwQq1dAvyIoWjtZvdhBJjAS8oc8Czd6VQ/vlg0ROk
	 6OwxSPHN59XcUwuPOC+vfftdsm1HKLUdGSgXuQ3oKwkW2hLQ+RQq99jLzIfSbz4sXnA4z
	 6nLlUFL27lGaOOZzwXJ6uQtrkC1AgbBCbaDDTuK/L1wB3S87/vvYEoa2KUghuXMMFGVT6
	 i0MG0VX256Q817m0p6ZDZMUL5xpwI6sP5yTJJz1FNN0UVbeptab7C5eB3o04/jFozCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442188;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
	b=zY2gGI3518+dKMY+nU57LmJXEfTiuX/JN3ktHzZcBbQNEBml6zpj3+MSGLz79UrcHvsi
	 jm22X/lCMYLyhVdNnc62diMn0B3U3z7M1P9aWgpmhEwkifhPgRXbN6Hs+pZXWP/6nGO/P
	 O3gewpgzYtjw0LPFFj1a2iOeUlXy+iDu6SEhbAUtwFtxuwFtC1WPE9tVQagkDd31Ta8YU
	 ZqVn1qGfga2FPc/YPfoi7gKHOhTF+BuOvHZ09CP0CF22L9cA3x0WwtjPdtEjFMVFmssFY
	 BXTsrUlbfQGiYHg0tHP93mfkR9dUYxgwahUyuIQ/lijncoEI8YZDo6q0/TIqt21n17w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=abTfYYKd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DmpkH3NC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D8B60A380E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98D8B60A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=abTfYYKd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DmpkH3NC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLEEL4030390
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=; b=abTfYYKdVVxr89hG
	gG7xas1cvb2O9ZkTi3giz7uXwF+Wl/+Sa0ez4lSmOqUee6+Ouh+3ZhMPOYSoFL5H
	NnZTTBtSE15Gxh6LGjXJDDTw7TF5FNfsXC/Uy3ufbPn/PZ6bqQiXyoFqCeJDo44M
	4GJVH05GJvJS0KACNC4YSisoic9I2dpZKVEsxEiMztK3gNtCHXhELui7pQzOuLNI
	A4wnVzBtjZQnOMF4F18mDhRPKtbEMqS6rvmellhk6GMgL4qZmNz5HQphOUUd+IbY
	+S6cp1fIcIG9Gm8UembnMBIog2Kz+J4gLllY7nVXw6xBEtRxGLm3sAlfkS6OxGVN
	RMDvww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evshv8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:56:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so507609285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795442186; x=1796046986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
        b=DmpkH3NCBuuRUnlyNwToYClpWU8Fij3c4cxS9TEoMctX6+TJPycE368lwVpDZS++IL
         lTuPhzwR71zgAE+NMzHh9utJh265CjYOqTjCOVgahIuoQkltX7BZBZzCrGJK3RePKr1i
         f9/05QAV6CKVAcQjygXZr3rBqd5k9V4cFSHOys6G33G/nMiHrwfM6SZSQb0oPiH6PPxB
         El7PslY+/s95FZlEYR+cW/asEj8VqS38D69+UJbLluh6uiyQJwFJJmwmm27HZ4jZ7pGl
         1h3ykO3MQGBmaPszg2wavS0j3u6Dj7Nz6otnSW3GYfo+ntw1Or0Z8JeU8Huv1oEgET98
         vTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442186; x=1796046986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
        b=qlcnyYGuqcdMLQZF5FIYFA2jZwqesfwkxuNhUAs+Ga6wHLwi2OIdFQqfYNa7apMGh8
         6jwh1cqWPDoWttGmqpAlPOUIY5/TimMNmD1VGrvIJ9xttJhDXhvhFhOmZ2Pav6Uxs4dg
         Yqzzm9/73HGKtrkoQ+zjKFf/qCv8TX9vZ/0bTOJafhQ8yeSBM/VdvHRUi4NIUex78DkP
         Krq/1D2H2eQbNbmoGXTSCxWLXV3RJXAkyV1PLbbzn9An/EvILq02KTQJfM/0wHd5lExd
         P+sLX9fK+ooiiqaOWKNkeomjzxBaJzxEV+sYnx6QsigHn68GRWlizncbgSGbwq42LPnD
         0RIg==
X-Forwarded-Encrypted: i=1; AL+hErFMF9unVOzv+OX/c+jbLIv5i5i3MyH3yLfs7bsasEFMHOo65zNK5C5NdbyuXCqPW6EeSWbUSzVdS4rJEUXE@vger.kernel.org
X-Gm-Message-State: APuU4Z/PlIxhxxOVTWYr9b+11D46s/TfgZZRB5DLqkev8RSt0FcL7tUD
	8AcTppzL2V/XFDPkY2UhOha43Uf05Ixs1WgNB9NjzItC3eS/reAjd27uOrxJl+WgbUTENUGwgzl
	EB+AEYIUSrmJ4+7LHqsgpNhy5I0g2YuPUJ6bGYaV4i1cRjxJd6Bo6quWSjuPrLsRySSn4
X-Gm-Gg: AZFdTZccizSQCiZNetJ3RtjeE1Nyzss0Paeq50rWx+Gd0BTjFjaHEo2PYLXYWWScj/Z
	oA/dCauP380jLmyi05uvQooWCaIgMn4OXZ9r7xdj8pIbsi7ZmjijFriDY/yIbge14vfsLPBaNfS
	RHe1cF6lIL6Z8I1rjJxhPcSTE7NbrIihhQVBgTVh9waZUr33ydsrP+/eyhXREHyynXOTicm/sNk
	KpJ3xHDngaAFvSGS97304KgzGnw3S4jPW+ED6VdXnH5fS1MIoEsYusfBUdVBv7n2kkVE6SRBFgc
	BghbQznyr5YSSUF9/ZmZuCwb/RqN8YRJZKh+BfojPH6WRRUVx1K1jWB+zJy2BXwWQ/phquTmxxo
	MycO9KQYfvXDf4dkDED2VtqiAWffKLY4JJ/hGghPPoQ/CVcjcIhEjBgtXmvnrNGGcuJVpnPjztU
	5Qq6DJpI94D+wrJZcVogn1O5W5CTuJL3X2zbo4/Qu9pDpNNMOHMo+EVpVjN+XOzUGhdzdSjV11c
	rcbgYWTMud4caItXPNjAgT2bKch
X-Received: by 2002:a05:620a:4688:b0:949:b7e9:5d18 with SMTP id af79cd13be357-949ba9c4c88mr2022362385a.16.1795442185739;
        Mon, 23 Nov 2026 05:56:25 -0800 (PST)
X-Received: by 2002:a05:620a:4688:b0:949:b7e9:5d18 with SMTP id af79cd13be357-949ba9c4c88mr2022355285a.16.1795442185001;
        Mon, 23 Nov 2026 05:56:25 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm21724625f8f.56.2026.11.23.05.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:56:24 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:56:14 +0100
Subject: [PATCH v9 7/8] dt-bindings: connector: pcie-m2-e: Add vendor LGA
 connector compatible
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
Message-Id: <20261123-monza-wireless-v9-7-450d7d764aea@oss.qualcomm.com>
References: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b04460a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: FGxVPyQVk4eAwg6W4V34WOxEaciqU7WH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX2z7TllkJ38Ol
 CzE4X14ssjBSUe31xuESAdgnQVvp53Ki2S8YH36V1yAb/5uI6c2q1HLk85cEATlvJwAzz9A4UKf
 g5PW2SsHKeo5TO4+xr39X6mO3Ja9T/LIPUonPU4KFyYsBhTW/JR5uI2oilVQ2bjSsgMy8Msy1LQ
 6FO8WrX8tEfdDsUKwpo4mTCFu99JVoehIk0HZXbsa1CTEWhGOJsJn/2qbXE+jKCOZ/35gv8N7no
 RZbDTk5nf4DexHwV6FuNJYcvnbLjJzm5tQ3ZAZDVW9vbBxkSQreP839MPvqmbR7xFfrzR0IiWYh
 dmPVErpd2Y7LpfHFiNme8esTFYJa57W8pn/jIKjxtw0865W4AS8cVCip2LqMs8w7RzpsqDbPXEZ
 YWpenEZ1tkHo0Xmfn5wllm5vFlKxF1hzNx6xVnVCWH73Hi3ALkG9sTxWdFwQKIXFhKs7CFkg2Wn
 j0XY70+nTOXO1N5YYMQ==
X-Proofpoint-GUID: FGxVPyQVk4eAwg6W4V34WOxEaciqU7WH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX6yVh63hQ6uqA
 Q+jWc8bjhtb7WlqIO1sQkHhh3+paEZDI58B8JkTjJTkpq2XH+34HLfCrZZ/8d+xJmCJEFxAc4Bv
 d/KUsIgG29ipr9gs2wVsERT7dqq8Oww=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230055

Some modules (e.g. the Qualcomm QCA2066/QCNFA765) expose the same M.2
Key E interface signals but are physically soldered as an LGA package
rather than plugged into a real M.2 Key E connector socket. Such designs
are not actual M.2 Key E connectors, so describe them with a dedicated
vendor-specific compatible while keeping "pcie-m2-e-connector" as a
fallback for the shared signal semantics.

Add "qcom,pcie-m2-1418-lga-connector" for the M.2 LGA 1418 found on
Arduino Ventuno Q (Monaco Monza).

Add "qcom,pcie-m2-1620-lga-connector" for the M.2 LGA 1620 found on
The Lenovo Thinkpad T14s.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/connector/pcie-m2-e-connector.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
index f7859aa9b63469cb43919c0b5719c18694c5364d..ce6173a0ec41cfe8ab4a5780940999c18674ab7e 100644
--- a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
@@ -17,7 +17,13 @@ description:
 
 properties:
   compatible:
-    const: pcie-m2-e-connector
+    oneOf:
+      - const: pcie-m2-e-connector
+      - items:
+          - enum:
+              - qcom,pcie-m2-1418-lga-connector
+              - qcom,pcie-m2-1620-lga-connector
+          - const: pcie-m2-e-connector
 
   vpcie3v3-supply:
     description: A phandle to the regulator for 3.3v supply.

-- 
2.34.1

