Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812928;
	b=YPDDfZguQRI2Lwk80c+a6xJyKTByLuJkStA1nRqwn/eCbwvbNI0KmOfdzhOBhaCCR0nJ
	 3OtksqazJEugbXBXo8+rwf+7YAkIdVHQy/ajUTLJGluxKPv+sgiJ3GOrbdZZxuu0d6hUc
	 87vQIRyVihQ0+q+O7oed8hOjRhsNmiqEXxe3tsp3z0pho+zpcufBjam3VnFezBQ5jTIqz
	 8NzE4ATHnU1DIRyizNcIGDBV4XBDrBY4025Q3ExY1DWzkCsKbMn+SYRzfOaiJ2dLpo32f
	 q0p1I+Kur4u1ntT64E3z3Z028fqciaik8i8xGh6Xw3xmb/nzB34tCusOSlg69zbqi6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812928;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VsctoSyuzeDFyOLJHRFtf5FpkehAfPMSRea91fkgfbs=;
	b=tsvHzFVdjIMswLYJXJbV2dj5Z5Dc5uSI5gghla06IhyLgrFZ0KgyLkA00T0KcqKzOU8M
	 qPaaukl8R10KxYNnKCJKM9VR13uUdCDB2NvKFb9rPyk9ahUzdGkN1bMJThicMcVZcsEHk
	 /dIDWOW+jqRys8Gqp6ymGo9i7czA9f51VNlCn2gKhs0pIDdAEzUzZ1/whB2ZxcBFQVCdl
	 jmj2wN0Zt/TeqrSJOwLrWq+MKet9MTmakoa8hNFsoUId/c3iSWUnut1A5Ra/bodfmgX+p
	 kSwWv3dwWyT927x4jSHHN3XrsRbwmqPsxJhV4uVhOLf0CA5DpXlmjKY+K2rq41YqZPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UU+lkmg8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LI1lEujG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F243C606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F243C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UU+lkmg8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LI1lEujG
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LVBG1585481
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VsctoSyuzeDFyOLJHRFtf5
	FpkehAfPMSRea91fkgfbs=; b=UU+lkmg8mKbhrhmA1XaI+i9P9IE1ak1bAcJpyo
	ZMiNibS2UNDUIHc99dFfWj/bO8F7SYN3Zts60vd9qgevheLue2niTouNQqrDQbVd
	Z5UuSdYXbMgVx3bmioBuPqS1W/37Lf6DiCL0NJ2CUpMY+tSCnxf2dVXF1Vhs/IFN
	i1BvYS/mZO7Yu6oAsdBqHm02V5k7T+0bUmFwHGbIrgKYwaXDsJToG4OJeNXovLnl
	aSQ3URKryJvs64POzafE+87Rsd0JwrlMs8ZCF3BwibYgDZGWcb9cvOia6o4ypZnz
	9YfUxb4QqHpZD8rKa0rx85oLzCwqmKKxVzge2dSoEmcRTeDA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdw723-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:08:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so2394614a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 23:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812926; x=1795417726; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VsctoSyuzeDFyOLJHRFtf5FpkehAfPMSRea91fkgfbs=;
        b=LI1lEujGGe1Lpa6zJ0gKOLH8EsGxNBR4X7IrmAczkLxzZhEml4cDItkRbHgqhFf7Ab
         mhIZCnGnp4C4WCnauY6xATLNQXYF4wrz8KKNzOWBte7yec0eI2W2/89x42+nNYfxNxsF
         Sa9gn0N65yMiIsQNA9BN0zMrMT9tEDg2WGo7lfyYl2teRgxxM3YL52ALIJfdcjkVXPuh
         fsWAHcGddEUtgObJev6q8A8P3sQXgY7ZMYonO1RUrtaxBZhEpXhoXp1lnJ5z6CBm7Aha
         mgZQb5JzxkqI7AmooDglDJF30dsaCiZqYCsE9haetmEq74HT/tIpsICXrEa8saf2tkqF
         FXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812926; x=1795417726;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VsctoSyuzeDFyOLJHRFtf5FpkehAfPMSRea91fkgfbs=;
        b=mRVMWZNMYyzPv6dWCUGrAK1DXaePG+9xi3m8n03Yse8fQ1SD5/2An6aVvzeTVSGVuu
         qvii1aLgPpv0KorD5V31YUmyZrg293XUKG83eCSsMkSg3jk/9d10+FjvemEDtrUF+lYr
         qNgmz5mKX541SVUaZ2CDTh+XmvUKVGBlGOlJGtCHvpn7iILHwUrpwflvf4TkrNGjlMEz
         vx/LiCiHeU3KbKqzitveVfK1eXlkLVqYRq7y6uu4Pf2TWf8W55i3i1Rgd5MfAxn9Qvm6
         iX3xsiFkbQz9dsPKLO2MdCE/ogaoj9G/v/wXwvp4bHrifhw2ZiKYPfpzISMVX+fpJwrB
         hUrA==
X-Forwarded-Encrypted: i=1; AL+hErGa0tV5p2uOPY7rsSERi9+alNxNVdX671iQGrzNrLKnihbmrH4sdwAver0uLsE95iApHPIR1i7gwSX+6shT@vger.kernel.org
X-Gm-Message-State: APuU4Z8Mq8hkVN3HA0KO7r4/LzTBl//307QPcLRB1A4Ckb0G+5AmLqaB
	T5E8QgVTLFbRzAxszKanZyeSoU82LzjdIk/MChO3AkYQ+tAXQPlGJ5PSq/UbS5QEGuG98qtRjtC
	9ndaHn6Y8f/o+SRyehFGSTGC3+ZdrIlsAZChJNN7hsYWdLpdD6dfwG6vWUJ/5/XsCyba2
X-Gm-Gg: AZFdTZdwJ9f4RIZSScfeXq6g9A98EqUa0hkZkwO5MWxGeMBU02jpMa06g6V88ROdGrS
	RdLUfIF7K8yxPZDXAZc5TTNJ2+ncaNrRSIJYiEo2VKZIoTMk4EAqZ1TWR3XkRFX6pXTiALdSTzM
	fTY3reGOfWYYYv5RPl0gi3AYEI8pXDQ4NHO1dzL4CoXdDLFcfcyynjr6pV3uvmm6IhbUIca5X/9
	YwQ+3sLwRLvPQ9cWp2VBtqscW5XQS5mD26aLBFK9ImVV8O4Vn4Wtdr0ZFZzECCWnnAhxK5AJAKf
	+FJYBra5qDdxNp6/7lR8jEnQpGNPwpKjkdLrw/IddpsXlOvGK21UZdQ3z9BB2KBG/ueJMN8zupB
	J9W4LY4K+Ev5m+/eiW6bHLwecEOfd61642sk+XsOv0AU50JRu9Eso2clEpB34gVI2F8vCauEybQ
	==
X-Received: by 2002:a17:90b:2f0c:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b1b0b89c42mr8804473a91.49.1794812926488;
        Sun, 15 Nov 2026 23:08:46 -0800 (PST)
X-Received: by 2002:a17:90b:2f0c:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b1b0b89c42mr8804451a91.49.1794812926018;
        Sun, 15 Nov 2026 23:08:46 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm8658667a91.0.2026.11.15.23.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:08:45 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/3] pwm: qcom: add Shikra PWM controller
Date: Mon, 16 Nov 2026 12:29:47 +0530
Message-Id: <20261116-pwm_qcom_shikra-v1-0-67ee4553adc5@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAOOp+moC/1WN2wrCMBBEf6Xk2Ug3bdILIv6HiGziRoPW2myrg
 vjvRsUHXwbOwJx5CKYYiEWbPUSka+DQnxPALBPugOc9ybBLLFSuDAAYebl128H13ZYP4RhRoim
 0MtbjTjUirS6RfLh/jOvNlyMNUxKP31J0xIwfcZst/rzu1Lsj/8xXkLnU2jsAnUOtYNUzz4cJT
 +m+m6dYvg8tMsl3E8Y2q0u0ttHaQg66rCpEAGwMKV+gA9sUta0qX9Zi83y+AOJqPUf8AAAA
X-Change-ID: 20261116-pwm_qcom_shikra-a63526bfad29
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afaabff cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T5qpfgZGmVIljgUINK8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyOCBTYWx0ZWRfX7JltpI61W9mG
 NKo/ml2K5WH5BiBF9NXQuTbS2RlqGs6mhI8POadczxavXESYOlN13dGAGZmDRP2FzF54KSqLikv
 +p/Sl7r9ko+QBrDxuOwQnMutffARSWw=
X-Proofpoint-ORIG-GUID: mrVCDBCVTjPnAzU7hREHusJla_AmP8ra
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyOCBTYWx0ZWRfX5u/ufbxyy1B3
 L5LKyIcmOz5OtQ1O4155pQa/Yezv7aFnsPXI2pEghjSN2lUDlVYd3My0f8m2Shr8ybdNkwG1RY4
 O1LVbBHKo7Y4a+L6CR8mM0nQ+GgRpOk8lP4LxUwtN/QPlDosjrX2dcgyXyhzbYPyV3PKlX/U0qU
 VGQMsMPggZSPqvhEy/gUNZ9nrW9yqqUdV2NRwwBe7+bFoKCfUn0adpLo5qmzwvOf1iokgpI7L87
 Q+MGWXqeKN+Zm56SZoIdvoKN6U7pewMGML23ZlO+pqBN+t97xxl8+SpSZzFmgdKCgfZZJ5xHyBn
 Vgew5H49qsktD7yM05h3GkjLbEV7oQ5vfuWTb6eUhTkR+7fKAJgL0m9WT/ewZdeYwMw0q8g/kdg
 2SDRNyaWqXigFy+ZLzjdcOQ0oOCrjo7Hcn7I+3VINwh2s7TmLIAXSn+jeUraPoYtcDtNsnjXJl7
 fuz99330Z9pLT3pzZUQ==
X-Proofpoint-GUID: mrVCDBCVTjPnAzU7hREHusJla_AmP8ra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160028

Add support for the Pulse Width Modulation (PWM) controller found on
Qualcomm Shikra SoCs.

The controller exposes a shared output-enable register and up to ten
independently addressed PWM frame blocks, each modelled from its own
device-tree child node. The driver retains the shared AHB and PWM core
clocks while any output is active.

The series contains the device-tree binding, the driver, and the Shikra
SoC DTSI node describing the controller and its ten PWM frames.

This series depends on the GCC PWM XO512 source clock, which provides the
GCC_PWM0_XO512_CLK_SRC divider feeding the PWM core clock referenced by
the controller node:

https://lore.kernel.org/r/20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com

---
Taniya Das (3):
      dt-bindings: pwm: qcom: add Shikra PWM controller
      pwm: qcom: add Shikra PWM controller support
      arm64: dts: qcom: add Shikra PWM controller

 .../devicetree/bindings/pwm/qcom,shikra-pwm.yaml   | 127 ++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  63 ++
 drivers/pwm/Kconfig                                |  13 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-qcom.c                             | 685 +++++++++++++++++++++
 5 files changed, 889 insertions(+)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261116-pwm_qcom_shikra-a63526bfad29
prerequisite-message-id: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
prerequisite-patch-id: 25c90a2ea712aecae7404104dcc83e1c79227b6c
prerequisite-patch-id: e4b3500eec0cf6bc98edc43780b2828c28445b5c

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

