Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173870;
	b=p7vdBKYO2+ML6uRPqy5BjJDsYd8UtQimPRv3B+fm+U126oqwCKSsvtFJj8ZWkNbkF8UP
	 yp7ITfrIryb2OKsU7HZxP2eov7WfyEeGgpfZW40qjawM05n6WcqdiQhf6wSiNBeW/lAY4
	 THk0Wq6N8ZFrA+4Os+q32NPLYTk9FMyCORqnvlCCesZWP3zyVOJNO1fpvRvqxTCmt2qTJ
	 6kpWieztpyywsFZUNZeRJKkYhij1AnNj0DkwKSuXVgs6Wmm5x0iKKvQPFXWtHcLSewBqw
	 Ae2JMMBVZ6+++LW4eMSXGhx3HH8q2VURCUzLrOm2vAxVTSoNrPkeJ9llyP6p3PNg76Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173870;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zwOSIJQjqu1jiO+D10Z660xd0C1HKGPEar6chOI2AHs=;
	b=u8UQzF4FeXyKeKZKZReqkKuBEMdd63hHQQ/1Nuv1X4A81o9HvKoBt+oi3mhGqgLAZQge
	 7OhyAvZ9MZPnqTOg73fPyLm8XqqB7jxlvF0wzZ2Kgrx4cgrL91SHV1OSodWynl1b8T8Iy
	 0d2MUt8TrqNlT01KVY+TB/LapqBcwobraaFLT6wOEdN9+47Hvmj6sVaDaVgp+Usf72f5k
	 AL1vr4kMF1dLKthSnaZ5RH1ZVbhn/UTAN7buLBOdMqffh/GZF+vk8y0dpYOZaFa4L0SMM
	 pZUWth+86xdkhcvMcKEvYPI3OV5sggejP6xiwIsN3cpgBlOJbm1sK2pPQ5ULQYdUClA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hE0aSd1o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmY6Thji;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D78B606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D78B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hE0aSd1o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmY6Thji
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PVim3936453
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zwOSIJQjqu1jiO+D10Z660
	xd0C1HKGPEar6chOI2AHs=; b=hE0aSd1o1OyH1owE7CEwhpoMUehIl9Dop7ISz0
	wVLZ/wDDJQZ9GibV8DSUn34BgYXrp+g2AWqtYSiV8QgwDtghqkJSpNSWskVhfYO2
	ETZqLGPcXTPrM8uO2kJ03OjXoc/gJT8zWs0ROcgMSa4So41FJzeQ3poyKKQT8qen
	UeAYxllf9tAgmJqc6kTylmxf1ZVBA8tFN9xoQE1j6TEZKDMqRYG4kQXEPzyuwy9g
	HCdWDmSo3lwH9ZKIPwX6c1iHegBg9lLITLwTJMnSKHpHY2pgQdQLQG1x76BIL2Fd
	mrsX4j6NfnUaOYPbLDi/E+VT5BpjFcHe0gPIoVOGuDSm5VsA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be1d30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:51:08 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so2130309c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 00:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793173867; x=1793778667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwOSIJQjqu1jiO+D10Z660xd0C1HKGPEar6chOI2AHs=;
        b=gmY6Thji67U59lpx8Ch/zGGWkmUybnVTONV9oNDoWm2QOyBJPUSEu7FzEzKZvtmhW/
         5wAoAgx0hcN4nLOWLFBGxQ3J/TWcmbCcbt9lHv0APVCrIbHx/m3unaoJmG99edc9xeCc
         p3KounxSZkjKbeWGyo7i41Ginik2vGF3f8Gekeif29SjgNfBMXpH+5LQY5DVRfe7gv06
         kaiJcLDhnGHjScj9kD0L6pAMfRKfYKhQDIsyJBsNI8ZETQZvk+ZoRBGQOVM+8SLT/j+4
         Yrs6CEQVtzh1Z6gbf9tCmrVq+L005GTQYnT5+L2ReCu5nUndBEZySYjzlpql88dRkqRf
         EVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173867; x=1793778667;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zwOSIJQjqu1jiO+D10Z660xd0C1HKGPEar6chOI2AHs=;
        b=NnyjqFXWXJOfy8hIJJ665d4Bh8Ni20EC5ULd5BgRpBqyxNY6jkiPjcQ5xHBXDLtCV5
         yWJ9SVHMG1WEYWgibInxS4MDBUy68BJU0xdN+cI33pumstnRgVpXCzBIRGWb9cZu2Zd9
         yvOHcNBLmS/HDT31OhL/lxHMtwWC9Tq7Tn5cdIQYVkvO/Mu5A3rvo2zupPA2bZEyX8/Y
         kMkOtrLXpxax4Oid4DHfdL1yMR6yCWNnm19Tc8YvRcefrycp8NrOEoqeBpwpFkOS+Ez8
         nJzQFcEPN7GeMVC/gj0IY8ajOb3PKCur4mkvAtvljybK3dqwLAkPYTp1QGPhZRuhnAug
         28DA==
X-Forwarded-Encrypted: i=1; AKwUvBwunKVL1FWbP1rNEoyuOl+ytqpvTBPuWJpZKp4lONdHcO/SjjAlYdmieo9isDxv8Uhv/7peViF+HB7Z+GQH@vger.kernel.org
X-Gm-Message-State: AFq9FYKuyCgMcSEYWL6UBn/jMF6cJh12YnNeww+XHv+7J6RWbkc2R1XE
	8U7VbdDKKSvcemdBAzQGQzY0/dWR6oK89eKTSnsmBUUIM6Ipy2ErzaShyZTAA7FcwYxcgQjLRTp
	eundkpaqBl4LP+vEzr1xA8iK2x1DCFYyuFs3+PYAojgrS47Zzb9dKilpzilft10AHXqvz
X-Gm-Gg: AYBFou0UhKlMVirqvMgRgs3RLZgH/OxifmZSMOv4C5nKnUdG2vAeSCck4PmnJIHeAC9
	MhS2vowuyKwWdlceMdFaJWNQiVLsJtSkU+XIQMctmpHGjmy0l2lhxP4uNKoGSs8m6pbZY1mCAWB
	WJ0Gx1k3RpKe5Q1tzcV12yWragZK+M8hC22/nsTTy/S+iGpAIcl147Yt9pxDPYkDUKV1FwblFj8
	7rK6U+Sg7vBmS4JY2al+ppqDCdDiowk3xsafHi8trd9Dvut6VDaMxld5DoE8AhuXYOSDFACv+Dv
	FuctcjXB8qijUPjbM4RKZEjllpmT7JJLZArgotH6X/h3VrUyN5ESRU+LiiAy+jT9veKnfi31tFF
	e/x21bF+ApulVnj7LAUE3f6a3HJPinv0zHSg8jzrP1ulfvec2o4YJFLrFbyUT9Md24FdyFDmTts
	JTN8+zVnojmI1JDdkBY4MmpXBnp6Pabi/x
X-Received: by 2002:a05:701b:290b:b0:17b:fea8:1425 with SMTP id a92af1059eb24-1a6cdc492bfmr2054915c88.30.1793173867071;
        Wed, 28 Oct 2026 00:51:07 -0700 (PDT)
X-Received: by 2002:a05:701b:290b:b0:17b:fea8:1425 with SMTP id a92af1059eb24-1a6cdc492bfmr2054887c88.30.1793173866516;
        Wed, 28 Oct 2026 00:51:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c814917sm3430261c88.5.2026.10.28.00.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:51:06 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 0/2] arm64: dts: qcom: nord: add CoreSight debug nodes
Date: Wed, 28 Oct 2026 15:49:32 +0800
Message-ID: <20261028075044.431228-1-shengchao.guo@oss.qualcomm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HDOEOmqh0JaM23IWBgyFrJYt9fD8hl5M
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1a96c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GL7yGNlxQxINzW0oewMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMSBTYWx0ZWRfX3drqF3TQV+Fv
 bCPcrCTvZhrTlZbnqCxvvpNtL14Et3kJWEZ/VeyA7RJAN08UDgQci+v44OE6GpDCmLuM2RsiWCl
 4+AfzDU1WM8Jn5uSMhgMZLqOxrvFO0M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMSBTYWx0ZWRfX5pahfwazTK9r
 hQKo3ogQ6VpIMSdNDhSdiLgE1GzSkkigTdNoUi5w64h3odpn7Vrfbr0UC8mVmJSdwosXXDEUW+O
 s0iXCCG/TgE966TzbrcoVIh0hTbcXvcpPvcldUzEq8F8/2BUWwd9UEENvClxwEToRDYaNXqqfbh
 S9wz3mbhxc5UalfJyB1xTm7yC1AhL/jiGUOz5rnkL/SjhwC2cgXRCFE8/5SBh2IhW0tT14JbibL
 4b0CyX4SiSGxdfNkUERAtDOUJZEjDjQ+0URVUXvuQS3HAo80rG9gqmpdEwI1CvzArDUrcMC57S+
 jZId3+qy+DkQX75lA3Pdv4zmGQZj2LFKLFqRIN15DB6JuuyQ2YT0GojjTMkxjVyGxQ8dY8dqQSY
 J52J6Iw4ntFPPQuO/ToVJ6PCbvlCXjkQ/4/iIMdA84ubNaLD6P3ZXD63O57YLYmQsWczIKZ5WPD
 Bu+LIL3DfHpxf9mTWJA==
X-Proofpoint-GUID: HDOEOmqh0JaM23IWBgyFrJYt9fD8hl5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280031

This series adds the CoreSight trace topology for the Qualcomm Nord SoC.

Dependencies:
- [PATCH v6 0/5] Fix traceNoC probe issue on multiple QCOM platforms
  https://lore.kernel.org/all/20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com/
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Tag the series with RFC due to dependencies
- Fixed the ddr2 TPDM labels: tpdm_ddr3_llcc_2/3 → tpdm_ddr2_llcc_2/3
- Renamed tpdm-nsp0-cdsp-llm-2 → tpdm-nsp0-cdsp-llm2 so it matches the nsp1–3 nodes

Jie Gan (2):
  dt-bindings: arm: qcom,coresight-ctcu: add Nord
  arm64: dts: qcom: nord: add CoreSight debug nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml     |    1 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 3088 +++++++++++++++++
 2 files changed, 3089 insertions(+)

-- 
2.43.0

