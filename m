Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A460548BD47
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808934; cv=none; b=Y5nOn9XK50VEi0oN85kw8gGtm7OfJWELAVSxgKW8Y0CdzUmstHViN3ljk4MD32STjnwcy4a/RU2oqjTRh+WN5cqXYCTVqPiC6vcniWl0Zsbegf7N7XABGgrgYfAMnsTJnoDh4Mu4QsbrK0qY0+QQqSzg6BApwQkYWG3DApg6nFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808934; c=relaxed/simple;
	bh=/z8npaoA6YiCb+grXm3QRXMvFdaWGWBDcYP3MmgE/n0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dgGnYBQpUQ01uRGnDHuSNXHSoLUheJzmskmpO/hy9vxrJUyrCT3kpf5l+YHJNv/KhTmep/rvsnCVmouO9Dkca6n4gwu2PCosV83k+DYN6hYNaRZkMInht8xNfz9U/KdNn4nF94CpOHuyd9i3mYRQfAMaGQD1985q2ycJnXywcm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0K1gG4U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsumpF8C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0K1gG4U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsumpF8C"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qWJt3648555
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+d6SdiBzSWqYtulPu39oG2ohASpxLlXWSLy
	0Wn3Fz/o=; b=g0K1gG4U0jtcmkP/RD3QMb8lKtm6Echjw6QWjJuzrF/KEmM+I0m
	vRj97PM3p2/NfFJ+OQZkFcZCNi6en9Hc0qYArd5JM9SgD4d2CxFJzv4yj8JslF6/
	nKU0u/p1H9sf7hkTve6aXocZGgNUxxKAfV9itTklVIpBsJqSZ/hVsA8EXMcStOEu
	Gtuz/bkH5ytFWpBfPLmZQyMFUESMUQR7h2eKZLIWTdy5Wc7mxAZGmehTK2wfGkYG
	klW688N21PnPHNm2lHdqJ1PQXB14BYJjUXGyIizpaB5X66uki3SFHe9dQEAgH4OG
	vDab8SSHrWiw00oTI13q3TgpvV/MeHa6vsw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7jxgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:15:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so1015087b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 05:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784808931; x=1785413731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+d6SdiBzSWqYtulPu39oG2ohASpxLlXWSLy0Wn3Fz/o=;
        b=VsumpF8CAQfAnpBqCxVOfFme+B0DlFT8LON/yfNWls+t6snohSyhl0KCok/VRdfjSN
         PaxNme051zKf114OnAkJQwtnRqWr0VbiwR54yZECzitTUg1EM9md3bL7+++xkjqqFPNa
         yKXQFmSY4QuawVSnZvTYyygD1ggEWwQ3phLS4iHj8cU3ccBEbRC4zGj+See+QtV/MKzH
         oCSpi4KqoAhuki/kATbVBOulxOpTci1PP22qOjJW6AWesnR/bHaKAfEl3H00b2fF+dJI
         uB1XPWVMRsGYtI3ahlfrZpJX90fr+PxOrpLL67TfaUsNzfP9iPV/o6CCpKhfuoLRG/iA
         C/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808931; x=1785413731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+d6SdiBzSWqYtulPu39oG2ohASpxLlXWSLy0Wn3Fz/o=;
        b=oTrJBdfjWNO2TcgHljCcQZgm0r5mS7xHHQ1S2RLHdvvjJAuCOlsJYuTkMeoDSCW1Kw
         N9jWV97Er+yIgtaNLe0P0ZC3paUdGRmykwigQWKGYrFA4swy4+HCpt4u34W1TnMytrcG
         AHMRSOK1Rua7HLRoK87HNvUFgNjAqtsUEnw1c3eN8ITvHFBqv7L4TkGAOMFfzg6Xq2hC
         6ZJg28r9K4DQexTNhYMkAZBl6R3/BJ/L9u2TPq+arGTzMIaZ7CEeQARuP62TAmu/YQxZ
         E9PNB0aX0zEDC5+7+D+I6ZfLT/8uzMrL5iYX/qLvd6rprvrWOcsg8oEUXKHlTNS9dgF8
         iLFw==
X-Gm-Message-State: AOJu0YzCXWBcU+t6HpM0/OVDQkZHXI+MPN1UIQLKyz3sglFDB4fj0V9E
	xaQowDeQ7yNUexYJyvbUugXs0yje3IYrSpWl9xSTFuPXok2PD9WbZ8fu7TxfMpKLVwsWlQiFIfM
	7/Bc2WFtRMXvYrnu67xy4klKDx2IWWHL6glCjgTYkkIuPaKEhUB5GdgCQ/htwod83GVrX
X-Gm-Gg: AR+sD10G9tR2l8UBhtK6TxZgDjaduxqgDW7Xz8kLAMv8vfXMP4btgcP61xRx9DKK3IU
	KpKYF62HxrQKm7UJm63cxYYC2srdfpWWlu94qQq905vwHw0BXw7PNuI+KA/VXfMVcLd1z5pLZ3W
	kz7teCB04UlU1IEsq4I0IHlgU3pr43tEPqxjcnN74tvXrdsliOn8GCS8b1Iiq1SNVHkT46iIJNh
	6VFJWfDZnktS+X8aPQ7GpLfuW6IKPg/OXSJEgQOmcxMeU/TKj7F9cLj6pbMVA4slLHp8x0r4BrH
	HYS44CPJgPDMJ6v0PmDG6/IdxGvXF/xqOTKoqXyQlAxxvBzoEqWu7drC8gqNBL+jWJGoUgYy4HO
	eemmTP6QWAgSTPS9/c7Jq9YOH6BZvPg==
X-Received: by 2002:a05:6a00:1913:b0:847:8b1d:230d with SMTP id d2e1a72fcca58-84e2b7e5dcfmr3345419b3a.3.1784808930493;
        Thu, 23 Jul 2026 05:15:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:1913:b0:847:8b1d:230d with SMTP id d2e1a72fcca58-84e2b7e5dcfmr3345342b3a.3.1784808929740;
        Thu, 23 Jul 2026 05:15:29 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a1fsm2687005a12.26.2026.07.23.05.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:15:29 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v3 0/2] arm64: dts: qcom: eliza: Add audio support
Date: Thu, 23 Jul 2026 17:45:14 +0530
Message-Id: <20260723121516.2341900-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QlgsvNzelJUsYqIW62wtKfOB4SFinbX1
X-Proofpoint-ORIG-GUID: QlgsvNzelJUsYqIW62wtKfOB4SFinbX1
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a6205e3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xOjjz3j2L1Nf2p3RO_AA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyMCBTYWx0ZWRfX+5VM3pIsDtNO
 WmeYVwcj/y1UrwxEjz+h8r0MQ7MKpWH7n59ydLfItbJdyS1kshh/fXk7Bh+PSnEp5FhhQdRSeM2
 UEc9j5zPmTWlQypYM4V5jmBSSd63DRQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyMCBTYWx0ZWRfX4AIcvDe34kMI
 MkiMu/WWEd1Pvw4p34or8cBlQxyp6o+/9PuhV0l809ni40g3nfb3zQoLm9s4M44PfyR1awGy4Ge
 s3UPwi2d0QKgUhEOI/rWi3nNdDjcesKhuFhPuCNf/whuFyDBsHvl2xSUzHN7fkDcDNpniZOfD1P
 DTrCNAr/Y8GL/6Q6GhvWQrTQjI88hecKzEvkOG2WXPBAA0HbHilcD3URGEYNi1gYkmT35dEbF0n
 of2Nqe55DGlYvb7agKA5aUibhk8mrcn931F15iGFvm/3WRkvwhHcPq4UKiZzLnz0V5IcT4/TdT4
 a4ZvD9p/ukq8Hc3ejJF30pFQq0ZAVRbrjrZfhBQo6z4ZacqKAmsVpdlMM9HDPpfHo8m0ywT3QWA
 ptxuE0931hyOZre+1rwg6bRVXwFae0DhGXe9WsjG+HQ18fxSRKvGsxmsjRcwTkW6eKc9dHYII2q
 qlJVIXIuepu1kRUl1Jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230120

Add audio support for the Qualcomm Eliza SoC and CQS EVK board.

Patch 1 adds SoC-level LPASS WSA macro, VA macro, SoundWire controller
and LPASS LPI pin controller nodes to eliza.dtsi, along with DMIC and
WSA SoundWire pinctrl states. The macro and SoundWire nodes are kept
disabled so board DTS files can selectively enable and configure them.

Patch 2 enables the sound card on the Eliza CQS EVK platform, including
the WSA8845 external speaker path and DMIC capture via VA macro, along
with the required LPASS macro and SoundWire configurations.

Build Dependency:
This series depends on the following patch which must be applied first,
as it introduces the q6prmcc clock controller node referenced by the
LPASS macro nodes added here:
arm64: dts: qcom: eliza: Describe the ADSP GPR node
https://lore.kernel.org/all/20260716-dts-qcom-eliza-add-gpr-v2-1-9646c57fa513@oss.qualcomm.com/ - Reviewed

Changes in v3 (suggested by Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>):
- Added missing blank line before lpass_lpiaon_noc node in eliza.dtsi
- Fixed codec/cpu sub-node ordering in va-dai-link and wsa-dai-link
- Reordered &label references alphabetically in eliza-cqs-evk.dts
- Removed regulator-boot-on from dmic_eldo fixed regulator
- Removed output-low from spkr_1_sd_n_active and spkr_2_sd_n_active TLMM pinconf states
- Link to v2: https://lore.kernel.org/all/20260713121816.2728888-1-ravi.hothi@oss.qualcomm.com/

Changes in v2:
- Fix node ordering in eliza.dtsi, lpass_wsamacro and swr0 nodes must
  come before lpass_lpiaon_noc to maintain ascending address order
  (Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>)
- Replace gpio-hog with gpio property in regulator-fixed node so the
  regulator core controls PM7550 GPIO8 directly
  (Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>)
- Move status = "okay" to last property in all override nodes
  (Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>)
- Link to v1: https://lore.kernel.org/all/20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com/

Ravi Hothi (2):
  arm64: dts: qcom: eliza: Add LPASS macro and SoundWire support
  arm64: dts: qcom: eliza-cqs-evk: Enable sound card support with
    WSA8845 and DMIC

 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 147 ++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi        | 193 +++++++++++++++++++++
 2 files changed, 340 insertions(+)


base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
prerequisite-patch-id: 84282f8a368672c3f0f8944c442c71713cfd7390
-- 
2.34.1

