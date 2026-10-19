Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F354B270B
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402778; cv=none; b=UMy7YAVG/SrraUkyT8HJtf5Vcc3QSLosBx/FkAXb+Fd8yb3jFJRLDgOpFWTBpLzgadb24bhshfbZ6f9mNwIl/cZf33tF8hl/HDktwoNl3U8hEwh6RhxktDE+UGX/0bvgLjnEXJGLwbhUA668oE3inE/uJ+m3sGn44nFuNoTrVUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402778; c=relaxed/simple;
	bh=sAQjUxIjl8nvqblAqmHcPV7IsLhvqooON8HdUtzV9R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OyUGzgUJAZUm4R93n2glyCSPA774trySQkInfyxgqYMec2lQW5a3gLWoJ1Azp8ON8bqTJ6YQ20HBDACLv65HuTbvLZ82Clqo3/f+J1VUJrp0lPOWfKz5r9hAjjXdgjozrhcnKgiOTzfTsPyAE6nLnwEZZ3eDBHGSA8RdfiAcELQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6c/Jr05; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ks8nCdRf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6c/Jr05";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ks8nCdRf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Yh7R2688724
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I+/LBRpEdI3
	GB5BT5qug2KBLpEPGdwxDFcSS+HFEn/Q=; b=B6c/Jr05z8UMPcAvpBGqFdob+a0
	aXhDXNejbcyyjTZiFKkiUIIwhIeFPqdSRIn4obWoxd31TMj1z6M1MTg7HFpgDYTV
	XIfGUhPtezrNoOlDDdvVyPYvhxpj4ACK4GdOYF1NaA2xgxRUy7+SP6ptcDgw+nM7
	/e64XAclVdbCuXySUfcxsXNKR3WynMLX0VGgk0rGNN2OSlStYEclWFc27uZ9VfXJ
	rCfKDNwbpYI9pjnT9rFk47rvkShmb2LWsE+qmYVmXkJCzuxl1TJkFrbdpmj/DdMW
	jcr9kLigzGZfqPfF5xCOQm62VpOVpdk4088kx8jeO5iH7c0t9vbtFPY/Isg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn084j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:39:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac882b3e28so501247a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 02:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792402775; x=1793007575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+/LBRpEdI3GB5BT5qug2KBLpEPGdwxDFcSS+HFEn/Q=;
        b=Ks8nCdRfqhyoHcq2FqO3i1rmXZVzsoEzCQSZrcJhgXOWwoaQBg/AKiM7MASBa4WuEW
         RoE8Ktns5+tZz9aPxucm/eoXS3jLkHp31zCYn/iyy80Hrzf6cxOHL2dLFOq/YYG8dIXp
         pE0uNF75jqE41HaMUtsDp7M267+xFEJ4/dVXKm7W1nuLrFoj6FDjkqkcSbP2j44oIv0V
         QKnWzc6hFSH4hHVNW2EHUnU5jLzZJKUselDsEdogAtD0yQgeMoE0ZHnQWQAwyP1Nwseg
         HZYpuaCA5aH4MhuSCnuSpqLkL6hzhKE5kCyaADf9zksCgDBMv2Bmjex4QR9rY345QVLW
         15JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402775; x=1793007575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+/LBRpEdI3GB5BT5qug2KBLpEPGdwxDFcSS+HFEn/Q=;
        b=tJQsyo30qGM4ik3PK6NHxqHt195MCVyi0suYkwGC6nDr709+34hthxvMJVuKthCFqw
         8YMkbP9SLgS9fROv3Sulr+HGYiLeE/xSKMjkaGz6wnk4dUJC7/SsfCeqqsBTnZB+Cmpc
         SiZHxLgqZBen+jVZa1dYtF+YM5vUxfjavujeE8O7qS/ztwrUbOjLRoZzHajW8FYnOPQe
         LERO0/9bRtPl60NRx+AFOOiXrA6aNLaj2DT/IalhigXXAAGAN/cpWbNeqK5Lo0lfOZOV
         u+P5m0kIeSLkjCb9360I1XghdCk7LawE4gpdwFbCUAoiI4HtNRC3ltflUCwgG7rnhhxs
         pmKA==
X-Forwarded-Encrypted: i=1; AKwUvBxelwO3a1y6kIanlqtjqOHS+vLUh4hwiT1xBPp6GuR41w44IyL8eZVXHWxNh5zPNx8lRIIW98ZJX5B3vsOP@vger.kernel.org
X-Gm-Message-State: AFq9FYKMUQfkLb8GmT8iKi4BFXJykyF354g0ZD1KMPI+mZM3udhV+rji
	bOVMBclbMorrnD3VzxvWbllCu0PNw0ZMI94vYCIYwLvS/Wo8LTpnC9mXS+9TlKOnkhAfOZ/X+E/
	f3l1N6MGR1ok3z7XFhmEJgTHp++U2kCpSAbNxypcW6k+9rEZKjJunIgtKWfQX+9zBbz68
X-Gm-Gg: AYBFou2NsudyZhKpwR8oh2RSGJYvSybqyMwShx91HxNjkAlY7rZrTMDdxkHRwG9Xu/d
	KUDDD+Dfp+QbFb97KRemctD9olASvdCO5yYtaBFBUylKmZ5XZGtY8bum2obvWu3gdEcC5omGSjS
	DKQU8JH8uGq8onyrA89CJT2n91t/PURJubyYzFgfFu4xB4l7PLhTRDU07pSxry8pUZiBcDAPcaC
	OlRkEVxKiw+w7xzX6jAa/IUvn+JAK2fYpIqwMtzEtXoAG2NWMuCUwEaXLnGCtuF6axoqueUwJQ8
	QZpzzssA87rbSMTQ/k1ucQqhl3wGszt9ugf9YBMjMBg5dVM4UcSYcry8GJyRq0EU9jCCyZfFOG0
	XYAuMkObGOi3cL57NbkmdTKH6EYMy
X-Received: by 2002:a17:90b:4c8d:b0:3a4:9d98:f980 with SMTP id 98e67ed59e1d1-3acee2a1df9mr10692197a91.1.1792402775413;
        Mon, 19 Oct 2026 02:39:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8d:b0:3a4:9d98:f980 with SMTP id 98e67ed59e1d1-3acee2a1df9mr10692173a91.1.1792402774928;
        Mon, 19 Oct 2026 02:39:34 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm19758688a91.8.2026.10.19.02.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:39:34 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: shikra: enable WCN SW_CTRL
Date: Mon, 19 Oct 2026 17:39:11 +0800
Message-ID: <20261019093911.3199891-4-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfX2Bh4rUwbEoas
 oiIp6E6J3Vw2flSlirzje5Xruf+qFPP89/EvXYiaSpDd2uitAJY8tcE9iQ1FkKGpx18BIKpDpty
 vIzAYLro2/lqAs5/7NfGRQ99u460FoU=
X-Proofpoint-GUID: hnCpyGBTF0tFU749MoOSKwjM6FCcRVWf
X-Proofpoint-ORIG-GUID: hnCpyGBTF0tFU749MoOSKwjM6FCcRVWf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfX7E8txeXmQ45d
 se1DP4pwXltYkEGDdUV5sEfvpIGVqb1kWrF8aLa/PHxZ4qwql9kIInBTccUIxB4onmUjqv/WnUe
 vmYw2bnx8LMCCnu2yiJ6auxvgo14lz2+u9GJYYSG/a3epy5bRbqT/l+rml4L3m5b1snDnwBQPSI
 pMWCuO+zpSXyXW0RuwNFStTKymvIx6ySdxlYQuihdmZaDh1CbOTPfCWdva7XG3PRv4x9n0G9L2v
 +E+mX+DBMsfpABnPZ4lDaLH53jNPCLtlC9hqglQJ3aYi5NMewuRT8lCYWFdfru2LG7vaLKmH7si
 KDcfeycc8o2Ef7G8t0/GT0JTx2yFtHC/MDHQzYHa74z6tx1vgyYHr+H5OujCbmgFYM3JSspYk0Y
 6pTAFKShDZJ4sSUJzw1zxe5deS4rm0rgvb+MaQwdOp0GHxTNofeCNEydOPoSOTXCSOKNpXABwZg
 xINbafBqVDq/BystAFw==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad5e558 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=GJxj0BfhqkdqIuq2HFIA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190038

The WCN3988 SW_CTRL signal can wake the application processor on the
Shikra CQM, CQS and IQS EVKs.

Mark the WCN power sequencer as a wakeup source so the driver uses the
existing SW_CTRL GPIO as a dedicated wake IRQ.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 1 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 95eb7255fb22..c7b894b6126c 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -102,6 +102,7 @@ wcn3988-pmu {
 		pinctrl-names = "default";
 
 		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		wakeup-source;
 
 		vddio-supply = <&pm4125_l7>;
 		vddxo-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index ebc3052d57a9..5edcabd9dae1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -85,6 +85,7 @@ wcn3988-pmu {
 		pinctrl-names = "default";
 
 		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		wakeup-source;
 
 		vddio-supply = <&pm8150_s4>;
 		vddxo-supply = <&pm8150_l12>;
-- 
2.43.0
