Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956871;
	b=Eb1sNjv868+YBmbP83NfYC2zk/pdBWxTjmv94FRiHS4ZDxT5msvg89juCk6k02DiR0dM
	 fsPAHVqLIk+eigU1q40/OGK+fZAi0C1IAwdyHXf/beSSaUJpqpn5TTyf0DTLfae7koyCd
	 9/epUkBP+hCh8yLwP2JxqWUuHOUgdULSzYKYjFCyz0faaxCtqK9It0CiF8sJeMl4daQ7a
	 /We3mFyOw187mUPjb/5VgJFi/30Mjv0uqgm2IyApdansNoUp0psedsfiX3WWhrKYZkVvf
	 00RIhgNoz52uRfjyFoUOXJJzIC6lkGhtaSu/VGEwVsu2y/WRsMJ9QNYWu9IbSiFZO6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5hQnecWNJmeaMurl3qe1G9byYeEYjJwb9QtLiWxSMlI=;
	b=zswqJZK6/Ev+foGUdc1waeoiCXq8JXHL+JsokUwNAIGwXzTjs/znrAXwQdEW7x6qJHs1
	 UVByfPz+qfD5ZGJtRDrYWS2LpAFGVVPeapUDnlFDw9f1qYCW8GTYwBTnMqYSW4m0DYV8J
	 ja+2GSWjh8meuX1yVB5jYWgWzyo7P50xkfkaTVuwjyKC8Wux1xLlvEN7IBHuxUUwL6qkN
	 gq6vyi+U0JsrgG2ahacs4SEUfwef5SQLjTbOycsAuBUl5PVcZ8P5UlG5LEwsKfx8adjuA
	 J6qtFGBi2FtgL4x3N3ccoDgZFtUT1C0Y2DNkzgXCl6dVAzQakjL9OAzQtKv9sIN21nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GIJo5AEt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJKcbclh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9264606A328
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 09:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9264606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GIJo5AEt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJKcbclh
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R73H3243892
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 09:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5hQnecWNJmeaMurl3qe1G9
	byYeEYjJwb9QtLiWxSMlI=; b=GIJo5AEtOljS2m1KHnlY0NzLnOIAG8ee3YxeGc
	jIzZb6X+rXZRHs9TWalzxNUC9RGP+VvC1l5g+OXLnFlcjlZaCL8Y/8Ir9SkF3lSu
	MxcdOyak/xSAD3xQp9ztfmQnuaCv2vNxvLekwvD6Y/hl0e5ee9d4E1gsGn6YetXE
	xBM89pT5LSuAvdm1ykfqN4HIPWFY+O7raXI/Hltb9bhQutwdAPyVlhvUT11nyZdo
	wIpVKMYu6JNYV9wZ0A6JF08rzV0NNm3XowvMNpt0gMbWdvk9t452ffeSmylnhakE
	csMqVWsEtUmwaFJngq7rjtdI2QGNAa7+EKOwXeipVjBRKgKg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa21wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:21:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so1003972eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 01:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956869; x=1794561669; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5hQnecWNJmeaMurl3qe1G9byYeEYjJwb9QtLiWxSMlI=;
        b=HJKcbclhg721kThs3iUKHc6TWodx2VfZDGVaHS33ezkGC3gYIK3KLDy2lm86gO0IE7
         WB+vG06GvQcKezQkhirCvBGV2IYu7Bm8AOSHl5Yg32Kj/xLzEFVKobsbSvS6w76GAVPO
         EBskofq1PmyUx31Koe2P2D3kZkpsLgI0m1jGVQF0zQudVFHrnqkKtScjNg3cPhACiQHu
         mtnzV58x8HpQzVSlIma6ldo3R56YInOj6vBGQ8EhO7sUXPcUULYKB52LJo67KfTg+CyD
         O1Z6tuQWcKRh7d6XZs3RjNl2gO9VCeB+slzvWxEnBD5jKzdogpDEJToSm4Lk42xU8agm
         Yl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956869; x=1794561669;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5hQnecWNJmeaMurl3qe1G9byYeEYjJwb9QtLiWxSMlI=;
        b=mES7/yd+sa5FifXZAPsy/8XWoPr1p+o0KdZEwnNZJGQwQlFQQiq71R83/zRM44voAR
         WyFl+BxBO3osAKzpCvJNCTG3A5T4uTYWpg0+onO20CYFTVS11oUdhzjxDDrqTkbBX5zo
         MhQUuUIggiFxHYBSfd49dfqFGuQj43Olt3YUnvxxFM1CN6NxYPQxBlch9b+waI6NLvEj
         GLU/BxRl+GNe3j1zKT0UhchP22HB4VJYB1zj+f7lkzbpni5NK6aHhEoh6wGFw+slA1rj
         ef9rlzMte7tX1UcpITmAwqYSI7spjWTtpgEQMNxiWWoCqQegOK7KWjGzGC92gWJltnV+
         tTwQ==
X-Gm-Message-State: APuU4Z8s0RprjxKbvNuERb77Lbl/fm/kyFVAPdDI9QjJeEyEjO2qt1+z
	Sfpbg3KS6Fgr8LUGeYcd7a5IdbslYVbIZPukenSiiHJ2QcfN8X4MMSl9WWAcR98ZI2iq5ZF6YAh
	/hqZfpDEk93bAM7VBZZoRASVHGYXxUCNWGPclnqfcMs5+NNO/Q86gfVbA9pqgJOkJjPHJ
X-Gm-Gg: AYBFou3IAolsvCrsYwOspIn+Lw5pZQhtN5QimDHbyco5zSDZqzxShXcAlRd+CTS9+Zg
	rEdZfHlaEvvNq7JMarQTS6tTJD+s6YeyT6Ac3zsl7rRdDX9nSm3JiAJofT24IXVcaS/eYzS/tWD
	sIY3LWqnOO2Rs8CerOzMBRK/qVc3muEpPAsA094e0YjOYNPQ2lqsIT3/AaQhFgenBREcO8BR8RD
	8fmEqRGrAgU2UW9K5ZojXrPhxdjotDg4WsQxPTEemiMkDfRUDPT/OLA7I9jG5vYY7Hot16OZeOO
	Fp5/zDxAImMzXDmO1sbzTcECVVCzsJYNYgDeRvufdnIwyQPR2DpMFrML4Mf7lEv/i1P9N2e6t+6
	7W6y7LxaAEautZVIwWHnfkmJUGvvVCHS2K8QHY5Fox3TByxDWdIhth2YI5eKv6d2/UIdTjKI2ll
	Bn7TA9XFLVgWtU4MLcTn5hZi6QlJnj8Q+U3srU2F2ISWEVV8/wNWCmkV6Wmsgpz5gDL2TkkHt+9
	ca6rQ==
X-Received: by 2002:a05:7301:1509:b0:368:9553:f2da with SMTP id 5a478bee46e88-36f76b12203mr2418995eec.31.1793956869086;
        Fri, 06 Nov 2026 01:21:09 -0800 (PST)
X-Received: by 2002:a05:7301:1509:b0:368:9553:f2da with SMTP id 5a478bee46e88-36f76b12203mr2418938eec.31.1793956868257;
        Fri, 06 Nov 2026 01:21:08 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:07 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v8 00/11] Enable mutliple peripherals in IPQ5210
Date: Fri, 06 Nov 2026 14:50:49 +0530
Message-Id: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPGb7WoC/42R226jMBBAfyXieQfNGN+Iqqr/Ue2Db7TeNNBiy
 jap8u9r6JYiNUh9ADw253gu70UKfQyp2O/eiz6MMcWuzYH+tSvco2kfAkSf44Ihk6hQAmrwQ4K
 gK7SWKaeYLfLPz31o4tssuv/9Effh5TX7ho/NwpoUwHXHYxz2uza8DTA5iVBM/DGkZObb9rub+
 QCpgugcjAwQqJaWUR2YcHTXpVS+vJqnSVbm1+1VAUoSqAUjXRJnVHEFBKPpjc/PH9OWbf6eTGv
 aHwoJc+19+wAjZZPSQmg02nLd/FSQa6Wa58xKpVjFJTA49OdTOg9dUx6681P3Nx3iFdvU0ceYh
 q4/zZMaaW7p/6Goz6HkxBAaFzQLxJ0n/001m0a2okks9NRoixKt1AGZkBt0taJZtdB5Bah4sFR
 RU2m2QfM1zRc6r0CKIMlQHlyDG7T4outV3bkGEJoHYaxAy7doudDzLD9pOXWtdjw4LSX3eoNWK
 5rYQucsQCnrKy+11+La3ZfL5R+hAKKoaQMAAA==
X-Change-ID: 20260706-08-dts-e830bb27c72b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed9c05 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OAVUEJiqWiMpwp8HbvkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX53mMCLUGI265
 OWycJ5oiwBt9f4lSu33NXjdfmHR9f/ptG3k4bILomU9kBYFywn5XHAmYt3kV4kPoLJUFYXh4bhv
 GF3FCh5ix6bX3yv/p3gS/lq7s5mN8AI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX5u9KRXepCuty
 2xtlnVJGGLRog2tikAckPExWEW52ZFpNVav4QiUoRQqKVyjxO5mhaDJGvb7C3d2REOPiX6clrf+
 NXpoHymrX0IJM09N9m8gxqaXIgAERYOE6zOK4Kbds984gCN9hZNq6/JCU8p9pD35Z4zvPU+hr9c
 uNBhynHWONFQwxnuWr1ER88cvWNKigc3ughWqr0cI9GdzL1NYmRVLDOwYTzJqfvkRI/AqUkp3uZ
 l5SaDzWrJHBL/axOKE7G9nPl0GkUEZhoA3VXiJS9nkSKEbgHSzBxyGrnEPMk6h/d4hhy2ptiVE4
 nkGb/x9mPuFv6iBzV+d9C9cFZSshT5d71teGew+b9D863izIX58tpiIsoz93Z2PDAmbkJ1ODvZk
 6KWlcPldSt3B9HNYKFsoPwj4j5aPia6Jq2DHbR76PKwr1bEix2XeKGI5fS2TVr7GJcZvl9I46HZ
 OrRJuwnqV1mwHO0v+yg==
X-Proofpoint-GUID: PfKNmiiLf0R6FyCDwOA_ighSyfyWnhcS
X-Proofpoint-ORIG-GUID: PfKNmiiLf0R6FyCDwOA_ighSyfyWnhcS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

This set of patches enable mutliple peripherals like USB, PCIe etc.
Additionally, it enables CPUfreq and thermal tripping points.

Please refer to [1] for initial review comments on the PCIe related DT
changes.

1 - https://lore.kernel.org/linux-arm-msm/20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v8:
- Fix pcie0 & pcie1 nodes' ranges property
- s/wps/WPS/
- s/cpu-sleep-c3/cpu-sleep-0/
- Moved ICE out from sdhci to a separate node
- Keep pwm@1941010 enabled
- Combine i2c pin defines into one node
- Add opp tables fro spi and i2c
- Pick R-b
- Link to v7: https://lore.kernel.org/r/20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com

Changes in v7:
- In 'Add nodes for multiple peripherals' patch (it has R-B Konrad)
	* Reduce critical temperature by about five degrees per recent
	  calibration updates
	* Fix placement of 'efuse@a4000' node
- Move 'spi-{rx,tx}-bus-width = 4' to rdp504-common.dtsi instead of
  rdp504-nand.dts
- Change 'reg' details in spi@1a80000 from 32 to 64 bit
- Add #address-cells = <1>; and #size-cells = <0>; to spi0 & spi1 nodes
- Fix incorrect placement of rng@4c3000 node
- Link to v6: https://lore.kernel.org/r/20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com

Changes in v6:
- Didn't touch the existing patch as it has R-b
- Add DT changes to enable more devices. Not sure if these can be squashed
  into a single patch. Please let me know, will squash if that is
  preferrable. Following were added
	Random number generator
	SPI node definitions
	I2C definitions
	PWM block
	Download mode support
	ICE support for sdhci
	C3 CPU idle state
	Support for WPS button
- New compatibles used are documented in
	https://lore.kernel.org/linux-arm-msm/20261008-rng-v1-1-785580a8b48f@oss.qualcomm.com/
	https://lore.kernel.org/linux-arm-msm/20261008-pwm-v1-1-0b8776398632@oss.qualcomm.com/
- Link to v5: https://lore.kernel.org/r/20260907-08-dts-v5-0-584e5ab50b40@oss.qualcomm.com

Changes in v5:
- Pick one R-b Konrad
- Do not remove ipq5210-rdp504.dtb from arch/arm64/boot/dts/qcom/Makefile
  and add it in a subsequent patch. Instead, move the ipq5210-rdp504.dts
  nodes to ipq5210-rdp504.dtb-common.dtsi and include common dtsi in rdp504
  dts file and introduce rdp504-nand dts in the 3rd patch
- No code changes
- Link to v4: https://lore.kernel.org/r/20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com

Changes in v4:
- Fix following sashiko comments
	- Add #include <dt-bindings/thermal/thermal.h> to dtsi file for
	  THERMAL_NO_LIMIT definition
	- Change tsens interrupt from edge to level
	- Remove ipq5210-rdp504.dtb from Makefile in the second patch to
	  avoid build break and add it back in the 3rd patch
- Dependency related sashiko comments ignored as they are addressed in the
  prerequisite patch information
- Link to v3: https://lore.kernel.org/r/20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com

Changes in v3:
- Address v2 comments
	- Introduce RDP504 common dtsi and two board specific dts files one
	  for NAND and one for eMMC
	- Move 'dr_mode' to board file instead of SoC file
	- Dropped 'polling-delay-passive = 0' and 'polling-delay = 0'
	- Use THERMAL_NO_LIMIT in 'cooling-device'
	- '\n' before status = okay
- Removed 'num-lanes' from pcie0 & pcie1 nodes
- Link to v2: https://lore.kernel.org/r/20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com

Changes in v2:
- Change usb3@8a00000 -> usb@8a00000
- Ignore other comments as they are covered in the following prerequisite
  prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
- Link to v1: https://lore.kernel.org/r/20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com

---
Varadarajan Narayanan (11):
      arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals
      arm64: dts: qcom: ipq5210: Introduce RDP504 common DT file
      arm64: dts: qcom: ipq5210: Introduce RDP504 NAND variant DT file
      arm64: dts: qcom: ipq5210: Add support for WPS button
      arm64: dts: qcom: ipq5210: Add C3 CPU idle state
      arm64: dts: qcom: ipq5210: Add ICE support to SDHCI
      arm64: dts: qcom: ipq5210: Enable download mode support
      arm64: dts: qcom: ipq5210: Enable the PWM block
      arm64: dts: qcom: ipq5210: Add I2C nodes
      arm64: dts: qcom: ipq5210: Add SPI node definitions
      arm64: dts: qcom: ipq5210: Add random number generator node

 arch/arm64/boot/dts/qcom/Makefile                  |   2 +-
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 256 +++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts   |  17 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  64 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 749 ++++++++++++++++++++-
 5 files changed, 1020 insertions(+), 68 deletions(-)
---
base-commit: cae1456a7b596c7d21d86fc17216e6996f26da3d
change-id: 20260706-08-dts-e830bb27c72b
prerequisite-message-id: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c
prerequisite-message-id: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
prerequisite-patch-id: 66aa95814074faffb61393faa30396c42af41126
prerequisite-patch-id: 0a03dc1c91a2f0c03af823aa43f59a9005eb8607
prerequisite-message-id: <20261008-rng-v1-1-785580a8b48f@oss.qualcomm.com>
prerequisite-patch-id: 08aa18faecd4f3588cfd01f3330eadb1a76dcd13
prerequisite-message-id: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>
prerequisite-patch-id: 72e661bc72d8535e1dabc144e81978bc5161c3f5

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

