Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182191;
	b=KErJHz+y7FXsDbJ2Rxaf0FiM9BqJWEBBuK0IrSqEajHxe5BBh1tmpWyX1yarStIaRU7a
	 QVvi73UoL2rD1rtaJ1wsqoSPTwBkGSZcd639QWJ7aamoisVWnFm1/0g0mAl2ZIuRTou5z
	 EioChr96Z6d3pFE35rEoRbDDKddNQWcePKnwTBQK63nL6QHUyVhbBusQYmxRoYpBWus8P
	 TWgL2GZuINa//tzTRNwnyQKN4QYwM4v2NKW7xWM8wdK5Hr/BvOt3NDHrBZ6K5u2pnWdO+
	 1TNO2m6TWJ1ODSlokTAOSzm7GniyxA3btIXvlp8tMSgifYeZIM4JGKKYUBtqZB33YGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182191;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
	b=4JQ4yYkdxg08FlDGcAjLj92cIGI5WL5SCw08AsVWzJnNpXz4fh7gkD2ttMyohKarofe1
	 So5RkVqXSogLo14msS9CRJ17sao3UDiou6dTZiLnIpN6KN8jhk3bBG4ffaqfi9Qargywd
	 2S0RVTWkPY9MTCnru5W4bB4I5m4sv7OCqNJJY9Qedk0zojBooPlVA1FRcTJJOBFza4cq0
	 +y7jhPfl2bbovgsO2Y4/EG5xHBZJzsT9yvZnhJspEpECegWTVQhqZyoh7WTJn7pnFNC4K
	 KsYtjKrX3z/IZkoSrohQYjbZB0/4RQwyQM+C6K9unu82Ek5j3vBz3SKZA6mgwhL8dSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lV2OMf+A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hk+DaFyp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F6C606A336
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80F6C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lV2OMf+A;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hk+DaFyp
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjokb1462866
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=; b=lV2OMf+AO/WIMczd
	5TY9H/Sm6NbzH9KrP/cYGNhJ81qogUKwQTc7Meeq+vgjWerGjMpfPO/MjrSjjpST
	jJ3NZSsDfUVYzUzbarDsHW8szqr+yN3H9aIugcOY1QYd4qRo1MmdzfnSx/uZMn9l
	rjhKsDiQuJJwhdRMuwEHQx3510yA5eQMeSZpIRzAqWxgadkbSAA4POKqFyYAD8Cx
	6hU1uHB+Xu99vJFaEOmYvmnLP3XxDdRnA9s0QprTp+J3CZxUMXj2vC/08UdO2Uhv
	Ubr4aRfxO5Xw4qipLuA/zBwfG20E9msp1kYB024jfyw7Xfum1fFBbSyaHsK7XsNi
	84Mngg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guahrmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so1373023eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182189; x=1795786989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
        b=Hk+DaFyp0xuBNzwQjaFquROeas+z/UbRqnGBImj+9FutfrNQ6p52X026Q+StuA+QUW
         cnWMYYtQhHnMoRfNLpND/M4eFRKLQtAxAsrDd3XLr8xhbb8k+lohUpfMem2FzDGYYoHf
         5uYMbJO+0mML3E0fN3/zQURJhBGEwEnLCNykmpEsoN2EqQY8b80o2riJOCUQNCiLFqW+
         Jr8mKiW2hZ2YPzDx5aZgpGLzq+TDa7k6vNjeUaXMNLv7KfjUxhviIJaIs50D086KW+yd
         C7ELeybSPSkTqrldQJ08jNfd7yNM71t9c17XyBKt72aR9C6495R1gq9hpZ2+0s5ep1q3
         LoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182189; x=1795786989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
        b=giPSkJTMbIhcy3pmx7QrbJBG4rcl52tdPLsTpGMhfXB1g5aXHjncahl6lNaaNrA796
         a5+hCeqynIbz5bRFaYFd+YjxR1H3Pv6PQdJ2y8KJupQ9+Ku3AAEL+ShxprloSsTnqih5
         mJEuh+MhqB9zqouMA+UE07GXiQKhmXQpX3xrcen9nfAnWiMK1rgn0Ko4IAQrxk1braVn
         andGf5YC1gmgUNHKeBG01j10WkeV0Wheu/uAIE6qDvjljU/fJIdsdQZ2D2aSxiyg37kg
         BDxsX23XJ0B0FGUcSMSETo6KtR8m86Kinr1B5fTJDQZdp8xXyQHDn9AhWTSymSBQVNm3
         vNGQ==
X-Forwarded-Encrypted: i=1; AL+hErHGrD2Oa2r+ZJeful7YBj7aRdkkyg4cUiPSPktCJ33S4TMDFj+mFtbXmYkf8t2HFMoS91iGJT5+QNYg1mNB@vger.kernel.org
X-Gm-Message-State: APuU4Z8Um0bSPI3+o/oqIBI0M3EZegPDa1xMeIPsGc9sbeSRPbSdTqE3
	RAwWo8e1gnukl4Wv9uf9a4tpFblhrtIeXoa1HCBx9NFaXp/3Rx/AjtxHNTHhyb3qDA40I4SqMG/
	G7FV56Nojf06ZqKFz/pDHkP+QKZUrHtsfdmL2ooK/EX2eTjgALj/10Dz+1or39ErEHnkkwnvBer
	qE
X-Gm-Gg: AYBFou13yFxUmc2Uxe5nmWNxH8cHLFcAUQhsbcTIYgEQWo1TKvOUkq1NamczsVBEkc7
	mnwg2EUqFLeP9PBI4B3nvmyr3KotytS3Cw1PDYen1Q4r0jykYgHnl4onqyQ+C6iwrP/XBDgNJZ4
	kLQR5my1VBGDRPD8hXr/0Lyt5yG6W4t/lOOJL52c2Hh+8M+DOJjoA+okdmxmYs9X+7nQsyoXCpz
	7e8nUleG+mIBulI9Ck8Lm2XJERtkguX/7yGAbLjJbgiZk1+Ng71D8noJDaRYQpITwl1TTuInV4y
	Nd6s02IK1jzH4YIsKc0OeY0Kih6koHjFmovJv3VBtR/+V5UUu9jMI/jdPdGoTwM8JafSlFemUDP
	GH95Y9C8FEYak0o9edbfiFDYrr6xd2lK26R4dQXExUTqYz1bX3itbwxkqxwXGftrDJW97RM+0ve
	NkdWg=
X-Received: by 2002:a05:7300:601e:b0:376:6aea:ab with SMTP id 5a478bee46e88-3856c5b58e2mr2940783eec.3.1795182188836;
        Fri, 20 Nov 2026 05:43:08 -0800 (PST)
X-Received: by 2002:a05:7300:601e:b0:376:6aea:ab with SMTP id 5a478bee46e88-3856c5b58e2mr2940732eec.3.1795182188122;
        Fri, 20 Nov 2026 05:43:08 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:07 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:39 +0530
Subject: [PATCH RESEND v4 08/20] arm64: dts: qcom: sm8250: Add GEM_NOC
 interconnect for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-8-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1033;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=W3R0vadqLaDaPerwJqu9PSx+OZnsGkbm84YuXP3uSZ0=;
 b=UXjvyPjVSFUzv8MWkI6PHpXR9uFIip+8s4FKDI3V7v5De6PmcMG77hWXmqGhPzGsaIAqRjl5e
 dXXkYAE7cPcDTXRoKoXj3qGk19IsmRItdN1AB2V6qAWzSjL23J+XvLO
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX78ZMVnnV2AEF
 RwOFQXBgf0bQHKXb0+9hErVInRVr5/4NpZzfdoT03W11AusghOe9vVljyjZ40U1l8LUwx/r4TNq
 lLXf+sVWRduXpZV47dKaEFyKn4/6utHYUcv0oD+HAfT6xhbdJ0JNROnrChkoQzjRGMhvc+ltqrX
 fa8ZQsMsHMr09mH+rdpnHOnvSXeBY++HZgFlY0SHpxYG0Gt84yKUxSQcm5FG5WVLSEdA3YX16fp
 SbYcAUnCVxpKb+EP4MXMauycTPlKTxXjCNUQBkfKykd2X9dac5kwXe6Q3dSCDTLxWPnrJka3wXV
 qnij/mVt88ZDLRy8mfO60wuDydPys72ETrfm7F+MUb5/aT94wBDv+08Pb1DTDfwrGgCbCpN2+Ss
 Ia4jUzNC67c+nYkOFuY7lGwrrleNmlq4ENXIdKiC8HE1T9I4ByyYBJSrcMdnlsf/m8GYU4sJ8Wl
 W5clQuspTx0JJf/Wsrw==
X-Proofpoint-ORIG-GUID: VsXPD654JrGihcxq1eHzTJN_-J0Jbemt
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b004e6d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IeQ55TmpMpvzCWFLjAoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: VsXPD654JrGihcxq1eHzTJN_-J0Jbemt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX2Tz6rHCdbfue
 OkHOaHovsMJ2fPGEMtGYbd2HBRDXgLUABUE8xdoop1R8wT+ojzRoJ2ZSp2KzsCkOxHhSzhyyZBU
 /3bplMY4hBQwVdb38McsAN4bFbklhKc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On SM8250 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 992284e64d38..3a368ef7c22a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3089,6 +3089,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		slpi: remoteproc@5c00000 {

-- 
2.34.1

