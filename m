Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B84B3E3169
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967112; cv=none; b=jXXF8xeFjy8IhMLqAoXZ9q0ah9euzN1vSBHc4rziyy/fvQToHYjBOqZKyv5jEpbmCG3v35ygL2L7LgOmq5HC1TQ5Y4Y+GrKmUlJI3+B47RKrXXwDfWROvVqT61gXBzQHi4fcR57gkUxfBGo/dK2vkfOBfyp4sr/gtUD51ctkMoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967112; c=relaxed/simple;
	bh=JNgT2oTJIx5xBbDHq0D6uqDXAg/tmRWNO5zxHKbbGho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bXVejfXo3aZk2RkYcuFpsl00CRYrst0ZQb98pLXivJYMFaxgcagL29yX/w6fAYJpMpw7YP2yLjev2B/mCy8KnAVlE2TMhEYhexyXoSpEXq4RWS4f16lJnh4wokyFDUHJ0XgCopPQhOLkYJjnSwOr2e6EMzCvG49zUxKIFjqI2Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QohxCooC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBzqK1mR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QohxCooC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBzqK1mR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7j2pp3018226
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1LlVoM17gyVNWqPXIo4RA/hbsGE8lLUrd+S
	szrYIGjA=; b=QohxCooCXCApvMT6vrem0LVAMvV6pgcvyqvFWEwYYpET3Msi5Wn
	01PPKdHKNEEXb+HWm/y1N1QDXaTQ4jux70ZEY5HY3599uixAC38ft5UFjnwI5UO7
	8eHdwC9cbKf5sAwzw6PTiTwYPOjOzhTK/2yRS7LUib2+ZCQZHXPPSSeiI80a5YUI
	oDBdgp/Pamq9DyeHJlFZatDsH2JgsUXOdpULDdGJIxRySqV4jjBYGo2pBTc5h59m
	rNGK5CAcrQc3jUTXUMtQmAWemDtzlZNHOHCw5Ecs3bjIiGlTZ11IORLvH9JfXHfA
	724L0e/D17pgm+Zs7x1Zwk/rKDM7R1d0EPA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b3b5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:38:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso196808a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791967110; x=1792571910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1LlVoM17gyVNWqPXIo4RA/hbsGE8lLUrd+SszrYIGjA=;
        b=BBzqK1mRO9sm6Q0vhDXdGRBuktCVnx0meL07K8im7kCQCFydu9zoGhH6eYoCxzTsRT
         2b9koW2SrnZ7Bk7ZxW6r3nEaF9/waTxopu4uDZTjyRLdoqAeFL4/HAXl31Xl+JfFS3Vd
         VbEtp/H7UYfi0Sx6KjaLsYNUlJlg6BT+yqDjXQyf7nwtzloTmYs453NMjraKH6E71ARw
         ybjcSQGNOz24MJ/x+4548WPOLzAkMcgSfZuOwDojc0xVDZt5xfuWIg6N8QzZ4bAx0KsZ
         cCDpRAOnlHuTpkrzZmOhmeO0i3LVy758JF1uDEHw2jfDspTl9R1+y/xbRyHGGAUq1JqA
         m4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967110; x=1792571910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1LlVoM17gyVNWqPXIo4RA/hbsGE8lLUrd+SszrYIGjA=;
        b=SEREEsfV7J64hb+I7D3DQ7lMEn/X9DaDPxf/a/Eq3xyCJeLzEUQndNGNHbW3GKda/V
         Qz/eEPmHcLLnKfyZ1E+c1TArvvO9LWvTbnNdGuhAzTO1CjFE3c0U0e8V6+CZAooS+E3D
         BE8GVe143vrL0CypMfOM2j9d9yRxD/Ao/TBqAZ1Odc9OEKODWSxQZLN1L6P4MXGUDzmu
         7YQXcRT9hAP2KUx+WlRj1EXKi4Do/lxTxVpgMhauZzYgevtBgaZg7R74585HPx0JBpz3
         NsPAA4jgMuDYYa6OAnsv9ovxxC7vMoH+3SEIz30ymYoTuDMaKVpMWd2UZtCBHjhdDy84
         MlZA==
X-Forwarded-Encrypted: i=1; AKwUvBzTGGZGJ+vxH9vh7sE7WhdGhQIgMXy8g0DbE0PvFPxi3RaMu15gNWgp+gKn7OjLFKHel9LjtrlWrSXKrGyc@vger.kernel.org
X-Gm-Message-State: AFq9FYLH1m8CJvkCqdKkcyu67N8Izoc+SRXlbvl5iGFYF3dHyEOEKXgG
	xECVy1aZENxIvhZItYBElddEcML7ndRpWInrN0/EgdF/10alg8CTYvU3ayNe6tXOgol2hZf4T87
	0QoZxFovIPrdACubgYqa52ePCGb6IY5Lrr4+T2m/kPKKtXYB3gqnFtxLNWF+s4fzST+LD
X-Gm-Gg: AYBFou2l/dMyFj9UTmt0+KMtZIo7t7tyveKOFLvIj0yk8U17fjpPg/stJWfVZTcYKpb
	lq9DO5VgsGIBX+mjVxBAljFakQPNGi5dOFMYogfUIOnRbTLZJCW4yd/LaqAc+7sg085THS0cZM4
	N6DGljhl2Q3jscEZXbarbihADDZdtP580fS31QoiwNmo0HJ54umsRqWK7VJLWCkgvzI2fkhdO4u
	QaXwdI2r8e6t04TbUuSA0YW+gKv97ywvDFBRZszvCQJguQsY8m++4LJ9YNAA/y4rgl33/P9tz+F
	QiSx5gThutWv1cG6d6vOdIK9DOz3zXeUY9Qo1Tek6MSkaDCUmT60P7pZrBFogx2JSt2649KhSn8
	liZ5ZH5g41SDAMxssi/pQCfhkAcnPSNbA4Kre23QeOflDHhKwz7ye140eIjsq34j1TI+by9A=
X-Received: by 2002:a17:90b:224c:b0:3a8:bbc2:5551 with SMTP id 98e67ed59e1d1-3ab3a0f0a1dmr14977976a91.0.1791967109762;
        Wed, 14 Oct 2026 01:38:29 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:3a8:bbc2:5551 with SMTP id 98e67ed59e1d1-3ab3a0f0a1dmr14977874a91.0.1791967107132;
        Wed, 14 Oct 2026 01:38:27 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac752d590csm1724804a91.2.2026.10.14.01.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:38:26 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com
Subject: [PATCH v1] arm64: dts: qcom: talos: Make the ADSP remote heap no-map
Date: Wed, 14 Oct 2026 16:38:20 +0800
Message-Id: <20261014083820.468-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf3f86 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lhXw38L0c4fPFhUHQqIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Bury0b8hBHkqxxnnIctPSyk37FBXM5Nx
X-Proofpoint-ORIG-GUID: Bury0b8hBHkqxxnnIctPSyk37FBXM5Nx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX/yzEq+uX3PNW
 5HnG1WpmGsQpdxW8MeThIgpZ6znZSsZYCf9OoZ4weWQEyqEBQFlWkZUZjZorOVBCbOahbwdqbY8
 +Fr3J2vK7xwK2zwH7HQIv0IJJbVAGVoi9BTcjctZA2y/UvnD+icJO9m0C6iN8+bfjkfihm2UdVF
 6osvt18nM2QHYkBQDShk/OZdWH4eLHDZE17xXwoMBMNeFxslGIlkOOzMMvnKFfSUDuPYSFj/RDw
 EWceHskvDUj3g5h2Vtu5RoAya2dcrAn8aDy+TxFCB0xyL2FldefgvnZnnrXSqIjShsS+UenIGnz
 HwOY7d4RQT76VJtRjXMwvDnKmIdGRKXw3ok8ld8MI/eakkfBelWe3g29H1dreP/3eTQ5iMvCSO3
 udp7J7Fu4g+KzRDvtfX/SZAUdAKnRt10DmemlwlkoEdkuNfpNaocbE5sMxFWAZnM0Tk86ZrWTqp
 zUt6E4VWZFq7s9xeVXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX06N9+cRzeTaX
 z5EivmwpBLUxm55QIhErCegKUG+Hp2RbxEOwQn9q2nFgNpAqUVLLlJflG70A/TE8NW/bVzGqjwR
 gZC4BwMUeBfzgmLdHf6A+4xz83/lWgY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140034

The ADSP remote heap is declared as a reusable CMA pool. FastRPC
assigns the entire region to the DSP through qcom_scm_assign_mem()
during probe without allocating the pages from CMA. Consequently,
the pages remain available for movable HLOS allocations even after
HLOS access to the region has been revoked.

On Talos, GPU stress testing triggers a synchronous external abort
when zram accesses pages within the ADSP remote heap.

Replace reusable with no-map to prevent the region from being reused
for normal kernel allocations and exclude it from the kernel's
standard memory mapping.

Fixes: b0b51a5f1911f ("arm64: dts: qcom: talos: Add memory-region for audio PD")
Link: https://lore.kernel.org/all/20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com/
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 8ed6f2755705..b14952b57d6a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -682,7 +682,7 @@ pil_gpu_mem: pil-gpu@97715000 {
 		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			compatible = "shared-dma-pool";
 			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
-			reusable;
+			no-map;
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
-- 
2.43.0

