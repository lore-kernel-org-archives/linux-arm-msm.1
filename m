Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996315;
	b=Ujhg2QmTs1Mpo0JQfIIPi5V1OZ/afjs+nQT+g3czwW0nAoOxEsHS1KHa41I3LUKDJz/L
	 rreiZWQamNfTEYxy3QSxYpisxya1pDHW9wMZDpGFKhxrjEnOqT0WbnD2rwVakvqKCdcyU
	 dM/lhJDP/yfBwTGHQ6GXpTYSX2VRCUybZ/0fbncL+Wa3/lX79NHDsURvJY59reSaBSlUt
	 xtdL6cSuVnWhAlI0lpMw+1qx8HgScdyaN4LZ/6xkTFO8evHbwTrBtDJ4VXuGsHMhU0RIM
	 s2SEd0H0X12ZHEM8iPE6BAkCV9KKTZOFERJULOAdMyJQz029ggZYVVIGRgk6SC9X9LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996315;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dP4h85XmI1oLNRq4PDQGHhAv0vu8uXk4BOk79yd+920=;
	b=mkGYJZXNCs5Rl6nLmhH1Cp64BkRl5TJkGI4taSBTJxWbnn7EnPSrqwtPgUP37DB3iUfD
	 r2rWwdEqjWo8RMjzOO6wDZUrrnpsqjIydya7Q+ZHj1JdM1wxp64Lv4ANdPlz4q+8HjRJt
	 M2ATPP7KbyScXJ7NomRMCHr/VUqdB8OOPKB82oAZrNmBRzXX0RqL/+zvao6QWC2qv/2z7
	 KeWzQYSlL0twfCU0OamkMpzs2KvFFwbUDg0f6OEZ50ac/UUkVNcdI73cCrk0r1daMs3b5
	 Fe5r0QvFwUBiLv1Yv9VVgNZFQ6xFsWFPYLaD6BOgYM8T6ftek22O076hje5I7VPVNCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c+lilmnQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="c/9yIMUb";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321F2606A886
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 321F2606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c+lilmnQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c/9yIMUb
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9k8No2398685
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dP4h85XmI1oLNRq4PDQGHhAv0vu8uXk4BOk79yd+920=; b=c+lilmnQUlGKm6Ju
	ilTlBRRDIjYlfWlhp2mabYA9fwX7gF2VnNr13rhi1LQ8H0cQq9Xf/+dqjB8S9Zba
	0ar9YmYGvl+QZhOlgTqmvSVHw6wnOBmhUi9JAvaq+/vro2bEkBycsTjG4Q4U/T+3
	wdI/kl3HnlkmIgH/NYStQU68yN5Xfj2CvW8pVKgPWlB06/rn3S1YL/He8o6hSt2n
	tMulpzZyQsEZpE+phNsUD4lnSftBZbpFxRnEDiEeG9t1JBXdDNtLRLez/FzGwh9y
	pbzOAoC71yakzZctIkszwcG5jbPneoynvjl8nqw2hJWzwWfERL5V0kCCvwS+GmGm
	A1Odtw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv92ft2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:05:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91ec6cd898eso15196336d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 02:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794996312; x=1795601112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dP4h85XmI1oLNRq4PDQGHhAv0vu8uXk4BOk79yd+920=;
        b=c/9yIMUbY1sWLzz2sq7r/RG+SaM+oDEzq6kYxDoeyfQFY6wo2Fh0z2RGr/6s0soWV1
         jCXrfISo87ByVefGbcndGtgmjqNEiPAUz9TjAfiPcWilA/mM6F+jn0Yqev87N7VN7MzZ
         lacumYNqSHfZ21mA5vKfd2Pg6UbYYiBVEYnR4m6NzyHdOBNIgJfFNXBfsKeZNeWPH4+9
         FE/fqNREq1/suWxCjVFITX6E8ubeopm3+vgaOIXC34zkVjVz1fGfwqmC5ew//8b84/zs
         CnN0vDXL5Ej12iO8b5FnFNolJEMdMsSD2zXNatze6Hez/go3AL0B81/4vvZ/l5ozkxGu
         unTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996312; x=1795601112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dP4h85XmI1oLNRq4PDQGHhAv0vu8uXk4BOk79yd+920=;
        b=hHp+BIwTm2J4O2yfhdk/M5UzGsvGy87fJtGI9llUjhsJjLAyKYb2z2aPFTcWwJ1wLX
         3oQ7tIAArnQTs8pyFWHlsf7VCcOlGyfipWxmC+m0EzdqHqTncJjhhYHAgeW1cxRvWtPg
         tALNInbrI65pY1PE2/fuQak+zuXJ7X1ecy3YRYA6l92/xBFjBLO1r+UBWbwCD2C5CK8c
         1PsicQqcgD/BmXxWodEVWxOo4fgN7S0whHkirD2zJ3D/VyeyrKndcc9DNXrued3tNKl1
         7+v1c/0XHqWpFteDpabVJNFt5yTgFcsEagQKTBd9Pvmqe6lYernOqT+f6h4kV3VLcnil
         qXGw==
X-Gm-Message-State: APuU4Z+pttRMb+Wyc1DE4IdqY2IyvXysBLQ8Q7ONo3Nz3whqI+opRUhY
	xYoTCY4jHyCj5GUz3K2zLIG3jZNBm3dxwuZIYNcUNl42N7xrcxfPK4HLh4Daep5DoGKt4iq3M1B
	ks00iXU8Jha+h4aRHTRftYMHwBxjxSk9yi89hUbsPfvEYUzdSDb9/BErYgZZBubneHWD9
X-Gm-Gg: AYBFou2x/FlHKB94XqDTccDxon7BT5hULFkl5pLIzkkEx0rbC8afWKsJJ+B7LTHU59H
	koBLVjfwVjBQGTeTmxcvTVEND/NUfmueTA75tJf4ddq2hTLV2cvr8NgyRSLHNjlscQ8eYEpiZB3
	85vYJ1AHD+Ga8SSUq0iFWGrf4uejiiP8BEFGnqxL43W/6dctrJpSeczPlPoHtaa+iImqoUDxBqM
	GBcuR3LG8CbfJOTPBW+ZVoiD/uIYc45oTlunJ/wvdZP9iPdBvPOGJeaUVleB9Mm0pzOquYSxckQ
	HtHEsK+VFZK/QEhgaf+WeNEr8J+toKhyjnbFXqsfdwlZnn+lujZBUETCONKfBE61q+h6YrUsjr9
	cGWB0IklHHS91Rq07Q1nwVjCxsANyyEqB/QkrEhXVPGeeaJDbc+9cD8Y9Ce0MZpdFOSLMs3LTQ6
	4=
X-Received: by 2002:a05:620a:2b88:b0:949:61c5:73b8 with SMTP id af79cd13be357-9499972bd33mr365002785a.44.1794996312334;
        Wed, 18 Nov 2026 02:05:12 -0800 (PST)
X-Received: by 2002:a05:620a:2b88:b0:949:61c5:73b8 with SMTP id af79cd13be357-9499972bd33mr364999585a.44.1794996311869;
        Wed, 18 Nov 2026 02:05:11 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609389dsm3735509f8f.37.2026.11.18.02.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:05:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:05:03 +0100
Subject: [PATCH v3 2/2] arm64: dts: qcom: lemans-sa8255p: add ethernet
 nodes
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
Message-Id: <20261118-sa8255p-emac-dts-v3-2-e2c365d95a0b@oss.qualcomm.com>
References: <20261118-sa8255p-emac-dts-v3-0-e2c365d95a0b@oss.qualcomm.com>
In-Reply-To: <20261118-sa8255p-emac-dts-v3-0-e2c365d95a0b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6727;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eD+JGrj/A1Wbvg7snYomXvbIuNT5d1KFlfmI3BIPkm0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq/XhQt/Xut0Hjz5TlihasvU4foTMGjHXd3xXFR
 tFoFj6MR7iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCav14UAAKCRAFnS7L/zaE
 w/pXEACrxNDH/kJlfodedNfAMRAYSPq+wl4VWBuwoR6KZ1YudJ1dg5WjjT29Ron3uL9fJtHeY46
 K4tAiyZxHZUDRxBHah12UqE2jlyUKeKeyenY5KATuJiUi6DBWJbGVLIj0tjTKJcMJM/IGnNjo70
 PjcZT1Drb1bmh+90bzibrhgFIahVduW2DQoRVNl8dZjwn1Y5SyV00UO9t9Xkc0bOiLTM8PRoTGV
 JdxCWVSp75WcpemdmC+1x+gC3DynwTMVr4PO5cksmnsiN2ioIOvN9pX7MClMjGYS7pjQsNWiH0I
 YBjivILUDP9aN7LKPs7jBjtBzDrIAshJDSeaRI4GxgNJGhBfRnob1vQkjqN6I7IhSCiZ/2y4Zbm
 W6BBDkSUYRLf340HpDDXD+c36REv/3Nvkg1UFkm0PUAwG3fCpBt3ieTh5ngMYcAr4tfz0U8JAHd
 16v35hRaMuI4jvVwyA+MDML3/ilUI15NrspE1/IsaKSVQWeqh9ovsKr+xpOBkmN2uMGuvSEOnQD
 mX8IE1Fht7TWZQyOHN7aXuJmbNDr1hgn3NWB0vGsd80XGG9pMkjtzoAlZP6bBF9mXoW74FkJoE+
 AO9kQ1j/AXTR6OglArvQn3cxR9dP9bp4xI79rmpvJkHDdnh6ocvLUJUwBnGxnwOsKqQoTK9+ucJ
 jE/SeOCPVfY5qcQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfX9ggjEUhGDr0f
 i2m7iWh2pp0Ja99x7keYqLZqfjJOaA6IoJiE7g3vIrxHMeXkU5MjDZdFbjIVhk+scIOVN1wIHKL
 o7TWU8Gu5kHkp9DCbWjtC7wVJ1aGiQZ3D3Zl6wa+uxg1D8wDbf0Omer4XrwvLWVFiouMq3mnOcc
 UK+WGT4BCOrkVagPh9507kL0RLPguQ8qCfJZC69R/t97dxCTLKJc6iRang2pt/pmIMTLoTsA0iq
 f9oEkiTACxq23RFQElyZNJoBF4tw8xNpggVOvsa4ydapnDSBHXQRWhnbFyrCnjvbp+1ry7s7Ac+
 fGnSZ+8cWU6ppiEYGOQNqs6Kf86WhxI700oIbwCf5OYMHLt8vLFMLOWIlkRgs459O0iCOn/vvjy
 jTCqQiXEMUlLWtrDorvz+B/bHP1GPYbqGrc4f/MiefyRpStQ95cqnuhfvqbqOs4qSpls83cn71L
 DqCiQ2mlNpzd1ESRAng==
X-Proofpoint-GUID: -rUQw3s9GQ5hWEGGybjs7TiF0MNM_vXC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfXy7zv5jR+BCbs
 zOWcoe85C7Uex1xvTauFidnf6+IIHnMQlZZfh+fD+p2Y7RgvaUbiUFJ08rBH+vPiVZSKk50A0lh
 JT+FY0DMs4QT+m5aJ38PDJB+piuTZrI=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd7859 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LwjCQcZIY1nU89AU52wA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: -rUQw3s9GQ5hWEGGybjs7TiF0MNM_vXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180039

Add the ethernet nodes along with their serdes PHY nodes for the gearvm
variant of the lemans ride board. Enable scmi7 and scmi8 to serve the
EMACs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  34 ++++
 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 201 +++++++++++++++++++++++
 2 files changed, 235 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
index 91c97a55f2787406b104650956b9a511a6a34c23..aaa8d96dfa61984afaeb13d7543140dd1724979d 100644
--- a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
@@ -58,6 +58,22 @@ &cpufreq_hw {
 	clock-names = "xo", "alternate";
 };
 
+&ethernet0 {
+	compatible = "qcom,sa8255p-ethqos";
+	phys = <&serdes0>;
+	phy-names = "serdes";
+	power-domains = <&scmi7_pd 0>, <&scmi7_pd 1>;
+	power-domain-names = "core", "mdio";
+};
+
+&ethernet1 {
+	compatible = "qcom,sa8255p-ethqos";
+	phys = <&serdes1>;
+	phy-names = "serdes";
+	power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>;
+	power-domain-names = "core", "mdio";
+};
+
 &firmware {
 	scmi0: scmi-0 {
 		compatible = "qcom,scmi-smc";
@@ -2898,6 +2914,24 @@ &scm {
 	memory-region = <&tz_ffi_mem>;
 };
 
+&soc {
+	serdes0: phy@8901000 {
+		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+		reg = <0x0 0x08901000 0x0 0xe10>;
+		#phy-cells = <0>;
+		power-domains = <&scmi7_dvfs 0>;
+		status = "disabled";
+	};
+
+	serdes1: phy@8902000 {
+		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+		reg = <0x0 0x08902000 0x0 0xe10>;
+		#phy-cells = <0>;
+		power-domains = <&scmi8_dvfs 0>;
+		status = "disabled";
+	};
+};
+
 &spi0 {
 	compatible = "qcom,sa8255p-geni-spi";
 	power-domains = <&scmi10_pd 0>,
diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
index 6f19064997a4b50525fdf630307b843604368645..991626589cc34112df6e024d988bf87e6f520017 100644
--- a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
@@ -14,6 +14,8 @@ / {
 	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
 
 	aliases {
+		ethernet0 = &ethernet0;
+		ethernet1 = &ethernet1;
 		serial0 = &uart10;
 		serial1 = &uart4;
 	};
@@ -101,6 +103,173 @@ trip1 {
 	};
 };
 
+&ethernet0 {
+	phy-handle = <&hsgmii_phy0>;
+	phy-mode = "2500base-x";
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,ps-speed = <2500>;
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hsgmii_phy0: phy@8 {
+			compatible = "ethernet-phy-id31c3.1c33";
+			reg = <0x8>;
+			device_type = "ethernet-phy";
+			resets = <&scmi7_rst 0>;
+			reset-names = "phy";
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+
+		hsgmii_phy1: phy@0 {
+			compatible = "ethernet-phy-id31c3.1c33";
+			reg = <0x0>;
+			device_type = "ethernet-phy";
+			resets = <&scmi8_rst 0>;
+			reset-names = "phy";
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&ethernet1 {
+	phy-mode = "2500base-x";
+	phy-handle = <&hsgmii_phy1>;
+
+	snps,mtl-rx-config = <&mtl_rx_setup1>;
+	snps,mtl-tx-config = <&mtl_tx_setup1>;
+	snps,ps-speed = <2500>;
+
+	status = "okay";
+
+	mtl_rx_setup1: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup1: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
 &gpll0_board_clk {
 	clock-frequency = <300000000>;
 };
@@ -145,6 +314,14 @@ &scmi6 {
 	status = "okay";
 };
 
+&scmi7 {
+	status = "okay";
+};
+
+&scmi8 {
+	status = "okay";
+};
+
 &scmi11 {
 	status = "okay";
 };
@@ -162,6 +339,22 @@ &sleep_clk {
 };
 
 &tlmm {
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
 	pcie0_ep_clkreq_default: pcie0-ep-clkreq-default-state {
 		pins = "gpio1";
 		function = "pcie0_clkreq";
@@ -205,6 +398,14 @@ pcie1_ep_wake_default: pcie1-ep-wake-default-state {
 	};
 };
 
+&serdes0 {
+	status = "okay";
+};
+
+&serdes1 {
+	status = "okay";
+};
+
 &uart4 {
 	status = "okay";
 };

-- 
2.47.3

