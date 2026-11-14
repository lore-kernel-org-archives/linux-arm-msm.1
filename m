Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625769;
	b=bUOR2E91qDV5SNT8VgHpIAWYxZYCamqnRw40ZVhAhf1mtL2kKhLpTmI5b14bOU8f6cbT
	 5mahdPSnSPzYuR3d8oTp0es9SPav/wfas89O05SLq1sLhQE3O02PHRbTx1TC9ZqWLLvu4
	 u67NydY7eeVZ8p18UgvVP4VwVyKO8wVzbTWDAT3ckOM6KrhrBlLhuNsXLV22zHKhdBFVk
	 RlKchb7WFX/wzc0Z1b/spA9dyOAACtMUsCOQW1vSqq6cipDbBPSGaQ8Wf/9BhxdLUtlIz
	 T2zbcFfsnUBbLa3cj6Usfl78+Ba85ONDyTY4IRlpBNu0LjlwZR1HX8qZUZLQba+BtNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ylAMagY5rPOxgGjgaSIcrF7Y//hs/bYbPqW/zkj5EBg=;
	b=qH4JGf7j8xK+hyUXTWgGS51RGJLQ2XSscCqqBMJzDIlamctf/Mq3wG6om7RlQGs8q7Xz
	 bKePRChmSF4YgXSkbR/t+Y7Xd+Y46vEwj/ajlqiAUlSj7oZ+HRCdWzo6JTbf5c7zQ7OKV
	 +I6iAQ1kyObH2NzVurr5UXqCHMbVqpbGAZmyBpRZjMIQgH4ZfcIYAxbtoa1cBqiO0YBGZ
	 fJ9uxIOjvECXDw0m8Rf5wC9MU3e8CBDMBsn6kAfml8OHRzv9oUIdyGkXvBQjPcyRvWYxE
	 C5TAo/6RQe/6vRbqPSVTypa1bJvDrcVmrcE4BIoKknRck9TkXD1I6H5I1b+Faws7t6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KhzPPwlD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TRqSzZJb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBED606A33F
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 03:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CBED606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KhzPPwlD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TRqSzZJb
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE20Dum2175589
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 03:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ylAMagY5rPOxgGjgaSIcrF7Y//hs/bYbPqW/zkj5EBg=; b=KhzPPwlDNmzZsIoR
	H00OnEl7/kX1tlPRMexasZ/r7bTyeloozJyEU1lxIw3W0myb77SSMiuLLRw8wge9
	YpuOc8GxA8hUmmF+PTcdYCBRk1dcGYTvEGV3U368p9j8lT+WdDmg3m4dvV2g/G36
	MJGuwCjvdGtTnwFxOZx4cAlzcPM0Y7YDwAk2ehrjJozpKmpOkNIY+QFAJxZd7as5
	pDv5Kv4gNXLqMWah4QFzpnfLxp25i8m1lwnBQNiDMX6VNheRN+denX9OcbD7GEBB
	88FuDWne488pwUthOAMJr9J3QbC4AqG83DwIQTd/ZvmKLWUc82vLWodDxSmHQo81
	e9ce8A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxdwwg71v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 03:09:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37233fa9a08so43247eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 19:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794625767; x=1795230567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylAMagY5rPOxgGjgaSIcrF7Y//hs/bYbPqW/zkj5EBg=;
        b=TRqSzZJblMUO4su1u7Fa6h1vaEgSUBnl89L9HTjzOoVf2zMb4Fx/ycJm99hg05cRm2
         ZU5sthBFwslwGd83xmPzy6rZy/MEYLkAaBS0GBX6f3awnFkT4bGdhfc1RKPVrgjI/Rdd
         crpeatHXHawwx8pEqJeFfgyBI0T/tvMRmISLtRooD7ytIa+pRgaEHk++n3JZ9+Gbl0Sj
         Qdc3PtNmvbW2TlgT7x2xS57LrANzgHju3ecY7pctJC/gcRDvDuZEpv1MlRgB2PS4pNRP
         71vlh6CM4v6OnZ+z7DKbRvRSlFsSk4Qw8n7usNY6+CwpZ0u/rrHKTHopTG0NSHDRuhrV
         wZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625767; x=1795230567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ylAMagY5rPOxgGjgaSIcrF7Y//hs/bYbPqW/zkj5EBg=;
        b=ETf/LD4vvlcO9xnUGy0zF3wMWBk6u8Jb058R38AaBXImI/hwRgHW/HeFDUoRIIOp1v
         7gM7StYy42VjtMRRJ9oGSVLzFGnjBekQy2JtFrAyCYm9B+w+Ijs21oNyOWN1w2dp0xWC
         YBEfANNjTk3mkHnwuG1t+CPoPRicg8mum7hB8pAykxJEQirNp2OjtdyD1cPeLEYg0oWz
         v8Mg7ebrM6qpAwLrhEbu2NnhaU4gX9Jl8dmNHLVrJO1x0UnQXPWX7KhzMP2sJOhjMANN
         1OxK602fh/xZi4FJgKNS2IJjKL7+pv8TXqdqswxX1suZ3KqZD1+yHTmGJDFSFqLNS6iv
         BH6g==
X-Forwarded-Encrypted: i=1; AL+hErHJUq7MTCN+c7KlMTIZmqbV4gS2n0upLQmmeX1efenq8Na75XGSl3w1TmnYBZ0wrRP0rYmQEJ/EuaFcLHiO@vger.kernel.org
X-Gm-Message-State: APuU4Z9j8Sbu88GMETT2IjWckyyOZDOvE7uX006Kytey53G2U2V6qhwX
	M18T4t4SraZ1R2+JlZK7r7igi86IzPqXMcsBf8VU/ED5adeXJhyf/zeoRVm/+ttl/fisHfSIgKE
	NRbs4tkGVCS7s6l0/TmeSXyScrYq8osF2Xb4xabMeR5WrV0q7tBkStePyl1nkyvty6Gh5
X-Gm-Gg: AYBFou0QME/FCQL0lT/3TSKBsN6kvleQVYNdlCnQ9glakRVOkwpvvTrYMplBnAxCTmP
	KnVmfpt/m5F0S1VHrZKlH8QN5Gv0jkTO/U/M/9HshrpXYr6ElW/LT5XyEkDqeRlWz5gRg9U2zH9
	M/VI2ZVAvjZI6UXqJldYx12dZKIs7xqi393FE4x2fUkFz2SdmgQqXk9CjoKLahgnm6ZVExTSnQF
	pFxl9HHKgGmbOG4DT/A8rXl5+WmzTJz7jUyVRwSdEkw/c+v0Vmx9s3zP9nGIw28oMKtwtMJIhiE
	7aeiPXd+AuP6lUFiEJMHacwKvHtIFODATxjRyUKngJckAjpHsp1mR2ejprY9ODblE0zL1VSfam/
	PGoMr441Z/oq5c5G2p5+kKp6PKofemeZWnxLQ6tOaTVeaRwKfHyQOtwq+UXnP5HazaEEcEDdlYJ
	mXgBLQZkZWNOl+S1ApRe/0rYbw300BA+QW
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id 5a478bee46e88-37964e03109mr7463942eec.1.1794625767015;
        Fri, 13 Nov 2026 19:09:27 -0800 (PST)
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id 5a478bee46e88-37964e03109mr7463890eec.1.1794625766486;
        Fri, 13 Nov 2026 19:09:26 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm11158803eec.16.2026.11.13.19.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:09:26 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 19:09:23 -0800
Subject: [PATCH 2/3] arm64: dts: qcom: mahua: add iris video codec node
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
Message-Id: <20261113-mahua_iris_enable-v1-2-b7107e1cbcaa@oss.qualcomm.com>
References: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
In-Reply-To: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794625764; l=2554;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=NIhQBb10oAVEd9idm4CYEPbkBor2YqP2ym0YbzLwWeE=;
 b=QDCsI/X5bqUbfX8kcms02h2BT3/1Mzvp2V+vSAQiU0RuybZJjEeM16F6UTFxKdTALiYzPzjRe
 I5e3u/0E9JOCF9pqhPP7PpNPZuQBpCuJtevklmwBBRohvgMH10knX4B
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: 8E1FWXiChIBBdynSrEnZPog3izxJXH5V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxMiBTYWx0ZWRfX6/n1ANW+v3/l
 x1826ugyiwE65KpVagzu9SAPF4bmSWtP7By0teTpu9oba6OmI6fH8AIzw3bKvlrdzf9sAc0D2mX
 /7QJPwk3C4et8xR6l9YsBwyIGhm9xac=
X-Authority-Analysis: v=2.4 cv=eb+o7LEH c=1 sm=1 tr=0 ts=6af7d0e8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=A6Af-tnAtVRmK4LPXG4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 8E1FWXiChIBBdynSrEnZPog3izxJXH5V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxMiBTYWx0ZWRfX4kTR2z9iJOrb
 xlbMM3nEfhr6VWYJVDSn9QTN6vFjYt5Led7rinQckfp/cxboPOnggNzosLL4nMU6CcWI7lm4j/S
 5FZmEqJYx29sB3wRV2EnwqU4wQFS+M7wi1CDqUcAqfkLXYZFzJkNs8oN9etjNcmTL84sytv619V
 9lV0Nl+srKMZMHsERVKXAc8iy2776CEfNeXHf+T5F3828DFAc2NFzcjPNYole9QQ4Vdrye00xkQ
 6w8vZEeH4NpwQLzlOtudn7xJz52TsyuRJ+tcVSTVtnEC+Q0XhkQkbKnHqV76+vyGki59BrKVPg0
 e+bW8YM8eW2VORgu7N4ybS7uiXpFDmMlRP3f2K3mmeph1CeK0d05i409tIJ1FwcRMDVNZijIk50
 N5npgIWB4koxK3XiIx2xmzxfndw0NzVfkIL83jtbAV0nDhGI7cN+cIZ37yBSObGvr6koIKaqIj3
 kVgZSqR4kf8nsZZIVZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140012

Add the iris video codec device node for the mahua SoC, overrriding the
fields clocks, power-domains, resets and opp-table reflecting single core.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 66 +++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index a59c5ed7b48e776841db58e124c4d66225faccf8..1d01655e7623d13c43063b74d2ab086d2308e3ea 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -400,3 +400,69 @@ &tsens5 {
 	#qcom,sensors = <15>;
 };
 
+&iris {
+	compatible = "qcom,mahua-iris";
+	status = "okay";
+
+	clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0_CLK>,
+		 <&gcc GCC_VIDEO_AXI0_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>;
+	clock-names = "core_iface", "core", "vcodec0_core",
+		      "vcodec0_iface", "core_freerun",
+		      "vcodec0_core_freerun";
+
+	power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+			<&videocc VIDEO_CC_MVS0_GDSC>,
+			<&rpmhpd RPMHPD_MXC>,
+			<&rpmhpd RPMHPD_MMCX>;
+	power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
+
+	resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+		 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+	reset-names = "core_bus", "vcodec0_bus", "core", "vcodec0_core";
+
+	iris_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-240000000 {
+			opp-hz = /bits/ 64 <240000000 360000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-338000000 {
+			opp-hz = /bits/ 64 <338000000 507000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-366000000 {
+			opp-hz = /bits/ 64 <366000000 549000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-444000000 {
+			opp-hz = /bits/ 64 <444000000 666000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-533333334 {
+			opp-hz = /bits/ 64 <533333334 800000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_turbo>;
+		};
+
+		opp-655000000 {
+			opp-hz = /bits/ 64 <655000000 982000000>;
+			required-opps = <&rpmhpd_opp_nom>,
+					<&rpmhpd_opp_turbo_l1>;
+		};
+	};
+};

-- 
2.34.1

