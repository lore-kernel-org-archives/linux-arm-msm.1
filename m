Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194045;
	b=uSHKBApeYe8uRx4F2eIDd26xYuOOO3pIa0yUB7XmFA0pIhpVDmpVB0rOKyNMJBbdOkAm
	 TcKPcvXJXlX5UDcwAxH0X5rRyqSi5is64/P3+E/ptN1RB8Tpi/EScmsZSOzI2bxTjVFjm
	 7copDDu9sEWZwLqcf5LyTJbvmtbgU7HcEswjbWLKuRrOcWHv87Xy0euVkF5+pjvnS6RdG
	 pFTDoNv8x7KtFL/Y559x9qQ4/hs+RzWS7+13AXNHSaW6ocdFB6UzSP9VIIkKRz7xDdqxt
	 d5XplxDOfARTgfSA20Xj6W4dzUw5xVPMzkm5XEu09v3f6c4oPZYKgJMUGksBj0fMXVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194045;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+mVvp7TjbMKQWDHg7IqBJlBTx3ZQ6XoSxRPaCYFhPkw=;
	b=5onAvIpLwNMTF4J0NJ+/Ar2efL2toqVCztRL5ybgbsWChJnpgYcrKb1Y7CxiS3gZkuJN
	 bcOHaVEFmVk+ZZrN5j7AZz53MXReWbg9c83ZhqVPbcMnIZSd3W8kMwS32fa91Hs7vJqsi
	 HdvffSpBlNX070YrSQSTej6fSyW5IKMeXnarLvyVGaGQYO6Esv+lW199e1O9STI19izbD
	 PVfdFtRVAtBpYydO8H3aaJgzL0hWGBgK3JiugDIjcplCFi2tlr/JrHxPKRNiWQVqSDIJW
	 XBf2ABMqV7cRel1w3fHmMl+SzsYwm33SpBosO8lRxayPCfg5uAq3FF2cSDkzQNmp70g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1l09Ix2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Er0SBlZ5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB9D606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB9D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1l09Ix2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Er0SBlZ5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe6SH137919
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+mVvp7TjbMKQWDHg7IqBJlBTx3ZQ6XoSxRPaCYFhPkw=; b=a1l09Ix2BCcHKKKZ
	fGLBdzeI4THVJWj8zMXDns9+h457BVMzP063mYKfUi2e4qQdrdTNmSn1r5sTI7Ls
	Tw5Ja+63kly6j/NeA23Qg8wsZeLUjpT7m+LkNYWz6cZklBO6T/wOGjMtQNAybUmH
	3VwafKKTZ7CbGhcY/1eZhv9QQZh1rIefZyAGZyXuR3SfX7ml6j2KeMM/SFSS+d32
	8q5AtVgI021rI9d2pC9gW6mZlzmH+Vfan1kqRYN2IRTMfQoi3wCvvmtBG1C118fd
	npVRNI+WseHZgqa5jP5+j+P2BMWMDpPzxtCDjp4JxK6TvTopn10GUTxrTPByalPq
	Phqftw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f92m59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:27:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso171513085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793194043; x=1793798843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+mVvp7TjbMKQWDHg7IqBJlBTx3ZQ6XoSxRPaCYFhPkw=;
        b=Er0SBlZ59z6qbciRcWPXsOMYAey8/finMAPhax7kY4vnYn4aPuRhj5ffQjw16FJvO+
         5d99QwAalDGCIm9gLCu9G74JBf+ub0LPEe/15XfjZjD3EOVw7e0xwDGwsIXr/ygsUQPZ
         XwQPtvdZmgcFN0agIp4l061nYee8KMRTTPpYDArgezJwOo8Iskl93IHJ+7GsBZolsDqx
         hm0IXz+BKZBeFpg7UZCUMUtRVZEvLA3iLNbZ0foHtYjkaFfbf2hr8xjpiGVkkGYxwO6t
         M4Ye7bajeHhVREbukdnGsHnW9jpEVa/r8i4pXSGkfRvuS8mVYjSJIcI4xmH04TtyfRPD
         t3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194043; x=1793798843;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mVvp7TjbMKQWDHg7IqBJlBTx3ZQ6XoSxRPaCYFhPkw=;
        b=A4k0K3TKiGlvmBtl421YiNdCHa3TTJNNQ8gX5mLhqpwpyZfira/xxr6TcvFdQTOFb/
         bbGu8qBz2bleXlQ8jMlPMWhm4qvnukiZ44sa2QzlljZbnhrBXW3Q0dcVk+IiHWQQcL0E
         dhBzCWTLW8H4fmNvDKtBE6RPa6IKLPrqbu3BkMlUfO7sx5SWu8h6nE1DAyjvicFa6ulK
         dV12A5Khpk+mGG0NrUPRzheEKvNVbjhaFGuULquEm3AXgOQSwohdu8CefWknaZIdfXy8
         VFO6W7AJIcH3RLlnFJ2tE60wn8bj1YjnG2YMNNOAmTBaw5UpI6pKvJzNY6UJXEvF7O8k
         b+Nw==
X-Forwarded-Encrypted: i=1; AKwUvBzuW1+8Z18StDC3ZYYsWiUZJCtQvSsrP9BRLUxv0mQmGsCjGpzfEOG8R5bYUEvChF/Jsu+Tb7RVydU7QqYd@vger.kernel.org
X-Gm-Message-State: AFq9FYJNwVBpCXapIbQ03A9fcPDBjO/oKXAOele6seiiXe8i1XVdDUR8
	45bVR58Ze/BL0okv34GpkI02hs0hcvMST0TdWPpaqg6qCUVT263ldvc+LXrDsh7l7T9bhQN9SmF
	jCC8lAbGaBnvoYXv5oVSNUywpCs8Q8155SdVUb+3a4xfwyFDKQ3AQL2cxzRmBvKQJi9dG
X-Gm-Gg: AYBFou2/uvpMe8HToQI0MMRUtooNzeIlKzX0hmVsw7MBJFU3I5sdgiIfSA10rhnX3br
	TxkOtk2QhS9sq0bEscxkWvxdkwf04rtfFXg/oms7uhKmn274j8rqu8GVfawdb6n283Ws5XOKIQY
	7afqrdpKYAqVvEftgkHJhJ8UNA81px8a/iibqW4tCL+zi3/i2hCob6sISsVR9fZofcrkXaWNUTP
	sbYAcId9N26ibDH2iVWa4lyaqJJ8GTeYGI82/MEIyeI3L93zrBmwpX24ifmfETNa4Ujh+8IFlsM
	POAFaqHsupYIxP2EDf+9b1tVLRu14oIDG65S3Frw5WFMQgr+gXFYnBlE/4kc+X47Y1pXXcB69JL
	d+AWf6TdehOx5SDFddyxnCQGwd4nNEMsv/V2kNlCt/FkYJLkI5fpwRPverjBnVdJs0GTa7pSzP9
	0aQ/r5Kg==
X-Received: by 2002:a05:620a:6ccd:b0:93f:3219:835f with SMTP id af79cd13be357-94408d6566fmr316577185a.81.1793194042772;
        Wed, 28 Oct 2026 06:27:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccd:b0:93f:3219:835f with SMTP id af79cd13be357-94408d6566fmr316573185a.81.1793194042330;
        Wed, 28 Oct 2026 06:27:22 -0700 (PDT)
Received: from t14s-gen7.fritz.box ([2a0d:3344:53ef:7b00:6223:3974:4196:280e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94fce50a8sm37133035e9.4.2026.10.28.06.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:27:21 -0700 (PDT)
From: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
To: Luke Macken <luke@phorex.org>
Cc: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add Elan touchpad at 0x15
Date: Wed, 28 Oct 2026 14:27:05 +0100
Message-ID: <20261028132710.10051-1-lukas.maerdian@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014234949.1730808-1-luke@phorex.org>
References: <20261014234949.1730808-1-luke@phorex.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1f83b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=meHnPOM5Jtsmck6FLoIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX1Q2H/w+1Eshw
 Px/tMnlQRVQAiqF61WXY9YfuxoZ3k92qSDLbYRTJlEMhzdi1FNJK+pMD1bkTYxaE5DRB2kZKXmc
 VHvwu3JDLbRRc0uVAaeVH7Xauvzkim8=
X-Proofpoint-GUID: ivyu7U7y9SlPSEpT7cgjqEo1r3jpjHoj
X-Proofpoint-ORIG-GUID: ivyu7U7y9SlPSEpT7cgjqEo1r3jpjHoj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfXxaBWkVOOxgGw
 GlCIO45Lh2lddgQVBaB2705iiMqN7eiOfoK53iM7o3wIp9EY5S1QvtSoATKbn4PfPA2ivMYw1W1
 I2l8TppHCskZrM1BaPaLNgLs8qz+lEEv9IYBa+f1pBEeHOLXtmB7Qsm5d04SgvHnTpRuhIBMlV0
 L11u1Xws8Kv+rwBCO0OoK6SybVdO+BJDCUsZCtVJ+0diI/v5aWl0ccM+pCd338lnD9oz8zJ1Imp
 9ojD69/06kQFQ5RV/XvGrXF7i+4/GJmc/4B5D4QjSsI8YTqT3D1kVOKqi2Cr67QnUnNQSXMRfHR
 cMMrtD9kcnCq3PvQEz9JQ+My0dO+4P2RvBS/ZSBo7DE6Lt7VunNBL1zigj3C7WXAE0IYgn45OjW
 WSK6O5bYL/llj3iZ7CdhGWfFvAIKc2EIjVog2Dc6kdv713Y4pLKH6W0pB1YQbVcms7Nbp3KMIhc
 DCnNjOXp3HG3RUEwIWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280053

On 2026-10-14 23:49 UTC, Luke Macken wrote:
> Like the T14s Gen 6, the Gen 7 ships with either a Synaptics touchpad at
> I2C address 0x2c or an Elan one at 0x15.

Tested on a ThinkPad T14s Gen 7 (22A8S0070B, BIOS N4PET33W 1.14) with
the Elan touchpad (04F3:3327): it binds to hid-multitouch, touchpad@2c
fails probe silently, and no pinctrl conflict is reported for GPIO 3.

Tested-by: Lukas Märdian <lukas.maerdian@oss.qualcomm.com>
