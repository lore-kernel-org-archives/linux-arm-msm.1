Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456712;
	b=nHURs0xO4t5LZNFs/5lsTE/0I/3RuCNLh9MphQ2yE63blJXSU41LYsZBWo8WDuG6xKRc
	 9wTl8J3ZW/sfuTDgN9rItjarD9cui7+38rRamibKQcOnj84JktQKBLREH8JTM65FD2vqY
	 SdZ/AkbQMpoC/e9YXHCpEdc43X0BjcbVncQb7wDt+KuSSOkgRlxag8w5Fxeuz91+poWo7
	 dBO5FzHU7hKDk0odwNDzFutYNW9du2HH0Fsu5xsjFsKe0AboaSAnLa/rMbr6dr4gmN68w
	 5ccybkqTKdqfmlmsIv7ZHjjQFPSuoL3rCbmY/Bl8OccKUSjihM+h8ptlfXsLQRoKMrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456712;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o1w2HYl6UPIFbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=;
	b=yOAYSyFgxKw/0MSs0zTox9NDA9ewpwSSwnQrS9kj3cA0Cg8Z/iOBT8LUpJn91TAN2kYE
	 L/vVlnUW454k3sLYwYULPWavUd3hzCd1o14ZNYLi48qY9gqqfWy+NLvwq0PFOLTaRDQo5
	 Q61XVN6wI54aeyv5X5ONnjdYrJL93Tm3PAttBqy04S1G4ZK4EC/4IbK42ivUU8+1oiU7t
	 wKM2hCvqp52gyW7swF4f+vA3v4SDUkalwZeMNft6v8tQNFmrlYMUY97Fe7+3nu2AwDhEW
	 /5FntnLbLRg4N6/oJmPE1HHVE/cwj5wC0ltXgFSedrP1ekjMBrVjuuox/RRdh+lcO0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ef3ys/2o";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKsM3+5q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8CC606A31E
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D8CC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ef3ys/2o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKsM3+5q
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0A5w2162260
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o1w2HYl6UPI
	FbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=; b=ef3ys/2o87hOkBkLcAx4GZDDy+6
	vobol+me2DLX3VTP0cYgZoHY2yjMSodMRqsBhCXNDuyY7QSVW4ojLwRg/DbuOTgU
	yO4MdFagWA20OFrBa2FE85hWWhUwt6vFqe5xAMjvIX/cVCFM688KFrmHRu/mocz6
	TDb0b3tqBGgRF3wRbzcQGkNvT9kp5D1NoFTR0rR7hzR2f7iBadyKKCDiCqtNzyi1
	txGXsSdYKwHje1YNTmKPp+3WcP0oJMGAq0j8vLpyjLrNesHsamkxXloSUdo+rI0V
	zjNJcNz4DJpbHuTWkxyDPD7+IUTOQe1iBYokiAXVFOmwgUtB4Lf1QxPBjaA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2sa7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:25:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3707687eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456710; x=1794061510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1w2HYl6UPIFbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=;
        b=eKsM3+5qGL0ii9SMM8ATfa4VTgv4FT9I/qG3lny24WnZBWOCl5pLEUVB/DXUKZ76JH
         yIMA8bX+t2PuonXyFYf3zHIWcCcWvwAnGP/IVagKJ+s1l/NfXkH/63FiNIQ4upEf65sc
         fmqU4z3X8o/uqCEL7IyssRBhoyMwVDw6jwirqadtkaRUGhx1FOBlKHte88gIdiaIIPsS
         V0H5Mr57lUoSpdHboAPf6PiS0YPTJ454gsbkA95798fgplz2cYePHXiUCMHXXLDJIiOD
         tO52JwexI6yQUo8DcN6CPItAqJaFveM+btiW0pyVp/uhy09AeI+hpKTev599GcQcorPE
         /ZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456710; x=1794061510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o1w2HYl6UPIFbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=;
        b=Bgx3fOnhsQiLTN/bGIyOGgQgOlzyweGzZIesd92Lgblk/j2QCY2sMBd5sxiKk6aPIR
         vy65GaIZGkRW4zzDeGEICuWMS0XjZ2tSW/k3jU32u2gdlGr+kSOyi+etO+qdH/yru2FW
         uW2ByxCFOQcRDGmUbY8MTLgk8tDOCAem1SZLNafVWgLlXQw/ukTHD/uUR+Emmg+06LjO
         RAitt1tBQQTETyqT0G6qCWiRyMM4XDkg+vjYHKhIuu7nU8tFyF1j8aDHf32jRPo3e+bC
         vFSOPZ6N/J27z6shGqRsXPiiGTpS/3j1/N5/zDrPQDFCIpUroXvXgX9I1aFJve6ceewL
         Xv7w==
X-Forwarded-Encrypted: i=1; AKwUvByyziyMzSBxmgKgjAqmjz9zw0QBOdRp6lszb1VQa8BHPXZGll3BHWzSd6f4/0V0CMIwfBdBbFk4zBVRkjnF@vger.kernel.org
X-Gm-Message-State: AFq9FYKdpZGwcBMD+RjcIrFqpZWq/kuEoOly8ypR6HnUhtt4yDjl5h/s
	FvOD6feyIw67BnEuEXFRCahL1RHujcp4VMzl+rXDeTk2QVmcNRw7n/Sh7KD5ghvhRP/l03EsDNt
	4USpqqYV9f0pTHef63U+XvLO82aamadOSLa7nd0U0B0Xqgm9QMvbLxMLM3/KbJI/kwJ5w
X-Gm-Gg: AYBFou10ivHrzWcq+iGTcCoqNMB6xES3cYya6EDgT9Oj1aMOvAt0UGUkzk7H2/eeJ2y
	e5MoZ4pS7i01NTaYt0Vl14W0TegGoFaoGlv55zZgmXyiofB3G/yy4sxze/BqgxxQIEEbhTIYWdS
	Z2jtMgV+HSW1OfSg8ItDSD6Npft3XSDfJsmL1gqchzlOGYCFlEGFEPhhZDTBzH13122FUjq98vt
	XJ6iGv3yJzDoGccM6K2LvgAL7mJXE/Q4eeid7mA3g2e/S44SDiqoBfTAQHs1W53mj3mfZkuHY3+
	9zMHRcCFY8VTtsiJ27zc+/5SH3cVwriXxXKruGiapB4ZkUsosC8viWuMqrGS914p/Gatq5gBiPl
	cKkQxg0xOKXxn9PSPoldwwn6y/ANsFeKbFYLAzLZYAv0XML6BHy9jFlTjvJXCUPYOmQSqugcRUq
	QmEDvbizkciO1nAiluku0lh8gD+ceWGxxY
X-Received: by 2002:a05:7301:1927:b0:35f:5591:e40c with SMTP id 5a478bee46e88-36a4240cafbmr7991009eec.22.1793456705212;
        Sat, 31 Oct 2026 07:25:05 -0700 (PDT)
X-Received: by 2002:a05:7301:1927:b0:35f:5591:e40c with SMTP id 5a478bee46e88-36a4240cafbmr7990958eec.22.1793456704233;
        Sat, 31 Oct 2026 07:25:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:25:03 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v4 2/7] arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
Date: Sat, 31 Oct 2026 22:24:28 +0800
Message-ID: <20261031142433.1212809-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: t8YqRNjSBZOK5AkaSgei6OrMvfLd4cr9
X-Proofpoint-ORIG-GUID: t8YqRNjSBZOK5AkaSgei6OrMvfLd4cr9
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae5fa47 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=f6-OUQb2phOXiqkgZ7QA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX7lwIO2iuf1Oz
 7JykU1M307cvPxcPf95oHPjpAIYzaHb1sZs53ERMPFBd/fVd6CQx+UJodeI//Z7iJmcBzUXA1Vq
 f2pLSlVmbXGrVBgaiXpbWfCfDYw4K1Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX6Ya9fx8yQ2iN
 EpxLnbMVgSyvKX1FLOKzRH+ur7XxZzjPFf6pTs8ODEInSyW2MZcKi8dLy6bq6+yLyAQlBlW54N6
 ADwZiz4zZDun9VVnsnl5rl+a2lSXT6Ua//SfjS7tf1cjQI9zDrPTmNI/Qsd/6Z2zxGV6euCmyfo
 Jrah4Ne01Z7SFGKKi7FXbTuN5UMQ0z1M59XW41b4XgSf/zqT/se0F0dhL0gDT1V6woOcCaKTx3Z
 M6ICppTfromFgTboUmbqjTnA25IDjEFUzvrCmnUjINT7QoYpAW1D+89E8YpO4NboPdzpdmv5eIh
 dNHOI1psUNh2K2wK67iv45sPSNIPBX/Qn70f3Vk4RG6ZZIhDOEuQw4oxlApOoJMb6kTuXtmN5nj
 CjMUbSYttp4P1qD1DGgbffVoGQ/n8rBpk614au8lhWsdNjPH2pkJyYYwYx+QVhJ0mZ+UzT/D8Yt
 5ssonOcBxDfxbjrgoTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Robotics Reference Design board routes all four PCIe links, so
enable pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL
rails, and describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 49 +++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..98dab85de64d 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -377,6 +377,55 @@ rtc@32 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l2e_0p9>;
+	vdda-pll-c-supply = <&vreg_l2e_0p9>;
+	vdda-pll-d-supply = <&vreg_l2e_0p9>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

