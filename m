Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470593;
	b=scaRk1REIj+U9BTqC0fxi+o/sToLhzdy10fmTeEd7GXlZ3E4/zY/n/M8V3M2PI8KFg7l
	 0pVSiaXFWW6FLmo8YFqkNvHcU1VGFd6J6ZRnvCHXB0W9NMzghMr8C7ytDA+i+C4JA45Nf
	 TYfR+lZwDDJ0AlkxyFTxZzyrpdmE6NB/sihAk8iyW8dVdTETS2uA9rgeBaVfyUSjHqeMV
	 TGCRIlYCWi+sHsnNLalgvjSEw68ktK122lE/O2MJ6o58rMbSdUZ5UUqPqJyDIlcBbVzli
	 eCp5GVHXx+a90Dn+gx2q/j3tAkLSPV6M6RjDpX0Rpm7fQ+kfBmlj5vEfEz4phEE5ksw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6LHT2Pk6v42iV77ZEgGM7n8Jd/aV4EqjkqJEp8A1OOw=;
	b=HrhsYsjVWT8Te+vAnswVkS0O5u6oYJiJl75HuaPoaLZFKUOkBKAQVsPXCltki42kKMI9
	 oLzyKPy6532PSFhyLMSmLFm/piug6OPC3sAVij7VjpPQZ6sGwowIkPdqO432L1FTw2J8Z
	 ZE9avZx4H77BUBfOoMzvaZBFA3XmdDBYvhz/1XSYkoE0fEhRNm56kvNcc8MaMlFWFpmP5
	 vkvqhk4BQrxyOF1WkcqoUeTxYM75xP4l32cNspkzo2HmXbfagDWPADPyv5JkZ5ixK7J8G
	 bV60zt/DKEGnPyfdpHCwQJaOxdyNFnqPZf9+b3fw6YrKp+VZXBhtphCw9yQKnFdlbEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdL0wFRf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MEh8W/pt";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5172B606A32E
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5172B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdL0wFRf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MEh8W/pt
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZfrY4149469
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6LHT2Pk6v42iV77ZEgGM7n8Jd/aV4EqjkqJEp8A1OOw=; b=jdL0wFRf6Hn5LMZV
	c4Wyu0uf4e9YIuxbbm7EDDu3gx7zdl+gkN0koMGuC23/o5U7BcLiaHSg5Gc+dtGc
	1STEW98k27ENuOfBB4eOU5QRkmg/toHbxU2Udzdo5CZQomaVGuFTg8KYuMqvB6yP
	bdIxLNEuIfYnNMeo1JTnchAvwRV7V3DU8+TjSIQbNKTc69bRQ+xkWpfYorLXhG2D
	VzWSytzwBtpob+RExPk4ZKRNk/TnJI6AH4aNpKjpLNCwPmO9v64nTtA0fGZRSgzq
	CiH7106sN+CirtjDYZrI3WEM5if7Pw18yH4AUajGA5P2CTk9b4IwKfIcanVdM4sz
	DoHRuQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc62e9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:03:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0f667a666so5588911a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 00:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794470590; x=1795075390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LHT2Pk6v42iV77ZEgGM7n8Jd/aV4EqjkqJEp8A1OOw=;
        b=MEh8W/ptjPqxuHU01Kygo1uQKHPf5MZYaGLKkZAXzVZPbzPQrWu4TDRFocm99wFfpi
         45mjuILxuwInEPU5Rsr/taMbaj4/imLUCna57z1htU3zaqsPl06LvSFyM5k/u+TWIhxM
         sc4LMQq0LaJsn5fsXpv8PufgQOG6HY/om8jt5klMo2NJy04cWRh9nUJCVybk6IAGvdBk
         cXbieDNuvhBIS5tgJh/5k6Y/7CbGPVLY2UBL+NTlkY7It45GC6kKAbnrfp8Yq2BZwcZj
         O25JlH9DjH8S3PgEeNe//KJXrBv1XmkDRdQRail10+bRdWBU3PIe/F5biKiLNMewPSph
         mJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470590; x=1795075390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LHT2Pk6v42iV77ZEgGM7n8Jd/aV4EqjkqJEp8A1OOw=;
        b=SNDDG84yOm9eTTRUCJ6u2Nho3NyI7HNJufPL4o7+MXzEuaIb69YYLpDB8CI34A6nAc
         zAx9nOhDe/3yAX6PDrNxzL042qRRxOXR/UjhNtUWA7kJSTnQlkbpeS/W9f34vDhdM8DJ
         rmCcC+77iMJhs0FVThmZVckeB6W74RJtsZCsB08iIVw3wAYEK0bWCKcYLlzyU2flULTz
         2kuJYtCCuZRzyur1K5vgnW5pN6vtdf5USYYJY3bBvO/AQT3CjiiSV5Mdg7J7VBn3sje7
         JG5KuXOvLW9lnyqjEEniVQVl5BPnPR5sddDntMtFVwci2vn1dOkkiY81zgAncx92IgW5
         6BKw==
X-Gm-Message-State: APuU4Z/UvHORTGqEl+1DtWyOL8dPnAe8F+fPCpcD6FnhBif9FKmlokVE
	ZtwFrLMmQV6ZLERtqgTHED2lefpqdaTFEpmmds68l7voR/JjYk9tw1C0pz0WYT8IetHYVzKegtz
	XKEUYeM7oqax1RK4RRpK+GHF938LGbCpdkTBCYDXU1uDOru/qWyf60ZNnYJy2rQizUjSh
X-Gm-Gg: AYBFou1PMf6TIRBUzej59sjWzaDDnjLLvUiynzaVPdeTy54Au1PEeE0KqpfOkgpU3N/
	FkOfEimQnt+8W11/wquLo9qzgn2xTpweWzPuLEV7lNTawz7aypnHLuO+rcKt/J2iIN/SjdlRhJX
	EL/30kA0kvIPbuIClG67srzZwELRvr38TOA+g5aDF2VMC6+WIvns7hfewZrMlLSG1nEkgWIB2kY
	b+rxrtZlPT08R+BfcJQMLsUzvTBmUHvG5qmNpKKboUJ3wPYoDfNN2aGRaeNdwIY0/PcYwN4erLB
	39se5A3/eivQJSpUECWotpEVL7ZWFh6myKDdF/RT8KDkGLacWAPxeot3w6fj6Kz8cT1YqTnCIKq
	Qm3Dwe5BdAIGnEHYe6eE1urGcdhR14e7TEH+OK8iB8QbpfeX7vaJOTdOPCTMBYNXkws9JhUAfPa
	if52NwB9sj
X-Received: by 2002:a17:90b:4ac3:b0:3a4:f8da:2478 with SMTP id 98e67ed59e1d1-3b182ebe947mr5019667a91.29.1794470590185;
        Thu, 12 Nov 2026 00:03:10 -0800 (PST)
X-Received: by 2002:a17:90b:4ac3:b0:3a4:f8da:2478 with SMTP id 98e67ed59e1d1-3b182ebe947mr5019636a91.29.1794470589637;
        Thu, 12 Nov 2026 00:03:09 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e3a74asm3722251a91.4.2026.11.12.00.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:03:09 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 13:32:51 +0530
Subject: [PATCH v4 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
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
Message-Id: <20261112-nord-soccp-dt-v4-2-af6e44e9f397@oss.qualcomm.com>
References: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
In-Reply-To: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: TKhnYCYz1piv7xjO31-avChC_rY7ChSs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfX0zMEwDyQzs7+
 siy4cknId1oj9l6P/i34+tPi8e3Gb7lkdWd0LbzcBWYg1jkF3AB+eobBTQwHMz7F5Nni1pL8cRL
 NHXyU4r4IXVWORcAha5eHLodcx2ROiKZcsk0T6xc/GK1vqx0xiyP/oAsUOAGxxmAAPmCQQoFmlT
 euz/THVsA3YjauodaTi/o3sRmXghFGMAxWNOH76miqVbQmfXRuCoSZAJtODUo9f0dtfNgmFMKEq
 q2a/+SevamsayM6WUJO6EBoWDXwyBXOjsrdQQWtlUodcj7Da0kvPl5nPfqOIEpdZ2zMY8ETK54j
 gdfMawXGnWFXRWzkel4H6bTisl8bgJKCF+/9diU8czatFh77JktES+e8nEularFfeWJN72wgrtR
 QP1gkeahttB/ayyXvMbaO1Gzt5Hh2PvG4f4ExRiPtAxZNYuSb7xm/P8N8Y4/GXXGkJvnnmc4CED
 mywuergVrZQuN1HkhWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfX+IesgQmXvP9R
 CNQDyf804VYP6DA2J0LEUJYNVpUIWPoh3w44uVJusTEhRBNdG8F1tl5hvsJRJkp3LXOBCYEjnAi
 IY9dJXVmkKEARGxvQfz6P8RAATVPtK4=
X-Proofpoint-GUID: TKhnYCYz1piv7xjO31-avChC_rY7ChSs
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af572bf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qVuS7nBUJV19qhEaXjMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120031

Add the SoCCP remoteproc node with its firmware path on the Nord
RRD board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..6bed47b8c913 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -430,6 +430,10 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &spi16 {
 	status = "okay";
 };

-- 
2.43.0

