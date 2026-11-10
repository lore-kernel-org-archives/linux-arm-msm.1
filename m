Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280986;
	b=EmKA8DVQKh7hUlzfkxDd2oViz4I+HPmnejqcLE7a8ztaREZAQ/+JZwDfCgmqHEjlFESC
	 qf5D689xPzpAlhKU6mSwEa2o7bOFs17Q/I06rNJlf3pg2kVnxf+7CcvOpnG2MRO9IbJG8
	 FcCiXvg0PGjgWJs4nOlk1RQesxyzTbB5enxXl/nh8iIOQnIAPNh38j/L2pj5qPYUDbcJv
	 Jdq0rZjXKpAugqaR3nlLWyL0mNKlHx+wYPOIRqz+Oj6xCSbfvAZhdyJYyj0Qw4WR6Pg/h
	 rxB2RmNwtUP073/NDDBHXXgWqnfDbipRGAcheDkeQMSuBy0cPU1yFBf9gBBa/WpbwdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280986;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
	b=huF/pWK6wnw8PGV3veIRDMjv7/FFzARzIJneWIvEGRg7qVMSCLKXghlB2XIqPnaGry/k
	 40EB86aZku8oe7g2SduaE01FfOkir9VCaz1Izu5pIpXjxzcfu6C63WM26KLFPavN7CGBx
	 vq+IyVmo4SAMgf2pcpjaFcj3CLnYIOGtdbqSVsP8lDYWNr78Je9rzZKf+bwC4kWGGFD8R
	 15mdP59Zbf+WqTzUzkJddZCW4TYBBTacJLYW6uM/7TwxumrZ6mDjpjrbpg5/sE5pvZeXZ
	 99BWO5QPgzNSgrtRH/ekT6eZ24fRaEAg2soMZdJztbDEndMCfmBkRNS+INeLKmDeWrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gH/pCXsw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MGUDEu+y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7278760A2615
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 03:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7278760A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gH/pCXsw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MGUDEu+y
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0ivrG1850064
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 03:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=gH/pCXswSSJ3EuSh
	KQA7b3xmVoM3LnWBCO0vxhLXjren049L0iqemNc18vZnERv0nDAzk/c7vfuOTguD
	7qXtvMAotyfyVzUOM1mtvSsjI7FaUVUGfMP2IxvNdtdiJkZFCH3ljJkiJeD2g+CG
	4DPsidwZi8sY+l6/gEpO5ZKJlnNrnKM2DogtMtdzS7nKtMhAXnA+M6bwU9Jf2csF
	bmH/yjuxJyZ6G0tQfB5B+4DT3rtzUp5l693QmxdGtbBdudVa7DPfusELcFKNd2vt
	t9XSQMNkv7HYJ/svN5owesKOu+fevgq57XWteGgiBDU5nlWb2udEM8xDhy/nW57Y
	aSgDwg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5ubu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 03:23:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a3ee64bbso2781506a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 19:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280985; x=1794885785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=MGUDEu+yHmx7Z9Ep4Wj6oh4YeyQYoRR/eG2C3IJxu9+TzxPtyyg/VfOTpEOR3rhAzl
         xMcyKo/8VGn5gg5qcMPy0lhCMU6Q3QKbIA3xwGPD0IcpWFsVOv1oqp6IkrBpAbgxRcrZ
         mGwy8zCA07XI3D/jzMRMEyiLU+YY1lbHdz5EyQ/1pez6sfZMhbjwguY9xuHfJbslPwTz
         6xJ88L8TgMpmt4l2cZMSPaxLD5e8yTQEW54+V4/4YEoIPIc7mBl+3M7saqHy4AiG/8eA
         JdZN2Fn0sA46djv3uUCaL+RhEKgY9wdu20AA46H6pApERdUklQ/VJ09oEkEVH7y1jp2A
         r57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280985; x=1794885785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=edU9/7LRCLC+Zn8urdeU6l4p5C8RjTKn9BMZI/7AwAiYfLkxplTSLy+u00e4oqkoq9
         ddRSSFxQSjLnbs4aPeB9yZKYAC5dSAr4YdAZ/T3DlwsUNAHx9a2wHqwWy2TqgfBVQ3LJ
         XN0lEbnd2CkaUZB+9NECc7pWIfTytBVBjynvQuirI2cP2Q24j26DeT7ML0lnYvSFr+o+
         KpZTWF4tRfbqbE6f68qnw1d0nIL2bPRaJJ83XQM47stFyBa5MnDvjZwHu8eib3X3chAd
         Slr5FWRJijhXAP6TYBxkf1pSxEfSlGP0LnEHj/dVc0PI2SGxuCt8nr8LB8adAYkbxi+j
         tzaQ==
X-Forwarded-Encrypted: i=1; AL+hErGaqWd1GMMypKkZGPEoUgThNcQ5DBGYGOpKCZZI6Beg9kYzuRmvjTZNsDTKRICbdbvGEhZ2ICBxOYIr2HPM@vger.kernel.org
X-Gm-Message-State: APuU4Z+7jzTjP6ucRXqTcQlrc1mjDDHKlchNb54LKH4AUIXaI+VAAWDp
	1LygpSD7SaAL9OVRoKZvLKFjlrQDTHaelfXVG0q41Jym0E8h2xemUZh5YMbXzlVkMdYLoMWCK4e
	BWz4DfbXZJGkDso14npzA3Zi77GHP5Ux5O9y+OauTO1P4qod09O9nHggEr9kTRVdyDrJE
X-Gm-Gg: AYBFou3nXm0KzzfGgRrmXlY02xHPfqbJ00t3VmBKkJp6FQl0vy2Rg2H1zNa6cbzLm55
	LfFFIZnP0qkUG+dFRPBoCH9HBo8EHnkFzpIe9NIiIhAU8npMfaYvBNx8bL30CIYAV3XKBz+waaU
	4HlpI7iFNv18xZ9FevfAFUxu/4dekOAsZrx9y6MBWM7gFIeyhV0VFcQAV9D6PTg/4XxUyBrgQ+g
	KyGE7J0rDT/Unu73xpDgAvRlvkxcuQZWYxJbbLHuXEoP9wLbkTcE5QzEsNE4QMws2c0BK+EYobm
	aWxw6RlWUMyYVYv8V/f5qAxVXXFJ+jg4VWcxjIf3h1AWtVgeaxy6BVIoQMDlLV0GBnCbCvKn3mP
	Om4j9qrZEqI6Ey+cSLcxZzxlyjVNEAy1pXN/gncoEKEe6tuEmjQNbg+x5Kjj6rhcR/S/j4gIHJS
	sAkfMZTmCNKF0D/Ou1VAjR/xpZAe3XVUIBgUrI
X-Received: by 2002:a17:90a:e7d0:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b166fdcc2cmr1493530a91.61.1794280985199;
        Mon, 09 Nov 2026 19:23:05 -0800 (PST)
X-Received: by 2002:a17:90a:e7d0:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b166fdcc2cmr1493498a91.61.1794280984677;
        Mon, 09 Nov 2026 19:23:04 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:23:03 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:30 +0800
Subject: [PATCH v22 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
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
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-8-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280922; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=AMiBCcVxGxfSjuuyQmf1WPtk0fETzfBhVgaDOfLDfYDsgz+Dw9fHYx+UHgz5+Z8gvv0CsjGGt
 t6hZrFaPbTdCOSKabsn+yIYX+kMPuUhaAAxVzjIfw3rqbrmcJPjBdQW
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX+4kFQxClsz4c
 FmSN+qFOtODD4MqAD2Tw2u1CQ6c1jLk0vl5ZwycmthYNccaOtSVzU9dtSNe/jiOKxHe8jDkqIVd
 7iKz6aC8rhO+4EMFBz2l4PLbXuq8S7s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX3V/LrvtwsOvL
 mzIhCYI+WcgHrKcJP3OPgF86aFcY1zFNgyx2DA1SPzMNQchl9t1CT++zxp1oXl4jlE4TEQfXbct
 dggW8CLRDhTy7JqCTUuMNZG/yLyxCU5C7YXOmeHXZkhJdLrDlziYgMr0qAofGgB+OnTGM0Ap9Vw
 89bpfS37YrORbbRjORZUFJy8yq6OxGd72nncV5DrXc/xwOcd7Q3QgzOMbVzDhiG2SdsYdxU/8Fe
 pKvtfVhA9+T2n9Z0cL9omD3RXXqtRc2UNkqqPKkzLjlXDyqTv86f1vfvWY6yfCFK/FObwloDzl8
 Bv/+PjBlyUa8TgwHYYsjyFwUfmQGkDrV3iyUkvuT5H7AjAC/gPqEOzVk7k5p1J2qXerHDAnLHlJ
 68Qxxd37E5w815Wk1AYMFnooErdHF4l5fn9rhY7pAaqcJSYKBlw5vOMSpgXqbxZuR+6EnrNoV3o
 yZb01gbCiwk6UWcHTTw==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af28e19 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: UwfhPpfDM7jPrqCcbVHp3nqo5KA9t1wk
X-Proofpoint-GUID: UwfhPpfDM7jPrqCcbVHp3nqo5KA9t1wk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100013

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..852a1142100f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3132,6 +3132,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1

