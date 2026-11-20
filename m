Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174229;
	b=CD491BY9lxmHzSc+HJ59tgN/aDJORTSmw9lTyot1BhEygAiWsof8welELTFDA6qwTQ1Y
	 KnIcyR+UbrGfKC1hqdMpUZohA9Z/No+fmoHai2MNX/GB48p+n4n8xgWaZY+v30Z6+nTw2
	 ZX475OQKujd0V2uTB9dd+hV6rU3EF61CcO0wXhPZ055+RJGjXWFiGrwlzkZ6qvlDM+Voq
	 a7lZ06cNLnBxc+f3WZU4iSe3U6iMX3uGyt2T2QKptwB/QzfNWUbc/cMAjN5OdOMMR0e91
	 oIqSMrv7OUGpYhUBcwsq9TA6q6kEgl3EwFtSuTdnTUeJJc9upMwft0j9L9kqu0xcU5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174229;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sygOK0V8Vg+nVjbZjD5jOaJ4Wu4SYL3cH3HKafImClc=;
	b=Hub29D8bG+MqFnOQ6lHfvKMFzj5aKpQseKMyc35k2hQiFdpSHpizdepqeSZA3BD9uDt2
	 ffkIveQsuQzFNlSgNrCodgoofdmf/R704NKQvTho585FUuWAiKcpx4XOkuCOXcTS5J7T6
	 7MRgY4FhZzTtM73oGhZmWbZVh3oxqUZMa3XZns40/Ht7gWmQdAVER2X/m/WWIVXAxR1L+
	 YiirhgH6pNSHPWN/5/li62bV+liq1L6QZ4+ik81+CBhIVHw8Sp56fKF4zpQy/Zzdbj4+f
	 JCVGo3q87ogvmj8P5Zr+Df79TPPaRvT7LpdDaooxl/GAw0UD6R6Byd/qu2BXO0AHXxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kH7d9WyN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eayJzm/6";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64FF606A335
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E64FF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kH7d9WyN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eayJzm/6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjvJe2155206
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sygOK0V8Vg+nVjbZjD5jOaJ4Wu4SYL3cH3HKafImClc=; b=kH7d9WyNV7ikYQ3U
	UZw1dG2n7DD/fTcifeIt9Sgw7yIa0QIDghBW2W3lpb15UDZNHe5bN3N52JGVaK7Z
	scQAFu8d+bewhV42tqiYaIo4kAWfWNYirZLcMSB96+2SNdQ+5JrdCQ+D+GE9uYtc
	LDdDA3IQXW1vExf/31m+T06uQj1fYkF+wtMk36hi+lHRF2P2A2pVlfiQYNjf5Unz
	GXqvtp39DbKgm9I1KvBOE5+pIzIX82r19e8U87MATK/ejV/sAOE6ligskRXBKVqy
	Q3o+j3yPEjMKhRpx9UzKHQJU0JkMVrf+KsxYHhHzFIhrnYcj35nPOO2QYm5IbaqU
	nFeNrQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yhnnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:30:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e94f72fb9fso7343855ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795174227; x=1795779027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sygOK0V8Vg+nVjbZjD5jOaJ4Wu4SYL3cH3HKafImClc=;
        b=eayJzm/6VOlgwDR4WGLFs1SuE855+P7Haat5Lh+nVephxop2r+jy0N6jYACaXris0i
         Kbc4zfzArGVmY+8+AHhEZP0rQZ029/Lcmihim8DX+UxQVfq1Q/6ZdH/XReF0oXG+rplJ
         yvBS1q036LTcJ/J8R1VLG5jXVVxwaRucUvVcVJEbP7Pvp2EgmPZYkIUeprVTUxF6mtx4
         MNAMFjyrjbmsvv9knIeHwBPGdh1oPC6Vk5HnCyr33joK3a9IUNa91bAYgZfL9ODvLiz2
         YhpoFyzZ7ef0IIUwvOW3ZZ+uLmrYAwvwisR/fxoT+ng2q78r3SaG8VTlmwqBlibk+v0/
         u07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174227; x=1795779027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sygOK0V8Vg+nVjbZjD5jOaJ4Wu4SYL3cH3HKafImClc=;
        b=I8PYRimsmGA+sYbkx8pE4oQr4AXCty9G5nY2kwJJFalkagNjpVQ1lsE0zEivQcAFgq
         /sCmZSxsc8+60YqzRtPbXX4SbDEXFdAfvIvMOhXxrAqQcfir1jHgz4eal6F13r8wFWnZ
         mb+NDN/XdzPgnh/Ec/ynhbBlzUo+6RN53hZ4L4WbFAFGSeip2lJZ6hmD12dr/nNOBg81
         07JcjxTpF0yJ5wQ/NS7hM4DNIlIWLR0o8XADKxcnv9yK4CvSXTjmmyO70uE+P1jo/H7T
         ADswydvajKHqNdxhQG8WKWYjGqmCExdDOjJmtjTn9JJ1QUSP5iclL2IQ4gU7CNzFTETS
         JvLA==
X-Forwarded-Encrypted: i=1; AL+hErFbD90T5e2gPSRBzBLPZXwJzB9QHkoe6c1D+zRoIaMUkI9gcsNTBo8XisyjNhn2EVJmemAiliKBJlCb5G4d@vger.kernel.org
X-Gm-Message-State: APuU4Z+BKZJTMUKT0fY7INSzrUwG2zqkeXG/+QYs5sr9YAL8aZM/kHzO
	kYVeL95fkmgsrCBivzS0pZ0fq9eprkTgGcrklcHTb4gOMs887O258kEeheG3Pxp7qTgs2h4PCbc
	vCh3J53n439NtGYtSYeN8AZdLotA5j+DrjfgSaq4KqJp9BxDKCe/jErJq8pqgeBuzFFlZ
X-Gm-Gg: AZFdTZf+SA/ACo28G+GcekudCjZUmXHsRHgUhXoHHLMEZPuw9JfQvMP9kOTKXYMkdhV
	TKjt0Qk3oTioDxEkh5FQQifHaNh2mgPkigfiT9SQQKtNdUbk01vDCRwrwSq/Vr+uupJQdqhE5r6
	SOjv7Tf66Eo/+lrfKhxaTA9Au3llJmH3W97SKReMCc9SCn78za5VPO5r+eTs3jRq6jaLRW3USNR
	Dgs0IIjh1JIPGv/GpnBGiveXZdWX4kDWgXDNLe16b89OGu3TaI1Dl7fAoqf4Xdpy8le+cUNFIz6
	IztUQE8K8w2O0dUye4DMRWQGTchhJDxNTfjBShwOq35v3GHhJwfRWfnnh5MhfRfmQ9CoGGnjlhK
	X6J4n+H0Golf6PT8P+EE9NbpGvSIiw2GleoICCA7X7MDX84pmxu9aqUhnwtOUeNIaIDmNdPl9+S
	PgsWW//pQ=
X-Received: by 2002:a17:903:2283:b0:2e2:f2f9:b1ef with SMTP id d9443c01a7336-2f03f1b9a56mr32036915ad.39.1795174226672;
        Fri, 20 Nov 2026 03:30:26 -0800 (PST)
X-Received: by 2002:a17:903:2283:b0:2e2:f2f9:b1ef with SMTP id d9443c01a7336-2f03f1b9a56mr32036575ad.39.1795174226220;
        Fri, 20 Nov 2026 03:30:26 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f6049dfsm2751245ad.19.2026.11.20.03.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:30:25 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:59:53 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
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
Message-Id: <20261120-shikra_qce_fix-v4-2-5249e31394ce@oss.qualcomm.com>
References: <20261120-shikra_qce_fix-v4-0-5249e31394ce@oss.qualcomm.com>
In-Reply-To: <20261120-shikra_qce_fix-v4-0-5249e31394ce@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b002f53 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nsAWE0-7qdAvx2JcIW4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NSBTYWx0ZWRfX2l2Qkrd/yU5T
 tORtcjpWDJ45uguTYIo7h4ryDu9nynYWvDizMFss0TNlLsvolA4k7K7iQ8+4M05HEV4exhfZRr5
 kQmx799BTKg7hcs7fc7cMKrFpyeRNqpZoUKmtwTZwkT/3HDItcirOP/JHLjDU5Dlzm2xfwzWEig
 rSTBZ/G5CtpZ/CUBTOOM6lT8qfi9MGag5YURj1VzSTeQzYtxz4Q9SJ6HNtlta1pEvc3ettrK9eP
 rKORNvsl14vLIuZN9V4h8uBp7z8JeANfooOXeDpqHSm5hnGTKieLM9JbiC+EIYmRWlPeGoDOLDE
 TfhrRAesvvc5MfMvM4OIlkGHkXfKDDFmkPGHwwZg1NLHIinsfzrcTpIGsaz/WKjFkOBlrCS5+qD
 r+vytMNcj9NinklW3nYgu7BXLBTLKUQgSkbXkeO1mo97z3kJ9jscgFiqS30sbbzxHz/j0YsgvQN
 fxZ3nQ6DQjQ58SAq3Zw==
X-Proofpoint-GUID: XLNuxYnUcnLQzzasx1O4Q4HXP8sDeNPN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NSBTYWx0ZWRfX2l0VbsvWcik8
 Z9CHgeITdJaQ2dJ+SZd+cJtaKPE80hFB8omVRQ1iRCJ0qh1WfayiDxxtLQOAkB4uXwNoASXNfaT
 le6oaqqqIZR0BvvpbBp3VKvAV2fs4qY=
X-Proofpoint-ORIG-GUID: XLNuxYnUcnLQzzasx1O4Q4HXP8sDeNPN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200045

Shikra QCE requires an explicit core clock, which is missing from the
current configuration. Adjust fallback compatible to "qcom,ipq4019-qce"
and specify core clock to match updated binding description.

Cryptobam is controlled remotely and its clocks are therefore managed by
remote crypto subsystem.

Fixes: 099cd05d200b ("arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes")
Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> #on shikra device
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..bb9ef1dcd686 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1208,7 +1208,7 @@ cryptobam: dma-controller@1b04000 {
 		};
 
 		crypto: crypto@1b3a000 {
-			compatible = "qcom,shikra-qce", "qcom,sm8150-qce", "qcom,qce";
+			compatible = "qcom,shikra-qce", "qcom,ipq4019-qce", "qcom,qce";
 			reg = <0x0 0x01b3a000 0x0 0x6000>;
 			dmas = <&cryptobam 4>, <&cryptobam 5>;
 			dma-names = "rx", "tx";
@@ -1222,6 +1222,8 @@ crypto: crypto@1b3a000 {
 			interconnects = <&system_noc MASTER_CRYPTO_CORE0 0
 					 &mc_virt SLAVE_EBI_CH0 0>;
 			interconnect-names = "memory";
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "core";
 		};
 
 		qfprom: efuse@1b44000 {

-- 
2.34.1

