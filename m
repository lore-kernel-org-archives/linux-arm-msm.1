Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F252F529409
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 15:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867490; cv=none; b=ZtZL+J6CsEsqHV/8LBjLdxKzoXmWFSWVjJT3ZkqDK6qNiCvF6BDrtG/mhAHYD9v9G7rQSoCHxIIT16OnkQ6TWVouzEqpRBZbTY4abpsiylNThwFPq57Swvlw7VQsIjZhhQFlCtlBXCMnLJGDEyISZ6AkAHllhry0OtMa2YcvezE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867490; c=relaxed/simple;
	bh=xiztuzjHnjVqr0P8nXs88Vl/dFPvDCKaXuSdyIBPMts=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S0y7ogT9z8Ka1PWYIamwlCsiaYqXCzzLvnQsxqpFFHp6je5zJgKlN9/71Bd/XVlF4gWMRrmhB5rhxqF+z87exxns2FvjNGrbJ3L0lY2UZ5/Iiht0AwJl4JU5MQ3JN7IErl59Rr+fa+ObL8iAUNFNdlf69+2BOCKY5GVQaztUl+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZdZu6aI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W1eYLo95; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZdZu6aI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W1eYLo95"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Dj4n02188546
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 15:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7f7wIwoCtHOFJIXP0tbYQT
	JVhXZnDgQa0hYQGjNo+Go=; b=iZdZu6aIflrn3N0VAx2XILSIcN7bnCkK9D9vOk
	Cez0c2HOHx0LHsCROpZd2SxT169ejqEH3xADhmNS144LmK+kz7DroA3AzsgI18py
	0rZaFbXL/2AxqEoBzj+WhNjx6Mg7uEqdRN+xbSCJuGKBeNvV89q8wNnehkYYvEuc
	BkHYCljQMXHEo9AxtulykztidgTogNYvSvbM32Q3D+7+EJGvz6eV/2qE/DAkNaSx
	+nk7a6Itz7jCARZaRGmQK+IhtzPWiMMAh1rUnswGPqHOVGIZJ8O7r3C5WhyA/QlM
	ziSHVeDgqQxU+QsqlF04+biQvH3Ur+EqYwfpry6eUDIij26A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjcnkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 15:11:27 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1438719cc1eso7885743c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867487; x=1791472287; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7f7wIwoCtHOFJIXP0tbYQTJVhXZnDgQa0hYQGjNo+Go=;
        b=W1eYLo95LPXHHndHyvG14WDmI9KYDK9CXAJ61mHGjavBY7BtLmZg7KNFVSo4D3/Asb
         1oedATy0PHbAaZbAw9DsrWbpeIP5p4YIKbx+QVvw1XHwvNKCNPSD1nL8UF+AjMHUZq9T
         pXv68mEXIdX9qgC/Lg1ESjWBJv4Kq3ozsoAGSsvBKmo1J5fCsx4TIu6U5kopothsEqFN
         5gajA8eB/OwDEKfPfLOKAazhDLAnQfoYfvl/6wNi4Vkaz93cPmf8Y8nZUe6p2TgyZwGO
         2Sw0OQxuX7MROp0+e481K1DdTtqN/Osv0V/lGdr1UZil6y9H9RRULQEVCqZmAcnlBcFp
         NsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867487; x=1791472287;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7f7wIwoCtHOFJIXP0tbYQTJVhXZnDgQa0hYQGjNo+Go=;
        b=HlRmKPlXkwK2P5DAAezt0eZdeU3Et2pt028pcoKJgoO5z5d3omKBQWVwTBdkmo/Dd6
         21hKTBVvMhhSROv5DZK2RDsIN7F8uZZe/pP1dM+mf/knA5nBHHfENSGusKSxnJljMDMG
         b2pXUvn7AdPRMPdEPOaM49M0EM59zQD1mPDhw9MuraljGRKykZVkKZ90cB71kA9ato+l
         lM8E/AnROcQz2hv1aXybPefGjVstBvCDPW33kqXwfjL4oBfGgzAL/h7w42ItZB5RSBMg
         XYGLF2ftAFpMHSa8C40MCiZVMx48amhRUFGOgRmtc1Dod6uYReifJW1sNfFLCsCK0VSi
         vDJg==
X-Forwarded-Encrypted: i=1; AKwUvBxvT0Hf6FpBD7mH83jhvLNFEQKUgW42tAdw6Lbnbk0z5TEPvlOep9cBqQ0RCeRxmK6MytynH/BqtZthTBAU@vger.kernel.org
X-Gm-Message-State: AFuF++kIucMpb63BRxBf+GWEIpW+Luozqe0ktfd/A9N9HBKymGJ5mRrb
	clM7xTrHV8B7LMR+2T2cST95TjZPyDwhuWQLPOUrNRmQaaPNpnA4QMNFOkF2B9uotRYrUbMajq8
	hLw5HisSY4+A/LrIKLk9mRz74B4m3A92tkw4yjJaBHCMT9MsRM85Sg/shB9zofEHcTwQn
X-Gm-Gg: AYBFou05CfRuKthOUdjRpm9+vhvjBODwLeRRLQ88UfRYS6qtgHHDhhSgsfcxn/+KD7u
	g4uoeW+NcO4QgO3ofW/FR3h8Rhq8ua47+1hvJNOqvQNlSMXxP7qCS/fYmDDVYb0FmCPOz69JCSI
	e48aHYYoYBeNVWrlpprTg551fXUJ/HgthWODrWBY1K4JlGGyEujLVYcgAU5Jm88eoaPn1QMeOgF
	iA0M/cJgYlEimEX5LgbJUnsKkrz+3KxwzAHqEc0X7cWO6WrYl5DxaFwUyOMFuF4q+ZAGIdZFwcR
	z9fSPEv1s+qF3FAA8I5tlhFqNO3mJr1DELYsHGbbovLGH8CSHGB841cPjNMFwBhFo0TZdwuqPXu
	eJI4xogZqAQGjjBEKBUEqf6fdkuIW3rXqQzdNhrvTROBU1ylCBva7TM7ewds2gdruVvPkx2SSYn
	sAN4ox6gotYxxKcUSAexTR+X3k8KRUdya6cA==
X-Received: by 2002:a05:701b:2906:b0:143:298c:924e with SMTP id a92af1059eb24-14d359570f3mr4473723c88.45.1790867487071;
        Thu, 01 Oct 2026 08:11:27 -0700 (PDT)
X-Received: by 2002:a05:701b:2906:b0:143:298c:924e with SMTP id a92af1059eb24-14d359570f3mr4473700c88.45.1790867486442;
        Thu, 01 Oct 2026 08:11:26 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f265d307fsm56159c88.3.2026.10.01.08.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:11:26 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/5] Add support for reporting boot status on Qualcomm
 IPQ9574 and IPQ5332
Date: Thu, 01 Oct 2026 20:41:10 +0530
Message-Id: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA54vmoC/yXMQQqDMBCF4avIrA1oIEK8ioiM6VhHMMpMWgri3
 Y129fgW7z9ASZgU2uIAoS8rbzGjLgsIM8Y3GX5lg61sU3nrDa+0DkKaUFJe1C2a2gU3ejd5dAj
 5uQtN/HuqXf+3fsaFQrpTcJ4XRnm3THcAAAA=
X-Change-ID: 20260929-imem_restart_reason-15c5b95f9a5a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe781f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BUjP7g0EBgjMYpCN6FUA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: ifHfH-rKFxC8FpIpybEuB2KFLKjtoIXl
X-Proofpoint-ORIG-GUID: ifHfH-rKFxC8FpIpybEuB2KFLKjtoIXl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX+ii7IYFd3YN/
 vjL3P1nkEIo8SCjyzO4A145bXPFEmXUtDAIVd8Ori0IgHRE/uzTUopvBdTuTsaYd70eIA47DsNs
 7u+PQADg/dmbxEvPblABxW5XjFk7lmU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfXxXtQU2+Owg1E
 pm+SzYL92icp3kRN6lAzdTunEoeDXh9ha0+F9rS7auLBLi1DeiulXPC3i7yw7w/uOgeFQrV6jx/
 pcuAH1cGGDefFlzF4QNhMbRFRXhmRdyXBUgFnzeX/HezwBSgmo8ITXAzqSSGJiXN1P7s3wI5DZV
 s/zMzxUW4NJH68F61TMLvSFM/zPYHo67siaOTA3CuFCzd5LD/i2fXmWUEghzuIKP1C3GFUpnADt
 Q96t1/56K+RddDlM16IFUkQTAucqR0KZzxrdxWEW3ApKix6tfBJHo9afnhHaH4zX0Hx91NDdk8N
 jANpkn3zcL7/edN83jQSEh5g/zZbtSamo0MleAJk3ln732Cu4K/DWxQhg2kEify6D5L6s+JYazn
 X4MUmYFvDaxDsiZvOn0OJlxOx7ItadPASe+Zr8lA5LTmfVE3RDDpM5nnyzfr7LiaQMB6el60xCg
 yUCBzQCFQS2Z/3Oysew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

Similar to IPQ5424, add the IMEM node and the restart-reason child node
on IPQ9574 and IPQ5332 to enable reporting of watchdog boot status.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (5):
      dt-bindings: sram: Document IMEM found in Qualcomm's IPQ9574 and IPQ5332
      arm64: dts: qcom: ipq9574: add the IMEM node
      arm64: dts: qcom: ipq5332: add the IMEM node
      arm64: dts: qcom: ipq9574: add support to get watchdog bootstatus from IMEM
      arm64: dts: qcom: ipq5332: add support to get watchdog bootstatus from IMEM

 Documentation/devicetree/bindings/sram/sram.yaml |  2 ++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi            | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 16 ++++++++++++++++
 3 files changed, 34 insertions(+)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260929-imem_restart_reason-15c5b95f9a5a

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

