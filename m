Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866426;
	b=SWa4x6Cjj79KXeOK0KkV3YutedgJMAOrWMoHbTIL4xNvamxuuk2WLpjbJOiH95XaeBkt
	 1VwptUKcW6Njb878Ojj6//XaNdzLgWmDa+zUkypFQgcnfs6CG9XZ+s4f+7UBdFfblsQC7
	 ezpaOu//GbOdBwV1lx3GuJw+5ukLka9C7I7bvoK44y+7EfuObJnQ5+KMAjZ0PjPJI613i
	 lcuF79SBBNOBmkjdHcau9pgpNOwqFrjVj6IevA96+KeI5EwoMqFFB0QSVvMt6iVNXTNts
	 rYp9Cg/tS/F7qq7sq+RaTmY/S64wQEJ0ABtUH09BF6N26na73gccVksL25HnBh1+mpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866426;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=F4Ic6Z5dshEh48/IeS1jiToLx2ciWkhOhNrVvaKYk64=;
	b=wtH8WyIqdzxv6wKrNVdAJIYtcya0Yf96EBcfxklobg5pvxzin1dNUpGYKRdCsh92CQa9
	 gM6uZJR7lyD/EcfhH3a0sH1SYOxxaEPcu/4gESVPcL7eUo4nNz6D1kgXrrBYm1WrNrDui
	 qmx44pfY1JIxH8xItxKOe0KmpzebWeAqKIp/QdFcRZTlxySFHDgn1ox/1lFA/y/R/RnFG
	 Rs9DSRoLF3KcSg/W9fyQ4wljbS+Dteh+lDx+Uta2rcLn7cJluSE+9P2FI/LR2LbfSZD3c
	 gpFNloxBAaYGkLNaLudhWDXKF0EW8Ls3CAjhbw7VnV/P6aAjAFOXtKdlJS9HzE2I/Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jqFDH/df";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ao1k1XbQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA56606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 11:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEA56606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jqFDH/df;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ao1k1XbQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ASAINFh108468
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 11:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F4Ic6Z5dshEh48/IeS1jiT
	oLx2ciWkhOhNrVvaKYk64=; b=jqFDH/dfFSK/ZC9h1D+3IzwMj91h/EdZ7roG91
	idVdHR3OFSV1rDpV33cLZvWJSCI0jSCzxHfTh7tMSh0p6vdT5mFdUNe5io8R/BN3
	Qw5gnbM/fjhPnDH/fRKixuvM8HyzMuzeuk/FtjpfOduFv4gtat5ENzzfqZ+/2giQ
	2+dwTV+dnxpPqnCncgR+UZq4Lt3aE7i1ApInU/Eux2Ww1B+T3zllqkIHiqyhwzY4
	OslBg0+AoDpTDUOe6shCtc8zGw+1ck5SdEXc7kJP/Gx/u2rIadQ46KRBUsbYDAw1
	nOp1caAPEqo8OC0qGTM1K+GMNKoymfnM66aZSFqrlEl3rHfw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7qqegr0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 11:47:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383ec96a7deso9554199eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 03:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795866423; x=1796471223; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F4Ic6Z5dshEh48/IeS1jiToLx2ciWkhOhNrVvaKYk64=;
        b=ao1k1XbQPEvh0+WE4zQ44Rxa741B4nz1tsHCm1RkY3S4vDwWHek9x3imjuSOk2Efoq
         zaR2pnNCBSeOUl+o37qGacCwVhY8OsvkTwYzaDiCGFSxSfarkRgI4xVQOt3PZFG+7Vlp
         LnonaR7X0ddI32GJqo8/GXMp39WgA1S16yVOxvFyC4KvDKm8OxIlsMmgGoh4k9ubB9wF
         wpPiNvCo2PyNaaSDYH40ylb3hwH5Vew1oe4awPsXe4V1fe5lDyLgxgPpsR6kIZp9C+GJ
         xGa7F3NKGF5p6U8Hj1zGyXAPRSMFYf/ELCWw983tXwYT7xpoO0wc64uFbnw8heo08gKG
         aHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866423; x=1796471223;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F4Ic6Z5dshEh48/IeS1jiToLx2ciWkhOhNrVvaKYk64=;
        b=J2+eteIcheHIsjTF7iZSRyXR/CI4u3pk2OYBINumSDePSk+wMt3SUoMcrk/N7Xq2DO
         FpnxsJtv9sz5sFXJSdqlWXtTQcvwLzLYOjbTxjroftOV901lWHIg+2F0tU7oxNiILeQn
         J7IcdRr+CWqFdD8J6eBcYX/wV+VSELlUvopOtLwBn1nKQOTzSEXBKr1nXkNdYBKvLsk2
         CF9FxsYusvf4/CMghso23j94/3Z7BQ8jiCE1CiiiglvhEQNGbHZPHHWe0tX5XQMZ2VZW
         6vaShMWghtjmgNYXkF+RVmNtaI6xEMFW1cF4WOk/8dEO69YemYzi3Z6hBxGB7JufXOdi
         kkJg==
X-Gm-Message-State: APuU4Z+vVyu/dVOtnuNs/35cWWifP272kEf2xC+fgzQF1d8l+N+4xcMX
	5NE678wQH/m8uj1PyKN43dac0aDwDt09zxNthlRwdkwBs3kQ+65e+ZZB/usXyxLZH7sGxcao6fb
	vAUqluy44K4zyIsO/AY+Zl1oivMF8KdB1l2BFmG4HGqtj2Bdv5THZ3ZWJvK7Rfm8xAwak
X-Gm-Gg: AZFdTZcZrNQs/2OuVp0+LDV6d+avI7sawrobe0+qNXuWWkyK5UCCje25G9sfv+rpToM
	eKszNTfcMdgyvra4vDdxS6093nGlXwWd3N3W1+ENfB3GPdExpkMgRw+OZdRA/87czG4+g7UmgKE
	itwV2xpYdGRM0JwSmssnPCGAtzf7ERznvfuaChv0e4vt2X/DPxRKYHIT604IG34k+acJ0C+eH4/
	fGXjAXs8Q3+Z4X0nCT6qVUnuLUrUGG3CXE8Tu3Etnrgz+xOV5qgnAtnVemf+btK4ZqXIb2hexBc
	Kueh8THd5+oDo664VfHcL0TDXOSqothtbSbozi3jqyHu10ACV5seJINnH1hZ++DPPi4RcoNRWRD
	livzV3Nb6DYML+MivM5bqRQj8SA/baikR5U3LHoPz3/cb7nWGIbhQTboQzeeLUktIafxztFDdC5
	MlmY5XsiWfBw==
X-Received: by 2002:a05:7300:50fa:b0:384:6487:b155 with SMTP id 5a478bee46e88-38570c359d3mr29790966eec.29.1795866423314;
        Sat, 28 Nov 2026 03:47:03 -0800 (PST)
X-Received: by 2002:a05:7300:50fa:b0:384:6487:b155 with SMTP id 5a478bee46e88-38570c359d3mr29790951eec.29.1795866422845;
        Sat, 28 Nov 2026 03:47:02 -0800 (PST)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm142256281eec.3.2026.11.28.03.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:47:02 -0800 (PST)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Date: Sat, 28 Nov 2026 17:16:51 +0530
Subject: [PATCH] arm64: dts: qcom: nord: Add RPMh sleep stats
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
Message-Id: <20261128-nord_stats_node-v1-1-bf12bd1afdb2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACq/CmsC/yXMQQ6CMBBG4auQWdPEVqXKVYghQH9wWLSmUwgJ4
 e4WXX6L93YSRIZQXewUsbJw8Bm6LGh4d36CYpdN5mIqrY1VPkTXSuqStD44KAN7xd0++0d1o1x
 9Ikbefsfm9bcs/YwhnRs6ji/SmeK/cwAAAA==
X-Change-ID: 20261127-nord_stats_node-2e73e579b864
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795866419; l=985;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=b3AjDtyl+wmn8UFRD6n4cPWzVrZqag0hsyxUg5dJG2o=;
 b=1F0TvL7oWIbb9VtxrIR5psPw9gUjypKHZogPnTNN9IAYXtmDa951RQsX4Z153kCP2/CKT0ZJv
 LW9Jz2PDvnlA4oaBMwzU5eAI9sTqmGX2wHARQsqh9qrSRedTTc+ftuf
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Proofpoint-GUID: d5OosQ6dc1OiZdln2FTLzOMl41VaWQ3f
X-Authority-Analysis: v=2.4 cv=Uv/2pOwB c=1 sm=1 tr=0 ts=6b0abf39 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=v22c7c0WlVfFw5gVLDMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: d5OosQ6dc1OiZdln2FTLzOMl41VaWQ3f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDA0NiBTYWx0ZWRfX71hoP41GZRR0
 pNrSmqQsr54usCSBNMoSc5pTendJuQ8dZLvEqNsoSuufO5n7iN8gQ9QACVr7mYwjJZebDlFTMlX
 HWH3ZYYzF9dGrBGVXPHh1g6AZHUqQgUR8poHLxpB/fBkD8ceJ8yaV/A+0zMKYkwMTNBUVnGG3MJ
 qMDKkzeQtaFIlc4DF6g4m2+I1glCweijjm8HqRNYodhilW8RORYbLA7XdmXnvVtL+2IzUw1QZoU
 xKHSFT5x71ZVkJtmODT/Wo9rbbz/B3OY4JL6txFijgQE5x7hN8vfLoEkTo1NgnFRRGDl9oEba3d
 sQQ4A1q4p1dyORUlU3NzwJySW2CiY4aHRqC3Cj3/ZeSZfIUTRLcs+Op4R0oNecQq1380lLiYR+J
 4VHP8HZvbrHhPOj5lsfKnI8je26MrijgtRW9FdvoZxYefvdQ2qnW9hdszQFAJDd7rC00e9u7rqc
 33Jb+E65wH6pU//S8VA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDA0NiBTYWx0ZWRfX+T8qmGm+P+CW
 xlKNLLfpl3G8NjWPcHWuPpxPgNHcdzKrQGGSIbwVRJByMTp+FfkBSRAG6CRd8Tf4BuK3vF41AsM
 /4LZk/AOzU+jilhl6D2fG8H67Awkq00=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611280046

Add RPMh stats to read low power statistics for various subsystem
and SoC sleep modes.

Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index e6d0bd21744e..f0534769f41f 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1845,6 +1845,11 @@ dispcc0: clock-controller@af00000 {
 		#power-domain-cells = <1>;
 	};
 
+	sram@c30f000 {
+		compatible = "qcom,rpmh-stats";
+		reg = <0x0 0x0c30f000 0x0 0x400>;
+	};
+
 	tcsrcc: clock-controller@f1d9000 {
 		compatible = "qcom,nord-tcsrcc",
 			     "syscon";

---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261127-nord_stats_node-2e73e579b864

Best regards,
--  
Navya Malempati <navya.malempati@oss.qualcomm.com>

