Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFC2516143
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982999; cv=none; b=Kkb9O0K3v/AD7VXjYuApc+QyzFhhNr9+w0Mqoh67No/Ai6p7w0RzqNgirq2JskEMaQdA6gjYc5r7I2j4RbVHPTajYHBqnROGmEDpcAnd2qlIViYDuJquXOI7hfHOBLHTrf8QzNL14mfoVAmnQBPbNVf0/kIGo8btLI4GfWAbz8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982999; c=relaxed/simple;
	bh=E2C7ZTkYR9vN+vdiOw63P9ddewcVLDCC1y4LsZe6sNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JEv31ugGC5TlhvSlEugvKQPWE88w6DdJ6GoryLCjv3mZN8ZzUth4p2apYg5yLImDGZNAS923EjynHCc7n8N/KPcCIn9frG6GKobcuRxJAyqpH/QddoxAO2zBj2jyNVASsiRYpFdqaBLxp1Nwk8wVcJqKz9BqTwdMU1C5TwDt0nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RvMXjsif; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQm1PBUl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RvMXjsif";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQm1PBUl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9hhS02222381
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RuVrYLINDl9vlbsbDPOgWI7Zdrcg/n64E24A5ZiJTBg=; b=RvMXjsifKlNt1rII
	fO55X/g4p41W+W1KVzo87l1zL49WmC9d2lyhkP+VeqNWak5khUcmbcS/qlN/l8Ky
	9rXz4vydkRJpeueZ3Sg6ulC3slMgtQsPCOAnDw3fhpdvOwEWE0dEM8Jl7CdChTsb
	Q3AOSLmdngmrliLne8DPzQo7tQ9ZYLO4KXt+1mc5lgQ/qNlGdN2raFKf5fnz7kc6
	VO/N3idg2CaGXT4FRxoB9YjM490GVx39VKuNKW8UI5rnASxSBjxrCxvsPg9MLKmN
	lm7BiqXBvF3B6CcnOYYJWDOqtSXGculT6o3uixXE2B21MQJAQ+Hv/1VRy2Z7eOrG
	yqnPog==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsbqn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:03:12 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98c6374b678so3060338241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982991; x=1792587791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RuVrYLINDl9vlbsbDPOgWI7Zdrcg/n64E24A5ZiJTBg=;
        b=AQm1PBUlG+4xeWeVVHwPvt38OXh7FvF5MCnjHnDDi0HT3R7UN74H31sVPZpyLksI55
         yNT6pU522/f06iPhfsGxuVRNyU64aaOhPACeBR8pCw+E8tA63J88HT14yoDepIf7GcKf
         9ez/Md9A2PPUgGhPgvLG21J0reRDVXXyughpC+N4tNM9xcdaePkKKFYsDQVsfKnCG8xx
         RDcGQYnrTHOWVo/9Ec4HZgAojg7XJaTHmApeRJFpr1hpm0pRWGjv0pbO7uDnSvxKqet8
         wKgg+zC3RMtYj+x+5c09tEUO/OsqCa5BGUkqhj1NrQGUmbnNnripwDUGPcsFdrfJbOi9
         Eoyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982991; x=1792587791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RuVrYLINDl9vlbsbDPOgWI7Zdrcg/n64E24A5ZiJTBg=;
        b=Rl0c+SN79T3jMPHrfk+dOFpeWYx5Ssi+zLkEJ17fCHfxnqXJmJ5Q0SS1DQjPchGAp8
         YutUphEPrqAy8rgFhnWhNfOB6eJPw0uVqpl+5b0nsvM/leJY1w8RgazOu9AGjJRrqc8r
         HmmcUjgjcPNDd6qFyINCaj8swRAyvLQCp3nmo/N1h+4B8ZUiHrlj9TZshoyOkg9m5vgT
         geqUy0t2/ryJRAg681TWGccg58VJyVtcx5eSNwAigpd4WU/XCCFZDcXgDwxDKJCHrrjZ
         dVS95oLejs0XCOB+NDniAu0dp73926FuEgi4HBI8p2VCVuCfmxK6IlmC6CYV03SMvB3h
         8jnQ==
X-Forwarded-Encrypted: i=1; AKwUvByU9z9D6B5rQ9gu3liVBk9/sXBRuRx1birH1TGblRdDQxEaQSmBCrtsujhKNHeh/zS1Bf2Qcba/mWPbmmO7@vger.kernel.org
X-Gm-Message-State: AFq9FYImmbgN6NbNadr3iYoBfVl20IuzKs7uJqlRuUBIiPXuqdQsWyzL
	dfSz+/d/B51SrJHq8M8l36VxDySnO1AW0495ZgbSNM2Uj1nhBvX2kxOYrBAQm+qixY7Z7w5C/lF
	IRE/kICZxWw9lC8Rz5TXUMDq0F9V76+NtmqrWNH9NbNCXyRTVWC4YXT+1Ql6Tcc4R3SQP
X-Gm-Gg: AYBFou0VgseidY6KyY7qddLVof2VfeBCNLP+k1vdYgLkGqdEuE7fzT60SWr5uYN5v4o
	4cp402sWKpHt0XmSfcSO3Lfn3TlDiCijCbdUCLxoaHME3Ksh7OGxbCVy+3rA0Dhj8IdjGEdMatR
	xmE9o9zHs9aiy/ipMq5ATFOnnl+gh390HhcDx6/GS6zLninOIc3QoFexPDmb5k/LN7OPBWqf32C
	cv3puhIiMB7BtdmSjBZxC1QdAU8s1bNSG6gpTy3hr9Htcbm5+A0b35Z+Y+1ZPp8bMUOiXtohhlT
	KQXd5VP84QMk5vMNDKtyuvvR690FWKNkg9XLRqRyEMh3IDq57rpzBJ4nq5yhQFmPVfieqkN1Bcp
	hZ4TYdOVVPw==
X-Received: by 2002:a05:6122:2194:b0:5e2:dce7:2d35 with SMTP id 71dfb90a1353d-5e91f44e9c6mr5335584e0c.9.1791982991194;
        Wed, 14 Oct 2026 06:03:11 -0700 (PDT)
X-Received: by 2002:a05:6122:2194:b0:5e2:dce7:2d35 with SMTP id 71dfb90a1353d-5e91f44e9c6mr5335558e0c.9.1791982990526;
        Wed, 14 Oct 2026 06:03:10 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcece106sm567795e9.9.2026.10.14.06.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:03:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:43 +0300
Subject: [PATCH RFC 5/5] arm64: dts: qcom: glymur-crd: Source MAC addresses
 from a UEFI variable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-b4-nvmem-efivar-v1-5-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2060;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=E2C7ZTkYR9vN+vdiOw63P9ddewcVLDCC1y4LsZe6sNQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqz319fp6TR+yR8jNw966xWlfX4ZKxxMxwQAtGC
 Y5X7z2YpXqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas99fQAKCRAbX0TJAJUV
 VobVD/9FR+oK6sjkKteWETGAXlgN3C8denxNZe0WyouXGAVyEW12pOEEF8fr0C2OgAREtKa8eWx
 CZb4fsGAvK8yJg3KZOKUfK5uk5m3ZMHS3HPIWJbYxJngQ1lCafkynQLa4H4o4FJwKhgr+ekSXda
 JF1SVnurtaW6JZ/ykrvQlE/NoktVV5grv3NIB8oS7qY6+ZaKslQWvS4t2urpFaIm4g7vB6bFCSB
 TmqO49Bu1lO+3aeGr9yzXDd2h2XwyLZg8ONQxt44WLSyR4XOx4TiERP901FshmhB8bnbyb8sImX
 ZgtkhQX1BmRyWve2OxnpimwSGJ9s4jDpa0YrLttVmpZadBf2FjEVGxGOyTJh5WcIkqmnmuie2me
 SJYwOTtAlSMM9uzP7yyeUKy7r4w4DsWBAxfjLPnhW+D0IAO2Gbkl5u9JBNgV6hGaTqRZXj7eSbT
 PPFg6alEbLkyqaXPSZTdCdqt4NQAFDmaktq7G6XOgfC51m4bkoZWQGT58xvxtpY2KLFvcBU4j1L
 hTyjsZqvlcFaH60ghHVuTjnLfSfOttEqAuPKd6FwxWngzOuoQN8icHerDTx7m+4zWk6ycrbU8dG
 b73v7BApj+nminpuLcxv9fGjYYgjQsEGZ+yJaT0vE/xlwuyfdUWYilXyMp/42KgLvBLZKiJ5VxO
 tYlAxVFim181Kuw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX21uuSaEx7VqD
 Snf9DX0iyrcA3THjRUU/03MWLHfv3oAGtcyJ/r+voT5x/Bx3w5h4uij2+0Z4bUDzP2JakvW8Wu1
 woBGVy7NF4WbETZ0t5tSygq4OJj5of3Ti2KYK8P/zjbC4HdspXLvLoDqwJQI1i5lpKZXNro+Qau
 TrwLbJMAm4gjQZpPcAiFYBt9EFzhYj8h33g0puhsBzBAOC/kHH/LKuuQ0whQJ76q4LJ66i4QVWr
 wYwIWxGIVKXi4I/AjvlE75XU5WvIO6IJJiLeoMJ72QLJ4xhOimfy/N2TGeBs88Qo0Zn5qYJWLZm
 JeVcJwIbrs4kEjPThx+IG2k294MMnPX5Xu1ovZqsU8cHKPr0xI5THG83d3xNI8wpoU5NJCj7rhw
 Y78JIn/jWogjVGml9BfhyA4PU3GJw5n40vTwo9/6yiadraW0KeOd2735/7y2OE3hiYQAMTkpZJp
 6XcSkdPy+VoeAfHsVyg==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf7d90 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=SUfgz0WXR8OkDwgVpNIA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfXyUB8DlCNErwP
 G/BULgWhrBtCvkuO0Qf77pIMyTZrZ4ZMM4WsK1I64pt8k/DFRJOkyvP6cTGspKKPlYVIfz1kQWz
 jvzRbB79lUCa8inOJSA1MpNgOcY086M=
X-Proofpoint-ORIG-GUID: Ar5zC4RzFDiCcqpT7V_BdGFmkt7_BZ5Y
X-Proofpoint-GUID: Ar5zC4RzFDiCcqpT7V_BdGFmkt7_BZ5Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140051

Add an nvmem-efivar provider exposing the "MacAddresses" UEFI variable,
carrying the Bluetooth BD_ADDR (bytes 0-5) and the WLAN MAC address
(bytes 6-11), both MSB first. The variable is looked up by name, so no
vendor GUID needs to be hardcoded.

Wire the bd-address cell to the Bluetooth controller and the mac-address
cell to the WLAN endpoint (pci17cb,1107) via the standard nvmem-cells
binding. Until the variable is provisioned the cells read as zeroes and
the controllers keep using their default addresses.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..2dd09ab1d550 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -31,6 +31,22 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	/* BD_ADDR and WLAN MAC from the "MacAddresses" UEFI variable. */
+	efivar_macs: nvmem-efivar {
+		compatible = "nvmem-efivar";
+		efivar-name = "MacAddresses";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		bt_bdaddr: bd-address@0 {
+			reg = <0x0 0x6>;
+		};
+
+		net_mac: mac-address@6 {
+			reg = <0x6 0x6>;
+		};
+	};
+
 	clocks {
 		xo_board: xo-board {
 			compatible = "fixed-clock";
@@ -776,6 +792,9 @@ wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 
+		nvmem-cells = <&net_mac>;
+		nvmem-cell-names = "mac-address";
+
 		vddaon-supply = <&vreg_pmu_aon_0p59>;
 		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
 		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
@@ -1163,6 +1182,9 @@ bluetooth {
 		compatible = "qcom,wcn7850-bt";
 		max-speed = <3200000>;
 
+		nvmem-cells = <&bt_bdaddr>;
+		nvmem-cell-names = "bd-address";
+
 		vddaon-supply = <&vreg_pmu_aon_0p59>;
 		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
 		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;

-- 
2.54.0

