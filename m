Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022B21E531
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622364; cv=none; b=MMonrHYE3MqjQF39OOcPwERj01sxWhuahnYIWOqfwYIQXcfbZNA3pBtZM4WmihekhtJJnxH2dL8KQy4Q3GRZqImKd/h2v/sW/pZTqpLZf9x6DU8MnFZqt4O6FwDDTC4OgwbZidQNBT1Ljm/IRCOuIAPaKQJsOZ9VblwUMZ7As4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622364; c=relaxed/simple;
	bh=/DdqN7sH6vC2NnKyI/86E3+o2KbyOZLd0D5BhQM3yZ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WAzrC803AiVY1lleMaT/HBp7XXT6HitwvPx+ElI/FjKWrdX6SsuOwoIbWa3Ra4v3Oz/dCuwK8vFu2bnYoYzlCxPw30258vi45B8sfpNtj1nuCQC3zROT+v5YMuGs6BdWS9Mf3wFZER1NTksXbTSCzn+gLHjI3rGoOEl7FWOjbAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RvXVzuX8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X3t5M5rn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RvXVzuX8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X3t5M5rn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L44Ddl534736
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5QbpUwVQQDqNZloiqaCGHl
	uMSCwf7elJFJ/YxRp4i/M=; b=RvXVzuX8FpQf08scaQCkOxJTi+hoKCVjwarz6F
	EeTZPMmYAXRVv7bcJa2Z0muvvlVMfUgV5GyudnPCOjybJvkhHKYP+YxiP5IMTuUH
	ij0UCCJipRTPnAokuiOSHVuk/TFdpSvQ3KQVug4uqsyjgMkUmnt/rYAb0VJYInZP
	z0M0ysa4MZwlEvNOd8/L8cVLhSo+PW+Nq486XpOT/5GW8gTAWMb8smnGN3gggZXE
	7Tj7IgF3GeoT6r4AE3dRD72P2aTXVGddwvc1RVvvFAhSrd5Ts6DaB7Nm1i0mNGDQ
	eiOwn2+YvCtu+IVcEbT/4QvbCBItjF8v1+yjbI2EntH+/3Dg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1duh0qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:26:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c110a3b6aso124000481cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622361; x=1785227161; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5QbpUwVQQDqNZloiqaCGHluMSCwf7elJFJ/YxRp4i/M=;
        b=X3t5M5rn9LHLuhfuIuyYPL4BgwogRCs5htlZPyMpq7mjaD/wVcyN7dguKgxvwuRcSY
         S5ONZa63EzzmIppDluXUFe/NFTDfcjxzY45kpgWmQVdP5Tv9OAOCRQrCSjUgrRjIdNjr
         t6bPmvttUDwdtcEiItqieX24PsbX2dDLTSRpny01QaGRJk0Ew4YKmamW5uyFzIDiOfi/
         F2ooDdn0Lq/EmwVD7fpLPqgd0abOedHdUcvGnAcoKbn09Cnd9MXnDVFi05KrhO62wg+o
         JC+OuTCqEfPbK0FOGtTWD+n/vXYV0HNOjfoOjaEjM9/eR5hElcFRraDss0wktIw3zdoH
         Opcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622361; x=1785227161;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5QbpUwVQQDqNZloiqaCGHluMSCwf7elJFJ/YxRp4i/M=;
        b=VNAVYCDNQlk6vTj2nhOKeGfYzaFWdf3ulN6T4pYRPTkWkbfdSi2XzEVl4bVH+wrNJx
         k+Bf74Xpwnb0z/knHzUzhuPHaEP7vrm3tifHudu/BXAPGnEiucPOZvpdfuJ/OEXgauPS
         Nob5HuGyBZPTB+56g/f544gVRPlfkzGa0QT9ezmUi3kYIAGRcB1Hh7BXNPmx2Y7qhS3e
         +68xT9F+q1xtyX2xyM4UKxuLDrc31EFqpFOR4QzZ/4Msc474S9y4vxSmGZ2R9sLG5UzZ
         DcqByqQbgM8rN7XF25zVN8S05ccvT7KgrYhp+56WSLYmYJOUfuNG0VPjxF0Tr2VABdqv
         MXAg==
X-Gm-Message-State: AOJu0YxZ8N1xFxCTsFxnkPLBUuT12NUIgzAKOAjNJwqO/vKDAG1VyGBe
	PvgUEVNH3L6qYdcEAffraZbkTQ5WWRTaf40Lb+ZhuzpaG98dETS/4GY18sTdUBkwdsH25Y/0+WR
	IMIAwwQR6cMrL1nThDbmAnl/ZbzYgvkYo51RFQ9YBSpyYELJkk/ty/cv3cMFtAZRtC13a
X-Gm-Gg: AfdE7cm7LYJlJBjghG4972q60VbNLa5EyquOX5YB33VLVEoJojCINsrrYnN/3PgKwsQ
	tdQPT6Zz+J0v0EFeOEGxUdSqiVA0oNZb13h6Y0B+2n9m09NzxeklxZQygQ9ZceXEi+WFSXA5jjf
	FnNCF6ScdNtfQscLe7pVvVN1BEVdpTPcKBHiT/wLRpmAtIx8oPKhHnr8ABUL6BtxXRAUX43ydjS
	2XtiyIp++jBSzN3N1MVfxSZa5l3I7Xz8Gbweg06+gH68CH5TginQKauAh7hee+r37r6nTpb1O9C
	Cs4oEpSZvhWB93pPX6+Mo36MuunB/bYQ/WbLLOcaYgpVib9mnfHAkrdLD6aRqmL8ReUKi/QMrQc
	axSo5EBea
X-Received: by 2002:ac8:5d91:0:b0:51c:8439:14d1 with SMTP id d75a77b69052e-5213fc578e2mr167178201cf.63.1784622361054;
        Tue, 21 Jul 2026 01:26:01 -0700 (PDT)
X-Received: by 2002:ac8:5d91:0:b0:51c:8439:14d1 with SMTP id d75a77b69052e-5213fc578e2mr167177921cf.63.1784622360381;
        Tue, 21 Jul 2026 01:26:00 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956537c7desm66664595e9.7.2026.07.21.01.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:25:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: eliza: Add CDSP support and
 enable it on MTP and CQS SoM
Date: Tue, 21 Jul 2026 11:25:47 +0300
Message-Id: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAstX2oC/4WNQQ6CMBREr0K69pNSxaIr72FYlPYjNUChH4hKe
 ncLHsDNJC95M7MyQm+R2DVZmcfFknV9BHFImG5U/0CwJjITXJy5zE5gJoJRuw6wtR8FyhjQhgb
 goihqIy+60ILF9uCxtq99+V7+mObqiXra5jajsTQ5/96vl2zz/r8sGXDIRY4yl0ocK35zROk4q
 zbKXRqDlSGEL6ZYW0vXAAAA
X-Change-ID: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/DdqN7sH6vC2NnKyI/86E3+o2KbyOZLd0D5BhQM3yZ4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqXy0SUVJNIjeBhg6XjfROP7VMV/Jpsdry7qqfg
 /DLkRhLq+GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal8tEgAKCRAbX0TJAJUV
 VgyND/93jlV/RQ2Gh6act+q7B7kzuBxmKdaHodT+bl/S907RJK7uuTkuMRwh43MFiqMprrYymnF
 XBrMJuG05rsmHchaJp5PeKhMtVu1dEuVTbydQdL6SrbuZPuqXgi8RFLGLGnxbzLvQpjrWQgQtoB
 Jq8nkrwEOX5qpFP+cfTy26djnHhy2graQQLi1/E7Jbj8qVBzVkiZ2yEWiSBrGvdeBXfdz5VmsJc
 p+FtQKwCZBJVvqheG7SUze7qXvipJPEE71lD4E8ct3h2qaiUVunI+zehoOMWckjQMYB/WwZ1TUW
 jVcSWmM3XjrlnclWLpCdkEvkphIt6CDxhNZM4u/pdyDaLhKE7PBxhK33nySEaMahxbR9yYGSBnX
 cMef8+GJq+cMArJKCMxunmIN+MG0d6zvdYHSS0XhBooNLlzwlg8ZYwLpWfd4RkhqTq1Dsipn++b
 JzpssoKui88Ztpb9REdDe6ePhRXIENGaemhfg6qdQpNyfZgVe99mIOiQvHtbK/DReb9AhsCutcG
 ObQyAwaQAUVu0RC8WQwo3NMJPkxS5NMTQxh9ki0m/aZ9uB3ZdPDeAzY0WeLUxSCwrEwfhp/RF8+
 FZWIzptTYBNQlB+EVlU03eqP1xj9nNxNjd6Mopn8qmD8ORmYG/BXza8suVWO0dBPqFGXecZ2nCk
 5Z8gfy1NFvb37GQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: fPXd2HGXarRor23xN9AG0iDhapRjp157
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NiBTYWx0ZWRfXw3M7vODNx6p3
 TiTVYoC+OcGEuS9d7tN4YvoK/o/J8gh73C/c2ThfIv38ujX7bmXmJ6qhYngqcCX8OQrlLqKmz0i
 y+811eCL/GbwRPcHnO6mR87LRfzEprtQQkExFU9ofFtyNO+7gzF3KgMVxVoVldHNvLM/2whRsmz
 +ayGBno2NZ/mBTUlc1ENkk20QliZHtvSQGcla2CRGQbDsHRTifcOwUMhLpnZJ8r/amL4nL8+SPg
 M5KsmEoM/dBSJPTRHs3AOLPjWxGSJKCJvzVAo/tK1yqzkRpAxRYdkWl7w1Sz+JjxTdWoaP/LuyM
 /x9+KdaTbm8MqNBNp2nyc0oQPcj2qYQ6JNLW/idKE1JEtMhFW0e64ua5Lw0AYzB3nQtlhdBExtf
 fAFKr20IB29g7/67yXtYuPnwUS1biyXp/HMvcmH2LFWMr0W4oXNIMNvjNa2OKgJsvC+gpxVvlPw
 qyrW0xMkuqPNl1vifDw==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f2d19 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=gq5U9EMG04s9TwDdztQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: fPXd2HGXarRor23xN9AG0iDhapRjp157
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NiBTYWx0ZWRfX/k3roMmW5Wsa
 JmxaPta6VpYLmBL9NqekmfAzs+5uP1TmHcn0aZubJmsaKBF5xUUGyDEugILD1K7apVnZWsgoVJj
 63dKb2Z08YoNOyeYPwpo0SHugn8Dtr8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210086

Describe the CDSP node and the related SMP2P, then enable the CDSP on
both the MTP and CQS SoM.

Driver support and bindings update are here:
https://lore.kernel.org/all/20260721-remoteproc-eliza-cdsp-v2-0-f3345405e4da@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260720
- Picked up Konrad's R-b tags.
- Link to v1: https://patch.msgid.link/20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com

---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the CDSP remoteproc
      arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
      arm64: dts: qcom: eliza-cqs-som: Enable CDSP remoteproc

 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi |  7 ++++
 arch/arm64/boot/dts/qcom/eliza-mtp.dts      |  7 ++++
 arch/arm64/boot/dts/qcom/eliza.dtsi         | 64 +++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
---
base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
change-id: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

