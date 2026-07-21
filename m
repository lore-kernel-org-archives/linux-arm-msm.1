Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695693B71D7
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609865; cv=none; b=q0koP4yMw4QlJFFDcHveB3SnZP4j6uBB+uD0AMcW1RD1g+2VwxJ6xxs4mZzTXAPquF0C82HVVfdiH6mKXLFTWWUuL/5/WS6Vg0FKzt8QOhDeg+A29G3A/A/DIygO2MVenZw9iNnoLUGXAVxsDVgTtNxtOT3sKeCum36+j1Mvfns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609865; c=relaxed/simple;
	bh=K/ZAH9ELK4SChKb+nx93qCeoPRqba7jRn6VGz+I71+U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sNUDAC7XY+9U9r8Kt0Oc+1JNsmNqe4uxYhzeG0pEAB1+xap4UEP4qFNyxMWbcViHp3uOpaoiAlKmav+f10Dycf7RDSTIXZatPNWSRyM3IIDLeLhlB7uVJTIWENOksySGGxDopXyjM8tqOKgdv050b69ArAZF0Z00JWEpVI40HI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5lbgN2m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDW60NQj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5lbgN2m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDW60NQj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L44I1J534830
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EIgADuTgHbMX/s0xRCiom2
	8an5iwCUDoSZrdINbqdVs=; b=p5lbgN2m0GqSKl4YSMRAYZYlnES2S564KOnaaO
	cv4pmt/gnJRIzNvJ7zOGOTjx71hYnhGpmrVR+j0c1dSeAHtDPs/8JGqKOz4E5BYw
	8kymJXZ5vLugZOcEWeeK3CNpEiXvi6D8X/mhxjeax5tDoNTwiZ0frC8yxF4UR1cq
	7ERZIjje/e/yeEzISwmXBHw+bd1i/gst3yNWzAUMf1uwrV7MLmGVdiFpmHPPpoE+
	LMOlMDYaR8QWfhRdeKOAaAf+cBejFnMM/ykIjtNDuHH1Y4JrynTk0jYyMu067ftX
	LDnxeDdgG/8lhP5/zjJt+9nu9Vj3KX+r3cPntsWcopRM8V1w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dug5dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:57:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2caf4173b1cso154646525ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609862; x=1785214662; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EIgADuTgHbMX/s0xRCiom28an5iwCUDoSZrdINbqdVs=;
        b=BDW60NQjffl0JWUX8AcKSxxz2C6fEALiJBU/QqsXKmISP2TPrIH1nz1zeTBErH3Z7/
         lBgjlhOD4dR+2RJx4rCZBBmITzpTO2mmeRhUTUAOk6TXk+t0EYq35ZGP6fyXNyB69Cba
         +HgQE8N3hhVPXrDccJNkcoAqP+NAMjTLr/N0J8PyeDOx6XssY4ymVnd2slDvNE2RyWsC
         SGOUuST5glgJk1xRxWJUHmFJnq5UCzZNyk8xtxd0QujlrRKoZ8N3P30BvJR0YMoUCH3o
         vyew/9uQ9SjV6bN2MSicw1FWo9Ado8R2vfYJvRsBIiASmX8eh3GQO/TEE1ZJV/ZoeDHh
         4Pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609862; x=1785214662;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EIgADuTgHbMX/s0xRCiom28an5iwCUDoSZrdINbqdVs=;
        b=OTFpj0TLoAYW07ysc6BuVzgBcw6YzuQ5+mDUYmj9cD9T1kieqTtagFjLOY1CuAsWGt
         rYWtsZ+F6WQpFK8fQWPwYkZi/F7Jqzi9VroSgOW0UgeMrL2IeIw6cMafN55cvpfxWPJt
         QlIINyteILh6ldUj97guLU42GpbIjZ//HQuCFogTJ0+zbG/su3Hv4To3YhEEmbDa9RLh
         AqDLeQqXCiu37RgeqjS7Cu5NvFLol6F20GcahQgx4pTwseSAvWMvHqBkQSt68iceZLl6
         qaivkUOhw4hQjN/FP9a5leh7TAtFxx2rPGIbLmJyFcJgsj5wZDEyezHSmw1z+WARNflO
         D1fA==
X-Gm-Message-State: AOJu0YyuD08hexYKXccPOmy+9+I4snOIvb9xGcoOPw70KeqaHivVvefB
	LPvJoJwUZ75w6L/LtsJJHBgtpCvMhrRaJPadS2/AsrBl5dku9duv75oJynABBlvzWl0zp02yJMP
	Q58tAlKdnN/n49XuQ0QPIZIkLHouqXqNKFiZ03Pf0uQ1ypht6eJhQ2bzz3Jy+iMQdQUaP
X-Gm-Gg: AR+sD10dzVv18nj5xXeYiqGDtXK5vuuVKgvU7th9S6Y0+CfEUz6eTSucwiyFrBnW8iW
	5RqOAEdXDCnra2aSNnd91oXbifikv9/kaG+G78SOeF3gD+Y3+7tmkwd0kWLiHYayIhoCXva1sxc
	vNPCWAhjaGzNoIc7dAbVmQASPQQhV5QSVeQhF3VXIT0PleNhhnt76wIEpKSKGn/LX+uke4tGW7Z
	Qek7BHQI0gwBcR4MgqsEK4XXIwp5QXR4EvwzmbRUUFvwTV2oI+E7odkkgXcXlfKbToF5e57SWkB
	O9XIMfa4e84v7N+gFxRFL60187IsHgUAQ6AYyNASu46L6rVxuBoGaNIZ2/+n3Nkgsd+zJPLhtQ/
	9DI/zZdQflIXTUO05NS4QkWCyzz6QFNYopot3/op6kE9UUUwOXgN4udE=
X-Received: by 2002:a17:902:e74d:b0:2cc:ffa6:4622 with SMTP id d9443c01a7336-2cf349de7a6mr194972335ad.41.1784609862354;
        Mon, 20 Jul 2026 21:57:42 -0700 (PDT)
X-Received: by 2002:a17:902:e74d:b0:2cc:ffa6:4622 with SMTP id d9443c01a7336-2cf349de7a6mr194972065ad.41.1784609861942;
        Mon, 20 Jul 2026 21:57:41 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm42110862eec.24.2026.07.20.21.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:57:41 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add CCI and CAMSS support for Kaanapali
Date: Mon, 20 Jul 2026 21:57:33 -0700
Message-Id: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD38XmoC/02OQQ6DIBBFr2JmXQzQoLar3qNxQXGspBUU0NgY7
 17ELrqZ5P/kvT8reHQaPVyzFRzO2mtrYuCnDFQnzROJbmIGTnlBBS3JywxEyR6dJJKWtKEClRA
 cIjA4bPWSZPf6yA7HKTrDUcJDeiTK9r0O18zgEkjylpzCDnTaB+s+6ZmZJeK3W/3vzoxQIlmFv
 Lqw4tw2N+t9Pk7yvavzeKDetu0LuPMBM9wAAAA=
X-Change-ID: 20260507-knp-camera-a070d05ec552
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: RpH6oHrS5oreeLU1oYw8HpvjHPHP6m36
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfXwA7x4jg5cBUj
 JmTzbD1HBZwzBny94H29TojudJcFiiu0amWG85cDPDbbFpzTq2Ua/CtvUFNt3PUteQWzv4zT6zu
 GFcWbVW1HaDINJRT6CZPVLlnYW70s5TuyOMfVWKkaVonDgLP46BHs9hjlVXiAVbHpH/TDRRs/h0
 woOUqf4Rimsk+lav7JrmmmxRzDXhPMsPXUmpTFbO2y18m0hjTArCPIwzXYibZLdT21YuHcd5pV+
 9FlGyH0Zw2Xze4tsXEfHXhGkdnTb232tlsqadEXymih9np3gLNEs1WkO8GR9krmyBajlKk1nJhd
 ZmJQL53pqJRkRByVQt6i665esHZT724n/zBKs9ISuMmifZJzt2M/oCc7MHWe6M9/X0tAygzYTzm
 /jWJUZ4SU4NuY5a/QF7C2khkj1rJrlYDS3j7N9GvQ9BUWkkb4bEC1/FAYEWAk3ex3P1xnFGMqyG
 G5sLQibyJJlISNw0Ydg==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5efc47 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OFdHJre5LK366wQswZQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: RpH6oHrS5oreeLU1oYw8HpvjHPHP6m36
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfXzJflvsppY2aH
 xE/TXCl0oyc8GPvmO+Z//x37cuUFFTTcjoGZNVwrH3tVhnFkeey32jJrP3rZS9NK6wI/CqHJX0D
 FvGgIhYi0fi2udMjj6mJuMH5TCCZ5Vs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210048

This series adds the camera device tree support for the Qualcomm
Kaanapali SoC and enables it on the Kaanapali MTP board, which adds CCI
support and enables the S5KJN5 sensor via CSIPHY2.

This series has been tested using the following commands with S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Driver and dt-binding are waiting to be merged:
https://lore.kernel.org/all/20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v2:
- Enable the S5KJN5 image sensor on the MTP, connected to CSIPHY2 and
  controlled over cci0_i2c1
- Link to v1: https://lore.kernel.org/r/20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com

---
Hangxiang Ma (4):
      arm64: dts: qcom: kaanapali: Add CAMSS block definitions
      arm64: dts: qcom: kaanapali: Add CCI definitions
      arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
      arm64: dts: qcom: kaanapali-mtp: Add s5kjn5 image sensor on CSIPHY2

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts |  90 ++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 723 +++++++++++++++++++++++++++++
 2 files changed, 813 insertions(+)
---
base-commit: 03cfefef0119410fc464d0d56e83626cb570b7a8
change-id: 20260507-knp-camera-a070d05ec552

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

