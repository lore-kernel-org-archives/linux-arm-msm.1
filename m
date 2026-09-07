Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C634EE84D
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788912; cv=none; b=Se/Qld6sZR11LciR/SA2KO/jL1hK4jP8KIUrWAuROk2DSV6aqzQWJAlMdNvQX+NVTdUUeOr6NvHGEPwC//Y0z7uydKEHsKrgBKXTOmB60TrWz97KjS0OD+OGPpUvXY4Xa3HsGV8GBOw2nzBwVq1vjgVmebx67BZZBVMcQCwL2Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788912; c=relaxed/simple;
	bh=SevN/h5S6DPgIuqMF/YDcs3elkEIxRkJIUzLiwNvHUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VQpIUsFB9Vo/+VVNNonI7hQUcqBZxG4jF9LrZK+rvbUruhlpyuZSArT4Jv3kIqRw3O+fBBU2qnAEUKgPWCHbE+LX6Z5YPHi7njwu9qrFavjV+O3utdqIQAG8l69hKEXkmi1fHmenocvQwjvBtjcIkR0KU3YlIp8P/8ZE62SGLPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aTQ8IVwa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdK522E0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aTQ8IVwa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdK522E0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdErC3025713
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 13:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qkiq0j1pviRQkhRsTvh7m2Qc8yWxZ4b2dbKDsm5MlxE=; b=aTQ8IVwav7WBOWsg
	ABzkUGrkJ/Dalckixx7L5N2i5f8US8Ghejb80zi8gRwxB8n06P7vsdKwNoGD0IPc
	RGriEEGl5TFa2GBaK6IhmyXj5sMql6U56Oi2Xbj21Yu+VWsIPoyFV++xIHa/fpxm
	wln8eAr95R5lvj1/HCbTXbvL/JqGn6EyGVyl9JuhuKZ+w07czrLsiUIRzV6ApoUA
	e5kjdOctSPPRljBf+AajKRd1W91K/UnyxaOuapZCZ404hcGY8blvjx2YTMnctKx2
	23Q59KHcFR/NF61AP9ntY/8KdGeNtt4PXkGA1qiJzA+5wGhljiM1bLuUCgIihyvc
	oCIW4Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0wb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:48:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso4353562a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788903; x=1789393703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkiq0j1pviRQkhRsTvh7m2Qc8yWxZ4b2dbKDsm5MlxE=;
        b=JdK522E0DdyZeY3VHJOx4XKjiOqjN4UI5RHnYp6dUdJeNN8i7alT9lpFslHDIhnnHI
         K8nK7OT0dvGqf//3VyERMunt1RFwhP6kZDVu4Vpch5VxyNmzVeu+hSy6FtOCeKT0er7J
         DPxN/WLOr4+koDY4jFb1YIIPei6XZ+MQYyINifRzlIV5b3dvfJKN7ip3xz77ywNEdAUE
         /V+w2pMQZlIq75lx1qQsAmvJUA5j0Eqzzta92sqKWFqdgwd1h//xc3SUfRWocmc+Pa23
         xF9IsPRVSPm6TKnN2d4PtKrrXC67W4Ed8QVcDT8z2PL7HXpLZVcHxx3RhBcpgvWA/8NT
         6mpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788903; x=1789393703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkiq0j1pviRQkhRsTvh7m2Qc8yWxZ4b2dbKDsm5MlxE=;
        b=pCIXIIX6DgUn8iauUM6lMAMTe4Z61j8tGEB1lnvWxjJ5MuuYa8g3vIe86dmJNxj2DS
         yUFSFIzQSsIvfXu5NGNQg49U//tijAxnfZaKBrEM5ZKfJFCM3/i/Xt9CjhUnTHq/Wrbn
         kbFIVi+eaJr/VMww9kpgJQPIEyafJ/WsSH771bJ4CQ/cDq5Fo8VBNTLllfxfWPiEkHSG
         MNChd6KHnv4GRbXZU7KVcesGlb2V0ee0dvSd6SOq78kyN72BRoLDtKFPvsvRmBiqwVOW
         HGowDQePrelhlmVStPu/YWKESW48dU10XjSN4u3vf4W4lliupXlYgsYMtxnYQYAUPvXB
         ZIxw==
X-Gm-Message-State: AFuF++nOJxQuyfZcyeiMjwQ3C/21HU7zHCp48nhtjs6Du1i8jPqTWW2z
	jocQlWt0nYJjIT2vy546dc6MV8dbJ9hIUErANY6IyssUUDpF4wPpFzt0xdF85wcUNMuNMypqL54
	K1vho74Zg4uK6bBI7IMgNdWpfyHIww3zOaJMtl4qMlckvVvrqQY8c/eKUbVbrxR3IKVJz
X-Gm-Gg: AYBFou3b8mXgZ6xcTkrnYfuUp1udpiF9tgVEJ7TsT2xzomhgMCURtXsPBbtfqQLkxLX
	CZJGgCqdYbB3wxXoQjvymul9PszPtrnvc0GcV6iU8w8QlQlm8vm4pQffwfP9EZ61gKTzMpXt7a3
	OGOxqSDby6imJPYn+4uYpryBXNkGnSgIk4CNpCT7kQ8mfwojr+1VsdZCjmJnzwB3j0giXDT9cAG
	24Rvv37cUDPCaIW2Kz3YtUaexPRIsrKSi4Z/DCwj4O+Jb4aohfsrOkIAKqwf/AAztTq8O8QUz+6
	pVqS1ZnORsvQbiCZOQqCKRt81g50ByL+2k0lpTQklFD8XM47TYVI86QSGlyGhkhps0ojAC7rXck
	PG0nWCLMWOlaZsKE7a4ZlEkwaz1v0sQ==
X-Received: by 2002:a17:90b:5346:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b26190fd9mr35663528a91.7.1788788902824;
        Mon, 07 Sep 2026 06:48:22 -0700 (PDT)
X-Received: by 2002:a17:90b:5346:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b26190fd9mr35663460a91.7.1788788902390;
        Mon, 07 Sep 2026 06:48:22 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm20826354c88.8.2026.09.07.06.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:48:22 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 19:17:55 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-shikra_stats-v4-3-3825351f9740@oss.qualcomm.com>
References: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
In-Reply-To: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788788886; l=1012;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=SevN/h5S6DPgIuqMF/YDcs3elkEIxRkJIUzLiwNvHUw=;
 b=ZIyCryHXV2gt2/XSnLwKMB+WPlZjjZsOE12H8inwzxYUxB+L1C0SoiX8QNjZqh24fhoIxwWtV
 O5rUihrTob0DEibps3Eg5C1WDdR9s7htcDArZfz6bT8G9Fqh8hOOS5N
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9ec0a7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DU1Wev2QKLRUMiDuaJkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: m2kvFZ1NNnjw3Ce0sC9G18I_zeHdlwHD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfXwn+EeQpuEZky
 zJgWzPn7up+qu9B9m+zI+dr4Ewd8JUp6LXTlEumsd1HFlXNfrl5lTX9Pb3QW2VMbCxBI4dwjqmM
 6VHMx8KA23YjIj9t1j1Ej8nEg33GJM0=
X-Proofpoint-GUID: m2kvFZ1NNnjw3Ce0sC9G18I_zeHdlwHD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfXzkjW+dtLy4Ww
 Y0FDVGUDlKRSCP40fSZwx8WLNU9OgtvltJL7kTEkL0g3CuRIjUcxg11WhAt58nif1eXmQU2uoIQ
 i6npH2gkGYQyVepA1q4PxYoKfBp9c34RDJlRUpDSUVhz7zad2XCDV/gCSPt4CyVmkR+7nijpKvb
 cCcrqk1ohTJHGDb8r/LNpn56l0oqKMr2kf5lUDcgIvPF4O7fptlofFlWeAnUlpEIVSoQS1Kk5E1
 uZaTd/SCz6BT+dKmN3z7yQhf3Qp9WOHZdcsXqFRNn1whpVbrnxSZA+c+DXNDPtXu8jWcyv4Ls5k
 iiilSAM/aZoXUQjKOaOYeKeG6Q+UKVO/8tK7zuLvI49UN5ySZ52+hJDxkI+nBjtUdik/GewImqq
 ZZnpjs+9cKiykjF2i2hlMvUtc/xuYoGwFbhRB4z6KvyzBmtlPLSVVJDDJ1R/nx6UCcBeHoWk/Iz
 6Vmykuii6kQRMiTEv4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070153

A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
stats like vmin and vlow.

Shikra SoC specific compatible allows reading individual subsystem level
LPM stats along with SoC level LPM stats. Change it.

Keep "qcom,rpm-stats" as fallback compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..b299f316e3c61858c4b380f6211d0f36ef9fecf9 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
 		};
 
 		sram@4690000 {
-			compatible = "qcom,rpm-stats";
+			compatible = "qcom,shikra-rpm-stats", "qcom,rpm-stats";
 			reg = <0x0 0x04690000 0x0 0x14000>;
 		};
 

-- 
2.34.1

