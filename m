Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478246;
	b=A8WTGnfoofq4CMYggYU5nG0Lz5pqJAW91J78r6Az5jSsOxN77RTNinKKiFzZsL9+SJkp
	 Sf3vQogYscNYENV3FE03BRuQlgPC5AgbTgyodSUAU25bqZmbfczq8OywElb3epEe7Uxrq
	 C5ySX5m/M6v3HS3N4NGUdQG+4S9trTTuaU81Htilw6Ncffq8iDaGZXdxkcVsFbBPVk/Gd
	 Jhp7hRkX+vkj4KVzxHpazlYslzNBiMl7ift/FpOk5frk27DJAwmhm+DZ0YSE5eG/ySgma
	 QWgrdIK/aDE0nBUCzftOYZbE83gUWCoStNLN5E/1oJCe3l3g2V3fapk+3z/fDhtdE+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478246;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5/pX7Qmkq+FsXAjiUnGVQ0SAZLUPJR8oQW9ZL/nzZpw=;
	b=zHaph79z/4c5Tp9yBSkNnvbH3YkeNGiOqdRLwUzui5utxSzb9/qZYVCqzcrDJVJ2DsNx
	 WnEhwmLV9vPc0vBX9bcwnZH6BHJnTvsQzSAaLGIgPl8ETuCvfMXKfezlI+XxM2lLZmTCg
	 ldWiVv+nRUCmZKgWyTpx+XGpjnz1a4q2yjru9DtOJj1bGWrMg/H+Rm6rV08Cq43Bamio+
	 Uvp+SRx7iDMO4+gz8bRIfNLhqix6YXgRc3YIDhrbOU3eWD8Ip+rjSnJMavIszWOZNL8Dg
	 JtSOqIb+txB/3bltkZ8hjdTvoX12JTBLPFcmmeYsMnzwzfNA5KWFwuqO7thpwOxZrNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=On90Te8n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LaByuWPR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD419606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD419606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=On90Te8n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LaByuWPR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tKPn4178122
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5/pX7Qmkq+FsXAjiUnGVQ0SAZLUPJR8oQW9
	ZL/nzZpw=; b=On90Te8nj7S+0SNpk4PUbooliAGaPPjvwOxNdKqK1dPomA43X4q
	fk2IFUS7vHGQsx93zXVeCh+ZGBD2brS6Tmt76mR1IiS/yVrlAc1WZ07suQhutdvS
	6O11LrKft2Sd30pv7x3V7vb4AJ6Dmjo7A2TNWjKg44aaODYYMSBy6dfl4N97Nf3Z
	vQj3HE9u9jZzNCnvV1nU4ppgko6+aHEHuAF88zSNZUnE++rsR2MqmHucRZq7l/Nq
	2RbgBiD8bLnZsoHPt2qnN7GlczExtjAYON9Zei35NTbAPDE0+0OhR8EzBaPTLa8Z
	gAFzeZxcQABt5tPfYDpMOcDDFCRhKsLkBgw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n162b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:37:24 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-18b5ee75447so4986215c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 23:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792478244; x=1793083044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5/pX7Qmkq+FsXAjiUnGVQ0SAZLUPJR8oQW9ZL/nzZpw=;
        b=LaByuWPRQmp/08VCDyjWZo4VWcA5gg36z+bxzO7ehKPwPXhRDPwwGTPVmh0mJZ3rp4
         EfD7ko0UEIM274kNw8x95I9D6yrkrShu20Cwxxus53qUvpNTkqI+M44gKLY6FFtmNJMw
         9NystLBGW1wy+YDIi6VPTPr2hrUWcLjfH0C6+iRSfJqTdd0valsTVKH6pejaOYm2wLCo
         0ax2+Oo02WZjNgyLwmWALIO5KehE31bL5VwJRdcELYgf88+3v2aDCvxN1vBKmNukVKYP
         M1eT4fvxt4Uknnle4BNEgrjS8o/+tCEElss4bwWhIR1Nh6CNkOJlMG1lN+lncvvSEhRj
         v3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478244; x=1793083044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/pX7Qmkq+FsXAjiUnGVQ0SAZLUPJR8oQW9ZL/nzZpw=;
        b=0p/zHjmuuOZr5aGv66LCcXk4yglBp4onHqZCNZLpvUNAyxotF965aF1WrifYsqIsqD
         2FweSeAh+ukHkTeDm3wud+0GtT1OM2dym2c3XAUAHHFw1d7xS08d9IjVBIlDFZgZTXAo
         +s5B99brx0uYhqTuF+3qVXKAOJ/4671DE+43XDY7j+Car4pPu9PW+GzhlswvMBOmGEGo
         SV5YgWcDQEuF1aCcG7ZvYkCFqevMKZTNTyEKQnnfLp3ewgUwkRuD6Ji8semoSXLGDUXO
         8lZL7YX2GJYf6EuOnvq08bjxMnj7GokyzyPBGi2GyuKSaN2wmg+JgfqMMsslyKEdc3fS
         EryQ==
X-Gm-Message-State: AFq9FYJZaXXyOvqsvqxS048vQvcuoI0DxqAyZ8S9/sTP2vzuf8poJX1Y
	WTZ4XOPgM14My8nnqOG1773d8PqbE7noNFqDWMn0jwHl4vcHKub4/8C22mm4K6CuSW5FcDKC5vN
	dK7kRhj9H+xHIPcu2PAFpFw1hJ0pieOQXdeY6eiEVB/r9Qlk3439CgIwRFBksJlwW3C0a
X-Gm-Gg: AYBFou1400Yi5A89AmO6yUHCq7JvQDuoHec/Ai7CFGOUCtWkmuWeNi1dr2tSSX7gZVF
	WuhePMAkO5KGslwYBjmFibdQQ/a1f70j2UXePmTm8c8SZlPIKcfQG+FVzxkfbaCZpThAm0hZ9H/
	fyR7I/9eVUCLgHzMnzJ70Cc7DmfoMlwd1LZ5S3sJ4t+Nhgb5W5h1bHaPwW9BNiONSOnkeX6sq2G
	kH5VAiLwWW23VWfJzt6ngfHXj7qgRY+msF4cTvNBpuHXSp9r21SZ64nXRP3k0M2OkGqOVt5n1RB
	g+ich0fhPCQuiFb5IY7apgIfvUr6O7qDdFuSmyt9MAEmBdIgb5pX0mur8tfPG3tyir3f/r/xylf
	rSTEet7IUAoVm+oXGfNwKmw7Y09W+7HbP6LMb/HsxjCf/kw==
X-Received: by 2002:a05:7022:b051:20b0:147:9ad0:cf10 with SMTP id a92af1059eb24-18514cf32d5mr15254370c88.47.1792478243751;
        Mon, 19 Oct 2026 23:37:23 -0700 (PDT)
X-Received: by 2002:a05:7022:b051:20b0:147:9ad0:cf10 with SMTP id a92af1059eb24-18514cf32d5mr15254342c88.47.1792478243242;
        Mon, 19 Oct 2026 23:37:23 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm30791906c88.8.2026.10.19.23.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:37:22 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, xin.liu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
Subject: [PATCH v1] arm64: dts: qcom: kaanapali: Split cluster power domains
Date: Mon, 19 Oct 2026 23:37:18 -0700
Message-ID: <20261020063721.2306679-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: W-ThbBklo9ZNT_ooW601J9omU99zLNrf
X-Proofpoint-ORIG-GUID: W-ThbBklo9ZNT_ooW601J9omU99zLNrf
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad70c24 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zuyij4ZH1eBwXV_bZR4A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNiBTYWx0ZWRfX8LaZzxkglp3r
 yAaBpZkD5PpU2oUCmn/EsFMJrVHmC7RyrmtgHbMZkvSTA3c2Iwuae5ZMGSmALlGZaW0ipN9YVgn
 eC3KIj7HpwQA8+yQytVN37AlOaxpUjtbVZN78TW8f1cjgFk0g//E5CIV51244JwZjIMpxFoCNhx
 UtdqA2EiI4eLEghOTTAxzdNNb5TwWo4M0Hs3psJKJ53QoUJ1kPaqkj3BSm3zR3Nrs7HZDgBWH6v
 BRao4GWjJAhDZ7TTsA69TLijv/56umrdhqkxOR6q2rGtB6mZLnzu932+mOm4tOc2cyls4QU60B+
 dkodKEl74ZRNF+9yU7ZUbxEcRp8vDBOn8MdBr/tvcpZIxetAlbvc8cC34ODdr4Z4MT9n2PsMFIB
 5CKp9X1MXIFdzKtlIgfQDoifT4Xt5x+wI38D5on3+C/cVPYvnEVXXsqv9uxhA0y6m20EzFA5IzD
 P0CA/shbdzoawvz4Bmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNiBTYWx0ZWRfX9fQjFqNd6ojB
 r5czEGVWiMSuiNm/s9NBi6eM/PV7OdsoQTkd4EX9Ju1sK0GydgDDIKJ5UEPkG89l/qEoGGIuKyT
 HUAUVKpXtDDgnBUTi66cwZMEI+o0p64=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200026

KNP has two CPU clusters (cluster0: cpu0-cpu5, cluster1: cpu6-cpu7),
but both share a single cluster_pd. Even though their domain-idle-state
configurations are identical, sharing one power-domain node means the
kernel's PSCI domain idle refcounting merges both clusters together,
preventing either cluster from entering idle independently.

Split cluster_pd into cluster0_pd and cluster1_pd so each cluster is
tracked separately by the PSCI domain idle logic.

Link: https://lore.kernel.org/linux-arm-msm/1ee9b624-4580-4650-8e48-d517ce9eee3d@oss.qualcomm.com/
Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..5428f3f44361 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -273,53 +273,59 @@ psci {
 
 		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster1_pd>;
 			domain-idle-states = <&cluster1_c4>;
 		};
 
 		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster1_pd>;
 			domain-idle-states = <&cluster1_c4>;
 		};
 
-		cluster_pd: power-domain-cluster {
+		cluster0_pd: power-domain-cluster0 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_cl5>;
+			power-domains = <&system_pd>;
+		};
+
+		cluster1_pd: power-domain-cluster1 {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&cluster_cl5>;
 			power-domains = <&system_pd>;
-- 
2.43.0

