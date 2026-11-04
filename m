Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819831;
	b=SA597i+kwHelgPt8QIiG9MwlsfxbyzDX84a+ukNfZcz2b2VRcb7Y9ABQMyedz0c+NkrA
	 rWm34pZds2wlzi6qRQ6PUN9Yil1LrVlj3qIYsNKrlpGZ5eOdQSazS5IBTvtJeeRf36HUd
	 W0+ejon8XvnIPSSe9QWvLTCL1NLQT1/CqecYNWB8knFElJAEzw9qGNu9aqBdJ/xXFnxm8
	 rEer68hEBHKY2ggxWGwkONuNDSBaK5cAg3o5PTmqtggDIQfvOqCfSom2KiaYx4pUiqNf+
	 v6qW957eqgO/MJnFQ8CYK/qRtSadxIMvgcU0jCJ5tYxNOyxrAT28cLBgM6Q+kl3WUXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Q6Q8RcSBFVRrz2BiSaH6D2CZNS5o9OOMDyy4jDyfvdY=;
	b=1XQvvTnMOirbPcN06JXRE70x5JQh/K76QbNxbYb/LEgE11+VcvObTiJQMPoMnZzPA94G
	 8CztSPeat4mmkn6IkIctZ5Msqwgdjp1UcHFbwIVXpANQLbZRESC0amJeUUnDbK++mGxzL
	 2sqQ25UsykrZpE0mhLBCry0A+vXlYVbEi4D/aSxSOQy9g+GUV4HHZWN/c9eNcgSduO7dH
	 TmvD4VQQ6En8sRgRSYlpgLf2fBp0ZRV6qt2StYrJWXoOFB+XT3POhDw/ot3tbn9f/qhGH
	 a39NCdniOp6qvYBkUWfbxdIMs7QMUvBQTFS/o6TZd5jxp/SEfbX7jhWYGg/9iD/mXgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TijPpIUi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gOVFsvdj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25409606EEB3
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 19:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25409606EEB3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TijPpIUi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gOVFsvdj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Icct32286041
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 19:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q6Q8RcSBFVR
	rz2BiSaH6D2CZNS5o9OOMDyy4jDyfvdY=; b=TijPpIUipHRTivzHQAa3LgY0TBG
	qumqd//eRj/B/nSVcI+gZZ9IqR/xeY1TxzvlqcWPx9dVfg5A7X+Nx+ok3D/me3YR
	KtGGweQYr9QbgjLw+BiHzzzC87mm/d0TLnIgQS2buogj4wdkTi1NfuEzl1vEp7yz
	ZCFTrSjMAr+msbDis+h91oChYNefUZS8EZ7PkeCD+0aJKCfrTrchtmcxYb3KvoxC
	V9suguRh8bf1BGCFxg9CxhGNq3gE9kN6FBdXW7IwD6yeXDl6xo1URmXW7sQpL0L+
	NBpueReca568o7Smd1NV2z/guJrfXsGAr5mVtYCJZOAZDyPqhoxih0mMPkA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hra5tg5p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 19:17:08 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaad995a7eso307210e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 11:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793819828; x=1794424628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6Q8RcSBFVRrz2BiSaH6D2CZNS5o9OOMDyy4jDyfvdY=;
        b=gOVFsvdjTZuA+ZtnUgBYLddtB70mCmBnGaozLg4wlrzY688te8MumcVnxz6FAwESmz
         /JObwGAx+wqo2z2H1NES8IJgrLSC/RMqGQijFqTyNpFXoxwq8z1n4WzFaRWy4UjHWlEU
         nK7ZVOeur4yMeDK3qlUpPpas1KOqkgy5XMnQwNL0X6/PDLiR0+lYIANusPG80pGagkYh
         vdFNU7yj1Rbe/c+GGTxHofKv+s6Z4jkb6hPzNF+WnuIdrVY9o/+aUdZVh9QN/nuc72JR
         kv3JNDG5f+eke9UotosYXbeLCPAqXswklT1JkACJVaLjTyvQwQZH/NUWZY6bxeT7EjLn
         /AMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819828; x=1794424628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q6Q8RcSBFVRrz2BiSaH6D2CZNS5o9OOMDyy4jDyfvdY=;
        b=rOxHb8hFJphe+8U7HaiDzGOkf3pLwwl37lqPb0YO/+4a3OjWXoXDwVNziKPhYGv9zT
         EUkRItX0qbgsn2YK3p6WCH36mntUwdwW+yZQ5nopxbSEL1zJug2+blJNxBEUIdDu7kNO
         dgDZ+KhxPPArSeD2x3Bh1fveyUj2UgtAmWpsk0bcw4srLVG5vF3jFPIU5Qvc0ieogIIs
         LXYsCeUc5LdPU4eSFPcR4gLaBqqd8RdiI3FXJyq6B8xm8RdbZh+kUWIJvMlce+yvhQ7M
         98fA2wvX2X1fpbxcEIKtMrGfaY4IX7a+7PXRWVXnFUAZRQVkMgvmTTuC0xcoP70qDYMP
         344w==
X-Forwarded-Encrypted: i=1; AKwUvBwz8GMcgby8IIL58FTHkIlfHT09aws9Jv0ujcgG7nT2Kqlakuv3UvRpU4vYszkwVzC8JrAb5xqzIgvoew4R@vger.kernel.org
X-Gm-Message-State: APuU4Z8J55enFdLP27LNA3yz0Bi0uz81JHM0oKLo+pp3uHDqQGHB3O0c
	NDbUMZk+R05cOTHcQblB0PXyk2QEJI43p1OiH91bhVFmsv/n3J0Asc25AAsv0auLmEV1B/txcg0
	2sn9U/dBKvvn1WQpuYQ5d8s1gL5cUy76XQhG4GyF6wL3f1VjOJ9R83Nr909NwcjBTL2tS
X-Gm-Gg: AYBFou0Hv2Tpu6BRFGcFKGsVu99e6cZAh/QOs5SIDFXpS0TXpv7gbZut2as1/Y/otlv
	wJcuUgi6kUttLT5UQjhYbFdbThsCJCMOEmUL60Tf0sdqUL/f9H64ao7wREqCFuwbNn1pMq8KrUK
	Hrf1cX71QOfdT8vLbNM8Vf7DLWelgVQPGzol/BHSp9yh7RqPdf6VdfNPxPnm6muEBYOdPewdcyD
	1/t11J77hkMTu5rxd/g72aPRqavjM0R4vYi9Ix/c6iF0ou6tqiRDUHzXadhpUgl9vhZXJxv5Sns
	h2J+fFwT/bHSG6AwK7af6pdHtu0dSkA2Mm2P1+MJIkVB48FogD08eQxEjnuVxst0OtGpZkzP9zl
	baoF6DTVrlLjuWSrBR9dx9zde5WNBVP7JoNWSOKhQv08pyFbpmS5oyxmYQO2BWg==
X-Received: by 2002:a05:6122:3115:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5ec6894bf5emr7257072e0c.14.1793819828364;
        Wed, 04 Nov 2026 11:17:08 -0800 (PST)
X-Received: by 2002:a05:6122:3115:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5ec6894bf5emr7257056e0c.14.1793819827888;
        Wed, 04 Nov 2026 11:17:07 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b414b170d0sm51276405e9.1.2026.11.04.11.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:17:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 2/2] arm64: dts: qcom: eliza: Correct number of TLMM pins in gpio-ranges
Date: Wed,  4 Nov 2026 20:17:02 +0100
Message-ID: <20261104191700.676773-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=jLLCPmPoP/h1cOKVCJRT+QUvRn14cXBvj0hDECNRi80=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq64St0KwQdk10nNiuJu0IKXMwnN1GB3Co40RF8
 Vp7pFqppwqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauuErQAKCRDBN2bmhouD
 18eQD/44SiaWNngb5Fnb2pwmnEgJQmyepIOcaFb3bq/kiHT9OXJIuMCQmADCo3gvdbS15/gKp0g
 yc6iJiEWhLfjC9RQX4MsPkHLi/QVTx1b6sv/7c3kpszmPAQX8yqJABpq11/Ne6eMcNBuEh9ITN9
 omwA2NpCM6C5+GgBxt6VjG9cEWjabpPUebHJA/JNb8sLf8AXtWI7X+6jqh/At0vwc8B93kGKV5y
 TqLB+lQEbi2LWUeBQlEu3CKKwAaNI1ALlj+6pZ0kDNf373AlXXXzPnUjbjqveyyWj7XK5bglSH2
 OX/5lRyHuAGNX7nNjcGqoljGsAZFf2pcK2xw9AfvP7llIZCTHAnmh28FbjNyUUxtWxb3dCViIZ+
 UjBT2f34nPZpg2KoKYWcj0gyNOubryFGCBm8tj8oUDU/qiEq6MiQwEz0LaR4enPDwYSk70/JJ1N
 Ryxu0c0npj14iIghha1DJogJ8Qu7FOOfSKiWHP2M9UsTNVyTO2zskaqb0bFXpj2baLVYOASTKHt
 I6mJImrGJG4+YtKJxcKLvhjf3+GiQKs1jX2EfxEp7lbRZv+489krwiBJUAsN6v4WCTINdiQ2X9c
 KQE6z9ApUjaGrAfytjT7/01Z1IdLzu8055Www/5a6CHinPMmnRl09e+dtDQH1PavDQP5FIc2i71 cVld2nHRj3ATfTw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3NiBTYWx0ZWRfXwNXMkuItBtbF
 IC47aJwkfVPjArOVRN3Cq9ND9QADE8PanPK2nEIZH8P8Blhitrq3/ihwqnilSriQ8xDcg5gY5Kl
 f/qknoFXcyc+bzylOlhnV70C0zJqn+Y=
X-Proofpoint-ORIG-GUID: vaBhgNIze5COOjS-vllRHqJ4cKfHGsUT
X-Authority-Analysis: v=2.4 cv=P/6vFSAu c=1 sm=1 tr=0 ts=6aeb84b5 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R5-cwpJYxvnsFHObl-YA:9
 a=hhpmQAJR8DioWGSBphRh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: vaBhgNIze5COOjS-vllRHqJ4cKfHGsUT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3NiBTYWx0ZWRfXw+xtJg3hfTDQ
 d4s2BlPtKf7TftAjhzqHiijvikTgn36hnSorbdpNg4WyL6HF82V8Mw7sAXuYqUevpumOsyxKrf/
 0dbSphXGoAzxforHDfranjvNGasqh+Bc6frEtTFRRnyhG1qn2KXGdMB2SRq+d12IkHfQt9pdI+0
 NKKDRG1nxhtx0Z1D3VIppw+tTRelFKA5aGQVc0JpJJqIa9BYwY3LOd6mXJJJKDqzU1oxLzIerBY
 Zs4t5ikhuGW4YD13S1lpMydSlEEuXDECF8mi7udlhLv1B0dXoglabJl0SMSqahpEOmOFZz+AwAs
 MxhOV0P+71GrhjMeoFLIxg5FuxE4yilAfv4T6+UZ1YnCwi/VXN1SU6Vjde3/gtPGV7ey5GS+Tud
 HPQ5mLTfPrS4jRIjhm1lovwy2p6yRhACO7tM0WxtnVmYoLX4ZvwTzr4yVX7Bt0lQMNMqHETC4PW
 pzNjW1c62wwaikQgCpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040076

TLMM on Eliza SoC has 185 GPIOs and UFS_RESET line, thus the last number
in gpio-ranges, representing the number of pins in pinctrl, should be
186 so the last pins can be configured in pinctrl.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-0e88535a-02d3-4a42-9f3c-ca4f9bdd3b11
Fixes: af20af39fc09 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..df7426134722 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3577,7 +3577,7 @@ tlmm: pinctrl@f100000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
-			gpio-ranges = <&tlmm 0 0 184>;
+			gpio-ranges = <&tlmm 0 0 186>;
 			wakeup-parent = <&pdc>;
 
 			pcie0_default_state: pcie0-default-state {
-- 
2.53.0

