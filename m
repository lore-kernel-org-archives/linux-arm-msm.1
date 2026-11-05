Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884071;
	b=b9qVd8bOBlvIKQdc9RXbhDK5FTC/NB5pdQ5BsQBQMMT4D/TrBvcoXsbebgluT0COQaRD
	 XIk1jP3HbrGeUYMNjPj6/M5fEOHi99v7eG0Qxrnf1rW9W982VTMrWPws9NuqjRI3czaWu
	 8A8fio7KUVm4fRQ57NLb9ADBY5xkGpOGjzLiemPVM8hXLjxUxx5+yJ8M72kdRyhZI14LI
	 kvPINnvaDKC5nIrgdT0AvU8hx+IbPtK/8Mg1DQWOEp0DVoU+pfBHGL4EtKR/MlgtjMH6F
	 NX26mXejynhEj8JxtotnvB0mbr/QrKC0i/n+WXBeVY6myvyz7dP6wjphgvhR3t0a4UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0kaq2eX5JhBwGzI8FjgMD7kHw+EoZ1YtEVJNHdDTAco=;
	b=UD2eX/iGXXwyQw9Lal7gQ12DC4nBAhhVlHecvVR6NGTR5JtMgfbMOvFI0DHC2BJaGhrV
	 yWB5ujcvs1778n5A3sm+o0chzoBST0tVMH+HHNq/HaoLUtUkAlAlJ23QypC8PYM0l/n+h
	 DBoJ41G9CBwF315/iuJi7cOckm7dTyrIaELszlWsFOA0Y/Z/WnaLhGwU3bBGo8W7zz0Nr
	 UqPKP8Y9lr/rfbKPwOOmq9WKbj/y4omaNo8h9SX8z1+mZE0TJe87EsCjmEfbbmT47hbOu
	 5CD0EjomiSPvQKR9hUd88qaLRDuwVX0+PEtISOyCQRroiYJ3C2N/gCROGCIT8KMpg+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="n7HkO/LI";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wqjt+DRi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664F2606A32E
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 13:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 664F2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n7HkO/LI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wqjt+DRi
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tL4w083021
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 13:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0kaq2eX5JhBwGzI8FjgMD7
	kHw+EoZ1YtEVJNHdDTAco=; b=n7HkO/LIWLbIooaXKMNlyOgDVocBx1Smgvx+Iu
	mcOk4BtfrroQoPPbbcbJi/PIDgYJH3tbDpBTE9jfLrWZ6yLUGyICUMAXg+sj9VMz
	wx/ctuLPp1ba88QcNfLbn2eaFrEbmkGIiAx86PjShv4aT+SCjCU1Jh6RQ2yBlFSA
	44MX5DzlWP35eP8ijX9J1qPWAkwe3i+Dmv/tiuxj0PNrpRkmft2tupfDMqSKLmBT
	DZ4uo5B7pb0LoCS3QtAT4R6yygrkAip5Z+EmgWIVbfWXvh+zNxZlgg8T+/w6CAo5
	TVgFd+rN95yyQ8wmjl9zh2iKcvyHBc+fkse2VU51h0z1cCNA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p0ws3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 13:07:50 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67994010b21so3313723d50.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 05:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884070; x=1794488870; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0kaq2eX5JhBwGzI8FjgMD7kHw+EoZ1YtEVJNHdDTAco=;
        b=Wqjt+DRid1edpBwCvhFmiBZ1NV+2agKZn5xroDAu0syH6VmrCBKYZ2XlQLzbtyCqXp
         oe+JrU0XaHUM+AQhMb1/MiQZinZAgpoRktE35Y1O4TknNkuZlFoMVNob2whvdOcI99Jm
         LWLCqvBYsE6qQeTmqThaszdoWUlNDjpB/oczUSCWdC+B/YoUG8+zdGXDtJPRz3TC0tdY
         6+1/Mx5emugoCvmyo3h3qD3+DRlH4K5fDMson2m7+hogPqgrIQYqIxrlsSer4idjUQgw
         rdECnMXuFgSLfixkU1Bg6g7x/NtZ8mSAHmErNvABFkJG4EBYJiMxlzlthWpewB02J036
         AyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884070; x=1794488870;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0kaq2eX5JhBwGzI8FjgMD7kHw+EoZ1YtEVJNHdDTAco=;
        b=yE4d9Yvx3PjHPrRcvo7Oc+pLo+Dm+9sq/ifG6JxvnEYsWrlbmI08+VG+9HvNcAOQdz
         aVsiO+DV26e6aJ4DczgYBoNh5HKkk4aozo5mFfqJhUuUQ/UbhDRn7smwhmb/8APQe1bY
         RpzSnYQNLbOaOssNy4hlENUzzfUdMQyT29/G9LYZvPEvCLeHFsuIQ/AvxrwznXKXwsY5
         uGIdjvFD5rt84v+i154xMhUkuIlCA0EpgSFDOHVxqX1sYd+GzPP+sMS7NETN/zLImBVX
         1ZtQ4vwAzJUBSC05dH3QZo8ScwF4tfY4lU1sxZ0yAbODCGqTOMW2LozqUFGRANgokHJy
         Jfuw==
X-Gm-Message-State: APuU4Z/Hp5aMEMGxKp8GUyvm7gI4j6a9hIoAmqBtYMi6/hq3z5+BUFf0
	JyHXPYVyuQBnugbItJpUfgvxBfN1EF6pyqFsnFNXcPbrozO0saCLRZU5Wjrb775e6eqBOU9cG2r
	1LgnaFGE4seJrqgUCCiKqEdQA2/jXDwtsDHRehwNsdMWLJFgtpCUthf+3to3UQUWA1Luj
X-Gm-Gg: AYBFou1LabEnNI6nxo75J6w5LYLKf+fXs5lKsgss+P+QLWEPetLxAFydm4LM8TM6tiG
	3bPWT3Y5qbvEYSddHU3dWbNYS59+tcponle80dbZQat2qAbhmDL/ODoYt5BrdzX5bizzUnCm6Xe
	Od0KoZYhVIAZBzoNabQ5JdCdCXJku4QEeIn7CoyzxBCtMOFhEHqmMOqdOYt3VwvwUq0UpH3Jvjv
	GWvhWdXHlntD0uvPh5LpIpwSmRYLujUQqqPrFlzmOiKOHZpbpGkJwbhbdAnv2lfo/oafMqbMbNg
	eZ6GyOG9ixX4JZa0ebmLJBxP+f79oDOWvyIOLmL5el9jbJDWOke3bYXYjySahch5h1CfF3tjTNj
	IxTxmesbaj/yob0aNq2p2O9jvDqLOJG49Kwv/clWgWym9YNoz2ZH0ieio7IHi+v7/bjBvmtGlmo
	wZ5Rk0gsHYSsoZ3KoR
X-Received: by 2002:a05:690e:4810:b0:679:cc49:55dc with SMTP id 956f58d0204a3-67ba50d5686mr9599069d50.92.1793884069698;
        Thu, 05 Nov 2026 05:07:49 -0800 (PST)
X-Received: by 2002:a05:690e:4810:b0:679:cc49:55dc with SMTP id 956f58d0204a3-67ba50d5686mr9599060d50.92.1793884069087;
        Thu, 05 Nov 2026 05:07:49 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm38915937b3.40.2026.11.05.05.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:07:48 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH 0/5] clk: qcom: Add NSS clock controller support for
 IPQ5210 SoC
Date: Thu, 05 Nov 2026 05:07:11 -0800
Message-Id: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAH9/7GoC/yXMQQqDMBBA0avIrA1kQlrEq4hIMxnbKRg1Y0tBv
 HtTu3yL/3dQzsIKbbVD5reozKkA6wrocUt3NhKLwVl3RbTerDRPgyzrxaEdkiqRGdkHR030ERs
 o4ZJ5lM857fq/9RWeTNvvBMfxBaAEMQR2AAAA
X-Change-ID: 20261104-qcom_ipq5210_nsscc-fe4b2c8d4d18
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793884066; l=2682;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=FwCPPd43C9+UFSP0VeeVecOu7OTjX3+26VD0c618IqY=;
 b=SCD5tZUyjWGsUIgi3dbLM6Hphh2nWi8p4z9NkYkuElvybRF31+EhpUuN0eDq9i/1HpT9fBEac
 xn0MMm22K2lD6Cir3JolbsuwxGvtY00njX2xbn1QaYW9yk3A1bVZJJc
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aec7fa6 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8DxjrM3GApEK5qXUAGkA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfXwhg4cINFAUHx
 Ai4vDN97nKCNDOoySb/0sfJX4i3bm4S/SqQnhEC0kfcDRIxuSQZm8JBfdN4jUtbaaVNJ9Xgo61O
 QPECM0RY+kfX72VszHg3OMgjIdLfdE9+OqDb8+xgQuJg1mGJYravE5a3P/PxXkkqhuX+QvJBlVB
 PCyfWCnT4530MPApXXUHkflouo7vH+YcdLDk38WsKaSOahTxtD9CnHiQjhixvNlCXV8/0PPiZI9
 HcNBRygcbuGfkFZNpOa++tEecl1oXaDzF2rQaYErJVVHYe6qR/J64OOIUtvkDUMa2fl4mfbon0a
 oF5Ew5jt0gkY12/sNHV8zLOcsTomcr/19oU7UHZJT5KNGDvY/Tpm3l+txKCyP4cApslDQEuh7go
 HHy9hRLk25sCTy3DrFGq5Lv4x3DCRcy7w1FG6K/Ek+EXm2hh7RbmeL7yrq+30eUTWNTED4nyk9P
 o3icC08pRg6lzv4Z5EQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX8o5w4yXNFW6N
 xyW9OPF4MaddCMsOU9EAdI1KbyeNqaZaHogdAdGbwAcE5UY1rH8IRkCrMEstWN41nmliFxVw6Gs
 PMbBYCkAUPjfd8+k5/BXla4P2jrr/4Y=
X-Proofpoint-ORIG-GUID: IyhFBeS201Z8Ik-XA6UbQk-95NgNFFl2
X-Proofpoint-GUID: IyhFBeS201Z8Ik-XA6UbQk-95NgNFFl2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050052

The NSS (Network Subsystem) clock controller on the IPQ5210 SoC provides
clocks and resets to the networking related hardware blocks such as the
Packet Process Engine (PPE), the six ports, XGMAC PTP reference clocks,
PON, EIP crypto engine, and the SoC-integrated EPHY (2.5G Ethernet PHY).
Its parent clocks are sourced from the GCC and CMN PLL blocks.

The NSS NoC clocks are also enabled to use the icc-clk framework, enabling
the creation of interconnect paths for the network subsystem's connections
with these NoCs.

The patch series is organised as follows:

1/5  dt-bindings + clock/reset/interconnect ID headers for IPQ5210 NSSCC
2/5  NSS clock controller driver for IPQ5210
3/5  DTS: add CMN PLL node (carried from the CMN PLL series, see below)
4/5  DTS: switch xo_board to fixed-factor clock (carried from the CMN PLL series)
5/5  DTS: add NSS clock controller node in ipq5210.dtsi

Dependency:
The NSSCC DTS node (patch 5) consumes CMN PLL output clocks, so it depends
on the IPQ5210 CMN PLL DTS node. The CMN PLL bindings and driver have been
merged in v7.4-rc1, but its DTS patches are still under review in:
https://lore.kernel.org/all/20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com/

Patches 3 and 4 are included unchanged from that series (v4 11/12 and
12/12) so this series builds and passes dtbs_check on its own. If the
CMN PLL series lands first, patches 3 and 4 can be dropped. Patches 1-2
(clk) have no dependency and can be applied independently.

---
Luo Jie (5):
      dt-bindings: clock: qcom: Add NSS clock controller for IPQ5210 SoC
      clk: qcom: Add NSS clock controller driver for IPQ5210 SoC
      arm64: dts: qcom: ipq5210: Add CMN PLL device node
      arm64: dts: qcom: Update IPQ5210 xo_board to use fixed factor clock
      arm64: dts: qcom: ipq5210: Add NSS clock controller node

 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |   47 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |   22 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |   67 +-
 drivers/clk/qcom/Kconfig                           |   12 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/nsscc-ipq5210.c                   | 2203 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq5210-nsscc.h     |  106 +
 include/dt-bindings/interconnect/qcom,ipq5210.h    |   18 +
 include/dt-bindings/reset/qcom,ipq5210-nsscc.h     |   60 +
 9 files changed, 2531 insertions(+), 5 deletions(-)
---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261104-qcom_ipq5210_nsscc-fe4b2c8d4d18

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

