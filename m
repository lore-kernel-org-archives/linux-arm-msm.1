Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C09535B65D
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478493; cv=none; b=ROY1ZYAfsoggIspvcc02czLlqVYc5443Z+zAWrxRWFLI2nIWuP8M3PNlPg++s6FCsfbd9fKtJJV+IbQmAU+RSvQ/IubFEyQ4fDcshYM1eC8JdpPqT3NtAcMZnDMD1R4HyWE4VIoRk1xbQhpOTzSeDzj4kJG2NNA3HfirJlnnII4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478493; c=relaxed/simple;
	bh=CH0nrzzERZiKDAaxkdwSWsyBt/iEhMwlQeoAjP5LHqE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V1v6EQJgRrsN6mwBi5XkNGdCG8q06+PxWlp5fSj6+kA5NYq5fcj7g6omf0lqKWWogzvntKgRv5wyr7BKloYtdhoYdgUbI5NPlt9NxnXdqWAE4qP3+HdKvlhK7XlGuTjJvpzVHpDIammfkum+CXsMEK9S9ZdI8sWakCOi3LImSI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uwfpl3sl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F46c2lGH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uwfpl3sl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F46c2lGH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V67Fwd2960557
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L48ZRC/JcC83vrGc37PNdb
	dpkgF83Vs9H4pRoZkzLxA=; b=Uwfpl3slqrn6x1DQAx7fHG9YqxOF/d+pmKjNQN
	VIGm3o5/FzvZtsYMJQVK3eYYVk8LWeGLqD2LjtG7Eil+DaZ/KjyPIEyXXrkd22lW
	lqGsj8Df7NHk4dlsI9pIW+M+2/zTYHrcg0i37MBF5HB68wMJaLItwb/LlDB1UWRb
	o2Mevud5wdeiGeDGfCn396sDwt0cvLofTlHYqw+oV9bZ8166Fusm0wvmsSHWZkUr
	OGTMSe+js81iMC5gltoBY/htYHQEiyz+CCb2ZkjwR0o/jWYiP/gNxZUtovgRBJL8
	/sYRU14j8Pu7d81nDQuE7IhtyNs0I8bfCr2/oteWDUcnuwrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp5kg0ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:14:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc6dd43737so13627795ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478491; x=1786083291; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L48ZRC/JcC83vrGc37PNdbdpkgF83Vs9H4pRoZkzLxA=;
        b=F46c2lGHjIuATlPFHbSjVwGqdUIv46w1g3yN3nQRF5nv96CIoMPqM1K1rI2AmRbtp+
         jkrn0Cnh63gPZGPftokngc2wNUM6BkhLdadmgiE+cgs+n/bUUGt0zDpxxYPeKrL83bK6
         6y/gEBeFk56WmkuusbFyK2xCW4XgWTUp4HAiv32IwDGPlh+NhvqBcs+B633JoxPDYxxi
         4Cm/Ehp8drkBq9LwWxhA/nmuf201hDPukvlrPey102D1IS9LgrY59E8VA1sZ/Qsq+Nfp
         8AB4MD6DGZn69Etq8M5HKDaTTt+y9XupWOj9XZ9BBocnP4nD8XBYg7sogz28FZ93LJ66
         DvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478491; x=1786083291;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L48ZRC/JcC83vrGc37PNdbdpkgF83Vs9H4pRoZkzLxA=;
        b=rwqQ4wYEROJ8Oe+p0ID+LUEv590sNuUcq0F81Q/6YlaZH3rijyUS49MYzt0KJknyzo
         XkqqZGffzDERbzBjQNRFetZesgDIP6xwb1idL2da0N3ezWUkNY40i5tCH+qUEoWAZbJO
         LYtSNYTvIzLiiVRzTZQkYRgy9Tn7Gn3D5ij+OWVC81stxy4Ufjfzyo0Df2+4mCKtODTO
         mzm8SaZsUZaBbS5p+X04n4ypYn1AKMhJ60vIpsJNW3L/EBLBepgpxSGhk8cdawjxCbz7
         PYa00iEhtQgZe+sW5yDypSMgxZ5fJTfWKiwdxYt5DYpOEGxRUy30Css+jMOZHpsuEs4T
         rAiw==
X-Forwarded-Encrypted: i=1; AHgh+RrWTUXx2CBE9w/MXD0sNSeqYBPbhFzQZ66Pqh1nzpvD7yqwCsU1yYMMPmTcShpI+V+a6tCzI1N3TEVKAdIg@vger.kernel.org
X-Gm-Message-State: AOJu0YwqpzbXFuSbpsSepoVKQjNfyT55F2gJSJLjDDop89wvFbLt3z1F
	TcF9pxZxiZbOd96QLCQhmDzkY584V+rn8ooyXTQvmm1MJsYI6GEFh/8xIMGVjrA2GvpuHFJY66A
	i01dX5dhV2ik/LDva1sDYEx59CmBgidAKAAymSuYrKxOzXBLTuM+YPu7gC+mkpp/cbNqR
X-Gm-Gg: AR+sD11eAWZSZvqpDvopiQznOQdzug87OpwmsdybDDlYH5QvbHjMOqlWJcNpUTSLsoW
	Txs8GrDv/BxOUI9TxutIbv9Xw6deRc6OuSs6VZgjYuPKV/atXWJIrOMrB9eMWQwLplGhmn4EkA9
	iFs7JyDAcNbnxp1DEMmWs1RIkWMc1vQOQJ1BPMMQM3fqzaLJWP6PgicbXKkxL378w/DDhkdF3ee
	buWcsUhAhgxIvGso+tlv5jedcBkOadnsSluD15ltqX6a7Ka57blxX0GZDl/7nmNZCkL7RTODQlP
	SSd4U58fvyYMsYclqLzgvcT9Ofdi+zmo/rXUEPjqMoqupO4Fk/OINCGa8IAbOzuo1w8xxFy2K/F
	ovlc12tC4uzPjv1sDW/+MrTGAI6AgoMHf/TZU4OES/Gz2oNsG2puBKC3e/4FmWs75
X-Received: by 2002:a17:903:2443:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2d046dc5fb1mr8724885ad.20.1785478490712;
        Thu, 30 Jul 2026 23:14:50 -0700 (PDT)
X-Received: by 2002:a17:903:2443:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2d046dc5fb1mr8724615ad.20.1785478490292;
        Thu, 30 Jul 2026 23:14:50 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15d26esm719635ad.76.2026.07.30.23.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:14:49 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v4 0/5] arm64: dts: qcom: Add Kalambo SoC and CRD
Date: Thu, 30 Jul 2026 23:14:36 -0700
Message-Id: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEw9bGoC/3XMywrCMBCF4VcpWZuSTO+ufA9xMbnUBttGEy1K6
 bubFoRidTPwD5xvJF47oz3ZRyNxejDe2D5EuouIbLA/a2pUaAIMclbwjIqUXrDFTlgqnaJlXnF
 AlgihgITR1enaPBfweArdGH+37rX4A5+/H6r8pgZOGUXO8kpkCEVWHKz38e2BrbRdF4dDZnGAl
 QKwUSAoCagUlZIcZfVHSdZKsVGSoEAGJatRai31D2WapjfO/2E2PwEAAA==
X-Change-ID: 20260715-b4-kalambo-crd-86912a03bbd2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785478489; l=2222;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=CH0nrzzERZiKDAaxkdwSWsyBt/iEhMwlQeoAjP5LHqE=;
 b=g1q5/1a0Qd5Q5sW1jW9w6fo5tlfl86NWmtpSmWiqm0XhjvEvvKneddmiXr9lzPv4qHRNUbwBd
 RttvEU0lQm4C99LZWWMaPsFd51ofeXDjYNi3Ptk9DKrTateooLjPToR
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfXw4ABxzIib+IW
 FkuruaN88UdvAxKiIllNW/X0IHfWblgXYlNG50VnDTKHahpuNw1xfTg/2hSqfnuik7p8AIa0KXS
 8q04Cf9tZWPyANcqKoEWzClKdme4BgQ=
X-Proofpoint-GUID: nOO550FN2pW-55xVFjmSdjeF6MIjSBj5
X-Proofpoint-ORIG-GUID: nOO550FN2pW-55xVFjmSdjeF6MIjSBj5
X-Authority-Analysis: v=2.4 cv=c/Obhx9l c=1 sm=1 tr=0 ts=6a6c3d5b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=lMHH7xqUNCQZAqxxBscA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX9L0Nb7ZrBzWX
 vS/JOkbM0Bc1deef9FFzUec0Azpa5XlYn33Dh5DxNLGZ0xzi1yS3O2ixZ+DFFLmkWtE91vVORTO
 7MdPlH5SweOsVZZ1PBIFaY2uTP7MLLkj7emNNme4vK2/2A7ACepABwkYU8+aBPAJQO8bwl7IHA1
 rKiHp3AlAQnn98x+BeAmUlzL+pctZxKbpnDgA59soXUhAr8KtZA3ra8yMglWbOmhjLaUKAnLS4v
 7Z3GQGbNKJ4jUCddN0oAedxBp9UrAs/aYN0SKfzwdVyUvj7llRhpwpwFJbWRD6uQgYIT0UQ5Sjs
 +aF5ZsQqVIwdUi8kunw0UiE8j+5ytjRul7ffE8hOyRxuc+XdO/B8O7yA9sbj0CVp5EzpIzch71D
 JedQZbpkGWln4KIaH0Vk2UK79vdEuxHGBey8PYV3v5udd+vRDQbim6SSex8bsDAE1cp//UuKod0
 nrmRGskRuDOk2/6uIRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310040

Qualcomm Kalambo SoC is derived from Mahua SoC with CPU cluster 0
removed,leaving only cluster 1 present.

This series documents the board compatibles and adds the SoC and
Compute Reference Device (CRD) device trees. It also adds the Kalambo
compatible to the UBWC configuration table and allowlists the Kalambo
CRD for QSEECOM to enable access to efivars.

---
Changes in v4:
- Split PDC range <108 619 22> into <108 619 1> and <111 622 19> to skip
  unconnected pins 109 and 110 on Kalambo. All other PDC ranges match Glymur.
- Rebased on next-20260729.
- Link to v3: https://patch.msgid.link/20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com

Changes in v3:
- Delete and redefine the whole cpu-map via the /cpus label.
- pdp0_mbox: one reg entry per line and use '0x0' instead of '0'.
- Rebased on next-20260726.
- Picked up R-b tags.
- Link to v2: https://patch.msgid.link/20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com

Changes in v2:
- Fix the cpu-map and SCMI perf domain for the single cluster.
- Give the SCP shared-memory window its own IMEM section.
- Rebased on next-20260721.
- Picked up R-b tags.
- Link to v1: https://patch.msgid.link/20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com

---
Gopikrishna Garmidi (5):
      dt-bindings: arm: qcom: Document Kalambo SoC and board
      arm64: dts: qcom: Add Kalambo SoC
      arm64: dts: qcom: Add Kalambo CRD
      firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
      soc: qcom: ubwc: Add Kalambo UBWC config

 Documentation/devicetree/bindings/arm/qcom.yaml |   5 ++
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi            |   4 +-
 arch/arm64/boot/dts/qcom/kalambo-crd.dts        |  21 +++++
 arch/arm64/boot/dts/qcom/kalambo.dtsi           | 112 ++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                |   1 +
 drivers/soc/qcom/ubwc_config.c                  |   1 +
 7 files changed, 143 insertions(+), 2 deletions(-)
---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260715-b4-kalambo-crd-86912a03bbd2

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

