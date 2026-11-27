Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790464;
	b=VzxQiYdZrKmS/L5p7fvVt2j7OrU9BltPk2mZT4OSpmw0RhDQU1zK2ifpOM1TyOPuLYsW
	 3yQnaXWsqs60AT7IjJnkSQBLwC5z+U3qNrD/8gBIAU9d2mwxpxVpPUcKXgWkh3tOzuRVR
	 +0NQRd0+Mr8EhHf+jTo3NeFEWkZ9RAesVWeyhBXAxlcIvewOb1dEOfhEFCJtFihZK0tig
	 8tt4t/AWmLfc8AICHYaysaaHDi27JORrT7IqfM8/okI5JHswKM+c/yv/Wm0il5WDNjwat
	 MvX3aJWjzwMKr9wJE27J647pIZ8zr6XxSztg4T7LswWL8SVXsOm7NT/+W+4lvmpIklg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790464;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SJHcj1ye4onm2ASg3L7GIHvM+mwNs4PYz45ZKyk2REM=;
	b=aDm9cHqTnyktOxEzSFK+NMOxsxzXYrGipwPBngoQuCWsEV3FjUgcCRxNT/8EtiyIvR/5
	 2lrAIIcduPrN58HinE9CQb0rmQ8CWLF7uVU2nLdmdA21Iiru0MIcwyfXRxs/PesYXT8mk
	 fpTfhQRYyeO3fkm2Aok+yO6adMzeuGnJ6hqUqXqx+0FDPqDHAGLNpFKYdQOitNLwUybq8
	 /qb0gmeQxIfvUtcJVYany4hjf3MEzexx04FldVZGRJKsRyHSS9R/It+GnzQcCh7h+tWz1
	 tesD0soF9Tx7ppWAQX+OxPboqHlbRf+bZs+cf7SZaN9BU9ZrqkAf6pUXnLtDRZxqV1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfYYWJA+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BnXszjpS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6726606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6726606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfYYWJA+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BnXszjpS
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1PvP2683981
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SJHcj1ye4onm2ASg3L7GIH
	vM+mwNs4PYz45ZKyk2REM=; b=ZfYYWJA+vdAcFWrPAFNRo6SvLZWCqCpvXd+e9D
	vJxuZhpkpCAFLtAZs9glaQ//3Ma97B0u9CsQQTkpeSMKiSOFLQE0ycqK7kUC/aDK
	kaM/1tMbUJBEEZTxJlJk2VP/RddsyxnX7fcQ2qFtsBQsjO61ayhftpEyUmcjbd7F
	zQOB1+dBKkT3Q7dL2MuCsY98A7RhUx3/yU7ALe+Ia6tpTaWy4eWDxr5/nVT/91bD
	f8YwX4DItjQGcRbzcwMz6HXyg0U4YwXnxtN19F2Sf+VVgM4T26UZcgWDvAxYeyzt
	vN8Bw9acS5SXEs1YKuCunzebUjq2EyzhJBYkIywl3XjZzXJA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhj322-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:41:03 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869accaac2so4916153eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 06:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795790462; x=1796395262; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SJHcj1ye4onm2ASg3L7GIHvM+mwNs4PYz45ZKyk2REM=;
        b=BnXszjpSGEHr+u/tfM9wFZHyINUNM0MAhhmTX1jsplEay3WW81EkpGD5lXB5p26Dz0
         hYxNvQyKHn3wF8E5WPyCbTniXybiTCSBoYWdkcMuBP2/Jxy6CCUWplL4SPDroWMBSA3M
         JZkmKfbL+9sxyc9sDILjXyyuf1QoJdxwcIrxiaSXWYKH/SWswWnN1yVHVwpJpzJNYhxb
         4RsibooCr/37JD2zCp2DCE1ZATD9StjQ8KgzQCOJ/kg8d1PhBo34fe5DFn15xcOLCKb5
         WS0Rx4PJ3U0qxiFTnw5tf0Y8iJ9xwkhecUoyn/DCcbkZAic/Oej9QLBdaE1prVM8O1zT
         2kJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790462; x=1796395262;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SJHcj1ye4onm2ASg3L7GIHvM+mwNs4PYz45ZKyk2REM=;
        b=BQMzsvyjmlVM2Lfq58TWAwu/EtPEBa59rkXhIOms5v0vJDMfGQQqluPHwoegSWOIrO
         P3W4dA6Ux2jjNugnug2L0D6AnGHl/SGvogo9joN2NnUpa3bwvznHL9r22dC8OYgLKlJL
         v3nu23Dc6zxCs6u7D1KWLpuHvrg9NPP8KYr2Z+rDkGp1yuArhFf/VdDL01mwpZTgFhHr
         OgTubUaniwVY6luWBsJd1xPz3+62mK6gmT/8Rm4+40pESSwpfWKomWp10wZta5lkLMxt
         IX1shvhFiF6JW2CVfFS5XF19M05tvtFyh4HIJOHJphES5uWzq/unN9MZhWSIEKU7/Ui5
         338Q==
X-Forwarded-Encrypted: i=1; AL+hErEb4kXAhwlATuYXgvmb0vbPCCv+NLxCFiWCPPDhn5iqLZrqLWdZ6VN95u8F45B8I8l3TMXcty4mZDqQzuhR@vger.kernel.org
X-Gm-Message-State: APuU4Z/DESIZmQ7gWQ6BHSQcsF6ke0L/61PY0cWt9wpvCLi91NZ+pwYO
	L+kBxwLaiBdvTo2JObBkwAtEVRfzmTjrxFz+ra8yCebfbnYgx4sckyK793UhbN+Mb7GfNywUWLQ
	7WqZXTJYltX+kg5Vx7ud2fBbWORQXAZl18VxwdgoR/hPMEUWmHOBmgYUPfq0VgD/6Nnd9
X-Gm-Gg: AZFdTZdt0xRah4+vkOouqsaBJMeJA6sAsIYRj+ip9bQ6hluwMOk46UHOP6CttRsi/l5
	6+SOEPQTlii/PrJbE0IqbW/1c3tCR5e4qB0Qt9Tc65WoS0pgSPDer8rAMN9H4plbG+tpDOt1aQg
	yAbDvTXER4r0xYu0ezzjw0eYeWi5zZi5IsCcDYdR4WhAhRdgiXnJK/5wtNAwS07qKxGllTSGPU9
	wx+6ckBZRmZb07P/0dVu3gJeCP7tERvkM32h/0qzdaF70S+AkyoI/ojS5+ab6T+CD/+FNDSci9P
	LVCgwUTcz0aXEhhe7EbYFIPLPsXzM4MnuW45f0OYn0uyQ7W9XOJQ/nDOb4OQDfq7yqWsw5okuEz
	w/HdYGVHDisf9DsspRLbhFGx0jurwnIIjA3329KH0yr3lKebFwtoy2nT3JW9qqbsX4OyBonL0MV
	O+evYAyg==
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr28026545eec.6.1795790462348;
        Fri, 27 Nov 2026 06:41:02 -0800 (PST)
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr28026516eec.6.1795790461861;
        Fri, 27 Nov 2026 06:41:01 -0800 (PST)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm82970809eec.26.2026.11.27.06.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:41:01 -0800 (PST)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Subject: [PATCH v2 0/2] PCI: qcom: Add support for firmware-managed PCIe
 controller recovery
Date: Fri, 27 Nov 2026 20:10:48 +0530
Message-Id: <20261127-pcie-controller-reset-v2-0-17467b64f5f5@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHCWCWsC/4WNQQ6CMBBFr2JmbUlbtIAr72FYQB2kBijOFKIh3
 N2CB3Dzk5f8/98CjOSQ4XJYgHB27PwQQR8PYNtqeKBw98igpTZKKiNG61BYPwTyXYckCBmDyIs
 0x1NdWWkkxO1I2Lj3/nsrf8xT/UQbtrOt0ToOnj67eFZb759jVkKKs8qyIkuNbZS+eubkNVWd9
 X2fxIByXdcvt1kPoNMAAAA=
X-Change-ID: 20261016-pcie-controller-reset-8938e4bac060
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rama Krishna <rama.krishna@oss.qualcomm.com>,
        Nitesh Gupta <nitesh.gupta@oss.qualcomm.com>,
        Ayiluri Naga Rashmi <ayiluri.rashmi@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795790457; l=1308;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=SRZ1ZNlotCXW9YcejmmVtLhSxwznrrgBDa/mll2wXts=;
 b=HmTIIGhR2oznB39LmlcDi1JIhmJ6ElcnC8fA6ISPHTamLiYXPDzyXm5qGtwrPpEvR+BeppXdk
 hBZ8dFDvef9DGx/rE7zwoTvL68z2Q+sG9eMICouI/n7CThA0ASIk2bT
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX5H5YUloKcn0M
 gzhCIaj8WwOcFhddb6bcGMgty2Q6ope5PkHjS2K+ij0m4Crv7m2oG07uCXam5/s0EKgt3utUpyn
 O2U4AFHqq7NqtgAdbNazr40Yp+5GjNE=
X-Proofpoint-ORIG-GUID: HTlNud_1pUjMvayZC4wCylyXKz3jdZh4
X-Proofpoint-GUID: HTlNud_1pUjMvayZC4wCylyXKz3jdZh4
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09967f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Vo1K_PxMkAQpuwCxzZIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX5Eo2e5rlLokm
 8+PEu591+gsEsH0Ppc4Ho3CAY9zFDE6P+0wnZ4+Bu+gvAqxV5qn/Ub6hnvGK0ERD7ZtPdv2Fa6M
 D78u3u5FrS8lxQPtv95pAZ3EFb4sSVmayUnW88BfWCXiukIwOm07fBM16D0Z3PTx8568AQSLvFl
 16/VeTw7qIJtvLMS58OcLYDX4nsnCUdCucDxgb0LIQDNniYEDDvFxP66FmUMwPlvFt00v4CbNUw
 Ffv/LfnLYChJHp4XdVSQPGS7ByHiOq5k5kCXTy9C0zOfrqs+pPY+DzYfplGBbmFKEN9avD7CVXH
 ejYgb2oUNxdgAaaXrzHjkSZOjebUdeFdb2zMgLcnTXFxxDwb5GlQYAeoysH6FEHfGEhAUi0Ha3A
 BcfFvbPxtFbNsZrCA74g63ddtJqOY6UbWmCaB55CpbT7z+lKjQoipJ6LnKHZY1bQ44nit0htnky
 YADiepsaOMjNWXRWDyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270058

This series adds recovery support for firmware-managed Qualcomm PCIe
controllers.

For these controllers, firmware manages resources such as PHY, clocks,
resets and LTSSM through the power-domain framework.

Patch 1 adds Root Port reset support by power-cycling the controller
through Runtime PM, allowing firmware to reset and reinitialize the
hardware.

Patch 2 restores the DesignWare MSI configuration after resume, as MSI
register contents are lost across the controller power cycle.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
Changes in v2:
- Guard reset_root_port() registration with CONFIG_PM_SLEEP and mention
  the same in commit text too.
- Link to v1: https://patch.msgid.link/20261016-pcie-controller-reset-v1-0-51779736cf12@oss.qualcomm.com

---
Mrinmay Sarkar (2):
      PCI: qcom: Implement .reset_root_port() for firmware-managed controllers
      PCI: qcom: Reinitialize MSI on resume for firmware-managed controllers

 drivers/pci/controller/dwc/pcie-qcom.c | 42 +++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)
---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20261016-pcie-controller-reset-8938e4bac060

Best regards,
--  
Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>

