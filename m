Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989015;
	b=J36EsQUmRiQbmuG2sfBhAY7Gv7ZM4qxRfmq/spVgnpzKWOTNk5Bsy/Dy0oRQGvjCaUIh
	 WhcPWf+YSxmgLZoeFMJSCPiaNxQiCW4bj3K/AMTqsa+b5SSzmDl7M/CogADFAubzBvEjx
	 /j1W9o+qmgMB4WTbrRmBzRulS1zUjk3aBFp031YhSdJt4kA+VGwYVVjNz0T7wdrqicdAq
	 wNwuGaqDV6Pr7X0FEelZZiHc4VquMkqp7MdMYzdrfRl4SXKqI/Ckc3zFnpOTmTmFXh8np
	 FcnlCpFqEH7JyIEg7c2v6HFjPC3UcV2Ji2Gm6QFTruO2bR7x5zzU3N/rigT1O5Fmt/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989015;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
	b=BzWk2uyhnpZy0azoc9pOqTvaTzZ5oKHddwi/d3Q9LZWGi2Uw7v1+zTWqXvpyuR19qKMG
	 I0rUklawxA2mYuKBPpVU59MTSSAX9nIw1WMbfNP1F8bzMWeOhjEZESJJEMOGF5GXNd4Vp
	 IqcPBvXgDoY3lBHrZXWTGnXbMvwd34rAv4e7EZcHyWeAzR+qLNq5jg9T9DGVEQenN/Cus
	 jk8KN3dpNfdFJFC0e0AJBcI2RrPraIkRI2uVdBSqkgRJ29LO55j3yg4OrkZXjdnMgZ7qF
	 8DGciWlijyIB/N9SSDaMc5CUdMddV72SEkZq00uxdf2rHeFK9XUX6opmr73ENK+eHLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPnE0Ajj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z8SL/gwL";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9F1606A886
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E9F1606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPnE0Ajj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z8SL/gwL
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI6ogao2560600
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=CPnE0AjjmS1OKti+
	jsKcwPsoZ7wslvTnpMnC+xroU+ZLf5jzJ28cCteayLBq+8kKHpBW8OL/FFwJtqzA
	sWnow2ODDb7TyWFSpNQAonyQSzlVleAO6O6F83fp56lQn8v2++HSfZ7/qhc48L6O
	uDPEs1r2yo5DGDYdRr5PJc9yp0umRg4BDNSLrBNw81SzqQfjNwRIYbiJ9AgUm4SX
	bB+ZYwlWwWmhKA/oVnxAbA+E8rXa4vfiHm8jdjkTbDsNkcl2VscFDJAyC2AZa6n6
	JKPV1B/HpSGNHZLQm1xKBjwEaMMFjPWHwTBdRY/vY9P4maveoajbK/ziMlO0/1Fx
	Y2nk5w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8hxdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:03:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3a73a82a1so842209a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 00:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989013; x=1795593813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=Z8SL/gwLauMEuWkbPD22Yro/g8ltM3JqAbtHfcwH+9NsNq7lAqRK1kXVUPzLH9peMX
         z5NRWAHrUqGTv6uj/qDM1iVaqQIT67MDh1cFdVzOSVBt12Jz6g9w059h7WD5Q/j2MpjL
         vNbKIwcIUo29VPHYfFLNE8DL+bBWexuMwZFyv3Gw3Ydp2Tp7+riH9HWaQ+ZMmctHUh5z
         POZKplCwY5e9gaB0qwhQehDPQjF699IroUJx0RVXB6aEHF0vUP7FPGBkyWiHewzA/m4U
         PmUltLE4LfP2IuIb8CVETXL1O98+83Hv1fWYXOtcaqVql8jNfapXK1yX8EQInX/+2j6g
         gDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989013; x=1795593813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=L1dHIAa24pzGOUt9ZlN4doA0M9bEXu3IJ7GatCD1D30xrH8t7ogbO42YcgHSfvLWCg
         ajzWJxksY2NcJGhqaDYTRF3pB6a45VAbkkcO1dTOe29DwVcayJ9at9Wy5/hZcIhiB0H7
         XXOUHgTKz/NztSnqxvtg2V0P7ujLdTollP+CJj2DB/cT6AbcaJGK2b7efBdVLLKTgAqe
         d91yjMpS50w7b1+aUJzajZk/haFIgBqIZeSzLLLxu17NqZ8C+3rmBzhr4wCBpaGrajOR
         +MH2Ulzg+dRHUd7q4mu9PQSdZMv2cQ0aelWq+HiIqgy4fjAoFH914LD5wtKKOVcujdCs
         TDPg==
X-Forwarded-Encrypted: i=1; AL+hErHgEzW11QP1qVA8Ra5KhtsOrRxF6dXFKC0odh/cXI+C8ODFhMB4D2zoXeV5eKj7UG9FFXROXdE4D4qWr2Kz@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZS7GMC22RzDTSGoR5bQsaf4QyZOJeQgfbL5v/orX9T+ZpGwGD
	Rz3Pl/yToOKfTSSLDtjEj9uQAGLl4eipUAkDy2d2fBc/xSbm5TVKZhUs5SFONf0B9ilU/F9GPPi
	DFGFJuw78G6pfQ7LH9FyCy057lM/JE8Ie5XgDYiqeRJdPIKmamjkOSd/3CIhZHNQc7KJJ
X-Gm-Gg: AZFdTZew2gxcNTc/EtIH1n/EJ2IC7MV2UQBdIEu1BXAKHSCY1Y2WNhtPtMejx56Bbbz
	0G6lNjnq0AcRlUUtk37NkKknKR/SkZVxs8ZtQMx4hgHEnSyREQaD4ywPNVeGfhA+zQoRGf67GQb
	a10+pV8tM+5dy2/Jz7IYxFIC/SiXUGiuv02xYNHNWscajfS1RMj7gCDXX5AwmcRkb963+S7fens
	vckGTTxjfW+sIs8w2aZN0J1TDvbS8/WzgThzpLKlwY8TuJptd5fQ9smrDBam06NtDK6eWtT539M
	+i6BV0LN+lbf8X441dWgB49X7nRdoN/dEl/tEwqSWs9E48i30RXqx6BLD/ZAHOlQn8oKoj2VUpe
	JKwlIg9xa5syDGlHiMNzT6hEYXUoO2yoSNYBDRjeTpn2fqUhk1PE97UkloNHWxwSnKsQd6HpT1Z
	UBHngGlwe4/pLs1EbDDpjbOYErWt2wI3okogsC
X-Received: by 2002:a17:90b:5803:b0:3b3:bd07:6646 with SMTP id 98e67ed59e1d1-3b3d07e0c33mr1865336a91.52.1794989013179;
        Wed, 18 Nov 2026 00:03:33 -0800 (PST)
X-Received: by 2002:a17:90b:5803:b0:3b3:bd07:6646 with SMTP id 98e67ed59e1d1-3b3d07e0c33mr1865315a91.52.1794989012779;
        Wed, 18 Nov 2026 00:03:32 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:32 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:29 +0800
Subject: [PATCH v23 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
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
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-8-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988961; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=1ShHKwidmmYkWB+xKUgzw/Jw2Y3OUqb+V+xbSEaF8Ffh8U89bJa1sDw3eeoz9H1yx45kKuMKY
 C7yNqqDtpVyCXy4QWjNKDYSswiheVEZlW9MQHcJ8tC5L+NyNOoKN/Ba
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: BVf5zhaDxwWnqvXgWgN1ib4-xhAsPDuk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX319J/UxE8Tpc
 68HCFNXtBYUgzfwn+4E5oRu4h3AIGxaXhpUJU03lmu+3jIrIX7eexBLbct9j3bcFzae249buo/J
 obTIwF4sVZk6PdKmD/aalLZj+3pzdNs=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd5bd6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX2gaTFObLlSNH
 4wpJBrj/Dh43UHxUVNRdmJvRQXw9pbbxtaSEYJrK1ttPoVCyr3Xyk3SkePCo1zDQHog4TZIzoBp
 zSbwpFmN/LpxI6mtUnok6jwtKQ606u9S2juvHJw1bM1VLEsl+ttSzAARdA1KU7gPOYn/0virga1
 ziGho6r4UWvLKgCFUwc6+nF9G83p+4H833pdbmOo1tMvFkpQbofWFVu/McNnHfJTd9GIRJl62IO
 /0/Sb+8FVu4IF1ljsnz8+DqKlmtE0GoDm1Lqeogkjb9HaR+p8IhL2Zq8Iq2vXLVi/TkKK35UD16
 3/K1tBFJyhpWNriINEC+1SxbbtlKQGA/gzcNlwJwtZY2ymSlOR3FkTAC83IB0krVaaocoQFOKuv
 vTwMVlcDnRq4/GL9HNSO0Ax8gk9gcd6Q2Wff4fTC0xf5mF78XUfkKqSMdilVqwxj1tMXJM9/x3T
 SyCUnoqetllMtlSJOkQ==
X-Proofpoint-ORIG-GUID: BVf5zhaDxwWnqvXgWgN1ib4-xhAsPDuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031

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

