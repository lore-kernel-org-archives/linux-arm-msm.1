Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382299;
	b=xFpbg+fH2xYAgDOoSdmr8/DVq1x39UEasQ2DM2JcA5Oak0+9TnSVmRfWTa610neUuHcL
	 YOzQtT2YV57gmKoDOkCZNSUeHIa2f1uNt+PotJeYCy0MOC3FO+7e/RtAg5L/qB2ptVMUz
	 hHnVHtRiMlxPTaCEbf4AnGxvBxfT1fhsgW4yZIeusAOMzNN/bzVcooAALbVxunaasX1x3
	 b6kQ3RAvPJfnJo8R/NgBy1lYL+AjSiHGG6TMrta/YL2GcO1LNROmDnjo/EucVSE08vL8N
	 Dr3yt99hT8ViXYQ7+D/xdq7VigZFdDk/XxeV1WlQqmJTvT2bIxTKxY73jG0nFzD+5jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382299;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4c10oHnQAIM6STK2DLQHw9EMW30HYexGjjxfhMEAhr4=;
	b=sLA+DBySQQmb6WL8wno+PMCtIKpSOkl4uBhLqzDIeRUWVxDQyWeojEeeeWMFgbpVtjts
	 ghpziB4B/YkVim/iyAKyTfxpObmOh6pXPSrKbVUA4QP2A0vzSvAOcNBx2DL52aFU94wkx
	 27G0FUtI8lB3Wpf5J1B1B2bX6f0M405L/AekcWX4nEmPFhlopbANNYXuH7SgrVXsYz+XI
	 Ce5rK2tUbz+zOZZlDtgLfSnExy0L0beaR+TRu3ms5bxE/vH25fQvFuptgREz1UWgYYBuI
	 /r/KShsJfg9unTFJJs/GH3w866sdggTKvQyxHkAOeZaPGP/GYOWJBNp0yZvjnofBInQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EYSKvgng;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EnU47ikZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291E6606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 291E6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EYSKvgng;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EnU47ikZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KEuV863493
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4c10oHnQAIM6STK2DLQHw9EMW30HYexGjjx
	fhMEAhr4=; b=EYSKvgngdMKdJd6Ysn7F0avpu8CVtHT7k8KBfQB+Qn+VEass0/9
	Ye/IpFQy4CGxje4LcMDTon+SKVPxI+b0BeD89gPTpHsQWdYN7HKGGD+1AKT5k128
	CwHzxousBsvWwlsZ0yBIDiMJ+hQAumoLD7ZzbpHvMVRWcIiCrxDfhp/+ZJdtlqiP
	ycIg+OwMxAS2o8OUf4TTvnr4kjSMrgDf88SK8gID81k7PvmXpiGDw4jYqqJx0BM5
	eT780Sy7QzJIkVyFJDaJG8WUW5sv+/W3t6+qccnB+Uu0Z/Zq1egv3HtstTGhHUF8
	nJ0AIl2/vdXuZ8wv5wAFUpessgSCvFoJtLA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawh1s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:31:38 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a2b6fab7a6so671579c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 23:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794382297; x=1794987097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4c10oHnQAIM6STK2DLQHw9EMW30HYexGjjxfhMEAhr4=;
        b=EnU47ikZuZuSPfoSehJPxFK0Ur1Z9BU1qi3ff0zotlRBKBJmzVlZAPlqy2EB+rjqjE
         XgHna6n0JkYf4dBCc7SRXACTse1C4fN7zr5pV3libkBc9qAbtGZgRXzKfYvx/D1oxz3z
         K+y+xP7ge1YPXEeeaTG9knK3b0v//arHlMnczBrm5dBbEoQV+wpwcIK/Q7JoXobIMFxC
         6dddiB0LsYQlNMdqDK4oD70Y7sL0w8c7/zsm/5a2ex1ZHRI6yslFogc07js58KIhURIn
         brcmmx7NmyzYkIvpR9qm/OubPK1bn0xhONZsl+lDIk3uaDjNPuetCuB5YQLj3vNrnDNI
         33LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382297; x=1794987097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c10oHnQAIM6STK2DLQHw9EMW30HYexGjjxfhMEAhr4=;
        b=pWCltc9pGghZBCvWyDUNySHR2Wij012psNqwl0mR3W85GKVG7s3Sv04Xgi7ERJZZTf
         0DACrtgD/MrckcApu0Nr/xQuhz742sE2a/G40fiLsNdogRMBwjMkVHiFD9ERtgvlvz0W
         nqw1+LaDokqY28/3blaxkTrg5R8E2s4aYUc7oPiray8zkfYu7Z/naf2MDUlfC3/sd5oE
         O8JjUEM7CTLcitvbyKe4ZmNpnLv2h6F8FOZGSPDPNMe8kK0sKpWqL6FrDpf4rZ0AlC52
         jng0OQJJig9BvnHKtWZ6wp8tlc0gLtoQSJ5DEnQ43MeCQ+7dc6KDDKv6c359KctcN9B+
         3BXQ==
X-Forwarded-Encrypted: i=1; AL+hErF8QipF+dJ83q3IBPvxD83A9+E/3tnFtdL1ka/RDQ+NjddJNsYjo/tB3B78xI287Ok0uxuFnO2kIuGWLGil@vger.kernel.org
X-Gm-Message-State: APuU4Z9t0rV9NUqBjmIGbqI0hs1x1eRPutH7J9e6TbpboRiuRwKnCnhx
	igXVw6W2y6HYq/32CVslg2aDSmBJm/tREOm9LkM5o+ZfR9xgHtzNAO1DGRTJ4rr6ofivEsY88NI
	HK9wEaZDrDxMBAh8zmcDW3mYJDv/a1APHR/GkpNs64viqHmInUwCCRdJhMZkJlJG/n/9s
X-Gm-Gg: AYBFou1PnEhgGhgj5V1rpMaUYgI5K6OrkB1tOkO5cpEr/MgPCS5yESJ59gdqe/sQgQR
	vi1Qabi7afzS6IuKIgVddlWb4RDc2pmj8DYSXv2zvjSEQWH+cAtCmlGkT9j7oOCvtumXGDQaa+W
	rOxaewOchs/uopcfHYrhoVALvaMDljPXHBk9cmAURTSRJK+Qq+1sklYpOBXISIk8CWjIBRN/9Ga
	gom6Ry9cgUszRKqj4X5dr/WQ0XW1oL2deQMN8FDJuqs1ImF+c48QXwFU51z/dbHsh9tebkJqonQ
	uiMBEkPrYHnDXzttNp5j3f5rgAT2wEXyvwASqgEgAo92IjVcNt4NgL78EhEbF55s0ejoncMakK1
	ObkNbBGfGww0pp3/khNQSCXcqzQEfGQhjuwCHmEhAqmClz3sxPdPtyhy/2Wnzp/F9uFr0QrbSQ6
	CrsnsYiLDKtfLe5YGGRgRYeXr73GPXQtKP
X-Received: by 2002:a05:7022:1507:b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b3bef0d528mr2888482c88.4.1794382297342;
        Tue, 10 Nov 2026 23:31:37 -0800 (PST)
X-Received: by 2002:a05:7022:1507:b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b3bef0d528mr2888436c88.4.1794382296484;
        Tue, 10 Nov 2026 23:31:36 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm27220027c88.10.2026.11.10.23.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:36 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/5] arm64: dts: qcom: Add audio support for Nord platform
Date: Wed, 11 Nov 2026 15:31:16 +0800
Message-ID: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfXzwbYCL41Whq4
 1PzbzDNz146mijiUokYklIJhlx/lDWKbko+wBtg7m03EmYavO8xCWtNmtQR3MGsVazTTt5Fy0/y
 0P5/ALCBcmKlGwisbaKIOJ5yO6WBaTs=
X-Proofpoint-ORIG-GUID: Fu6lApjHcCgkoHQ24j2XI2-FFpSFL_rq
X-Proofpoint-GUID: Fu6lApjHcCgkoHQ24j2XI2-FFpSFL_rq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX/KgvTUFGX2RJ
 t1L53gLRkwx0fxRJH3GVTZDIkThc+/t0zgw170F6GgluohRpheeDCn2eHbtivhd/hlRqp0DCfkJ
 ApWma3gQbc/C6LjUawmTuDW0l/FP22FaUAw5YaYF4Ks6/pZAUHPBsX8fK14bwfcsXMfXhQryQ5i
 ac1MYKZIi6GCoRNoa+EDRqimb2LZIT9+DNSjjSUPEFIdtrEf+cgW5EPstyCPkp9NvwWl6ustZSQ
 2fzO1wLlM6J1BdQxe1jBBP/ADiVttMmzbss1If9Ak+AAmgmkbPcXVAQIXjfSAY3kh48Xsa9cBJx
 0Lm69RcmApuWQjNH5UzUzeQRgARoQlg5iEoHtRunCKZBNbABzLmmibeCrM7vhWzeUimrMKceum4
 o6+F63ZY2VXCxGIFKH7H1zNn8NcOn+AzmWuvHYbKLQi8DtyGk3rKb4iqQ6J0FtFwyPDLPSpajYU
 wrjP1yyL1fiPAX0SmqA==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af419da cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zx-u8faYscwgyrAVXPQA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110029

This series enables audio playback and capture on the Nord RRD and
Nord Ride (nord-ride-embedded) boards.

Changes in v3:
- Rebase on next-20261110
- Drop RFC tag as dependencies are cleared
- pd-mapper: Add adsp2 root PD (instance 124)
- pd-mapper: Add missing NULL terminator to nord_domains[]
- pd-mapper: Explain ADSP root PD and shared CDSP root PD in commit
  message (Konrad, Bjorn)
- gpr: s/nord/Nord/ in commit message (Abel)
- ride-embedded: Add missing space in vcc-supply (Konrad)
- Link to v2: https://lore.kernel.org/all/20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
- Rebase on next-20261020 and drop Assisted-by: LLM
- Tag the series with RFC due to dependencies
- New patch for pd-mapper change (not a DTS one but targeting Bjorn
  as well)
- New patch for i2c18 pad drive strength change
- Support both playback and capture in TDM mode, 4/4 channels for
  playback/capture on RRD, 6/4 channels on Ride
- Use lowercase hex for iommus property in q6apmdai
- Control DAC_ENABLE and CLICK_POP_MUTE_N via regulator-fixed
  and simple-audio-amplifier
- Recreate RRD patch from scratch (mimic the new nord-ride-embedded)
- Link to v1: https://lore.kernel.org/all/20260914024003.120931-1-shengchao.guo@oss.qualcomm.com/

Mohammad Rafi Shaik (3):
  soc: qcom: pd-mapper: Add support for Nord
  arm64: dts: qcom: nord: Add gpr node
  arm64: dts: qcom: nord-ride-embedded: Add sound support

Shawn Guo (2):
  arm64: dts: qcom: nord-embedded: Raise i2c18 pad drive strength
  arm64: dts: qcom: nord-rrd: Add sound support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  32 +++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 166 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 153 ++++++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            |  40 +++++
 drivers/soc/qcom/qcom_pd_mapper.c             |  22 +++
 5 files changed, 412 insertions(+), 1 deletion(-)

-- 
2.43.0

